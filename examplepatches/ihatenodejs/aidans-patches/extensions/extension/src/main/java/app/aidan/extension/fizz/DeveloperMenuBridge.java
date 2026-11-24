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
            for (String clsName : new String[] {"hn.a", "yl.a", "wl.a"}) {
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
                                for (String uName : new String[] {"tm.z", "kl.z", "il.z"}) {
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
    /** Locates a single-argument boolean emit method on a Kotlin flow implementation. */
    private static Method findEmitter(Method[] methods, String name) {
        for (Method m : methods) {
            if (name.equals(m.getName()) && m.getParameterTypes().length == 1) {
                return m;
            }
        }
        return null;
    }

    /** Triggers Mobile Studio drawer without physical hardware volume button combos. */
    public static void openMobileStudio(Activity activity) {
        if (activity == null || activity.isFinishing()) {
            return;
        }

        // Strategy 1: Direct reflection on the activity's Mobile Studio request holder
        // (1.72.0: o0.a, 1.54.0: m0.a) and its Unit emit.
        try {
            Object holder = null;
            for (String hName : new String[] {"o0", "m0"}) {
                try {
                    Field holderField = activity.getClass().getDeclaredField(hName);
                    holderField.setAccessible(true);
                    holder = holderField.get(activity);
                    if (holder != null) {
                        break;
                    }
                } catch (Throwable ignored) {
                }
            }
            Object sharedFlow = null;
            if (holder != null) {
                for (String fName : new String[] {"a", "f4616a"}) {
                    try {
                        Field sharedFlowField = holder.getClass().getDeclaredField(fName);
                        sharedFlowField.setAccessible(true);
                        sharedFlow = sharedFlowField.get(holder);
                        if (sharedFlow != null) {
                            break;
                        }
                    } catch (Throwable ignored) {
                    }
                }
            }
            Object unit = null;
            for (String uName : new String[] {"tm.z", "kl.z", "il.z"}) {
                try {
                    Field aField = Class.forName(uName).getField("a");
                    unit = aField.get(null);
                    if (unit != null) {
                        break;
                    }
                } catch (Throwable ignored) {
                }
            }

            if (sharedFlow != null && unit != null) {
                // The app emits through q(Object) (tryEmit + resume waiting collectors); r(Object)
                // is the bare tryEmit and leaves the drawer closed when nobody is resuming.
                for (String emitName : new String[] {"q", "r", "tryEmit"}) {
                    Method emitMethod = findEmitter(sharedFlow.getClass().getMethods(), emitName);
                    if (emitMethod == null) {
                        emitMethod = findEmitter(sharedFlow.getClass().getDeclaredMethods(), emitName);
                    }
                    if (emitMethod == null) {
                        continue;
                    }
                    emitMethod.setAccessible(true);
                    Object emitted = emitMethod.invoke(sharedFlow, unit);
                    if (!(emitted instanceof Boolean) || (Boolean) emitted) {
                        Log.i(TAG, "Mobile Studio request emitted via " + emitName + "(Unit)");
                        return;
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
