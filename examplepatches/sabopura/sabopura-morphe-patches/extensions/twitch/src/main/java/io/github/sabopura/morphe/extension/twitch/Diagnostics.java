package io.github.sabopura.morphe.extension.twitch;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.os.Build;
import android.util.Log;

import java.util.ArrayList;
import java.util.List;

import io.github.sabopura.morphe.extension.twitch.app.CrashGuard;
import io.github.sabopura.morphe.extension.twitch.ui.Features;

/**
 * Failures the patch caught to keep Twitch running, where they mean a hook's assumption about Twitch broke.
 * Each place is logged once and listed in the settings, so a hook a new Twitch version broke is seen
 * instead of failing in silence. Kept for this run of the app only.
 */
public final class Diagnostics {
    private static final String TAG = "SabopuraTwitch";
    private static final FailureLog LOG = new FailureLog(64, System::currentTimeMillis);

    private Diagnostics() {
    }

    /**
     * Records {@code failure} at {@code place}, a short name that stays the same across versions. Called from
     * the catch blocks that keep Twitch running, so it never throws.
     */
    public static void note(String place, Throwable failure) {
        try {
            FailureLog.Place first = LOG.record(place, failure);
            if (first != null) Log.w(TAG, first.line());
        } catch (Throwable ignored) {
        }
    }

    /** How many places failed since the app started. */
    public static int places() {
        return LOG.size();
    }

    /** Versions, applied patches and the places, to paste into a bug report. Nothing about the account. */
    public static String report(Context context) {
        List<String> about = new ArrayList<>();
        about.add("Sabopura Twitch diagnostics");
        String bundle = Features.patchVersion();
        about.add("Patch bundle: " + (bundle.isEmpty() ? "unknown" : bundle));
        about.add("Twitch: " + twitchVersion(context));
        about.add("Android: " + Build.VERSION.RELEASE + " (SDK " + Build.VERSION.SDK_INT + ")");
        about.add("Device: " + Build.MANUFACTURER + " " + Build.MODEL);
        if (CrashGuard.paused()) about.add("Patch features are paused after repeated crashes at start");
        // The long list of patches goes last, so the result is read without scrolling.
        String applied = Features.appliedNames();
        return FailureLog.format(about, LOG.places(), LOG.unrecorded())
                + "\n\nPatches: " + (applied.isEmpty() ? "none" : applied.replace(",", ", "));
    }

    /** Twitch's version name and code, as the app reports them. */
    @SuppressWarnings("deprecation")
    public static String twitchVersion(Context context) {
        try {
            PackageInfo info = context.getPackageManager().getPackageInfo(context.getPackageName(), 0);
            long code = Build.VERSION.SDK_INT >= 28 ? info.getLongVersionCode() : info.versionCode;
            return info.versionName + " (" + code + ")";
        } catch (Exception e) {
            return "unknown";
        }
    }
}
