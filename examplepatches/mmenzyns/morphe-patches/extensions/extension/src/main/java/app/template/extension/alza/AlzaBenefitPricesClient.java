package app.template.extension.alza;

import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.util.LruCache;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;
import java.util.zip.GZIPInputStream;

/**
 * Network client for fetching and caching Alza Benefit Prices across tiers.
 */
public class AlzaBenefitPricesClient {
    private static final String TAG = "MorpheBenefitPrices";
    private static final String BASE_URL = "https://webapi.alza.cz/api/commodity/v1/";
    private static final long CACHE_TTL_MS = 5 * 60 * 1000L; // 5 minutes TTL

    private static volatile AlzaBenefitPricesClient sInstance;

    private final ExecutorService executor = Executors.newFixedThreadPool(4);
    private final Handler mainHandler = new Handler(Looper.getMainLooper());

    private static class CacheEntry {
        final BenefitPriceData data;
        final long timestamp;

        CacheEntry(BenefitPriceData data) {
            this.data = data;
            this.timestamp = System.currentTimeMillis();
        }

        boolean isExpired() {
            return (System.currentTimeMillis() - timestamp) > CACHE_TTL_MS;
        }
    }

    private final LruCache<String, CacheEntry> cache = new LruCache<>(50);
    private final Map<String, List<Callback>> pendingRequests = new ConcurrentHashMap<>();

    public interface Callback {
        void onSuccess(BenefitPriceData data);
        void onError(Throwable throwable);
    }

    public static AlzaBenefitPricesClient getInstance() {
        if (sInstance == null) {
            synchronized (AlzaBenefitPricesClient.class) {
                if (sInstance == null) {
                    sInstance = new AlzaBenefitPricesClient();
                }
            }
        }
        return sInstance;
    }

    private AlzaBenefitPricesClient() {}

    /**
     * Fetches benefit prices for a product, using smart batching and LRU caching.
     */
    public void fetchBenefitPrices(final String commodityId, final String country, final Callback callback) {
        if (commodityId == null || commodityId.trim().isEmpty() || commodityId.equals("0")) {
            if (callback != null) {
                callback.onError(new IllegalArgumentException("Invalid commodityId"));
            }
            return;
        }

        final String activeCountry = (country != null && !country.isEmpty()) ? country.toUpperCase() : "CZ";
        final String cacheKey = activeCountry + ":" + commodityId;

        // Check memory cache
        synchronized (cache) {
            CacheEntry entry = cache.get(cacheKey);
            if (entry != null && !entry.isExpired()) {
                final BenefitPriceData cachedData = entry.data;
                // Recompute with current user toggles
                cachedData.recompute(
                        AlzaPriceChartInjector.isAlzaPlusPromosEnabled(),
                        AlzaPriceChartInjector.isCashbackPromosEnabled(),
                        AlzaPriceChartInjector.isTradeInPromosEnabled()
                );
                if (callback != null) {
                    mainHandler.post(new Runnable() {
                        @Override
                        public void run() {
                            callback.onSuccess(cachedData);
                        }
                    });
                }
                return;
            }
        }

        // Deduplicate in-flight requests
        boolean shouldStart = false;
        synchronized (pendingRequests) {
            List<Callback> list = pendingRequests.get(cacheKey);
            if (list == null) {
                list = new ArrayList<>();
                pendingRequests.put(cacheKey, list);
                shouldStart = true;
            }
            if (callback != null) {
                list.add(callback);
            }
        }

        if (!shouldStart) {
            return;
        }

        executor.execute(new Runnable() {
            @Override
            public void run() {
                try {
                    String currency = "SK".equalsIgnoreCase(activeCountry) ? "€" : "Kč";
                    final BenefitPriceData data = new BenefitPriceData(commodityId, activeCountry, currency);

                    final Map<BenefitPriceData.TierType, BenefitPriceData.TierResult> results = new ConcurrentHashMap<>();

                    // Stage 1: Load Gold, Basic, ISIC, B2B in parallel
                    final BenefitPriceData.TierType[] stage1Tiers = new BenefitPriceData.TierType[]{
                            BenefitPriceData.TierType.GOLD,
                            BenefitPriceData.TierType.BASIC,
                            BenefitPriceData.TierType.ISIC,
                            BenefitPriceData.TierType.B2B
                    };

                    final CountDownLatch latch1 = new CountDownLatch(stage1Tiers.length);
                    for (final BenefitPriceData.TierType tier : stage1Tiers) {
                        executor.execute(new Runnable() {
                            @Override
                            public void run() {
                                try {
                                    BenefitPriceData.TierResult res = fetchSingleTier(commodityId, activeCountry, tier);
                                    if (res != null) {
                                        results.put(tier, res);
                                    }
                                } catch (Throwable t) {
                                    Log.w(TAG, "Error fetching tier " + tier.name() + " for " + commodityId + ": " + t.getMessage());
                                } finally {
                                    latch1.countDown();
                                }
                            }
                        });
                    }

                    try {
                        latch1.await(6, TimeUnit.SECONDS);
                    } catch (InterruptedException ignored) {}

                    BenefitPriceData.TierResult gold = results.get(BenefitPriceData.TierType.GOLD);
                    BenefitPriceData.TierResult basic = results.get(BenefitPriceData.TierType.BASIC);

                    boolean matchingGoldBasic = false;
                    if (gold != null && basic != null) {
                        boolean priceMatch = Math.abs(gold.mainAmount - basic.mainAmount) < 0.01;
                        boolean typeMatch = (gold.priceType == basic.priceType);
                        boolean compareMatch = Objects.equals(gold.comparePriceString, basic.comparePriceString);
                        boolean promoMatch = isPromoListEquivalent(gold.promoPrices, basic.promoPrices);
                        matchingGoldBasic = priceMatch && typeMatch && compareMatch && promoMatch;
                    }

                    // Stage 2: Silver & Bronze (infer or fetch)
                    if (matchingGoldBasic && gold != null) {
                        Log.i(TAG, "fetchBenefitPrices: Gold and Basic match for " + commodityId + " -> inferring Silver and Bronze");
                        results.put(BenefitPriceData.TierType.SILVER, gold.copyForTier(BenefitPriceData.TierType.SILVER, "inferred"));
                        results.put(BenefitPriceData.TierType.BRONZE, gold.copyForTier(BenefitPriceData.TierType.BRONZE, "inferred"));
                    } else {
                        final BenefitPriceData.TierType[] stage2Tiers = new BenefitPriceData.TierType[]{
                                BenefitPriceData.TierType.SILVER,
                                BenefitPriceData.TierType.BRONZE
                        };
                        final CountDownLatch latch2 = new CountDownLatch(stage2Tiers.length);
                        for (final BenefitPriceData.TierType tier : stage2Tiers) {
                            executor.execute(new Runnable() {
                                @Override
                                public void run() {
                                    try {
                                        BenefitPriceData.TierResult res = fetchSingleTier(commodityId, activeCountry, tier);
                                        if (res != null) {
                                            results.put(tier, res);
                                        }
                                    } catch (Throwable t) {
                                        Log.w(TAG, "Error fetching tier " + tier.name() + ": " + t.getMessage());
                                    } finally {
                                        latch2.countDown();
                                    }
                                }
                            });
                        }
                        try {
                            latch2.await(5, TimeUnit.SECONDS);
                        } catch (InterruptedException ignored) {}
                    }

                    for (BenefitPriceData.TierType t : BenefitPriceData.TierType.values()) {
                        BenefitPriceData.TierResult r = results.get(t);
                        if (r != null) {
                            data.addTierResult(r);
                        }
                    }

                    data.recompute(
                            AlzaPriceChartInjector.isAlzaPlusPromosEnabled(),
                            AlzaPriceChartInjector.isCashbackPromosEnabled(),
                            AlzaPriceChartInjector.isTradeInPromosEnabled()
                    );

                    // Cache result
                    synchronized (cache) {
                        cache.put(cacheKey, new CacheEntry(data));
                    }

                    notifySuccess(cacheKey, data);

                } catch (final Throwable t) {
                    Log.e(TAG, "fetchBenefitPrices error for " + commodityId + ": " + t.getMessage(), t);
                    notifyError(cacheKey, t);
                }
            }
        });
    }

