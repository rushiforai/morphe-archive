package app.morphe.extension.maps.patches;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.util.AttributeSet;
import android.util.Log;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.Locale;

/**
 * "NMAX patch" in Maps' Settings: the last row of the main page, drawn by Maps' own CustomSettingsPreference (icon in a
 * circle, title, summary), opening a page of its own with Maps' switch rows (androidx SwitchPreferenceCompat) for
 * {@link GmapsDashBridge}'s options: keep portrait while navigating on the dash (default on), disable
 * picture-in-picture (default on). Saved in Maps' prefs, read by the bridge.
 *
 * The page is a second instance of Maps' own Settings fragment, opened the way Maps opens its sub-pages
 * (host.af(fragment)); {@link #attach} then swaps its list for ours and {@link #title} renames it.
 *
 * Called by MapsSettingsRows.attach with the upstream settings-rows schema (obfuscated androidx.preference members, see
 * PictureInPicturePatch.attach); the patch writes this build's other obfuscated names into {@link #names}.
 */
@SuppressWarnings("unused")
public final class NmaxSettings {
    private static final String TAG = "GmapsDash";
    static final String PREFS = "nmaxconnect_dash";
    static final String LOCK_PORTRAIT = "lock_portrait";
    static final String NO_PIP = "no_pip";
    private static final String ROW_KEY = "nmax_patch";
    private static final String GMS_ROW_KEY = "nmax_gms";
    private static final String GMS_SETTINGS = "org.microg.gms.ui.MainSettingsActivity";
    private static final String ICON = "gs_two_wheeler_vd_theme_24";
    private static final int ICON_GROUP = 0x4e4d4158; // "NMAX": the icon's Compose group key

    /** The page fragment we opened and have not built yet, then the built one (for its title). */
    private static WeakReference<Object> pending = new WeakReference<>(null);
    private static WeakReference<Object> page = new WeakReference<>(null);

    private NmaxSettings() {
    }

    /**
     * The patch replaces this body with "key=value;…" for this Maps build: setChecked (TwoStatePreference),
     * host/nav (fragment's host getter, host's open-fragment method), manager/managerContext/createScreen/setScreen
     * (PreferenceFragmentCompat and PreferenceManager members), iconOwner/iconMethod/groupStart/groupEnd (Compose
     * painter-from-resource helper and the composer's replaceable-group calls), iconType (the row's icon interface).
     */
    private static String names() {
        return "";
    }

    private static java.util.Map<String, String> nameMap;

    private static String name(String key) {
        if (nameMap == null) {
            java.util.Map<String, String> m = new java.util.HashMap<>();
            for (String kv : names().split(";")) {
                int i = kv.indexOf('=');
                if (i > 0) m.put(kv.substring(0, i), kv.substring(i + 1));
            }
            nameMap = m;
        }
        String v = nameMap.get(key);
        if (v == null) throw new IllegalStateException("no name " + key);
        return v;
    }

