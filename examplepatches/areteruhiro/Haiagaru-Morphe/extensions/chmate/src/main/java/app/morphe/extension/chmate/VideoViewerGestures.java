package app.morphe.extension.chmate;

import android.content.SharedPreferences;
import android.preference.PreferenceManager;
import android.view.MotionEvent;
import android.view.View;
import java.lang.reflect.*;

/** Uses ChMate's own recognizer and saved gesture codes; no alternative swipe encoding. */
public final class VideoViewerGestures {
    private final VideoViewerActivity activity;
    private Object recognizer;
    private Method touch, distance;
    private boolean tracking, intercepted;
    private boolean closed;
    private boolean cancelling;

    // Replaced by the optional patch after fingerprinting the target APK.
    public static String recognizerClassName() { return ""; }

    VideoViewerGestures(VideoViewerActivity activity) {
        this.activity = activity;
        try {
            Class<?> type = Class.forName(recognizerClassName(), false, activity.getClassLoader());
            Constructor<?> constructor = null;
            for (Constructor<?> c : type.getConstructors()) {
                Class<?>[] p = c.getParameterTypes();
                if (p.length == 2 && p[0] == android.content.Context.class && p[1].isInterface()) constructor = c;
            }
            if (constructor == null) throw new NoSuchMethodException("Gesture constructor");
            Class<?> listener = constructor.getParameterTypes()[1];
            Object callback = Proxy.newProxyInstance(type.getClassLoader(), new Class<?>[]{listener}, (proxy, method, args) -> {
                if (method.getDeclaringClass() == Object.class) {
                    if (method.getName().equals("hashCode")) return System.identityHashCode(proxy);
                    if (method.getName().equals("equals")) return proxy == args[0];
                    return "HaiagaruVideoGestureListener";
                }
                if (!closed && !cancelling && args != null && args.length == 3 && args[0] instanceof Integer)
                    complete((Integer) args[0]);
                return null;
            });
            recognizer = constructor.newInstance(activity, callback);
            for (Method m : type.getDeclaredMethods()) {
                if (!Modifier.isPublic(m.getModifiers())) continue;
                if (m.getReturnType() == boolean.class && java.util.Arrays.equals(m.getParameterTypes(), new Class<?>[]{MotionEvent.class})) touch = m;
                if (m.getReturnType() == void.class && java.util.Arrays.equals(m.getParameterTypes(), new Class<?>[]{int.class})) distance = m;
            }
            if (touch == null || distance == null) throw new NoSuchMethodException("Gesture methods");
        } catch (ReflectiveOperationException | RuntimeException e) {
            recognizer = null;
            android.util.Log.w("Haiagaru", "Video gesture initialization failed", e);
        }
    }

    /** Down is delivered normally; once recognized, cancel the video's pending click. */
    boolean dispatch(MotionEvent event, View surface) {
        if(!VideoViewerSettings.prefs(activity).getBoolean(VideoViewerSettings.CHMATE_GESTURES,true)){if(tracking)cancel();return false;}
        if (closed || recognizer == null || surface == null) return false;
        try {
            if (event.getActionMasked() == MotionEvent.ACTION_DOWN) {
                tracking = false; intercepted = false;
                SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(activity);
                if (!prefs.getBoolean("gesture", true)) return false;
                int[] location = new int[2]; surface.getLocationOnScreen(location);
                float x = event.getRawX(), y = event.getRawY();
                if (x < location[0] || x >= location[0] + surface.getWidth()
                        || y < location[1] || y >= location[1] + surface.getHeight()) return false;
                // MediaController lives in its own window. Buttons and seek bar never reach here.
                if (activity.isVideoToolbarTouch(x, y)) return false;
                distance.invoke(recognizer, prefs.getInt("gestureLength", 100));
                tracking = true;
            }
            if (!tracking) return false;
            boolean recognized = (Boolean) touch.invoke(recognizer, event);
            if (recognized && !intercepted) {
                intercepted = true;
                MotionEvent cancel = MotionEvent.obtain(event);
                cancel.setAction(MotionEvent.ACTION_CANCEL);
                activity.dispatchVideoTouch(cancel);
                cancel.recycle();
            }
            boolean consumed = intercepted;
            if (event.getActionMasked() == MotionEvent.ACTION_UP || event.getActionMasked() == MotionEvent.ACTION_CANCEL)
                tracking = false;
            return consumed;
        } catch (ReflectiveOperationException | RuntimeException e) {
            recognizer = null; tracking = false;
            android.util.Log.w("Haiagaru", "Video gesture dispatch failed", e);
            return false;
        }
    }

    private void complete(int code) {
        if (code == 0 || !activity.hasVideoGestureFocus()) return;
        SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(activity);
        if (!prefs.getBoolean("gesture", true)) return;
        String[] keys = {"gestureBack", "gestureForward", "gestureTop", "gestureBottom", "gestureRefresh",
                "gestureFullScreen", "gestureSetting", "gestureCloseTab", NgEditGesture.KEY};
        for (String key : keys) if (prefs.getInt(key, 0) == code) {
            activity.performVideoGesture(key); return;
        }
    }

    void cancel() {
        if (recognizer != null && touch != null) {
            MotionEvent cancel = MotionEvent.obtain(0, 0, MotionEvent.ACTION_CANCEL, 0, 0, 0);
            cancelling = true;
            try { touch.invoke(recognizer, cancel); } catch (ReflectiveOperationException | RuntimeException ignored) { }
            finally { cancelling = false; cancel.recycle(); }
        }
        tracking = intercepted = false;
    }
    void close() { closed = true; cancel(); }
}
