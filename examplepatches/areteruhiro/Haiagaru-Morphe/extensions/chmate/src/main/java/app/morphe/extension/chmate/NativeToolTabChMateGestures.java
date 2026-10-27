package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import android.preference.PreferenceManager;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.Proxy;
import java.util.Arrays;
import java.util.Map;

/** Uses ChMate's saved tab gestures. Adapted from the proposal in PR #93.
 * The native recognizer posts completion after UP; each touch sequence owns its
 * listener so a delayed result can never act on a subsequent touch sequence.
 */
final class NativeToolTabChMateGestures {
    static final String KEY = "nativeToolTabChMateGestures";
    private final Activity host;
    private final Object fragment;
    private final NativeToolTabSwipeLayout surface;
    private final Handler main = new Handler(Looper.getMainLooper());
    private Constructor<?> constructor;
    private Method touch, distance;
    private Session current;
    private boolean resolved;

    private static final class Session {
        Object recognizer;
        MotionEvent up;
        String action;
        boolean released;
        boolean moved;
        float startX, startY;
    }

    NativeToolTabChMateGestures(Activity host, Object fragment, NativeToolTabSwipeLayout surface) {
        this.host = host;
        this.fragment = fragment;
        this.surface = surface;
    }

    static boolean enabled(Context context) {
        return SettingsProfiles.prefs(context).getBoolean(KEY, false);
    }

    private boolean resolve() {
        if (resolved) return constructor != null;
        resolved = true;
        try {
            Class<?> type = Class.forName(HaiagaruSettingsGestures.recognizerClassName(), false,
                    host.getClassLoader());
            for (Constructor<?> candidate : type.getConstructors()) {
                Class<?>[] args = candidate.getParameterTypes();
                if (args.length == 2 && args[0] == Context.class && args[1].isInterface()) {
                    if (constructor != null) throw new NoSuchMethodException("Ambiguous gesture constructor");
                    constructor = candidate;
                }
            }
            for (Method candidate : type.getDeclaredMethods()) {
                if (!Modifier.isPublic(candidate.getModifiers())) continue;
                if (candidate.getReturnType() == boolean.class
                        && Arrays.equals(candidate.getParameterTypes(), new Class<?>[]{MotionEvent.class})) {
                    if (touch != null) throw new NoSuchMethodException("Ambiguous gesture touch method");
                    touch = candidate;
                }
                if (candidate.getReturnType() == void.class
                        && Arrays.equals(candidate.getParameterTypes(), new Class<?>[]{int.class})) {
                    if (distance != null) throw new NoSuchMethodException("Ambiguous gesture distance method");
                    distance = candidate;
                }
            }
            if (constructor == null || touch == null || distance == null)
                throw new NoSuchMethodException("ChMate gesture recognizer");
            return true;
        } catch (ReflectiveOperationException | RuntimeException error) {
            constructor = null;
            android.util.Log.w("Haiagaru", "Tool tab gestures unavailable", error);
            return false;
        }
    }

    /** True only while UP is held for the recognizer's already queued completion. */
    boolean dispatch(MotionEvent event) {
        int action = event.getActionMasked();
        if (action == MotionEvent.ACTION_DOWN) {
            cancel();
            if (!enabled(host) || !surface.hasWindowFocus() || !surface.isShown()) return false;
            SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(host);
            if (!prefs.getBoolean("gesture", true) || !insideBody(event) || !resolve()) return false;
            Session session = new Session();
            try {
                Class<?> listener = constructor.getParameterTypes()[1];
                Object proxy = Proxy.newProxyInstance(listener.getClassLoader(), new Class<?>[]{listener},
                        (self, method, args) -> {
                            if (method.getDeclaringClass() == Object.class) {
                                if ("hashCode".equals(method.getName())) return System.identityHashCode(self);
                                if ("equals".equals(method.getName())) return self == args[0];
                                return "NativeToolTabGestureListener";
                            }
                            if (current == session && args != null && args.length == 3
                                    && args[0] instanceof Integer)
                                session.action = assignedAction((Integer) args[0]);
                            return null;
                        });
                session.recognizer = constructor.newInstance(host, proxy);
                distance.invoke(session.recognizer, prefs.getInt("gestureLength", 100));
                session.startX = event.getX();
                session.startY = event.getY();
                current = session;
            } catch (ReflectiveOperationException | RuntimeException error) {
                android.util.Log.w("Haiagaru", "Tool tab gesture initialization failed", error);
                return false;
            }
        }
        Session session = current;
        if (session == null || session.released) return false;
        if (!enabled(host) || !PreferenceManager.getDefaultSharedPreferences(host).getBoolean("gesture", true)
                || action == MotionEvent.ACTION_CANCEL || event.getPointerCount() != 1
                || action == MotionEvent.ACTION_POINTER_DOWN
                || !session.moved && event.getEventTime() - event.getDownTime() > ViewConfiguration.getLongPressTimeout()) {
            cancel();
            return false;
        }
        int slop = ViewConfiguration.get(host).getScaledTouchSlop();
        if (Math.abs(event.getX() - session.startX) > slop || Math.abs(event.getY() - session.startY) > slop)
            session.moved = true;
        try {
            boolean recognized = Boolean.TRUE.equals(touch.invoke(session.recognizer, event));
            if (action == MotionEvent.ACTION_UP) {
                session.released = true;
                if (recognized || session.action != null) {
                    // Native completion is queued by touch(UP) before this finalizer.
                    // Deliver CANCEL for an assigned action, otherwise preserve the original UP.
                    session.up = MotionEvent.obtain(event);
                    main.post(() -> finish(session));
                    return true;
                }
                cancel();
            }
        } catch (ReflectiveOperationException | RuntimeException error) {
            android.util.Log.w("Haiagaru", "Tool tab gesture failed", error);
            cancel();
        }
        return false;
    }

