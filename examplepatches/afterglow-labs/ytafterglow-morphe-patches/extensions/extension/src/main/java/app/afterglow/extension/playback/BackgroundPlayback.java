/*
 * YTAfterglow for Android.
 *
 * Adapted from the BackgroundPlaybackPatch class of Morphe patches v2.2.0
 * (https://github.com/MorpheApp/morphe-patches, GPLv3), which was forked from ReVanced
 * patches (https://github.com/ReVanced/revanced-patches, GPLv3). Modified for
 * YTAfterglow: driven by the iOS setting backgroundPlayback, without the screen lock
 * auto pause. Not an official Morphe or ReVanced file.
 */

package app.afterglow.extension.playback;

import app.afterglow.extension.Afterglow;
import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.settings.LiteMode;
import app.afterglow.extension.video.PlayerType;
import app.afterglow.extension.video.VideoState;

/**
 * iOS {@code backgroundPlayback} ("Background playback", on by default; tweak
 * "background-playback"). iOS answers YouTube's "playable in background" with the setting,
 * for every video. Here the setting on allows background playback of regular videos, Shorts
 * and videos made for kids, and offers YouTube's own Background play option.
 *
 * <p>With the setting off, YouTube's own decision is kept, so YouTube Premium background play
 * and YouTube's Background play setting keep working. (iOS answers "no" when off, which also
 * blocks Premium; Android keeps that choice in YouTube's own setting instead.)
 */
@SuppressWarnings("unused")
public final class BackgroundPlayback {
    private static final String TWEAK = "background-playback";
    private static final String KEY = "backgroundPlayback";

    private BackgroundPlayback() {}

    /** Injection point: the setting is on and the tweak installed. */
    public static boolean isEnabled() {
        try {
            return InstalledTweaks.has(TWEAK) && LiteMode.effectiveBool(KEY);
        } catch (Throwable error) {
            Afterglow.error("BackgroundPlayback.isEnabled", error);
            return false;
        }
    }

    /**
     * Injection point: YouTube's background check for regular videos. A muted feed preview
     * or a Short in the Shorts player (which has its own check) never counts as the watch page.
     */
    public static boolean isBackgroundPlaybackAllowed(boolean original) {
        try {
            if (original || !isEnabled()) return original;
            if (VideoState.isShortsPlayerInFront()) return false;
            PlayerType type = VideoState.playerType();
            return !type.isNoneOrHidden() && type != PlayerType.INLINE_MINIMAL;
        } catch (Throwable error) {
            Afterglow.error("BackgroundPlayback.isBackgroundPlaybackAllowed", error);
            return original;
        }
    }

    /** Injection point: YouTube's background check for Shorts. */
    public static boolean isBackgroundShortsPlaybackAllowed(boolean original) {
        try {
            return original || isEnabled();
        } catch (Throwable error) {
            Afterglow.error("BackgroundPlayback.isBackgroundShortsPlaybackAllowed", error);
            return original;
        }
    }

    /** Injection point: the Shorts background playback flag. */
    public static boolean enableFeatureFlag(boolean original) {
        try {
            return original || isEnabled();
        } catch (Throwable error) {
            Afterglow.error("BackgroundPlayback.enableFeatureFlag", error);
            return original;
        }
    }

    /**
     * Injection point: resuming playback when the app returns to the foreground. Off while
     * background playback is allowed, so a video paused from the notification stays paused.
     */
    public static boolean isAutomaticForegroundPlaybackAllowed(boolean original) {
        try {
            return original && !isEnabled();
        } catch (Throwable error) {
            Afterglow.error("BackgroundPlayback.isAutomaticForegroundPlaybackAllowed", error);
            return original;
        }
    }
}
