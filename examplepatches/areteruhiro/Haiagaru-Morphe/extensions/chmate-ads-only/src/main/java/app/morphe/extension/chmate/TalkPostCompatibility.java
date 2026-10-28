package app.morphe.extension.chmate;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/** Compatibility for the generated Talk token builders in ChMate 242/243 dev. */
public final class TalkPostCompatibility {
    private static final ThreadLocal<Boolean> TALK_242 = new ThreadLocal<>();
    private TalkPostCompatibility() {}

    public static Object invoke(Method method, Object target, Object[] arguments) throws Throwable {
        if (method.getDeclaringClass().getName().equals("o.success")) {
            return invoke242(method, target, arguments);
        }
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
        if (method.getDeclaringClass().getName().equals("o.isAtLeastJellyBeanMR1")
                && method.getName().equals("c")
                && arguments != null && arguments.length == 1 && arguments[0] instanceof String) {
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

    private static Object invoke242(Method method, Object target, Object[] arguments) throws Throwable {
        // 242 uses a different generated state layout from 243. Force the cold path
        // for each reflected Talk operation; the warm path creates a random seed.
        Class<?> state = Class.forName("o.GNk4", true, method.getDeclaringClass().getClassLoader());
        Field bucket = state.getDeclaredField("e");
        bucket.setAccessible(true);
        bucket.setLong(null, Long.MIN_VALUE);
        Object[] actualArguments = arguments;
        Class<?>[] types = method.getParameterTypes();
        if ("b".equals(method.getName()) && types.length == 4
                && types[0].getName().equals("o.zzcvr")
                && types[1] == String.class && types[2] == String.class && types[3] == long.class
                && arguments != null && arguments.length == 4 && arguments[3] instanceof Number) {
            // PAGSdk71 supplies seconds, while the generated authenticator divides
            // by 1000 again. Supply milliseconds only to this exact native method.
            long seconds = ((Number) arguments[3]).longValue();
            if (seconds > Long.MAX_VALUE / 1000 || seconds < Long.MIN_VALUE / 1000) {
                throw new ArithmeticException("Talk authentication timestamp overflow");
            }
            actualArguments = arguments.clone();
            actualArguments[3] = seconds * 1000;
        }
        Boolean previous = TALK_242.get();
        TALK_242.set(Boolean.TRUE);
        try {
            return method.invoke(target, actualArguments);
        } catch (InvocationTargetException error) {
            throw error.getCause();
        } finally {
            if (previous == null) TALK_242.remove();
            else TALK_242.set(previous);
        }
    }

    /** Only normalize the 242 helper while a known generated Talk method executes. */
    public static Object[] normalizeIntegrityState242(Object[] state) {
        if (!Boolean.TRUE.equals(TALK_242.get()) || state == null || state.length < 4
                || !(state[0] instanceof int[]) || !(state[2] instanceof int[])
                || !(state[3] instanceof int[])) return state;
        int[] actual = (int[]) state[0];
        int[] expected = (int[]) state[2];
        int[] seed = (int[]) state[3];
        if (actual.length == 0 || expected.length == 0 || seed.length == 0) return state;
        expected[0] = actual[0];
        // The 242 arithmetic reduces this seed to divisor 1594 and substring index
        // 12; unlike the 243 seed it does not produce a zero divisor in 242.
        seed[0] = 5704;
        return state;
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
