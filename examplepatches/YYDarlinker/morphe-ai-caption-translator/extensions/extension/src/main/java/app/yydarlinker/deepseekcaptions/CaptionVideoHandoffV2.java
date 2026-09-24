package app.yydarlinker.deepseekcaptions;

import android.content.Context;
import android.net.Uri;
import android.os.SystemClock;

/**
 * Keeps caption-on intent across videos without carrying a video's temporary Auto-translate target.
 *
 * <p>A language chosen from YouTube's Auto-translate menu belongs to that video only. When a real
 * video-id change happens while AI captions are still active, the next video's first Timed Text
 * request is allowed to restore the configured default AI target exactly once. This includes the
 * ordinary source-language request YouTube commonly emits when it reopens native English/Japanese
 * captions on the new video.</p>
 */
final class CaptionVideoHandoffV2 {
    private static final long WINDOW_MS = 12_000L;

    private static volatile String currentVideoId = "";
    private static volatile String pendingVideoId = "";
    private static volatile long pendingUntilMs;

    private CaptionVideoHandoffV2() {}

    static void onVideoId(String value) {
        String next = value == null ? "" : value.trim();
        if (next.isEmpty()) return;
        String previous = currentVideoId;
        currentVideoId = next;
        if (previous.isEmpty() || previous.equals(next)) return;

        // Native/source-track choices are video-local. A native track selected on the old video
        // must not suppress the configured AI default on the new video; only caption ON/OFF intent
        // crosses the boundary.
        if (CaptionAddonSupport.memoryInstalled() && CaptionChoice.isOn()) {
            arm(next);
        } else {
            clearPending();
        }
    }

    /** Explicit native-caption choices beat any pending new-video default restoration. */
    static void onExplicitNativeSelection() {
        clearPending();
    }

    /** Completes a pending handoff after the new video reaches a concrete AI target. */
    static void noteAiTarget(String url) {
        if (pendingVideoId.isEmpty()) return;
        String video = videoId(url);
        if (video.isEmpty() || pendingVideoId.equals(video)) clearPending();
    }

    /**
     * Restore the configured default AI target on the new video's first caption request.
     *
     * <p>This is deliberately one-shot and video-bound. Unlike dev26, it does not continuously
     * reroute every non-Chinese source request while captions are on, so player/lifecycle rebuilds
     * cannot create a repeated activate/deactivate loop.</p>
     */
    static String restoreForNextVideo(Context context, String url) {
        if (context == null || url == null || pendingVideoId.isEmpty() ||
                !DeepSeekCaptionHook.isYouTubeTimedTextUrl(url)) {
            return url;
        }

        long now = SystemClock.elapsedRealtime();
        if (now > pendingUntilMs) {
            clearPending();
            return url;
        }

        String requestedVideo = videoId(url);
        if (!requestedVideo.isEmpty() && !pendingVideoId.equals(requestedVideo)) return url;

        // A long-press menu on the new video is explicit current-video authority. Do not replace
        // that choice with the configured AI default.
        if (!CaptionButtonController.mayActivateAiTarget()) {
            clearPending();
            return url;
        }

        String defaultCode = DeepSeekConfig.defaultTargetLanguage(context);
        clearPending();
        if (defaultCode == null || defaultCode.trim().isEmpty()) return url;

        TargetLanguage currentTarget = TargetLanguage.fromUrl(url);
        String cleanDefault = defaultCode.trim();
        if (currentTarget != null && currentTarget.code.equalsIgnoreCase(cleanDefault)) return url;

        // Source-only lang=en/ja/... is intentionally eligible here. The AI runtime fetches that
        // source track directly and uses tlang only as the extension's target marker; YouTube's
        // transient native-caption choice therefore cannot steal display ownership on a video switch.
        return TargetLanguage.withCode(url, cleanDefault);
    }

    private static void arm(String videoId) {
        pendingVideoId = videoId == null ? "" : videoId.trim();
        pendingUntilMs = pendingVideoId.isEmpty()
                ? 0L
                : SystemClock.elapsedRealtime() + WINDOW_MS;
    }

    private static void clearPending() {
        pendingVideoId = "";
        pendingUntilMs = 0L;
    }

    private static String videoId(String url) {
        try {
            Uri uri = Uri.parse(url);
            String value = uri.getQueryParameter("v");
            if (value == null || value.isEmpty()) value = uri.getQueryParameter("video_id");
            return value == null ? "" : value.trim();
        } catch (Throwable ignored) {
            return "";
        }
    }
}
