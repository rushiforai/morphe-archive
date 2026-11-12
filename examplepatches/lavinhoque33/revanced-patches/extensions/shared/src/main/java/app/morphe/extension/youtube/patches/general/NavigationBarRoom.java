/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-06.
 * Modified by lavinhoque33, 2026-11-10.
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

    /** First Android version (14, API 34) that draws the blurred background of the navigation bar. */
    public static final int MINIMUM_BLUR_SDK = 34;

    /**
     * @param sdk                  The Android version of the device.
     * @param hardwareAccelerated  If the canvas is hardware accelerated, which the blur is drawn for.
     * @param blurLeftOutByStyle   If the navigation bar style leaves the blur out, which is a translucent color.
     * @return If the blurred background of the navigation bar is drawn.
     */
    public static boolean useBlur(int sdk, boolean hardwareAccelerated, boolean blurLeftOutByStyle) {
        return sdk >= MINIMUM_BLUR_SDK && hardwareAccelerated && !blurLeftOutByStyle;
    }
}
