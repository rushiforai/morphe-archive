package app.jofslash.extension.thecryptoapp;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import javax.net.ssl.HttpsURLConnection;

/**
 * Fetches USD spot prices from free public APIs: Binance first, CoinGecko as a fallback. No API
 * key, no account.
 *
 * <p>v1.2 robustness:
 * <ul>
 *   <li><b>Batched</b>: one Binance call fetches all symbols (looked up locally); one CoinGecko
 *       {@code /simple/price?ids=a,b,c} call resolves all fallback coins.</li>
 *   <li><b>60s in-memory price cache</b>, so a Check-now + onResume + a near-simultaneous alarm
 *       don't each hit the network.</li>
 *   <li><b>HTTP 429 (rate limit)</b>: reuse the last cached price (served as "stale") instead of
 *       dropping a coin to "unavailable".</li>
 *   <li>Ticker&rarr;CoinGecko-id resolved by <b>highest market cap</b> (daily-cached
 *       {@code /coins/markets}), with {@code /coins/list} for the long tail and the hardcoded
 *       majors as authoritative overrides.</li>
 * </ul>
 */
public final class PriceFetcher {

    static final String TAG = CustomAlerts.TAG;

    private static final String BINANCE_ALL = "https://api.binance.com/api/v3/ticker/price";
    private static final String BINANCE_24HR = "https://api.binance.com/api/v3/ticker/24hr?symbols=";
    private static final String COINGECKO_PRICE =
            "https://api.coingecko.com/api/v3/simple/price?vs_currencies=usd&ids=";
    private static final String COINGECKO_CHANGE =
            "https://api.coingecko.com/api/v3/simple/price?vs_currencies=usd&include_24hr_change=true&ids=";
    private static final String COINGECKO_LIST = "https://api.coingecko.com/api/v3/coins/list";
    private static final String COINGECKO_MARKETS =
            "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=";

    /**
     * The CoinGecko id maps are large (the coins list is ~16k entries), so they live in their own
     * prefs file: in the rules file, every rule save rewrote them too. v1.3 and older kept them in
     * the rules file; {@link #prefs} drops those old keys once (they are just re-downloaded).
     */
    private static final String PREFS = "jofslash_crypto_idmaps";
    private static final String OLD_PREFS = "jofslash_crypto_alerts";
    private static final String KEY_MC_MAP = "coingecko_mc_map";
    private static final String KEY_MC_AT = "coingecko_mc_at";
    private static final String KEY_LIST_MAP = "coingecko_list_map";
    private static final String KEY_LIST_AT = "coingecko_list_at";
    private static final long MAP_TTL_MS = 24L * 60L * 60L * 1000L;

    private static final long PRICE_TTL_MS = 60_000L;

    /** Authoritative ticker-base -> CoinGecko id for the majors (avoids ambiguity). */
    private static final Map<String, String> MAJORS = new HashMap<>();

    static {
        MAJORS.put("BTC", "bitcoin");
        MAJORS.put("ETH", "ethereum");
        MAJORS.put("BNB", "binancecoin");
        MAJORS.put("SOL", "solana");
        MAJORS.put("XRP", "ripple");
        MAJORS.put("ADA", "cardano");
        MAJORS.put("DOGE", "dogecoin");
        MAJORS.put("AVAX", "avalanche-2");
        MAJORS.put("DOT", "polkadot");
        MAJORS.put("MATIC", "matic-network");
        MAJORS.put("LTC", "litecoin");
        MAJORS.put("LINK", "chainlink");
        MAJORS.put("TRX", "tron");
        MAJORS.put("USDT", "tether");
        MAJORS.put("USDC", "usd-coin");
    }

    /** symbol -> {price, fetchedAtMillis}. */
    private static final Map<String, double[]> PRICE_CACHE = new ConcurrentHashMap<>();
    /** symbol -> {pctChange24h, fetchedAtMillis}. */
    private static final Map<String, double[]> PCT_CACHE = new ConcurrentHashMap<>();

    /** Parsed copies of the cached id maps, so each lookup doesn't re-parse the JSON. */
    private static Map<String, String> mcMapMem = null;
    private static long mcMapMemAt = -1L;
    private static Map<String, String> listMapMem = null;
    private static long listMapMemAt = -1L;
    private static volatile boolean oldKeysDropped = false;

