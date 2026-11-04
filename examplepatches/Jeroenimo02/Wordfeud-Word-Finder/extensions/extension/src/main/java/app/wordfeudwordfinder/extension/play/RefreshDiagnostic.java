package app.wordfeudwordfinder.extension.play;

/**
 * V4 test builds only: what happened while refreshing. Two forms:
 * <ul>
 *   <li>the full line ({@link #text()}), e.g. {@code ForegroundSignal: jni=captured, dispatchPlatformMessage via
 *       getMethod | dispatch(dev.flutter.pigeon...,4B) OK | dispatch(...,4B) OK}, kept as {@link #last()} for the
 *       {@code refresh=} line of the error details;</li>
 *   <li>a short summary for the toast ({@link #summary()}), which must fit on a phone (testbuild 3's toast was cut
 *       off): {@code ForegroundSignal: jni 2/2 OK} or {@code ForegroundSignal: FAILED <short reason>}.</li>
 * </ul>
 * Steps hold only class/method names, outcomes, channel names and byte counts: never game ids or message contents.
 *
 * <p>Steps come from the main thread and (for the strategy itself) the caller; methods are synchronized.
 * {@link #finish()} publishes the full text once ({@link #last()}) and calls the listener with the summary.
 */
// TODO(V4): remove with the diagnostic toast after the refresh strategy is confirmed
public final class RefreshDiagnostic {
    static final int MAX_LENGTH = 400;
    static final String SEP = " | ";
    /** Longest summary (toast) text. */
    static final int MAX_SUMMARY = 60;

    private static volatile String last;

    private final Refresher.DebugLog onFinish;
    private final StringBuilder text = new StringBuilder();
    private boolean segmentOpen; // a strategy name was written and has no step yet
    private boolean finished;
    // summary of the current (last started) strategy
    private String name;
    private int expected = -1;
    private int sent;
    private String path;
    private String failure;

    RefreshDiagnostic(Refresher.DebugLog onFinish) {
        this.onFinish = onFinish;
    }

    /** The text of the last finished refresh, or null. */
    public static String last() {
        return last;
    }

    static void clearLast() {
        last = null;
    }

    /** Starts the part of one strategy: {@code "<name>: "}. */
    public synchronized void strategy(String name) {
        if (finished) return;
        if (text.length() > 0) text.append(" || ");
        text.append(clean(name)).append(": ");
        segmentOpen = true;
        this.name = clean(name);
        expected = -1;
        sent = 0;
        path = null;
        failure = null;
    }

    /** The number of messages the current strategy is about to send. */
    public synchronized void expect(int messages) {
        if (finished) return;
        expected = messages;
    }

    /** One message went out via {@code via} ("jni" or "engine"); also adds {@code label} as a step. */
    public synchronized void sent(String via, String label) {
        if (finished) return;
        sent++;
        path = via;
        step(label);
    }

    /** The current strategy failed; the first reason is kept for the summary. Also adds it as a step. */
    public synchronized void fail(String reason) {
        if (finished) return;
        if (failure == null) failure = clean(reason);
        step(reason);
    }

    /**
     * The toast text: {@code <strategy>: <path> <sent>/<expected> OK}, or {@code <strategy>: FAILED <reason>} when a
     * step failed or not all messages went out. At most {@link #MAX_SUMMARY} characters.
     */
    public synchronized String summary() {
        String s;
        if (name == null) {
            s = failure != null ? "FAILED " + failure : "no strategies";
        } else if (failure == null && expected > 0 && sent >= expected) {
            s = name + ": " + (path == null ? "" : path + " ") + sent + "/" + expected + " OK";
        } else if (failure != null) {
            s = name + ": FAILED " + failure;
        } else {
            s = name + ": FAILED " + sent + "/" + (expected < 0 ? "?" : Integer.toString(expected)) + " sent";
        }
        return s.length() > MAX_SUMMARY ? s.substring(0, MAX_SUMMARY - 1) + "…" : s;
    }

    /** Adds one step outcome. */
    public synchronized void step(String outcome) {
        if (finished) return;
        if (text.length() > 0 && !segmentOpen) text.append(SEP);
        text.append(clean(outcome));
        segmentOpen = false;
    }

    /** {@code send(<channel>,<n>B)}: the label of one message, without its contents. */
    public static String message(String verb, String channel, int bytes) {
        return verb + "(" + channel + "," + bytes + "B)";
    }

    /** A short reason for a failure: the exception's simple name and message (cause for reflection wrappers). */
    public static String reason(Throwable t) {
        if (t == null) return "?";
        Throwable c = t;
        if (c instanceof java.lang.reflect.InvocationTargetException && c.getCause() != null) c = c.getCause();
        String m = c.getMessage();
        return c.getClass().getSimpleName() + (m == null || m.isEmpty() ? "" : " " + m);
    }

    public synchronized String text() {
        String s = text.toString();
        return s.length() > MAX_LENGTH ? s.substring(0, MAX_LENGTH - 1) + "…" : s;
    }

    public synchronized boolean isFinished() {
        return finished;
    }

    /** Publishes the text once; later calls and steps are ignored. Never throws. */
    public void finish() {
        String t;
        String sum;
        synchronized (this) {
            if (finished) return;
            sum = summary();
            finished = true;
            t = text();
        }
        last = t;
        try {
            if (onFinish != null) onFinish.d(sum);
        } catch (Throwable ignored) {
            // diagnostics never affect the app
        }
    }

    static String clean(String s) {
        if (s == null) return "null";
        s = s.replace('\r', ' ').replace('\n', ' ');
        return s.length() > 120 ? s.substring(0, 120) : s;
    }
}
