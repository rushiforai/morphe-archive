package com.waze.gw;

import android.content.Context;

/**
 * Runtime gate of the Mod's features. The Waze build is checked by the patch (the patched app is the Waze version
 * the hooks were made for), so this always reports the build as trusted; there is no native check library.
 */
final class RuntimeState {
    private RuntimeState() { }

    static boolean a(Context context) {
        return true;
    }
}
