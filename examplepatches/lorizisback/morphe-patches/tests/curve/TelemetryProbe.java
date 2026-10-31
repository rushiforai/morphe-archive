import android.os.Bundle;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLStreamHandler;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Set;

/** Runs against real APK dex without constructing authenticated services or allowing network I/O. */
public final class TelemetryProbe {
    private static final String ANALYTICS = "com.curve.analytics.";
    private static boolean patched;

    private static void require(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }

    private static Class<?> type(String name) throws Exception {
        return Class.forName(name);
    }

    private static Object model(String name) throws Exception {
        Class<?> unsafe = type("sun.misc.Unsafe");
        Field field = unsafe.getDeclaredField("theUnsafe");
        field.setAccessible(true);
        return unsafe.getMethod("allocateInstance", Class.class).invoke(field.get(null), type(name));
    }

    private static void field(Object object, String name, Object value) throws Exception {
        Field field = object.getClass().getDeclaredField(name);
        field.setAccessible(true);
        field.set(object, value);
    }

    private static Object call(Object receiver, String name, Class<?>[] parameters, Object... arguments)
            throws Exception {
        Method method = receiver.getClass().getDeclaredMethod(name, parameters);
        method.setAccessible(true);
        return method.invoke(receiver, arguments);
    }

    private static Object call(Object receiver, String name) throws Exception {
        return call(receiver, name, new Class<?>[0]);
    }

    private static void repositoryDoesNotDispatch() throws Exception {
        List<String> calls = new ArrayList<>();
        Class<?> tracker = type(ANALYTICS + "domain.CurveAnalyticsTracker");
        Object adapter = Proxy.newProxyInstance(tracker.getClassLoader(), new Class<?>[]{
            tracker, type(ANALYTICS + "domain.actions.DeactivatableAnalyticsPlatform"),
            type(ANALYTICS + "domain.actions.CookiesConsentUpdater")
        }, (proxy, method, arguments) -> {
            if (method.getName().equals("isEventSupported")) return true;
            calls.add(method.getName());
            return null;
        });
        Object repository = type(ANALYTICS + "data.repository.CurveAnalyticsRepositoryImpl")
            .getConstructor(List.class).newInstance(Collections.singletonList(adapter));
        Class<?> eventType = type(ANALYTICS + "domain.events.CurveEvent");
        Class<?> platformType = type(ANALYTICS + "domain.AnalyticsPlatform");
        Object platform = platformType.getEnumConstants()[0];
        Object event = type(ANALYTICS + "domain.events.GenericEvent")
            .getConstructor(String.class, Map.class, Set.class)
            .newInstance("privacy_probe", Collections.emptyMap(), Collections.singleton(platform));
        for (String name : new String[]{"trackEvent", "addDefaultEventProperties", "addDefaultUserProperties"}) {
            call(repository, name, new Class<?>[]{eventType}, event);
        }
        call(repository, "reset");
        call(repository, "setTrackingId", new Class<?>[]{String.class}, "synthetic-probe-id");
        call(repository, "activateTracker", new Class<?>[]{platformType, boolean.class}, platform, true);
        Class<?> consentType = type("com.curve.core.sharedpreferences.CookiesConsent");
        Object consent = consentType.getConstructor(boolean.class, boolean.class, boolean.class)
            .newInstance(true, true, true);
        call(repository, "updateCookiesConsent", new Class<?>[]{platformType, consentType}, platform, consent);
        require(calls.size() == (patched ? 0 : 7), "Unexpected analytics adapter dispatch: " + calls);
    }

    private static void savedConsentCannotEnableReporting() throws Exception {
        Object crashlytics = model("w53");
        field(crashlytics, "g", Boolean.TRUE);
        require(Boolean.valueOf(!patched).equals(call(crashlytics, "a")), "Crashlytics consent override");
        Object sessions = model("jc7");
        Bundle metadata = new Bundle();
        metadata.putBoolean("firebase_sessions_enabled", true);
        field(sessions, "a", metadata);
        require(Boolean.valueOf(!patched).equals(call(sessions, "a")), "Sessions consent override");
    }

    private static void startupCompletesWithoutDependencies() throws Exception {
        Class<?> continuation = type("kotlin.coroutines.Continuation");
        Object unit = type("kotlin.Unit").getField("a").get(null);
        String[][] methods = {
            {ANALYTICS + "startup.AppsFlyerStarter", "init"}, {"u26", "init"},
            {"p20", "identifyBrazeUser"}, {"p20", "setupDefaultAnalyticsProperties"}
        };
        for (String[] target : methods) {
            Object instance = model(target[0]);
            try {
                Object result = call(instance, target[1], new Class<?>[]{continuation}, new Object[]{null});
                require(patched && result == unit, "Startup did not complete Unit: " + target[0] + "." + target[1]);
            } catch (InvocationTargetException exception) {
                require(!patched && exception.getCause() instanceof NullPointerException,
                    "Unexpected startup dependency access: " + target[0] + "." + target[1] + ": " + exception.getCause());
            }
        }
    }

