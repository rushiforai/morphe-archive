package dev.materialtidal.extension.tidal.player.lyrics;

import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.atomic.AtomicLong;

import dev.materialtidal.extension.tidal.player.lyrics.SyllableLyricsMatcher.KugouCandidate;
import dev.materialtidal.extension.tidal.player.lyrics.SyllableLyricsModels.SyllableLyricsDocument;

/**
 * Asynchronous multi-provider fetcher for syllable-, word-, and fallback line-synced lyrics.
 *
 * <p>Provider cascade (strictly open, public HTTPS endpoints):
 * <ol>
 *   <li>{@code lrc.red} direct ISRC TTML lookup ({@code /s/{ISRC}.ttml})</li>
 *   <li>{@code lrc.red} API v1 lookup ({@code /api/v1}) word-timed TTML</li>
 *   <li>{@code lrc.red} metadata search + ISRC TTML lookup</li>
 *   <li>{@code BetterLyrics} ({@code api.betterlyrics.org} -&gt; {@code lyrics-api.boidu.dev}) TTML</li>
 *   <li>{@code LyricsPlus} multi-mirror pool ({@code lyricsplus.binimum.org}, {@code lyricsplus.prjktla.my.id})</li>
 *   <li>{@code LRCLIB} ({@code lrclib.net}) word-synced YAML {@code lyricsfile} (retaining line-synced LRC as fallback)</li>
 *   <li>{@code KuGou} ({@code lyrics.kugou.com}) syllable-synced KRC</li>
 *   <li>{@code LRCLIB} line-synced LRC fallback (used in UI only when TIDAL itself has no lyrics)</li>
 * </ol>
 */
public final class SyllableLyricsFetcher {

    private static final String TAG = "MaterialTidalSylLyrics";
    private static final String USER_AGENT =
            "MaterialTidal/0.2.1 (+https://github.com/ninocss/MaterialTidal)";

    private static final int CONNECT_TIMEOUT_MS = 4500;
    private static final int READ_TIMEOUT_MS = 6500;
    private static final int MAX_RESPONSE_BYTES = 1024 * 1024;
    private static final int MAX_REDIRECT_HOPS = 2;
    private static final long RATE_LIMIT_COOLDOWN_MS = 12_000L;

    private static final String[] BETTER_LYRICS_ENDPOINTS = new String[]{
            "https://api.betterlyrics.org/getLyrics",
            "https://lyrics-api.boidu.dev/getLyrics"
    };

    private static final String[] LYRICSPLUS_MIRRORS = new String[]{
            "https://lyricsplus.binimum.org/v2/lyrics/get",
            "https://lyricsplus.prjktla.my.id/v2/lyrics/get"
    };

    public interface Callback {
        void onResult(String requestKey, SyllableLyricsDocument document);
    }

    private static final class CacheEntry {
        final SyllableLyricsDocument document; // null means negative cache (no lyrics found)

        CacheEntry(SyllableLyricsDocument document) {
            this.document = document;
        }
    }

    private static final class HttpResult {
        final int statusCode;
        final String body;

        HttpResult(int statusCode, String body) {
            this.statusCode = statusCode;
            this.body = body;
        }
    }

    private static final class BoundedCache<V> extends LinkedHashMap<String, V> {
        private final int maxEntries;

        BoundedCache(int maxEntries) {
            super(Math.max(16, maxEntries + 1), 0.75f, true);
            this.maxEntries = maxEntries;
        }

        @Override
        protected boolean removeEldestEntry(Map.Entry<String, V> eldest) {
            return size() > maxEntries;
        }

        synchronized V getEntry(String key) {
            return key != null ? super.get(key) : null;
        }

        synchronized void putEntry(String key, V value) {
            if (key != null) {
                super.put(key, value);
            }
        }
    }

    private static final BoundedCache<String> ISRC_CACHE = new BoundedCache<>(512);
    private static final BoundedCache<CacheEntry> LYRICS_CACHE = new BoundedCache<>(48);
    private static final ConcurrentHashMap<String, Long> HOST_COOLDOWN_UNTIL_MS = new ConcurrentHashMap<>();

