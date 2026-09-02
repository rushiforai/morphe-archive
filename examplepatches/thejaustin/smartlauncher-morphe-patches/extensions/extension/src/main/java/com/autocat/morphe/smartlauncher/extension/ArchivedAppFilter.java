package com.autocat.morphe.smartlauncher.extension;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.LauncherActivityInfo;
import android.content.pm.LauncherApps;
import android.os.Build;
import android.os.UserHandle;
import android.util.Log;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * High-performance, crash-resilient runtime wrapper for Smart Launcher 6 app archiving.
 * <p>
 * Selectively filters archived applications when loading the global App Drawer
 * (where packageName is null), while preserving single-package lookups to prevent
 * NoSuchElementException / IndexOutOfBoundsException during home-screen icon restoration.
 */
@SuppressWarnings("unused")
public class ArchivedAppFilter {

    private static final String TAG = "ArchivedAppFilter";
    private static final int FLAG_ARCHIVED = 0x40000000; // Bit 30 in ApplicationInfo.flags (1 << 30)

    private static volatile boolean sFilterEnabled = true;
    private static volatile boolean sPrefsLoaded = false;

    /** Called by MorpheSettingsDialog when the user toggles the setting at runtime. */
    public static void setFilterEnabled(boolean enabled) {
        sFilterEnabled = enabled;
        sPrefsLoaded = true;
    }

    private static void loadPrefsIfNeeded(LauncherApps launcherApps) {
        if (sPrefsLoaded) return;
        try {
            Context ctx = null;
            for (Field f : launcherApps.getClass().getDeclaredFields()) {
                f.setAccessible(true);
                Object val = f.get(launcherApps);
                if (val instanceof Context) {
                    ctx = (Context) val;
                    break;
                }
            }
            if (ctx != null) {
                sFilterEnabled = MorphePreferences.isHideArchivedEnabled(ctx);
                sPrefsLoaded = true;
            }
        } catch (Throwable ignored) {}
    }

    /**
     * 1-to-1 drop-in replacement for {@code LauncherApps.getActivityList(String, UserHandle)}.
     */
    public static List<LauncherActivityInfo> getActivityList(
            LauncherApps launcherApps,
            String packageName,
            UserHandle user
    ) {
        try {
            if (launcherApps == null) {
                return Collections.emptyList();
            }
            loadPrefsIfNeeded(launcherApps);
            List<LauncherActivityInfo> activities = launcherApps.getActivityList(packageName, user);

            // Only filter archived apps when querying the full application list
            // (packageName == null or empty). When Smart Launcher queries a specific package
            // (packageName != null), return the list directly so home screen icon restoration
            // calling list.first() / list[0] never throws IndexOutOfBoundsException.
            if (packageName == null || packageName.isEmpty()) {
                return filter(activities);
            }
            return activities;
        } catch (Throwable t) {
            Log.e(TAG, "Safe fallback in getActivityList wrapper", t);
            try {
                return launcherApps != null ? launcherApps.getActivityList(packageName, user) : Collections.<LauncherActivityInfo>emptyList();
            } catch (Throwable fallbackError) {
                return Collections.emptyList();
            }
        }
    }

    /**
     * Filters archived applications safely. Respects the user preference toggle.
     */
    public static List<LauncherActivityInfo> filter(List<LauncherActivityInfo> activities) {
        try {
            if (!sFilterEnabled) {
                return activities;
            }
            if (activities == null || activities.isEmpty()) {
                return activities;
            }

            // Android 15+ app archiving is active on API 35+
            if (Build.VERSION.SDK_INT < 35) {
                return activities;
            }

            // Quick pass: check if any app is actually archived
            int total = activities.size();
            int archivedCount = 0;
            for (int i = 0; i < total; i++) {
                LauncherActivityInfo info = activities.get(i);
                if (info != null && isArchived(info)) {
                    archivedCount++;
                }
            }

            // If no apps are archived, return the original list (0 allocations)
            if (archivedCount == 0) {
                return activities;
            }

            // Filter out archived apps safely
            List<LauncherActivityInfo> filtered = new ArrayList<>(total - archivedCount);
            for (int i = 0; i < total; i++) {
                LauncherActivityInfo info = activities.get(i);
                if (info != null && !isArchived(info)) {
                    filtered.add(info);
                }
            }
            return filtered;
        } catch (Throwable t) {
            Log.e(TAG, "Safe filter catch: preserving original activity list", t);
            return activities;
        }
    }

    private static boolean isArchived(LauncherActivityInfo info) {
        try {
            ApplicationInfo appInfo = info.getApplicationInfo();
            if (appInfo == null) {
                return false;
            }

            // Check 1: Direct bitmask check (Bit 30 in ApplicationInfo.flags)
            if ((appInfo.flags & FLAG_ARCHIVED) != 0) {
                return true;
            }

            // Check 2: Dynamic reflection on ApplicationInfo.isArchived() if available on API 35+
            try {
                Method isArchivedMethod = ApplicationInfo.class.getMethod("isArchived");
                Boolean isArchived = (Boolean) isArchivedMethod.invoke(appInfo);
                if (isArchived != null && isArchived) {
                    return true;
                }
            } catch (NoSuchMethodException ignored) {
            }

            return false;
        } catch (Throwable t) {
            return false;
        }
    }
}
