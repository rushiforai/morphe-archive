package software.santodan.extension.nuviopreferred;

import software.santodan.nuvio.NuvioNative;

import android.app.Application;
import android.content.SharedPreferences;
import android.util.Log;
import java.lang.reflect.*;
import java.util.*;

/** Uses the native profile, installed add-ons and playable-stream predicate. */
public final class NuvioPreferredAddon {
    private static volatile Object component;
    private static final Map<String, Object> states = new HashMap<>();
    private NuvioPreferredAddon() {}

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
        for (Object addon : enabled) if (supportsStreams(addon)) sources.add(addon);
        return sources;
    }
    private static boolean supportsStreams(Object addon) throws Exception {
        List<?> resources = (List<?>) addon.getClass().getMethod("getResources").invoke(addon);
        for (Object resource : resources) if ("stream".equals(text(resource, "getName"))) return true;
        return false;
    }
    private static SharedPreferences preferences(int profile) throws Exception {
        Application app = (Application) Class.forName("android.app.ActivityThread").getMethod("currentApplication").invoke(null);
        return app.getSharedPreferences("santodan_preferred_addon_" + profile, 0);
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
        if (name == null) return null;
        // Native stream groups expose names, not installation URLs. Never guess
        // which installation supplied a stream when two display names collide.
        int matches = 0;
        for (Object addon : installed) if (name.equals(text(addon, "getDisplayName"))) matches++;
        return matches == 1 ? name : null;
    }
    public static List<?> prioritize(int id, List<?> installed) {
        try {
            String key = preferences(id).getString("addon", "");
            if (key.isEmpty()) return installed;
            List<Object> ordered = new ArrayList<>(installed.size());
            for (Object addon : installed) if (key.equals(text(addon, "getBaseUrl")) && supportsStreams(addon)) ordered.add(addon);
            if (ordered.isEmpty()) return installed;
            for (Object addon : installed) if (!key.equals(text(addon, "getBaseUrl"))) ordered.add(addon);
            return ordered;
        } catch (Exception error) { Log.e("SantodanPreferred", "Cannot prioritize add-on", error); return installed; }
    }
    public static List<?> orderGroups(List<?> groups) {
        try {
            int id = profile();
            String name = selectedName(id, addons());
            if (name == null || profile() != id) return groups;
            List<Object> ordered = new ArrayList<>(groups.size());
            for (Object group : groups) if (name.equals(text(group, "getAddonName"))) ordered.add(group);
            for (Object group : groups) if (!name.equals(text(group, "getAddonName"))) ordered.add(group);
            return ordered;
        } catch (Exception error) { Log.e("SantodanPreferred", "Cannot order add-on results", error); return groups; }
    }
    public static boolean autoPlayEnabled() {
        try {
            int id = profile();
            return preferences(id).getBoolean("autoplay", false) && !preferences(id).getString("addon", "").isEmpty() && profile() == id;
        } catch (Exception error) { return false; }
    }
    public static Object select(List<?> streams) {
        try {
            int id = profile();
            String name = selectedName(id, addons());
            if (name == null || !preferences(id).getBoolean("autoplay", false)) return null;
            Method playable = Class.forName(NuvioNative.ADDON_SELECTOR_NAME).getDeclaredMethod("b", Class.forName("com.nuvio.tv.domain.model.Stream"));
            playable.setAccessible(true);
            for (Object stream : streams)
                if (name.equals(text(stream, "getAddonName")) && (Boolean) playable.invoke(null, stream))
                    return profile() == id ? stream : null;
        } catch (Exception error) { Log.e("SantodanPreferred", "Cannot select preferred stream", error); }
        return null;
    }
    public static boolean autoPlayGate(boolean nativeValue) { return nativeValue || autoPlayEnabled(); }
    public static boolean allowNativeReuse(boolean nativeValue) { return nativeValue; }
    private static boolean hasBingeGroup(String group) { return group != null && !group.trim().isEmpty(); }
    public static boolean autoPlaySelectionEnabled(String group, boolean preferGroup, boolean groupOnly) {
        // Keep native source filters, matching, timeout and no-match fallback intact.
        return !groupOnly && !(preferGroup && hasBingeGroup(group)) && autoPlayEnabled();
    }
    public static Object choose(Object nativeStream, List<?> streams, Object controller, Object resolved, String bingeGroup) {
        if (!autoPlayEnabled()) return nativeStream;
        try {
            if ((Boolean) field(controller, "t") || (Boolean) field(resolved, "element")) return null;
            // The loader supplies a persisted group only when both native binge
            // settings are enabled. A null native result must also remain null
            // while the native loader waits or offers manual selection.
            if (hasBingeGroup(bingeGroup)) return nativeStream;
            return select(streams);
        } catch (Exception error) { Log.e("SantodanPreferred", "Cannot resolve preferred selection", error); return null; }
    }

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
            return "SantodanPreferredCallback";
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
        String label = name == null ? "None" : name;
        if (!prefs.getString("addon", "").isEmpty() && name == null) label = "Unavailable or duplicate name — select an add-on";
        method(loader, NuvioNative.SETTINGS_ROWS_NAME, "a", 18).invoke(null, "Preferred source add-on",
            "Start this add-on's refresh first and show its results first. Applies to the next search.", label,
            change, null, noop, true, null, null, 0L, null, null, 0f, 0L, composer, 0, 0, 16336);
        Object toggle = callback(loader, "Function0", args -> {
            if (profile() != id) return;
            prefs.edit().putBoolean("autoplay", !prefs.getBoolean("autoplay", false)).apply();
            set(revision, ((Number) get(revision)).intValue() + 1);
        });
        method(loader, NuvioNative.SETTINGS_ROWS_NAME, "m", 13).invoke(null, "Automatically play preferred add-on",
            "Play its first playable stream when available. Native binge-group preferences and reuse still apply.",
            prefs.getBoolean("autoplay", false), toggle, null, noop, false, null, 0L, false, composer, 0, 1008);
        if (!(Boolean) get(dialog)) return;
        List<Object> options = new ArrayList<>();
        Constructor<?> option = loader.loadClass(NuvioNative.SETTINGS_PICKER_NAME).getDeclaredConstructor(Object.class, String.class, String.class, String.class, loader.loadClass("m3.m"), int.class);
        options.add(option.newInstance("", "None", null, null, null, 28));
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
        method(loader, NuvioNative.SETTINGS_ROWS_NAME, "j", 11).invoke(null, "Preferred source add-on", options,
            prefs.getString("addon", ""), select, dismiss, null, 420f, 320f, composer, 0, 32);
    }
}