    private static volatile Handler mainHandler;
    private static final AtomicLong LATEST_GEN = new AtomicLong(0L);
    private static final ExecutorService FETCH_EXECUTOR = Executors.newFixedThreadPool(
            2,
            new ThreadFactory() {
                private int count = 0;

                @Override
                public Thread newThread(Runnable r) {
                    Thread t = new Thread(r, "MaterialTidal-SylLyrics-" + (++count));
                    t.setDaemon(true);
                    return t;
                }
            }
    );

    private SyllableLyricsFetcher() {
    }

    public static void cacheTrackIsrc(String trackId, String isrc) {
        if (trackId == null || trackId.trim().isEmpty()) {
            return;
        }
        String normIsrc = SyllableLyricsMatcher.normalizeIsrc(isrc);
        if (normIsrc != null) {
            ISRC_CACHE.putEntry(trackId.trim(), normIsrc);
        }
    }

    public static String getCachedIsrc(String trackId) {
        if (trackId == null || trackId.trim().isEmpty()) {
            return null;
        }
        return ISRC_CACHE.getEntry(trackId.trim());
    }

    public static boolean isMetaTitleCompatible(String metaTitle, String stateTitle) {
        if (metaTitle == null || metaTitle.trim().isEmpty()
                || stateTitle == null || stateTitle.trim().isEmpty()) {
            return true;
        }
        String normMeta = SyllableLyricsMatcher.normalize(SyllableLyricsMatcher.cleanTitle(metaTitle));
        String normState = SyllableLyricsMatcher.normalize(SyllableLyricsMatcher.cleanTitle(stateTitle));
        if (normMeta.isEmpty() || normState.isEmpty()) {
            String rawMeta = metaTitle.trim().toLowerCase(Locale.ROOT);
            String rawState = stateTitle.trim().toLowerCase(Locale.ROOT);
            return rawMeta.equals(rawState) || rawMeta.contains(rawState) || rawState.contains(rawMeta);
        }
        if (normMeta.equals(normState) || normMeta.startsWith(normState) || normState.startsWith(normMeta)) {
            return true;
        }
        return (normMeta.length() >= 4 && normState.contains(normMeta))
                || (normState.length() >= 4 && normMeta.contains(normState));
    }

    public static String buildRequestKey(
            String trackId,
            String title,
            String artist,
            int durationSec
    ) {
        String normTitle = SyllableLyricsMatcher.normalize(SyllableLyricsMatcher.cleanTitle(title));
        String normArtist = SyllableLyricsMatcher.normalize(SyllableLyricsMatcher.primaryArtist(artist));
        String idPart = trackId != null ? trackId.trim() : "";
        if (!idPart.isEmpty()) {
            return "id:" + idPart + "|" + normTitle;
        }
        int durBucket = durationSec > 0 ? Math.round(durationSec / 2f) * 2 : 0;
        return "meta:" + normTitle + "|" + normArtist + "|" + durBucket;
    }

    public static SyllableLyricsDocument peekCached(String requestKey, String title, String artist, int durationSec) {
        if (requestKey != null) {
            CacheEntry hit = LYRICS_CACHE.getEntry(requestKey);
            if (hit != null) {
                return hit.document;
            }
        }
        String metaKey = buildMetaOnlyKey(title, artist, durationSec);
        CacheEntry metaHit = LYRICS_CACHE.getEntry(metaKey);
        return metaHit != null ? metaHit.document : null;
    }

    private static String buildMetaOnlyKey(String title, String artist, int durationSec) {
        String normTitle = SyllableLyricsMatcher.normalize(SyllableLyricsMatcher.cleanTitle(title));
        String normArtist = SyllableLyricsMatcher.normalize(SyllableLyricsMatcher.primaryArtist(artist));
        int durBucket = durationSec > 0 ? Math.round(durationSec / 2f) * 2 : 0;
        return "meta:" + normTitle + "|" + normArtist + "|" + durBucket;
    }

