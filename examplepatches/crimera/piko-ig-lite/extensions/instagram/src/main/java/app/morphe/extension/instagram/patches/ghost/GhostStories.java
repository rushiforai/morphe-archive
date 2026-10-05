/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */
package app.morphe.extension.instagram.patches.ghost;

import app.morphe.extension.instagram.settings.Settings;

/** Injection points of the story ghost hook. */
@SuppressWarnings("unused")
public final class GhostStories {
    private GhostStories() {
    }

    /** Read every time a seen request is built, so the toggle applies to the next batch. */
    public static boolean hideStoryViews() {
        return Settings.ghostStories();
    }
}
