package io.branch.search.internal;

import android.content.ComponentName;
import android.content.pm.ApplicationInfo;
import android.content.pm.LauncherActivityInfo;
import android.content.pm.LauncherApps;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.UserHandle;
import android.util.Log;
import java.util.ArrayList;
import java.util.Iterator;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.x8, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3451x8 {
    /* JADX WARN: Removed duplicated region for block: B:7:0x002c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final boolean a(@NotNull ArrayList activities, @NotNull LauncherApps launcherApps, @NotNull PackageManager pm2, @NotNull ApplicationInfo info, @NotNull String packageName, @NotNull UserHandle user) {
        Intrinsics.g(activities, "activities");
        Intrinsics.g(launcherApps, "launcherApps");
        Intrinsics.g(pm2, "pm");
        Intrinsics.g(info, "info");
        Intrinsics.g(packageName, "packageName");
        Intrinsics.g(user, "user");
        if (!info.enabled) {
            try {
                if (pm2.getApplicationEnabledSetting(packageName) == 4) {
                }
            } catch (IllegalArgumentException e3) {
                Log.w("LauncherAppsUtils", "Failed at isApplicationEnabled for ".concat(packageName), e3);
            }
        } else if (!activities.isEmpty()) {
            Iterator it = activities.iterator();
            while (it.hasNext()) {
                LauncherActivityInfo info2 = (LauncherActivityInfo) it.next();
                Intrinsics.g(info2, "info");
                if (Build.VERSION.SDK_INT >= 31) {
                    if (info2.getActivityInfo().isEnabled()) {
                        return true;
                    }
                    ComponentName componentName = info2.getComponentName();
                    Intrinsics.f(componentName, "componentName");
                    try {
                        if (kotlin.collections.c.f1(new Integer[]{4, 1}).contains(Integer.valueOf(pm2.getComponentEnabledSetting(componentName))) && launcherApps.isActivityEnabled(info2.getComponentName(), user)) {
                            return true;
                        }
                    } catch (IllegalArgumentException e11) {
                        Log.w("LauncherAppsUtils", "Failed at disabledUntilUse for " + componentName, e11);
                    }
                } else if (launcherApps.isActivityEnabled(info2.getComponentName(), user)) {
                    return true;
                }
            }
        }
        return false;
    }
}
