import android.content.ComponentName;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.os.Looper;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.List;

/**
 * Lurk in account menu's native half on ART: React Native's real, patched IntentModule.openURL (made without its
 * constructor), called the way Kick's JavaScript calls Linking.openURL. Lurk's link (lurk://settings) opens the Lurk
 * settings activity and resolves the promise with true without reaching Android; any other link goes on into React
 * Native's own code. Usage: SettingsLinkProbe <patched.apk>; bin/test-kick runs it.
 */
public final class SettingsLinkProbe {
    private static final String SETTINGS = "io.github.jordanwoodson.extension.shared.settings.SettingsActivity";

    private static void check(boolean value, String message) {
        if (!value) throw new AssertionError(message);
        System.out.println("ok  " + message);
    }

    /** A Promise that records how it was settled. */
    private static Object promise(Class<?> type, List<String> settled) {
        return Proxy.newProxyInstance(type.getClassLoader(), new Class<?>[]{type}, (proxy, method, values) -> {
            settled.add(method.getName() + (values != null && values.length > 0 ? ":" + values[0] : ""));
            return null;
        });
    }

    public static void main(String[] args) throws Exception {
        Looper.prepareMainLooper();
        Object thread = Class.forName("android.app.ActivityThread").getMethod("systemMain").invoke(null);
        Context system = (Context) thread.getClass().getMethod("getSystemContext").invoke(thread);
        List<Intent> started = new ArrayList<>();
        Context context = new ContextWrapper(system) {
            @Override public Context getApplicationContext() { return this; }
            @Override public void startActivity(Intent intent) { started.add(intent); }
        };
        Class<?> settings = Class.forName("io.github.jordanwoodson.extension.shared.settings.Settings");
        Field contextField = settings.getDeclaredField("context");
        contextField.setAccessible(true);
        contextField.set(null, context);
        Method registryJson = settings.getDeclaredMethod("registryJson");
        registryJson.setAccessible(true);
        String registry = String.valueOf(registryJson.invoke(null));
        if (!registry.contains("\"lurk_menu_entry\"")) {
            System.out.println("SKIP: Lurk in account menu (not in this APK)");
            return;
        }

        Class<?> unsafeClass = Class.forName("sun.misc.Unsafe");
        Object unsafe = unsafeClass.getMethod("getUnsafe").invoke(null);
        Class<?> moduleType = Class.forName("com.facebook.react.modules.intent.IntentModule");
        Object module = unsafeClass.getMethod("allocateInstance", Class.class).invoke(unsafe, moduleType);
        Class<?> promiseType = Class.forName("com.facebook.react.bridge.Promise");
        Method openUrl = moduleType.getMethod("openURL", String.class, promiseType);

        List<String> lurk = new ArrayList<>();
        openUrl.invoke(module, "lurk://settings", promise(promiseType, lurk));
        check(lurk.equals(List.of("resolve:true")), "Lurk's link resolves the promise with true: " + lurk);
        ComponentName component = started.isEmpty() ? null : started.get(0).getComponent();
        check(started.size() == 1 && component != null && SETTINGS.equals(component.getClassName()),
            "Lurk's link opens the Lurk settings activity");
        check((started.get(0).getFlags() & Intent.FLAG_ACTIVITY_NEW_TASK) != 0,
            "with no activity resumed it opens in a task of its own");

        started.clear();
        List<String> other = new ArrayList<>();
        try {
            openUrl.invoke(module, "https://kick.com/", promise(promiseType, other));
        } catch (java.lang.reflect.InvocationTargetException e) {
            // React Native's own code ran on a module with no React context; how it fails doesn't matter here.
            other.add("threw:" + e.getCause().getClass().getSimpleName());
        }
        check(started.isEmpty() && !other.contains("resolve:true"),
            "another link goes on into React Native's openURL: " + other);
        System.out.println("PASS: Lurk in account menu link");
    }
}
