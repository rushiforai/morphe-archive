/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Written by lavinhoque33, 2026-11-20.
 */
package app.morphe.extension.shared.patches;

import static android.content.pm.PackageManager.COMPONENT_ENABLED_STATE_DISABLED;
import static android.content.pm.PackageManager.COMPONENT_ENABLED_STATE_ENABLED;
import static android.content.pm.PackageManager.DONT_KILL_APP;
import static android.content.pm.PackageManager.MATCH_DISABLED_COMPONENTS;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.os.Build;

import androidx.annotation.RequiresApi;
import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import app.morphe.extension.shared.utils.Logger;

@SuppressWarnings("deprecation")
final class LauncherAliasReconciler {
    private LauncherAliasReconciler() {
    }

    static void reconcile(Context context, String icon, int nameIndex, boolean useSystemSplash) {
        String packageName = context.getPackageName();
        String prefix = packageName + ".morphe_";
        String selectedName = prefix + icon + '_' + nameIndex + (useSystemSplash ? "_system" : "");
        Intent launcher = new Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_LAUNCHER).setPackage(packageName);
        PackageManager manager = context.getPackageManager();

        try {
            // This is the installed resolver's effective state, including manifest defaults and
            // per-user overrides. A version, source or saved selection alone cannot prove it.
            List<ResolveInfo> enabled = manager.queryIntentActivities(launcher, 0);
            boolean selectedEnabled = false;
            boolean otherEnabled = false;
            for (ResolveInfo result : enabled) {
                if (!isBrandingAlias(result, prefix)) continue;

                if (selectedName.equals(result.activityInfo.name)) {
                    selectedEnabled = true;
                } else {
                    otherEnabled = true;
                }
            }
            if (selectedEnabled && !otherEnabled) return;

            // Only an installed MAIN/LAUNCHER alias can replace an existing launcher. The
            // resources may be patched even though PM never parsed the patched manifest (root).
            if (!selectedEnabled && !hasAlias(
                    manager.queryIntentActivities(launcher, MATCH_DISABLED_COMPONENTS), prefix, selectedName)) {
                return;
            }

            Set<ComponentName> retire = new LinkedHashSet<>();
            for (ResolveInfo result : enabled) {
                if (isBrandingAlias(result, prefix) && !selectedName.equals(result.activityInfo.name)) {
                    retire.add(new ComponentName(packageName, result.activityInfo.name));
                }
            }
            ComponentName enable = selectedEnabled ? null : new ComponentName(packageName, selectedName);
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
                Api33.apply(manager, enable, retire);
            } else {
                applySeparately(manager, launcher, prefix, enable, retire);
            }
        } catch (RuntimeException exception) {
            Logger.printDebug(() -> "Could not reconcile branding launcher " + selectedName, exception);
        }
    }

    private static boolean isBrandingAlias(ResolveInfo result, String prefix) {
        ActivityInfo activity = result.activityInfo;
        return activity != null && activity.targetActivity != null && activity.exported
                && activity.name.startsWith(prefix);
    }

    private static boolean hasAlias(List<ResolveInfo> results, String prefix, String name) {
        for (ResolveInfo result : results) {
            if (isBrandingAlias(result, prefix) && name.equals(result.activityInfo.name)) return true;
        }
        return false;
    }

    private static void applySeparately(PackageManager manager, Intent launcher, String prefix,
                                        @Nullable ComponentName enable, Set<ComponentName> retire) {
        if (enable != null) {
            manager.setComponentEnabledSetting(enable, COMPONENT_ENABLED_STATE_ENABLED, DONT_KILL_APP);
            // Do not retire the old launcher unless the new one really became resolvable.
            if (!retire.isEmpty() && !hasAlias(manager.queryIntentActivities(launcher, 0),
                    prefix, enable.getClassName())) return;
        }
        for (ComponentName alias : retire) {
            manager.setComponentEnabledSetting(alias, COMPONENT_ENABLED_STATE_DISABLED, DONT_KILL_APP);
        }
    }

    @RequiresApi(Build.VERSION_CODES.TIRAMISU)
    private static final class Api33 {
        private static void apply(PackageManager manager, @Nullable ComponentName enable, Set<ComponentName> retire) {
            var changes = new ArrayList<PackageManager.ComponentEnabledSetting>(retire.size() + (enable == null ? 0 : 1));
            if (enable != null) {
                changes.add(new PackageManager.ComponentEnabledSetting(enable,
                        COMPONENT_ENABLED_STATE_ENABLED, DONT_KILL_APP));
            }
            for (ComponentName alias : retire) {
                changes.add(new PackageManager.ComponentEnabledSetting(alias,
                        COMPONENT_ENABLED_STATE_DISABLED, DONT_KILL_APP));
            }
            manager.setComponentEnabledSettings(changes);
        }
    }
}
