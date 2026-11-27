package dev.brave.extension.media;

import android.util.Log;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.HashSet;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutorService;
import java.util.regex.Pattern;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 * Clean-room YouTube stream extractor using YouTube's InnerTube /youtubei/v1/player API.
 * Extracts both progressive MP4 streams and adaptive HD video+audio pairs (wired to
 * LocalDownloadRelay's MediaMuxer pipeline), with strict hostname parsing and bounded state.
 */
public final class YouTubeExtractor {
    private static final String TAG = "Brave_YouTubeExtractor";
    private static final String PLAYER_ENDPOINT = "https://www.youtube.com/youtubei/v1/player?prettyPrint=false";
    private static final String UA_ANDROID = "com.google.android.youtube/20.10.38 (Linux; U; Android 14) gzip";
    private static final int MAX_API_RESPONSE_CHARS = 2 * 1024 * 1024; // 2 MB cap
    private static final long DEDUP_WINDOW_MS = 10_000L;
    private static final long ENTRY_TTL_MS = 60_000L;

    private static final Pattern VIDEO_ID_REGEX = Pattern.compile("^[A-Za-z0-9_-]{11}$");

    private static final ExecutorService POOL = NetworkSafety.newBoundedPool(2, 16, "BraveYouTubeExtractor");
    private static final Map<String, Long> IN_FLIGHT = new ConcurrentHashMap<>();

    private YouTubeExtractor() {}

    public static void clearTab(int tabId) {
        String prefix = tabId + ":";
        IN_FLIGHT.keySet().removeIf(k -> k.startsWith(prefix));
    }

    /**
     * Strictly validates hostname against youtube.com / youtu.be domains and extracts
     * the 11-character video ID from /watch?v=..., /shorts/..., /embed/..., /live/..., or youtu.be/...
     */
    public static String extractVideoId(String url) {
        if (url == null || url.isEmpty()) return null;
        try {
            URI uri = URI.create(url.trim());
            String scheme = uri.getScheme();
            if (scheme == null || (!"http".equalsIgnoreCase(scheme) && !"https".equalsIgnoreCase(scheme))) {
                return null;
            }
            String host = NetworkSafety.normalizeHost(uri.getHost());
            if (host == null) return null;

            boolean isYoutubeCom = "youtube.com".equals(host) || host.endsWith(".youtube.com");
            boolean isYoutuBe = "youtu.be".equals(host) || host.endsWith(".youtu.be");
            if (!isYoutubeCom && !isYoutuBe) {
                return null;
            }

            String path = uri.getPath();
            if (path == null) path = "";

            if (isYoutuBe) {
                String[] parts = path.split("/");
                for (String p : parts) {
                    if (!p.isEmpty()) {
                        return VIDEO_ID_REGEX.matcher(p).matches() ? p : null;
                    }
                }
                return null;
            }

            // youtube.com/watch?...&v=VIDEO_ID...
            if ("/watch".equals(path) || path.startsWith("/watch/")) {
                String rawQuery = uri.getRawQuery();
                if (rawQuery != null && !rawQuery.isEmpty()) {
                    String[] pairs = rawQuery.split("&");
                    for (String pair : pairs) {
                        int eq = pair.indexOf('=');
                        if (eq > 0) {
                            String k = pair.substring(0, eq);
                            if ("v".equals(k)) {
                                String val = URLDecoder.decode(pair.substring(eq + 1), "UTF-8");
                                if (VIDEO_ID_REGEX.matcher(val).matches()) {
                                    return val;
                                }
                            }
                        }
                    }
                }
            }

            // youtube.com/shorts/<id>, /embed/<id>, /live/<id>
            String[] segs = path.split("/");
            for (int i = 0; i < segs.length - 1; i++) {
                String seg = segs[i];
                if ("shorts".equals(seg) || "embed".equals(seg) || "live".equals(seg)) {
                    String candidate = segs[i + 1];
                    if (VIDEO_ID_REGEX.matcher(candidate).matches()) {
                        return candidate;
                    }
                }
            }
        } catch (Throwable ignored) {}
        return null;
    }

    public static boolean isYouTubeUrl(String url) {
        return extractVideoId(url) != null;
    }

    public static void resolveAsync(final int tabId, final String pageUrl) {
        final String videoId = extractVideoId(pageUrl);
        if (videoId == null) return;

        final long gen = MediaRegistry.getTabGeneration(tabId);
        final String dedupKey = tabId + ":" + gen + ":" + videoId;
        final long now = System.currentTimeMillis();

        // Opportunistic cleanup of expired keys so IN_FLIGHT stays bounded
        if (IN_FLIGHT.size() > 32) {
            IN_FLIGHT.entrySet().removeIf(e -> (now - e.getValue()) > ENTRY_TTL_MS);
        }

        final Long timestamp = Long.valueOf(now);
        Long prev = IN_FLIGHT.get(dedupKey);
        if (prev != null && (now - prev) < DEDUP_WINDOW_MS) return;
        IN_FLIGHT.put(dedupKey, timestamp);

        try {
            POOL.execute(() -> {
            boolean resolvedAny = false;
            try {
                if (gen != MediaRegistry.getTabGeneration(tabId)) return;
                Log.i(TAG, "Resolving YouTube videoId=" + videoId + " (tab=" + tabId + ", gen=" + gen + ")");

                String title = "YouTube_" + videoId;
                String thumb = "https://i.ytimg.com/vi/" + videoId + "/hqdefault.jpg";

                JSONObject andResp = fetchAndroidPlayerJson(videoId);
                if (andResp == null || gen != MediaRegistry.getTabGeneration(tabId)) return;

                JSONObject vd = andResp.optJSONObject("videoDetails");
                if (vd != null) {
                    String t = vd.optString("title", "");
                    if (!t.isEmpty()) title = t;
                }
                JSONObject sd = andResp.optJSONObject("streamingData");
                if (sd == null) return;

                // 1. Adaptive HD MP4 video streams paired with best M4A audio track (for MediaMuxer HD pipeline)
                JSONArray adaptiveFormats = sd.optJSONArray("adaptiveFormats");
                if (adaptiveFormats != null && adaptiveFormats.length() > 0) {
                    String bestAudioUrl = "";
                    int bestAudioBitrate = -1;
                    long bestAudioSize = 0L;

                    for (int i = 0; i < adaptiveFormats.length(); i++) {
                        JSONObject f = adaptiveFormats.optJSONObject(i);
                        if (f == null) continue;
                        String u = f.optString("url", "");
                        if (u.isEmpty() || u.toLowerCase(Locale.ROOT).contains("sabr=1")) continue;
                        String fullMime = f.optString("mimeType", "").toLowerCase(Locale.ROOT);
                        if (fullMime.startsWith("audio/mp4")) {
                            int bitrate = f.optInt("averageBitrate", f.optInt("bitrate", 0));
                            if (bitrate > bestAudioBitrate) {
                                bestAudioBitrate = bitrate;
                                bestAudioUrl = u;
                                bestAudioSize = parseLongSafe(f.optString("contentLength", "0"));
                            }
                        }
                    }

                    if (!bestAudioUrl.isEmpty()) {
                        Set<String> seenAdaptiveRes = new HashSet<>();
                        for (int i = 0; i < adaptiveFormats.length(); i++) {
                            JSONObject f = adaptiveFormats.optJSONObject(i);
                            if (f == null) continue;
                            String u = f.optString("url", "");
                            if (u.isEmpty() || u.toLowerCase(Locale.ROOT).contains("sabr=1")) continue;
                            String fullMime = f.optString("mimeType", "");
                            String lowerMime = fullMime.toLowerCase(Locale.ROOT);
                            // Prefer H.264/avc1 MP4 adaptive streams (losslessly muxable with M4A via MediaMuxer)
                            if (!lowerMime.startsWith("video/mp4")) continue;
                            if (lowerMime.contains("av01")) continue;
                            int h = f.optInt("height", 0);
                            int w = f.optInt("width", 0);
                            if (h <= 360) continue;
                            String qLabel = f.optString("qualityLabel", h + "p");
                            if (!seenAdaptiveRes.add(qLabel)) continue;
                            long sz = parseLongSafe(f.optString("contentLength", "0")) + bestAudioSize;
                            MediaItem hdItem = new MediaItem(
                                    "yt_" + videoId + "_hd_" + f.optInt("itag", i),
                                    MediaType.VIDEO,
                                    u,
                                    title,
                                    "video/mp4",
                                    sz,
                                    w, h, 0,
                                    UA_ANDROID, "", "", tabId,
                                    thumb,
                                    qLabel + " HD"
                            );
                            hdItem.audioUrl = bestAudioUrl;
                            hdItem.pageUrl = pageUrl;
                            hdItem.cookieSourceUrl = "";
                            MediaRegistry.addMediaItem(tabId, gen, hdItem);
                            resolvedAny = true;
                            Log.i(TAG, "Registered YouTube Adaptive HD MP4+M4A: " + qLabel + " for " + videoId);
                        }
                    }
                }

                // 2. Direct progressive MP4 streams (audio+video muxed)
                JSONArray formats = sd.optJSONArray("formats");
                if (formats != null) {
                    for (int i = formats.length() - 1; i >= 0; i--) {
                        JSONObject f = formats.optJSONObject(i);
                        if (f == null) continue;
                        String u = f.optString("url", "");
                        if (u.isEmpty() || u.toLowerCase(Locale.ROOT).contains("sabr=1")) continue;
                        String mime = f.optString("mimeType", "video/mp4").split(";")[0].trim();
                        String qLabel = f.optString("qualityLabel", "360p");
                        long sz = parseLongSafe(f.optString("contentLength", "0"));
                        int w = f.optInt("width", 640);
                        int h = f.optInt("height", 360);
                        MediaItem progItem = new MediaItem(
                                "yt_" + videoId + "_prog_" + f.optInt("itag", i),
                                MediaType.VIDEO,
                                u,
                                title,
                                mime,
                                sz,
                                w, h, 0,
                                UA_ANDROID, "", "", tabId,
                                thumb,
                                qLabel + " MP4"
                        );
                        progItem.pageUrl = pageUrl;
                        progItem.cookieSourceUrl = "";
                        MediaRegistry.addMediaItem(tabId, gen, progItem);
                        resolvedAny = true;
                        Log.i(TAG, "Registered verified YouTube MP4: " + qLabel + " (" + sz + " bytes) for " + videoId);
                    }
                }

                // 3. HLS manifest if present (e.g. livestreams / premieres)
                String hlsUrl = sd.optString("hlsManifestUrl", "");
                if (!hlsUrl.isEmpty()) {
                    MediaItem hlsItem = new MediaItem(
                            "yt_" + videoId + "_hls",
                            MediaType.HLS_STREAM,
                            hlsUrl,
                            title,
                            "application/x-mpegurl",
                            0, 0, 0, 0,
                            UA_ANDROID, "", "", tabId,
                            thumb,
                            "HLS"
                    );
                    hlsItem.pageUrl = pageUrl;
                    hlsItem.cookieSourceUrl = "";
                    MediaRegistry.addMediaItem(tabId, gen, hlsItem);
                    resolvedAny = true;
                }
            } catch (Throwable t) {
                Log.w(TAG, "YouTube extraction failed for " + videoId, t);
            } finally {
                if (!resolvedAny) {
                    IN_FLIGHT.remove(dedupKey, timestamp);
                }
            }
        });
        } catch (java.util.concurrent.RejectedExecutionException ree) {
            IN_FLIGHT.remove(dedupKey, timestamp);
            Log.w(TAG, "YouTube resolver pool saturated; skipping " + videoId);
        }
    }

    private static JSONObject fetchAndroidPlayerJson(String videoId) {
        HttpURLConnection conn = null;
        try {
            JSONObject client = new JSONObject();
            client.put("clientName", "ANDROID");
            client.put("clientVersion", "20.10.38");
            client.put("androidSdkVersion", 34);
            client.put("osName", "Android");
            client.put("osVersion", "14");
            client.put("hl", "en");
            client.put("gl", "US");

            JSONObject ctx = new JSONObject();
            ctx.put("client", client);
            JSONObject payload = new JSONObject();
            payload.put("videoId", videoId);
            payload.put("context", ctx);

            URL u = new URL(PLAYER_ENDPOINT);
            conn = (HttpURLConnection) u.openConnection();
            conn.setRequestMethod("POST");
            conn.setConnectTimeout(12000);
            conn.setReadTimeout(12000);
            conn.setInstanceFollowRedirects(false);
            conn.setDoOutput(true);
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setRequestProperty("User-Agent", UA_ANDROID);
            conn.setRequestProperty("Accept-Encoding", "gzip");

            byte[] bytes = payload.toString().getBytes(StandardCharsets.UTF_8);
            conn.setFixedLengthStreamingMode(bytes.length);
            try (OutputStream os = conn.getOutputStream()) {
                os.write(bytes);
                os.flush();
            }

            if (conn.getResponseCode() == 200) {
                String encoding = conn.getHeaderField("Content-Encoding");
                String body = NetworkSafety.readTextBounded(conn.getInputStream(), encoding, MAX_API_RESPONSE_CHARS);
                return new JSONObject(body);
            }
        } catch (Throwable t) {
            Log.w(TAG, "InnerTube ANDROID fetch failed: " + t.getMessage());
        } finally {
            if (conn != null) conn.disconnect();
        }
        return null;
    }

    private static long parseLongSafe(String s) {
        try {
            return Long.parseLong(s);
        } catch (Throwable ignored) {
            return 0L;
        }
    }
}
