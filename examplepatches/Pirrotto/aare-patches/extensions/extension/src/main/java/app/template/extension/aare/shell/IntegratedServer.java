package app.template.extension.aare.shell;

import android.content.ComponentName;
import android.content.Intent;
import android.os.Binder;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.os.Parcel;
import android.os.RemoteCallbackList;
import android.os.RemoteException;
import android.util.Log;

import java.io.File;
import java.io.FileInputStream;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import moe.shizuku.api.BinderContainer;
import moe.shizuku.server.IRemoteProcess;
import moe.shizuku.server.IShizukuApplication;
import moe.shizuku.server.IShizukuService;
import moe.shizuku.server.IShizukuServiceConnection;

/**
 * AARE's integrated Shizuku: a small server that runs as the shell user (started by AARE over its
 * own wireless-debugging connection) and speaks the Shizuku API to AARE, and only to AARE.
 *
 * AARE's code uses the Shizuku API unchanged: pingBinder, checkSelfPermission, requestPermission
 * and user services (AARE's car audio, app launcher, and the patches' voice-notes helper), which
 * this server starts as shell processes like Shizuku does. Nothing else is served: no other app
 * gets the binder, and calls from other apps are refused.
 *
 * Started with:
 * CLASSPATH=&lt;AARE apk&gt; app_process /system/bin app.template.extension.aare.shell.IntegratedServer
 * &lt;package&gt; &lt;uid&gt; &lt;apk&gt;
 */
public final class IntegratedServer extends IShizukuService.Stub {
    static final String TAG = "AareShell";
    static final String NICE_NAME = "aare_shizuku";
    static final String LOG = "/data/local/tmp/aare_shizuku.log";
    /** Answered with a text report (log tail, processes), for Settings' "Copy diagnostics". */
    public static final int TRANSACTION_DIAGNOSTICS = 0x00A4A2E6;
    static final String EXTRA_BINDER = "moe.shizuku.privileged.api.intent.extra.BINDER";
    /** Answered with 1, so AARE can tell this server from the real Shizuku. */
    public static final int TRANSACTION_IS_INTEGRATED = 0x00A4A2E5; // within FIRST..LAST_CALL_TRANSACTION
    /** The AARE APK this server runs from: AARE restarts a server left from an older version. */
    public static final int TRANSACTION_APK = 0x00A4A2E7;

    private static final int SERVER_VERSION = 13;
    private static final int SERVER_PATCH_VERSION = 6;
    private static final String USER_SERVICE_ARG_TAG = "shizuku:user-service-arg-tag";
    private static final String USER_SERVICE_ARG_COMPONENT = "shizuku:user-service-arg-component";
    private static final String USER_SERVICE_ARG_VERSION_CODE = "shizuku:user-service-arg-version-code";
    private static final String USER_SERVICE_ARG_PROCESS_NAME = "shizuku:user-service-arg-process-name";
    private static final String USER_SERVICE_ARG_NO_CREATE = "shizuku:user-service-arg-no-create";
    private static final String USER_SERVICE_ARG_DAEMON = "shizuku:user-service-arg-daemon";
    private static final String USER_SERVICE_ARG_REMOVE = "shizuku:user-service-remove";
    static final String USER_SERVICE_ARG_TOKEN = "shizuku:user-service-arg-token";
    private static final int USER_SERVICE_TRANSACTION_DESTROY = 16777115;

    private final String packageName;
    private final int appUid;
    private final String apk;
    private final Handler main = new Handler(Looper.getMainLooper());
    private final ExecutorService starter = Executors.newSingleThreadExecutor();
    private final Map<String, Record> services = new HashMap<>();
    private int deliveredToPid = -1;

    /** To logcat and to stderr, which the start command keeps in /data/local/tmp/aare_shizuku.log. */
    static void log(String message, Throwable t) {
        if (t == null) Log.i(TAG, message);
        else Log.w(TAG, message, t);
        System.err.println(message + (t != null ? ": " + t : ""));
        if (t != null) t.printStackTrace();
        System.err.flush();
    }

