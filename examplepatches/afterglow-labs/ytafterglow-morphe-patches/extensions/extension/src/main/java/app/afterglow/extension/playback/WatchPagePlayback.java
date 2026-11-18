/*
 * YTAfterglow for Android.
 *
 * Adapted from the DisableContinueWatchingPromptPatch, HideEndScreenCardsPatch,
 * HideRelatedVideoOverlayPatch and HideEndScreenSuggestedVideoPatch classes of Morphe
 * patches v2.2.0 (https://github.com/MorpheApp/morphe-patches, GPLv3). Modified for
 * YTAfterglow: driven by the iOS settings. Not an official Morphe file.
 */

package app.afterglow.extension.playback;

import android.view.View;

import app.afterglow.extension.Afterglow;
import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.settings.LiteMode;

/**
 * Playback parts of the iOS "watch-page" tweak. Lite Mode forces all three on, as on iOS.
 *
 * <ul>
 *   <li>{@code noContinueWatchingPrompt} ("Hide resume-video prompt"): the "Are you still
 *       watching?" prompt that pauses long sessions never shows.</li>
 *   <li>{@code hideEndScreenCards} ("Hide end-screen cards"): the creator's end screen cards
 *       are hidden.</li>
 *   <li>{@code noRelatedVids} ("Hide end-screen related videos"): the related videos YouTube
 *       shows on the player when a video ends are hidden.</li>
 * </ul>
 */
@SuppressWarnings("unused")
public final class WatchPagePlayback {
    private static final String TWEAK = "watch-page";

    private WatchPagePlayback() {}

    private static boolean on(String key) {
        return InstalledTweaks.has(TWEAK) && LiteMode.effectiveBool(key);
    }

    /** Injection point: elapsed time compared with the inactivity limit; -1 means "not yet". */
    public static int adjustInactivityComparison(int comparison) {
        try {
            return on("noContinueWatchingPrompt") ? -1 : comparison;
        } catch (Throwable error) {
            Afterglow.error("WatchPagePlayback.adjustInactivityComparison", error);
            return comparison;
        }
    }

    /** Injection point: true skips the "Continue watching?" confirmation. */
    public static boolean hideContinueWatchingPrompt() {
        try {
            return on("noContinueWatchingPrompt");
        } catch (Throwable error) {
            Afterglow.error("WatchPagePlayback.hideContinueWatchingPrompt", error);
            return false;
        }
    }

    /** Injection point: an end screen card view was inflated. */
    public static void hideEndScreenCardView(View view) {
        try {
            if (view != null && on("hideEndScreenCards")) view.setVisibility(View.GONE);
        } catch (Throwable error) {
            Afterglow.error("WatchPagePlayback.hideEndScreenCardView", error);
        }
    }

    /** Injection point: true skips showing the end screen cards. */
    public static boolean hideEndScreenCards() {
        try {
            return on("hideEndScreenCards");
        } catch (Throwable error) {
            Afterglow.error("WatchPagePlayback.hideEndScreenCards", error);
            return false;
        }
    }

    /** Injection point: true skips the related videos shown on the player at the end. */
    public static boolean hideRelatedVideos() {
        try {
            return on("noRelatedVids");
        } catch (Throwable error) {
            Afterglow.error("WatchPagePlayback.hideRelatedVideos", error);
            return false;
        }
    }
}
