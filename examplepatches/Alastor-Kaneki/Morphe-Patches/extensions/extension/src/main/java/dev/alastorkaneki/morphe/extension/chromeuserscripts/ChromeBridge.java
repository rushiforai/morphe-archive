package dev.alastorkaneki.morphe.extension.chromeuserscripts;

import android.app.Activity;
import android.content.Context;
import android.view.View;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.WeakHashMap;

/** Reflection bridge to Chrome's active Tab and WebContents. */
final class ChromeBridge {
    static final class Page {
        final String url; final Object tab, web; final boolean incognito;
        Page(String u, Object t, Object w, boolean i) { url = u; tab = t; web = w; incognito = i; }
    }

    private static final Map<Activity, WeakReference<Object>> CACHE = new WeakHashMap<>();

    static Page page(Activity a) {
        Object t = null;
        synchronized (CACHE) { WeakReference<Object> r = CACHE.get(a); if (r != null) t = r.get(); }
        Page p = from(t);
        if (p != null && !p.url.isEmpty()) return p;
        t = find(a);
        if (t == null) return null;
        synchronized (CACHE) { CACHE.put(a, new WeakReference<>(t)); }
        return from(t);
    }

    static boolean exec(Page p, String js) {
        if (p == null || p.web == null) return false;
        for (Method m : methods(p.web.getClass())) {
            if (!m.getName().equals("evaluateJavaScript") || m.getParameterTypes().length == 0 || m.getParameterTypes()[0] != String.class) continue;
            try {
                m.setAccessible(true); Object[] values = new Object[m.getParameterTypes().length]; values[0] = js; m.invoke(p.web, values); return true;
            } catch (Throwable ignored) { }
        }
        return false;
    }

    private static Page from(Object t) {
        if (t == null) return null;
        Object w = call(t, "getWebContents"); String u = url(call(t, "getUrl"));
        if (u == null) u = url(call(t, "getOriginalUrl"));
        Object i = call(t, "isIncognito");
        return new Page(u == null ? "" : u, t, w, i instanceof Boolean && (Boolean) i);
    }

    private static Object find(Activity a) {
        for (String name : new String[]{"getActivityTab", "getCurrentTab", "getTab", "getSelectedTab"}) {
            Object value = call(a, name); if (tab(value)) return value;
        }
        ArrayDeque<Object[]> queue = new ArrayDeque<>(); IdentityHashMap<Object, Boolean> seen = new IdentityHashMap<>();
        queue.add(new Object[]{a, 0}); int count = 0;
        while (!queue.isEmpty() && count++ < 350) {
            Object[] node = queue.remove(); Object value = node[0]; int depth = (Integer) node[1];
            if (value == null || seen.put(value, true) != null) continue;
            if (tab(value)) return value; if (depth >= 5) continue;
            for (Field field : fields(value.getClass())) {
                if (Modifier.isStatic(field.getModifiers()) || field.getType().isPrimitive()) continue;
                try {
                    field.setAccessible(true); Object child = field.get(value);
                    if (tab(child)) return child;
                    if (traverse(child, a.getClass().getClassLoader())) queue.add(new Object[]{child, depth + 1});
                } catch (Throwable ignored) { }
            }
        }
        return null;
    }

    private static boolean tab(Object value) {
        if (value == null) return false;
        String name = value.getClass().getName().toLowerCase(Locale.US);
        return (name.contains(".tab.") || name.endsWith("tab") || name.endsWith("tabimpl")) && call(value, "getWebContents") != null;
    }

    private static boolean traverse(Object value, ClassLoader loader) {
        if (value == null || value instanceof Context || value instanceof View || value instanceof String || value instanceof Number) return false;
        String name = value.getClass().getName();
        return value.getClass().getClassLoader() == loader || name.startsWith("org.chromium") || name.startsWith("com.google.android.apps.chrome");
    }

    private static Object call(Object object, String name) {
        if (object == null) return null;
        for (Method method : methods(object.getClass())) {
            if (!method.getName().equals(name) || method.getParameterTypes().length != 0) continue;
            try { method.setAccessible(true); return method.invoke(object); } catch (Throwable ignored) { return null; }
        }
        return null;
    }

    private static String url(Object object) {
        if (object == null) return null;
        if (object instanceof CharSequence) return object.toString();
        Object spec = call(object, "getSpec"); if (spec instanceof CharSequence) return spec.toString();
        String value = object.toString(); return value.contains("://") ? value : null;
    }

    private static Method[] methods(Class<?> type) {
        List<Method> result = new ArrayList<>();
        for (Class<?> cursor = type; cursor != null && cursor != Object.class; cursor = cursor.getSuperclass()) {
            try { Collections.addAll(result, cursor.getDeclaredMethods()); } catch (Throwable ignored) { }
        }
        return result.toArray(new Method[0]);
    }

    private static Field[] fields(Class<?> type) {
        List<Field> result = new ArrayList<>();
        for (Class<?> cursor = type; cursor != null && cursor != Object.class; cursor = cursor.getSuperclass()) {
            try { Collections.addAll(result, cursor.getDeclaredFields()); } catch (Throwable ignored) { }
        }
        return result.toArray(new Field[0]);
    }
}
