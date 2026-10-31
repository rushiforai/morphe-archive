package app.badfella.peptalk.statecheck;

import android.app.Instrumentation;
import android.os.Bundle;

/** Same-signature Android instrumentation; no account, receipt or app data is written. */
public final class PepTalkStateCheck extends Instrumentation {
    @Override public void onCreate(Bundle arguments) { super.onCreate(arguments); start(); }
    @Override public void onStart() {
        Bundle result = new Bundle();
        try {
            ClassLoader loader = getTargetContext().getClassLoader();
            Class<?> state = loader.loadClass("ft.u0");
            java.lang.reflect.Field purchased = state.getField("c");
            java.lang.reflect.Field backend = state.getField("d");
            boolean oldPurchased = purchased.getBoolean(null);
            Object oldBackend = backend.get(null);
            int checks = 0;
            try {
                Class<?> plan = loader.loadClass("ft.f2");
                Object granted = loader.loadClass("ft.r0").getConstructor(plan).newInstance(plan.getEnumConstants()[0]);
                for (Object fromBackend : new Object[]{null, granted}) {
                    for (boolean fromPurchase : new boolean[]{false, true}) {
                        backend.set(null, fromBackend); purchased.setBoolean(null, fromPurchase);
                        state.getMethod("b").invoke(null);
                        if (!Boolean.TRUE.equals(state.getMethod("a").invoke(null)))
                            throw new AssertionError("Elite feature predicate is false");
                        Object flow = state.getField("a").get(null);
                        Object value = flow.getClass().getMethod("getValue").invoke(flow);
                        if (!loader.loadClass("ft.s0").isInstance(value))
                            throw new AssertionError("Elite state not published");
                        if (purchased.getBoolean(null) != fromPurchase || backend.get(null) != fromBackend)
                            throw new AssertionError("Account or purchase input changed");
                        checks++;
                    }
                }
            } finally {
                purchased.setBoolean(null, oldPurchased); backend.set(null, oldBackend);
                state.getMethod("b").invoke(null);
            }
            // Allocate a test-only service shell, so unrelated error reporting fails loudly if reached.
            Class<?> unsafeType = Class.forName("sun.misc.Unsafe");
            java.lang.reflect.Field singleton = unsafeType.getDeclaredField("theUnsafe");
            singleton.setAccessible(true);
            Object shell = unsafeType.getMethod("allocateInstance", Class.class)
                    .invoke(singleton.get(null), loader.loadClass("ys.y1"));
            Object callback = loader.loadClass("x0.c").getConstructor(int.class, Object.class).newInstance(3, shell);
            java.lang.reflect.Method invoke = callback.getClass().getMethod("invoke", Object.class);
            Class<?> code = loader.loadClass("com.revenuecat.purchases.PurchasesErrorCode");
            Class<?> error = loader.loadClass("com.revenuecat.purchases.PurchasesError");
            for (String name : new String[]{"NetworkError", "PurchaseNotAllowedError"}) {
                Object input = error.getConstructor(code, String.class).newInstance(code.getField(name).get(null), "test");
                if (invoke.invoke(callback, input) == null) throw new AssertionError("Callback did not complete");
            }
            try {
                Object input = error.getConstructor(code, String.class).newInstance(code.getField("UnknownError").get(null), "test");
                invoke.invoke(callback, input);
                throw new AssertionError("Unrelated error was swallowed");
            } catch (java.lang.reflect.InvocationTargetException expected) {
                if (!(expected.getCause() instanceof NullPointerException)) throw expected;
            }
            result.putString("result", "PASS: " + checks + " backend/purchase combinations, Elite flow, inputs preserved; two background errors ignored, unrelated error retained");
            finish(-1, result);
        } catch (Throwable error) {
            result.putString("error", error.toString()); finish(0, result);
        }
    }
}
