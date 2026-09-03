package com.autocat.morphe.smartlauncher.extension;

import android.content.Context;
import android.content.pm.PackageManager;
import android.os.Handler;
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
    public static final int SHIZUKU_REQ_CODE = 1001;

    private static final ExecutorService EXECUTOR = Executors.newSingleThreadExecutor();
    private static final Handler MAIN_HANDLER = new Handler(Looper.getMainLooper());

    public enum Status {
        ACTIVE,
        PERMISSION_REQUIRED,
        NOT_RUNNING
    }

    public static Status getStatus() {
        if (!isShizukuAlive()) {
            return Status.NOT_RUNNING;
        }
        if (!hasPermission()) {
            return Status.PERMISSION_REQUIRED;
        }
        return Status.ACTIVE;
    }

    public static boolean isShizukuAlive() {
        try {
            Class<?> shizukuClass = Class.forName("rikka.shizuku.Shizuku");
            Method pingMethod = shizukuClass.getMethod("pingBinder");
            Boolean isAlive = (Boolean) pingMethod.invoke(null);
            return isAlive != null && isAlive;
        } catch (Throwable t) {
            return false;
        }
    }

    public static boolean hasPermission() {
        try {
            Class<?> shizukuClass = Class.forName("rikka.shizuku.Shizuku");
            Method checkPermMethod = shizukuClass.getMethod("checkSelfPermission");
            Integer perm = (Integer) checkPermMethod.invoke(null);
            return perm != null && perm == PackageManager.PERMISSION_GRANTED;
        } catch (Throwable t) {
            return false;
        }
    }

    public static boolean isShizukuAvailable() {
        return isShizukuAlive() && hasPermission();
    }

    public static void requestShizukuPermission(int requestCode) {
        try {
            Class<?> shizukuClass = Class.forName("rikka.shizuku.Shizuku");
            Method requestMethod = shizukuClass.getMethod("requestPermission", int.class);
            requestMethod.invoke(null, requestCode);
            Log.i(TAG, "Requested Shizuku permission with code " + requestCode);
        } catch (Throwable t) {
            Log.e(TAG, "Failed to request Shizuku permission", t);
        }
    }

    public static void requestPermissionWithFeedback(Context context) {
        if (!isShizukuAlive()) {
            postToast(context, "Shizuku service is not running. Please start Shizuku first.");
            return;
        }
        if (hasPermission()) {
            postToast(context, "Shizuku permission is already granted!");
            return;
        }
        postToast(context, "Requesting Shizuku permission…");
        requestShizukuPermission(SHIZUKU_REQ_CODE);
    }

    public static boolean archivePackage(final String packageName) {
        if (packageName == null || packageName.isEmpty()) return false;
        boolean ok = execShizukuCommand("pm archive " + packageName);
        if (!ok) {
            ok = execShizukuCommand("cmd package archive " + packageName);
        }
        return ok;
    }

    public static boolean unarchivePackage(final String packageName) {
        if (packageName == null || packageName.isEmpty()) return false;
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
                StringBuilder output = new StringBuilder();
                try (BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()))) {
                    String line;
                    while ((line = reader.readLine()) != null) {
                        output.append(line).append("\n");
                    }
                }
                try (BufferedReader errReader = new BufferedReader(new InputStreamReader(process.getErrorStream()))) {
                    String line;
                    while ((line = errReader.readLine()) != null) {
                        output.append(line).append("\n");
                    }
                }
                int exitCode = process.waitFor();
                String outStr = output.toString().trim();
                Log.i(TAG, "Shizuku cmd [" + cmd + "] exit=" + exitCode + ", out=" + outStr);
                return exitCode == 0 || outStr.toLowerCase().contains("success");
            }
        } catch (Throwable t) {
            Log.e(TAG, "Shizuku command execution failed for: " + cmd, t);
        }
        return false;
    }

    public static void postToast(final Context context, final String message) {
        if (context == null || message == null) return;
        MAIN_HANDLER.post(new Runnable() {
            @Override
            public void run() {
                try {
                    Toast.makeText(context.getApplicationContext(), message, Toast.LENGTH_SHORT).show();
                } catch (Throwable ignored) {}
            }
        });
    }
}
