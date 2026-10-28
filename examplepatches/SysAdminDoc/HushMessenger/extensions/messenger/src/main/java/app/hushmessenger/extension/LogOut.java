package app.hushmessenger.extension;

import android.content.Context;
import android.util.Log;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

/**
 * #88: settings' Log out runs Messenger's own, the one its account switcher starts, so Messenger signs the account out
 * the way it always does. Nothing here touches the account, its data or the install.
 */
final class LogOut {
    private LogOut() { }

    private static final String CALL = "(Landroid/content/Context;)V";

    /** The patch's proof, "Lowner;->name(Landroid/content/Context;)V", as a callable static method, or null. */
    static Method route(String route, ClassLoader loader) {
        if (route == null || !route.startsWith("L") || !route.endsWith(CALL)) return null;
        int arrow = route.indexOf(";->");
        if (arrow < 2 || arrow + 3 >= route.length() - CALL.length()) return null;
        try {
            Class<?> owner = Class.forName(route.substring(1, arrow).replace('/', '.'), false, loader);
            Method method = owner.getDeclaredMethod(route.substring(arrow + 3, route.length() - CALL.length()), Context.class);
            if (!Modifier.isStatic(method.getModifiers()) || method.getReturnType() != void.class) return null;
            method.setAccessible(true);
            return method;
        } catch (ReflectiveOperationException | LinkageError | SecurityException error) {
            Log.w("HushMessenger", "Messenger's log out route doesn't resolve", error);
            return null;
        }
    }

    /** Whether this install has Messenger's Log out to start. */
    static boolean available() {
        return route(HostScreens.logoutRoute(), LogOut.class.getClassLoader()) != null;
    }

    /** Starts Messenger's Log out from [context]. False when [route] names none or it didn't start. */
    static boolean start(Context context, String route) {
        Method method = route(route, LogOut.class.getClassLoader());
        if (method == null) return false;
        try {
            method.invoke(null, context);
            return true;
        } catch (InvocationTargetException | IllegalAccessException | RuntimeException error) {
            Log.e("HushMessenger", "Can't start Messenger's log out", error);
            return false;
        }
    }
}