    public static void main(String[] args) {
        System.err.println("aare server main, uid " + android.os.Process.myUid() + ", args " + args.length);
        System.err.flush();
        if (args.length == 1 && "--check".equals(args[0])) {
            // Started in the foreground by AARE to see that app_process loads AARE's code.
            System.out.println("check ok uid=" + android.os.Process.myUid() + " sdk=" + android.os.Build.VERSION.SDK_INT);
            System.exit(0);
        }
        Looper.prepareMainLooper();
        if (args.length < 3) {
            log("usage: IntegratedServer <package> <uid> <apk>", null);
            System.exit(1);
        }
        Thread.setDefaultUncaughtExceptionHandler((thread, e) -> {
            log("crash", e);
            System.exit(1);
        });
        IntegratedServer server = new IntegratedServer(args[0], Integer.parseInt(args[1]), args[2]);
        log("integrated Shizuku started for " + args[0] + " as uid " + android.os.Process.myUid(), null);
        server.watchApp();
        Looper.loop();
    }

    private IntegratedServer(String packageName, int appUid, String apk) {
        this.packageName = packageName;
        this.appUid = appUid;
        this.apk = apk;
    }

    // region Delivering the binder to AARE

    /** Sends the binder each time AARE's process (re)starts, checking every two seconds. */
    private void watchApp() {
        int pid = appPid();
        if (pid > 0 && pid != deliveredToPid) {
            try {
                Bundle extras = new Bundle();
                extras.putParcelable(EXTRA_BINDER, new BinderContainer(this));
                Providers.call(Providers.authority(packageName), "sendBinder", extras);
                deliveredToPid = pid;
                log("binder sent to " + packageName + " (pid " + pid + ")", null);
            } catch (Throwable t) {
                log("sendBinder failed", t);
            }
        }
        main.postDelayed(this::watchApp, 2000);
    }

    /** The pid of AARE's main process, or -1 if it isn't running. */
    private int appPid() {
        File[] entries = new File("/proc").listFiles();
        if (entries == null) return -1;
        for (File dir : entries) {
            String name = dir.getName();
            if (name.isEmpty() || !Character.isDigit(name.charAt(0))) continue;
            try (FileInputStream in = new FileInputStream(new File(dir, "cmdline"))) {
                byte[] buffer = new byte[256];
                int n = in.read(buffer);
                if (n <= 0) continue;
                int end = 0;
                while (end < n && buffer[end] != 0) end++;
                if (packageName.equals(new String(buffer, 0, end, StandardCharsets.UTF_8))) return Integer.parseInt(name);
            } catch (Exception ignored) {
            }
        }
        return -1;
    }

    // endregion

    // region Who may call

    private void enforceApp() {
        int uid = Binder.getCallingUid();
        if (uid != appUid && uid != android.os.Process.myUid()) {
            throw new SecurityException("integrated Shizuku only serves " + packageName);
        }
    }

