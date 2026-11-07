package app.noam.extension.chesscom.crash;

import android.content.Context;
import android.content.Intent;
import android.util.Log;

import java.io.File;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.io.StringWriter;

import app.noam.extension.chesscom.Features;

/**
 * Shows a crash screen with the stack trace instead of the plain "app stopped" dialog, so a
 * report can say what went wrong. Adapted from Prathxm's crash handler (GPL-3.0).
 */
public final class CrashHandler implements Thread.UncaughtExceptionHandler {
    private static final String TAG = "MorpheCrash";
    private static final String FILE = "last-crash.txt";
    /** Keeps the text well below the Binder limit for intent extras. */
    private static final int MAX_CHARS = 100_000;

    private static volatile boolean handling;
    private static Context context;

    private final Thread.UncaughtExceptionHandler previous;

    private CrashHandler(Context context) {
        this.previous = Thread.getDefaultUncaughtExceptionHandler();
    }

    public static void install(Context app) {
        if (app == null || !Features.crashPatched()) return;
        if (Thread.getDefaultUncaughtExceptionHandler() instanceof CrashHandler) return;
        context = app.getApplicationContext();
        Thread.setDefaultUncaughtExceptionHandler(new CrashHandler(context));
        Log.i(TAG, "Crash handler installed");
    }

    @Override
    public void uncaughtException(Thread thread, Throwable throwable) {
        if (handling) {
            if (previous != null) previous.uncaughtException(thread, throwable);
            return;
        }
        handling = true;
        try {
            Log.e(TAG, "Uncaught exception", throwable);
            String trace = describe(throwable);
            keep(trace);

            Intent intent = new Intent(context, CrashActivity.class);
            intent.putExtra("trace", trace);
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
            context.startActivity(intent);

            android.os.Process.killProcess(android.os.Process.myPid());
            System.exit(10);
        } catch (Throwable failed) {
            Log.e(TAG, "The crash screen failed", failed);
            if (previous != null) previous.uncaughtException(thread, throwable);
        }
    }

    /** The stack trace with the app, device and patch details above it. */
    private static String describe(Throwable throwable) {
        StringWriter buffer = new StringWriter();
        PrintWriter writer = new PrintWriter(buffer);
        throwable.printStackTrace(writer);
        writer.flush();
        String trace = buffer.toString();
        if (trace.length() > MAX_CHARS) trace = trace.substring(0, MAX_CHARS) + "\n... (cut)";

        return "--- About ---\n"
            + "App: " + appVersion() + "\n"
            + "Patch: Quwi's Chess Patches\n"
            + "Device: " + android.os.Build.MODEL + "\n"
            + "Android: " + android.os.Build.VERSION.RELEASE + " (SDK " + android.os.Build.VERSION.SDK_INT + ")\n"
            + "----------------\n\n" + trace;
    }

    private static String appVersion() {
        try {
            return context.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionName;
        } catch (Throwable ignored) {
            return "unknown";
        }
    }

    /** Keeps the last crash in the app's files, so it can still be sent if the screen fails. */
    private static void keep(String trace) {
        try {
            File file = new File(context.getFilesDir(), FILE);
            FileWriter writer = new FileWriter(file, false);
            try {
                writer.write(trace);
            } finally {
                writer.close();
            }
        } catch (Throwable throwable) {
            Log.e(TAG, "The crash could not be saved", throwable);
        }
    }
}