    private static Map<String, Double> binanceAllCache = null;
    private static long binanceAllAt = 0L;

    /** Quote assets whose price is (close enough to) US dollars. */
    private static final String[] USD_QUOTES = {"FDUSD", "USDT", "USDC", "BUSD", "TUSD", "USD"};

    /**
     * Dollar coins whose ticker ends like a quote ("TUSD", "PYUSD"): they are a coin on their own,
     * not "T" or "PY" against the dollar.
     */
    private static final Set<String> USD_COINS = new HashSet<>(java.util.Arrays.asList(
            "USDT", "USDC", "TUSD", "BUSD", "FDUSD", "PYUSD", "USDP", "USDD", "GUSD", "LUSD", "SUSD",
            "USDE", "USDS", "RLUSD", "USD1"));

    private PriceFetcher() {
    }

    /**
     * The Binance pair to read a USD price from for [symbol]: the symbol itself when it already
     * ends in a USD quote ("BTCUSDT"), else the USDT pair ("BTC" -> "BTCUSDT"). A pair against
     * another coin ("ETHBTC") becomes "ETHBTCUSDT", which doesn't exist, instead of being read
     * as a dollar price when it is really a price in BTC.
     */
    /** The coin part of [symbol] without a USD quote: "BTCUSDT" -> "BTC", "BTC" -> "BTC". */
    static String baseOf(String symbol) {
        String up = symbol.toUpperCase(Locale.US);
        if (USD_COINS.contains(up)) return up;
        for (String q : USD_QUOTES) {
            if (up.endsWith(q) && up.length() > q.length()) return up.substring(0, up.length() - q.length());
        }
        return up;
    }

    /**
     * Cleans what the user typed into a symbol: upper case, no spaces, "/" or "-" ("btc/usdt" ->
     * "BTCUSDT"). Returns null unless it is 2-20 letters and digits, so nothing else ever reaches
     * a URL or the chart page.
     */
    static String normalize(String input) {
        if (input == null) return null;
        String s = input.trim().toUpperCase(Locale.US).replaceAll("[ /_-]", "");
        return s.matches("[A-Z0-9]{2,20}") ? s : null;
    }

    static String binancePair(String symbol) {
        String up = symbol.toUpperCase(Locale.US);
        if (USD_COINS.contains(up)) return up + "USDT";
        for (String q : USD_QUOTES) {
            if (up.endsWith(q) && up.length() > q.length()) return up;
        }
        return up + "USDT";
    }

    /** Result of a batch fetch: prices (null = truly unavailable) and which came from stale cache. */
    public static final class PriceMap {
        public final Map<String, Double> prices = new HashMap<>();
        public final Set<String> stale = new HashSet<>();
    }

    /** Single-symbol convenience (add-time validation). Returns null if unavailable. */
    public static Double fetchPrice(Context ctx, String symbol) {
        return fetchAll(ctx, Collections.singletonList(symbol)).prices.get(symbol);
    }

