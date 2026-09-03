package com.autocat.morphe.smartlauncher.extension;

import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.IntentSender;
import android.content.pm.LauncherApps;
import android.content.pm.PackageInstaller;
import android.os.Build;
import android.os.Process;
import android.os.UserHandle;
import android.util.Log;

import java.lang.reflect.Method;

/**
 * Pure-reflection implementation of native app archiving and unarchiving via
 * {@code PackageInstaller.requestArchive} & {@code PackageInstaller.requestUnarchive} APIs
 * (Android 15 / API 35+ / Samsung One UI 7).
 *
 * Silent by design — callers are responsible for all user-facing feedback.
 */
@SuppressWarnings("unused")
public class NativeArchiveHelper {

    private static final String TAG = "NativeArchiveHelper";
    private static final int FLAG_IMMUTABLE = 0x04000000;
    private static final int FLAG_UPDATE_CURRENT = 0x08000000;

    public static boolean isSupported() {
        return Build.VERSION.SDK_INT >= 35;
    }

    public static boolean archivePackage(Context context, String packageName) {
        return requestArchive(context, packageName);
    }

    public static boolean unarchivePackage(Context context, String packageName) {
        if (context == null || packageName == null || packageName.isEmpty()) {
            return false;
        }
        if (!isSupported()) {
            return false;
        }

        IntentSender statusReceiver = createCallbackIntentSender(context, packageName);

        try {
            PackageInstaller installer = context.getPackageManager().getPackageInstaller();
            if (installer != null) {
                Method m = installer.getClass().getMethod("requestUnarchive", String.class, IntentSender.class);
                m.invoke(installer, packageName, statusReceiver);
                Log.i(TAG, "Native unarchive requested for " + packageName);
                return true;
            }
        } catch (Throwable t) {
            Log.w(TAG, "PackageInstaller.requestUnarchive failed for " + packageName, t);
        }

        try {
            LauncherApps launcherApps = (LauncherApps) context.getSystemService(Context.LAUNCHER_APPS_SERVICE);
            if (launcherApps != null) {
                Method m = launcherApps.getClass().getMethod(
                        "unarchiveApp", String.class, UserHandle.class, IntentSender.class);
                m.invoke(launcherApps, packageName, Process.myUserHandle(), statusReceiver);
                Log.i(TAG, "LauncherApps.unarchiveApp invoked for " + packageName);
                return true;
            }
        } catch (Throwable t) {
            Log.e(TAG, "LauncherApps.unarchiveApp failed for " + packageName, t);
        }

        return false;
    }

    public static boolean requestArchive(Context context, String packageName) {
        if (context == null || packageName == null || packageName.isEmpty()) {
            return false;
        }
        if (!isSupported()) {
            return false;
        }

        IntentSender statusReceiver = createCallbackIntentSender(context, packageName);

        try {
            PackageInstaller installer = context.getPackageManager().getPackageInstaller();
            if (installer != null) {
                Method m = installer.getClass().getMethod("requestArchive", String.class, IntentSender.class);
                m.invoke(installer, packageName, statusReceiver);
                Log.i(TAG, "Native archive requested for " + packageName);
                return true;
            }
        } catch (Throwable t) {
            Log.w(TAG, "PackageInstaller.requestArchive failed for " + packageName, t);
        }

        try {
            LauncherApps launcherApps = (LauncherApps) context.getSystemService(Context.LAUNCHER_APPS_SERVICE);
            if (launcherApps != null) {
                Method m = launcherApps.getClass().getMethod(
                        "archiveApp", String.class, UserHandle.class, IntentSender.class);
                m.invoke(launcherApps, packageName, Process.myUserHandle(), statusReceiver);
                Log.i(TAG, "LauncherApps.archiveApp invoked for " + packageName);
                return true;
            }
        } catch (Throwable t) {
            Log.e(TAG, "All native archive methods failed for " + packageName, t);
        }

        return false;
    }

    private static IntentSender createCallbackIntentSender(Context context, String packageName) {
        try {
            Intent intent = new Intent("com.autocat.morphe.smartlauncher.ACTION_ARCHIVE_CALLBACK");
            intent.setPackage(context.getPackageName());
            intent.putExtra("archived_package", packageName);
            PendingIntent pi = PendingIntent.getBroadcast(
                    context, packageName.hashCode(), intent,
                    FLAG_UPDATE_CURRENT | FLAG_IMMUTABLE);
            return pi != null ? pi.getIntentSender() : null;
        } catch (Throwable t) {
            Log.w(TAG, "Could not create callback IntentSender", t);
            return null;
        }
    }
}
