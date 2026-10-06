/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.media;

import android.content.pm.ActivityInfo;

/** Turn off HDR brightness, asked from tests in other packages. */
public final class HdrBrightnessForTests {
    private HdrBrightnessForTests() {
    }

    /** Whether a request for an HDR window comes out as one for the default colour mode. */
    public static boolean keepsAnHdrWindowInTheUsualRange() {
        return HdrBrightness.colorMode(ActivityInfo.COLOR_MODE_HDR) == ActivityInfo.COLOR_MODE_DEFAULT;
    }

    /** Whether a headroom Facebook asks for comes out as none. */
    public static boolean holdsTheHeadroom() {
        return HdrBrightness.headroom(4f) == HdrBrightness.NO_HEADROOM;
    }
}
