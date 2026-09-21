package app.morphe.extension.chmate;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/** Compatibility for the generated Talk token builder in ChMate 0.8.10.243 dev. */
public final class TalkPostCompatibility {
    private TalkPostCompatibility() {}

    public static Object invoke(Method method, Object target, Object[] arguments) throws Throwable {
        // Force the generated digest wrapper down its cold path. That path calls the
        // patchable integrity helper, whose result is normalized below. The warm path
        // replaces its arithmetic seed with a fresh random value and can reintroduce
        // a divide-by-zero on later posts.
        if (method.getDeclaringClass().getName().equals("o.isAtLeastJellyBeanMR1")) {
            try {
                Class<?> state = Class.forName(
                    "o.setExtras", true, method.getDeclaringClass().getClassLoader());
                Field bucket = state.getDeclaredField("e");
                bucket.setAccessible(true);
                bucket.setLong(null, Long.MIN_VALUE);
            } catch (ReflectiveOperationException ignored) {
                // Let the generated method report its own failure if its layout changes.
            }
        }
        // 243 creates the Talk token builder in an in-memory DEX. Its outer c(String)
        // method wraps the real digest calculation in certificate-derived integrity
        // arithmetic. Re-signed APKs consequently reach either an intentional
        // ArrayIndexOutOfBoundsException or a huge allocation after the digest was
        // already calculated. Invoke only the generated callable that performs that
        // digest calculation, leaving all request/header construction in ChMate.
        if (arguments != null && arguments.length == 1 && arguments[0] instanceof String) {
            ClassLoader loader = method.getDeclaringClass().getClassLoader();
            Class<?> callableClass = Class.forName(
                "o.isAtLeastJellyBeanMR1$RemoteActionCompatParcelizer", true, loader);
            Constructor<?> constructor = callableClass.getDeclaredConstructor(String.class);
            constructor.setAccessible(true);
            Object callable = constructor.newInstance(arguments[0]);
            Method calculate = callableClass.getDeclaredMethod("a");
            calculate.setAccessible(true);
            try {
                return calculate.invoke(callable);
            } catch (InvocationTargetException error) {
                throw error.getCause();
            }
        }
        try {
            return method.invoke(target, arguments);
        } catch (InvocationTargetException error) {
            throw error.getCause();
        }
    }

    /** Normalize the certificate-dependent state returned by ChMate's integrity helper. */
    public static Object[] normalizeIntegrityState(Object[] state) {
        if (state == null || state.length < 3
            || !(state[0] instanceof int[]) || !(state[1] instanceof int[])
            || !(state[2] instanceof int[])) {
            return state;
        }
        int[] actual = (int[]) state[0];
        int[] expected = (int[]) state[1];
        int[] arithmeticSeed = (int[]) state[2];
        if (actual.length != 0 && expected.length != 0) {
            expected[0] = actual[0];
        }
        if (arithmeticSeed.length != 0) {
            // Produces the normal non-zero divisor (4920) for every Android thread ID.
            arithmeticSeed[0] = -1531869433;
        }
        return state;
    }
}
