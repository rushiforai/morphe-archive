package com.autocat.morphe.smartlauncher.extension;

import android.app.Activity;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.IntentSender;
import android.content.pm.LauncherApps;
import android.content.pm.PackageInstaller;
import android.os.Build;
import android.os.Process;
import android.util.Log;
import android.widget.Toast;

import java.lang.reflect.Method;

/**
 * Real implementation of native app archiving and unarchiving via the
 * public {@code PackageInstaller.requestArchive} & {@code PackageInstaller.requestUnarchive} APIs
 * (Android 15 / API 35+ / Samsung One UI 7).
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
            safeToast(context, "Native app unarchiving requires Android 15+");
            return false;
        }

        IntentSender statusReceiver = createCallbackIntentSender(context, packageName);

        try {
            PackageInstaller installer = context.getPackageManager().getPackageInstaller();
            if (installer != null) {
                Method unarchiveMethod = installer.getClass().getMethod("requestUnarchive", String.class, IntentSender.class);
                unarchiveMethod.invoke(installer, packageName, statusReceiver);
                Log.i(TAG, "Native unarchive requested for " + packageName);
                safeToast(context, "Unarchiving " + packageName + "...");
                return true;
            }
        } catch (Throwable t) {
            Log.w(TAG, "PackageInstaller.requestUnarchive failed for " + packageName, t);
        }

        try {
            LauncherApps launcherApps = (LauncherApps) context.getSystemService(Context.LAUNCHER_APPS_SERVICE);
            if (launcherApps != null) {
                Method unarchiveAppMethod = launcherApps.getClass().getMethod(
                    "unarchiveApp",
                    String.class,
                    Process.myUserHandle().getClass(),
                    IntentSender.class
                );
                unarchiveAppMethod.invoke(launcherApps, packageName, Process.myUserHandle(), statusReceiver);
                Log.i(TAG, "LauncherApps.unarchiveApp invoked for " + packageName);
                safeToast(context, "Unarchiving " + packageName + "...");
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
            safeToast(context, "Native app archiving requires Android 15+");
            return false;
        }

        IntentSender statusReceiver = createCallbackIntentSender(context, packageName);

        try {
            PackageInstaller installer = context.getPackageManager().getPackageInstaller();
            if (installer != null) {
                installer.requestArchive(packageName, statusReceiver);
                Log.i(TAG, "Native archive requested for " + packageName);
                safeToast(context, "Archiving " + packageName + "...");
                return true;
            }
        } catch (Throwable t) {
            Log.w(TAG, "PackageInstaller.requestArchive failed for " + packageName, t);
        }

        try {
            LauncherApps launcherApps = (LauncherApps) context.getSystemService(Context.LAUNCHER_APPS_SERVICE);
            if (launcherApps != null) {
                Method archiveAppMethod = launcherApps.getClass().getMethod(
                    "archiveApp",
                    String.class,
                    Process.myUserHandle().getClass(),
                    IntentSender.class
                );
                archiveAppMethod.invoke(launcherApps, packageName, Process.myUserHandle(), statusReceiver);
                Log.i(TAG, "LauncherApps.archiveApp invoked for " + packageName);
                safeToast(context, "Archiving " + packageName + "...");
                return true;
            }
        } catch (Throwable t) {
            Log.e(TAG, "All native archive methods failed for " + packageName, t);
        }

        safeToast(context, "Failed to archive " + packageName);
        return false;
    }

    private static IntentSender createCallbackIntentSender(Context context, String packageName) {
        try {
            Intent dummyIntent = new Intent("com.autocat.morphe.smartlauncher.ACTION_ARCHIVE_CALLBACK");
            dummyIntent.setPackage(context.getPackageName());
            dummyIntent.putExtra("archived_package", packageName);
            int flags = FLAG_UPDATE_CURRENT | FLAG_IMMUTABLE;
            PendingIntent pendingIntent = PendingIntent.getBroadcast(
                context,
                packageName.hashCode(),
                dummyIntent,
                flags
            );
            return pendingIntent != null ? pendingIntent.getIntentSender() : null;
        } catch (Throwable t) {
            Log.w(TAG, "Could not create callback IntentSender", t);
            return null;
        }
    }

    private static void safeToast(Context context, String message) {
        try {
            Toast.makeText(context.getApplicationContext(), message, Toast.LENGTH_SHORT).show();
        } catch (Throwable ignored) {
        }
    }
}
