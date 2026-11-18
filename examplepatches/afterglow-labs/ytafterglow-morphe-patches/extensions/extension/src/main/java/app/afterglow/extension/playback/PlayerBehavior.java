package app.afterglow.extension.playback;

import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.settings.LiteMode;

/** Settings gates for the native seek and cinematic renderer boundaries. */
public final class PlayerBehavior {
    private PlayerBehavior() {}

    /** Keep the native track visible without changing its animator or control state. */
    public static float progressVisibility(float nativeFraction) {
        return InstalledTweaks.has("seek-bar") && LiteMode.effectiveBool("persistentProgressBar")
                ? 1f : nativeFraction;
    }

    /** Hide only the most-replayed graph; native seeking and previews stay available. */
    public static boolean hideHeatwaves() {
        return InstalledTweaks.has("seek-bar") && LiteMode.effectiveBool("hideHeatwaves");
    }

    /** Use the native skip-display branch so the message queue still receives its callbacks. */
    public static boolean hideHudMessages(boolean nativeSkip) {
        return nativeSkip || (InstalledTweaks.has("player-overlay")
                && LiteMode.effectiveBool("noHUDMsgs"));
    }

    /** Keep native Advanced requests; Classic mode promotes only the quick-menu choice. */
    public static boolean useClassicQualityMenu(boolean nativeAdvanced) {
        return nativeAdvanced || (InstalledTweaks.has("video-quality")
                && LiteMode.effectiveBool("classicQuality"));
    }

    public static boolean rememberLoop() {
        return InstalledTweaks.has("loop") && LiteMode.effectiveBool("rememberLoop");
    }

    public static boolean showEndTime() {
        return InstalledTweaks.has("video-end-time") && LiteMode.effectiveBool("videoEndTime");
    }

    public static boolean portraitFullscreen() {
        return InstalledTweaks.has("fullscreen") && LiteMode.effectiveBool("portraitFullscreen");
    }

    public static boolean autoFullscreen() {
        return InstalledTweaks.has("fullscreen") && LiteMode.effectiveBool("autoFullscreen");
    }

    public static boolean exitFullscreen() {
        return InstalledTweaks.has("fullscreen") && LiteMode.effectiveBool("exitFullscreen");
    }

    public static boolean tapToSeek() {
        return InstalledTweaks.has("player-gestures") && LiteMode.effectiveBool("tapToSeek");
    }

    /** Scrub release uses the finger's position, independently of chapter double-taps. */
    public static boolean disableChapterSnap() {
        return InstalledTweaks.has("player-gestures") && LiteMode.effectiveBool("dontSnapToChapter");
    }

    /** Native classification keeps ordinary seeking and two-finger chapter skips independent. */
    public static boolean blockDoubleTap(boolean chapterSeek) {
        return InstalledTweaks.has("player-gestures") && LiteMode.effectiveBool(
                chapterSeek ? "noTwoFingerSnapToChapter" : "noDoubleTapToSeek");
    }

    public static boolean disableFreeZoom() {
        return InstalledTweaks.has("player-gestures") && LiteMode.effectiveBool("noFreeZoom");
    }

    /** Use YouTube's own fill-only path, without changing its saved zoom capability. */
    public static boolean allowFreeZoom(boolean nativeEnabled) {
        return nativeEnabled && !disableFreeZoom();
    }

    public static boolean disableAmbientMode() {
        return InstalledTweaks.has("ambient-mode") && LiteMode.effectiveBool("disableAmbientMode");
    }
}