    /** Batch fetch for a set of symbols, using the 60s cache and one call per source. */
    public static PriceMap fetchAll(Context ctx, Collection<String> symbols) {
        PriceMap out = new PriceMap();
        try {
            long now = System.currentTimeMillis();
            Set<String> wanted = new LinkedHashSet<>();
            for (String s : symbols) if (s != null && !s.isEmpty()) wanted.add(s);

            // What still needs a network value (missing or older than the TTL)?
            Set<String> need = new LinkedHashSet<>();
            for (String s : wanted) if (!isFresh(s, now)) need.add(s);

            if (!need.isEmpty()) {
                Map<String, Double> binance = binanceAll(now);
                if (binance != null) {
                    // Stamp with when Binance answered: after a failed refresh this is the last
                    // good answer, which mustn't pass for a fresh one.
                    long binanceAt = binanceAllAt;
                    for (String s : need) {
                        Double p = binance.get(binancePair(s));
                        if (p != null) putCache(s, p, binanceAt);
                    }
                }

                // Still missing after Binance -> CoinGecko batch.
                Set<String> cgNeed = new LinkedHashSet<>();
                for (String s : need) if (!isFresh(s, now)) cgNeed.add(s);
                if (!cgNeed.isEmpty()) {
                    Map<String, String> symToId = new HashMap<>();
                    Set<String> ids = new LinkedHashSet<>();
                    for (String s : cgNeed) {
                        String id = coinGeckoId(ctx, s);
                        if (id != null) {
                            symToId.put(s, id);
                            ids.add(id);
                        } else {
                            Log.w(TAG, "fetch: no CoinGecko id for " + s);
                        }
                    }
                    if (!ids.isEmpty()) {
                        Map<String, Double> byId = coinGeckoSimple(ids);
                        if (byId != null) {
                            for (Map.Entry<String, String> e : symToId.entrySet()) {
                                Double p = byId.get(e.getValue());
                                if (p != null) putCache(e.getKey(), p, now);
                            }
                        }
                    }
                }
            }

            // Build output; serve cached (possibly stale) prices rather than null on a transient fail.
            for (String s : wanted) {
                double[] cp = PRICE_CACHE.get(s);
                if (cp != null) {
                    out.prices.put(s, cp[0]);
                    if ((now - (long) cp[1]) > PRICE_TTL_MS) {
                        out.stale.add(s);
                        Log.i(TAG, "fetch: served STALE cached price for " + s + " = $" + cp[0]);
                    }
                } else {
                    out.prices.put(s, null);
                }
            }
        } catch (Throwable t) {
            Log.e(TAG, "fetch: fetchAll failed", t);
        }
        return out;
    }

    /**
     * 24h change percent for the given symbols (for percent-change rules). Binance batch for
     * Binance-listed symbols, CoinGecko {@code include_24hr_change} for the rest. 60s cache; 429
     * reuses cache. Returns symbol -> percent (null when unavailable).
     */
    public static Map<String, Double> fetchChanges(Context ctx, Collection<String> symbols) {
        Map<String, Double> out = new HashMap<>();
        try {
            long now = System.currentTimeMillis();
            Set<String> wanted = new LinkedHashSet<>();
            for (String s : symbols) if (s != null && !s.isEmpty()) wanted.add(s);

            Set<String> need = new LinkedHashSet<>();
            for (String s : wanted) {
                double[] cp = PCT_CACHE.get(s);
                if (cp == null || (now - (long) cp[1]) > PRICE_TTL_MS) need.add(s);
            }

            if (!need.isEmpty()) {
                Map<String, Double> binanceAll = binanceAll(now); // to know which are Binance-listed
                // Binance pair -> the symbol the caller asked for ("BTCUSDT" -> "BTC").
                Map<String, String> pairToSym = new HashMap<>();
                Set<String> cgSyms = new LinkedHashSet<>();
                for (String s : need) {
                    String pair = binancePair(s);
                    if (binanceAll != null && binanceAll.containsKey(pair)) {
                        pairToSym.put(pair, s);
                    } else {
                        cgSyms.add(s);
                    }
                }

                if (!pairToSym.isEmpty()) {
                    Map<String, Double> b = binance24h(pairToSym.keySet());
                    if (b != null) for (Map.Entry<String, Double> e : b.entrySet()) {
                        String sym = pairToSym.get(e.getKey());
                        if (sym != null) PCT_CACHE.put(sym, new double[]{e.getValue(), now});
                    }
                }
                if (!cgSyms.isEmpty()) {
                    Map<String, String> symToId = new HashMap<>();
                    Set<String> ids = new LinkedHashSet<>();
                    for (String s : cgSyms) {
                        String id = coinGeckoId(ctx, s);
                        if (id != null) {
                            symToId.put(s, id);
                            ids.add(id);
                        }
                    }
                    if (!ids.isEmpty()) {
                        Map<String, Double> byId = coinGeckoChanges(ids);
                        if (byId != null) for (Map.Entry<String, String> e : symToId.entrySet()) {
                            Double v = byId.get(e.getValue());
                            if (v != null) PCT_CACHE.put(e.getKey(), new double[]{v, now});
                        }
                    }
                }
            }

            for (String s : wanted) {
                double[] cp = PCT_CACHE.get(s);
                out.put(s, cp == null ? null : cp[0]);
            }
        } catch (Throwable t) {
            Log.e(TAG, "fetch: fetchChanges failed", t);
        }
        return out;
    }

