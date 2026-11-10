package io.github.bryceaspringfield.morphe.extension.reddit;

import static io.github.bryceaspringfield.morphe.extension.reddit.FilterSettings.LAUNCHERS_BEFORE;
import static io.github.bryceaspringfield.morphe.extension.reddit.FilterSettings.MORPHE_LOADER;
import static io.github.bryceaspringfield.morphe.extension.reddit.FilterSettings.MORPHE_LOGO;
import static io.github.bryceaspringfield.morphe.extension.reddit.FilterSettings.TAG;
import static io.github.bryceaspringfield.morphe.extension.reddit.FilterSettings.getBoolean;
import static io.github.bryceaspringfield.morphe.extension.reddit.FilterSettings.getSet;
import static io.github.bryceaspringfield.morphe.extension.reddit.FilterSettings.putSet;

import android.annotation.SuppressLint;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.util.Log;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

/**
 * Morphe's logo, loading animation, and launcher icon in place of Reddit's, when the Morphe branding patch added them to
 * the app. Each load of a Reddit loader or Snoo resource ID passes through here; Reddit's stays until its switch is
 * turned on. The launcher icon is a launcher entry of its own, disabled until its switch enables it.
 */
@SuppressWarnings("unused")
public final class Branding {

    /** The launcher entry the patch adds, showing the Morphe icon. */
    private static final String LAUNCHER = "launcher.morphe";
    private static final String DEFAULT_LAUNCHER = "launcher.default";

    private static volatile int loaderId = -1;
    private static volatile int logoId = -1;

    private Branding() {
    }

    /** Injection point: the loading animation to show in place of Reddit's {@code id}. */
    public static int loader(int id) {
        if (!getBoolean(MORPHE_LOADER)) return id;
        if (loaderId < 0) loaderId = resource("morphe_reddit_loader", "raw");
        return loaderId != 0 ? loaderId : id;
    }

    /** Injection point: the logo to show in place of Reddit's Snoo {@code id}. */
    public static int logo(int id) {
        if (!getBoolean(MORPHE_LOGO)) return id;
        if (logoId < 0) logoId = resource("morphe_reddit_logo", "drawable");
        return logoId != 0 ? logoId : id;
    }

    /** Whether the app holds Morphe's branding files, which only the Morphe branding patch adds. */
    static boolean available() {
        return resource("morphe_reddit_loader", "raw") != 0;
    }

    /** Whether the app holds the Morphe launcher entry. */
    static boolean launcherAvailable(Context context) {
        try {
            context.getPackageManager().getComponentEnabledSetting(new ComponentName(context, LAUNCHER));
            return true;
        } catch (IllegalArgumentException ex) {
            return false;
        }
    }

    static boolean launcherOn(Context context) {
        try {
            return context.getPackageManager().getComponentEnabledSetting(new ComponentName(context, LAUNCHER))
                    == PackageManager.COMPONENT_ENABLED_STATE_ENABLED;
        } catch (IllegalArgumentException ex) {
            return false;
        }
    }

    /**
     * Shows the Morphe launcher icon in place of the icons enabled now, which return when it is turned off. Another
     * patch's icon choice (e.g., Morphe Patches' App icon) is one of those launcher entries.
     */
    static void setLauncher(Context context, boolean on) {
        PackageManager pm = context.getPackageManager();
        String pkg = context.getPackageName();
        try {
            if (on) {
                Set<String> before = new HashSet<>();
                Intent main = new Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_LAUNCHER).setPackage(pkg);
                for (ResolveInfo info : pm.queryIntentActivities(main, 0)) {
                    if (info.activityInfo != null && !LAUNCHER.equals(info.activityInfo.name)) before.add(info.activityInfo.name);
                }
                if (before.isEmpty()) before.add(DEFAULT_LAUNCHER);
                putSet(LAUNCHERS_BEFORE, before);
                pm.setComponentEnabledSetting(new ComponentName(pkg, LAUNCHER),
                        PackageManager.COMPONENT_ENABLED_STATE_ENABLED, PackageManager.DONT_KILL_APP);
                for (String name : before) {
                    pm.setComponentEnabledSetting(new ComponentName(pkg, name),
                            PackageManager.COMPONENT_ENABLED_STATE_DISABLED, PackageManager.DONT_KILL_APP);
                }
            } else {
                Set<String> before = getSet(LAUNCHERS_BEFORE, Collections.singleton(DEFAULT_LAUNCHER));
                if (before.isEmpty()) before = Collections.singleton(DEFAULT_LAUNCHER);
                for (String name : before) {
                    try {
                        pm.setComponentEnabledSetting(new ComponentName(pkg, name),
                                PackageManager.COMPONENT_ENABLED_STATE_ENABLED, PackageManager.DONT_KILL_APP);
                    } catch (IllegalArgumentException ex) {
                        Log.w(TAG, "launcher entry missing: " + name);
                    }
                }
                pm.setComponentEnabledSetting(new ComponentName(pkg, LAUNCHER),
                        PackageManager.COMPONENT_ENABLED_STATE_DEFAULT, PackageManager.DONT_KILL_APP);
            }
        } catch (Exception ex) {
            Log.e(TAG, "Could not switch the launcher icon", ex);
        }
    }

    @SuppressLint({"PrivateApi", "DiscouragedApi"})
    private static int resource(String name, String type) {
        try {
            Context context = (Context) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication").invoke(null);
            if (context == null) return -1;
            return context.getResources().getIdentifier(name, type, context.getPackageName());
        } catch (Exception ex) {
            return 0;
        }
    }
}
