import android.content.Context;
import android.content.ContextWrapper;
import android.content.SharedPreferences;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

/** Executes actual emitted Twitch methods on ART, with uninitialized owners to detect fallthrough.
 * Compile against compile-only bx50/nig stubs (Twitch 31.8.0's Spade callback and its error type); omit both
 * stubs from the probe DEX. The other names come from the APK's locators; the fallbacks are Twitch 31.7.0's:
 * Spade dispatcher jn0, client ads ms/os, Crashlytics arbiter apc.
 * CLASSPATH=probe.jar:patched.apk app_process / PrivacyAdsProbe
 */
public final class PrivacyAdsProbe {
    private static final Map<String, Boolean> switches = new HashMap<>();

    private static void check(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }

    private static Object allocate(Class<?> type) throws Exception {
        Class<?> unsafe = Class.forName("sun.misc.Unsafe");
        Object instance = unsafe.getMethod("getUnsafe").invoke(null);
        return unsafe.getMethod("allocateInstance", Class.class).invoke(instance, type);
    }

    private static void originalMustFail(Method method, Object receiver, Object... arguments) throws Exception {
        try {
            method.invoke(receiver, arguments);
            throw new AssertionError("Disabled analytics did not reach original " + method.getName());
        } catch (InvocationTargetException expected) {
            check(expected.getCause() instanceof NullPointerException, "Unexpected original SDK result: " + expected.getCause());
        }
    }

    private static void settings() throws Exception {
        SharedPreferences preferences = (SharedPreferences) Proxy.newProxyInstance(
            SharedPreferences.class.getClassLoader(), new Class<?>[]{SharedPreferences.class},
            (proxy, method, values) -> {
                if (method.getName().equals("getBoolean")) {
                    return switches.getOrDefault((String) values[0], (Boolean) values[1]);
                }
                throw new UnsupportedOperationException(method.getName());
            });
        Context context = new ContextWrapper(null) {
            @Override public Context getApplicationContext() { return this; }
            @Override public SharedPreferences getSharedPreferences(String name, int mode) { return preferences; }
        };
        Field field = Class.forName("io.github.jordanwoodson.extension.shared.settings.Settings").getDeclaredField("context");
        field.setAccessible(true);
        field.set(null, context);
    }

