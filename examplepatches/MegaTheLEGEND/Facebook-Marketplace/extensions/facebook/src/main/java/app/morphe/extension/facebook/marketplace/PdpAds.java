package app.morphe.extension.facebook.marketplace;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

/**
 * Hides the ad blocks on the Marketplace listing page (PDP, React Native). The listing's tail section is a view
 * tagged {@code mp_pdp_tail_section}; each ad block under it contains views tagged {@code mp_ads_*}
 * (e.g. {@code mp_ads_sponsored_text}, {@code mp_ads_media_tap_surface}). The block is the tail section's
 * grandchild on that path, and it is set to GONE. Reflection only; never throws.
 */
@SuppressWarnings("unused")
public final class PdpAds {
    private static final int VIEW_GONE = 8;
    private static final int MAX_NODES = 4000, MAX_DEPTH = 40, SCAN_DELAY_MS = 150;
    private static final String TAIL_TAG = "mp_pdp_tail_section", AD_TAG_PREFIX = "mp_ads_";
    private static volatile boolean installed;

    private PdpAds() {
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

    static int hide(Object view, int depth, int[] budget) throws Exception {
        scan(view, depth, budget, -1);
        return 0;
    }

    /**
     * Walks the tree; {@code level} = levels below the tail section view (0 = the tail itself), -1 outside one.
     * Returns true when this view or a descendant carries an ad tag; the view at level 2 (the ad block) is hidden.
     */
    private static boolean scan(Object view, int depth, int[] budget, int level) throws Exception {
        if (view == null || depth > MAX_DEPTH || budget[0]-- <= 0) return false;
        if (((Number) call(view, "getVisibility")).intValue() == VIEW_GONE) return false;
        String tag = tagOf(view);
        if (level < 0 && TAIL_TAG.equals(tag)) level = 0;
        else if (level >= 0) level++;
        boolean ad = tag != null && level >= 0 && tag.startsWith(AD_TAG_PREFIX);
        try {
            int count = ((Number) call(view, "getChildCount")).intValue();
            Method child = find(view.getClass(), "getChildAt", int.class);
            for (int i = 0; i < count; i++) ad |= scan(child.invoke(view, i), depth + 1, budget, level);
        } catch (NoSuchMethodException ignored) {
        }
        if (ad && level == 2) {
            find(view.getClass(), "setVisibility", int.class).invoke(view, VIEW_GONE);
        }
        return ad;
    }

    private static String tagOf(Object view) {
        try {
            Object t = call(view, "getTag");
            return t == null ? null : String.valueOf(t);
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
