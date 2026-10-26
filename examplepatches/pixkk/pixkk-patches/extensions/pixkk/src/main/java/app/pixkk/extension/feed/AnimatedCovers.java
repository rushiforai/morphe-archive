/*
 * Copyright 2026 pixkk
 */
package app.pixkk.extension.feed;

import app.pixkk.extension.core.Settings;

/**
 * Turns on the animated cover in a profile grid's cells. The server turns it off; the covers
 * themselves still arrive with each video.
 */
public final class AnimatedCovers {
    private AnimatedCovers() {
    }

    /**
     * @param stored what TikTok read for its {@code use_dynamic_cover} switch.
     * @return true when the setting is on, otherwise what TikTok read.
     */
    public static boolean keepOn(boolean stored) {
        return stored || Settings.ANIMATED_PROFILE_COVERS.get();
    }

    /**
     * @param drop what TikTok answered when asked whether to drop the animated cover.
     * @return false while the setting is on, otherwise what TikTok answered.
     */
    public static boolean keepDropOff(boolean drop) {
        return drop && !Settings.ANIMATED_PROFILE_COVERS.get();
    }

    /** @return true when a profile grid cell should show the animated cover. */
    public static boolean useOnProfileGrid() {
        return Settings.ANIMATED_PROFILE_COVERS.get();
    }
}
