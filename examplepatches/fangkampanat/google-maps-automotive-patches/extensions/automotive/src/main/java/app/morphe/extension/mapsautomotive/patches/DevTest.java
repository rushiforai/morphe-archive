package app.morphe.extension.mapsautomotive.patches;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.os.Process;
import android.os.SystemClock;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;

import app.morphe.extension.shared.Utils;

/**
 * Tests for development builds only (a patches version with "-dev."): from the report screen, the
 * main process crashes in Java, crashes natively or freezes for 8 s, so the crash file, the
 * notification, safe mode and the native crash check can be tried on the car without ADB. The screen
 * leaves a request file and restarts Maps Car; the main process carries it out 10 s after its start.
 * Hidden and inert in other builds.
 */
final class DevTest {
    static final String JAVA_CRASH = "java_crash", NATIVE_CRASH = "native_crash", FREEZE = "freeze";
    private static final String FILE = "morphe_dev_test";
    private static final long DELAY_MS = 10_000, FREEZE_MS = 8000;
    /** SIGABRT, as from abort(): handled by Android's crash dumper, not by ART. */
    private static final int SIGNAL = 6;

    private DevTest() {
    }

    static boolean available() {
        String version = Utils.getPatchesReleaseVersion();
        return version != null && version.contains("-dev.");
    }

    /** From the report screen, before it restarts Maps Car. */
    static boolean request(Context context, String test) {
        if (!available()) return false;
        try (OutputStream out = new FileOutputStream(new File(context.getFilesDir(), FILE), false)) {
            out.write(test.getBytes(StandardCharsets.UTF_8));
            return true;
        } catch (IOException error) {
            ReportLog.w(ReportPatch.TAG, "dev test not requested", error);
            return false;
        }
    }

    /** From the main process's start: carries out a requested test once. */
    static void runRequested(Context context) {
        File file = new File(context.getFilesDir(), FILE);
        if (!file.isFile()) return;
        String test;
        try {
            test = new String(ReportStore.readFile(file), StandardCharsets.UTF_8).trim();
        } catch (IOException error) {
            test = "";
        }
        //noinspection ResultOfMethodCallIgnored
        file.delete();
        if (!available()) return;
        String requested = test;
        ReportLog.w(ReportPatch.TAG, "dev test " + requested + " in " + DELAY_MS / 1000 + " s");
        new Handler(Looper.getMainLooper()).postDelayed(() -> {
            switch (requested) {
                case JAVA_CRASH:
                    throw new IllegalStateException("Maps Car dev test: Java crash");
                case NATIVE_CRASH:
                    ReportLog.flush();
                    Process.sendSignal(Process.myPid(), SIGNAL);
                    break;
                case FREEZE:
                    SystemClock.sleep(FREEZE_MS);
                    break;
                default:
                    ReportLog.w(ReportPatch.TAG, "unknown dev test " + requested);
            }
        }, DELAY_MS);
    }
}
