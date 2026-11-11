package e.e.a;

import android.app.Activity;
import android.os.Looper;
import android.util.Log;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Map;

/** Synchronize the late-arriving public mylist title with its saved tab. */
public final class Dev126 {
    private Dev126() {}

    private static Field field(Class<?> type, String name) throws Exception {
        for (Class<?> c = type; c != null; c = c.getSuperclass()) {
            try {
                Field f = c.getDeclaredField(name);
                f.setAccessible(true);
                return f;
            } catch (NoSuchFieldException ignored) { }
        }
        throw new NoSuchFieldException(name);
    }

    private static Method method(Class<?> type, String name, Class<?>... parameters)
            throws Exception {
        for (Class<?> c = type; c != null; c = c.getSuperclass()) {
            try {
                Method m = c.getDeclaredMethod(name, parameters);
                m.setAccessible(true);
                return m;
            } catch (NoSuchMethodException ignored) { }
        }
        throw new NoSuchMethodException(name);
    }

    public static void publicMylistTitle(Object fragment, CharSequence title) {
        if (fragment == null || title == null || TabTitleRules126.generic(title.toString()))
            return;
        try {
            Activity activity = (Activity) field(fragment.getClass(), "o0").get(fragment);
            if (activity == null || activity.isFinishing() || activity.isDestroyed()) return;
            if (Looper.myLooper() != Looper.getMainLooper()) {
                final String value = title.toString();
                activity.runOnUiThread(() -> publicMylistTitle(fragment, value));
                return;
            }
            // The current fragment check prevents async completions from a
            // previously selected page from changing another tab's title.
            Class<?> chrome = Class.forName("e.e.a.TabChrome228");
            if (!Boolean.TRUE.equals(method(chrome, "current", Object.class)
                    .invoke(null, fragment))) return;
            Class<?> tabs = Class.forName("e.e.a.MultiTabs227");
            Object data = method(tabs, "data").invoke(null);
            String selected = (String) field(data.getClass(), "selected").get(data);
            if (selected == null) return;
            Object tab = method(data.getClass(), "find", String.class).invoke(data, selected);
            if (tab == null) return;
            Field labelField = field(tab.getClass(), "label");
            String before = (String) labelField.get(tab);
            String url = (String) field(tab.getClass(), "url").get(tab);
            Object listUrlValue = field(fragment.getClass(), "d0").get(fragment);
            String loadedUrl = listUrlValue == null ? "" : listUrlValue.toString();
            String after = TabTitleRules126.chosen(url, loadedUrl, before, title);
            if (after == null || after.equals(before)) return;
            labelField.set(tab, after);
            method(tabs, "save").invoke(null);
            Object hosts = field(tabs, "HOSTS").get(null);
            if (hosts instanceof Map) {
                Object host = ((Map<?, ?>) hosts).get(activity);
                if (host != null) method(host.getClass(), "bar").invoke(host);
            }
        } catch (Exception failure) {
            Log.w("nicoid-tabs", "Public mylist title sync unavailable: "
                    + failure.getClass().getSimpleName());
        }
    }
}
