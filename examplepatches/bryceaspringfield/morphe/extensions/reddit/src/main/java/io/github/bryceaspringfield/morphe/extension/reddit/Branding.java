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

@SuppressWarnings("unused")
public final class Branding {

    private static final String LAUNCHER = "launcher.morphe";
    private static final String DEFAULT_LAUNCHER = "launcher.default";

    private static volatile int loaderId = -1;
    private static volatile int logoId = -1;

    private Branding() {
    }

    public static int loader(int id) {
        if (!getBoolean(MORPHE_LOADER)) return id;
        if (loaderId < 0) loaderId = resource("morphe_reddit_loader", "raw");
        return loaderId != 0 ? loaderId : id;
    }

    public static int logo(int id) {
        if (!getBoolean(MORPHE_LOGO)) return id;
        if (logoId < 0) logoId = resource("morphe_reddit_logo", "drawable");
        return logoId != 0 ? logoId : id;
    }

    static boolean available() {
        return resource("morphe_reddit_loader", "raw") != 0;
    }

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
