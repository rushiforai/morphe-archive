/*
 * Copyright 2026 Hoo-dles
 * https://github.com/hoo-dles/morphe-patches
 */

package app.mrcool.extension.smartlauncher;

import android.app.Activity;
import android.appwidget.AppWidgetHost;
import android.appwidget.AppWidgetManager;
import android.appwidget.AppWidgetProviderInfo;
import android.content.ComponentName;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.os.Bundle;
import android.os.Process;

public final class WidgetConfiguration {
    private static final String BUDS_PACKAGE = "com.samsung.accessory.paranmgr";
    private static final String SETTINGS_PACKAGE =
            "com.samsung.accessory.hearablemgr.core.appwidget.base.";

    public static void startConfiguration(AppWidgetHost host, Activity activity, int widgetId,
                                          int flags, int requestCode, Bundle options) {
        ComponentName configuration = getBudsConfiguration(activity, widgetId);
        if (configuration != null) {
            Intent intent = new Intent(AppWidgetManager.ACTION_APPWIDGET_CONFIGURE)
                    .setComponent(configuration)
                    .putExtra(AppWidgetManager.EXTRA_APPWIDGET_ID, widgetId)
                    .addFlags(flags);
            try {
                activity.startActivityForResult(intent, requestCode, options);
                return;
            } catch (android.content.ActivityNotFoundException | SecurityException ignored) {
                // Fall back if the provider was removed or disabled since the lookup.
            }
        }
        host.startAppWidgetConfigureActivityForResult(activity, widgetId, flags, requestCode, options);
    }

    private static ComponentName getBudsConfiguration(Activity activity, int widgetId) {
        AppWidgetProviderInfo info = AppWidgetManager.getInstance(activity).getAppWidgetInfo(widgetId);
        if (info == null || info.configure == null
                || !BUDS_PACKAGE.equals(info.provider.getPackageName())
                || !SETTINGS_PACKAGE.concat("WidgetSettingActivityUI6UI7")
                        .equals(info.configure.getClassName())
                || !Process.myUserHandle().equals(info.getProfile())) {
            return null;
        }
        try {
            int oneUiVersion = (Integer) Class.forName("android.os.SystemProperties")
                    .getMethod("getInt", String.class, int.class)
                    .invoke(null, "ro.build.version.oneui", 0);
            if (oneUiVersion < 80500) return null;
            ComponentName configuration = new ComponentName(BUDS_PACKAGE,
                    SETTINGS_PACKAGE + "WidgetSettingActivityUI85");
            ActivityInfo target = activity.getPackageManager().getActivityInfo(configuration, 0);
            // The old Samsung activity redirects without forwarding the launcher's result.
            return target.exported && target.enabled && target.applicationInfo.enabled
                    ? configuration : null;
        } catch (ReflectiveOperationException | android.content.pm.PackageManager.NameNotFoundException
                 | RuntimeException ignored) {
            return null;
        }
    }
}