    public static void fetchAsync(
            final String trackId,
            final String title,
            final String artist,
            final String album,
            final String explicitIsrc,
            final int durationSec,
            final Callback callback
    ) {
        if (callback == null) {
            return;
        }
        final String cleanTitle = title != null ? title.trim() : "";
        final String cleanArtist = artist != null ? artist.trim() : "";
        if (cleanTitle.isEmpty() || cleanArtist.isEmpty()) {
            return;
        }

        final String requestKey = buildRequestKey(trackId, cleanTitle, cleanArtist, durationSec);
        final String metaKey = buildMetaOnlyKey(cleanTitle, cleanArtist, durationSec);
        final String resolvedIsrc = resolveBestIsrc(trackId, explicitIsrc);

        CacheEntry cached = LYRICS_CACHE.getEntry(requestKey);
        if (cached == null) {
            CacheEntry metaCached = LYRICS_CACHE.getEntry(metaKey);
            // Allow newly resolved ISRC to upgrade a previous miss or line-only hit via direct ISRC TTML.
            if (metaCached != null && (resolvedIsrc == null || isValidSyllableDoc(metaCached.document))) {
                cached = metaCached;
                LYRICS_CACHE.putEntry(requestKey, cached);
            }
        }
        if (cached != null) {
            final SyllableLyricsDocument doc = cached.document;
            postToMain(new Runnable() {
                @Override
                public void run() {
                    callback.onResult(requestKey, doc);
                }
            });
            return;
        }

        final long gen = LATEST_GEN.incrementAndGet();

        FETCH_EXECUTOR.execute(new Runnable() {
            @Override
            public void run() {
                if (gen != LATEST_GEN.get()) {
                    return;
                }
                SyllableLyricsDocument result = null;
                try {
                    result = fetchFromProviders(cleanTitle, cleanArtist, album, resolvedIsrc, durationSec, gen);
                } catch (Throwable t) {
                    Log.w(TAG, "Lyrics fetch failed", t);
                }

                if (gen != LATEST_GEN.get()) {
                    if (result != null) {
                        CacheEntry positive = new CacheEntry(result);
                        LYRICS_CACHE.putEntry(requestKey, positive);
                        LYRICS_CACHE.putEntry(metaKey, positive);
                    }
                    return;
                }

                CacheEntry entry = new CacheEntry(result);
                LYRICS_CACHE.putEntry(requestKey, entry);
                LYRICS_CACHE.putEntry(metaKey, entry);

                final SyllableLyricsDocument finalDoc = result;
                postToMain(new Runnable() {
                    @Override
                    public void run() {
                        callback.onResult(requestKey, finalDoc);
                    }
                });
            }
        });
    }

    private static void postToMain(Runnable r) {
        Handler h = mainHandler;
        if (h == null) {
            h = new Handler(Looper.getMainLooper());
            mainHandler = h;
        }
        h.post(r);
    }

    private static String resolveBestIsrc(String trackId, String explicitIsrc) {
        if (trackId != null && !trackId.trim().isEmpty()) {
            String cached = SyllableLyricsMatcher.normalizeIsrc(getCachedIsrc(trackId));
            if (cached != null) {
                return cached;
            }
        }
        return SyllableLyricsMatcher.normalizeIsrc(explicitIsrc);
    }