    public static void main(String[] args) throws Exception {
        if (args.length > 0) ProbeLocators.load(args[0]);
        System.out.println(ProbeLocators.loaded() ? "names from the APK's locators" : "no locators in the APK: 31.7.0 names");
        settings();
        switches.put("disable_analytics", true);
        // The callback type bx50 stays the compile-time stub's name; the rest come from the locators.
        Class<?> dispatcher = Class.forName(ProbeLocators.type("twitch.match.spade_event", "jn0"));
        Object owner = allocate(dispatcher);
        Method send = dispatcher.getMethod(ProbeLocators.method("twitch.match.spade_event", "d"),
            String.class, LinkedHashMap.class, bx50.class, boolean.class);
        // R8 removed bx50's empty constructor, so bypass our compile-only constructor as well.
        SpadeCallback callback = (SpadeCallback) allocate(SpadeCallback.class);
        send.invoke(owner, "test_event", new LinkedHashMap<>(), callback, false);
        check(callback.successes == 1 && callback.failures == 0, "Spade must complete success exactly once");
        check(callback.value == null, "Spade empty success response changed");
        send.invoke(owner, "test_event", new LinkedHashMap<>(), null, true);
        check(callback.successes == 1, "Null callback must return without dispatching");
        switches.put("disable_analytics", false);
        try {
            send.invoke(owner, "test_event", new LinkedHashMap<>(), callback, false);
            throw new AssertionError("Disabled patch did not reach original dispatcher");
        } catch (InvocationTargetException expected) {
            check(expected.getCause() instanceof NullPointerException, "Original owner must be uninitialized");
        }
        check(callback.successes == 1 && callback.failures == 0, "Disabled gate unexpectedly completed callback");

        switches.put("block_client_ads", true);
        Class<?> observerType = Class.forName("io.reactivex.v");
        final Object[] result = new Object[1];
        final int[] calls = new int[2];
        Object observer = Proxy.newProxyInstance(observerType.getClassLoader(), new Class<?>[]{observerType},
            (proxy, method, values) -> {
                if (method.getName().equals("onSuccess")) { calls[0]++; result[0] = values[0]; }
                else if (method.getName().equals("b")) { calls[1]++; throw new AssertionError(values[0]); }
                return null;
            });
        Class<?> emitterType = Class.forName("io.reactivex.internal.operators.single.c");
        Object emitter = emitterType.getConstructor(observerType).newInstance(observer);
        Class<?> merged = Class.forName(ProbeLocators.type("twitch.match.client_ad_eligibility", "ms"));
        String eligibility = ProbeLocators.method("twitch.match.client_ad_eligibility", "h");
        Object request = merged.getConstructor(int.class, Object.class, Object.class)
            .newInstance(0, allocate(Class.forName(ProbeLocators.type("twitch.block_client_ads.request", "os"))), null);
        merged.getMethod(eligibility, emitterType).invoke(request, emitter);
        check(calls[0] == 1 && calls[1] == 0, "Client-ad eligibility must complete once without error");
        check(result[0].getClass().getName().equals("tv.twitch.android.util.Optional"), "Wrong eligibility result type");
        Field optionalValue = result[0].getClass().getDeclaredField("a");
        optionalValue.setAccessible(true);
        check(Boolean.FALSE.equals(optionalValue.get(result[0])), "Eligibility must be explicitly false, not absent");
        check(Boolean.TRUE.equals(emitterType.getMethod("isDisposed").invoke(emitter)), "Single emitter must finish");
        switches.put("block_client_ads", false);
        try {
            Object nextEmitter = emitterType.getConstructor(observerType).newInstance(observer);
            merged.getMethod(eligibility, emitterType).invoke(request, nextEmitter);
            throw new AssertionError("Disabled ad patch did not reach the original eligibility code");
        } catch (InvocationTargetException expected) {
            check(expected.getCause() instanceof NullPointerException, "Original ad dependencies must remain uninitialized");
        }
        check(calls[0] == 1 && calls[1] == 0, "Disabled client-ad gate unexpectedly emitted a result");

        switches.put("disable_analytics", true);
        Class<?> arbiterType = Class.forName(ProbeLocators.type("twitch.match.crashlytics_arbiter", "apc"));
        Object arbiter = allocate(arbiterType);
        // Its one no-argument boolean: whether automatic collection may upload.
        Method collectionPermission = null;
        for (Method method : arbiterType.getDeclaredMethods()) {
            if (method.getParameterCount() == 0 && method.getReturnType() == boolean.class) {
                check(collectionPermission == null, "Several Crashlytics permission getters");
                collectionPermission = method;
            }
        }
        check(Boolean.FALSE.equals(collectionPermission.invoke(arbiter)), "Crashlytics automatic upload permission must be false");
        Class<?> crashlyticsType = Class.forName("com.google.firebase.crashlytics.FirebaseCrashlytics");
        Object crashlytics = allocate(crashlyticsType);
        Method unsent = crashlyticsType.getMethod("sendUnsentReports");
        Method log = crashlyticsType.getMethod("log", String.class);
        Method exception = crashlyticsType.getMethod("recordException", Throwable.class);
        Method user = crashlyticsType.getMethod("setUserId", String.class);
        unsent.invoke(crashlytics);
        log.invoke(crashlytics, "privacy probe");
        exception.invoke(crashlytics, new Throwable("privacy probe"));
        user.invoke(crashlytics, "privacy-probe");
        switches.put("disable_analytics", false);
        originalMustFail(collectionPermission, arbiter);
        originalMustFail(unsent, crashlytics);
        originalMustFail(log, crashlytics, "privacy probe");
        originalMustFail(exception, crashlytics, new Throwable("privacy probe"));
        originalMustFail(user, crashlytics, "privacy-probe");
        System.out.println("PASS: actual ART Spade callback once/null/off; client-ad completed Optional.FALSE; Crashlytics arbiter and four dispatch gates/on-off controls");
    }
}

final class SpadeCallback extends bx50 {
    int successes;
    int failures;
    Object value;

    @Override public void M(Object response) { successes++; value = response; }
    @Override public void L(nig error) { failures++; }
}
