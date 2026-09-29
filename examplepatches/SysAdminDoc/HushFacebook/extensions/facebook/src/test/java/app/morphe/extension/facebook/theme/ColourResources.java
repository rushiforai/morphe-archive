/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.theme;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.Resources;

import org.robolectric.RuntimeEnvironment;

import java.util.Map;

/** Stands in for Facebook's colour resources: a context whose colour ids give the values listed. */
final class ColourResources {
    private ColourResources() {}

    /** The #252728 Facebook 580's Video tab bar reads, the colour resource its dark style uses. */
    static final int VIDEO_BAR = 0x7f0601f4;

    static Context context(Map<Integer, Integer> colours) {
        Context base = RuntimeEnvironment.getApplication();
        Resources real = base.getResources();
        @SuppressWarnings("deprecation")
        Resources listed = new Resources(real.getAssets(), real.getDisplayMetrics(), real.getConfiguration()) {
            @Override
            public int getColor(int id, Theme theme) {
                Integer colour = colours.get(id);
                return colour != null ? colour : super.getColor(id, theme);
            }

            @SuppressWarnings("deprecation")
            @Override
            public int getColor(int id) {
                return getColor(id, null);
            }
        };
        return new ContextWrapper(base) {
            @Override
            public Resources getResources() {
                return listed;
            }
        };
    }
}
