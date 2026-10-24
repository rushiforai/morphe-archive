package app.template.extension.pdb;

import android.content.Context;
import android.content.SharedPreferences;

import java.io.File;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/**
 * Reflection access to Pdb's MMKV stores.
 *
 * <p>The app keeps global knobs in {@code files/mmkv/pdb} and the signed-in
 * account's own values in a second store named {@code pdb_<accountId>}. Both are
 * MMKV instances; the class name is kept ({@code com.tencent.mmkv.MMKV}) but its
 * methods are R8-renamed, so an instance is resolved by <em>signature</em> — the
 * single {@code static MMKV <name>(String id)} method.
 *
 * <p>MMKV implements {@link SharedPreferences} but intentionally does not implement
 * {@code getAll()} (type erasure); key enumeration therefore goes through MMKV's own
 * {@code allKeys()} method. Values are read with sentinel defaults so an int/long/
 * float/bool can be told apart without MMKV exposing its key types.
 */
public final class PdbMmkv {

    /** Default (global) MMKV instance id used by the app. */
    public static final String MMKV_ID = "pdb";

    public static final String KEY_DEVICE_ID = "XDeviceId";
    public static final String KEY_IM_SOCKET = "chatCentrifugoWsUrl";
    public static final String KEY_FAKE_LOGOUT_PREFIX = "isFakeLogout";

    private static final String MMKV_CLASS = "com.tencent.mmkv.MMKV";

    private static volatile boolean resolved = false;
    private static volatile SharedPreferences store = null;
    private static volatile Context appCtx = null;

    private PdbMmkv() {}

    /** Gives the helper a context so it can enumerate the per-account stores. */
    public static void init(Context ctx) {
        if (ctx != null) appCtx = ctx.getApplicationContext();
    }

    /**
     * @return the app's default MMKV store, or {@code null} when MMKV is not
     *     initialised yet (it is initialised from the app's own start-up path) or
     *     when the class is missing.
     */
    public static SharedPreferences store() {
        if (!resolved) resolve();
        return store;
    }

    private static synchronized void resolve() {
        resolved = true;
        store = open(MMKV_ID);
    }

    /** {@code static MMKV mmkvWithID(String)} — the only static String→MMKV method. */
    private static Method findWithId(Class<?> mmkv, Method[] methods) {
        if (methods == null) return null;
        for (Method m : methods) {
            if (!Modifier.isStatic(m.getModifiers())) continue;
            Class<?>[] params = m.getParameterTypes();
            if (params.length == 1
                && params[0] == String.class
                && mmkv.isAssignableFrom(m.getReturnType())) {
                return m;
            }
        }
        return null;
    }

    /** Raw MMKV instance by id, or {@code null}. */
    private static Object instance(String id) {
        try {
            Class<?> mmkv = Class.forName(MMKV_CLASS);
            Method withId = findWithId(mmkv, mmkv.getDeclaredMethods());
            if (withId == null) withId = findWithId(mmkv, mmkv.getMethods());
            if (withId == null) return null;
            return withId.invoke(null, id);
        } catch (Throwable ignored) {
            return null;
        }
    }

    /** The MMKV store with one id, or {@code null} when it is not initialised. */
    public static SharedPreferences storeFor(String id) {
        return open(id);
    }

    /** Opens an MMKV instance by id (MMKV file name). */
    private static SharedPreferences open(String id) {
        Object o = instance(id);
        return o instanceof SharedPreferences ? (SharedPreferences) o : null;
    }

    public static boolean available() {
        return store() != null;
    }

    /** MMKV store ids present on disk (default id first). */
    public static List<String> ids() {
        List<String> out = new ArrayList<>();
        Context ctx = appCtx;
        File dir = ctx == null ? null : new File(ctx.getFilesDir(), "mmkv");
        File[] files = dir == null ? null : dir.listFiles();
        if (files != null) {
            Arrays.sort(files, (a, b) -> a.getName().compareTo(b.getName()));
            for (File f : files) {
                String name = f.getName();
                if (!f.isFile() || name.endsWith(".crc")) continue;
                out.add(name);
            }
        }
        out.remove(MMKV_ID);
        out.add(0, MMKV_ID);
        return out;
    }

    /** Keys in one store, sorted. Uses MMKV's allKeys() because getAll() is unsupported. */
    public static List<String> keys(String id) {
        List<String> out = new ArrayList<>();
        Object o = instance(id);
        if (o == null) return out;
        Object value = null;
        try {
            Method allKeys = o.getClass().getMethod("allKeys");
            value = allKeys.invoke(o);
        } catch (Throwable ignored) {
        }
        if (!(value instanceof String[])) {
            // R8 renames MMKV's own methods; allKeys() is the only public no-arg
            // method on the instance that returns String[].
            for (Method m : o.getClass().getMethods()) {
                if (m.getParameterTypes().length == 0
                    && m.getReturnType() == String[].class) {
                    try {
                        Object candidate = m.invoke(o);
                        if (candidate instanceof String[]) {
                            value = candidate;
                            break;
                        }
                    } catch (Throwable ignored) {
                    }
                }
            }
        }
        if (!(value instanceof String[])) {
            // R8 stripped MMKV's public allKeys(); the JNI entry point survives as
            // `private native String[] allKeys(long, boolean)` next to nativeHandle.
            try {
                Method m = o.getClass().getDeclaredMethod("allKeys", long.class, boolean.class);
                m.setAccessible(true);
                java.lang.reflect.Field handle = o.getClass().getDeclaredField("nativeHandle");
                handle.setAccessible(true);
                Object candidate = m.invoke(o, handle.getLong(o), true);
                if (candidate instanceof String[]) value = candidate;
            } catch (Throwable ignored) {
            }
        }
        if (value instanceof String[]) {
            for (String key : (String[]) value) if (key != null) out.add(key);
        }
        if (out.isEmpty() && o instanceof SharedPreferences) {
            try {
                out.addAll(((SharedPreferences) o).getAll().keySet());
            } catch (Throwable ignored) {
            }
        }
        Collections.sort(out);
        return out;
    }

