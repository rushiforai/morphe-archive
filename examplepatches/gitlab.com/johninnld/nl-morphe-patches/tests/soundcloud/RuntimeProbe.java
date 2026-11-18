package nl.johninnl.soundcloudprobe;

import android.app.Instrumentation;
import android.os.Bundle;
import java.lang.reflect.*;
import java.util.*;

/** Runs inside the patched app. No account, network response, or subscription is supplied. */
public final class RuntimeProbe extends Instrumentation {
    private ClassLoader loader;
    private final List<String> passed = new ArrayList<>();
    private Class<?> type(String name) throws Exception {
        return loader.loadClass("com.soundcloud.android." + name);
    }
    private Object empty(Class<?> cls) throws Exception {
        // Dependencies are deliberately absent: these early-return hooks must not read them.
        Class<?> unsafeType = Class.forName("sun.misc.Unsafe");
        Field field = unsafeType.getDeclaredField("theUnsafe");
        field.setAccessible(true);
        return unsafeType.getMethod("allocateInstance", Class.class).invoke(field.get(null), cls);
    }
    private void check(boolean value, String name) {
        if (!value) throw new AssertionError(name);
        passed.add(name);
    }
    @Override public void onCreate(Bundle args) { super.onCreate(args); start(); }
    @Override public void onStart() {
        Bundle result = new Bundle();
        try {
            loader = getTargetContext().getClassLoader();
            Class<?> features = type("configuration.features.DefaultFeatureOperations");
            Object operations = empty(features);
            check(features.getMethod("getCurrentTier").invoke(operations).toString().equals("HIGH"), "current tier HIGH");
            check(features.getMethod("getCurrentConsumerPlan").invoke(operations).toString().equals("GO_PLUS"), "current plan GO_PLUS");
            for (String name : List.of("getShouldRequestAds", "isMonetizableAdGeo"))
                check(Boolean.FALSE.equals(features.getMethod(name).invoke(operations)), name + " false");
            Class<?> storage = type("configuration.data.ConfigurationSettingsStorage");
            check(storage.getMethod("b").invoke(empty(storage)).toString().equals("HIGH"), "downgrade HIGH");

            Class<?> plan = type("configuration.plans.UserConsumerPlan");
            Object parsed = plan.getConstructor(String.class, boolean.class, String.class, List.class, String.class, String.class)
                .newInstance("free", false, null, Collections.emptyList(), "free", "Free");
            check(plan.getMethod("getCurrentTier").invoke(parsed).toString().equals("HIGH"), "parsed free tier becomes HIGH");
            check(plan.getMethod("getCurrentConsumerPlan").invoke(parsed).toString().equals("GO_PLUS"), "parsed free plan becomes GO_PLUS");
            check(plan.getMethod("getCurrentConsumerPlanTitle").invoke(parsed).equals("SoundCloud Go"), "parsed plan title");

            Class<?> companion = type("privacy.consent.main.PrivacyConsentControllerModule$Companion");
            Constructor<?> constructor = companion.getDeclaredConstructor();
            constructor.setAccessible(true);
            Object controller = companion.getMethod("a", type("privacy.legislation.LegislationOperations"), loader.loadClass("dagger.Lazy"))
                .invoke(constructor.newInstance(), null, null);
            check(controller.getClass() == type("privacy.consent.base.NoopPrivacyConsentController"), "no-op consent controller");

            Class<?> upsell = type("upsell.UpsellVisibilityController");
            Method mapper = upsell.getDeclaredMethod("mapToPlan", type("upsell.ApiMobileUpsellApplianceGraph"));
            mapper.setAccessible(true);
            check(mapper.invoke(empty(upsell), new Object[]{null}).getClass() == type("upsell.UpsellType$None"), "no upsell");

            Class<?> handler = type("analytics.base.TrackingHandler");
            android.os.HandlerThread worker = new android.os.HandlerThread("SoundCloudProbeTracking");
            worker.start();
            try {
                Object tracking = handler.getConstructors()[0].newInstance(worker.getLooper(), null, null, null, null);
                handler.getMethod("handleMessage", android.os.Message.class).invoke(tracking, android.os.Message.obtain());
                check(true, "tracking events return without dependencies");
                android.os.Message shutdown = android.os.Message.obtain();
                shutdown.what = -559038737;
                ((android.os.Handler) tracking).sendMessage(shutdown);
                worker.join(3000);
                check(!worker.isAlive(), "tracking shutdown terminates Looper");
            } finally {
                worker.quitSafely();
                worker.join(2000);
            }

            Class<?> observer = type("configuration.DefaultConfigurationUpdatesLifecycleObserver");
            for (String transition : List.of("Offboarding", "Onboarding")) {
                observer.getMethod(transition.equals("Offboarding") ? "c" : "d",
                    type("payments.plantransitions.pub.PlanInTransition$Fan"),
                    type("payments.plantransitions.pub.TransitionType$" + transition), long.class, long.class, String.class)
                    .invoke(empty(observer), null, null, 0L, 0L, null);
                check(true, transition + " navigation suppressed");
            }
            Class<?> ads = type("ads.display.data.config.AdPlacementConfiguration");
            Class<?> gam = type("ads.display.data.config.GamConfiguration"), aditude = type("ads.display.data.config.AditudeConfiguration");
            Object direct = ads.getConstructor(boolean.class, gam, aditude).newInstance(true, null, null);
            Object serialized = ads.getConstructor(int.class, boolean.class, gam, aditude).newInstance(7, true, null, null);
            Field enabled = Arrays.stream(ads.getDeclaredFields()).filter(f -> f.getType() == boolean.class).findFirst().orElseThrow();
            enabled.setAccessible(true);
            check(!enabled.getBoolean(direct), "direct display placement disabled");
            check(!enabled.getBoolean(serialized), "deserialized display placement disabled");
            result.putString("stream", "PASS " + passed.size() + " checks: " + passed);
            finish(-1, result);
        } catch (Throwable error) {
            result.putString("stream", "FAIL after " + passed + ": " + android.util.Log.getStackTraceString(error));
            finish(0, result);
        }
    }
}