    private static Map<String, Double> binance24h(Set<String> symbolsUpper) {
        try {
            StringBuilder arr = new StringBuilder("[");
            boolean first = true;
            for (String s : symbolsUpper) {
                if (!first) arr.append(',');
                arr.append('"').append(s).append('"');
                first = false;
            }
            arr.append(']');
            HttpResult r = get(BINANCE_24HR + URLEncoder.encode(arr.toString(), "UTF-8"));
            if (r.code != 200 || r.body == null) {
                Log.w(TAG, "fetch: Binance 24hr HTTP " + r.code);
                return null;
            }
            JSONArray a = new JSONArray(r.body);
            Map<String, Double> map = new HashMap<>();
            for (int i = 0; i < a.length(); i++) {
                JSONObject o = a.optJSONObject(i);
                if (o == null) continue;
                String sym = o.optString("symbol", null);
                String pct = o.optString("priceChangePercent", null);
                if (sym != null && pct != null) {
                    try {
                        map.put(sym, Double.parseDouble(pct));
                    } catch (NumberFormatException ignored) {
                    }
                }
            }
            return map;
        } catch (Throwable t) {
            Log.w(TAG, "fetch: Binance 24hr failed: " + t);
            return null;
        }
    }

    private static Map<String, Double> coinGeckoChanges(Set<String> ids) {
        try {
            StringBuilder joined = new StringBuilder();
            for (String id : ids) {
                if (joined.length() > 0) joined.append(',');
                joined.append(id);
            }
            HttpResult r = get(COINGECKO_CHANGE + URLEncoder.encode(joined.toString(), "UTF-8"));
            if (r.code != 200 || r.body == null) {
                Log.w(TAG, "fetch: CoinGecko change HTTP " + r.code);
                return null;
            }
            JSONObject obj = new JSONObject(r.body);
            Map<String, Double> byId = new HashMap<>();
            for (Iterator<String> it = obj.keys(); it.hasNext(); ) {
                String id = it.next();
                JSONObject coin = obj.optJSONObject(id);
                // A coin without a value has "usd_24h_change": null; skip it, not the batch.
                double change = coin != null ? coin.optDouble("usd_24h_change", Double.NaN) : Double.NaN;
                if (!Double.isNaN(change)) byId.put(id, change);
            }
            return byId;
        } catch (Throwable t) {
            Log.w(TAG, "fetch: CoinGecko change failed: " + t);
            return null;
        }
    }

    private static boolean isFresh(String symbol, long now) {
        double[] cp = PRICE_CACHE.get(symbol);
        return cp != null && (now - (long) cp[1]) <= PRICE_TTL_MS;
    }

    private static void putCache(String symbol, double price, long at) {
        PRICE_CACHE.put(symbol, new double[]{price, at});
    }

    /** All Binance symbol prices in one call, cached 60s. Returns null on error/429. */
    private static synchronized Map<String, Double> binanceAll(long now) {
        if (binanceAllCache != null && (now - binanceAllAt) <= PRICE_TTL_MS) {
            return binanceAllCache;
        }
        try {
            HttpResult r = get(BINANCE_ALL);
            if (r.code == 429) {
                Log.w(TAG, "fetch: Binance 429 (rate limited), reusing cache if any");
                return binanceAllCache; // may be null
            }
            if (r.code != 200 || r.body == null) {
                Log.w(TAG, "fetch: Binance all HTTP " + r.code);
                return binanceAllCache;
            }
            JSONArray arr = new JSONArray(r.body);
            Map<String, Double> map = new HashMap<>(arr.length() * 2);
            for (int i = 0; i < arr.length(); i++) {
                JSONObject o = arr.optJSONObject(i);
                if (o == null) continue;
                String sym = o.optString("symbol", null);
                String p = o.optString("price", null);
                if (sym != null && p != null) {
                    try {
                        map.put(sym, Double.parseDouble(p));
                    } catch (NumberFormatException ignored) {
                    }
                }
            }
            binanceAllCache = map;
            binanceAllAt = now;
            Log.i(TAG, "fetch: Binance all refreshed (" + map.size() + " symbols)");
            return map;
        } catch (Throwable t) {
            Log.w(TAG, "fetch: Binance all failed: " + t);
            return binanceAllCache;
        }
    }