    @Override
    public boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
        if (code == TRANSACTION_IS_INTEGRATED) {
            if (reply != null) reply.writeInt(1);
            return true;
        }
        if (code == TRANSACTION_APK) {
            enforceApp();
            if (reply != null) reply.writeString(apk);
            return true;
        }
        if (code == TRANSACTION_DIAGNOSTICS) {
            enforceApp();
            if (reply != null) reply.writeString(diagnostics());
            return true;
        }
        return super.onTransact(code, data, reply, flags);
    }

    private String diagnostics() {
        StringBuilder b = new StringBuilder();
        b.append("server uid=").append(android.os.Process.myUid()).append(" pid=").append(android.os.Process.myPid())
                .append(" sdk=").append(android.os.Build.VERSION.SDK_INT).append(" se=").append(getSELinuxContext()).append('\n');
        b.append("server apk exists=").append(new File(apk).exists()).append('\n');
        synchronized (services) {
            for (Record r : services.values()) {
                b.append("service ").append(r.key).append(" starting=").append(r.starting)
                        .append(" alive=").append(r.service != null && r.service.pingBinder()).append('\n');
            }
        }
        b.append(run("ps -A -o PID,USER,NAME | grep -i -e aare -e " + packageName));
        b.append("--- log\n").append(run("tail -n 40 " + LOG));
        return b.toString();
    }

    /**
     * AARE's APK now: the one this server started from, or, once AARE was updated (that file is gone),
     * the installed one. User services load AARE's code from it.
     */
    private String currentApk() {
        if (new File(apk).exists()) return apk;
        String out = run("pm path " + packageName).trim();
        for (String line : out.split("\n")) {
            line = line.trim();
            if (line.startsWith("package:") && line.endsWith("/base.apk")) {
                log("AARE was updated: user services load " + line.substring(8), null);
                return line.substring(8);
            }
        }
        return apk;
    }

    private static String run(String command) {
        try {
            java.lang.Process p = new ProcessBuilder("sh", "-c", command).redirectErrorStream(true).start();
            p.getOutputStream().close();
            byte[] out = readAll(p.getInputStream());
            p.waitFor();
            return new String(out, StandardCharsets.UTF_8);
        } catch (Throwable t) {
            return command + ": " + t + "\n";
        }
    }

    private static byte[] readAll(java.io.InputStream in) throws java.io.IOException {
        java.io.ByteArrayOutputStream out = new java.io.ByteArrayOutputStream();
        byte[] buffer = new byte[4096];
        int n;
        while ((n = in.read(buffer)) > 0) out.write(buffer, 0, n);
        return out.toByteArray();
    }

    // endregion

    // region IShizukuService

    @Override
    public int getVersion() {
        enforceApp();
        return SERVER_VERSION;
    }

    @Override
    public int getUid() {
        enforceApp();
        return android.os.Process.myUid();
    }

    @Override
    public int checkPermission(String permission) {
        enforceApp();
        try {
            Object am = Class.forName("android.app.ActivityManager").getMethod("getService").invoke(null);
            return (int) am.getClass().getMethod("checkPermission", String.class, int.class, int.class)
                    .invoke(am, permission, android.os.Process.myPid(), android.os.Process.myUid());
        } catch (Throwable t) {
            return -1;
        }
    }

    @Override
    public IRemoteProcess newProcess(String[] cmd, String[] env, String dir) {
        enforceApp();
        throw new UnsupportedOperationException("newProcess isn't served by AARE's integrated Shizuku");
    }

    @Override
    public String getSELinuxContext() {
        enforceApp();
        try (FileInputStream in = new FileInputStream("/proc/self/attr/current")) {
            byte[] b = new byte[256];
            int n = in.read(b);
            return n > 0 ? new String(b, 0, n, StandardCharsets.UTF_8).trim().replace("\u0000", "") : null;
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public String getSystemProperty(String name, String defaultValue) {
        enforceApp();
        try {
            return (String) Class.forName("android.os.SystemProperties").getMethod("get", String.class, String.class)
                    .invoke(null, name, defaultValue);
        } catch (Throwable t) {
            return defaultValue;
        }
    }

    @Override
    public void setSystemProperty(String name, String value) {
        enforceApp();
        try {
            Class.forName("android.os.SystemProperties").getMethod("set", String.class, String.class).invoke(null, name, value);
        } catch (Throwable t) {
            throw new IllegalStateException(t.getMessage());
        }
    }

    @Override
    public void requestPermission(int requestCode) {
        enforceApp();
        // Pairing wireless debugging from AARE was the user's consent.
        IShizukuApplication app = application;
        if (app == null) return;
        Bundle data = new Bundle();
        data.putBoolean("shizuku:request-permission-reply-allowed", true);
        data.putBoolean("shizuku:request-permission-reply-is-onetime", false);
        try {
            app.dispatchRequestPermissionResult(requestCode, data);
        } catch (Throwable t) {
            Log.w(TAG, "dispatchRequestPermissionResult", t);
        }
    }

    @Override
    public boolean checkSelfPermission() {
        enforceApp();
        return true;
    }

    @Override
    public boolean shouldShowRequestPermissionRationale() {
        enforceApp();
        return false;
    }

    private volatile IShizukuApplication application;

    @Override
    public void attachApplication(IShizukuApplication app, Bundle args) {
        enforceApp();
        if (app == null) return;
        application = app;
        Bundle reply = new Bundle();
        reply.putInt("shizuku:attach-reply-uid", android.os.Process.myUid());
        reply.putInt("shizuku:attach-reply-version", SERVER_VERSION);
        reply.putInt("shizuku:attach-reply-patch-version", SERVER_PATCH_VERSION);
        reply.putString("shizuku:attach-reply-secontext", getSELinuxContext());
        reply.putBoolean("shizuku:attach-reply-permission-granted", true);
        reply.putBoolean("shizuku:attach-reply-should-show-request-permission-rationale", false);
        try {
            app.bindApplication(reply);
        } catch (Throwable t) {
            Log.w(TAG, "bindApplication", t);
        }
    }

    @Override
    public void exit() {
        enforceApp();
        Log.i(TAG, "exit requested");
        main.postDelayed(() -> System.exit(0), 100);
    }

    @Override
    public void dispatchPackageChanged(Intent intent) {
    }

    @Override
    public boolean isHidden(int uid) {
        return false;
    }

    @Override
    public void dispatchPermissionConfirmationResult(int requestUid, int requestPid, int requestCode, Bundle data) {
    }

    @Override
    public int getFlagsForUid(int uid, int mask) {
        enforceApp();
        return 0;
    }

    @Override
    public void updateFlagsForUid(int uid, int mask, int value) {
        enforceApp();
    }

    // endregion

    // region User services (one shell process each, as with Shizuku)

    private final class Record {
        final String key;
        final int versionCode;
        final String token = UUID.randomUUID() + "-" + System.currentTimeMillis();
        final RemoteCallbackList<IShizukuServiceConnection> callbacks = new RemoteCallbackList<IShizukuServiceConnection>() {
            @Override
            public void onCallbackDied(IShizukuServiceConnection callback) {
                if (!daemon && getRegisteredCallbackCount() == 0) remove(Record.this);
            }
        };
        boolean daemon;
        boolean starting;
        IBinder service;
        final IBinder.DeathRecipient death = () -> remove(this);

        Record(String key, int versionCode, boolean daemon) {
            this.key = key;
            this.versionCode = versionCode;
            this.daemon = daemon;
        }

        void broadcastConnected() {
            int n = callbacks.beginBroadcast();
            for (int i = 0; i < n; i++) {
                try {
                    callbacks.getBroadcastItem(i).connected(service);
                } catch (Throwable ignored) {
                }
            }
            callbacks.finishBroadcast();
        }

        void destroy() {
            if (service != null) {
                try {
                    service.unlinkToDeath(death, 0);
                } catch (Throwable ignored) {
                }
                if (service.pingBinder()) {
                    Parcel data = Parcel.obtain();
                    try {
                        data.writeInterfaceToken(service.getInterfaceDescriptor());
                        service.transact(USER_SERVICE_TRANSACTION_DESTROY, data, null, IBinder.FLAG_ONEWAY);
                    } catch (Throwable ignored) {
                    } finally {
                        data.recycle();
                    }
                }
            }
            callbacks.kill();
        }
    }

    private void remove(Record record) {
        synchronized (services) {
            if (services.get(record.key) != record) return;
            services.remove(record.key);
        }
        record.destroy();
    }

    @Override
    public int addUserService(IShizukuServiceConnection conn, Bundle options) {
        enforceApp();
        if (conn == null || options == null) throw new IllegalArgumentException("connection or options is null");
        options.setClassLoader(ComponentName.class.getClassLoader());
        ComponentName component = options.getParcelable(USER_SERVICE_ARG_COMPONENT);
        if (component == null || !packageName.equals(component.getPackageName())) {
            throw new SecurityException("user services must belong to " + packageName);
        }
        String tag = options.getString(USER_SERVICE_ARG_TAG);
        String key = component.getPackageName() + ":" + (tag != null ? tag : component.getClassName());
        int versionCode = options.getInt(USER_SERVICE_ARG_VERSION_CODE, 1);
        boolean daemon = options.getBoolean(USER_SERVICE_ARG_DAEMON, true);
        boolean noCreate = options.getBoolean(USER_SERVICE_ARG_NO_CREATE, false);
        String suffix = options.getString(USER_SERVICE_ARG_PROCESS_NAME);

        Record record;
        boolean start = false;
        synchronized (services) {
            record = services.get(key);
            if (noCreate) {
                if (record == null) return -1;
                record.callbacks.register(conn);
                if (record.service != null && record.service.pingBinder()) {
                    record.broadcastConnected();
                    return record.versionCode;
                }
                return -1;
            }
            if (record != null && (record.versionCode != versionCode
                    || (!record.starting && (record.service == null || !record.service.pingBinder())))) {
                services.remove(key);
                record.destroy();
                record = null;
            }
            if (record == null) {
                record = new Record(key, versionCode, daemon);
                services.put(key, record);
            }
            record.daemon = daemon;
            record.callbacks.register(conn);
            if (record.service != null && record.service.pingBinder()) {
                record.broadcastConnected();
            } else if (!record.starting) {
                record.starting = true;
                start = true;
            }
        }
        log("addUserService " + key + (start ? " (start)" : " (running)"), null);
        if (start) {
            final Record r = record;
            main.postDelayed(() -> {
                if (r.starting) {
                    log("user service didn't attach in 30 s: " + r.key, null);
                    remove(r);
                }
            }, 30_000);
            starter.execute(() -> startUserService(r, component.getClassName(), suffix));
        }
        return 0;
    }

    private void startUserService(Record record, String className, String suffix) {
        String process = packageName + ":" + (suffix != null ? suffix : "user_service");
        // Output to the log file, never to this process's pipes (which close and would kill it).
        String code = currentApk();
        String cmd = "(CLASSPATH='" + code + "' /system/bin/app_process /system/bin --nice-name='" + process + "' "
                + UserServiceStarter.class.getName() + " --token='" + record.token + "' --package='" + packageName
                + "' --class='" + className + "' --uid=" + appUid + " </dev/null >>" + LOG + " 2>&1;"
                + " echo \"user service process " + process + " ended: $?\" >>" + LOG + ")&";
        log("starting user service " + className + " as " + process, null);
        try {
            java.lang.Process sh = new ProcessBuilder("sh", "-c", cmd)
                    .redirectOutput(ProcessBuilder.Redirect.appendTo(new File(LOG))).redirectErrorStream(true)
                    .start();
            sh.getOutputStream().close();
            sh.waitFor();
        } catch (Throwable t) {
            log("start user service " + className, t);
            remove(record);
        }
    }

    @Override
    public int removeUserService(IShizukuServiceConnection conn, Bundle options) {
        enforceApp();
        options.setClassLoader(ComponentName.class.getClassLoader());
        ComponentName component = options.getParcelable(USER_SERVICE_ARG_COMPONENT);
        if (component == null) return 1;
        String tag = options.getString(USER_SERVICE_ARG_TAG);
        String key = component.getPackageName() + ":" + (tag != null ? tag : component.getClassName());
        boolean removeIt = options.getBoolean(USER_SERVICE_ARG_REMOVE, true);
        Record record;
        synchronized (services) {
            record = services.get(key);
        }
        if (record == null) return 1;
        if (removeIt) {
            remove(record);
        } else if (conn != null) {
            record.callbacks.unregister(conn);
        }
        return 0;
    }

    /** Called by a user service process (shell) with its binder. */
    @Override
    public void attachUserService(IBinder binder, Bundle options) {
        enforceApp();
        if (binder == null || options == null) return;
        String token = options.getString(USER_SERVICE_ARG_TOKEN);
        Record record = null;
        synchronized (services) {
            for (Record r : services.values()) {
                if (r.token.equals(token)) {
                    record = r;
                    break;
                }
            }
        }
        if (record == null) throw new IllegalArgumentException("unknown user service token");
        record.starting = false;
        record.service = binder;
        log("user service attached: " + record.key, null);
        try {
            binder.linkToDeath(record.death, 0);
        } catch (Throwable ignored) {
        }
        record.broadcastConnected();
    }

    // endregion
}
