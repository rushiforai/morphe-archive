package app.template.extension.extension;

import java.util.concurrent.atomic.AtomicBoolean;

/**
 * Contains the Mereframe native residency check's SecurityException at the
 * session-opening wrapper (B1e6ad...d(ZZZZFZ)[J).
 *
 * WHY A JAVA HELPER: Morphe's inline-smali compiler can't express a
 * try/catch across a JNI invoke — the .catch line is silently dropped
 * (issue #5), leaving an unhandled native throw. Wrapping the call in a real
 * JVM try/catch here actually catches it.
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

    private MereframeIntegrityHook() {}

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
            logOnce("native integrity throw contained: " + t);
            return new long[]{0L, 1L};
        }
    }

    private static void logOnce(String message) {
        if (LOGGED.compareAndSet(false, true)) {
            System.out.println("[Proteus][Integrity] " + message);
        }
    }
}