    /** One CoinGecko /simple/price call for a set of ids. Returns id->price, or null on error/429. */
    private static Map<String, Double> coinGeckoSimple(Set<String> ids) {
        try {
            StringBuilder joined = new StringBuilder();
            for (String id : ids) {
                if (joined.length() > 0) joined.append(',');
                joined.append(id);
            }
            HttpResult r = get(COINGECKO_PRICE + URLEncoder.encode(joined.toString(), "UTF-8"));
            if (r.code == 429) {
                Log.w(TAG, "fetch: CoinGecko price 429 (rate limited), keeping cached prices");
                return null;
            }
            if (r.code != 200 || r.body == null) {
                Log.w(TAG, "fetch: CoinGecko price HTTP " + r.code);
                return null;
            }
            JSONObject obj = new JSONObject(r.body);
            Map<String, Double> byId = new HashMap<>();
            for (Iterator<String> it = obj.keys(); it.hasNext(); ) {
                String id = it.next();
                JSONObject coin = obj.optJSONObject(id);
                double usd = coin != null ? coin.optDouble("usd", Double.NaN) : Double.NaN;
                if (!Double.isNaN(usd)) byId.put(id, usd);
            }
            return byId;
        } catch (Throwable t) {
            Log.w(TAG, "fetch: CoinGecko price failed: " + t);
            return null;
        }
    }

    /** Majors -> market-cap map -> coins-list map. */
    private static String coinGeckoId(Context ctx, String symbol) {
        String base = baseOf(symbol);
        String major = MAJORS.get(base);
        if (major != null) return major;
        String lower = base.toLowerCase(Locale.US);
        try {
            String fromMc = marketCapMap(ctx).get(lower);
            if (fromMc != null) return fromMc;
            return coinsListMap(ctx).get(lower);
        } catch (Throwable t) {
            Log.w(TAG, "fetch: id resolve failed for " + symbol + ": " + t);
            return null;
        }
    }

    /** lowercase-symbol -> id ranked by market cap (first = highest), daily cached. */
    private static synchronized Map<String, String> marketCapMap(Context ctx) {
        SharedPreferences prefs = prefs(ctx);
        long at = prefs.getLong(KEY_MC_AT, 0L);
        String cached = prefs.getString(KEY_MC_MAP, null);
        if (cached == null || (System.currentTimeMillis() - at) >= MAP_TTL_MS) {
            try {
                JSONObject built = new JSONObject();
                int added = 0;
                for (int page = 1; page <= 2; page++) {
                    HttpResult r = get(COINGECKO_MARKETS + page);
                    if (r.code != 200 || r.body == null) {
                        Log.w(TAG, "fetch: coins/markets page " + page + " HTTP " + r.code);
                        break; // keep whatever we have; don't hammer on failure/429
                    }
                    JSONArray arr = new JSONArray(r.body);
                    for (int i = 0; i < arr.length(); i++) {
                        JSONObject c = arr.optJSONObject(i);
                        if (c == null) continue;
                        String sym = c.optString("symbol", "").toLowerCase(Locale.US);
                        String id = c.optString("id", null);
                        if (!sym.isEmpty() && id != null && !built.has(sym)) {
                            built.put(sym, id); // first = highest market cap
                            added++;
                        }
                    }
                }
                if (added > 0) {
                    cached = built.toString();
                    at = System.currentTimeMillis();
                    prefs.edit().putString(KEY_MC_MAP, cached).putLong(KEY_MC_AT, at).apply();
                    Log.i(TAG, "fetch: refreshed market-cap id map (" + added + " symbols)");
                }
            } catch (Throwable t) {
                Log.w(TAG, "fetch: coins/markets refresh failed: " + t);
            }
        }
        if (mcMapMem == null || mcMapMemAt != at) {
            mcMapMem = toMap(cached);
            mcMapMemAt = at;
        }
        return mcMapMem;
    }

