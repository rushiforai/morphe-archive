/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */
package app.morphe.extension.instagram.patches.ghost;

import app.morphe.extension.instagram.settings.Settings;

/** Injection points of the instant ghost hook. */
@SuppressWarnings("unused")
public final class GhostInstants {
    private GhostInstants() {
    }

    /** Read every time a seen update is about to be sent, so the toggle applies to the next one. */
    public static boolean hideInstantViews() {
        return Settings.ghostInstants();
    }
}
