package io.sentry.android.core;

import android.app.ActivityManager;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.Build;
import io.sentry.ILogger;
import io.sentry.g3;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;

/* loaded from: classes4.dex */
public abstract class c0 {
    public static String a(Context context, ILogger iLogger) {
        try {
            ApplicationInfo applicationInfo = context.getApplicationInfo();
            int i5 = applicationInfo.labelRes;
            if (i5 != 0) {
                return context.getString(i5);
            }
            CharSequence charSequence = applicationInfo.nonLocalizedLabel;
            return charSequence != null ? charSequence.toString() : context.getPackageManager().getApplicationLabel(applicationInfo).toString();
        } catch (Throwable th2) {
            iLogger.e(g3.ERROR, "Error getting application name.", th2);
            return null;
        }
    }

    public static String b(ILogger iLogger) {
        try {
            return Build.MODEL.split(" ", -1)[0];
        } catch (Throwable th2) {
            iLogger.e(g3.ERROR, "Error getting device family.", th2);
            return null;
        }
    }

    public static String c(ILogger iLogger) throws IOException {
        String property = System.getProperty("os.version");
        File file = new File("/proc/version");
        if (!file.canRead()) {
            return property;
        }
        try {
            BufferedReader bufferedReader = new BufferedReader(new FileReader(file));
            try {
                String line = bufferedReader.readLine();
                bufferedReader.close();
                return line;
            } finally {
            }
        } catch (IOException e3) {
            iLogger.e(g3.ERROR, "Exception while attempting to read kernel information", e3);
            return property;
        }
    }

    public static ActivityManager.MemoryInfo d(Context context, ILogger iLogger) {
        try {
            ActivityManager activityManager = (ActivityManager) context.getSystemService("activity");
            ActivityManager.MemoryInfo memoryInfo = new ActivityManager.MemoryInfo();
            if (activityManager != null) {
                activityManager.getMemoryInfo(memoryInfo);
                return memoryInfo;
            }
            iLogger.g(g3.INFO, "Error getting MemoryInfo.", new Object[0]);
            return null;
        } catch (Throwable th2) {
            iLogger.e(g3.ERROR, "Error getting MemoryInfo.", th2);
            return null;
        }
    }

    public static PackageInfo e(Context context, int i5, ILogger iLogger, a0 a0Var) {
        try {
            a0Var.getClass();
            return Build.VERSION.SDK_INT >= 33 ? context.getPackageManager().getPackageInfo(context.getPackageName(), PackageManager.PackageInfoFlags.of(i5)) : context.getPackageManager().getPackageInfo(context.getPackageName(), i5);
        } catch (Throwable th2) {
            iLogger.e(g3.ERROR, "Error getting package info.", th2);
            return null;
        }
    }

    public static String f(PackageInfo packageInfo, a0 a0Var) {
        a0Var.getClass();
        return Build.VERSION.SDK_INT >= 28 ? Long.toString(packageInfo.getLongVersionCode()) : Integer.toString(packageInfo.versionCode);
    }

    public static boolean g() {
        try {
            ActivityManager.RunningAppProcessInfo runningAppProcessInfo = new ActivityManager.RunningAppProcessInfo();
            ActivityManager.getMyMemoryState(runningAppProcessInfo);
            return runningAppProcessInfo.importance == 100;
        } catch (Throwable unused) {
            return false;
        }
    }

    public static b0 h(Context context, ILogger iLogger, a0 a0Var) {
        String str;
        try {
            PackageInfo packageInfoE = e(context, 0, iLogger, a0Var);
            PackageManager packageManager = context.getPackageManager();
            if (packageInfoE == null || packageManager == null) {
                return null;
            }
            str = packageInfoE.packageName;
            try {
                String installerPackageName = packageManager.getInstallerPackageName(str);
                return new b0(installerPackageName == null, installerPackageName);
            } catch (IllegalArgumentException unused) {
                iLogger.g(g3.DEBUG, "%s package isn't installed.", str);
                return null;
            }
        } catch (IllegalArgumentException unused2) {
            str = null;
        }
    }
}