    private static void noDependencyGate(String owner, String method, Object expected) throws Exception {
        try {
            Object result = call(model(owner), method);
            require(patched && expected.equals(result), "Wrong privacy gate: " + owner + "." + method);
        } catch (InvocationTargetException exception) {
            require(!patched && exception.getCause() instanceof NullPointerException,
                "Unexpected privacy gate exception: " + owner + ": " + exception.getCause());
        }
    }

    private static void brazeCannotGoOnline() throws Exception {
        Object companion = model("com.braze.Braze$Companion");
        call(companion, "setOutboundNetworkRequestsOffline", new Class<?>[]{boolean.class}, false);
        require(Boolean.valueOf(patched).equals(call(companion, "getOutboundNetworkRequestsOffline")),
            "Braze online request was not clamped");
        require(Boolean.valueOf(patched).equals(call(companion, "isDisabled")), "Braze disabled gate");
    }

    private static void remoteBannersEmitAnEmptyList() throws Exception {
        Class<?> continuation = type("kotlin.coroutines.Continuation");
        Object watcher = model("com.curve.wallet.banner.usecase.remote.WatchRemoteInfoBannersUseCase");
        Object flow = call(watcher, "get", new Class<?>[]{String.class, continuation}, "wallet", null);
        if (!patched) {
            require(flow == null, "Original watcher should return its uninitialized flow field");
            return;
        }
        Class<?> collectorType = type("kotlinx.coroutines.flow.FlowCollector");
        Object unit = type("kotlin.Unit").getField("a").get(null);
        List<Object> emissions = new ArrayList<>();
        Object collector = Proxy.newProxyInstance(collectorType.getClassLoader(), new Class<?>[]{collectorType},
            (proxy, method, arguments) -> { emissions.add(arguments[0]); return unit; });
        Object completion = call(flow, "collect", new Class<?>[]{collectorType, continuation}, collector, null);
        require(completion == unit && emissions.equals(Collections.singletonList(Collections.emptyList())),
            "Remote banners must emit one empty list and complete");
        Object suspended = type("zo2").getField("COROUTINE_SUSPENDED").get(null);
        Object pausingCollector = Proxy.newProxyInstance(collectorType.getClassLoader(), new Class<?>[]{collectorType},
            (proxy, method, arguments) -> suspended);
        require(call(flow, "collect", new Class<?>[]{collectorType, continuation}, pausingCollector, null) == suspended,
            "Banner flow did not preserve collector suspension");
    }

    private static void queuedGoogleReportsCannotOpenAConnection() throws Exception {
        int[] attempts = {0};
        URL guardedUrl = new URL(null, "https://telemetry-probe.invalid/", new URLStreamHandler() {
            protected URLConnection openConnection(URL url) {
                attempts[0]++;
                throw new UnsupportedOperationException("Probe blocked network before I/O");
            }
        });
        Object request = model("kme");
        field(request, "b", guardedUrl);
        Object transport = model("bn1");
        field(transport, "b", model("up1"));
        try {
            Object result = call(transport, "b", new Class<?>[]{type("kme")}, request);
            require(patched && result.getClass().getField("a").getInt(result) == 400,
                "Queued telemetry needs a permanent local rejection");
            require(result.getClass().getField("c").get(result) == null, "Telemetry redirect must be absent");
        } catch (InvocationTargetException exception) {
            require(!patched && exception.getCause() instanceof UnsupportedOperationException,
                "Unexpected telemetry transport exception: " + exception.getCause());
        }
        require(attempts[0] == (patched ? 0 : 1), "Telemetry transport connection count");
    }

    private static void patchedSinksIgnoreMissingDependencies() throws Exception {
        if (!patched) return;
        Class<?> context = type("android.content.Context");
        call(model("io.embrace.android.embracesdk.Embrace"), "start", new Class<?>[]{context}, new Object[]{null});
        call(model("a74"), "a", new Class<?>[]{type("lh8")}, new Object[]{null});
        require(call(model("q9d"), "d", new Class<?>[]{type("ag4")}, new Object[]{null}) == null,
            "Snowplow must return its paused result");
        Object appsFlyer = model(ANALYTICS + "data.appsflyer.AppsFlyerDelegate");
        call(appsFlyer, "updateFcmToken", new Class<?>[]{String.class}, "synthetic-token");
        require(call(appsFlyer, "getAppsFlyerId") == null, "Attribution ID still read");
    }

    public static void main(String[] args) throws Exception {
        require(args.length == 1 && (args[0].equals("original") || args[0].equals("patched")),
            "Usage: TelemetryProbe original|patched");
        patched = args[0].equals("patched");
        repositoryDoesNotDispatch();
        savedConsentCannotEnableReporting();
        startupCompletesWithoutDependencies();
        noDependencyGate("com.google.android.gms.measurement.internal.zzal", "zzt", Boolean.TRUE);
        noDependencyGate("wd2", "n", Boolean.FALSE);
        noDependencyGate("com.braze.storage.c3", "a", Boolean.TRUE);
        brazeCannotGoOnline();
        remoteBannersEmitAnEmptyList();
        queuedGoogleReportsCannotOpenAConnection();
        patchedSinksIgnoreMissingDependencies();
        System.out.println("PASS " + args[0] + ": analytics dispatch, persisted consent, startup completion, SDK gates, "
            + "banner emissions, queued telemetry transport and disabled sinks; no network I/O permitted");
    }
}
