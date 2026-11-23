package app.jofslash.extension.booking;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.util.Log;
import android.view.View;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

/**
 * Puts plain Android Views into the app's Compose screens, from a call the patches add right
 * after one of the app's composables. Everything is found by reflection, like the rest of the
 * extension.
 */
final class ComposeViews {
    private ComposeViews() {
    }

    private static final String TAG = "JoFSlash";

    interface Factory {
        View create(Context context);
    }

    private static Method androidView;
    private static Method consume;
    private static Object localView;
    private static boolean androidViewFailed, localViewFailed;

    /**
     * The View that hosts the composition [composer] is drawing (Compose's LocalView): the
     * AndroidComposeView inside the ComposeView. Reading it adds nothing to the composition.
     */
    static View localView(Object composer) {
        if (composer == null || !findLocalView()) return null;
        try {
            Object view = consume.invoke(composer, localView);
            return view instanceof View ? (View) view : null;
        } catch (Throwable t) {
            Log.w(TAG, "Couldn't read LocalView", t);
            return null;
        }
    }

    private static synchronized boolean findLocalView() {
        if (consume != null) return true;
        if (localViewFailed) return false;
        try {
            Class<?> locals = Class.forName("androidx.compose.ui.platform.AndroidCompositionLocals_androidKt");
            localView = locals.getMethod("getLocalView").invoke(null);
            Class<?> composer = Class.forName("androidx.compose.runtime.Composer");
            for (Method m : composer.getMethods()) {
                if (m.getName().equals("consume") && m.getParameterTypes().length == 1
                        && m.getParameterTypes()[0].isInstance(localView)) {
                    consume = m;
                    return true;
                }
            }
            Log.w(TAG, "Couldn't find Composer.consume");
        } catch (Throwable t) {
            Log.w(TAG, "Couldn't find LocalView", t);
        }
        localViewFailed = true;
        return false;
    }

    /**
     * Draws Compose's AndroidView(factory, modifier = Modifier, update = no-op) with this composer,
     * at the place of the call. The view is made once by [factory]; the caller keeps it up to date.
     * Call it every time the composable runs, so the composition keeps the same shape.
     */
    static void androidView(Object composer, Object factory) {
        if (composer == null || factory == null || !findAndroidView()) return;
        try {
            // Default bits: 2 = modifier, 4 = update.
            androidView.invoke(null, factory, null, null, composer, 0, 6);
        } catch (InvocationTargetException e) {
            // Thrown while composing: let the app handle it as it would its own error.
            Throwable cause = e.getCause();
            if (cause instanceof RuntimeException) throw (RuntimeException) cause;
            if (cause instanceof Error) throw (Error) cause;
            throw new RuntimeException(cause);
        } catch (IllegalAccessException e) {
            androidViewFailed = true;
            Log.w(TAG, "Couldn't draw the view", e);
        }
    }

    /** A kotlin Function1<Context, View> for [androidView]. Make it once and keep it. */
    static Object factory(final Factory factory) {
        try {
            Class<?> function1 = Class.forName("kotlin.jvm.functions.Function1");
            return Proxy.newProxyInstance(ComposeViews.class.getClassLoader(), new Class<?>[]{function1},
                    (proxy, method, args) -> {
                        switch (method.getName()) {
                            case "invoke":
                                return factory.create((Context) args[0]);
                            case "equals":
                                return proxy == args[0];
                            case "hashCode":
                                return System.identityHashCode(proxy);
                            default:
                                return "JoFSlashViewFactory";
                        }
                    });
        } catch (Throwable t) {
            Log.w(TAG, "Couldn't make the view factory", t);
            return null;
        }
    }

    private static synchronized boolean findAndroidView() {
        if (androidView != null) return true;
        if (androidViewFailed) return false;
        try {
            Class<?> kt = Class.forName("androidx.compose.ui.viewinterop.AndroidView_androidKt");
            Class<?> function1 = Class.forName("kotlin.jvm.functions.Function1");
            Class<?> composer = Class.forName("androidx.compose.runtime.Composer");
            for (Method m : kt.getDeclaredMethods()) {
                Class<?>[] p = m.getParameterTypes();
                if (m.getName().equals("AndroidView") && p.length == 6 && p[0] == function1 && p[2] == function1
                        && p[3] == composer && p[4] == int.class && p[5] == int.class) {
                    m.setAccessible(true);
                    androidView = m;
                    return true;
                }
            }
            Log.w(TAG, "Couldn't find AndroidView");
        } catch (Throwable t) {
            Log.w(TAG, "Couldn't find AndroidView", t);
        }
        androidViewFailed = true;
        return false;
    }

    /** The activity of a view's context, through any ContextWrappers. */
    static Activity activity(Context context) {
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity) return (Activity) context;
            context = ((ContextWrapper) context).getBaseContext();
        }
        return null;
    }
}
