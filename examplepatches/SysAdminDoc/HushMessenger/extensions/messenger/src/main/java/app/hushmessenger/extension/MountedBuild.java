package app.hushmessenger.extension;

import android.app.ActivityManager;
import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.widget.Toast;

/**
 * Catches a Root Mount over a different Messenger build (#158). Root Mount keeps the installed app's package info and
 * manifest and mounts the patched APK's code and resources over it. Builds that share a version name still number their
 * resources differently, so the installed manifest's theme can point at a layout in the patched build's table, and
 * Messenger crashes when chat heads open their menu. Android's version code, the build HushMessenger was patched from and
 * the mounted APK's own manifest tell the cases apart.
 */
final class MountedBuild {
    private MountedBuild() {}

    /** "installed|patchedFrom" once a mismatch is found, "" when the builds match, null before the first check. Tests set it. */
    static volatile String result;

    /**
     * True when Android has a different build installed than the one HushMessenger was patched from, and the APK
     * that's running isn't that installed build either. A normal install with Spoof package version reports a raised
     * code, but its own manifest says the same, so it's no mismatch. An APK that couldn't be read proves nothing.
     */
    static boolean mismatched(long installed, long patchedFrom, long mounted) {
        return installed > 0 && patchedFrom > 0 && mounted > 0 && installed != patchedFrom && installed != mounted;
    }

    /** "installed|patchedFrom" for a mismatch, else "". The running APK is read only when the two codes differ. */
    static String compare(long installed, long patchedFrom, java.util.function.LongSupplier mounted) {
        if (installed <= 0 || patchedFrom <= 0 || installed == patchedFrom) return "";
        long running = mounted.getAsLong();
        if (!mismatched(installed, patchedFrom, running)) return "";
        Log.w("HushMessenger", "Android has Messenger " + installed + " installed, but this was patched from " + patchedFrom
            + " and the running APK says " + running + ". Patch " + installed + " for Root Mount.");
        return installed + "|" + patchedFrom;
    }

    /** The installed and patched-from codes when they don't match, else null. Checked once per process. */
    static long[] find(Context context) {
        String known = result;
        if (known == null) {
            known = "";
            try {
                PackageManager packages = context.getPackageManager();
                long installed = packages.getPackageInfo(context.getPackageName(), 0).getLongVersionCode();
                String apk = context.getApplicationInfo().sourceDir;
                known = compare(installed, OwnVersion.originalCode(HostScreens.originalBuild()), () -> {
                    PackageInfo archive = packages.getPackageArchiveInfo(apk, 0);
                    return archive == null ? 0 : archive.getLongVersionCode();
                });
            } catch (PackageManager.NameNotFoundException | RuntimeException e) {
                Log.w("HushMessenger", "Couldn't compare the installed and patched builds", e);
            }
            result = known;
        }
        if (known.isEmpty()) return null;
        int split = known.indexOf('|');
        return new long[] {Long.parseLong(known.substring(0, split)), Long.parseLong(known.substring(split + 1))};
    }

    /** The settings and Copy setup text for a mismatch, or null when the builds match or haven't been checked yet. */
    static String notice(SettingsText text) {
        String known = result;
        if (known == null || known.isEmpty()) return null;
        int split = known.indexOf('|');
        return text.get("mounted_build_mismatch", Long.parseLong(known.substring(split + 1)), Long.parseLong(known.substring(0, split)));
    }

    /** Runs once per process from the Root Mount start, off the UI thread, and says so while Messenger is on screen. */
    static void check(Context context) {
        if (find(context) == null) return;
        ActivityManager.RunningAppProcessInfo state = new ActivityManager.RunningAppProcessInfo();
        ActivityManager.getMyMemoryState(state);
        if (state.importance > ActivityManager.RunningAppProcessInfo.IMPORTANCE_FOREGROUND) return;
        new Handler(Looper.getMainLooper()).post(() -> {
            String message = notice(new SettingsText(context));
            if (message != null) Toast.makeText(context, message, Toast.LENGTH_LONG).show();
        });
    }

    /** Forgets the result, for tests. */
    static void reset() {
        result = null;
    }
}
