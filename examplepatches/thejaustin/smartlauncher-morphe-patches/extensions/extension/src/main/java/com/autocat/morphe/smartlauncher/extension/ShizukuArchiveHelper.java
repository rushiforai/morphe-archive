package com.autocat.morphe.smartlauncher.extension;

import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.Binder;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.os.Parcel;
import android.os.RemoteException;
import android.util.Log;
import android.widget.Toast;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

/**
 * Shizuku privileged app archiving & unarchiving helper with auto-bootstrap IPC connection.
 * Connects to Shizuku service via REQUEST_BINDER broadcast when ShizukuProvider is absent from manifest.
 */
@SuppressWarnings("unused")
public class ShizukuArchiveHelper {

    private static final String TAG = "ShizukuArchiveHelper";
    public static final int SHIZUKU_REQ_CODE = 1001;

    private static final Handler MAIN_HANDLER = new Handler(Looper.getMainLooper());
    private static volatile Context sContext = null;
    private static volatile IBinder sShizukuBinder = null;
    private static volatile boolean sListenerRegistered = false;

    private static final Binder sServiceConnection = new Binder() {
        @Override
        protected boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
            if (code == 1) { // connected(IBinder binder)
                try {
                    data.enforceInterface("moe.shizuku.server.IShizukuServiceConnection");
                } catch (Throwable ignored) {}
                IBinder binder = data.readStrongBinder();
                if (binder != null) {
                    sShizukuBinder = binder;
                    try {
                        Class<?> shizukuClass = Class.forName("rikka.shizuku.Shizuku");
                        Method onReceived = shizukuClass.getMethod("onBinderReceived", IBinder.class, String.class);
                        String pkg = (sContext != null) ? sContext.getPackageName() : "ginlemon.flowerfree";
                        onReceived.invoke(null, binder, pkg);
                        Log.i(TAG, "Shizuku binder successfully connected & registered for " + pkg);
                    } catch (Throwable t) {
                        Log.e(TAG, "Failed to invoke Shizuku.onBinderReceived", t);
                    }
                }
                if (reply != null) {
                    reply.writeNoException();
                }
                return true;
            } else if (code == 2) { // died
                sShizukuBinder = null;
                Log.w(TAG, "Shizuku service connection died");
                if (reply != null) reply.writeNoException();
                return true;
            }
            return super.onTransact(code, data, reply, flags);
        }
    };

    public enum Status {
        ACTIVE,
        PERMISSION_REQUIRED,
        NOT_RUNNING
    }

    public static void setContext(Context context) {
        if (context != null) {
            sContext = context.getApplicationContext();
            ensureInitialized(sContext);
        }
    }

    public static void ensureInitialized(Context context) {
        if (context != null && sContext == null) {
            sContext = context.getApplicationContext();
        }
        if (isShizukuAlive()) {
            return;
        }

        final Context ctx = (context != null) ? context.getApplicationContext() : sContext;
        if (ctx == null) return;

        try {
            Bundle bundle = new Bundle();
            bundle.putBinder("binder", sServiceConnection);

            Intent intent = new Intent("rikka.shizuku.intent.action.REQUEST_BINDER");
            intent.putExtra("data", bundle);
            intent.putExtra("callingPackage", ctx.getPackageName());
            intent.putExtra("callingUid", android.os.Process.myUid());

            for (String pkg : new String[]{"moe.shizuku.privileged.api", "af.shizuku.plus.api"}) {
                try {
                    Intent explicit = new Intent(intent);
                    explicit.setPackage(pkg);
                    ctx.sendBroadcast(explicit);
                } catch (Throwable ignored) {}
            }
            Log.d(TAG, "REQUEST_BINDER broadcast dispatched");
        } catch (Throwable t) {
            Log.w(TAG, "Failed to dispatch REQUEST_BINDER broadcast", t);
        }
    }

    public static boolean waitForConnection(long timeoutMs) {
        if (isShizukuAlive()) return true;
        ensureInitialized(sContext);
        long start = System.currentTimeMillis();
        while (System.currentTimeMillis() - start < timeoutMs) {
            if (isShizukuAlive()) return true;
            try {
                Thread.sleep(50);
            } catch (InterruptedException ignored) {
                break;
            }
        }
        return isShizukuAlive();
    }

    public static Status getStatus() {
        if (!isShizukuAlive()) {
            waitForConnection(300);
        }
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
            if (isAlive != null && isAlive) {
                return true;
            }
        } catch (Throwable ignored) {}

        if (sShizukuBinder != null) {
            try {
                return sShizukuBinder.pingBinder();
            } catch (Throwable ignored) {}
        }
        return false;
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

    public static void requestPermissionWithFeedback(final Context context) {
        requestPermissionWithFeedback(context, null, false);
    }

    public static void requestPermissionWithFeedback(final Context context, final String retryPackage, final boolean retryUnarchive) {
        ensureInitialized(context);
        if (!waitForConnection(1000)) {
            postToast(context, "Shizuku service is not running. Please start Shizuku first.");
            return;
        }
        if (hasPermission()) {
            postToast(context, "Shizuku permission is already granted!");
            if (retryPackage != null) {
                MorpheMenuInjector.performArchiveOrRestoreAsync(context, retryPackage, retryUnarchive);
            }
            return;
        }

        registerPermissionResultListener(context, retryPackage, retryUnarchive);
        postToast(context, "Requesting Shizuku permission…");
        requestShizukuPermission(SHIZUKU_REQ_CODE);
    }

    private static void registerPermissionResultListener(final Context context, final String retryPackage, final boolean retryUnarchive) {
        if (sListenerRegistered) return;
        try {
            Class<?> listenerClass = Class.forName("rikka.shizuku.Shizuku$OnRequestPermissionResultListener");
            Class<?> shizukuClass = Class.forName("rikka.shizuku.Shizuku");

            Object listenerProxy = Proxy.newProxyInstance(
                    listenerClass.getClassLoader(),
                    new Class<?>[]{listenerClass},
                    new InvocationHandler() {
                        @Override
                        public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
                            if ("onRequestPermissionResult".equals(method.getName()) && args != null && args.length >= 2) {
                                int reqCode = (Integer) args[0];
                                int grantResult = (Integer) args[1];
                                Log.i(TAG, "onRequestPermissionResult: req=" + reqCode + ", grant=" + grantResult);
                                if (reqCode == SHIZUKU_REQ_CODE && grantResult == PackageManager.PERMISSION_GRANTED) {
                                    postToast(context, "Shizuku permission granted!");
                                    if (retryPackage != null) {
                                        MorpheMenuInjector.performArchiveOrRestoreAsync(context, retryPackage, retryUnarchive);
                                    }
                                }
                            }
                            return null;
                        }
                    }
            );

            Method addListenerMethod = shizukuClass.getMethod("addRequestPermissionResultListener", listenerClass);
            addListenerMethod.invoke(null, listenerProxy);
            sListenerRegistered = true;
            Log.i(TAG, "Registered OnRequestPermissionResultListener");
        } catch (Throwable t) {
            Log.w(TAG, "Failed to register permission listener: " + t.getMessage());
        }
    }

    public static boolean archivePackage(final String packageName) {
        if (packageName == null || packageName.isEmpty()) return false;
        boolean ok = execCommand("cmd package archive --user 0 " + packageName);
        if (!ok) {
            ok = execCommand("pm archive --user 0 " + packageName);
        }
        if (!ok) {
            ok = execCommand("cmd package archive " + packageName);
        }
        return ok;
    }

    public static boolean unarchivePackage(final String packageName) {
        if (packageName == null || packageName.isEmpty()) return false;
        boolean ok = execCommand("cmd package request-unarchive --user 0 " + packageName);
        if (!ok) {
            ok = execCommand("pm request-unarchive --user 0 " + packageName);
        }
        if (!ok) {
            ok = execCommand("cmd package request-unarchive " + packageName);
        }
        return ok;
    }

    private static boolean execCommand(String cmd) {
        if (cmd == null) return false;

        // 1. Try rish (Shizuku shell) first — bypasses the binder bootstrap entirely,
        //    runs as uid=2000 (shell) which has the required privilege for cmd package archive.
        if (execViaRish(cmd)) {
            return true;
        }

        // 2. Try Shizuku API if binder is alive
        if (isShizukuAvailable()) {
            boolean ok = execViaShizuku(cmd);
            if (ok) return true;
        }

        // 3. Try root / su fallback
        if (execViaSu(cmd)) {
            return true;
        }

        // 4. Direct Runtime (unprivileged — will almost certainly fail for archive cmds)
        return execViaRuntime(cmd);
    }

    private static boolean execViaRish(String cmd) {
        // /data/local/tmp/rish is world-executable and deployed by our setup.
        // Termux private paths are inaccessible to Smart Launcher's UID.
        // /storage/emulated/0/Shizuku/rish is owned by ShizukuPlus (u0_a315) and may not be executable.
        final String[] rishPaths = {
            "/data/local/tmp/rish",
            "/storage/emulated/0/Shizuku/rish",
            "/data/data/com.termux/files/home/.local/bin/rish"
        };
        for (String rishPath : rishPaths) {
            try {
                java.io.File f = new java.io.File(rishPath);
                if (!f.exists()) continue;
                String appId = (sContext != null) ? sContext.getPackageName() : "ginlemon.flowerfree";
                String[] env = {"RISH_APPLICATION_ID=" + appId};
                Process process = null;
                try {
                    process = Runtime.getRuntime().exec(new String[]{rishPath, "-c", cmd}, env);
                } catch (Throwable directExecErr) {
                    process = Runtime.getRuntime().exec(new String[]{"/system/bin/sh", rishPath, "-c", cmd}, env);
                }
                if (process == null) continue;

                // If rish takes > 2s it's waiting for Shizuku authorization — tell the user
                final Context ctx = sContext;
                final Thread authHintThread = new Thread(new Runnable() {
                    @Override public void run() {
                        try {
                            Thread.sleep(2000);
                            postToast(ctx, "Check Shizuku notification — tap Allow for Smart Launcher");
                        } catch (InterruptedException ignored) {}
                    }
                });
                authHintThread.setDaemon(true);
                authHintThread.start();

                boolean ok = monitorProcess(process, "rish (" + rishPath + "): " + cmd, 25000);
                authHintThread.interrupt();
                Log.i(TAG, "execViaRish result=" + ok + " path=" + rishPath + " cmd=" + cmd);
                if (ok) return true;
            } catch (Throwable t) {
                Log.w(TAG, "execViaRish failed for path=" + rishPath + ": " + t.getMessage());
            }
        }
        return false;
    }

    private static boolean execViaShizuku(String cmd) {
        try {
            Class<?> shizukuClass = Class.forName("rikka.shizuku.Shizuku");
            Method newProcessMethod = shizukuClass.getMethod("newProcess", String[].class, String[].class, String.class);
            Process process = (Process) newProcessMethod.invoke(null, new String[]{"sh", "-c", cmd}, null, null);
            if (process != null) {
                return monitorProcess(process, "Shizuku: " + cmd, 10000);
            }
        } catch (Throwable t) {
            Log.w(TAG, "execViaShizuku failed for: " + cmd, t);
        }
        return false;
    }

    private static boolean execViaSu(String cmd) {
        for (String suBin : new String[]{"/system/bin/su", "/system/xbin/su", "/data/local/tmp/su"}) {
            try {
                java.io.File f = new java.io.File(suBin);
                if (f.exists() && f.canExecute()) {
                    Process process = Runtime.getRuntime().exec(new String[]{suBin, "-c", cmd});
                    if (process != null) {
                        boolean ok = monitorProcess(process, "su (" + suBin + "): " + cmd, 10000);
                        if (ok) return true;
                    }
                }
            } catch (Throwable ignored) {}
        }
        return false;
    }

    private static boolean execViaRuntime(String cmd) {
        try {
            Process process = Runtime.getRuntime().exec(new String[]{"sh", "-c", cmd});
            if (process != null) {
                return monitorProcess(process, "Runtime: " + cmd, 5000);
            }
        } catch (Throwable ignored) {}
        return false;
    }

    private static boolean monitorProcess(final Process proc, String tag, long timeoutMs) {
        final StringBuilder output = new StringBuilder();
        Thread stderrThread = new Thread(new Runnable() {
            @Override
            public void run() {
                try (BufferedReader reader = new BufferedReader(new InputStreamReader(proc.getErrorStream()))) {
                    String line;
                    while ((line = reader.readLine()) != null) {
                        synchronized (output) { output.append(line).append("\n"); }
                    }
                } catch (Throwable ignored) {}
            }
        });
        stderrThread.setDaemon(true);
        stderrThread.start();
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(proc.getInputStream()))) {
            String line;
            while ((line = reader.readLine()) != null) {
                synchronized (output) { output.append(line).append("\n"); }
            }
        } catch (Throwable ignored) {}
        try {
            stderrThread.join(Math.min(3000, timeoutMs));
            // Use timed waitFor instead of blocking forever
            boolean finished = proc.waitFor(timeoutMs, java.util.concurrent.TimeUnit.MILLISECONDS);
            if (!finished) {
                Log.w(TAG, tag + " timed out after " + timeoutMs + "ms, destroying");
                proc.destroyForcibly();
                return false;
            }
            int exitCode = proc.exitValue();
            String outStr = output.toString().trim();
            Log.i(TAG, tag + " exit=" + exitCode + ", out=" + outStr);
            boolean hasFailure = outStr.toLowerCase().contains("failure") || outStr.toLowerCase().contains("error");
            return (exitCode == 0 && !hasFailure) || outStr.toLowerCase().contains("success");
        } catch (Throwable t) {
            Log.w(TAG, "Process monitoring failed for: " + tag, t);
            try { proc.destroyForcibly(); } catch (Throwable ignored) {}
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
