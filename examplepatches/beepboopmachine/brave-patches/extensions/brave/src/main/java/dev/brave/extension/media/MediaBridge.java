package dev.brave.extension.media;

import android.net.Uri;
import android.util.Log;
import android.webkit.JavascriptInterface;
import dev.brave.extension.core.ActiveTabTracker;
import java.lang.ref.WeakReference;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.ExecutorService;
import org.chromium.content_public.browser.WebContents;
import org.json.JSONObject;

/**
 * Per-tab @JavascriptInterface bridge bound strictly to a single (tabId, WebContents, origin, token).
 * Validates caller token, originating frame origin, SSRF boundaries, scheme-safe cookie isolation,
 * strict-origin-when-cross-origin referrers, and per-tab capacity before scheduling native work.
 */
public class MediaBridge {
    private static final String TAG = "Brave_MediaBridge";
    private static final int MAX_PLAYLIST_CHARS = 4 * 1024 * 1024; // 4M chars strict cap
    private static final int MAX_JSON_PAYLOAD_CHARS = 64 * 1024; // 64 KB cap
    private static final ExecutorService PARSER_POOL = NetworkSafety.newBoundedPool(2, 32, "BraveHlsParser");

    private final int mBoundTabId;
    private final WeakReference<WebContents> mWebContentsRef;
    private final String mBoundOrigin;
    private final String mBridgeToken;

    public MediaBridge() {
        this(-1, null, "", "");
    }

    public MediaBridge(int boundTabId, WebContents webContents, String boundOrigin, String bridgeToken) {
        this.mBoundTabId = boundTabId;
        this.mWebContentsRef = new WeakReference<>(webContents);
        this.mBoundOrigin = boundOrigin != null ? boundOrigin : "";
        this.mBridgeToken = bridgeToken != null ? bridgeToken : "";
    }

    private boolean isAuthorized(String token) {
        if (mBridgeToken.isEmpty()) {
            return false; // Require token-bound bridge instance
        }
        if (token == null || token.isEmpty()) {
            return false;
        }
        if (mWebContentsRef.get() == null) {
            return false;
        }
        return MessageDigest.isEqual(
                mBridgeToken.getBytes(StandardCharsets.UTF_8),
                token.getBytes(StandardCharsets.UTF_8)
        );
    }

    private int resolveBoundTabId() {
        if (mBoundTabId >= 0) return mBoundTabId;
        int tabId = ActiveTabTracker.getActiveTabId();
        return tabId >= 0 ? tabId : 0;
    }

    @JavascriptInterface
    public void onPageUrlChanged(String token, String newUrl) {
        if (!isAuthorized(token)) {
            Log.w(TAG, "Rejected unauthorized onPageUrlChanged call");
            return;
        }
        if (newUrl == null || newUrl.isEmpty()) return;
        // An SPA history change must stay within this bridge's bound origin
        if (!mBoundOrigin.isEmpty() && !NetworkSafety.isSameOrigin(mBoundOrigin, newUrl)) {
            Log.w(TAG, "Rejected cross-origin onPageUrlChanged: " + newUrl + " (bound=" + mBoundOrigin + ")");
            return;
        }
        int tabId = resolveBoundTabId();
        Log.i(TAG, "SPA/Page URL changed on tab " + tabId + ": " + newUrl);
        IframeStreamResolver.clearTab(tabId);
        YouTubeExtractor.clearTab(tabId);
        MediaRegistry.advanceGenerationAndClear(tabId, newUrl, false);
        if (YouTubeExtractor.isYouTubeUrl(newUrl)) {
            YouTubeExtractor.resolveAsync(tabId, newUrl);
        }
    }

    @JavascriptInterface
    public boolean isCategoryFull(String token, String typeStr) {
        if (!isAuthorized(token)) return false;
        int tabId = resolveBoundTabId();
        MediaType type = "IMAGE".equalsIgnoreCase(typeStr) ? MediaType.IMAGE : MediaType.VIDEO;
        return !MediaRegistry.canAcceptMedia(tabId, type);
    }

