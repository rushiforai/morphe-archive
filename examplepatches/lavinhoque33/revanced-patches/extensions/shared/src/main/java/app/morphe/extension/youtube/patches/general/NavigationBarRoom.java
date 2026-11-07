/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-06.
 */
package app.morphe.extension.youtube.patches.general;

/** Pure decisions shared by the floating navigation bar and its inset hooks. */
public final class NavigationBarRoom {
    private NavigationBarRoom() {
    }

    public static boolean isEnabled(boolean glass, boolean opaque, boolean hidden) {
        return glass && !opaque && !hidden;
    }

    public static int keyboardRoom(boolean enabled, boolean keyboardVisible, int original, int systemBars) {
        return enabled && keyboardVisible ? Math.min(original, systemBars) : original;
    }
}
