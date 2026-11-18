package app.afterglow.extension.playback;

import app.afterglow.extension.Afterglow;
import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.settings.LiteMode;

/**
 * Video ads for iOS {@code noAds} ("Remove ads", on by default and forced on by Lite Mode;
 * tweak "remove-ads"): while on, YouTube does not load or lay out the ads of a video.
 */
@SuppressWarnings("unused")
public final class VideoAds {
    private VideoAds() {}

    /** Injection point: true skips loading or laying out the ads of a video. */
    public static boolean hideVideoAds() {
        try {
            return InstalledTweaks.has("remove-ads") && LiteMode.effectiveBool("noAds");
        } catch (Throwable error) {
            Afterglow.error("VideoAds.hideVideoAds", error);
            return false;
        }
    }
}
