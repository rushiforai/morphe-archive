package app.morphe.extension.facebook.debug;

import android.app.Activity;
import android.app.Application;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.ImageView;
import android.widget.TextView;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.List;

/**
 * Debug-only touch inspector for building patches. NOT part of any feature patch.
 *
 * Control from adb (tools/inspect.py does this for you):
 *   adb shell am broadcast -a app.morphe.INSPECT --ez on true  -p <your package>
 *   adb shell am broadcast -a app.morphe.INSPECT --ez on false -p <your package>
 *
 * While on, every touch-down logs (logcat tag "Inspect") the activity, the full view chain under the
 * finger (class + superclasses, id, resource name, bounds, text, content description, tag, drawable,
 * click/long-click listener class) and the children of the deepest view. Listener and view classes are
 * the obfuscated names you fingerprint / hook. Only activity windows are covered (not dialogs/popups).
 */
public final class TouchInspector {
    private static final String TAG = "Inspect";
    private static final String ACTION = "app.morphe.INSPECT";
    private static volatile boolean installed;
    private static volatile boolean enabled;

    private TouchInspector() {}

    /** Idempotent; call from any early point (no arguments, no registers needed). */
    public static void install() {
        if (installed) return;
        try {
            Application app = (Application) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication").invoke(null);
            if (app == null) { Log.w(TAG, "no application yet"); return; }
            installed = true;

            BroadcastReceiver receiver = new BroadcastReceiver() {
                @Override
                public void onReceive(Context c, Intent i) {
                    if (i.getBooleanExtra("dump", false)) { dumpWindows(); return; }
                    enabled = i.getBooleanExtra("on", !enabled);
                    Log.i(TAG, "inspector " + (enabled ? "ON" : "OFF"));
                }
            };
            IntentFilter filter = new IntentFilter(ACTION);
            if (Build.VERSION.SDK_INT >= 33) {
                app.registerReceiver(receiver, filter, Context.RECEIVER_EXPORTED);
            } else {
                app.registerReceiver(receiver, filter);
            }

            app.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
                @Override public void onActivityResumed(Activity a) { wrap(a); }
                @Override public void onActivityCreated(Activity a, android.os.Bundle b) {}
                @Override public void onActivityStarted(Activity a) {}
                @Override public void onActivityPaused(Activity a) {}
                @Override public void onActivityStopped(Activity a) {}
                @Override public void onActivitySaveInstanceState(Activity a, android.os.Bundle b) {}
                @Override public void onActivityDestroyed(Activity a) {}
            });
            Log.i(TAG, "installed; send broadcast " + ACTION + " --ez on true to start");
        } catch (Throwable t) {
            Log.w(TAG, "install failed", t);
        }
    }

    private static void wrap(final Activity activity) {
        try {
            final Window window = activity.getWindow();
            final Window.Callback original = window.getCallback();
            if (original == null || Proxy.isProxyClass(original.getClass())
                    && Proxy.getInvocationHandler(original) instanceof Handler) return;
            window.setCallback((Window.Callback) Proxy.newProxyInstance(
                    Window.Callback.class.getClassLoader(), new Class<?>[]{Window.Callback.class},
                    new Handler(original, activity)));
        } catch (Throwable t) {
            Log.w(TAG, "wrap failed", t);
        }
    }

    private static final class Handler implements InvocationHandler {
        private final Window.Callback target;
        private final Activity activity;

        Handler(Window.Callback target, Activity activity) {
            this.target = target;
            this.activity = activity;
        }

        @Override
        public Object invoke(Object proxy, Method m, Object[] args) throws Throwable {
            if (enabled && "dispatchTouchEvent".equals(m.getName()) && args != null && args.length == 1) {
                MotionEvent e = (MotionEvent) args[0];
                if (e.getActionMasked() == MotionEvent.ACTION_DOWN) {
                    try {
                        report(activity, e.getRawX(), e.getRawY());
                    } catch (Throwable t) {
                        Log.w(TAG, "report failed", t);
                    }
                }
            }
            try {
                return m.invoke(target, args);
            } catch (java.lang.reflect.InvocationTargetException ex) {
                throw ex.getCause() != null ? ex.getCause() : ex;
            }
        }
    }

    /** adb ... --ez dump true: logs the view tree of EVERY window (dialogs, popups, bottom sheets). */
    private static void dumpWindows() {
        try {
            Class<?> wmg = Class.forName("android.view.WindowManagerGlobal");
            Object inst = wmg.getMethod("getInstance").invoke(null);
            Field f = wmg.getDeclaredField("mViews");
            f.setAccessible(true);
            List<?> views = (List<?>) f.get(inst);
            Log.i(TAG, "==== DUMP " + views.size() + " windows");
            for (int i = 0; i < views.size(); i++) {
                View v = (View) views.get(i);
                Log.i(TAG, "-- window " + i + " " + v.getClass().getName());
                dumpTree(v, 0);
            }
        } catch (Throwable t) {
            Log.w(TAG, "dump failed", t);
        }
    }

    private static void dumpTree(View v, int depth) {
        if (depth > 40) return;
        StringBuilder pad = new StringBuilder();
        for (int i = 0; i < depth; i++) pad.append(' ');
        int vis = v.getVisibility();
        Log.i(TAG, "  " + pad + (vis == View.VISIBLE ? "" : vis == View.GONE ? "(GONE) " : "(INVIS) ")
                + describe(v) + (v instanceof ViewGroup ? " kids=" + ((ViewGroup) v).getChildCount() : ""));
        if (vis == View.GONE) return;
        if (v instanceof ViewGroup) {
            ViewGroup g = (ViewGroup) v;
            for (int i = 0; i < g.getChildCount(); i++) dumpTree(g.getChildAt(i), depth + 1);
        }
    }

    private static void report(Activity activity, float rawX, float rawY) {
        View decor = activity.getWindow().getDecorView();
        List<View> chain = new ArrayList<>();
        hit(decor, (int) rawX, (int) rawY, chain);
        Log.i(TAG, "==== TAP " + (int) rawX + "," + (int) rawY + " activity=" + activity.getClass().getName()
                + " pkg=" + activity.getPackageName());
        for (int i = 0; i < chain.size(); i++) {
            Log.i(TAG, String.format("[%d] %s", i, describe(chain.get(i))));
        }
        if (chain.isEmpty()) return;
        View deepest = chain.get(chain.size() - 1);
        if (deepest instanceof ViewGroup) {
            ViewGroup g = (ViewGroup) deepest;
            for (int c = 0; c < g.getChildCount() && c < 20; c++) {
                Log.i(TAG, "   child[" + c + "] " + describe(g.getChildAt(c)));
            }
        }
        // Closest clickable ancestor (the thing a patch usually needs to neutralise).
        for (int i = chain.size() - 1; i >= 0; i--) {
            View v = chain.get(i);
            if (v.isClickable() || v.isLongClickable()) {
                Log.i(TAG, "CLICK TARGET [" + i + "] " + v.getClass().getName()
                        + " onClick=" + listener(v, "mOnClickListener")
                        + " onLongClick=" + listener(v, "mOnLongClickListener")
                        + " onTouch=" + listener(v, "mOnTouchListener"));
                break;
            }
        }
    }

    private static boolean hit(View v, int x, int y, List<View> out) {
        if (v.getVisibility() != View.VISIBLE) return false;
        int[] loc = new int[2];
        v.getLocationOnScreen(loc);
        if (x < loc[0] || y < loc[1] || x >= loc[0] + v.getWidth() || y >= loc[1] + v.getHeight()) return false;
        out.add(v);
        if (v instanceof ViewGroup) {
            ViewGroup g = (ViewGroup) v;
            List<View> best = null;
            for (int i = g.getChildCount() - 1; i >= 0; i--) { // topmost child first
                List<View> t = new ArrayList<>();
                if (!hit(g.getChildAt(i), x, y, t)) continue;
                if (best == null) best = t;
                if (anyClickable(t)) { best = t; break; } // overlays that swallow nothing don't hide the real target
            }
            if (best != null) out.addAll(best);
        }
        return true;
    }

    private static boolean anyClickable(List<View> chain) {
        for (View v : chain) if (v.isClickable() || v.isLongClickable()) return true;
        return false;
    }

    private static String describe(View v) {
        StringBuilder sb = new StringBuilder();
        sb.append(v.getClass().getName());
        Class<?> sup = v.getClass().getSuperclass();
        if (sup != null && !sup.getName().startsWith("java.")) sb.append(" : ").append(sup.getName());
        int id = v.getId();
        if (id != View.NO_ID) {
            sb.append(" id=0x").append(Integer.toHexString(id));
            try {
                sb.append(" (").append(v.getResources().getResourceName(id)).append(")");
            } catch (Throwable ignored) {
                sb.append(" (no name)");
            }
        }
        Rect r = new Rect();
        v.getGlobalVisibleRect(r);
        sb.append(" bounds=").append(r.toShortString());
        if (v.isClickable()) sb.append(" clickable");
        if (v.isLongClickable()) sb.append(" longClickable");
        if (!v.isEnabled()) sb.append(" disabled");
        if (v instanceof TextView) {
            CharSequence t = ((TextView) v).getText();
            if (t != null && t.length() > 0) sb.append(" text=\"").append(t).append('"');
        }
        if (v.getContentDescription() != null) sb.append(" desc=\"").append(v.getContentDescription()).append('"');
        if (v.getTag() != null) sb.append(" tag=").append(v.getTag());
        if (v instanceof ImageView) {
            Drawable d = ((ImageView) v).getDrawable();
            if (d != null) sb.append(" drawable=").append(d.getClass().getName());
        }
        String l = listener(v, "mOnClickListener");
        if (!"null".equals(l)) sb.append(" onClick=").append(l);
        return sb.toString();
    }

    /** Reads View.mListenerInfo.<field> and returns its class name ("null" if unset/unreadable). */
    private static String listener(View v, String field) {
        try {
            Field li = View.class.getDeclaredField("mListenerInfo");
            li.setAccessible(true);
            Object info = li.get(v);
            if (info == null) return "null";
            Field f = info.getClass().getDeclaredField(field);
            f.setAccessible(true);
            Object l = f.get(info);
            return l == null ? "null" : l.getClass().getName();
        } catch (Throwable t) {
            return "?";
        }
    }
}
