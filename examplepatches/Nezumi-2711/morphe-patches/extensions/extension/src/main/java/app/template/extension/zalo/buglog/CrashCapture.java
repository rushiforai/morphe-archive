package app.template.extension.zalo.buglog;

/**
 * Default uncaught-exception handler that writes the crash to the bug log, then hands it to the
 * handler that was installed before it so Zalo's own crash reporting and the system crash dialog
 * behave exactly as without the patch.
 *
 * <p>Zalo and its crash SDKs install their own handlers after {@code attachBaseContext}, and one
 * branch of Zalo's handler calls {@code System.exit} without delegating. So the handler is
 * re-wrapped on top whenever an activity is created or resumed, and each throwable is logged once
 * even if it passes through several of our wrappers in the chain.
 */
final class CrashCapture implements Thread.UncaughtExceptionHandler {
    private static final String EXTENSION_PACKAGE = "app.template.extension.";
    private static volatile Throwable lastLogged;

    private final Thread.UncaughtExceptionHandler next;

    private CrashCapture(Thread.UncaughtExceptionHandler next) {
        this.next = next;
    }

    static void ensureInstalled() {
        try {
            Thread.UncaughtExceptionHandler current = Thread.getDefaultUncaughtExceptionHandler();
            if (current instanceof CrashCapture) return;
            Thread.setDefaultUncaughtExceptionHandler(new CrashCapture(current));
        } catch (Throwable ignored) {
            // A SecurityManager or a hostile handler must not break startup.
        }
    }

    @Override
    public void uncaughtException(Thread thread, Throwable failure) {
        try {
            if (failure != lastLogged) {
                lastLogged = failure;
                String marker = touchesExtension(failure) ? " [nezumi-frame]" : "";
                NezumiLog.fileNow('E', "Crash", "uncaught exception in thread \"" + thread.getName() + "\"" + marker, failure);
            }
        } catch (Throwable ignored) {
            // Fall through to the original handler no matter what.
        }
        if (next != null) {
            next.uncaughtException(thread, failure);
        } else {
            android.os.Process.killProcess(android.os.Process.myPid());
            System.exit(10);
        }
    }

    /** True when any frame of the throwable or its causes runs Nezumi extension code. */
    private static boolean touchesExtension(Throwable failure) {
        int depth = 0;
        for (Throwable current = failure; current != null && depth < 16; current = current.getCause(), depth++) {
            for (StackTraceElement frame : current.getStackTrace()) {
                if (frame.getClassName().startsWith(EXTENSION_PACKAGE)) return true;
            }
        }
        return false;
    }
}
