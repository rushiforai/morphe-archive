package app.pixkk.extension.core;

import android.app.Activity;
import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.view.MotionEvent;
import android.view.Window;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Proxy;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * The bundle's settings. Besides the row in TikTok's settings, they open with a press and hold of
 * two fingers anywhere in the app, which no screen of TikTok's uses, so nothing of the original app
 * or of another bundle is touched. The gesture is off until it is turned on on the settings page.
 */
public final class SettingsScreen {
    private static final long HOLD_MS = 700;
    private static final Map<Window, Boolean> WRAPPED = new WeakHashMap<>();

    private SettingsScreen() {
    }

    /** Called from the patched {@code MainActivity.onCreate}. */
    public static void install(Activity activity) {
        if (activity == null) return;
        try {
            Window window = activity.getWindow();
            if (window == null || WRAPPED.containsKey(window)) return;
            Window.Callback inner = window.getCallback();
            if (inner == null) return;
            Hold hold = new Hold(activity);
            InvocationHandler handler = (proxy, method, args) -> {
                try {
                    if (args != null && args.length == 1 && args[0] instanceof MotionEvent
                            && "dispatchTouchEvent".equals(method.getName())) {
                        hold.watch((MotionEvent) args[0]);
                    }
                    return method.invoke(inner, args);
                } catch (InvocationTargetException ex) {
                    throw ex.getCause() != null ? ex.getCause() : ex;
                }
            };
            window.setCallback((Window.Callback) Proxy.newProxyInstance(
                    Window.Callback.class.getClassLoader(), new Class<?>[]{Window.Callback.class}, handler));
            WRAPPED.put(window, Boolean.TRUE);
        } catch (Throwable ex) {
            Logger.printException(() -> "Could not set up the settings gesture", ex);
        }
    }

    private static final class Hold {
        private final Activity activity;
        private final Handler handler = new Handler(Looper.getMainLooper());
        private final Runnable open;

        Hold(Activity activity) {
            this.activity = activity;
            this.open = () -> show(activity);
        }

        void watch(MotionEvent event) {
            int action = event.getActionMasked();
            if ((action == MotionEvent.ACTION_POINTER_DOWN || action == MotionEvent.ACTION_DOWN)
                    && event.getPointerCount() == 2) {
                if (!Settings.SETTINGS_GESTURE.get()) return;
                handler.removeCallbacks(open);
                handler.postDelayed(open, HOLD_MS);
            } else if (action == MotionEvent.ACTION_POINTER_UP || action == MotionEvent.ACTION_UP
                    || action == MotionEvent.ACTION_CANCEL || event.getPointerCount() != 2) {
                handler.removeCallbacks(open);
            }
        }
    }

    /** Opens the settings page; the row in Settings and the gesture both come here. */
    public static void show(Context context) {
        SettingsPage.open(context);
    }
}
