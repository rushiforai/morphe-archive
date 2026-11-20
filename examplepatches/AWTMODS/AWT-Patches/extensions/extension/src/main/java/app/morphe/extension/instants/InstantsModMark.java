package app.morphe.extension.instants;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.util.Log;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

/**
 * Click action for the "Mod by Wagg13 - Morphed" row on the About screen.
 *
 * The row expects a Kotlin Function0. The extension is compiled without the Kotlin stdlib,
 * so the Function0 is created as a java.lang.reflect.Proxy at runtime.
 */
public final class InstantsModMark {
    private static final String TAG = "InstantsModMark";
    private static final String CHANNEL_URL = "https://t.me/+3ckC24ZwNZgyODgx";

    private static Object onClick;

    /** Returns a shared Function0 so the row's lambda is stable across recompositions. */
    public static synchronized Object onClick() {
        if (onClick == null) {
            try {
                Class<?> function0 = Class.forName("kotlin.jvm.functions.Function0");
                onClick = Proxy.newProxyInstance(
                        InstantsModMark.class.getClassLoader(),
                        new Class<?>[]{function0},
                        new ClickHandler());
            } catch (Throwable t) {
                Log.e(TAG, "Unable to create click action", t);
            }
        }
        return onClick;
    }

    private static final class ClickHandler implements InvocationHandler {
        @Override
        public Object invoke(Object proxy, Method method, Object[] args) {
            switch (method.getName()) {
                case "invoke":
                    openChannel();
                    return null;
                case "hashCode":
                    return System.identityHashCode(proxy);
                case "equals":
                    return proxy == args[0];
                default:
                    return "InstantsModMark.onClick";
            }
        }
    }

    private static void openChannel() {
        try {
            Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(CHANNEL_URL));
            Activity activity = InstantsGalleryHelper.getActivity();
            if (activity != null) {
                activity.startActivity(intent);
                return;
            }
            // Fallback when the gallery patch (which records the activity) is not applied.
            Application app = (Application) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication").invoke(null);
            Context context = app;
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            context.startActivity(intent);
        } catch (Throwable t) {
            Log.e(TAG, "Unable to open channel", t);
        }
    }
}
