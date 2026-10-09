package app.aidan.extension.fizz;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.SystemClock;
import android.util.Log;
import android.view.KeyEvent;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

public final class DeveloperMenuBridge {
    private static final String TAG = "DeveloperMenuBridge";

    private static WeakReference<Activity> sCurrentActivity = new WeakReference<>(null);
    private static boolean sMobileStudioEnabled = true;
    private DeveloperMenuBridge() {
    }

    /**
     * Initializes the bridge with the active activity and patch configuration options.
     */
    public static void init(Activity activity, boolean mobileStudio) {
        sCurrentActivity = new WeakReference<>(activity);
        sMobileStudioEnabled = mobileStudio;
        Log.i(TAG, "Initialized DeveloperMenuBridge (mobileStudio=" + mobileStudio + ")");
    }

    /**
     * Dynamically creates and returns a Kotlin Function0<Unit> (wl.a) proxy
     * that invokes openMenu() when tapped from Jetpack Compose.
     */
    public static Object getClickListener() {
        try {
            Class<?> function0Class = null;
            for (String clsName : new String[] {"yl.a", "wl.a"}) {
                try {
                    function0Class = Class.forName(clsName);
                    break;
                } catch (Throwable ignored) {
                }
            }
            if (function0Class == null) {
                return null;
            }
            return Proxy.newProxyInstance(
                function0Class.getClassLoader(),
                new Class<?>[] { function0Class },
                new InvocationHandler() {
                    @Override
                    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
                        String name = method.getName();
                        if ("invoke".equals(name)) {
                            openMenu();
                            try {
                                Class<?> unitClass = null;
                                for (String uName : new String[] {"kl.z", "il.z"}) {
                                    try {
                                        unitClass = Class.forName(uName);
                                        break;
                                    } catch (Throwable ignored) {
                                    }
                                }
                                if (unitClass != null) {
                                    Field aField = unitClass.getField("a");
                                    return aField.get(null);
                                }
                                return null;
                            } catch (Throwable ignored) {
                                return null;
                            }
                        } else if ("toString".equals(name)) {
                            return "DeveloperMenuClickListener";
                        } else if ("hashCode".equals(name)) {
                            return Integer.valueOf(System.identityHashCode(proxy));
                        } else if ("equals".equals(name)) {
                            return Boolean.valueOf(proxy == (args != null && args.length > 0 ? args[0] : null));
                        }
                        return null;
                    }
                }
            );
        } catch (Throwable t) {
            Log.e(TAG, "Failed to create Function0 click listener proxy", t);
            return null;
        }
    }

    /**
     * Opens the developer settings mod menu on the UI thread.
     */
    public static void openMenu() {
        final Activity activity = sCurrentActivity.get();
        if (activity == null || activity.isFinishing()) {
            Log.w(TAG, "Cannot open menu: activity is null or finishing");
            return;
        }

        activity.runOnUiThread(new Runnable() {
            @Override
            public void run() {
                if (activity.isFinishing()) {
                    return;
                }
                DeveloperMenuDialog.show(activity, sMobileStudioEnabled);
            }
        });
    }
    /**
     * Triggers Mobile Studio drawer without physical hardware volume button combos.
     */
    public static void openMobileStudio(Activity activity) {
        if (activity == null || activity.isFinishing()) {
            return;
        }

        // Strategy 1: Direct reflection on MainActivity.m0.f4616a.r(Unit)
        try {
            Field m0Field = activity.getClass().getDeclaredField("m0");
            m0Field.setAccessible(true);
            Object j1Instance = m0Field.get(activity);
            if (j1Instance != null) {
                Field sharedFlowField = null;
                for (String fName : new String[] {"a", "f4616a"}) {
                    try {
                        sharedFlowField = j1Instance.getClass().getDeclaredField(fName);
                        break;
                    } catch (Throwable ignored) {
                    }
                }
                if (sharedFlowField != null) {
                    sharedFlowField.setAccessible(true);
                    Object sharedFlow = sharedFlowField.get(j1Instance);
                    if (sharedFlow != null) {
                        Class<?> unitClass = null;
                        for (String uName : new String[] {"kl.z", "il.z"}) {
                            try {
                                unitClass = Class.forName(uName);
                                break;
                            } catch (Throwable ignored) {
                            }
                        }
                        Object unit = null;
                        if (unitClass != null) {
                            Field aField = unitClass.getField("a");
                            unit = aField.get(null);
                        }

                    Method emitMethod = null;
                    for (Method m : sharedFlow.getClass().getMethods()) {
                        if (("r".equals(m.getName()) || "tryEmit".equals(m.getName())) &&
                                m.getParameterTypes().length == 1) {
                            emitMethod = m;
                            break;
                        }
                    }
                    if (emitMethod == null) {
                        for (Method m : sharedFlow.getClass().getDeclaredMethods()) {
                            if (("r".equals(m.getName()) || "tryEmit".equals(m.getName())) &&
                                    m.getParameterTypes().length == 1) {
                                m.setAccessible(true);
                                emitMethod = m;
                                break;
                            }
                        }
                    }

                    if (emitMethod != null) {
                        emitMethod.invoke(sharedFlow, unit);
                        Log.i(TAG, "Mobile Studio opened via reflection on m0.f4616a");
                        return;
                    }
                }
            }
        }
    } catch (Throwable t) {
        }

        // Strategy 2: Alternating hardware key simulation (UP -> DOWN within 1200ms)
        try {
            long now = SystemClock.uptimeMillis();
            activity.dispatchKeyEvent(new KeyEvent(now, now, KeyEvent.ACTION_DOWN, KeyEvent.KEYCODE_VOLUME_UP, 0));
            activity.dispatchKeyEvent(new KeyEvent(now, now, KeyEvent.ACTION_UP, KeyEvent.KEYCODE_VOLUME_UP, 0));
            long next = now + 40;
            activity.dispatchKeyEvent(new KeyEvent(next, next, KeyEvent.ACTION_DOWN, KeyEvent.KEYCODE_VOLUME_DOWN, 0));
            activity.dispatchKeyEvent(new KeyEvent(next, next, KeyEvent.ACTION_UP, KeyEvent.KEYCODE_VOLUME_DOWN, 0));
            Log.i(TAG, "Mobile Studio opened via simulated volume key sequence");
        } catch (Throwable t) {
            Log.e(TAG, "Failed simulated volume key trigger for Mobile Studio", t);
        }
    }

    /**
     * Gracefully restarts the application to apply state and overlay changes.
     */
    public static void restartApp(Context context) {
        try {
            PackageManager pm = context.getPackageManager();
            Intent launchIntent = pm.getLaunchIntentForPackage(context.getPackageName());
            if (launchIntent != null) {
                Intent restartIntent = Intent.makeRestartActivityTask(launchIntent.getComponent());
                context.startActivity(restartIntent);
                Runtime.getRuntime().exit(0);
            }
        } catch (Throwable t) {
            Log.e(TAG, "Failed to restart application", t);
        }
    }
}
