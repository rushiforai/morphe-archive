package app.wazeytm.extension.waze;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.util.Log;

import com.waze.sdk.SdkConfiguration;

import app.wazeytm.extension.waze.settings.MorpheSettings;

import java.util.Arrays;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Waze only accepts audio partners whose package name is on the server side
 * partner list (see {@code SdkConfiguration.updateAppList()}). A repackaged
 * YouTube Music app (e.g. {@code app.morphe.android.apps.youtube.music}) is
 * therefore rejected, although it ships the unchanged Waze audio SDK client.
 * <p>
 * This class adds every installed, repackaged YouTube Music app to that list
 * by cloning the server entry of {@link #ORIGINAL_PACKAGE}.
 */
@SuppressWarnings("unused")
public final class PatchedYouTubeMusicSupportPatch {
    private static final String TAG = "WazePatchedYTMusic";

    private static final String ORIGINAL_PACKAGE = "com.google.android.apps.youtube.music";

    /**
     * Receiver declared by YouTube Music for the Waze audio SDK. Repackaging keeps
     * the class name, so it identifies YouTube Music independent of the package name.
     */
    private static final String YT_MUSIC_WAZE_RECEIVER =
            "com.google.android.apps.youtube.music.mediabrowser.waze.MusicWazeBroadcastReceiver";

    private static final String ACTION_AUDIO_SDK_INIT = "com.waze.sdk.audio.ACTION_INIT";

    /**
     * {@code SdkConfiguration.FEATURE_AUDIO}. Only used if the server list
     * has no YouTube Music entry to copy the scope from.
     */
    private static final int FALLBACK_SCOPE_FEATURE_AUDIO = 0x200000;

    /**
     * Patched package name -> original package name.
     */
    private static final Map<String, String> aliases = new ConcurrentHashMap<>();

    /**
     * Comma separated package names. The method body is replaced by the patch with the
     * value of the patch option.
     */
    private static String getConfiguredPackageNames() {
        return "app.morphe.android.apps.youtube.music";
    }

    /**
     * Injection point. Called by {@code SdkConfiguration.updateAppList()} directly after the
     * partner list was loaded from native code and before it's converted into app configs.
     */
    public static void onSdkConfigurationLoaded(SdkConfiguration config) {
        try {
            if (!MorpheSettings.isEnabled(MorpheSettings.Feature.PATCHED_YOUTUBE_MUSIC)) {
                Log.i(TAG, "Disabled in Morphe settings");
                return;
            }

            if (config == null || config.PackageNames == null || config.AppNames == null
                    || config.Scopes == null || config.InstallationUrls == null) {
                return;
            }
            int length = config.PackageNames.length;
            if (config.AppNames.length != length || config.Scopes.length != length
                    || config.InstallationUrls.length != length) return;

            Context context = getContext();
            if (context == null) {
                Log.w(TAG, "No context available");
                return;
            }

            List<String> packageNames = Arrays.asList(config.PackageNames);
            int originalIndex = packageNames.indexOf(ORIGINAL_PACKAGE);

            Set<String> patchedPackages = findInstalledPatchedPackages(context);
            if (patchedPackages.isEmpty()) {
                Log.d(TAG, "No patched YouTube Music installed");
                return;
            }

            int[] scopes = config.Scopes;

            final int scope;
            final String fallbackName;
            if (originalIndex >= 0) {
                scope = scopes[originalIndex];
                fallbackName = config.AppNames[originalIndex];
            } else {
                scope = FALLBACK_SCOPE_FEATURE_AUDIO;
                fallbackName = "YouTube Music";
            }

            for (String patchedPackage : patchedPackages) {
                aliases.put(patchedPackage, ORIGINAL_PACKAGE);
                if (AudioPartnerConfig.add(config, patchedPackage,
                        getAppLabel(context, patchedPackage, fallbackName), scope)) {
                    Log.i(TAG, "Added audio partner " + patchedPackage + " (scope 0x"
                            + Integer.toHexString(scope) + ", original listed: " + (originalIndex >= 0) + ")");
                }
            }
        } catch (Exception ex) {
            Log.e(TAG, "onSdkConfigurationLoaded failure", ex);
        }
    }

    /**
     * Injection point. Partner icons are downloaded from the Waze server by package name.
     * The server only knows the original package name.
     */
    public static String getIconPackageName(String packageName) {
        if (packageName == null) return null;
        String original = aliases.get(packageName);
        return original != null ? original : packageName;
    }

    private static Set<String> findInstalledPatchedPackages(Context context) {
        Set<String> result = new LinkedHashSet<>();
        PackageManager pm = context.getPackageManager();

        // Any app that ships the YouTube Music Waze receiver, independent of its package name.
        try {
            List<ResolveInfo> receivers = pm.queryBroadcastReceivers(new Intent(ACTION_AUDIO_SDK_INIT), 0);
            if (receivers != null) {
                for (ResolveInfo info : receivers) {
                    if (info.activityInfo == null) continue;
                    String packageName = info.activityInfo.packageName;
                    if (!ORIGINAL_PACKAGE.equals(packageName)
                            && YT_MUSIC_WAZE_RECEIVER.equals(info.activityInfo.name)) {
                        result.add(packageName);
                    }
                }
            }
        } catch (Exception ex) {
            Log.e(TAG, "queryBroadcastReceivers failure", ex);
        }

        // Explicitly configured package names, if installed.
        for (String name : getConfiguredPackageNames().split(",")) {
            String packageName = name.trim();
            if (packageName.isEmpty() || ORIGINAL_PACKAGE.equals(packageName)) continue;
            try {
                pm.getPackageInfo(packageName, 0);
                result.add(packageName);
            } catch (PackageManager.NameNotFoundException ignored) {
            }
        }

        return result;
    }

    private static String getAppLabel(Context context, String packageName, String fallback) {
        try {
            PackageManager pm = context.getPackageManager();
            ApplicationInfo info = pm.getApplicationInfo(packageName, 0);
            CharSequence label = pm.getApplicationLabel(info);
            if (label != null && label.length() > 0) return label.toString();
        } catch (Exception ignored) {
        }
        return fallback;
    }

    @SuppressLint("PrivateApi")
    private static Context getContext() {
        try {
            return (Context) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication")
                    .invoke(null);
        } catch (Exception ex) {
            Log.e(TAG, "getContext failure", ex);
            return null;
        }
    }
}
