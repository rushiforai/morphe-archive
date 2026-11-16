package software.santodan.extension.nuviometadata;

import software.santodan.nuvio.NuvioNative;

import android.app.Application;
import android.content.SharedPreferences;
import android.util.Log;
import java.lang.reflect.*;
import java.util.*;

/** Per-profile metadata picker using native settings controls. */
public final class NuvioMetadataSettings {
    private static volatile Object component;
    private static final Map<String, Object> states = new HashMap<>();
    private NuvioMetadataSettings() {}

    public static void registerComponent(Object value) { component = value; }
    private static Object field(Object owner, String name) throws Exception {
        Field field = owner.getClass().getDeclaredField(name);
        field.setAccessible(true);
        return field.get(owner);
    }
    private static Object value(Object flow) throws Exception {
        return Class.forName("kotlinx.coroutines.flow.StateFlow").getMethod("getValue").invoke(flow);
    }
    private static Object provided(Object provider) throws Exception {
        Method get = provider.getClass().getDeclaredMethod("get");
        get.setAccessible(true);
        return get.invoke(provider);
    }
    private static int profile() throws Exception {
        return ((Number) value(field(provided(software.santodan.nuvio.NuvioAccess.profileProvider(component)), "f"))).intValue();
    }
    private static List<?> addons() throws Exception {
        Object repository = provided(software.santodan.nuvio.NuvioAccess.streamProvider(component));
        List<?> installed = (List<?>) value(field(field(repository, "c"), "r"));
        List<?> enabled = (List<?>) Class.forName("com.nuvio.tv.domain.model.AddonKt")
            .getDeclaredMethod("enabledAddons", List.class).invoke(null, installed);
        List<Object> sources = new ArrayList<>();
        for (Object addon : enabled) if (supportsMetadata(addon)) sources.add(addon);
        return sources;
    }
    private static boolean supportsMetadata(Object addon) throws Exception {
        List<?> resources = (List<?>) addon.getClass().getMethod("getResources").invoke(addon);
        for (Object resource : resources) if ("meta".equals(text(resource, "getName"))) return true;
        return false;
    }
    private static SharedPreferences preferences(int profile) throws Exception {
        Application app = (Application) Class.forName("android.app.ActivityThread").getMethod("currentApplication").invoke(null);
        return app.getSharedPreferences("santodan_metadata_addon_" + profile, 0);
    }
    private static String text(Object owner, String getter) throws Exception {
        return (String) owner.getClass().getMethod(getter).invoke(owner);
    }
    private static String selectedName(int profile, List<?> installed) throws Exception {
        String key = preferences(profile).getString("addon", "");
        if (key.isEmpty()) return null;
        String name = null;
        for (Object addon : installed) if (key.equals(text(addon, "getBaseUrl"))) {
            name = text(addon, "getDisplayName"); break;
        }
        return name;
    }
    public static int currentProfile() throws Exception { return profile(); }
    public static String selectedAddon(int id) throws Exception {
        String key = preferences(id).getString("addon", "");
        for (Object addon : addons()) if (key.equals(text(addon, "getBaseUrl"))) return key;
        return "";
    }
    public static boolean continueWatching(int id) throws Exception { return preferences(id).getBoolean("continue_watching", false); }
    public static boolean libraryPosters(int id) throws Exception { return preferences(id).getBoolean("library_posters", false); }

