package app.aapam.extension.cred;

import android.os.Looper;
import android.util.Log;

public final class ImmunityExceptionHandler implements Thread.UncaughtExceptionHandler {
    private static final String TAG = "CRED_IMMUNITY";
    private final Thread.UncaughtExceptionHandler defaultHandler;

    public ImmunityExceptionHandler(Thread.UncaughtExceptionHandler defaultHandler) {
        this.defaultHandler = defaultHandler;
    }

    public static synchronized void install() {
        Thread.UncaughtExceptionHandler current = Thread.getDefaultUncaughtExceptionHandler();
        if (!(current instanceof ImmunityExceptionHandler)) {
            Thread.setDefaultUncaughtExceptionHandler(new ImmunityExceptionHandler(current));
            Log.i(TAG, "ImmunityExceptionHandler installed successfully");
        }
    }

    @Override
    public void uncaughtException(Thread t, Throwable e) {
        Looper mainLooper = Looper.getMainLooper();
        if (mainLooper != null && t != mainLooper.getThread()) {
            String msg = e.getMessage();
            if (msg != null && msg.matches("^[0-9]+$")) {
                Log.w(TAG, "Suppressed watchdog exception on background thread: " + msg, e);
                return;
            }
            String trace = Log.getStackTraceString(e);
            if (trace != null && (trace.contains("dex-id-")
                    || trace.contains("SpannedData")
                    || trace.contains("TextRenderer"))) {
                Log.w(TAG, "Suppressed dynamic payload exception on background thread: " + t.getName(), e);
                return;
            }
        }
        if (defaultHandler != null) {
            defaultHandler.uncaughtException(t, e);
        }
    }
}
