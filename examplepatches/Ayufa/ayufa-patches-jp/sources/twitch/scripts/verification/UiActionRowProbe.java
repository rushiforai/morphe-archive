import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Looper;
import android.view.ContextThemeWrapper;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.TextView;
import dev.twitchpatches.extension.ui.UiViewPolicy;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Proxy;
import java.util.Set;

public final class UiActionRowProbe {
    private static final String EXTENSIONS = "hide_channel_extensions";
    private static Field instance;
    private static Constructor<?> settings;

    public static void main(String[] args) {
        try { run(); }
        catch (Throwable error) { error.printStackTrace(); System.exit(1); }
    }

    private static void run() throws Exception {
        Looper.prepareMainLooper();
        Class.forName("android.graphics.Typeface").getDeclaredMethod("loadPreinstalledSystemFontMap").invoke(null);
        Class<?> thread = Class.forName("android.app.ActivityThread");
        Object systemThread = thread.getMethod("systemMain").invoke(null);
        Context context = (Context) thread.getMethod("getSystemContext").invoke(systemThread);
        context = new ContextThemeWrapper(context, android.R.style.Theme_Material);
        Class<?> registry = Class.forName("dev.twitchpatches.extension.ui.UiSettings");
        instance = registry.getDeclaredField("instance");
        instance.setAccessible(true);
        settings = registry.getDeclaredConstructor(Application.class);
        settings.setAccessible(true);
        checkMigration(registry);
        setPreferences(Set.of());
        FrameLayout extensions = new dev.twitchpatches.extension.ui.views.FrameLayout(context, null);
        extensions.setTag("twitchpatches_ui:" + EXTENSIONS);
        UiViewPolicy.bind(extensions);
        TextView overflow = new TextView(context);
        overflow.setText("+2");
        extensions.addView(overflow);
        for (int cycle = 0; cycle < 3; cycle++) {
            setPreferences(Set.of(EXTENSIONS));
            extensions.setVisibility(View.VISIBLE);
            if (extensions.getVisibility() != View.GONE) throw new AssertionError("extension visibility override");
            if (extensions.getChildCount() != 1) throw new AssertionError("overflow child removed");
            setPreferences(Set.of());
            extensions.setVisibility(View.VISIBLE);
            if (extensions.getVisibility() != View.VISIBLE) throw new AssertionError("extension re-enable requires restart");
        }
        extensions.setVisibility(View.INVISIBLE);
        setPreferences(Set.of(EXTENSIONS));
        extensions.setVisibility(View.INVISIBLE);
        setPreferences(Set.of());
        if (UiViewPolicy.visibility(extensions, View.INVISIBLE) != View.INVISIBLE)
            throw new AssertionError("original invisible state lost");
        instance.set(null, null);
        System.out.println("PASS channel action preferences: migration, extension overflow, independent visibility and repeated restoration");
    }

    private static void checkMigration(Class<?> registry) throws Exception {
        java.util.Map<String, Boolean> values = new java.util.HashMap<>();
        values.put("classic_support_hide_row", true);
        values.put("vertical_support_hide_row", false);
        SharedPreferences.Editor editor = (SharedPreferences.Editor) Proxy.newProxyInstance(
                SharedPreferences.Editor.class.getClassLoader(), new Class<?>[] {SharedPreferences.Editor.class}, (proxy, method, args) -> {
                    if (method.getName().equals("putBoolean")) values.put((String) args[0], (Boolean) args[1]);
                    if (method.getName().equals("remove")) values.remove(args[0]);
                    return method.getReturnType() == void.class ? null : proxy;
                });
        SharedPreferences preferences = (SharedPreferences) Proxy.newProxyInstance(
                SharedPreferences.class.getClassLoader(), new Class<?>[] {SharedPreferences.class}, (proxy, method, args) -> {
                    if (method.getName().equals("contains")) return values.containsKey(args[0]);
                    if (method.getName().equals("getBoolean")) return values.getOrDefault(args[0], false);
                    if (method.getName().equals("edit")) return editor;
                    throw new UnsupportedOperationException(method.getName());
                });
        var migration = registry.getDeclaredMethod("migrateActionRows", SharedPreferences.class);
        migration.setAccessible(true);
        migration.invoke(null, preferences);
        if (!Boolean.TRUE.equals(values.get(EXTENSIONS)) || !Boolean.TRUE.equals(values.get("classic_support_hide_subscribe")) ||
                values.containsKey("classic_support_hide_row") || values.containsKey("vertical_support_hide_row") ||
                values.containsKey("vertical_support_hide_gift")) throw new AssertionError("row preference migration");
        values.put("classic_support_hide_subscribe", false);
        migration.invoke(null, preferences);
        if (values.get("classic_support_hide_subscribe")) throw new AssertionError("migration repeats after user change");
    }

    private static void setPreferences(Set<String> enabled) throws Exception {
        Application application = new Application() {
            @Override public SharedPreferences getSharedPreferences(String name, int mode) {
                return (SharedPreferences) Proxy.newProxyInstance(SharedPreferences.class.getClassLoader(), new Class<?>[] {SharedPreferences.class},
                        (proxy, method, args) -> {
                            if (method.getName().equals("contains")) return false;
                            if (method.getName().equals("getBoolean")) return enabled.contains(args[0]);
                            throw new UnsupportedOperationException(method.getName());
                        });
            }
        };
        instance.set(null, settings.newInstance(application));
    }
}
