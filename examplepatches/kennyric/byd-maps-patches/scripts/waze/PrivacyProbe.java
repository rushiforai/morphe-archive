package nl.johninnl.wazeprobe;

import android.app.Activity;
import android.app.Instrumentation;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.SystemClock;
import android.view.accessibility.AccessibilityNodeInfo;
import java.lang.reflect.*;
import java.util.*;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;

/** Local instrumentation probe. Sign with the SAME test key as the patched emulator app. */
public final class PrivacyProbe extends Instrumentation {
    private ClassLoader loader;
    private int passed;
    private final StringBuilder evidence = new StringBuilder();
    private Class<?> cls(String name) throws Exception { return Class.forName(name, true, loader); }
    private Object call(Object receiver, Class<?> type, String name, Class<?>[] args, Object... values) throws Exception {
        Method m = type.getDeclaredMethod(name, args); m.setAccessible(true); return m.invoke(receiver, values);
    }
    private void check(boolean value, String name) {
        if (!value) throw new AssertionError(name);
        passed++; evidence.append("PASS ").append(name).append('\n');
    }
    private void feature(String name, boolean on) {
        getTargetContext().getSharedPreferences("ungoogled_waze", 0).edit().putBoolean(name, on).commit();
    }
    private interface Work { void run() throws Exception; }
    private void main(Work work) throws Exception {
        AtomicReference<Throwable> error = new AtomicReference<>();
        runOnMainSync(() -> { try { work.run(); } catch (Throwable t) { error.set(t); } });
        if (error.get() != null) throw new RuntimeException(error.get());
    }
    private Object allocate(Class<?> type) throws Exception {
        Class<?> unsafe = Class.forName("sun.misc.Unsafe");
        Field f = unsafe.getDeclaredField("theUnsafe"); f.setAccessible(true);
        return unsafe.getMethod("allocateInstance", Class.class).invoke(f.get(null), type);
    }
    private boolean consentText(AccessibilityNodeInfo node) {
        if (node == null) return false;
        String text = String.valueOf(node.getText()).trim().toLowerCase(Locale.ROOT);
        if (text.equals("data and privacy") || text.equals("terms of service")
                || text.equals("personalized ads") || text.equals("personalize your ads")
                || text.equals("review waze's privacy policy")) return true;
        for (int i = 0; i < node.getChildCount(); i++) if (consentText(node.getChild(i))) return true;
        return false;
    }
    @Override public void onCreate(Bundle args) { super.onCreate(args); start(); }
    @Override public void onStart() {
        Bundle result = new Bundle();
        try {
            loader = getTargetContext().getClassLoader();
            feature("skipConsent", true); feature("removeTelemetry", true);
            feature("speedCameras", false); feature("flockCameras", false);
            Intent launch = new Intent().setClassName("com.waze", "com.waze.FreeMapAppActivity")
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            startActivitySync(launch);
            Class<?> nativeManager = cls("com.waze.NativeManager");
            long until = SystemClock.elapsedRealtime() + 60000;
            while (!(Boolean) nativeManager.getMethod("isAppStarted").invoke(null)) {
                if (SystemClock.elapsedRealtime() > until) throw new AssertionError("Native startup timeout");
                SystemClock.sleep(100);
            }
            Object manager = nativeManager.getMethod("getInstance").invoke(null);
            Object config = cls("com.waze.ConfigManager").getMethod("getInstance").invoke(null);
            Class<?> cv = cls("com.waze.config.ConfigValues"), stringConfig = cls("com.waze.config.d");
            Method get = config.getClass().getMethod("getConfigValueString", stringConfig);
            Method set = config.getClass().getMethod("setConfigValueString", stringConfig, String.class);
            Object required = cv.getField("CONFIG_VALUE_CONSENT_BUMP_REQUIRED_ID").get(null);
            Object accepted = cv.getField("CONFIG_VALUE_CONSENT_BUMP_ACCEPTED_ID").get(null);
            main(() -> {
                Object oldRequired = get.invoke(config, required), oldAccepted = get.invoke(config, accepted);
                set.invoke(config, required, "WAZE_PRIVACY_PROBE"); set.invoke(config, accepted, "");
                Object show = cls("org.ungoogled.waze.ConsentAnswers").getMethod("answerModern", boolean.class).invoke(null, true);
                check(Boolean.FALSE.equals(show) && "WAZE_PRIVACY_PROBE".equals(get.invoke(config, accepted)),
                        "shared phone/car policy records acceptance and does not request a screen");
                set.invoke(config, required, oldRequired); set.invoke(config, accepted, oldAccepted);
                call(null, cls("com.waze.ih"), "v", new Class<?>[]{Context.class}, getTargetContext());
                check(true, "legacy advertising answer returns without constructing dialog");
                call(null, cls("com.waze.ih"), "w", new Class<?>[]{cls("com.waze.b.t")}, new Object[]{null});
                check(true, "legacy privacy answer returns without consuming UI state");
                nativeManager.getMethod("ShowPrivacyConsentBump").invoke(manager);
                check(true, "native privacy request completes without queuing UI");
                Class<?> adState = cls("com.waze.uid.d"); Object owner = allocate(adState);
                for (Field f : adState.getDeclaredFields()) if (f.getType().equals(config.getClass())) {
                    f.setAccessible(true); f.set(owner, config);
                }
                Object done = call(null, adState, "a", new Class<?>[]{adState, cls("com.waze.b.r"), cls("g.d.e")}, owner, null, null);
                check(done == cls("g.ab").getField("a").get(null), "current ad dialog uses its opt-out completion handler");
                Object fetcher = cls("com.waze.h.a.d").getConstructor(Context.class).newInstance(getTargetContext());
                check(cls("com.waze.h.a.d").getMethod("a").invoke(fetcher) == null, "advertising ID fetch is blocked before GMS");
                Object logger = cls("com.waze.shared_infra.i.a").getMethod("d", String.class).invoke(null, "PrivacyProbe");
                Class<?> client = cls("com.waze.h.a.a"), info = cls("com.waze.h.a.e");
                Object fakeInfo = info.getConstructor(String.class, boolean.class).newInstance("probe-cached-id", true);
                Object fakeClient = Proxy.newProxyInstance(loader, new Class<?>[]{client}, (p, m, a) -> fakeInfo);
                Class<?> provider = cls("com.waze.h.a.g");
                Object attribution = provider.getConstructor(client, cls("com.waze.shared_infra.i.e")).newInstance(fakeClient, logger);
                feature("removeTelemetry", false);
                check("probe-cached-id".equals(provider.getMethod("b").invoke(attribution)), "attribution remains unchanged when control is off");
                feature("removeTelemetry", true);
                check(provider.getMethod("b").invoke(attribution) == null && Boolean.FALSE.equals(provider.getMethod("c").invoke(attribution)),
                        "cached advertising ID and tracking-allowed fallback are suppressed");
                Class<?> menuType = cls("com.waze.ui.n.ai"); Object menu = allocate(menuType);
                List<String> cachedBanners = Arrays.asList("cached-campaign");
                for (Field f : menuType.getDeclaredFields()) if (f.getType().equals(List.class)) {
                    f.setAccessible(true); f.set(menu, cachedBanners);
                }
                check(((List<?>) menuType.getMethod("d").invoke(menu)).isEmpty(), "cached menu promotions are hidden");
                feature("hideAds", false);
                check(menuType.getMethod("d").invoke(menu) == cachedBanners, "menu banners are preserved with control off");
                feature("hideAds", true);
                Object transport = allocate(cls("com.waze.modules.c.a.b"));
                List<String> batch = Arrays.asList("old-event");
                Method send = cls("com.waze.modules.c.a.c").getMethod("c", List.class, cls("com.google.w.fi"));
                check(send.invoke(transport, batch, null) == batch, "queued stats return a successful batch before network access");
                AtomicInteger callbacks = new AtomicInteger(); Class<?> callbackType = cls("g.h.a.l");
                Object callback = Proxy.newProxyInstance(loader, new Class<?>[]{callbackType}, (p, m, a) -> {
                    if (m.getName().equals("invoke")) callbacks.incrementAndGet();
                    return cls("g.ab").getField("a").get(null);
                });
                cls("com.waze.ConfigManagerBase").getMethod("sendLogsAutoConfirm", callbackType).invoke(config, callback);
                check(callbacks.get() == 1, "blocked automatic logs complete their callback exactly once");
            });
            SystemClock.sleep(1000); waitForIdleSync();
            Object install = cls("kotlinx.coroutines.a.ab").getMethod("l", Class.class)
                    .invoke(null, cls("com.waze.install.InstallNativeManager"));
            check(Boolean.TRUE.equals(install.getClass().getMethod("isPrivacyConsentApprovedNTV").invoke(install)),
                    "native privacy approval is persisted");
            Object allow = cv.getField("CONFIG_VALUE_ADS_ALLOW_PROFILE_TARGETING").get(null);
            check(Boolean.FALSE.equals(config.getClass().getMethod("getConfigValueBool", cls("com.waze.config.b")).invoke(config, allow)),
                    "personalized advertising remains declined");
            AccessibilityNodeInfo root = null;
            for (int i = 0; i < 30 && root == null; i++) {
                root = getUiAutomation().getRootInActiveWindow();
                if (root == null) SystemClock.sleep(100);
            }
            check(root != null && "com.waze".contentEquals(root.getPackageName()) && !consentText(root),
                    "Waze remains visible without a privacy, terms or advertising consent window; root=" +
                    (root == null ? "null" : root.getPackageName() + ":" + root.getText()));
            result.putInt("passed", passed); result.putString("stream", evidence.toString());
            finish(Activity.RESULT_OK, result);
        } catch (Throwable t) {
            result.putInt("passed", passed); result.putString("stream", evidence + android.util.Log.getStackTraceString(t));
            finish(Activity.RESULT_CANCELED, result);
        }
    }
}
