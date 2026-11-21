package app.template.extension.extension;

import java.util.Collections;
import java.util.Locale;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * Contains the Mereframe native residency check's SecurityException, both at the
 * session-opening wrapper (B1e6ad...d(ZZZZFZ)[J) and at every other public
 * bridge wrapper that calls into libunnamed_raw.so.
 *
 * WHY A JAVA HELPER: Morphe's inline-smali compiler can't express a
 * try/catch across a JNI invoke — the .catch line is silently dropped
 * (issue #5), leaving an unhandled native throw. Wrapping the call in a real
 * JVM try/catch here actually catches it.
 *
 * TWO ENTRY POINTS:
 *
 * 1. {@link #openSessionWithFallback} is the pinned, shape-aware path for the
 *    session-opening wrapper. It resolves the bridge class/singleton/native
 *    method reflectively, calls the native method itself and validates the
 *    verdict's domain.
 *
 * 2. The {@code failOpen*} family is the generic path used by the wrapper
 *    sweep. Those handlers are called from a REAL try/catch that the patch
 *    installs inside each native-calling wrapper, so they only ever run when
 *    the native call already threw. Each one decides between:
 *      - an integrity failure (SecurityException / "integrity" message) —
 *        log once and hand the caller a well-formed fail-open value, so the
 *        preview/capture path keeps running on a re-signed build;
 *      - anything else — re-throw the original Throwable unchanged, so a
 *        genuinely broken call behaves exactly as it did before patching.
 *
 * The bridge instance (B1e6...->a singleton), the class name and the native
 * method name are all build-shape specific to Mereframe 0.8.4 (vc 118) —
 * they are deliberately only referenced from here so the patch has exactly
 * one place to change per build. Everything resolves reflectively; ANY
 * mismatch or throw degrades to the supplied fallback instead of crashing.
 */
public final class MereframeIntegrityHook {

    private static final String BRIDGE_CLASS = "app.unnamed.rawrecording.b.B1e6ad8077f6880e309d8da4b";
    private static final String BRIDGE_STATIC_FIELD = "a";
    private static final String NATIVE_METHOD = "nd2cccb916f63efbcf8b5b19b";

    private static final AtomicBoolean LOGGED = new AtomicBoolean(false);

    // Per-site containment log. The first contained throw at each wrapper site
    // is printed with the site's identity (docs/MEREFRAME.md triage step 2
    // reads those lines to find the wrapper that is still failing); repeats at
    // the same site and sites beyond the cap are counted, never printed.
    static final int MAX_LOGGED_SITES = 32;
    private static final Set<String> LOGGED_SITES =
            Collections.newSetFromMap(new ConcurrentHashMap<String, Boolean>());
    private static final AtomicInteger SUPPRESSED_CONTAINMENTS = new AtomicInteger();

    private MereframeIntegrityHook() {}

    // ───────────────────────────────────────────────────────────────────────
    // Pinned path: the session-opening wrapper d(ZZZZFZ)[J
    // ───────────────────────────────────────────────────────────────────────

    /**
     * Drop-in for the d(Z,Z,Z,Z,F,Z)[J wrapper. Returns a well-formed pair:
     * either the native verdict (length 2, element 1 in (0,4)) or {0L, 1L}
     * on any failure/malformation — element[1]=1 passes the caller's domain
     * check (0,4) and Jm.m's R1.c.get(1) lookup.
     *
     * Parameter order/types are bit-identical to the smali ZZZZFZ frame.
     */
    public static long[] openSessionWithFallback(
            boolean arg0, boolean arg1, boolean arg2, boolean arg3,
            float arg4, boolean arg5) {
        try {
            Class<?> bridgeClass = Class.forName(BRIDGE_CLASS);
            Object bridge = bridgeClass.getField(BRIDGE_STATIC_FIELD).get(null);
            if (bridge == null) {
                logOnce("bridge singleton null — substituting fallback");
                return new long[]{0L, 1L};
            }

            java.lang.reflect.Method nativeMethod = bridgeClass.getDeclaredMethod(
                    NATIVE_METHOD,
                    boolean.class, boolean.class, boolean.class, boolean.class,
                    float.class, boolean.class);
            nativeMethod.setAccessible(true);

            Object result = nativeMethod.invoke(bridge, arg0, arg1, arg2, arg3, arg4, arg5);

            if (result instanceof long[]) {
                long[] arr = (long[]) result;
                if (arr.length == 2 && arr[1] > 0L && arr[1] < 4L) {
                    return arr;
                }
                logOnce("native verdict malformed — substituting fallback");
                return new long[]{0L, 1L};
            }
            logOnce("native verdict not long[] — substituting fallback");
            return new long[]{0L, 1L};
        } catch (Throwable t) {
            logContainment("native integrity throw contained", t);
            return new long[]{0L, 1L};
        }
    }

    // ───────────────────────────────────────────────────────────────────────
    // Generic path: handlers installed in every other native-calling wrapper
    // ───────────────────────────────────────────────────────────────────────

    /** Void wrapper: swallow the integrity failure, return normally. */
    public static void failOpenVoid(Throwable t) {
        guard(t);
    }

    /** Reference wrapper with no typed fallback: log, then hand back null. */
    public static void failOpenNull(Throwable t) {
        guard(t);
    }

    public static boolean failOpenBoolean(Throwable t) {
        guard(t);
        return false;
    }

    public static byte failOpenByte(Throwable t) {
        guard(t);
        return 0;
    }

    public static short failOpenShort(Throwable t) {
        guard(t);
        return 0;
    }

    public static char failOpenChar(Throwable t) {
        guard(t);
        return 0;
    }

    public static int failOpenInt(Throwable t) {
        guard(t);
        return 0;
    }

    public static float failOpenFloat(Throwable t) {
        guard(t);
        return 0f;
    }

    public static long failOpenLong(Throwable t) {
        guard(t);
        return 0L;
    }

    public static double failOpenDouble(Throwable t) {
        guard(t);
        return 0d;
    }

    public static String failOpenString(Throwable t) {
        guard(t);
        return "";
    }

    /**
     * Array fallbacks use the same shape the pinned session wrapper uses:
     * two elements, element[1] == 1. Most Mereframe wrappers validate the
     * native result by length and then read element[1] as a status code in
     * (0,4), so {0,1} is the least surprising well-formed answer.
     */
    public static boolean[] failOpenBooleanArray(Throwable t) {
        guard(t);
        return new boolean[]{false, true};
    }

    public static byte[] failOpenByteArray(Throwable t) {
        guard(t);
        return new byte[]{0, 1};
    }

    public static short[] failOpenShortArray(Throwable t) {
        guard(t);
        return new short[]{0, 1};
    }

    public static char[] failOpenCharArray(Throwable t) {
        guard(t);
        return new char[]{0, 1};
    }

    public static int[] failOpenIntArray(Throwable t) {
        guard(t);
        return new int[]{0, 1};
    }

    public static long[] failOpenLongArray(Throwable t) {
        guard(t);
        return new long[]{0L, 1L};
    }

    public static float[] failOpenFloatArray(Throwable t) {
        guard(t);
        return new float[]{0f, 1f};
    }

    public static double[] failOpenDoubleArray(Throwable t) {
        guard(t);
        return new double[]{0d, 1d};
    }

    // ───────────────────────────────────────────────────────────────────────
    // Length-preserving array fallbacks
    //
    // Every array-returning wrapper validates the native result with
    // `array-length` + a fixed expected size (`p` wants 3, `m` wants 3, `V`
    // wants 3, `T` wants 12, ...). Returning a fixed two-element array used to
    // bypass that check but hand the CALLER a short array; callers that read a
    // higher index then failed elsewhere (the "RAW is safe but it didn't
    // develop" report). The patch reads the expected length out of the wrapper
    // and calls these overloads instead.
    // ───────────────────────────────────────────────────────────────────────

    private static void setStatus(long[] array) {
        if (array.length > 1) array[1] = 1L;
    }

    public static boolean[] failOpenBooleanArrayN(Throwable t, int length) {
        guard(t);
        boolean[] array = new boolean[length];
        if (array.length > 1) array[1] = true;
        return array;
    }

    public static byte[] failOpenByteArrayN(Throwable t, int length) {
        guard(t);
        byte[] array = new byte[length];
        setStatus(array);
        return array;
    }

    private static void setStatus(byte[] array) {
        if (array.length > 1) array[1] = 1;
    }

    public static short[] failOpenShortArrayN(Throwable t, int length) {
        guard(t);
        short[] array = new short[length];
        setStatus(array);
        return array;
    }

    private static void setStatus(short[] array) {
        if (array.length > 1) array[1] = 1;
    }

    public static char[] failOpenCharArrayN(Throwable t, int length) {
        guard(t);
        char[] array = new char[length];
        setStatus(array);
        return array;
    }

    private static void setStatus(char[] array) {
        if (array.length > 1) array[1] = 1;
    }

    public static int[] failOpenIntArrayN(Throwable t, int length) {
        guard(t);
        int[] array = new int[length];
        setStatus(array);
        return array;
    }

    private static void setStatus(int[] array) {
        if (array.length > 1) array[1] = 1;
    }

    public static long[] failOpenLongArrayN(Throwable t, int length) {
        guard(t);
        long[] array = new long[length];
        setStatus(array);
        return array;
    }

    public static float[] failOpenFloatArrayN(Throwable t, int length) {
        guard(t);
        float[] array = new float[length];
        setStatus(array);
        return array;
    }

    private static void setStatus(float[] array) {
        if (array.length > 1) array[1] = 1f;
    }

    public static double[] failOpenDoubleArrayN(Throwable t, int length) {
        guard(t);
        double[] array = new double[length];
        setStatus(array);
        return array;
    }

    private static void setStatus(double[] array) {
        if (array.length > 1) array[1] = 1d;
    }

    /**
     * Decide what a wrapper's thrown Throwable means.
     *
     * An integrity failure is logged once and absorbed by the caller's
     * fail-open return value. Every other Throwable is re-thrown verbatim:
     * the sweep must never turn an unrelated bug into a silently wrong
     * camera result, so unknown failures keep their original stack and
     * behave exactly as they did before the patch.
     */
    private static void guard(Throwable t) {
        if (!isIntegrityFailure(t)) {
            // Bound explicitly so the helper's `throws T` resolves to
            // RuntimeException regardless of the compiler's inference rules.
            MereframeIntegrityHook.<RuntimeException>sneakyThrow(t);
        }
        logContainment("wrapper integrity throw contained", t);
    }

    /**
     * The native engine JNI-throws java.lang.SecurityException("app integrity
     * check failed") on re-signed builds. Match on the type first (that is
     * what every field stack shows) and fall back to the message, so a
     * differently-typed but clearly-integrity throw is still contained.
     * The cause chain is walked a few levels for wrapped throws.
     */
    private static boolean isIntegrityFailure(Throwable t) {
        Throwable current = t;
        for (int depth = 0; current != null && depth < 5; depth++) {
            if (current instanceof SecurityException) {
                return true;
            }
            String message = current.getMessage();
            if (message != null && message.toLowerCase(Locale.US).contains("integrity")) {
                return true;
            }
            current = current.getCause();
        }
        return false;
    }

    /** Re-throw the original Throwable without wrapping it in a new one. */
    @SuppressWarnings("unchecked")
    private static <T extends Throwable> void sneakyThrow(Throwable t) throws T {
        throw (T) t;
    }

    // ───────────────────────────────────────────────────────────────────────
    // Containment logging
    //
    // The patching runbook (docs/MEREFRAME.md) triages a still-failing build
    // from these lines, so each one must name the wrapper whose native call
    // threw. The Throwable's own stack carries that identity: frame 0 is the
    // wrapper (or its native method); the hook frames are skipped.
    // ───────────────────────────────────────────────────────────────────────

    /** Pure: "wrapper integrity throw contained at <site>: <throwable>". */
    static String containmentLabel(String prefix, Throwable t) {
        return prefix + " at " + callSite(t) + ": " + t;
    }

    private static final String HOOK_CLASS = "app.template.extension.extension.MereframeIntegrityHook";

    /** Pure: the first stack frame outside this hook class = the guarded wrapper. */
    static String callSite(Throwable t) {
        StackTraceElement[] stack = t.getStackTrace();
        if (stack != null) {
            for (StackTraceElement frame : stack) {
                String className = frame.getClassName();
                if (!className.equals(HOOK_CLASS) && !className.startsWith(HOOK_CLASS + "$")) {
                    return className + "." + frame.getMethodName();
                }
            }
        }
        return "unknown";
    }

    /** Bounded dedup: true exactly once per site, false for every repeat. */
    static boolean shouldLogSite(String site) {
        if (LOGGED_SITES.size() >= MAX_LOGGED_SITES && !LOGGED_SITES.contains(site)) {
            SUPPRESSED_CONTAINMENTS.incrementAndGet();
            return false;
        }
        boolean first = LOGGED_SITES.add(site);
        if (!first) SUPPRESSED_CONTAINMENTS.incrementAndGet();
        return first;
    }

    private static void logContainment(String prefix, Throwable t) {
        if (shouldLogSite(callSite(t))) {
            System.out.println("[Proteus][Integrity] " + containmentLabel(prefix, t));
        }
    }

    private static void logOnce(String message) {
        if (LOGGED.compareAndSet(false, true)) {
            System.out.println("[Proteus][Integrity] " + message);
        }
    }
}
