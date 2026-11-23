package app.template.extension.aare.adb;

import android.Manifest;
import android.content.ContentResolver;
import android.content.Context;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.IBinder;
import android.os.Parcel;
import android.provider.Settings;
import android.util.Log;

import java.io.IOException;

import app.template.extension.aare.shell.IntegratedServer;
import rikka.shizuku.Shizuku;

/**
 * AARE's integrated Shizuku, seen from AARE: pairs with wireless debugging once, then starts the
 * shell server (IntegratedServer) whenever needed, without the Shizuku app.
 */
public final class IntegratedShizuku {
    private static final String TAG = "AarePatches";
    private static final String SERVER_NAME = "aare_shizuku_server";
    private static final String SERVER_LOG = "/data/local/tmp/aare_shizuku.log";

    /** Why the last start failed, shown in the notification and in Settings (null after a start). */
    public static String lastError(Context context) {
        return context.getSharedPreferences("aare_integrated_shizuku", Context.MODE_PRIVATE).getString("last_error", null);
    }

    private static void lastError(Context context, String error) {
        context.getSharedPreferences("aare_integrated_shizuku", Context.MODE_PRIVATE).edit().putString("last_error", error).apply();
        if (error != null) Log.w(TAG, "integrated shizuku: " + error);
    }

    /** How a start ended, for the notification. */
    public enum Result {
        STARTED, ALREADY_RUNNING, SHIZUKU_APP_RUNNING, NOT_PAIRED, WIRELESS_DEBUGGING_OFF, NO_WIFI, FAILED
    }

    private IntegratedShizuku() {
    }

    // region State

    public static boolean isPaired(Context context) {
        return AdbKey.exists(context) && context.getSharedPreferences("aare_integrated_shizuku", Context.MODE_PRIVATE)
                .getBoolean("paired", false);
    }

    private static void setPaired(Context context, boolean paired) {
        context.getSharedPreferences("aare_integrated_shizuku", Context.MODE_PRIVATE).edit().putBoolean("paired", paired).apply();
    }

    /** A Shizuku binder is alive in AARE (the integrated one, or the Shizuku app's). */
    public static boolean anyShizukuRunning() {
        try {
            return Shizuku.pingBinder();
        } catch (Throwable t) {
            return false;
        }
    }

    /** AARE's own server is the one serving AARE. */
    public static boolean isRunning() {
        try {
            if (!Shizuku.pingBinder()) return false;
            IBinder binder = Shizuku.getBinder();
            Parcel data = Parcel.obtain();
            Parcel reply = Parcel.obtain();
            try {
                return binder.transact(IntegratedServer.TRANSACTION_IS_INTEGRATED, data, reply, 0) && reply.readInt() == 1;
            } finally {
                data.recycle();
                reply.recycle();
            }
        } catch (Throwable t) {
            return false;
        }
    }

    /**
     * Our server runs from another AARE APK than the installed one (AARE was updated or patched again
     * since it started): its code is old and AARE's services can't start from it. A server too old to
     * say which APK it runs from is outdated too.
     */
    public static boolean outdated(Context context) {
        try {
            IBinder binder = Shizuku.getBinder();
            Parcel data = Parcel.obtain();
            Parcel reply = Parcel.obtain();
            try {
                if (!binder.transact(IntegratedServer.TRANSACTION_APK, data, reply, 0)) return true;
                String apk = reply.readString();
                return apk == null || !apk.equals(context.getApplicationInfo().sourceDir);
            } finally {
                data.recycle();
                reply.recycle();
            }
        } catch (Throwable t) {
            return true;
        }
    }

    public static boolean canWriteSecureSettings(Context context) {
        return context.checkSelfPermission(Manifest.permission.WRITE_SECURE_SETTINGS) == PackageManager.PERMISSION_GRANTED;
    }

    public static boolean developerOptionsEnabled(Context context) {
        return Settings.Global.getInt(context.getContentResolver(), Settings.Global.DEVELOPMENT_SETTINGS_ENABLED, 0) == 1;
    }