    static SharedPreferences prefs(Context context) {
        return context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    /** Hooked at the start of the Settings fragment's title getter: our page's title, null for Maps' own. */
    public static String title(Object fragment) {
        return fragment != null && (fragment == page.get() || fragment == pending.get()) ? vi() ? "Bản vá NMAX" : "NMAX patch"
            : null;
    }

    private static boolean vi() {
        return "vi".equals(Locale.getDefault().getLanguage());
    }

    public static void attach(Object fragment, String schema) {
        if (fragment == null || schema == null) return;
        try {
            String[] d = schema.split("\\|", -1);
            if (d.length != 12 || !fragment.getClass().getName().equals(d[0]))
                throw new IllegalArgumentException("settings entry schema");
            Object host = fragment.getClass().getMethod(d[2]).invoke(fragment);
            if (!(host instanceof Activity)) return;
            Activity activity = (Activity) host;
            if (activity.isFinishing() || activity.isDestroyed()) return;
            if (fragment == pending.get()) {
                pending = new WeakReference<>(null);
                page = new WeakReference<>(fragment);
                buildPage(fragment, d, activity);
            } else if (fragment != page.get()) {
                addRow(fragment, d, activity);
            }
        } catch (Throwable error) {
            // A failure here must leave Maps' own Settings screen usable.
            Log.w(TAG, "NMAX settings unavailable", error);
        }
    }

    /** The last row of Maps' main Settings page, opening our page. */
    private static void addRow(Object fragment, String[] d, Activity activity) throws Exception {
        Object screen = fragment.getClass().getMethod(d[1]).invoke(fragment);
        ClassLoader loader = fragment.getClass().getClassLoader();
        Class<?> preference = Class.forName("androidx.preference.Preference", false, loader);
        Class<?> group = Class.forName("androidx.preference.PreferenceGroup", false, loader);
        if (!group.isInstance(screen)) throw new IllegalArgumentException("settings screen type");
        if (group.getMethod(d[11], CharSequence.class).invoke(screen, ROW_KEY) != null) return;
        Context context = (Context) preference.getField(d[3]).get(screen);
        Class<?> iconType = Class.forName(name("iconType"), false, loader);
        Object row = Class.forName("com.google.android.apps.gmm.settings.CustomSettingsPreference", false, loader)
            .getConstructor(Context.class, String.class, String.class, String.class, iconType)
            .newInstance(context, ROW_KEY, vi() ? "Bản vá NMAX" : "NMAX patch",
                vi() ? "Giữ màn hình dọc, hình trong hình" : "Keep upright, picture-in-picture", icon(activity, iconType, loader));
        Class<?> click = Class.forName(d[8], false, loader);
        WeakReference<Object> owner = new WeakReference<>(fragment);
        preference.getMethod(d[7], click).invoke(row, listener(loader, click, d[9], "row", pref -> {
            Object f = owner.get();
            if (f != null) open(f);
        }));
        group.getMethod(d[10], preference).invoke(screen, row);
        Log.i(TAG, "NMAX settings row attached");

        // MicroG-RE is embedded in Maps NMAX (no app of its own): its settings open from here.
        Object gms = Class.forName("com.google.android.apps.gmm.settings.CustomSettingsPreference", false, loader)
            .getConstructor(Context.class, String.class, String.class, String.class, iconType)
            .newInstance(context, GMS_ROW_KEY, "microG",
                vi() ? "Tài khoản Google, vị trí" : "Google account, location", icon(activity, iconType, loader));
        preference.getMethod(d[7], click).invoke(gms, listener(loader, click, d[9], "gms", pref -> {
            Object f = owner.get();
            if (f == null) return;
            try {
                Activity a = (Activity) f.getClass().getMethod(d[2]).invoke(f);
                a.startActivity(new android.content.Intent().setClassName(a.getPackageName(), GMS_SETTINGS));
            } catch (Exception error) {
                Log.w(TAG, "microG settings unavailable", error);
            }
        }));
        group.getMethod(d[10], preference).invoke(screen, gms);
    }

    /** Opens a fresh Settings fragment as our page, through the host Maps opens its sub-pages with. */
    private static void open(Object fragment) {
        try {
            Object host = call(fragment, name("host"));
            // Always the page class whose title getter the patch hooks, also from the legacy Settings page.
            Object next = Class.forName(name("page"), false, fragment.getClass().getClassLoader())
                .getConstructor().newInstance();
            pending = new WeakReference<>(next);
            Method nav = null;
            for (Class<?> c = host.getClass(); c != null && nav == null; c = c.getSuperclass()) {
                for (Method m : c.getDeclaredMethods()) {
                    if (m.getName().equals(name("nav")) && m.getParameterTypes().length == 1
                        && m.getParameterTypes()[0].isInstance(next) && m.getReturnType() == void.class) {
                        nav = m;
                        break;
                    }
                }
            }
            if (nav == null) throw new NoSuchMethodException("host." + name("nav"));
            nav.setAccessible(true);
            nav.invoke(host, next);
        } catch (Throwable error) {
            pending = new WeakReference<>(null);
            Log.w(TAG, "NMAX settings page unavailable", error);
        }
    }

    /** Our page: Maps' Settings fragment with a new list holding the two switches. */
    private static void buildPage(Object fragment, String[] d, Activity activity) throws Exception {
        ClassLoader loader = fragment.getClass().getClassLoader();
        Object manager = field(fragment, name("manager"));
        Context context = (Context) field(manager, name("managerContext"));
        Object screen = call(manager, name("createScreen"), context);
        Class<?> preference = Class.forName("androidx.preference.Preference", false, loader);
        Class<?> group = Class.forName("androidx.preference.PreferenceGroup", false, loader);
        Method add = group.getMethod(d[10], preference);
        Method key = preference.getMethod(d[4], String.class);
        Method title = preference.getMethod(d[5], CharSequence.class);
        Method summary = preference.getMethod(d[6], CharSequence.class);
        Class<?> switchType = Class.forName("androidx.preference.SwitchPreferenceCompat", false, loader);
        Method checked = Class.forName("androidx.preference.TwoStatePreference", false, loader)
            .getMethod(name("setChecked"), boolean.class);
        Class<?> click = Class.forName(d[8], false, loader);
        Method setClick = preference.getMethod(d[7], click);
        boolean vi = vi();
        String[][] rows = {
            {LOCK_PORTRAIT, vi ? "Giữ màn hình dọc khi dẫn đường trên đồng hồ" : "Keep upright on the dash",
                vi ? "Không xoay màn hình khi bản đồ đang ở trên đồng hồ NMAX, để bản đồ trên đồng hồ không bị lệch"
                    : "Stays in portrait while the map is on the NMAX dash, so turning the phone does not shift it"},
            {NO_PIP, vi ? "Tắt hình trong hình" : "Disable picture-in-picture",
                vi ? "Không thu nhỏ thành cửa sổ nhỏ khi rời Maps lúc đang dẫn đường"
                    : "No small window when you leave Maps while navigating"},
        };
        Context app = activity.getApplicationContext();
        Object[] made = new Object[rows.length];
        for (int i = 0; i < rows.length; i++) {
            String name = rows[i][0];
            Object row = switchType.getConstructor(Context.class, AttributeSet.class).newInstance(context, null);
            key.invoke(row, "nmax_" + name);
            title.invoke(row, rows[i][1]);
            summary.invoke(row, rows[i][2]);
            setClick.invoke(row, listener(loader, click, d[9], name, pref -> {
                // The switch has already flipped itself (onClick runs before the click listener).
                boolean on = !prefs(app).getBoolean(name, true);
                prefs(app).edit().putBoolean(name, on).apply();
                checked.invoke(pref, on);
                GmapsDashBridge.optionsChanged(app);
                Log.i(TAG, "NMAX setting " + name + "=" + on);
            }));
            add.invoke(screen, row);
            made[i] = row;
        }
        call(fragment, name("setScreen"), screen);
        // After the list is up: attaching sets each switch from Maps' own store, which has no value for our keys.
        SharedPreferences prefs = prefs(activity);
        for (int i = 0; i < rows.length; i++) checked.invoke(made[i], prefs.getBoolean(rows[i][0], true));
        Log.i(TAG, "NMAX settings page built");
    }

    private interface Click {
        void on(Object preference) throws Exception;
    }

    private static Object listener(ClassLoader loader, Class<?> click, String method, String label, Click action) {
        return Proxy.newProxyInstance(loader, new Class<?>[]{click}, (proxy, m, args) -> {
            if (m.getName().equals(method) && args != null && args.length == 1) {
                action.on(args[0]);
                return true;
            }
            if (m.getDeclaringClass() == Object.class) {
                if (m.getName().equals("hashCode")) return System.identityHashCode(proxy);
                if (m.getName().equals("equals")) return args != null && args.length == 1 && proxy == args[0];
                if (m.getName().equals("toString")) return "NMAX patch " + label;
            }
            return false;
        });
    }

    /**
     * The row's icon: Maps' Compose lambda type, doing what Maps' own rows do for a drawable icon
     * (composer.startReplaceableGroup(key); painterResource(id); composer.endReplaceableGroup()).
     */
    private static Object icon(Context context, Class<?> iconType, ClassLoader loader) throws Exception {
        int id = context.getResources().getIdentifier(ICON, "drawable", context.getPackageName());
        if (id == 0) throw new IllegalStateException("no drawable " + ICON);
        Class<?> owner = Class.forName(name("iconOwner"), false, loader);
        Method paint = null;
        for (Method m : owner.getDeclaredMethods()) {
            Class<?>[] p = m.getParameterTypes();
            if (m.getName().equals(name("iconMethod")) && p.length == 3 && p[0] == int.class && p[2] == int.class) paint = m;
        }
        if (paint == null) throw new NoSuchMethodException(name("iconOwner") + "." + name("iconMethod"));
        paint.setAccessible(true);
        Method painter = paint;
        Class<?> composerType = painter.getParameterTypes()[1];
        Method start = composerType.getMethod(name("groupStart"), int.class);
        Method end = composerType.getMethod(name("groupEnd"));
        return Proxy.newProxyInstance(loader, new Class<?>[]{iconType}, (proxy, m, args) -> {
            if (args != null && args.length == 2 && m.getDeclaringClass() == iconType) {
                Object composer = args[0];
                start.invoke(composer, ICON_GROUP);
                Object icon = painter.invoke(null, id, composer, 6);
                end.invoke(composer);
                return icon;
            }
            if (m.getDeclaringClass() == Object.class) {
                if (m.getName().equals("hashCode")) return System.identityHashCode(proxy);
                if (m.getName().equals("equals")) return args != null && args.length == 1 && proxy == args[0];
                if (m.getName().equals("toString")) return "NMAX patch icon";
            }
            return null;
        });
    }

    /** Instance method by name and argument count, declared anywhere up the class chain. */
    private static Object call(Object target, String name, Object... args) throws Exception {
        for (Class<?> c = target.getClass(); c != null; c = c.getSuperclass()) {
            for (Method m : c.getDeclaredMethods()) {
                if (!m.getName().equals(name) || m.getParameterTypes().length != args.length) continue;
                boolean fits = true;
                for (int i = 0; i < args.length; i++) {
                    if (args[i] != null && !wrap(m.getParameterTypes()[i]).isInstance(args[i])) fits = false;
                }
                if (!fits) continue;
                m.setAccessible(true);
                return m.invoke(target, args);
            }
        }
        throw new NoSuchMethodException(target.getClass().getName() + "." + name);
    }

    private static Class<?> wrap(Class<?> c) {
        return c == boolean.class ? Boolean.class : c == int.class ? Integer.class : c;
    }

    /** "owner#field": the field declared on that class (a subclass may reuse the obfuscated name). */
    private static Object field(Object target, String name) throws Exception {
        int hash = name.indexOf('#');
        if (hash > 0) {
            Field f = Class.forName(name.substring(0, hash), false, target.getClass().getClassLoader())
                .getDeclaredField(name.substring(hash + 1));
            f.setAccessible(true);
            return f.get(target);
        }
        for (Class<?> c = target.getClass(); c != null; c = c.getSuperclass()) {
            try {
                Field f = c.getDeclaredField(name);
                f.setAccessible(true);
                return f.get(target);
            } catch (NoSuchFieldException ignored) {
                // up the chain
            }
        }
        throw new NoSuchFieldException(target.getClass().getName() + "." + name);
    }
}
