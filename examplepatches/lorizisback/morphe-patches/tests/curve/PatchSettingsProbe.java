import android.content.Context;
import android.content.ContextWrapper;
import android.content.SharedPreferences;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

/** Exercises atomic settings and Android's failed-write memory semantics without app data. */
public final class PatchSettingsProbe {
    public static void require(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }

    public static final class Memory {
        public final Map<String, Object> cached = new HashMap<>();
        public final Map<String, Object> durable = new HashMap<>();
        public boolean writable = true;
        public final Context context;

        public Memory() {
            Map<String, Object> pending = new HashMap<>();
            SharedPreferences.Editor editor = (SharedPreferences.Editor) Proxy.newProxyInstance(
                SharedPreferences.Editor.class.getClassLoader(), new Class<?>[]{SharedPreferences.Editor.class},
                (proxy, method, args) -> {
                    if (method.getName().equals("putBoolean") || method.getName().equals("putStringSet")) {
                        pending.put((String) args[0], args[1] instanceof Set ? new HashSet<>((Set<?>) args[1]) : args[1]);
                        return proxy;
                    }
                    if (method.getName().equals("remove")) { pending.put((String) args[0], null); return proxy; }
                    if (method.getName().equals("commit")) {
                        for (Map.Entry<String, Object> change : pending.entrySet()) {
                            if (change.getValue() == null) cached.remove(change.getKey());
                            else cached.put(change.getKey(), change.getValue());
                        }
                        if (writable) { durable.clear(); durable.putAll(cached); }
                        pending.clear();
                        return writable;
                    }
                    throw new AssertionError("Unexpected editor call: " + method);
                });
            SharedPreferences preferences = (SharedPreferences) Proxy.newProxyInstance(
                SharedPreferences.class.getClassLoader(), new Class<?>[]{SharedPreferences.class},
                (proxy, method, args) -> {
                    switch (method.getName()) {
                        case "getBoolean": case "getStringSet":
                            return cached.containsKey(args[0]) ? cached.get(args[0]) : args[1];
                        case "contains": return cached.containsKey(args[0]);
                        case "getAll": return new HashMap<>(cached);
                        case "edit": return editor;
                        default: throw new AssertionError("Unexpected preferences call: " + method);
                    }
                });
            context = new ContextWrapper(null) {
                @Override public SharedPreferences getSharedPreferences(String name, int mode) {
                    require(name.equals("morphe_patches") && mode == Context.MODE_PRIVATE, "Private preferences required");
                    return preferences;
                }
            };
        }
        public void initialize() throws Exception {
            Class.forName("app.local.extension.curve.PatchSettings").getMethod("initialize", Context.class).invoke(null, context);
        }
    }

    public static boolean save(boolean flex, boolean launchpad, Set<String> ids) throws Exception {
        return save(flex, launchpad, ids, (Boolean) setting("isCringeRemoved"));
    }

    public static boolean save(boolean flex, boolean launchpad, Set<String> ids, boolean cringe) throws Exception {
        return save(flex, launchpad, ids, cringe, (Boolean) setting("isBatchEnabled"));
    }

    public static boolean save(boolean flex, boolean launchpad, Set<String> ids, boolean cringe, boolean batch) throws Exception {
        Method method = Class.forName("app.local.extension.curve.PatchSettings")
            .getDeclaredMethod("saveSettings", boolean.class, boolean.class, Set.class, boolean.class, boolean.class);
        method.setAccessible(true);
        return (Boolean) method.invoke(null, flex, launchpad, ids, cringe, batch);
    }

    public static Object setting(String method) throws Exception {
        Method getter = Class.forName("app.local.extension.curve.PatchSettings").getDeclaredMethod(method);
        getter.setAccessible(true);
        return getter.invoke(null);
    }

    public static void main(String[] args) throws Exception {
        require(args.length == 0, "Usage: PatchSettingsProbe");
        Memory memory = new Memory(); memory.initialize();
        require(Boolean.TRUE.equals(setting("isFlexHidden")), "Flex default");
        require(Boolean.FALSE.equals(setting("isLaunchpadHidden")), "Launchpad default off");
        require(Boolean.TRUE.equals(setting("isCringeRemoved")), "Remove Cringe default on");
        require(Boolean.TRUE.equals(setting("isBatchEnabled")), "Batch GBIT default on");
        require(((Set<?>) setting("hiddenTiles")).isEmpty(), "Initial selection empty");
        memory.writable = false;
        require(!save(false, true, Collections.singleton("a"), false, false), "Failed save reported success");
        require(memory.cached.isEmpty() && memory.durable.isEmpty(), "Failed first write added keys");
        memory.initialize();
        require(Boolean.TRUE.equals(setting("isFlexHidden")), "Failed draft activated");
        memory.writable = true;
        Set<String> ids = new HashSet<>(); Collections.addAll(ids, "a", "morphe_patches", "", null);
        require(save(false, true, ids, false, false), "Save failed"); ids.add("b"); memory.initialize();
        require(Boolean.FALSE.equals(setting("isFlexHidden")), "Flex choice lost");
        require(Boolean.FALSE.equals(setting("isCringeRemoved")), "Remove Cringe choice lost");
        require(Boolean.FALSE.equals(setting("isBatchEnabled")), "Batch GBIT choice lost");
        require(Boolean.TRUE.equals(setting("isLaunchpadHidden")), "Master choice lost");
        require(Collections.singleton("a").equals(setting("hiddenTiles")), "Selection not sanitized/copied");
        Map<String, Object> old = new HashMap<>(memory.cached); memory.writable = false;
        require(!save(true, false, Collections.emptySet(), true, true), "Failed write reported success");
        require(memory.cached.equals(old) && memory.durable.equals(old), "Failed write changed cache or disk");
        memory.initialize();
        require(Boolean.FALSE.equals(setting("isFlexHidden")) && Boolean.TRUE.equals(setting("isLaunchpadHidden")),
            "Recreation activated failed draft");
        require(Boolean.FALSE.equals(setting("isCringeRemoved")), "Failed write changed Remove Cringe");
        require(Boolean.FALSE.equals(setting("isBatchEnabled")), "Failed write changed Batch GBIT");
        memory.cached.clear(); memory.cached.putAll(memory.durable); memory.initialize();
        require(Collections.singleton("a").equals(setting("hiddenTiles")), "Restart lost selection");
        memory.writable = true;
        require(save(false, false, Collections.singleton("a")), "Disable failed");
        require(Collections.singleton("a").equals(setting("hiddenTiles")), "Disable forgot selection");
        require(save(false, true, Collections.emptySet()), "Reset failed"); memory.initialize();
        require(((Set<?>) setting("hiddenTiles")).isEmpty() && Boolean.FALSE.equals(setting("isFlexHidden")),
            "Reset must clear only tile selection");
        System.out.println("PASS patch settings: atomic defaults/persistence, copied IDs, protected Patches, failed-save rollback, off remembers, reset");
    }
}
