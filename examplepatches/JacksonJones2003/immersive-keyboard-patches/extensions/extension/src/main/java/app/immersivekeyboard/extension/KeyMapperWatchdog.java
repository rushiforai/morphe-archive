package app.immersivekeyboard.extension;

import android.content.pm.PackageManager;
import android.util.Log;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.lang.reflect.Method;

import rikka.shizuku.Shizuku;
import rikka.shizuku.ShizukuProvider;

/**
 * Restarts Key Mapper's Expert Mode system bridge when it stops or holds no input device.
 * After the app is killed, the bridge can keep running without a usable device list, which
 * Key Mapper reports as "Trigger device not connected!" until the bridge is restarted.
 * It lives in Gboard because vivo's cleaner rarely kills the keyboard, and runs from this
 * provider so that no keyboard code is touched. The commands below are the only ones it runs.
 */
@SuppressWarnings("unused")
public final class KeyMapperWatchdog extends ShizukuProvider {
    private static final String TAG = "KeyMapperWatchdog";
    private static final String KEY_MAPPER = "io.github.sds100.keymapper";
    private static final String START_SCRIPT =
        "/storage/emulated/0/Android/data/" + KEY_MAPPER + "/start.sh";
    private static final int PERMISSION_REQUEST = 7301;

    private static final long CHECK_INTERVAL_MS = 30_000;
    private static final int FAILED_CHECKS_BEFORE_RESTART = 3;
    private static final long FIRST_COOLDOWN_MS = 5 * 60_000;
    private static final long MAX_COOLDOWN_MS = 60 * 60_000;
    private static final String COMMAND_TIMEOUT_SECONDS = "20";

    /**
     * Prints the number of input devices the bridge holds, which is 0 if the bridge isn't running.
     * Prints nothing while the app is down, as a running bridge can't hold anything without it.
     */
    private static final String CHECK =
        "a=$(pidof " + KEY_MAPPER + "); b=$(pidof keymapper_sysbridge); "
            + "if [ -z \"$b\" ]; then echo 0; elif [ -n \"$a\" ]; then "
            + "ls -l /proc/$b/fd 2>/dev/null | grep -c /dev/input/; fi";

    /** Only restarts with a script written for the installed Key Mapper. */
    private static final String RESTART =
        "p=$(pm path " + KEY_MAPPER + " | head -n 1 | cut -d: -f2); "
            + "[ -n \"$p\" ] && grep -qF \"$p\" " + START_SCRIPT + " && "
            + "sh " + START_SCRIPT + " >/dev/null 2>&1 </dev/null";

    private static boolean started;

    @Override
    public boolean onCreate() {
        boolean created = super.onCreate();
        start();
        return created;
    }

    private static synchronized void start() {
        if (started) {
            return;
        }
        started = true;

        Thread thread = new Thread(KeyMapperWatchdog::run, TAG);
        thread.setDaemon(true);
        thread.setPriority(Thread.MIN_PRIORITY);
        thread.start();
    }

    private static void run() {
        int failedChecks = 0;
        long cooldown = FIRST_COOLDOWN_MS;
        boolean permissionRequested = false;

        while (true) {
            try {
                Thread.sleep(CHECK_INTERVAL_MS);

                if (!Shizuku.pingBinder()) {
                    failedChecks = 0;
                    continue;
                }
                if (Shizuku.checkSelfPermission() != PackageManager.PERMISSION_GRANTED) {
                    if (!permissionRequested && !Shizuku.shouldShowRequestPermissionRationale()) {
                        permissionRequested = true;
                        Shizuku.requestPermission(PERMISSION_REQUEST);
                    }
                    continue;
                }

                String devices = execute(CHECK).trim();
                if (!devices.equals("0")) {
                    // Holding a device, or waiting for the app to come back.
                    failedChecks = 0;
                    if (!devices.isEmpty()) {
                        cooldown = FIRST_COOLDOWN_MS;
                    }
                    continue;
                }

                failedChecks++;
                if (failedChecks < FAILED_CHECKS_BEFORE_RESTART) {
                    continue;
                }

                // Key maps that are paused also hold no devices, and Expert Mode stopped on
                // purpose comes back too, so back off between attempts rather than forever.
                Log.i(TAG, "Bridge is stopped or holds no input devices. Restarting it.");
                execute(RESTART);
                failedChecks = 0;
                Thread.sleep(cooldown);
                cooldown = Math.min(cooldown * 2, MAX_COOLDOWN_MS);
            } catch (InterruptedException e) {
                return;
            } catch (Throwable e) {
                // Must never take the keyboard down with it.
                Log.w(TAG, "Check failed", e);
                failedChecks = 0;
            }
        }
    }

    private static String execute(String command) throws Exception {
        // Not public, but it runs the command directly, as Key Mapper's own fallback does.
        Method newProcess = Shizuku.class.getDeclaredMethod(
            "newProcess", String[].class, String[].class, String.class);
        newProcess.setAccessible(true);
        Process process = (Process) newProcess.invoke(
            null, new String[]{"timeout", COMMAND_TIMEOUT_SECONDS, "sh", "-c", command}, null, null);

        try {
            ByteArrayOutputStream output = new ByteArrayOutputStream();
            try (InputStream input = process.getInputStream()) {
                byte[] buffer = new byte[256];
                int read;
                while ((read = input.read(buffer)) != -1) {
                    output.write(buffer, 0, read);
                }
            }
            // The output ending means the command is done. Shizuku's process doesn't support
            // the timed waitFor, and timeout above stops a command that gets stuck.
            return output.toString();
        } finally {
            process.destroy();
        }
    }
}
