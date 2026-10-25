/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.shared;

import android.content.Context;
import app.morphe.extension.shared.diagnostics.BuildDetails;

/**
 * Resource names written for one build of the host app.
 *
 * <p>TikTok's build shortens most resource names to two or three characters and hands the same
 * short names out again on every build, mostly to other views: {@code g8a} is the like button on
 * 47.4.3 and something else on another build. A name written {@code "47.4.3:g8a"} is 47.4.3's
 * name and resolves on 47.4.3 alone, so a build the bundle doesn't declare never finds the wrong
 * view under it, and a list can carry each supported build's name for one view. A name with no
 * build in front is a real name, the same on every build.
 *
 * <p>The builds are TikTok's. PineDrama reports TikTok's version names, but its resource table is
 * its own and hands the same short names to unrelated views, so a build's name never resolves
 * there (#156).
 *
 * <p>A copy of TikTok that Morphe's Clone app renamed for Run beside the store app runs under
 * another package with TikTok's resource table, so the build asset's target package, which the
 * patcher read before any patch changed the manifest, says whose names resolve (#209).
 */
public final class BuildNames {
    /** The app whose builds the names are written for. */
    static final String NAMED_APP = "com.zhiliaoapp.musically";

    private static volatile String runningBuild;
    private static volatile String runningApp;

    /**
     * The entry name to look up in the running app, or null when the name is another build's or
     * the app isn't TikTok.
     */
    public static String entryName(String name) {
        int colon = name.indexOf(':');
        if (colon < 0) return name;
        String build = runningBuild();
        return build == null || !NAMED_APP.equals(runningApp) ? null : entryName(name, build);
    }

    /** The entry name to look up on [build], or null when the name is another build's. */
    static String entryName(String name, String build) {
        int colon = name.indexOf(':');
        if (colon < 0) return name;
        return name.regionMatches(0, build, 0, colon) && build.length() == colon ? name.substring(colon + 1) : null;
    }

    /**
     * The host app's version name, read once it can be. Null until the extension has a context,
     * and then not remembered, so an early lookup can't pin "no build" for the life of the process.
     */
    public static String runningBuild() {
        String build = runningBuild;
        if (build != null) return build;
        Context context = Utils.context;
        if (context == null) return null;
        String app = context.getPackageName();
        try {
            build = context.getPackageManager().getPackageInfo(app, 0).versionName;
        } catch (Throwable error) {
            return null;
        }
        if (build != null) {
            // The app first: a reader that sees the build sees its app.
            runningApp = namedApp(app, BuildDetails.targetPackage(BuildDetails.readMetadata(context)));
            runningBuild = build;
        }
        return build;
    }

    /**
     * The app the running package was patched from (see {@link #namedApp}), or null until the
     * extension has a context.
     */
    public static String runningApp() {
        return runningBuild() == null ? null : runningApp;
    }

    /**
     * The app whose names the running package resolves: the package the bundle patched when the
     * build asset names one, since a renamed copy keeps that app's resource table (#209), and the
     * running package when there's no record to go on.
     */
    static String namedApp(String runningPackage, String targetPackage) {
        return targetPackage != null ? targetPackage : runningPackage;
    }

    /** Stands in for TikTok's version name in a test; null reads it again. */
    public static void setRunningBuildForTests(String build) {
        setRunningAppForTests(NAMED_APP, build);
    }

    /** Stands in for the host app and its version name in a test; a null build reads both again. */
    public static void setRunningAppForTests(String app, String build) {
        runningApp = app;
        runningBuild = build;
    }

    private BuildNames() {}
}