    private static SyllableLyricsDocument fetchFromProviders(
            String title,
            String artist,
            String album,
            String isrc,
            int durationSec,
            long gen
    ) {
        Set<String> triedTtmlUrls = new HashSet<>();
        SyllableLyricsDocument lrclibLineFallback = null;

        // 1. lrc.red direct ISRC TTML lookup
        if (isrc != null) {
            String directUrl = "https://lrc.red/s/" + isrc + ".ttml";
            triedTtmlUrls.add(directUrl);
            String xml = httpGet(directUrl, "application/ttml+xml, application/xml, text/xml");
            if (xml != null) {
                SyllableLyricsDocument doc = TtmlLyricsParser.parse(xml, "lrc.red");
                if (isValidSyllableDoc(doc)) {
                    return doc;
                }
            }
        }
        if (gen != LATEST_GEN.get()) return null;

        // 2. lrc.red API v1 lookup -> HTTPS TTML
        StringBuilder v1Url = new StringBuilder("https://lrc.red/api/v1")
                .append("?track=").append(urlEncode(title))
                .append("&artist=").append(urlEncode(artist));
        if (album != null && !album.trim().isEmpty()) {
            v1Url.append("&album=").append(urlEncode(album.trim()));
        }
        if (durationSec > 0) {
            v1Url.append("&duration=").append(durationSec);
        }
        String v1Body = httpGet(v1Url.toString(), "application/json");
        if (v1Body != null) {
            List<String> urls = SyllableLyricsMatcher.pickBestBinimumUrls(v1Body, durationSec);
            for (String ttmlUrl : urls) {
                if (gen != LATEST_GEN.get()) return null;
                if (!triedTtmlUrls.add(ttmlUrl)) {
                    continue;
                }
                String xml = httpGet(ttmlUrl, "application/ttml+xml, application/xml, text/xml");
                if (xml != null) {
                    SyllableLyricsDocument doc = TtmlLyricsParser.parse(xml, "lrc.red");
                    if (isValidSyllableDoc(doc)) {
                        return doc;
                    }
                }
            }
        }
        if (gen != LATEST_GEN.get()) return null;

        // 3. lrc.red metadata search -> ISRC TTML lookup
        String searchQuery = (SyllableLyricsMatcher.cleanTitle(title) + " "
                + SyllableLyricsMatcher.primaryArtist(artist)).trim();
        if (!searchQuery.isEmpty()) {
            String searchUrl = "https://lrc.red/search.json?q=" + urlEncode(searchQuery);
            String searchJson = httpGet(searchUrl, "application/json");
            if (searchJson != null) {
                List<String> isrcs = SyllableLyricsMatcher.pickBestLrcRedIsrc(
                        searchJson, title, artist, durationSec);
                for (String candIsrc : isrcs) {
                    if (gen != LATEST_GEN.get()) return null;
                    String candUrl = "https://lrc.red/s/" + candIsrc + ".ttml";
                    if (!triedTtmlUrls.add(candUrl)) {
                        continue;
                    }
                    String xml = httpGet(candUrl, "application/ttml+xml, application/xml, text/xml");
                    if (xml != null) {
                        SyllableLyricsDocument doc = TtmlLyricsParser.parse(xml, "lrc.red");
                        if (isValidSyllableDoc(doc)) {
                            return doc;
                        }
                    }
                }
            }
        }
        if (gen != LATEST_GEN.get()) return null;

        // 4. BetterLyrics TTML (api.betterlyrics.org primary, lyrics-api.boidu.dev fallback)
        StringBuilder blQuery = new StringBuilder()
                .append("?s=").append(urlEncode(title))
                .append("&a=").append(urlEncode(artist));
        if (album != null && !album.trim().isEmpty()) {
            blQuery.append("&al=").append(urlEncode(album.trim()));
        }
        if (durationSec > 0) {
            blQuery.append("&d=").append(durationSec);
        }
        for (String baseEndpoint : BETTER_LYRICS_ENDPOINTS) {
            if (gen != LATEST_GEN.get()) return null;
            String blBody = httpGet(baseEndpoint + blQuery, "application/json");
            if (blBody != null) {
                String ttml = LyricsPlusJsonParser.extractBetterLyricsTtml(blBody);
                if (ttml != null) {
                    SyllableLyricsDocument doc = TtmlLyricsParser.parse(ttml, "BetterLyrics");
                    if (isValidSyllableDoc(doc)) {
                        return doc;
                    }
                }
            }
        }
        if (gen != LATEST_GEN.get()) return null;

        // 5. LyricsPlus / YouLy+ v2 multi-mirror pool
        StringBuilder lpQuery = new StringBuilder()
                .append("?title=").append(urlEncode(title))
                .append("&artist=").append(urlEncode(artist));
        if (album != null && !album.trim().isEmpty()) {
            lpQuery.append("&album=").append(urlEncode(album.trim()));
        }
        if (durationSec > 0) {
            lpQuery.append("&duration=").append(durationSec);
        }
        if (isrc != null) {
            lpQuery.append("&isrc=").append(urlEncode(isrc));
        }
        for (String mirror : LYRICSPLUS_MIRRORS) {
            if (gen != LATEST_GEN.get()) return null;
            String lpBody = httpGet(mirror + lpQuery, "application/json");
            if (lpBody != null) {
                SyllableLyricsDocument doc = LyricsPlusJsonParser.parseLyricsPlus(lpBody, "LyricsPlus");
                if (isValidSyllableDoc(doc)) {
                    return doc;
                }
            }
        }
        if (gen != LATEST_GEN.get()) return null;

        // 6. LRCLIB word-synced YAML lyricsfile (+ capture line-synced LRC as clean fallback)
        StringBuilder lrcGetUrl = new StringBuilder("https://lrclib.net/api/get")
                .append("?track_name=").append(urlEncode(title))
                .append("&artist_name=").append(urlEncode(artist));
        if (album != null && !album.trim().isEmpty()) {
            lrcGetUrl.append("&album_name=").append(urlEncode(album.trim()));
        }
        if (durationSec > 0) {
            lrcGetUrl.append("&duration=").append(durationSec);
        }
        String lrcGetBody = httpGet(lrcGetUrl.toString(), "application/json");
        if (lrcGetBody != null) {
            Map<String, Object> rec = SimpleJsonParser.asMap(SimpleJsonParser.parse(lrcGetBody));
            SyllableLyricsDocument wordDoc = LrclibLyricsParser.parseWordSyncedFromRecord(rec, "LRCLIB");
            if (isValidSyllableDoc(wordDoc)) {
                return wordDoc;
            }
            SyllableLyricsDocument lineDoc = LrclibLyricsParser.parseLineSyncedFromRecord(rec, "LRCLIB");
            if (isValidLineFallbackDoc(lineDoc)) {
                lrclibLineFallback = lineDoc;
            }
        }
        if (gen != LATEST_GEN.get()) return null;

        // LRCLIB metadata search when /api/get missed or lacked word-sync
        String lrcSearchUrl = "https://lrclib.net/api/search?track_name="
                + urlEncode(SyllableLyricsMatcher.cleanTitle(title))
                + "&artist_name=" + urlEncode(SyllableLyricsMatcher.primaryArtist(artist));
        String lrcSearchBody = httpGet(lrcSearchUrl, "application/json");
        if (lrcSearchBody != null) {
            Map<String, Object> bestRec = SyllableLyricsMatcher.pickBestLrclibRecord(
                    lrcSearchBody, title, artist, durationSec, true);
            if (bestRec != null) {
                SyllableLyricsDocument wordDoc = LrclibLyricsParser.parseWordSyncedFromRecord(bestRec, "LRCLIB");
                if (isValidSyllableDoc(wordDoc)) {
                    return wordDoc;
                }
                if (lrclibLineFallback == null) {
                    SyllableLyricsDocument lineDoc = LrclibLyricsParser.parseLineSyncedFromRecord(bestRec, "LRCLIB");
                    if (isValidLineFallbackDoc(lineDoc)) {
                        lrclibLineFallback = lineDoc;
                    }
                }
            }
        }
        if (gen != LATEST_GEN.get()) return null;

        // 7. KuGou KRC syllable-synced lookup
        String kgKeyword = (SyllableLyricsMatcher.cleanTitle(title) + " - "
                + SyllableLyricsMatcher.primaryArtist(artist)).trim();
        if (!kgKeyword.isEmpty()) {
            StringBuilder kgSearchUrl = new StringBuilder("https://lyrics.kugou.com/search?ver=1&man=yes&client=pc&keyword=")
                    .append(urlEncode(kgKeyword));
            if (durationSec > 0) {
                kgSearchUrl.append("&duration=").append(durationSec * 1000L);
            }
            String kgSearchBody = httpGet(kgSearchUrl.toString(), "application/json");
            if (kgSearchBody != null) {
                List<KugouCandidate> candidates = SyllableLyricsMatcher.pickBestKugouCandidates(
                        kgSearchBody, title, artist, durationSec);
                for (KugouCandidate cand : candidates) {
                    if (gen != LATEST_GEN.get()) return null;
                    String kgDlUrl = "https://lyrics.kugou.com/download?ver=1&client=pc&id="
                            + urlEncode(cand.id)
                            + "&accesskey=" + urlEncode(cand.accesskey)
                            + "&fmt=krc&charset=utf8";
                    String kgDlBody = httpGet(kgDlUrl, "application/json");
                    if (kgDlBody != null) {
                        Map<String, Object> dlMap = SimpleJsonParser.asMap(SimpleJsonParser.parse(kgDlBody));
                        String encoded = dlMap != null ? SimpleJsonParser.asString(dlMap.get("content")) : null;
                        String krcText = KugouKrcParser.decodeKrcBase64(encoded);
                        SyllableLyricsDocument doc = KugouKrcParser.parseKrcText(
                                krcText, title, artist, "KuGou");
                        if (isValidSyllableDoc(doc)) {
                            return doc;
                        }
                    }
                }
            }
        }

        // 8. Final fallback: LRCLIB line-synced document (activates in UI only if TIDAL has no lyrics)
        return lrclibLineFallback;
    }

