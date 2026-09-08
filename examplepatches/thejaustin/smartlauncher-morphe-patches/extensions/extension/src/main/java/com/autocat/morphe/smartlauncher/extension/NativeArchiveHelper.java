package com.autocat.morphe.smartlauncher.extension;

import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
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
 */
@SuppressWarnings("unused")
public class NativeArchiveHelper {

    private static final String TAG = "NativeArchiveHelper";
    public static final String ACTION_ARCHIVE_CALLBACK = "com.autocat.morphe.smartlauncher.ACTION_ARCHIVE_CALLBACK";
    public static final String EXTRA_PACKAGE_NAME = "archived_package";

    private static final int FLAG_MUTABLE = 0x02000000;
    private static final int FLAG_IMMUTABLE = 0x04000000;
    private static final int FLAG_UPDATE_CURRENT = 0x08000000;

    private static volatile boolean sReceiverRegistered = false;

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
            registerCallbackReceiverIfNeeded(context);
            Intent intent = new Intent(ACTION_ARCHIVE_CALLBACK);
            intent.setPackage(context.getPackageName());
            intent.putExtra(EXTRA_PACKAGE_NAME, packageName);
            int flags = FLAG_UPDATE_CURRENT;
            if (Build.VERSION.SDK_INT >= 31) {
                flags |= FLAG_MUTABLE;
            }
            PendingIntent pi = PendingIntent.getBroadcast(
                    context, packageName.hashCode(), intent,
                    flags);
            return pi != null ? pi.getIntentSender() : null;
        } catch (Throwable t) {
            Log.w(TAG, "Could not create callback IntentSender", t);
            return null;
        }
    }

    private static void registerCallbackReceiverIfNeeded(final Context context) {
        if (sReceiverRegistered || context == null) return;
        try {
            IntentFilter filter = new IntentFilter(ACTION_ARCHIVE_CALLBACK);
            BroadcastReceiver receiver = new BroadcastReceiver() {
                @Override
                public void onReceive(Context ctx, Intent intent) {
                    int status = intent.getIntExtra(PackageInstaller.EXTRA_STATUS, PackageInstaller.STATUS_FAILURE);
                    String pkg = intent.getStringExtra(EXTRA_PACKAGE_NAME);
                    String msg = intent.getStringExtra(PackageInstaller.EXTRA_STATUS_MESSAGE);
                    Log.i(TAG, "Archive callback received for " + pkg + ": status=" + status + ", message=" + msg);
                    if (status == PackageInstaller.STATUS_SUCCESS) {
                        MorpheMenuInjector.postToast(ctx, (pkg != null ? pkg : "App") + " archived successfully!");
                    } else if (status != PackageInstaller.STATUS_PENDING_USER_ACTION) {
                        MorpheMenuInjector.postToast(ctx, "Native archive failed (" + status + "): " + (msg != null ? msg : "requires installer privileges"));
                    }
                }
            };
            if (Build.VERSION.SDK_INT >= 33) {
                context.getApplicationContext().registerReceiver(receiver, filter, Context.RECEIVER_EXPORTED);
            } else {
                context.getApplicationContext().registerReceiver(receiver, filter);
            }
            sReceiverRegistered = true;
            Log.i(TAG, "Archive callback receiver registered");
        } catch (Throwable t) {
            Log.w(TAG, "Failed to register archive callback receiver", t);
        }
    }
}