    private static boolean wirelessDebuggingEnabled(ContentResolver cr) {
        return Settings.Global.getInt(cr, "adb_wifi_enabled", 0) == 1;
    }

    /**
     * The phone is connected to a Wi-Fi network as usual (the one wireless debugging uses). The
     * app-private network AARE opens to a car it isn't connected to ("use a temporary Wi-Fi network")
     * doesn't count: wireless debugging says "Wi-Fi disconnected" on it.
     */
    @SuppressWarnings("deprecation")
    public static boolean onWifi(Context context) {
        try {
            android.net.wifi.WifiManager wm = context.getApplicationContext().getSystemService(android.net.wifi.WifiManager.class);
            android.net.wifi.WifiInfo info = wm != null ? wm.getConnectionInfo() : null;
            if (info != null && info.getNetworkId() != -1) return true;
            android.net.ConnectivityManager cm = context.getSystemService(android.net.ConnectivityManager.class);
            for (android.net.Network n : cm.getAllNetworks()) {
                android.net.NetworkCapabilities c = cm.getNetworkCapabilities(n);
                if (c != null && c.hasTransport(android.net.NetworkCapabilities.TRANSPORT_WIFI)
                        && c.getNetworkSpecifier() == null) return true;
            }
        } catch (Throwable ignored) {
        }
        return false;
    }

    /** Whether AARE starts the server by itself after the phone starts. */
    public static boolean autoStart(Context context) {
        return context.getSharedPreferences("aare_integrated_shizuku", Context.MODE_PRIVATE).getBoolean("auto_start", true);
    }

    public static void setAutoStart(Context context, boolean on) {
        context.getSharedPreferences("aare_integrated_shizuku", Context.MODE_PRIVATE).edit().putBoolean("auto_start", on).apply();
    }

    // endregion

    // region Pairing

    /** Pairs with the six-digit code of Wireless debugging > Pair device with pairing code. */
    public static void pair(Context context, int port, String code) throws Exception {
        AdbKey key = new AdbKey(context);
        AdbPairing.pair(key, "127.0.0.1", port, code.trim(), "AARE@" + Build.MODEL);
        setPaired(context, true);
    }

    static boolean isWrongCode(Throwable t) {
        return t instanceof AdbPairing.WrongCodeException;
    }

    // endregion

    // region Starting the server

    /**
     * Starts the server through wireless debugging (blocking, call off the main thread). With the
     * secure-settings permission (granted at the first start), AARE switches wireless debugging on
     * for the few seconds this takes, and back off when it was off.
     */
    /** One start at a time: the car's automatic start and the Start button would kill each other's server. */
    private static final Object START_LOCK = new Object();

    public static Result start(Context context) {
        synchronized (START_LOCK) {
            return startLocked(context);
        }
    }

    private static Result startLocked(Context context) {
        Result result = startServer(context);
        if (result == Result.STARTED) switchOffWirelessDebugging(context);
        return result;
    }