    private static boolean isValidSyllableDoc(SyllableLyricsDocument doc) {
        return doc != null && doc.hasWordOrSyllableTiming && doc.lines != null && !doc.lines.isEmpty();
    }

    private static boolean isValidLineFallbackDoc(SyllableLyricsDocument doc) {
        return doc != null && doc.isLineSynced && doc.lines != null && !doc.lines.isEmpty();
    }

    private static String httpGet(String urlStr, String acceptHeader) {
        String currentUrl = urlStr;
        for (int hop = 0; hop <= MAX_REDIRECT_HOPS; hop++) {
            HttpResult res = executeSingleGet(currentUrl, acceptHeader);
            if (res == null) {
                return null;
            }
            if (res.statusCode >= 200 && res.statusCode < 300) {
                return res.body;
            }
            if ((res.statusCode == 301 || res.statusCode == 302
                    || res.statusCode == 303 || res.statusCode == 307 || res.statusCode == 308)
                    && res.body != null && !res.body.isEmpty() && hop < MAX_REDIRECT_HOPS) {
                currentUrl = res.body;
                continue;
            }
            return null;
        }
        return null;
    }

    private static HttpResult executeSingleGet(String urlStr, String acceptHeader) {
        HttpURLConnection conn = null;
        InputStream is = null;
        try {
            URL url = new URL(urlStr);
            if (!"https".equalsIgnoreCase(url.getProtocol())) {
                return null;
            }
            String host = url.getHost();
            if (host != null) {
                Long until = HOST_COOLDOWN_UNTIL_MS.get(host.toLowerCase(Locale.ROOT));
                if (until != null && System.currentTimeMillis() < until) {
                    return null;
                }
            }

            conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setConnectTimeout(CONNECT_TIMEOUT_MS);
            conn.setReadTimeout(READ_TIMEOUT_MS);
            conn.setInstanceFollowRedirects(false);
            conn.setRequestProperty("User-Agent", USER_AGENT);
            conn.setRequestProperty("Accept", acceptHeader);

            int code = conn.getResponseCode();
            if (code == 429 && host != null) {
                HOST_COOLDOWN_UNTIL_MS.put(
                        host.toLowerCase(Locale.ROOT),
                        System.currentTimeMillis() + RATE_LIMIT_COOLDOWN_MS
                );
                return null;
            }
            if (code == 301 || code == 302 || code == 303 || code == 307 || code == 308) {
                String loc = conn.getHeaderField("Location");
                if (loc == null || loc.trim().isEmpty()) {
                    return null;
                }
                URL resolved = new URL(url, loc.trim());
                if (!"https".equalsIgnoreCase(resolved.getProtocol())) {
                    return null;
                }
                return new HttpResult(code, resolved.toString());
            }
            if (code < 200 || code >= 300) {
                return null;
            }

            is = conn.getInputStream();
            ByteArrayOutputStream baos = new ByteArrayOutputStream(4096);
            byte[] buf = new byte[8192];
            int total = 0;
            int read;
            while ((read = is.read(buf)) != -1) {
                total += read;
                if (total > MAX_RESPONSE_BYTES) {
                    return null;
                }
                baos.write(buf, 0, read);
            }
            return new HttpResult(code, new String(baos.toByteArray(), StandardCharsets.UTF_8));
        } catch (IOException ignored) {
            return null;
        } catch (Throwable ignored) {
            return null;
        } finally {
            if (is != null) {
                try {
                    is.close();
                } catch (IOException ignored) {
                }
            }
            if (conn != null) {
                conn.disconnect();
            }
        }
    }

    private static String urlEncode(String s) {
        if (s == null) return "";
        try {
            return URLEncoder.encode(s, "UTF-8");
        } catch (Throwable t) {
            return s.toLowerCase(Locale.ROOT);
        }
    }
}