    @JavascriptInterface
    public void onIframeDetected(String token, String iframeUrl, String pageUrl) {
        if (!isAuthorized(token)) {
            Log.w(TAG, "Rejected unauthorized onIframeDetected call");
            return;
        }
        if (iframeUrl == null || iframeUrl.isEmpty()) return;
        String effectivePage = (pageUrl != null && !pageUrl.isEmpty() && NetworkSafety.isSameOrigin(mBoundOrigin, pageUrl))
                ? pageUrl : mBoundOrigin;
        int tabId = resolveBoundTabId();
        if (!MediaRegistry.canAcceptMedia(tabId, MediaType.VIDEO)) {
            return;
        }
        if (!NetworkSafety.isAllowedTargetUrl(iframeUrl, effectivePage)) {
            return;
        }
        Log.i(TAG, "onIframeDetected: " + iframeUrl + " (page=" + effectivePage + ", tab=" + tabId + ")");
        IframeStreamResolver.resolveIframeAsync(iframeUrl, effectivePage, tabId);
    }

    @JavascriptInterface
    public void onMediaFound(String token, String jsonString) {
        if (!isAuthorized(token)) {
            Log.w(TAG, "Rejected unauthorized onMediaFound call");
            return;
        }
        if (jsonString == null || jsonString.isEmpty() || jsonString.length() > MAX_JSON_PAYLOAD_CHARS) return;

        try {
            JSONObject obj = new JSONObject(jsonString);
            String url = obj.optString("url", "").trim();
            if (url.isEmpty()) return;

            String urlLower = url.toLowerCase(Locale.ROOT);
            if (!urlLower.startsWith("http://") && !urlLower.startsWith("https://")) {
                return;
            }
            // Filter out un-downloadable YouTube SABR / raw googlevideo page-sniffer URLs (YouTubeExtractor provides verified streams)
            if (urlLower.contains("googlevideo.com/videoplayback")) {
                return;
            }

            String rawReferer = obj.optString("referer", "").trim();
            String effectivePageUrl = (!rawReferer.isEmpty() && NetworkSafety.isSameOrigin(mBoundOrigin, rawReferer))
                    ? rawReferer
                    : mBoundOrigin;

            if (!NetworkSafety.isAllowedTargetUrl(url, effectivePageUrl)) {
                return;
            }

            String typeStr = obj.optString("type", "VIDEO").toUpperCase(Locale.ROOT);
            String title = obj.optString("title", "");
            String rawMime = obj.optString("mimeType", "");
            String mimeType = NetworkSafety.sanitizeMimeType(rawMime, "");
            if (rawMime.isEmpty()) mimeType = "";
            long size = obj.optLong("size", 0);
            int width = obj.optInt("width", 0);
            int height = obj.optInt("height", 0);
            long duration = obj.optLong("duration", 0);
            String userAgent = obj.optString("userAgent", "");
            String thumbnail = obj.optString("thumbnail", "");
            String quality = obj.optString("quality", "");
            if (quality.isEmpty()) quality = obj.optString("label", "");
            if (quality.isEmpty()) quality = obj.optString("res", "");

            MediaType type = classifyMediaType(urlLower, typeStr, mimeType);
            final int capturedTabId = resolveBoundTabId();
            if (!MediaRegistry.canAcceptMedia(capturedTabId, type)) {
                return;
            }

            // Apply strict-origin-when-cross-origin Referer and scheme+host Cookie isolation
            String safeReferer = NetworkSafety.computeSafeReferer(effectivePageUrl, url);
            String rawCookie = obj.optString("cookie", "");
            String safeCookie = NetworkSafety.computeSafeCookie(rawCookie, effectivePageUrl, url);

            final long capturedGen = MediaRegistry.getTabGeneration(capturedTabId);

            Log.i(TAG, "onMediaFound: " + type + " -> " + url + " (tab=" + capturedTabId + ", gen=" + capturedGen + ", quality=" + quality + ")");

            final MediaItem item = new MediaItem(
                    url, type, url, title, mimeType, size, width, height, duration,
                    userAgent, safeCookie, safeReferer, capturedTabId, thumbnail, quality
            );
            item.cookieSourceUrl = safeCookie.isEmpty() ? "" : effectivePageUrl;
            item.pageUrl = effectivePageUrl;

            if (type == MediaType.HLS_STREAM) {
                try {
                    PARSER_POOL.execute(() -> {
                        if (capturedGen != MediaRegistry.getTabGeneration(capturedTabId)) return;
                        if (!MediaRegistry.canAcceptMedia(capturedTabId, MediaType.HLS_STREAM)) return;
                        try {
                            NetworkSafety.TextFetchResult res = NetworkSafety.fetchTextStrict(
                                    item.url, item.userAgent, item.cookie, item.cookieSourceUrl,
                                    item.pageUrl, item.pageUrl, MAX_PLAYLIST_CHARS, 8000
                            );
                            if (res != null && res.body != null && !res.body.isEmpty()) {
                                String playlistContent = res.body;
                                if (HlsParser.hasUnsupportedEncryption(playlistContent)) {
                                    Log.i(TAG, "Ignoring DRM/unsupported encrypted HLS stream: " + item.url);
                                    return;
                                }
                                if (HlsParser.isIFramesOnlyPlaylist(playlistContent)) {
                                    Log.i(TAG, "Ignoring I-frames-only HLS playlist: " + item.url);
                                    return;
                                }
                                List<MediaItem.HlsVariant> variants = HlsParser.parseMasterPlaylist(res.finalUrl, playlistContent);
                                Collections.sort(variants);
                                item.variants.addAll(variants);
                            }
                        } catch (Throwable t) {
                            Log.w(TAG, "Failed parsing HLS master playlist for " + item.url, t);
                        }
                        MediaRegistry.addMediaItem(capturedTabId, capturedGen, item);
                    });
                } catch (java.util.concurrent.RejectedExecutionException ree) {
                    Log.w(TAG, "HLS parser pool full; registering unparsed item for " + item.url);
                    MediaRegistry.addMediaItem(capturedTabId, capturedGen, item);
                }
            } else {
                boolean added = MediaRegistry.addMediaItem(capturedTabId, capturedGen, item);
                if (added && type == MediaType.VIDEO && item.sizeBytes <= 0) {
                    IframeStreamResolver.probeContentLengthAsync(item);
                }
            }
        } catch (Throwable t) {
            Log.e(TAG, "Error handling onMediaFound payload", t);
        }
    }

