package app.morphe.extension.facebook.marketplace;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.Locale;

/**
 * Hides the paragraph on the Marketplace profile screen that ends in the "Go to settings" link.
 * Marketplace screens are React Native: the paragraph is one text view whose text contains the link
 * label, so every resumed activity gets a throttled layout listener that sets such a view to GONE.
 * English UI string only. Reflection only (no Android compile dependency); never throws.
 */
@SuppressWarnings("unused")
public final class ProfileNotice {
    private static final int VIEW_GONE = 8;
    private static final int MAX_NODES = 4000, MAX_DEPTH = 40, SCAN_DELAY_MS = 150;
    private static final String PHRASE = "go to settings";
    private static volatile boolean installed;

    private ProfileNotice() {
    }

    /** A paragraph (not a whole screen's text) that contains the link label. */
    static boolean matches(String text) {
        if (text == null) return false;
        String t = text.toLowerCase(Locale.ROOT).replaceAll("[\\s\\u00a0]+", " ").trim();
        return t.length() <= 500 && t.contains(PHRASE);
    }

    /** Injected (no registers) next to the other hooks; idempotent. */
    public static void install() {
        if (installed) return;
        try {
            Object app = Class.forName("android.app.ActivityThread").getMethod("currentApplication").invoke(null);
            if (app == null) return;
            Class<?> cb = Class.forName("android.app.Application$ActivityLifecycleCallbacks");
            Object proxy = Proxy.newProxyInstance(cb.getClassLoader(), new Class<?>[]{cb}, new InvocationHandler() {
                public Object invoke(Object p, Method m, Object[] args) {
                    try {
                        if ("onActivityResumed".equals(m.getName()) && args != null && args.length > 0) attach(args[0]);
                    } catch (Throwable ignored) {
                    }
                    return null;
                }
            });
            find(app.getClass(), "registerActivityLifecycleCallbacks", cb).invoke(app, proxy);
            installed = true;
        } catch (Throwable ignored) {
        }
    }

    private static void attach(Object activity) throws Exception {
        Object window = call(activity, "getWindow");
        final Object decor = window == null ? null : call(window, "getDecorView");
        if (decor == null) return;
        final Class<?> lt = Class.forName("android.view.ViewTreeObserver$OnGlobalLayoutListener");
        final boolean[] pending = {false};
        final Runnable scan = new Runnable() {
            public void run() {
                pending[0] = false;
                try {
                    hide(decor, 0, new int[]{MAX_NODES});
                } catch (Throwable ignored) {
                }
            }
        };
        Object l = Proxy.newProxyInstance(lt.getClassLoader(), new Class<?>[]{lt}, new InvocationHandler() {
            public Object invoke(Object p, Method m, Object[] args) {
                try {
                    if ("onGlobalLayout".equals(m.getName()) && !pending[0]) {
                        pending[0] = true;
                        find(decor.getClass(), "postDelayed", Runnable.class, long.class)
                                .invoke(decor, scan, (long) SCAN_DELAY_MS);
                    }
                } catch (Throwable ignored) {
                }
                return null;
            }
        });
        find(call(decor, "getViewTreeObserver").getClass(), "addOnGlobalLayoutListener", lt)
                .invoke(call(decor, "getViewTreeObserver"), l);
        scan.run();
    }

    /** Hides every matching view under {@code view}; returns how many. */
    static int hide(Object view, int depth, int[] budget) throws Exception {
        if (view == null || depth > MAX_DEPTH || budget[0]-- <= 0) return 0;
        if (((Number) call(view, "getVisibility")).intValue() == VIEW_GONE) return 0;
        if (matches(textOf(view))) {
            find(view.getClass(), "setVisibility", int.class).invoke(view, VIEW_GONE);
            return 1;
        }
        int n = 0;
        try {
            int count = ((Number) call(view, "getChildCount")).intValue();
            Method child = find(view.getClass(), "getChildAt", int.class);
            for (int i = 0; i < count; i++) n += hide(child.invoke(view, i), depth + 1, budget);
        } catch (NoSuchMethodException ignored) {
        }
        return n;
    }

    private static String textOf(Object view) {
        try {
            Object t = call(view, "getText");
            if (t != null && !String.valueOf(t).isEmpty()) return String.valueOf(t);
        } catch (Throwable ignored) {
        }
        try {
            Object d = call(view, "getContentDescription");
            return d == null ? null : String.valueOf(d);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static Object call(Object o, String name) throws Exception {
        return find(o.getClass(), name).invoke(o);
    }

    private static Method find(Class<?> start, String name, Class<?>... params) throws NoSuchMethodException {
        for (Class<?> c = start; c != null; c = c.getSuperclass()) {
            try {
                Method m = c.getDeclaredMethod(name, params);
                m.setAccessible(true);
                return m;
            } catch (NoSuchMethodException ignored) {
            }
        }
        return start.getMethod(name, params);
    }
}
