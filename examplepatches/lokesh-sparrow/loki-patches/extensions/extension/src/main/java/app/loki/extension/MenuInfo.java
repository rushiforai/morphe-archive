/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.loki.extension;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.os.Bundle;

/** What the menu screen is allowed to know: brand, and which patches wrote a flag into the manifest. */
public final class MenuInfo {
    public static final String BRAND = "Loki Patches";
    public static final String AUTHOR = "Lokesh Sparrow";
    public static final String GITHUB = "https://github.com/lokesh-sparrow/loki-patches";
    public static final String REPO = "lokesh-sparrow/loki-patches";

    private MenuInfo() {
    }

    /** Replaced at patch time with the bundle version. Left as "dev" if that step did not run. */
    public static String patchesVersion() {
        return "dev";
    }

    public static Bundle flags(Context context) {
        try {
            ApplicationInfo info = context.getPackageManager().getApplicationInfo(
                    context.getPackageName(), PackageManager.GET_META_DATA);
            return info.metaData != null ? info.metaData : new Bundle();
        } catch (Exception e) {
            return new Bundle();
        }
    }

    public static boolean on(Context context, String key) {
        return flags(context).getBoolean(key, false);
    }

    /**
     * The patches this bundle has for the app the screen is running in, with whether each was applied. The
     * flags are written into the manifest by the patches themselves, so this is what was really patched.
     * The package may carry the Change package name suffix, so it is matched by prefix.
     */
    public static String[][] patches(Context context) {
        Bundle flags = flags(context);
        String pkg = context.getPackageName();
        if (pkg.startsWith("com.Splitwise.SplitwiseMobile")) {
            return new String[][]{
                    {"Enable premium features (Splitwise)", flag(flags, "app.loki.menu.premium")},
                    {"Hide Pro ads and upsells", flag(flags, "app.loki.menu.proads")},
                    {"AMOLED black (Splitwise)", flag(flags, "app.loki.menu.amoled")},
                    {"Remove analytics and crash reporting", flag(flags, "app.loki.menu.analytics")},
                    {"GmsCore support (Splitwise)", flag(flags, "app.loki.menu.gmscore")},
                    {"Change package name", flag(flags, "app.loki.menu.clone")},
                    {"Remove ads and trackers", flag(flags, "app.loki.menu.ads")},
            };
        }
        if (pkg.startsWith("com.truecaller")) {
            return new String[][]{
                    {"Enable premium features (Truecaller)", flag(flags, "app.loki.menu.premium")},
                    {"GmsCore support (Truecaller)", flag(flags, "app.loki.menu.gmscore")},
                    {"Change package name", flag(flags, "app.loki.menu.clone")},
                    {"Remove ads and trackers", flag(flags, "app.loki.menu.ads")},
            };
        }
        return new String[][]{
                {"Enable premium features", flag(flags, "app.loki.menu.premium")},
                {"Remove ads and trackers", flag(flags, "app.loki.menu.ads")},
                {"Declutter", flag(flags, "app.loki.menu.declutter")},
                {"GmsCore support (Doc Scanner)", flag(flags, "app.loki.menu.gmscore")},
                {"Change package name", flag(flags, "app.loki.menu.clone")},
                {"Allow clone", flag(flags, "app.loki.menu.allowclone")},
        };
    }

    private static String flag(Bundle flags, String key) {
        return flags.getBoolean(key, false) ? "true" : "false";
    }
}