    /** Keys in the default store, sorted. */
    public static List<String> keys() {
        return keys(MMKV_ID);
    }

    /** Best-effort typed value of one key in one store, or {@code null}. */
    public static String value(String id, String key) {
        SharedPreferences sp = open(id);
        if (sp == null) return null;
        try {
            String s = sp.getString(key, null);
            // MMKV answers getString() with "" for non-string keys; keep looking
            // so booleans/ints are reported by their real type.
            if (s != null && !s.isEmpty()) return s;
        } catch (Throwable ignored) {
        }
        try {
            java.util.Set<String> set = sp.getStringSet(key, null);
            if (set != null) return set.toString();
        } catch (Throwable ignored) {
        }
        try {
            int v = sp.getInt(key, Integer.MIN_VALUE);
            if (v != Integer.MIN_VALUE) return String.valueOf(v);
        } catch (Throwable ignored) {
        }
        try {
            long v = sp.getLong(key, Long.MIN_VALUE);
            if (v != Long.MIN_VALUE) return String.valueOf(v);
        } catch (Throwable ignored) {
        }
        try {
            float v = sp.getFloat(key, Float.NaN);
            if (!Float.isNaN(v)) return String.valueOf(v);
        } catch (Throwable ignored) {
        }
        try {
            if (sp.contains(key)) return String.valueOf(sp.getBoolean(key, false));
        } catch (Throwable ignored) {
        }
        return null;
    }

    /** Value of a key in the default store, then in any per-account store. */
    public static String getString(String key) {
        if (key == null) return null;
        String v = value(MMKV_ID, key);
        if (v != null) return v;
        for (String id : ids()) {
            if (MMKV_ID.equals(id)) continue;
            v = value(id, key);
            if (v != null) return v;
        }
        return null;
    }

    /** Boolean value of a key, searching the default then per-account stores. */
    public static boolean getBool(String key, boolean def) {
        if (key == null) return def;
        List<String> order = new ArrayList<>();
        order.add(MMKV_ID);
        order.addAll(ids());
        for (String id : order) {
            SharedPreferences sp = open(id);
            if (sp == null) continue;
            try {
                if (sp.contains(key)) return sp.getBoolean(key, def);
            } catch (Throwable ignored) {
            }
        }
        return def;
    }

    public static boolean putString(String key, String value) {
        SharedPreferences sp = store();
        if (sp == null) return false;
        try {
            sp.edit().putString(key, value).apply();
            return true;
        } catch (Throwable ignored) {
            return false;
        }
    }

    public static boolean putBool(String key, boolean value) {
        SharedPreferences sp = store();
        if (sp == null) return false;
        try {
            sp.edit().putBoolean(key, value).apply();
            return true;
        } catch (Throwable ignored) {
            return false;
        }
    }

    public static boolean remove(String key) {
        SharedPreferences sp = store();
        if (sp == null) return false;
        try {
            sp.edit().remove(key).apply();
            return true;
        } catch (Throwable ignored) {
            return false;
        }
    }

    /** {@code isFakeLogout<account>} flags across every store. */
    public static List<String> fakeLogoutKeys() {
        List<String> out = new ArrayList<>();
        for (String id : ids()) {
            for (String key : keys(id)) {
                if (key.startsWith(KEY_FAKE_LOGOUT_PREFIX)) out.add(key);
            }
        }
        return out;
    }

    /** Every MMKV file on disk plus the keys each store actually contains. */
    public static String dumpAll(Context ctx) {
        init(ctx);
        StringBuilder sb = new StringBuilder();
        File dir = new File(ctx.getFilesDir(), "mmkv");
        sb.append("MMKV directory ").append(dir.getAbsolutePath()).append('\n');
        for (String id : ids()) {
            SharedPreferences sp = open(id);
            sb.append('\n').append(id);
            File f = new File(dir, id);
            if (f.isFile()) sb.append("  (").append(f.length()).append(" bytes)");
            if (sp == null) {
                sb.append("\n  (not a readable MMKV id)\n");
                continue;
            }
            List<String> keys = keys(id);
            sb.append("\n  ").append(keys.size()).append(" key(s)\n");
            for (String key : keys) {
                String value = value(id, key);
                if (value == null) value = "(unreadable)";
                if (value.length() > 2000) value = value.substring(0, 2000) + "\u2026(" + value.length() + " chars)";
                sb.append("    ").append(key).append(" = ").append(value).append('\n');
            }
        }
        if (ids().isEmpty()) sb.append("  (missing or empty)\n");
        return sb.toString();
    }

    /** Random-looking device id in the shape the app uses (a UUID string). */
    public static String newDeviceId() {
        return java.util.UUID.randomUUID().toString();
    }
}
