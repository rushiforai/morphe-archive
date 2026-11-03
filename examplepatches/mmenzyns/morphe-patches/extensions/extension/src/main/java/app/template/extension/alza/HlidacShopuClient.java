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

    private static HlidacShopuClient instance;

    private final LruCache<String, PriceHistoryData> cache;
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
        this.cache = new LruCache<String, PriceHistoryData>(50);
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
        PriceHistoryData cachedData = cache.get(cacheKey);
        if (cachedData != null) {
            if (callback != null) {
                callback.onSuccess(cachedData);
            }
            return;
        }

        executor.execute(new Runnable() {
            @Override
            public void run() {
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
                    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
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
                        cache.put(cacheKey, emptyData);
                        mainHandler.post(new Runnable() {
                            @Override
                            public void run() {
                                if (callback != null) {
                                    callback.onSuccess(emptyData);
                                }
                            }
                        });
                        conn.disconnect();
                        return;
                    }
                    if (responseCode != HttpURLConnection.HTTP_OK) {
                        conn.disconnect();
                        throw new Exception("HTTP error code: " + responseCode);
                    }

                    InputStream in = conn.getInputStream();
                    BufferedReader reader = new BufferedReader(new InputStreamReader(in, "UTF-8"));
                    StringBuilder sb = new StringBuilder();
                    String line;
                    while ((line = reader.readLine()) != null) {
                        sb.append(line);
                    }
                    reader.close();
                    conn.disconnect();

                    final PriceHistoryData data = parseResponse(
                            sb.toString(),
                            commodityId,
                            productName,
                            identifier
                    );

                    cache.put(cacheKey, data);

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

            if (metadata != null) {
                if (metadata.has("name") && !metadata.isNull("name")) {
                    name = metadata.optString("name");
                }
                if (metadata.has("realDiscount") && !metadata.isNull("realDiscount")) {
                    realDiscount = metadata.optDouble("realDiscount");
                }
                if (metadata.has("claimedDiscount") && !metadata.isNull("claimedDiscount")) {
                    claimedDiscount = metadata.optDouble("claimedDiscount");
                }
                if (metadata.has("currentPrice") && !metadata.isNull("currentPrice")) {
                    currentPriceMeta = metadata.optDouble("currentPrice");
                }
                if (metadata.has("commonPrice") && !metadata.isNull("commonPrice")) {
                    commonPriceMeta = metadata.optDouble("commonPrice");
                } else if (metadata.has("referencePrice") && !metadata.isNull("referencePrice")) {
                    commonPriceMeta = metadata.optDouble("referencePrice");
                }
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
                            String x = pt.optString("x");
                            long time = parseTimestamp(isoFormat, x);
                            currentPricePoints.add(new PriceHistoryData.PricePoint(time, price));

                            if (price < minPrice) minPrice = price;
                            if (price > maxPrice) maxPrice = price;
                        }
                    }
                }

                JSONArray originalArr = dataObj.optJSONArray("originalPrice");
                if (originalArr != null) {
                    for (int i = 0; i < originalArr.length(); i++) {
                        JSONObject pt = originalArr.optJSONObject(i);
                        if (pt != null && pt.has("y") && !pt.isNull("y")) {
                            double price = pt.optDouble("y");
                            String x = pt.optString("x");
                            long time = parseTimestamp(isoFormat, x);
                            originalPricePoints.add(new PriceHistoryData.PricePoint(time, price));
                        }
                    }
                }
            }

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
            return System.currentTimeMillis();
        }
        try {
            Date d = format.parse(dateStr.substring(0, 19));
            return d != null ? d.getTime() : System.currentTimeMillis();
        } catch (Throwable t) {
            return System.currentTimeMillis();
        }
    }
}