    /**
     * Wireless debugging isn't needed once the server runs (it keeps running without it), and an
     * open debugging port isn't something to leave on: switch it off, as the user would.
     */
    private static void switchOffWirelessDebugging(Context context) {
        if (!canWriteSecureSettings(context)) return;
        ContentResolver cr = context.getContentResolver();
        if (!wirelessDebuggingEnabled(cr)) return;
        try {
            Settings.Global.putInt(cr, "adb_wifi_enabled", 0);
            Thread.sleep(2000);
            if (!isRunning()) {
                // This phone stops the server with it: start again and leave wireless debugging on.
                Log.w(TAG, "integrated shizuku: stopped with wireless debugging, starting again");
                Settings.Global.putInt(cr, "adb_wifi_enabled", 1);
                if (startServer(context) == Result.STARTED) {
                    lastError(context, "this phone stops the server without wireless debugging: left on");
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "integrated shizuku: switch off wireless debugging", t);
        }
    }

    private static Result startServer(Context context) {
        boolean ours = isRunning();
        if (ours && !outdated(context)) return Result.ALREADY_RUNNING;
        // AARE keeps the first Shizuku it gets: with the Shizuku app's running, ours would be ignored.
        if (!ours && anyShizukuRunning()) return Result.SHIZUKU_APP_RUNNING;
        // An outdated server of ours is replaced: the start below stops it first.
        if (ours) Log.i(TAG, "integrated shizuku: the server is from an older AARE, starting it again");
        if (!isPaired(context)) return Result.NOT_PAIRED;
        // Wireless debugging works on Wi-Fi only.
        if (!onWifi(context)) return Result.NO_WIFI;
        ContentResolver cr = context.getContentResolver();
        boolean switchedOn = false;
        if (!wirelessDebuggingEnabled(cr)) {
            if (!canWriteSecureSettings(context)) return Result.WIRELESS_DEBUGGING_OFF;
            try {
                Settings.Global.putInt(cr, "adb_wifi_enabled", 1);
                switchedOn = true;
            } catch (Throwable t) {
                Log.w(TAG, "integrated shizuku: enable wireless debugging", t);
                return Result.WIRELESS_DEBUGGING_OFF;
            }
        }
        String stage = "mdns";
        try {
            int port = AdbMdns.find(context, AdbMdns.TLS_CONNECT, 10_000);
            if (port <= 0 && wirelessDebuggingEnabled(cr)) {
                // mDNS can be filtered on some networks: look for adbd on this phone directly.
                stage = "port scan";
                port = AdbMdns.scan(20_000);
                Log.i(TAG, "integrated shizuku: adb port by scan " + port);
            }
            if (port <= 0) {
                lastError(context, "wireless debugging port not found");
                return wirelessDebuggingEnabled(cr) ? Result.NO_WIFI : Result.WIRELESS_DEBUGGING_OFF;
            }
            stage = "adb connect";
            AdbKey key = new AdbKey(context);
            try (AdbClient adb = new AdbClient(key, "127.0.0.1", port)) {
                String pkg = context.getPackageName();
                String apk = context.getApplicationInfo().sourceDir;
                int uid = android.os.Process.myUid();
                // Lets AARE switch wireless debugging on by itself next time (and after a reboot).
                stage = "pm grant";
                adb.shell("pm grant " + pkg + " " + Manifest.permission.WRITE_SECURE_SETTINGS + " 2>/dev/null");
                // app_process must load AARE's code: a quick foreground run says so (or why not).
                stage = "check";
                String check = adb.shell("CLASSPATH='" + apk + "' /system/bin/app_process /system/bin "
                        + IntegratedServer.class.getName() + " --check 2>&1; echo exit=$?");
                Log.i(TAG, "integrated shizuku: " + check.trim());
                if (!check.contains("check ok")) {
                    lastError(context, "app_process: " + tail(check, 400));
                    return Result.FAILED;
                }
                stage = "start server";
                String output = adb.shell("kill $(pidof " + SERVER_NAME + ") 2>/dev/null; : >" + SERVER_LOG + "; "
                        + "CLASSPATH='" + apk + "' setsid /system/bin/app_process /system/bin --nice-name=" + SERVER_NAME + " "
                        + IntegratedServer.class.getName() + " " + pkg + " " + uid + " '" + apk + "'"
                        // adb kills the command's process group when the command ends: give setsid time to
                        // move the server out of it before ending.
                        + " </dev/null >>" + SERVER_LOG + " 2>&1 & sleep 3; echo started pid=$(pidof " + SERVER_NAME + ")");
                Log.i(TAG, "integrated shizuku: " + output.trim());

                // The server sends its binder within a few seconds.
                stage = "wait binder";
                for (int i = 0; i < 80; i++) {
                    if (isRunning()) {
                        lastError(context, null);
                        return Result.STARTED;
                    }
                    Thread.sleep(250);
                }
                // What happened, for the notification and Settings.
                String why;
                try {
                    why = adb.shell("echo pid: $(pidof " + SERVER_NAME + "); ls -l " + SERVER_LOG + " 2>&1; tail -n 12 "
                            + SERVER_LOG + " 2>&1");
                } catch (IOException e) {
                    // A fresh connection for the report.
                    try (AdbClient again = new AdbClient(key, "127.0.0.1", port)) {
                        why = again.shell("echo pid: $(pidof " + SERVER_NAME + "); tail -n 12 " + SERVER_LOG + " 2>&1");
                    } catch (Throwable t2) {
                        why = "start output: " + output.trim() + " | report: " + t2;
                    }
                }
                lastError(context, "check: " + tail(check, 80) + " | start: " + output.trim() + " | server: " + why.trim()
                        + (anyShizukuRunning() ? " | binder: not ours" : " | binder: none"));
                return Result.FAILED;
            } catch (AdbClient.NotPairedException e) {
                setPaired(context, false);
                lastError(context, "adb: key not paired anymore");
                return Result.NOT_PAIRED;
            }
        } catch (Throwable t) {
            Log.w(TAG, "integrated shizuku: start", t);
            lastError(context, stage + ": " + t);
            return Result.FAILED;
        } finally {
            if (switchedOn) {
                try {
                    Settings.Global.putInt(cr, "adb_wifi_enabled", 0);
                } catch (Throwable ignored) {
                }
            }
        }
    }

    /** A text report for Settings' "Copy diagnostics": AARE's side, then the server's. */
    public static String diagnostics(Context context) {
        StringBuilder b = new StringBuilder("AARE patches diagnostics\n");
        b.append("sdk=").append(Build.VERSION.SDK_INT).append(" paired=").append(isPaired(context))
                .append(" secure=").append(canWriteSecureSettings(context)).append('\n');
        try {
            b.append("shizuku ping=").append(Shizuku.pingBinder());
            if (Shizuku.pingBinder()) {
                b.append(" version=").append(Shizuku.getVersion()).append(" uid=").append(Shizuku.getUid())
                        .append(" granted=").append(Shizuku.checkSelfPermission() == PackageManager.PERMISSION_GRANTED);
            }
            b.append(" integrated=").append(isRunning());
            if (isRunning()) b.append(" up to date=").append(!outdated(context));
            b.append('\n');
        } catch (Throwable t) {
            b.append(" error ").append(t).append('\n');
        }
        b.append("last error: ").append(lastError(context)).append('\n');
        try {
            if (isRunning()) {
                Parcel data = Parcel.obtain();
                Parcel reply = Parcel.obtain();
                try {
                    Shizuku.getBinder().transact(IntegratedServer.TRANSACTION_DIAGNOSTICS, data, reply, 0);
                    b.append(reply.readString());
                } finally {
                    data.recycle();
                    reply.recycle();
                }
            }
        } catch (Throwable t) {
            b.append("server report: ").append(t).append('\n');
        }
        return b.toString();
    }

    private static String tail(String s, int max) {
        String t = s.trim().replace('\n', ' ');
        return t.length() <= max ? t : "…" + t.substring(t.length() - max);
    }

    /** Stops the server; AARE's Shizuku features stop until the next start. */
    public static void stop() {
        try {
            if (!isRunning()) return;
            Shizuku.getBinder().transact(IBinder.FIRST_CALL_TRANSACTION + 100 /* exit */, obtainExit(), null, IBinder.FLAG_ONEWAY);
        } catch (Throwable t) {
            Log.w(TAG, "integrated shizuku: stop", t);
        }
    }

    private static Parcel obtainExit() {
        Parcel p = Parcel.obtain();
        p.writeInterfaceToken("moe.shizuku.server.IShizukuService");
        return p;
    }

    // endregion
}
