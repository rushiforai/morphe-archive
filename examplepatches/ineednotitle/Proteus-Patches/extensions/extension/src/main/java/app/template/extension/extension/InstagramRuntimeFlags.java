/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * Adapted from https://github.com/crimera/piko (GPL-3.0).
 * See META-INF/PROTEUS-NOTICE.txt for GPLv3 §7(b) terms.
 */

package app.template.extension.extension;

/**
 * Android-free snapshot of the Instagram preferences.
 *
 * <p>{@link InstagramSettings} refreshes this on load and whenever a setting
 * changes. Keeping the hot paths here means request hooks, MobileConfig
 * overrides and the URL blocker do not need a {@code Context}, and the whole
 * group can be tested with plain {@code javac}.</p>
 */
@SuppressWarnings("unused")
public final class InstagramRuntimeFlags {
    private static volatile boolean chronologicalFeed = true;
    private static volatile boolean ghostMode;
    private static volatile boolean ghostHideTyping = true;
    private static volatile boolean ghostHideDmSeen = true;
    private static volatile boolean ghostHideStorySeen = true;
    private static volatile boolean reelsPlaybackSpeed = true;
    private static volatile boolean reelsSeekControls = true;
    private static volatile String likeAnimation = InstagramLikeAnimations.DEFAULT;

    private InstagramRuntimeFlags() {
    }

    public static void update(
            boolean chronologicalFeedValue,
            boolean ghostModeValue,
            boolean ghostHideTypingValue,
            boolean ghostHideDmSeenValue,
            boolean ghostHideStorySeenValue,
            boolean reelsPlaybackSpeedValue,
            boolean reelsSeekControlsValue,
            String likeAnimationValue
    ) {
        chronologicalFeed = chronologicalFeedValue;
        ghostMode = ghostModeValue;
        ghostHideTyping = ghostHideTypingValue;
        ghostHideDmSeen = ghostHideDmSeenValue;
        ghostHideStorySeen = ghostHideStorySeenValue;
        reelsPlaybackSpeed = reelsPlaybackSpeedValue;
        reelsSeekControls = reelsSeekControlsValue;
        likeAnimation = likeAnimationValue == null
                ? InstagramLikeAnimations.DEFAULT
                : likeAnimationValue;
    }

    public static boolean isChronologicalFeedEnabled() {
        return chronologicalFeed;
    }

    public static boolean isGhostModeEnabled() {
        return ghostMode;
    }

    public static boolean shouldHideTyping() {
        return ghostMode && ghostHideTyping;
    }

    public static boolean shouldHideDmSeen() {
        return ghostMode && ghostHideDmSeen;
    }

    public static boolean shouldHideStorySeen() {
        return ghostMode && ghostHideStorySeen;
    }

    public static boolean isReelsPlaybackSpeedEnabled() {
        return reelsPlaybackSpeed;
    }

    public static boolean isReelsSeekControlsEnabled() {
        return reelsSeekControls;
    }

    public static String getLikeAnimation() {
        return likeAnimation;
    }

    /**
     * Runtime MobileConfig overrides. Returning {@code null} leaves the value to
     * the static override map added by the individual patches.
     */
    public static Boolean overrideMobileConfig(String configId) {
        if (configId == null) {
            return null;
        }

        switch (configId) {
            case "108494::0":
                // p92_android_ranked_following_feed:is_enabled
                return chronologicalFeed ? Boolean.FALSE : Boolean.TRUE;

            case "109947::0":
            case "109947::2":
                // Reels overflow menu playback speed.
                return reelsPlaybackSpeed ? Boolean.TRUE : Boolean.FALSE;

            case "118405::1":
            case "118405::5":
            case "118405::6":
                // Reels double-tap seek controls.
                return reelsSeekControls ? Boolean.TRUE : Boolean.FALSE;

            case "85450::68":
            case "85450::69":
            case "115516::0":
            case "115516::1":
            case "99511::0":
                // Direct typing indicators.
                return shouldHideTyping() ? Boolean.FALSE : Boolean.TRUE;

            default:
                return null;
        }
    }
}