    private static boolean isPromoListEquivalent(List<BenefitPriceData.PromoItem> l1, List<BenefitPriceData.PromoItem> l2) {
        if (l1 == null && l2 == null) return true;
        if (l1 == null || l2 == null) return false;
        if (l1.size() != l2.size()) return false;
        for (int i = 0; i < l1.size(); i++) {
            BenefitPriceData.PromoItem p1 = l1.get(i);
            BenefitPriceData.PromoItem p2 = l2.get(i);
            if (p1.priceType != p2.priceType) return false;
            if (Math.abs(p1.amount - p2.amount) >= 0.01) return false;
            if (!Objects.equals(p1.discountCouponCode, p2.discountCouponCode)) return false;
        }
        return true;
    }

    private BenefitPriceData.TierResult fetchSingleTier(String commodityId, String country, BenefitPriceData.TierType tier) throws Exception {
        String urlStr = BASE_URL + commodityId + "/detailPriceInfoV3?country=" + country + "&pgrik=" + tier.pgrik + "&ucik=null";
        URL url = new URL(urlStr);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("User-Agent", "cz.alza.eshop/2026.21.0 (Android)");
        conn.setRequestProperty("Accept", "application/json");
        conn.setRequestProperty("Accept-Encoding", "gzip");
        conn.setConnectTimeout(8000);
        conn.setReadTimeout(8000);

        int responseCode = conn.getResponseCode();
        if (responseCode != HttpURLConnection.HTTP_OK) {
            throw new RuntimeException("HTTP " + responseCode + " for tier " + tier.name());
        }

        InputStream is = conn.getInputStream();
        String encoding = conn.getContentEncoding();
        if ("gzip".equalsIgnoreCase(encoding)) {
            is = new GZIPInputStream(is);
        }

        BufferedReader reader = new BufferedReader(new InputStreamReader(is, StandardCharsets.UTF_8));
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }
        reader.close();

