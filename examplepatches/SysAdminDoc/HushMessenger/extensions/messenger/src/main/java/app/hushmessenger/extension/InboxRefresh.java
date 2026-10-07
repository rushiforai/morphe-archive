package app.hushmessenger.extension;

import android.os.Handler;
import android.os.Looper;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * After a cold start Messenger's first subscription to the chat list can stay silent, so the supplier's listed count
 * stays 0 and the list keeps its load-more footer under the chats. While Hide People You May Know is in effect, each
 * supplier gets at most two more subscribe calls, and only while its count is still 0.
 */
public final class InboxRefresh {
    static final String KEY = "people";
    /** From the supplier's first items read to the first check. */
    static final long FIRST_CHECK_MS = 2_500L;
    /** From the first subscribe call to the last check. */
    static final long LAST_CHECK_MS = 8_000L;
    /** Suppliers already scheduled. Messenger keeps a handful, so a list with identity checks is enough. */
    static final List<WeakReference<Object>> tracked = new ArrayList<>();

    private InboxRefresh() {}

    /** The patched items read calls this first, with its supplier. */
    public static void onInboxItems(Object supplier) {
        refresh(supplier, HostScreens.inboxRefreshRoute());
    }

    static void refresh(Object supplier, String route) {
        try {
            // The extension alone, or a patch that didn't prove the route, leaves the chat list stock.
            if (supplier == null || route == null || route.isEmpty() || !Settings.wouldUse(KEY) || !firstSight(supplier)) return;
            Route target = Route.of(route, supplier.getClass());
            WeakReference<Object> reference = new WeakReference<>(supplier);
            new Handler(Looper.getMainLooper()).postDelayed(() -> check(reference, target, true), FIRST_CHECK_MS);
        } catch (Throwable error) {
            Settings.hookFailedPrivately(KEY, "Can't schedule the chat list refresh", error);
        }
    }

    private static synchronized boolean firstSight(Object supplier) {
        for (Iterator<WeakReference<Object>> it = tracked.iterator(); it.hasNext(); ) {
            Object known = it.next().get();
            if (known == null) it.remove();
            else if (known == supplier) return false;
        }
        tracked.add(new WeakReference<>(supplier));
        return true;
    }

    /** Runs on the main thread. A count above 0 means rows arrived, so Messenger is left alone from then on. */
    static void check(WeakReference<Object> reference, Route route, boolean first) {
        try {
            Object supplier = reference.get();
            if (supplier == null || route.listed(supplier) != 0 || !Settings.enabled(KEY)) return;
            route.subscribe(supplier);
            if (first) new Handler(Looper.getMainLooper()).postDelayed(() -> check(reference, route, false), LAST_CHECK_MS);
        } catch (Throwable error) {
            Settings.hookFailedPrivately(KEY, "Can't refresh the chat list", error);
        }
    }

    /** The patch's proof, "Lowner;->subscribe(Lowner;)V|Lowner;->count:I", bound to the supplier's own class. */
    static final class Route {
        private final Method subscribe;
        private final Field listed;

        private Route(Method subscribe, Field listed) {
            this.subscribe = subscribe;
            this.listed = listed;
        }

        static Route of(String route, Class<?> owner) throws ReflectiveOperationException {
            String type = "L" + owner.getName().replace('.', '/') + ";";
            String[] parts = route.split("\\|", -1);
            String call = "(" + type + ")V";
            if (parts.length != 2 || !parts[0].startsWith(type + "->") || !parts[0].endsWith(call)
                    || !parts[1].startsWith(type + "->") || !parts[1].endsWith(":I")) {
                throw new IllegalStateException("The chat list route doesn't name this supplier");
            }
            String name = parts[0].substring(type.length() + 2, parts[0].length() - call.length());
            String count = parts[1].substring(type.length() + 2, parts[1].length() - 2);
            Method subscribe = owner.getDeclaredMethod(name, owner);
            Field listed = owner.getDeclaredField(count);
            if (!Modifier.isStatic(subscribe.getModifiers()) || subscribe.getReturnType() != void.class
                    || Modifier.isStatic(listed.getModifiers()) || listed.getType() != int.class) {
                throw new IllegalStateException("The chat list route has the wrong shape");
            }
            subscribe.setAccessible(true);
            listed.setAccessible(true);
            return new Route(subscribe, listed);
        }

        int listed(Object supplier) throws IllegalAccessException {
            return listed.getInt(supplier);
        }

        void subscribe(Object supplier) throws Throwable {
            try {
                subscribe.invoke(null, supplier);
            } catch (InvocationTargetException error) {
                throw error.getCause() != null ? error.getCause() : error;
            }
        }
    }
}