    private static MediaType classifyMediaType(String urlLower, String typeStr, String mimeType) {
        if (urlLower.contains(".m3u8") || typeStr.contains("HLS") || mimeType.contains("mpegurl")) {
            return MediaType.HLS_STREAM;
        }
        if (urlLower.contains(".mpd") || typeStr.contains("DASH") || mimeType.contains("dash+xml")) {
            return MediaType.DASH_STREAM;
        }
        if ("IMAGE".equals(typeStr) || (mimeType.startsWith("image/") && !mimeType.equals("image/gif"))) {
            return MediaType.IMAGE;
        }
        if ("AUDIO".equals(typeStr) || mimeType.startsWith("audio/")) {
            return MediaType.AUDIO;
        }
        if (urlLower.contains(".gifv") || "VIDEO".equals(typeStr) || mimeType.startsWith("video/")) {
            return MediaType.VIDEO;
        }
        if (mimeType.equals("image/gif") || urlLower.contains(".gif")) {
            return "VIDEO".equals(typeStr) ? MediaType.VIDEO : MediaType.IMAGE;
        }
        return MediaType.VIDEO;
    }

    public static void checkAndRegisterDirectMedia(int tabId, String url, String stage) {
        if (url == null || url.isEmpty()) return;
        String lower = url.toLowerCase(Locale.ROOT);
        if (!lower.startsWith("http://") && !lower.startsWith("https://")) return;

        if (YouTubeExtractor.isYouTubeUrl(url)) {
            YouTubeExtractor.resolveAsync(tabId >= 0 ? tabId : 0, url);
            return;
        }

        MediaType type = null;
        if (lower.contains(".m3u8") || lower.contains("/hls/") || lower.contains("master.m3u8") || lower.contains("playlist.m3u8")) {
            type = MediaType.HLS_STREAM;
        } else if (lower.contains(".mpd") || lower.contains("/dash/")) {
            type = MediaType.DASH_STREAM;
        } else if (lower.contains(".mp4") || lower.contains(".webm") || lower.contains(".m4v") || lower.contains(".mov")
                || lower.contains(".mkv") || lower.contains(".avi") || lower.contains(".flv") || lower.contains(".f4v")
                || lower.contains(".3gp") || lower.contains(".ogv") || lower.contains(".wmv") || lower.contains(".gifv")
                || lower.contains("videoplayback")) {
            type = MediaType.VIDEO;
        } else if (lower.contains(".mp3") || lower.contains(".m4a") || lower.contains(".aac") || lower.contains(".ogg")
                || lower.contains(".opus") || lower.contains(".flac") || lower.contains(".wav") || lower.contains(".weba")) {
            type = MediaType.AUDIO;
        } else if (lower.contains(".jpg") || lower.contains(".jpeg") || lower.contains(".png") || lower.contains(".webp")
                || lower.contains(".gif") || lower.contains(".avif") || lower.contains(".bmp") || lower.contains(".heic")
                || lower.contains(".heif") || lower.contains(".svg")) {
            type = MediaType.IMAGE;
        }

        if (type != null) {
            final int targetTab = tabId >= 0 ? tabId : 0;
            if (!MediaRegistry.canAcceptMedia(targetTab, type)) return;
            final long capturedGen = MediaRegistry.getTabGeneration(targetTab);
            Log.i(TAG, "Direct media detected during " + stage + ": tab=" + targetTab + ", " + type + " -> " + url);
            String title = extractTitleFromUrl(url);
            final MediaItem item = new MediaItem(
                    url, type, url, title, "", 0, 0, 0, 0,
                    "", "", url, targetTab
            );
            item.pageUrl = url;
            item.cookieSourceUrl = "";
            if (type == MediaType.HLS_STREAM) {
                try {
                    PARSER_POOL.execute(() -> {
                        if (capturedGen != MediaRegistry.getTabGeneration(targetTab)) return;
                        if (!MediaRegistry.canAcceptMedia(targetTab, MediaType.HLS_STREAM)) return;
                        try {
                            NetworkSafety.TextFetchResult res = NetworkSafety.fetchTextStrict(
                                    item.url, item.userAgent, item.cookie, item.cookieSourceUrl,
                                    item.pageUrl, item.pageUrl, MAX_PLAYLIST_CHARS, 8000
                            );
                            if (res != null && res.body != null && !res.body.isEmpty()) {
                                String playlistContent = res.body;
                                if (HlsParser.hasUnsupportedEncryption(playlistContent)) {
                                    Log.i(TAG, "Ignoring DRM/unsupported encrypted HLS stream: " + item.url);
                                    return;
                                }
                                if (HlsParser.isIFramesOnlyPlaylist(playlistContent)) {
                                    Log.i(TAG, "Ignoring I-frames-only HLS playlist: " + item.url);
                                    return;
                                }
                                List<MediaItem.HlsVariant> variants = HlsParser.parseMasterPlaylist(res.finalUrl, playlistContent);
                                Collections.sort(variants);
                                item.variants.addAll(variants);
                            }
                        } catch (Throwable t) {
                            Log.w(TAG, "Failed parsing HLS master playlist for " + item.url, t);
                        }
                        MediaRegistry.addMediaItem(targetTab, capturedGen, item);
                    });
                } catch (java.util.concurrent.RejectedExecutionException ree) {
                    Log.w(TAG, "HLS parser pool full; registering unparsed item for " + item.url);
                    MediaRegistry.addMediaItem(targetTab, capturedGen, item);
                }
            } else {
                MediaRegistry.addMediaItem(targetTab, capturedGen, item);
            }
        }
    }

    private static String extractTitleFromUrl(String url) {
        try {
            Uri uri = Uri.parse(url);
            String last = uri.getLastPathSegment();
            if (last != null && !last.isEmpty()) return last;
        } catch (Throwable ignored) {}
        return "Stream_" + Math.abs(url.hashCode() % 100000);
    }
}
