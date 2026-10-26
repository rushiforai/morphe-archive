package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;
import android.view.MotionEvent;
import android.view.View;
import android.widget.ScrollView;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.Proxy;
import java.util.Arrays;

/** Routes ChMate's assigned navigation gestures to the Haiagaru settings dialog. */
final class HaiagaruSettingsGestures {
    static final String SENSITIVITY = "settingsGestureSensitivity";
    static int gestureDistance(int nativeLength, int percent) {
        int sensitivity = Math.max(50, Math.min(200, percent));
        return Math.max(1, (int) Math.min(Integer.MAX_VALUE, Math.max(1L, nativeLength) * 100L / sensitivity));
    }
    private final Activity activity;
    private final View surface;
    private final Runnable backAction, topAction, bottomAction;
    private Object recognizer;
    private Method touch, distance;
    private Runnable closeAction;
    private boolean tracking, intercepted, handled, closed, cancelling;

    HaiagaruSettingsGestures(Activity activity, ScrollView surface, SettingsSections sections) {
        this(activity, surface, () -> sections.goBack(), () -> surface.smoothScrollTo(0, 0), () -> {
            View child = surface.getChildAt(0);
            if (child != null) surface.smoothScrollTo(0, Math.max(0, child.getHeight() - surface.getHeight()));
        });
    }

    HaiagaruSettingsGestures(Activity activity, View surface, Runnable backAction, Runnable topAction, Runnable bottomAction) {
        this.activity = activity;
        this.surface = surface;
        this.backAction = backAction;
        this.topAction = topAction;
        this.bottomAction = bottomAction;
        try {
            Class<?> type = Class.forName(recognizerClassName(), false, activity.getClassLoader());
            Constructor<?> constructor = null;
            for (Constructor<?> candidate : type.getConstructors()) {
                Class<?>[] parameters = candidate.getParameterTypes();
                if (parameters.length == 2 && parameters[0] == android.content.Context.class
                        && parameters[1].isInterface()) constructor = candidate;
            }
            if (constructor == null) throw new NoSuchMethodException("Gesture constructor");
            Class<?> listener = constructor.getParameterTypes()[1];
            Object callback = Proxy.newProxyInstance(type.getClassLoader(), new Class<?>[]{listener}, (proxy, method, args) -> {
                if (method.getDeclaringClass() == Object.class) {
                    if (method.getName().equals("hashCode")) return System.identityHashCode(proxy);
                    if (method.getName().equals("equals")) return proxy == args[0];
                    return "HaiagaruSettingsGestureListener";
                }
                if (!closed && !cancelling && args != null && args.length == 3 && args[0] instanceof Integer)
                    handled = complete((Integer) args[0]);
                return null;
            });
            recognizer = constructor.newInstance(activity, callback);
            for (Method candidate : type.getDeclaredMethods()) {
                if (!Modifier.isPublic(candidate.getModifiers())) continue;
                if (candidate.getReturnType() == boolean.class
                        && Arrays.equals(candidate.getParameterTypes(), new Class<?>[]{MotionEvent.class})) touch = candidate;
                if (candidate.getReturnType() == void.class
                        && Arrays.equals(candidate.getParameterTypes(), new Class<?>[]{int.class})) distance = candidate;
            }
            if (touch == null || distance == null) throw new NoSuchMethodException("Gesture methods");
        } catch (ReflectiveOperationException | RuntimeException error) {
            recognizer = null;
            android.util.Log.w("Haiagaru", "Settings gesture initialization failed", error);
        }
    }

    // Replaced by the main Haiagaru patch after fingerprinting the target APK.
    public static String recognizerClassName() { return ""; }

    void setCloseAction(Runnable action) { closeAction = action; }
    boolean isIntercepted() { return intercepted; }

    boolean dispatch(MotionEvent event) {
        if (closed || recognizer == null || surface == null) return false;
        try {
            if (event.getActionMasked() == MotionEvent.ACTION_DOWN) {
                tracking = false;
                intercepted = false;
                handled = false;
                SharedPreferences preferences = PreferenceManager.getDefaultSharedPreferences(activity);
                if (!preferences.getBoolean("gesture", true)) return false;
                int[] location = new int[2];
                surface.getLocationOnScreen(location);
                float x = event.getRawX(), y = event.getRawY();
                if (x < location[0] || x >= location[0] + surface.getWidth()
                        || y < location[1] || y >= location[1] + surface.getHeight()) return false;
                int percent = SettingsProfiles.prefs(activity).getInt(SENSITIVITY, 100);
                distance.invoke(recognizer, gestureDistance(preferences.getInt("gestureLength", 100), percent));
                tracking = true;
            }
            if (!tracking) return false;
            touch.invoke(recognizer, event);
            if (handled) intercepted = true;
            boolean consumed = intercepted;
            if (event.getActionMasked() == MotionEvent.ACTION_UP || event.getActionMasked() == MotionEvent.ACTION_CANCEL)
                tracking = false;
            return consumed;
        } catch (ReflectiveOperationException | RuntimeException error) {
            recognizer = null;
            tracking = false;
            android.util.Log.w("Haiagaru", "Settings gesture dispatch failed", error);
            return false;
        }
    }

    private boolean complete(int code) {
        if (code == 0 || !surface.hasWindowFocus()) return false;
        SharedPreferences preferences = PreferenceManager.getDefaultSharedPreferences(activity);
        if (!preferences.getBoolean("gesture", true)) return false;
        if (preferences.getInt("gestureBack", 0) == code) {
            backAction.run();
        } else if (preferences.getInt("gestureCloseTab", 0) == code) {
            if (closeAction != null) closeAction.run();
        } else if (preferences.getInt("gestureTop", 0) == code) {
            topAction.run();
        } else if (preferences.getInt("gestureBottom", 0) == code) {
            bottomAction.run();
        } else {
            return false;
        }
        return true;
    }

    void close() {
        closed = true;
        if (recognizer != null && touch != null) {
            MotionEvent cancel = MotionEvent.obtain(0, 0, MotionEvent.ACTION_CANCEL, 0, 0, 0);
            cancelling = true;
            try { touch.invoke(recognizer, cancel); }
            catch (ReflectiveOperationException | RuntimeException ignored) { }
            finally { cancelling = false; cancel.recycle(); }
        }
        tracking = intercepted = false;
    }

    static final class GestureScrollView extends ScrollView {
        private HaiagaruSettingsGestures gestures;
        GestureScrollView(Activity activity) { super(activity); }
        void setGestures(HaiagaruSettingsGestures value) { gestures = value; }

        @Override public boolean dispatchTouchEvent(MotionEvent event) {
            if (gestures != null) {
                boolean wasIntercepted = gestures.isIntercepted();
                boolean consumed = gestures.dispatch(event);
                if (consumed) {
                    if (!wasIntercepted && gestures.isIntercepted()) {
                        MotionEvent cancel = MotionEvent.obtain(event);
                        cancel.setAction(MotionEvent.ACTION_CANCEL);
                        super.dispatchTouchEvent(cancel);
                        cancel.recycle();
                    }
                    return true;
                }
            }
            return super.dispatchTouchEvent(event);
        }
    }
}
