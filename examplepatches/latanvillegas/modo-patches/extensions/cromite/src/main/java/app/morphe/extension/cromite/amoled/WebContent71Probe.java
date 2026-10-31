package app.morphe.extension.cromite.amoled;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.List;

/** Opt-in, read-only Chromium content-setting 71 diagnostic. */
public final class WebContent71Probe {
    private static final String TAG = "Cromite71Probe";
    private static final String PREFS = "morphe_cromite_amoled";
    private static final String ENABLED = "web_content_71_probe_enabled";
    private static final String INTENT_ONCE = "app.morphe.cromite.PROBE_CONTENT_71_ONCE";
    private static boolean attempted;

    private WebContent71Probe() {}

    public static void onNativeResume(Activity activity) {
        if (activity == null) return;
        SharedPreferences prefs = activity.getApplicationContext()
                .getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        // Explicit, one-shot intent extra allows an external test launch without
        // writing Cromite preferences. The existing preference remains off by default.
        boolean intentOptIn = activity.getIntent() != null
                && activity.getIntent().getBooleanExtra(INTENT_ONCE, false);
        if (!(prefs.getBoolean(ENABLED, false) || intentOptIn) || attempted) return;
        // Wait for Chromium's regular profile before consuming the one-shot probe.
        // onResume may occur before native profile initialization.
        try {
            ClassLoader loader = activity.getClassLoader();
            Class<?> manager = Class.forName(
                    "org.chromium.chrome.browser.profiles.ProfileManager", false, loader);
            Method getProfile = manager.getDeclaredMethod("b");
            if (!java.lang.reflect.Modifier.isStatic(getProfile.getModifiers())
                    || getProfile.getParameterTypes().length != 0
                    || !getProfile.getReturnType().getName().equals(
                            "org.chromium.chrome.browser.profiles.Profile")) {
                Log.w(TAG, "result=profile_signature_mismatch");
                return;
            }
            getProfile.setAccessible(true);
            // R8 mapping: ProfileManager.getLastUsedRegularProfile() -> b.
            // Verified original DEX descriptor: ()Lorg/chromium/chrome/browser/profiles/Profile;.
            Object profile = getProfile.invoke(null);
            if (profile == null) {
                Log.w(TAG, "result=profile_unavailable");
                return;
            }
            Class<?> bridge = Class.forName(
                    "org.chromium.components.browser_ui.site_settings.WebsitePreferenceBridge",
                    false, loader);
            Method enumerate = null;
            for (Method method : bridge.getDeclaredMethods()) {
                if (!method.getName().equals("a") || method.getParameterTypes().length != 2
                        || !method.getParameterTypes()[0].getName().equals(
                                "org.chromium.content_public.browser.BrowserContextHandle")
                        || method.getParameterTypes()[1] != int.class
                        || method.getReturnType() != java.util.ArrayList.class
                        || !java.lang.reflect.Modifier.isStatic(method.getModifiers())) continue;
                enumerate = method;
                break;
            }
            if (enumerate == null) {
                Log.w(TAG, "result=enumerator_unavailable");
                return;
            }
            if (!enumerate.getParameterTypes()[0].isInstance(profile)) {
                Log.w(TAG, "result=profile_bridge_type_mismatch");
                return;
            }
            enumerate.setAccessible(true);
            attempted = true;
            // DEX-verified JNI dispatch: LJ/N;->IIO(I,I,Object)I.
            // The first integer 2 is the JNI dispatch selector, NOT setting type.
            // Read-only getDefaultContentSettingProviderSource(profile, 71).
            try {
                Class<?> jni = Class.forName("J.N", false, loader);
                Method source = jni.getDeclaredMethod(
                        "IIO", int.class, int.class, Object.class);
                if (!java.lang.reflect.Modifier.isStatic(source.getModifiers())
                        || source.getReturnType() != int.class) {
                    Log.w(TAG, "defaultSource=signature_mismatch");
                } else {
                    source.setAccessible(true);
                    Object defaultSource = source.invoke(null, 2, 71, profile);
                    Log.i(TAG, "defaultSource=" + defaultSource);
                }
            } catch (Throwable sourceFailure) {
                Log.e(TAG, "defaultSource=exception", sourceFailure);
            }
            Object result = enumerate.invoke(null, profile, 71);
            if (!(result instanceof List)) {
                Log.w(TAG, "result=invalid_result");
                return;
            }
            List<?> entries = (List<?>) result;
            Log.i(TAG, "exceptions.count=" + entries.size());
            for (int i = 0; i < entries.size(); i++) {
                Object item = entries.get(i);
                if (item == null) continue;
                Class<?> c = item.getClass();
                Log.i(TAG, "exception[" + i + "] type=" + field(c, item, "r")
                        + " primary=" + field(c, item, "s")
                        + " secondary=" + field(c, item, "t")
                        + " source=" + field(c, item, "u")
                        + " setting=" + field(c, item, "x")
                        + " expiry=" + field(c, item, "v")
                        + " embargoed=" + field(c, item, "w"));
            }
            Log.i(TAG, "result=ok");
        } catch (Throwable failure) {
            Log.e(TAG, "result=exception", failure);
        }
    }

    private static Object field(Class<?> clazz, Object target, String name)
            throws ReflectiveOperationException {
        Field f = clazz.getDeclaredField(name);
        f.setAccessible(true);
        return f.get(target);
    }
}
