/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.loki.extension;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.os.Bundle;

import java.util.ArrayList;
import java.util.List;

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
        List<String[]> rows = new ArrayList<>();
        if (pkg.startsWith("com.Splitwise.SplitwiseMobile")) {
            rows.add(new String[]{"Enable premium features (Splitwise)", flag(flags, "app.loki.menu.premium")});
            rows.add(new String[]{"Hide Pro ads and upsells", flag(flags, "app.loki.menu.proads")});
            rows.add(new String[]{"AMOLED black (Splitwise)", flag(flags, "app.loki.menu.amoled")});
            rows.add(new String[]{"GmsCore support (Splitwise)", flag(flags, "app.loki.menu.gmscore")});
        } else if (pkg.startsWith("com.truecaller")) {
            rows.add(new String[]{"Enable premium features (Truecaller)", flag(flags, "app.loki.menu.premium")});
            rows.add(new String[]{"Hide ads (Truecaller)", flag(flags, "app.loki.menu.hideads")});
            rows.add(new String[]{"Hide after-call screen", flag(flags, "app.loki.menu.aftercall")});
            rows.add(new String[]{"Anonymous profile viewing", flag(flags, "app.loki.menu.anonview")});
            rows.add(new String[]{"Anonymous search", flag(flags, "app.loki.menu.anonsearch")});
            rows.add(new String[]{"GmsCore support (Truecaller)", flag(flags, "app.loki.menu.gmscore")});
        } else if (pkg.startsWith("com.mxtech.videoplayer")) {
            rows.add(new String[]{"All codecs", flag(flags, "app.loki.menu.codec")});
            rows.add(new String[]{"Skip license check", flag(flags, "app.loki.menu.license")});
            rows.add(new String[]{"GmsCore support (MX Player Pro)", flag(flags, "app.loki.menu.gmscore")});
        } else {
            rows.add(new String[]{"Enable premium features (Doc Scanner)", flag(flags, "app.loki.menu.premium")});
            rows.add(new String[]{"Hide ads (Doc Scanner)", flag(flags, "app.loki.menu.hideads")});
            rows.add(new String[]{"Declutter", flag(flags, "app.loki.menu.declutter")});
            rows.add(new String[]{"GmsCore support (Doc Scanner)", flag(flags, "app.loki.menu.gmscore")});
            rows.add(new String[]{"Allow clone", flag(flags, "app.loki.menu.allowclone")});
        }
        // The universal patches run on every app, so their rows are appended here instead of being retyped per
        // app - one copy means an app cannot quietly lose a row the others have.
        rows.add(new String[]{"Remove ads and trackers", flag(flags, "app.loki.menu.ads")});
        rows.add(new String[]{"Block advertising ID", flag(flags, "app.loki.menu.adid")});
        rows.add(new String[]{"Remove analytics and crash reporting", flag(flags, "app.loki.menu.analytics")});
        rows.add(new String[]{"Change package name", flag(flags, "app.loki.menu.clone")});
        return rows.toArray(new String[0][]);
    }

    private static String flag(Bundle flags, String key) {
        return flags.getBoolean(key, false) ? "true" : "false";
    }
}
