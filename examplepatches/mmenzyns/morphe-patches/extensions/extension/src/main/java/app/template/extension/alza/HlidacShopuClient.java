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
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.TimeZone;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class HlidacShopuClient {
    private static final String TAG = "MorpheAlza";
    private static final String API_BASE_URL = "https://api.hlidacshopu.cz/v2/detail?url=";
    private static final int TIMEOUT_MS = 5000;

    private static class CacheEntry {
        final PriceHistoryData data;
        final long timestamp;

        CacheEntry(PriceHistoryData data) {
            this.data = data;
            this.timestamp = System.currentTimeMillis();
        }

        boolean isExpired() {
            // TTL: 1 hour for products with data, 10 minutes for empty/not-found
            long ttl = (data != null && data.hasData()) ? (60 * 60 * 1000L) : (10 * 60 * 1000L);
            return (System.currentTimeMillis() - timestamp) > ttl;
        }
    }

    private static HlidacShopuClient instance;

    private final LruCache<String, CacheEntry> cache;
    private final ExecutorService executor;
    private final Handler mainHandler;

    public interface Callback {
        void onSuccess(PriceHistoryData data);
        void onError(Throwable throwable);
    }

    public static synchronized HlidacShopuClient getInstance() {
        if (instance == null) {
            instance = new HlidacShopuClient();
        }
        return instance;
    }

    private HlidacShopuClient() {
        this.cache = new LruCache<String, CacheEntry>(50);
        this.executor = Executors.newSingleThreadExecutor();
        this.mainHandler = new Handler(Looper.getMainLooper());
    }

    public void fetchPriceHistory(
            final String commodityId,
            final String fallbackUrl,
            final String identifier,
            final String productName,
            final Callback callback
    ) {
        if ((commodityId == null || commodityId.trim().isEmpty()) &&
            (fallbackUrl == null || fallbackUrl.trim().isEmpty())) {
            if (callback != null) {
                callback.onError(new IllegalArgumentException("Neither commodityId nor URL provided"));
            }
            return;
        }

        final String domain = AlzaPriceChartInjector.getDetectedDomain();
        final String cacheKey = domain + ":" + ((commodityId != null && !commodityId.isEmpty()) ? commodityId : fallbackUrl);
        CacheEntry entry = cache.get(cacheKey);
        if (entry != null && !entry.isExpired()) {
            final PriceHistoryData cachedData = entry.data;
            mainHandler.post(new Runnable() {
                @Override
                public void run() {
                    if (callback != null) {
                        callback.onSuccess(cachedData);
                    }
                }
            });
            return;
        }

        executor.execute(new Runnable() {
            @Override
            public void run() {
                HttpURLConnection conn = null;
                try {
                    String targetUrl;
                    if (fallbackUrl != null && fallbackUrl.startsWith("http")) {
                        targetUrl = fallbackUrl;
                    } else {
                        String activeDomain = domain;
                        if (activeDomain == null || activeDomain.isEmpty()) {
                            activeDomain = "alza.cz";
                        }
                        targetUrl = "https://www." + activeDomain + "/a-d" + commodityId + ".htm";
                    }

                    String apiUrl = API_BASE_URL + URLEncoder.encode(targetUrl, "UTF-8");
                    Log.i(TAG, "Requesting Hlídač shopů: " + apiUrl);

                    URL url = new URL(apiUrl);
                    conn = (HttpURLConnection) url.openConnection();
                    conn.setRequestMethod("GET");
                    conn.setConnectTimeout(TIMEOUT_MS);
                    conn.setReadTimeout(TIMEOUT_MS);
                    conn.setRequestProperty("Accept", "application/json");
                    conn.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36");

                    int responseCode = conn.getResponseCode();
                    Log.i(TAG, "Hlídač shopů HTTP response code: " + responseCode);
                    if (responseCode == HttpURLConnection.HTTP_NOT_FOUND) {
                        final PriceHistoryData emptyData = new PriceHistoryData(
                                commodityId,
                                productName,
                                identifier,
                                null, null, null, null, null, null,
                                null, null
                        );
                        cache.put(cacheKey, new CacheEntry(emptyData));
                        mainHandler.post(new Runnable() {
                            @Override
                            public void run() {
                                if (callback != null) {
                                    callback.onSuccess(emptyData);
                                }
                            }
                        });
                        return;
                    }
                    if (responseCode != HttpURLConnection.HTTP_OK) {
                        throw new Exception("HTTP error code: " + responseCode);
                    }

                    InputStream in = conn.getInputStream();
                    BufferedReader reader = new BufferedReader(new InputStreamReader(in, "UTF-8"));
                    StringBuilder sb = new StringBuilder();
                    try {
                        String line;
                        while ((line = reader.readLine()) != null) {
                            sb.append(line);
                        }
                    } finally {
                        try {
                            reader.close();
                        } catch (Throwable ignored) {}
                    }

                    final PriceHistoryData data = parseResponse(
                            sb.toString(),
                            commodityId,
                            productName,
                            identifier
                    );

                    cache.put(cacheKey, new CacheEntry(data));

                    mainHandler.post(new Runnable() {
                        @Override
                        public void run() {
                            if (callback != null) {
                                callback.onSuccess(data);
                            }
                        }
                    });
                } catch (final Throwable t) {
                    Log.e(TAG, "Error fetching Hlídač shopů data", t);
                    mainHandler.post(new Runnable() {
                        @Override
                        public void run() {
                            if (callback != null) {
                                callback.onError(t);
                            }
                        }
                    });
                } finally {
                    if (conn != null) {
                        try {
                            conn.disconnect();
                        } catch (Throwable ignored) {}
                    }
                }
            }
        });
    }

    private PriceHistoryData parseResponse(
            String jsonStr,
            String commodityId,
            String defaultProductName,
            String identifier
    ) {
        try {
            JSONObject root = new JSONObject(jsonStr);
            JSONObject metadata = root.optJSONObject("metadata");
            JSONObject dataObj = root.optJSONObject("data");

            String name = defaultProductName;
            Double realDiscount = null;
            Double claimedDiscount = null;
            Double currentPriceMeta = null;
            Double commonPriceMeta = null;

            JSONObject[] sources = new JSONObject[]{ metadata, dataObj, root };
            for (JSONObject src : sources) {
                if (src == null) continue;
                if ((name == null || name.isEmpty() || name.equals(defaultProductName)) && src.has("name") && !src.isNull("name")) {
                    name = src.optString("name");
                }
                if (realDiscount == null && src.has("realDiscount") && !src.isNull("realDiscount")) {
                    realDiscount = src.optDouble("realDiscount");
                }
                if (claimedDiscount == null && src.has("claimedDiscount") && !src.isNull("claimedDiscount")) {
                    claimedDiscount = src.optDouble("claimedDiscount");
                }
                if (currentPriceMeta == null && src.has("currentPrice") && !src.isNull("currentPrice")) {
                    currentPriceMeta = src.optDouble("currentPrice");
                }
                if (commonPriceMeta == null) {
                    if (src.has("commonPrice") && !src.isNull("commonPrice")) {
                        commonPriceMeta = src.optDouble("commonPrice");
                    } else if (src.has("referencePrice") && !src.isNull("referencePrice")) {
                        commonPriceMeta = src.optDouble("referencePrice");
                    } else if (src.has("minPrice") && !src.isNull("minPrice")) {
                        commonPriceMeta = src.optDouble("minPrice");
                    }
                }
            }

            if (name != null && !name.trim().isEmpty()) {
                String active = AlzaPriceChartInjector.getActiveProductName();
                if (active == null || active.trim().isEmpty()) {
                    AlzaPriceChartInjector.setActiveProductName(name);
                }
            }

            // Normalize fractional percentages from API (e.g. 0.12503 -> 12.503%, 0.30006 -> 30.006%)
            if (realDiscount != null && realDiscount > 0.0 && realDiscount <= 1.0) {
                realDiscount = realDiscount * 100.0;
            }
            if (claimedDiscount != null && claimedDiscount > 0.0 && claimedDiscount <= 1.0) {
                claimedDiscount = claimedDiscount * 100.0;
            }

            List<PriceHistoryData.PricePoint> currentPricePoints = new ArrayList<PriceHistoryData.PricePoint>();
            List<PriceHistoryData.PricePoint> originalPricePoints = new ArrayList<PriceHistoryData.PricePoint>();

            SimpleDateFormat isoFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss", Locale.US);
            isoFormat.setTimeZone(TimeZone.getTimeZone("UTC"));

            double minPrice = Double.MAX_VALUE;
            double maxPrice = Double.MIN_VALUE;

            if (dataObj != null) {
                JSONArray currentArr = dataObj.optJSONArray("currentPrice");
                if (currentArr != null) {
                    for (int i = 0; i < currentArr.length(); i++) {
                        JSONObject pt = currentArr.optJSONObject(i);
                        if (pt != null && pt.has("y") && !pt.isNull("y")) {
                            double price = pt.optDouble("y");
                            if (Double.isNaN(price) || Double.isInfinite(price) || price <= 0) {
                                continue;
                            }
                            String x = pt.optString("x");
                            long time = parseTimestamp(isoFormat, x);
                            if (time > 0) {
                                currentPricePoints.add(new PriceHistoryData.PricePoint(time, price));
                                if (price < minPrice) minPrice = price;
                                if (price > maxPrice) maxPrice = price;
                            }
                        }
                    }
                }

                JSONArray originalArr = dataObj.optJSONArray("originalPrice");
                if (originalArr != null) {
                    for (int i = 0; i < originalArr.length(); i++) {
                        JSONObject pt = originalArr.optJSONObject(i);
                        if (pt != null && pt.has("y") && !pt.isNull("y")) {
                            double price = pt.optDouble("y");
                            if (Double.isNaN(price) || Double.isInfinite(price) || price <= 0) {
                                continue;
                            }
                            String x = pt.optString("x");
                            long time = parseTimestamp(isoFormat, x);
                            if (time > 0) {
                                originalPricePoints.add(new PriceHistoryData.PricePoint(time, price));
                                if (price < minPrice) minPrice = price;
                                if (price > maxPrice) maxPrice = price;
                            }
                        }
                    }
                }
            }

            // Sort price points chronologically
            Collections.sort(currentPricePoints, new Comparator<PriceHistoryData.PricePoint>() {
                @Override
                public int compare(PriceHistoryData.PricePoint o1, PriceHistoryData.PricePoint o2) {
                    return Long.compare(o1.timestamp, o2.timestamp);
                }
            });
            Collections.sort(originalPricePoints, new Comparator<PriceHistoryData.PricePoint>() {
                @Override
                public int compare(PriceHistoryData.PricePoint o1, PriceHistoryData.PricePoint o2) {
                    return Long.compare(o1.timestamp, o2.timestamp);
                }
            });

            Double min = (minPrice != Double.MAX_VALUE) ? minPrice : null;
            Double max = (maxPrice != Double.MIN_VALUE) ? maxPrice : null;
            Double current = currentPriceMeta;
            if (current == null && !currentPricePoints.isEmpty()) {
                current = currentPricePoints.get(currentPricePoints.size() - 1).price;
            }

            return new PriceHistoryData(
                    commodityId,
                    name,
                    identifier,
                    current,
                    commonPriceMeta,
                    min,
                    max,
                    realDiscount,
                    claimedDiscount,
                    currentPricePoints,
                    originalPricePoints
            );
        } catch (Throwable t) {
            Log.e(TAG, "Failed to parse Hlídač shopů JSON", t);
            return new PriceHistoryData(
                    commodityId,
                    defaultProductName,
                    identifier,
                    null, null, null, null, null, null,
                    null, null
            );
        }
    }

    private static long parseTimestamp(SimpleDateFormat format, String dateStr) {
        if (dateStr == null || dateStr.length() < 19) {
            return -1L;
        }
        try {
            Date d = format.parse(dateStr.substring(0, 19));
            return d != null ? d.getTime() : -1L;
        } catch (Throwable t) {
            return -1L;
        }
    }
}
