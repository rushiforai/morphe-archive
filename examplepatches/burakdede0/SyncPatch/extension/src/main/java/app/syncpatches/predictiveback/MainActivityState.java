package app.syncpatches.predictiveback;

import android.app.Activity;

import java.lang.reflect.Field;
import java.lang.reflect.Member;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

/**
 * Reads the same MainActivity state that its onKeyUp handler reads when deciding
 * whether a back press is consumed in-app (panel, tap bar state, home feed reset,
 * drawer close) instead of exiting the app. Only reflection is used, so the
 * extension classes stay independent of the app internals at compile time.
 *
 * Method and field names are the obfuscated names of the pinned target build,
 * Sync for Reddit v23.06.30-13:39 (versionCode 23033).
 *
 * All of the consulted methods and fields are pure state reads (verified in the
 * smali), so probing is side effect free.
 *
 * "Posts home" mode is part of the probe, not a carve-out: with postsHome on,
 * the app's own back handler resets the home feed when it differs from the
 * default feed, and otherwise falls through to exit. The feed is always
 * readable (t7.j.b(Context)), and every feed change routes through
 * VerticalPostsFragment.I3(String), which is hooked, so the probe converges
 * on feed switches too.
 *
 * On any reflection failure the answer is "not at root", which keeps the app's
 * own back callback in place instead of silently handing gestures to the system.
 */
final class MainActivityState {
    private static final Map<String, Member> CACHE = new HashMap<>();

    private MainActivityState() {
    }

    /**
     * True when MainActivity is at its root screen with nothing for the app's
     * back handler to consume, so back gestures can be handed to the system
     * (its predictive back-to-home transition) instead of to the app.
     */
    static boolean isRootState(Activity activity) {
        try {
            Class<?> main = activity.getClass();

            if (invokeBoolean(main, "a", activity)) {
                return false; // Panel or drawer is open enough to consume back
            }
            if (invokeBoolean(main, "b1", activity)) {
                return false; // Tap bar state screen consumes back
            }

            Object settings = invokeStatic("com.laurencedawson.reddit_sync.singleton.SettingsSingleton", "x", new Class[0])
                    .invoke(null);
            boolean postsHome = boolField(settings, "postsHome");
            if (postsHome) {
                String defaultSub = (String) field(settings.getClass(), "defaultSub").get(settings);
                String feed = (String) invokeStatic("t7.j", "b", new Class[]{android.content.Context.class})
                        .invoke(null, activity);
                if (!nullSafeEquals(defaultSub, feed)) {
                    return false; // A home feed switch consumes back to reset it
                }
            }

            boolean drawerBack = boolField(settings, "drawerBack");
            boolean useDrawer = boolField(settings, "useDrawer");
            if (drawerBack && useDrawer) {
                Object drawer = field(main, "drawer").get(activity);
                Object panel = field(main, "panel").get(activity);
                if (drawer != null || panel != null) {
                    return false; // Back closes the drawer
                }
            }

            return true;
        } catch (Throwable t) {
            // Swallowed on purpose: a probe failure keeps the app's back
            // callback in place instead of handing gestures to the system.
            return false;
        }
    }

    private static boolean invokeBoolean(Class<?> owner, String name, Object receiver) throws Exception {
        return (Boolean) method(owner, name, new Class[0]).invoke(receiver);
    }

    private static Method method(Class<?> owner, String name, Class<?>... parameterTypes) throws Exception {
        String key = owner.getName() + "#" + name + "#" + parameterTypes.length;
        Method cached = (Method) CACHE.get(key);
        if (cached != null) {
            return cached;
        }
        Method method = owner.getMethod(name, parameterTypes);
        method.setAccessible(true);
        CACHE.put(key, method);
        return method;
    }

    private static Method invokeStatic(String className, String name, Class<?>[] parameterTypes) throws Exception {
        return method(Class.forName(className), name, parameterTypes);
    }

    private static Field field(Class<?> owner, String name) throws Exception {
        String key = owner.getName() + "#" + name;
        Field cached = (Field) CACHE.get(key);
        if (cached != null) {
            return cached;
        }
        Field field = owner.getField(name);
        field.setAccessible(true);
        CACHE.put(key, field);
        return field;
    }

    private static boolean boolField(Object receiver, String name) throws Exception {
        return (Boolean) field(receiver.getClass(), name).get(receiver);
    }

    /** Matches the commons-lang3 equalsIgnoreCase semantics the app uses. */
    private static boolean nullSafeEquals(String a, String b) {
        return a == null ? b == null : a.equalsIgnoreCase(b);
    }
}