    /** lowercase-symbol -> id from /coins/list (long tail), daily cached. First id per symbol. */
    private static synchronized Map<String, String> coinsListMap(Context ctx) {
        SharedPreferences prefs = prefs(ctx);
        long at = prefs.getLong(KEY_LIST_AT, 0L);
        String cached = prefs.getString(KEY_LIST_MAP, null);
        if (cached == null || (System.currentTimeMillis() - at) >= MAP_TTL_MS) {
            try {
                HttpResult r = get(COINGECKO_LIST);
                if (r.code == 200 && r.body != null) {
                    JSONArray arr = new JSONArray(r.body);
                    JSONObject built = new JSONObject();
                    for (int i = 0; i < arr.length(); i++) {
                        JSONObject c = arr.optJSONObject(i);
                        if (c == null) continue;
                        String sym = c.optString("symbol", "").toLowerCase(Locale.US);
                        String id = c.optString("id", null);
                        if (!sym.isEmpty() && id != null && !built.has(sym)) built.put(sym, id);
                    }
                    cached = built.toString();
                    at = System.currentTimeMillis();
                    prefs.edit().putString(KEY_LIST_MAP, cached).putLong(KEY_LIST_AT, at).apply();
                    Log.i(TAG, "fetch: refreshed coins/list id map (" + built.length() + " symbols)");
                } else {
                    Log.w(TAG, "fetch: coins/list HTTP " + r.code);
                }
            } catch (Throwable t) {
                Log.w(TAG, "fetch: coins/list refresh failed: " + t);
            }
        }
        if (listMapMem == null || listMapMemAt != at) {
            listMapMem = toMap(cached);
            listMapMemAt = at;
        }
        return listMapMem;
    }

    private static Map<String, String> toMap(String json) {
        Map<String, String> map = new HashMap<>();
        if (json == null) return map;
        try {
            JSONObject o = new JSONObject(json);
            for (Iterator<String> it = o.keys(); it.hasNext(); ) {
                String k = it.next();
                map.put(k, o.optString(k, null));
            }
        } catch (Throwable ignored) {
        }
        return map;
    }

    private static SharedPreferences prefs(Context ctx) {
        Context app = ctx.getApplicationContext();
        if (!oldKeysDropped) {
            oldKeysDropped = true;
            try {
                SharedPreferences old = app.getSharedPreferences(OLD_PREFS, Context.MODE_PRIVATE);
                if (old.contains(KEY_LIST_MAP) || old.contains(KEY_MC_MAP)) {
                    old.edit().remove(KEY_LIST_MAP).remove(KEY_LIST_AT)
                            .remove(KEY_MC_MAP).remove(KEY_MC_AT).apply();
                }
            } catch (Throwable ignored) {
            }
        }
        return app.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    private static final class HttpResult {
        final int code;
        final String body; // only set when code == 200

        HttpResult(int code, String body) {
            this.code = code;
            this.body = body;
        }
    }

    private static HttpResult get(String urlString) throws Exception {
        HttpURLConnection conn = null;
        try {
            URL url = new URL(urlString);
            conn = (HttpURLConnection) url.openConnection();
            if (!(conn instanceof HttpsURLConnection)) {
                Log.w(TAG, "fetch: refusing non-HTTPS URL " + urlString);
                return new HttpResult(-1, null);
            }
            conn.setRequestMethod("GET");
            conn.setConnectTimeout(10000);
            conn.setReadTimeout(15000);
            conn.setRequestProperty("Accept", "application/json");
            int code = conn.getResponseCode();
            if (code != 200) {
                return new HttpResult(code, null);
            }
            InputStream in = conn.getInputStream();
            StringBuilder sb = new StringBuilder();
            try (BufferedReader reader =
                         new BufferedReader(new InputStreamReader(in, StandardCharsets.UTF_8))) {
                String line;
                while ((line = reader.readLine()) != null) sb.append(line);
            }
            return new HttpResult(200, sb.toString());
        } finally {
            if (conn != null) conn.disconnect();
        }
    }
}
