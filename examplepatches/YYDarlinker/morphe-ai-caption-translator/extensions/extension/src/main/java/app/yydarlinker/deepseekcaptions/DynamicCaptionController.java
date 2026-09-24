package app.yydarlinker.deepseekcaptions;

import android.app.Activity;
import android.content.Context;

/**
 * Compatibility facade kept for the existing Morphe/YouTube bytecode hooks.
 *
 * <p>Page-span runtime v1: the legacy cue-by-cue scheduler and post-translation splitters are gone.
 * All runtime work now lives in {@link PageCaptionController}, whose semantic unit is an AI-planned
 * final page spanning untouched YouTube time atoms.</p>
 */
final class DynamicCaptionController {
    private DynamicCaptionController() {}

    static boolean isVisibleActive() {
        return PageCaptionController.isVisibleActive();
    }

    static void deactivateFromCaptionButton() {
        PageCaptionController.deactivateFromCaptionButton();
    }

    static void deactivateFromNativeCaptionState() {
        PageCaptionController.deactivateFromNativeCaptionState();
    }

    static void setMainActivity(Activity activity) {
        PageCaptionController.setMainActivity(activity);
    }

    static void onPlayerType(String rawType) {
        PageCaptionController.onPlayerType(rawType);
    }

    static String restoreTargetAfterMiniplayer(String url) {
        return PageCaptionController.restoreTargetAfterMiniplayer(url);
    }

    static void onVideoId(String videoId) {
        PageCaptionController.onVideoId(videoId);
    }

    static void refreshConfiguration(Context context) {
        PageCaptionController.refreshConfiguration(context);
    }

    static void activate(Context context, String translatedUrl) {
        PageCaptionController.activate(context, translatedUrl);
    }

    static void prewarm(Context context, String sourceUrl) {
        PageCaptionController.prewarm(context, sourceUrl);
    }

    static void observeTimedTextUrl(String url) {
        PageCaptionController.observeTimedTextUrl(url);
    }

    static void onVideoTime(long timeMs) {
        PageCaptionController.onVideoTime(timeMs);
    }
}