        return parseTierResult(tier, sb.toString());
    }

    private BenefitPriceData.TierResult parseTierResult(BenefitPriceData.TierType tier, String jsonStr) {
        try {
            JSONObject root = new JSONObject(jsonStr);

            String prodName = root.optString("productName", null);
            if (prodName == null || prodName.isEmpty()) prodName = root.optString("name", null);
            if (prodName == null || prodName.isEmpty()) prodName = root.optString("commodityName", null);
            if (prodName == null || prodName.isEmpty()) prodName = root.optString("title", null);
            if (prodName != null && !prodName.trim().isEmpty() && !prodName.equalsIgnoreCase("null")) {
                String active = AlzaPriceChartInjector.getActiveProductName();
                if (active == null || active.trim().isEmpty()) {
                    AlzaPriceChartInjector.setActiveProductName(prodName);
                }
            }

            JSONObject mainPriceTag = root.optJSONObject("mainPriceTag");
            if (mainPriceTag == null) return null;

            String primaryPrice = mainPriceTag.optString("primaryPrice", null);
            double mainAmount = mainPriceTag.optDouble("primaryPriceNoCurrency", 0.0);
            if (mainAmount <= 0.0 && primaryPrice != null) {
                mainAmount = parseNumericAmount(primaryPrice);
            }

            String comparePriceStr = mainPriceTag.optString("comparePrice", null);
            Double comparePrice = null;
            if (comparePriceStr != null && !comparePriceStr.isEmpty() && !comparePriceStr.equalsIgnoreCase("null")) {
                double parsed = parseNumericAmount(comparePriceStr);
                if (parsed > 0.0) {
                    comparePrice = parsed;
                }
            }

            int priceType = mainPriceTag.optInt("priceType", 0);
            int priceGroupType = mainPriceTag.optInt("priceGroupType", 0);

            // Hidden tier rule:
            boolean hidden = false;
            if (!tier.reference && priceGroupType == 0 && priceType != 7 && priceType != 12) {
                hidden = true;
            }

            List<BenefitPriceData.PromoItem> promoItems = new ArrayList<>();
            JSONArray promoPrices = root.optJSONArray("promoPrices");
            if (promoPrices != null) {
                for (int i = 0; i < promoPrices.length(); i++) {
                    JSONObject pObj = promoPrices.optJSONObject(i);
                    if (pObj == null) continue;

                    int pType = pObj.optInt("priceType", 0);
                    String name = pObj.optString("name", "");
                    String coupon = pObj.optString("discountCouponCode", null);
                    String pPrice = pObj.optString("primaryPrice", null);
                    double pAmount = pObj.optDouble("primaryPriceNoCurrency", 0.0);
                    if (pAmount <= 0.0 && pPrice != null) {
                        pAmount = parseNumericAmount(pPrice);
                    }

                    if (pAmount > 0.0) {
                        promoItems.add(new BenefitPriceData.PromoItem(pType, name, coupon, pPrice, pAmount));
                    }
                }
            }

            return new BenefitPriceData.TierResult(
                    tier,
                    primaryPrice,
                    mainAmount,
                    comparePrice,
                    comparePriceStr,
                    priceType,
                    priceGroupType,
                    hidden,
                    "api",
                    promoItems
            );
        } catch (Throwable t) {
            Log.w(TAG, "Error parsing tier " + tier.name() + ": " + t.getMessage());
            return null;
        }
    }

    private static double parseNumericAmount(String str) {
        if (str == null) return 0.0;
        try {
            // Strip currency symbols, spaces, non-breaking spaces, hyphen
            String clean = str.replace("\u00A0", "")
                    .replace(" ", "")
                    .replace(",-", "")
                    .replace("Kč", "")
                    .replace("€", "")
                    .replace(",", ".")
                    .trim();
            // Keep only digits and decimal point
            clean = clean.replaceAll("[^0-9.]", "");
            if (clean.isEmpty()) return 0.0;
            return Double.parseDouble(clean);
        } catch (Throwable ignored) {
            return 0.0;
        }
    }

    private void notifySuccess(final String cacheKey, final BenefitPriceData data) {
        final List<Callback> callbacks;
        synchronized (pendingRequests) {
            callbacks = pendingRequests.remove(cacheKey);
        }
        if (callbacks == null || callbacks.isEmpty()) return;

        mainHandler.post(new Runnable() {
            @Override
            public void run() {
                for (Callback cb : callbacks) {
                    try {
                        cb.onSuccess(data);
                    } catch (Throwable ignored) {}
                }
            }
        });
    }

    private void notifyError(final String cacheKey, final Throwable throwable) {
        final List<Callback> callbacks;
        synchronized (pendingRequests) {
            callbacks = pendingRequests.remove(cacheKey);
        }
        if (callbacks == null || callbacks.isEmpty()) return;

        mainHandler.post(new Runnable() {
            @Override
            public void run() {
                for (Callback cb : callbacks) {
                    try {
                        cb.onError(throwable);
                    } catch (Throwable ignored) {}
                }
            }
        });
    }
}