    private static Object state(ClassLoader loader, String key, Object initial) throws Exception {
        Object state = states.get(key);
        if (state == null) {
            state = loader.loadClass(NuvioNative.COMPOSE_FACTORY_NAME).getDeclaredMethod(NuvioNative.STATE_FACTORY_METHOD, Object.class).invoke(null, initial);
            states.put(key, state);
        }
        return state;
    }
    private static Object get(Object state) throws Exception { return state.getClass().getMethod("getValue").invoke(state); }
    private static void set(Object state, Object value) throws Exception { state.getClass().getMethod("setValue", Object.class).invoke(state, value); }
    private interface Action { void run(Object[] args) throws Exception; }
    private static Object callback(ClassLoader loader, String type, Action action) throws Exception {
        return Proxy.newProxyInstance(loader, new Class<?>[]{loader.loadClass("kotlin.jvm.functions." + type)}, (proxy, called, args) -> {
            if (called.getName().equals("invoke")) { action.run(args); return loader.loadClass("kotlin.Unit").getField("INSTANCE").get(null); }
            if (called.getName().equals("hashCode")) return System.identityHashCode(proxy);
            if (called.getName().equals("equals")) return proxy == args[0];
            return "SantodanMetadataCallback";
        });
    }
    private static Method method(ClassLoader loader, String owner, String name, int count) throws Exception {
        Method result = null;
        for (Method candidate : loader.loadClass(owner).getDeclaredMethods())
            if (candidate.getName().equals(name) && candidate.getParameterCount() == count) {
                if (result != null) throw new NoSuchMethodException("Ambiguous " + owner + '.' + name);
                result = candidate;
            }
        if (result == null) throw new NoSuchMethodException(owner + '.' + name);
        result.setAccessible(true); return result;
    }
    public static void renderSettings(Object composer) throws Exception {
        ClassLoader loader = composer.getClass().getClassLoader();
        int id = profile();
        SharedPreferences prefs = preferences(id);
        Object revision = state(loader, id + ":revision", 0);
        get(revision);
        Object dialog = state(loader, id + ":dialog", false);
        Object noop = callback(loader, "Function0", args -> {});
        Object change = callback(loader, "Function0", args -> { if (profile() == id) set(dialog, true); });
        List<?> installed = addons();
        String name = selectedName(id, installed);
        String label = name == null ? "Nuvio default" : name;
        if (!prefs.getString("addon", "").isEmpty() && name == null) label = "Unavailable - select an add-on";
        method(loader, NuvioNative.SETTINGS_ROWS_NAME, "a", 18).invoke(null, "Metadata add-on",
            "Choose the add-on used for external metadata. Keep the external metadata option enabled. Restart after changing this setting.", label,
            change, null, noop, true, null, null, 0L, null, null, 0f, 0L, composer, 0, 0, 16336);
        Object toggle = callback(loader, "Function0", args -> {
            if (profile() != id) return;
            prefs.edit().putBoolean("continue_watching", !prefs.getBoolean("continue_watching", false)).apply();
            set(revision, ((Number) get(revision)).intValue() + 1);
        });
        method(loader, NuvioNative.SETTINGS_ROWS_NAME, "m", 13).invoke(null, "Use metadata add-on in Continue Watching",
            "Use its metadata and artwork in Continue Watching too. Restart to refresh cached cards.",
            prefs.getBoolean("continue_watching", false), toggle, null, noop, false, null, 0L, false, composer, 0, 1008);
        Object libraryToggle = callback(loader, "Function0", args -> {
            if (profile() != id) return;
            prefs.edit().putBoolean("library_posters", !prefs.getBoolean("library_posters", false)).apply();
            set(revision, ((Number) get(revision)).intValue() + 1);
        });
        method(loader, NuvioNative.SETTINGS_ROWS_NAME, "m", 13).invoke(null, "Use metadata add-on for library posters",
            "Use its poster artwork for library cards. Existing artwork stays until a replacement loads. Restart after changing this setting.",
            prefs.getBoolean("library_posters", false), libraryToggle, null, noop, false, null, 0L, false, composer, 0, 1008);
        if (!(Boolean) get(dialog)) return;
        List<Object> options = new ArrayList<>();
        Constructor<?> option = loader.loadClass(NuvioNative.SETTINGS_PICKER_NAME).getDeclaredConstructor(Object.class, String.class, String.class, String.class, loader.loadClass("l3.l"), int.class);
        options.add(option.newInstance("", "Nuvio default", null, null, null, 28));
        Set<String> allowed = new HashSet<>(); allowed.add("");
        for (Object addon : installed) {
            String key = text(addon, "getBaseUrl");
            allowed.add(key);
            options.add(option.newInstance(key, text(addon, "getDisplayName"), null, null, null, 28));
        }
        Object select = callback(loader, "Function1", args -> {
            if (profile() == id && allowed.contains(args[0])) {
                prefs.edit().putString("addon", (String) args[0]).apply();
                set(revision, ((Number) get(revision)).intValue() + 1);
            }
            set(dialog, false);
        });
        Object dismiss = callback(loader, "Function0", args -> set(dialog, false));
        method(loader, NuvioNative.SETTINGS_ROWS_NAME, "j", 11).invoke(null, "Metadata add-on", options,
            prefs.getString("addon", ""), select, dismiss, null, 420f, 320f, composer, 0, 32);
    }
}
