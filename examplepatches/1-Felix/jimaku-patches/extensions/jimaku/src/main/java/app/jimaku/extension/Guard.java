package app.jimaku.extension;

/**
 * Runs Jimaku's code from YouTube's threads. Whatever it throws, errors included, is logged and
 * handed to the fault handler, and never reaches YouTube's code.
 */
public final class Guard {
    private static volatile Runnable onFault = () -> {
    };

    private Guard() {
    }

    /** What to do after a fault, such as removing the current video's subtitles. */
    public static void setOnFault(Runnable handler) {
        onFault = handler;
    }

    public static void run(String where, Runnable body) {
        try {
            body.run();
        } catch (Throwable fault) {
            JimakuLog.fault(where, fault);
            try {
                onFault.run();
            } catch (Throwable second) {
                JimakuLog.fault("fault handler", second);
            }
        }
    }
}
