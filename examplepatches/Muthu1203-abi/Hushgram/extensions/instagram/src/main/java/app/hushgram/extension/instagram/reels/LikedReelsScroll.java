/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.reels;

import app.hushgram.extension.instagram.settings.FamilyNames;
import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.diagnostics.HookStatus;
import app.hushgram.extension.shared.settings.HushgramPause;

/** Uses Instagram's clips-specific liked feed when a liked reel opens in the full-screen viewer. */
public final class LikedReelsScroll {
    private static final String CLIPS_LIKED_SOURCE = "CLIPS_FEED_LIKED";

    private LikedReelsScroll() {
    }

    /** Returns Instagram's clips-liked source for this selected patch. */
    public static Object source(Object original) {
        try {
            if (original == null || HushgramPause.isPaused() || !Settings.LIKED_REELS_SCROLL.get()) return original;

            Object[] sources = original.getClass().getEnumConstants();
            if (sources == null) return original;
            for (Object source : sources) {
                if (source instanceof Enum && CLIPS_LIKED_SOURCE.equals(((Enum<?>) source).name())) return source;
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.LIKED_REELS_SCROLL, "liked reels source", failure);
        }
        return original;
    }

    /**
     * The viewer source for a reel opened from a Your activity screen of [type]: the liked feed for
     * the Likes screen, Instagram's own otherwise. The type is logged so a screen Instagram renames
     * can be found in logcat (tag HushGram).
     */
    public static Object activityCenterSource(Object original, String type) {
        try {
            android.util.Log.i("HushGram", "Liked reels: Your activity reel opened from type=" + type);
            if (!likesScreen(type)) return original;
            HookStatus.invoked(FamilyNames.LIKED_REELS_SCROLL);
            return source(original);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.LIKED_REELS_SCROLL, "activity center source", failure);
            return original;
        }
    }

    /**
     * The one-item cache key for a reel opened from a Your activity screen of [type]. Null on the
     * Likes screen, so the viewer loads the liked feed from that reel instead of stopping at it.
     */
    public static String activityCenterCache(String key, String type) {
        try {
            if (likesScreen(type) && !HushgramPause.isPaused() && Settings.LIKED_REELS_SCROLL.get()) return null;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.LIKED_REELS_SCROLL, "activity center cache", failure);
        }
        return key;
    }

    private static boolean likesScreen(String type) {
        return type != null && type.toLowerCase(java.util.Locale.ROOT).contains("like");
    }
}
