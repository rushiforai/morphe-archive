package app.yydarlinker.deepseekcaptions;

import android.app.Activity;
import android.content.Context;
import android.net.Uri;
import android.util.Base64;
import android.widget.ImageView;

import java.nio.charset.StandardCharsets;

/** Adds a one-shot new-video default target handoff around the stable caption hook. */
public final class DeepSeekCaptionHookV2 {
    private static volatile Context appContext;

    private DeepSeekCaptionHookV2() {}

    public static void setMainActivity(Activity activity) {
        if (activity != null) {
            appContext = activity.getApplicationContext();
            BackgroundPauseGovernor.setContext(appContext);
        }
        MediaPlaybackClock.activity(activity);
        CaptionMusicSuppressor.setActivity(activity);
        DeepSeekCaptionHook.setMainActivity(activity);
        CaptionMusicSuppressor.kick();
    }

    public static void onVideoId(String videoId) {
        MediaPlaybackClock.video(videoId);
        BackgroundPauseGovernor.onVideoId(videoId);
        // Observe the old video's ON/OFF intent before the stable controller tears down its session.
        CaptionVideoHandoffV2.onVideoId(videoId);
        DeepSeekCaptionHook.onVideoId(videoId);
        CaptionMusicSuppressor.forceNativeRendererScan();
    }

    public static void onPlayerType(Enum<?> playerType) {
        DeepSeekCaptionHook.onPlayerType(playerType);
        // YouTube can rebuild subtitle windows during fullscreen/miniplayer transitions while the
        // previous renderer View remains attached. Force one player-local recheck; the existing
        // transition guard still owns the visual animation and this adds no independent timer.
        CaptionMusicSuppressor.forceNativeRendererScan();
        CaptionMusicSuppressor.kick();
    }

    /**
     * Exact YouTube player-CC controller callback supplied by the Morphe-stable fingerprint.
     * Defer extension binding until the controller method has returned so YouTube gets the last word
     * on this update's own listener/state setup; our observer then reads only the final settled View.
     */
    public static void onNativeCaptionButtonController(ImageView button) {
        if (button == null) return;
        button.post(() -> CaptionButtonController.onNativeCaptionButtonController(button));
    }

    public static void onVideoTime(long timeMs) {
        MediaPlaybackClock.raw();
        BackgroundPauseGovernor.onVideoTime(timeMs);
        long presentationTimeMs = SemanticCaptionTimeline.presentationTime(timeMs);
        DeepSeekCaptionHook.onVideoTime(presentationTimeMs);
        CaptionMusicSuppressor.kick();
    }

    public static String rewriteUrl(Object cronetEngine, String originalUrl) {
        Context context = appContext;
        boolean aiEnabled = context != null && DeepSeekConfig.load(context).enabled;

        String selectedUrl = originalUrl;
        if (aiEnabled) {
            // The outer wrapper only owns cross-video default restoration. Native/source-track
            // authority is decided exactly once inside DeepSeekCaptionHook, after this handoff gate.
            // A long-press menu makes mayActivateAiTarget() false, so the handoff yields cleanly.
            selectedUrl = CaptionVideoHandoffV2.restoreForNextVideo(context, originalUrl);
        }

        String rewritten = DeepSeekCaptionHook.rewriteUrl(cronetEngine, selectedUrl);
        // DeepSeekCaptionHook activates the visible AI session synchronously before returning the
        // loopback URL. Recheck the native renderer immediately so it is masked before FIRST_AI_READY
        // rather than waiting for the next ~1-second player-time callback.
        CaptionMusicSuppressor.forceNativeRendererScan();
        CaptionMusicSuppressor.kick();

        if (aiEnabled) {
            String concreteAiUrl = concreteAiUrl(selectedUrl, rewritten);
            if (!concreteAiUrl.isEmpty()) CaptionVideoHandoffV2.noteAiTarget(concreteAiUrl);

            if (originalUrl != null && !originalUrl.equals(selectedUrl)) {
                TargetLanguage target = TargetLanguage.fromUrl(selectedUrl);
                CaptionDiagnostics.mark(
                        context,
                        "VIDEO_DEFAULT_AI_RESTORED",
                        "切换到新视频后恢复默认 AI 字幕" +
                                (target == null ? "" : "；目标 " + target.promptLabel())
                );
            }
        }
        return rewritten;
    }

    private static String concreteAiUrl(String selectedUrl, String rewrittenUrl) {
        String decoded = decodeLoopbackTarget(rewrittenUrl);
        if (!decoded.isEmpty()) return decoded;
        if (DeepSeekCaptionHook.isYouTubeTimedTextUrl(selectedUrl) &&
                TargetLanguage.fromUrl(selectedUrl) != null) {
            return selectedUrl;
        }
        return "";
    }

    private static String decodeLoopbackTarget(String value) {
        if (value == null || value.isEmpty()) return "";
        try {
            Uri uri = Uri.parse(value);
            if (!"127.0.0.1".equals(uri.getHost())) return "";
            String encoded = uri.getQueryParameter("u");
            if (encoded == null || encoded.isEmpty()) return "";
            byte[] bytes = Base64.decode(
                    encoded,
                    Base64.URL_SAFE | Base64.NO_WRAP | Base64.NO_PADDING
            );
            String decoded = new String(bytes, StandardCharsets.UTF_8);
            if (!DeepSeekCaptionHook.isYouTubeTimedTextUrl(decoded) ||
                    TargetLanguage.fromUrl(decoded) == null) {
                return "";
            }
            return decoded;
        } catch (Throwable ignored) {
            return "";
        }
    }
}
