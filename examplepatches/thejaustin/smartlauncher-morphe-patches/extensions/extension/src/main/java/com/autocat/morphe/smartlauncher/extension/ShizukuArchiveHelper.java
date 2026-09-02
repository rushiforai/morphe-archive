package com.autocat.morphe.smartlauncher.extension;

import android.content.Context;
import android.content.pm.PackageManager;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.util.Log;
import android.widget.Toast;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.lang.reflect.Method;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Pure-reflection Shizuku privileged app archiving & unarchiving helper.
 * Zero compile-time or runtime dependencies on external libraries to guarantee 100% APK stability.
 */
@SuppressWarnings("unused")
public class ShizukuArchiveHelper {

    private static final String TAG = "ShizukuArchiveHelper";
    private static final ExecutorService EXECUTOR = Executors.newSingleThreadExecutor();
    private static final Handler MAIN_HANDLER = new Handler(Looper.getMainLooper());

    public static boolean isShizukuAvailable() {
        try {
            Class<?> shizukuClass = Class.forName("rikka.shizuku.Shizuku");
            Method pingMethod = shizukuClass.getMethod("pingBinder");
            Boolean isAlive = (Boolean) pingMethod.invoke(null);
            if (isAlive != null && isAlive) {
                Method checkPermMethod = shizukuClass.getMethod("checkSelfPermission");
                Integer perm = (Integer) checkPermMethod.invoke(null);
                return perm != null && perm == PackageManager.PERMISSION_GRANTED;
            }
        } catch (Throwable t) {
            Log.w(TAG, "Shizuku reflection check returned false: " + t.getMessage());
        }
        return false;
    }

    public static void requestShizukuPermission(int requestCode) {
        try {
            Class<?> shizukuClass = Class.forName("rikka.shizuku.Shizuku");
            Method pingMethod = shizukuClass.getMethod("pingBinder");
            Boolean isAlive = (Boolean) pingMethod.invoke(null);
            if (isAlive != null && isAlive) {
                Method requestMethod = shizukuClass.getMethod("requestPermission", int.class);
                requestMethod.invoke(null, requestCode);
            }
        } catch (Throwable t) {
            Log.e(TAG, "Failed to request Shizuku permission via reflection", t);
        }
    }

    public static boolean archivePackage(final String packageName) {
        return execShizukuCommand("pm archive " + packageName);
    }

    public static boolean unarchivePackage(final String packageName) {
        boolean ok = execShizukuCommand("pm unarchive " + packageName);
        if (!ok) {
            ok = execShizukuCommand("cmd package unarchive " + packageName);
        }
        return ok;
    }

    private static boolean execShizukuCommand(String cmd) {
        if (!isShizukuAvailable() || cmd == null) {
            return false;
        }
        try {
            Class<?> shizukuClass = Class.forName("rikka.shizuku.Shizuku");
            Method newProcessMethod = shizukuClass.getMethod("newProcess", String[].class, String[].class, String.class);
            Process process = (Process) newProcessMethod.invoke(null, new String[]{"sh", "-c", cmd}, null, null);
            if (process != null) {
                process.waitFor();
                return process.exitValue() == 0;
            }
        } catch (Throwable t) {
            Log.e(TAG, "Shizuku command execution failed for: " + cmd, t);
        }
        return false;
    }

    public static void archiveApp(final Context context, final String packageName) {
        if (context == null || packageName == null || packageName.isEmpty()) {
            return;
        }

        if (!isShizukuAvailable()) {
            postToast(context, "Shizuku is not running or permission is denied");
            return;
        }

        postToast(context, "Archiving " + packageName + "...");

        EXECUTOR.execute(new Runnable() {
            @Override
            public void run() {
                boolean success = archivePackage(packageName);
                if (success) {
                    postToast(context, "Successfully archived " + packageName);
                } else {
                    postToast(context, "Failed to archive " + packageName);
                }
            }
        });
    }

    private static void postToast(final Context context, final String message) {
        MAIN_HANDLER.post(new Runnable() {
            @Override
            public void run() {
                try {
                    Toast.makeText(context.getApplicationContext(), message, Toast.LENGTH_SHORT).show();
                } catch (Throwable ignored) {
                }
            }
        });
    }
}