    private boolean insideBody(MotionEvent event) {
        View body = surface.getChildCount() == 0 ? null : surface.getChildAt(surface.getChildCount() - 1);
        if (body == null || !body.isShown()) return false;
        int[] position = new int[2];
        body.getLocationOnScreen(position);
        return event.getRawX() >= position[0] && event.getRawY() >= position[1]
                && event.getRawX() < position[0] + body.getWidth()
                && event.getRawY() < position[1] + body.getHeight();
    }

    private String assignedAction(int code) {
        if (code == 0) return null;
        SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(host);
        String found = null;
        for (String key : new String[]{"gestureCloseTab", "gestureLeftTab", "gestureRightTab",
                "gestureBack", "gestureForward", "gestureNewTab"}) {
            if (prefs.getInt(key, 0) == code) {
                if (found != null) return null;
                found = key;
            }
        }
        if (found == null) return null;
        // A conflicting assignment must not turn an unsupported native action into closing a tab.
        for (Map.Entry<String, ?> entry : prefs.getAll().entrySet()) {
            String key = entry.getKey();
            if (!key.equals(found) && !key.equals("gestureLength")
                    && (key.startsWith("gesture") || key.startsWith("haiagaruGesture"))
                    && entry.getValue() instanceof Integer && ((Integer) entry.getValue()) == code)
                return null;
        }
        return found;
    }

    private boolean usable() {
        return enabled(host) && PreferenceManager.getDefaultSharedPreferences(host).getBoolean("gesture", true)
                && surface.isAttachedToWindow() && surface.isShown() && surface.hasWindowFocus()
                && !host.isFinishing() && !host.isDestroyed();
    }

    private void finish(Session session) {
        if (current != session) return;
        String action = session.action;
        boolean perform = action != null && usable();
        MotionEvent up = session.up;
        session.up = null;
        current = null;
        if (up == null) return;
        try {
            if (perform || !usable()) up.setAction(MotionEvent.ACTION_CANCEL);
            surface.dispatchChildTouchEvent(up);
        } finally {
            up.recycle();
        }
        // The child has finished its touch dispatch before any WebView/tab is removed.
        if (!perform || !usable()) return;
        switch (action) {
            case "gestureCloseTab": NativeToolTabs.closeCurrentTab(host, fragment); break;
            case "gestureLeftTab": NativeToolTabs.moveAdjacentTool(host, fragment, -1); break;
            case "gestureRightTab": NativeToolTabs.moveAdjacentTool(host, fragment, 1); break;
            case "gestureBack": NativeToolTabs.navigateTool(host, fragment, false); break;
            case "gestureForward": NativeToolTabs.navigateTool(host, fragment, true); break;
            case "gestureNewTab": NativeToolTabs.newBlankTab(host, fragment); break;
            default: break;
        }
    }

    void cancel() {
        Session session = current;
        current = null;
        if (session == null) return;
        MotionEvent event = MotionEvent.obtain(0, 0, MotionEvent.ACTION_CANCEL, 0, 0, 0);
        try {
            if (session.recognizer != null) touch.invoke(session.recognizer, event);
        } catch (ReflectiveOperationException | RuntimeException ignored) {
        } finally {
            event.recycle();
        }
        if (session.up != null) {
            session.up.setAction(MotionEvent.ACTION_CANCEL);
            try { surface.dispatchChildTouchEvent(session.up); }
            finally { session.up.recycle(); session.up = null; }
        }
    }
}
