/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */
package app.morphe.extension.instagram.patches.ads;

import app.morphe.extension.instagram.settings.Settings;

/** Injection points of the reels and stories ad hook. */
@SuppressWarnings("unused")
public final class ReelsAndStoriesAds {
    private ReelsAndStoriesAds() {
    }

    /** Read on every ad injection, so the toggle applies from the next one. */
    public static boolean hideAds() {
        return Settings.hideReelsAndStoriesAds();
    }
}
