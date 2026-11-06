package app.template.extension;

import android.util.Log;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.HashSet;
import java.util.Set;

/**
 * Fakes a completed rewarded ad for AppLovin MAX.
 *
 * MAX is the mediation SDK this app shows every rewarded ad through, no matter which network
 * fills it, and the app waits on the MaxRewardedAdListener it registered on the ad. That
 * listener is looked up on the ad object, so the callbacks can be delivered in the order a
 * real, fully watched ad would produce them: displayed, rewarded, hidden.
 */
public final class RewardAdSkipper {
    private static final String TAG = "MeowdokuSkipAds";

    /**
     * Listener interfaces an ad can carry. MAX types the setter loosely (interstitials and
     * app-open ads take a plain MaxAdListener), so the shared callbacks live on the parent
     * interface and every concrete one has to be accepted.
     */
    private static final String[] LISTENERS = {
            "com.applovin.mediation.MaxRewardedAdListener",
            "com.applovin.mediation.MaxInterstitialAdListener",
            "com.applovin.mediation.MaxAppOpenAdListener",
            "com.applovin.mediation.MaxAdListener"
    };

    /** Callbacks of a real MAX rewarded ad, in the order they arrive. */
    private static final String[] CALLBACKS = {"onAdDisplayed", "onUserRewarded", "onAdHidden"};

    private RewardAdSkipper() {}

    /**
     * Hooked at the head of {@code MaxRewardedAd.showAd(Activity)}.
     *
     * @param ad the {@code MaxRewardedAd} the app just tried to show.
     */
    public static void maxAd(Object ad) {
        try {
            Object listener = findListener(ad);
            if (listener == null) {
                Log.d(TAG, "no MAX listener on the ad, app keeps its own flow");
                return;
            }
            // MAX callbacks take the internal mediated ad and MaxFullscreenAdImpl$b
            // downcasts the argument to it, so the public MaxRewardedAd is the wrong object.
            Object mediated = mediatedAd(ad);
            Object argument = mediated != null ? mediated : ad;
            for (String callback : CALLBACKS) {
                deliver(listener, argument, callback);
            }
        } catch (Throwable t) {
            Log.w(TAG, "maxAd", t);
        }
    }

    /**
     * The mediated ad MAX itself passes to its listeners: an AppLovin-internal field value
     * that is a MaxAd. Returns null when it cannot be found, the public ad is the fallback.
     */
    private static Object mediatedAd(Object ad) {
        return mediatedAd(ad, new HashSet<Class<?>>(), 0);
    }

    private static Object mediatedAd(Object target, Set<Class<?>> visited, int depth) {
        if (target == null || depth > 3 || !visited.add(target.getClass())) return null;
        for (Class<?> c = target.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
            for (Field field : c.getDeclaredFields()) {
                Object value = read(field, target);
                if (value == null) continue;
                if (!value.getClass().getName().startsWith("com.applovin.impl.")) continue;
                if (isMaxAd(value.getClass())) return value;
            }
            // The mediated ad sits on AppLovin's impl object, one level below the public ad.
            for (Field field : c.getDeclaredFields()) {
                Object value = read(field, target);
                if (value == null || !value.getClass().getName().startsWith("com.applovin.impl.")) continue;
                Object found = mediatedAd(value, visited, depth + 1);
                if (found != null) return found;
            }
        }
        return null;
    }

    /** MaxAd check by name, so the extension needs no AppLovin dependency to compile. */
    private static boolean isMaxAd(Class<?> type) {
        if (type == null) return false;
        if ("com.applovin.mediation.MaxAd".equals(type.getName())) return true;
        for (Class<?> iface : type.getInterfaces()) {
            if (isMaxAd(iface)) return true;
        }
        return isMaxAd(type.getSuperclass());
    }

    /**
     * Hooked at the head of {@code MaxMediationAdapter.showRewardedAd} path: the app asked to
     * show a rewarded ad. Fakes the whole lifecycle on the adapter so it works even when no
     * ad is loaded at all (network blocked), which the listener-driven path cannot do.
     *
     * @param adapter   the {@code MaxAdapter}
     * @param placement the ad unit id
     * @param ctx       the tracking context
     * @param ad        the {@code MaxRewardedAd}, may be null when nothing is loaded
     */
    public static void rewardedClick(Object adapter, String placement, Object ctx, Object ad) {
        if (adapter == null) return;
        try {
            Object bundle = callbackBundle(adapter, placement, ad);
            // Same order the MAX listener produces for a real, fully watched ad.
            call(adapter, "notifyCallAdShow", placement, ctx, Boolean.TRUE, bundle);
            call(adapter, "notifyRewardedVideoCompleted", placement, ctx, bundle);
            call(adapter, "notifyAdClose", placement, ctx, bundle);
        } catch (Throwable t) {
            Log.w(TAG, "rewardedClick", t);
        }
    }

    /** The callback bundle the SDK builds for real callbacks, or an empty one. */
    private static Object callbackBundle(Object adapter, String placement, Object ad) {
        try {
            Class<?> utils = Class.forName("com.meevii.adsdk.mediation.applovinmax.Utils");
            Method builder = utils.getDeclaredMethod(
                    "getMediationCallbackBundle", android.content.Context.class,
                    Class.forName("com.applovin.mediation.MaxAd"), String.class);
            Object context = invokeNoArg(adapter, "getApplicationCtx");
            Object bundle = builder.invoke(null, context, ad, placement);
            if (bundle != null) return bundle;
        } catch (Throwable ignored) {
        }
        return new android.os.Bundle();
    }

    private static Object invokeNoArg(Object target, String name) {
        try {
            Method method = target.getClass().getMethod(name);
            method.setAccessible(true);
            return method.invoke(target);
        } catch (Throwable t) {
            return null;
        }
    }

    /** Calls the first method of that name with a matching parameter count. */
    private static void call(Object target, String name, Object placement, Object ctx, Object... extra) {
        // The notify methods are not public, so getMethods() alone misses them: walk the
        // hierarchy with getDeclaredMethod and force accessibility.
        for (Class<?> c = target.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
            for (Method method : c.getDeclaredMethods()) {
                if (!method.getName().equals(name)) continue;
                Class<?>[] types = method.getParameterTypes();
                Object[] args = new Object[types.length];
                boolean ok = true;
                for (int i = 0; i < types.length; i++) {
                    Class<?> type = types[i];
                    if (type == String.class) {
                        args[i] = placement;
                    } else if (type == boolean.class) {
                        args[i] = Boolean.TRUE;
                    } else if (type.getName().equals("android.os.Bundle")) {
                        args[i] = extra[extra.length - 1];
                    } else if (ctx != null && type.isInstance(ctx)) {
                        args[i] = ctx;
                    } else if (ctx == null && !type.isPrimitive()) {
                        // Nothing was cached, so the SDK handed over a null tracking context:
                        // pass null rather than rejecting the whole method.
                        args[i] = null;
                    } else {
                        ok = false;
                        break;
                    }
                }
                if (!ok) continue;
                try {
                    method.setAccessible(true);
                    method.invoke(target, args);
                } catch (Throwable t) {
                    Log.w(TAG, "call " + name + " failed", t);
                }
                return;
            }
        }
        Log.d(TAG, "no method " + name + " on " + target.getClass().getSimpleName());
    }

    /** Banner: nothing is loaded, so hide the ad view and its container. */
    public static void hideBanner(Object adView, Object container) {
        hide(adView);
        hide(container);
    }

    /** Native: the SDK renders into the container the game handed over. */
    public static void hideNative(Object container) {
        hide(container);
    }

    /** Sets a view GONE by reflection, so the extension needs no android.view dependency. */
    public static void hide(Object view) {
        if (view == null) return;
        try {
            Method setVisibility = view.getClass().getMethod("setVisibility", int.class);
            setVisibility.invoke(view, android.view.View.GONE);
        } catch (Throwable t) {
            // Not a View or already detached: leaving it visible is harmless.
        }
    }

    /** The listener sits a few fields deep, so walk the object graph a bounded distance. */
    private static Object findListener(Object target) {
        return findListener(target, new HashSet<Class<?>>(), 0);
    }

    private static Object findListener(Object target, Set<Class<?>> visited, int depth) {
        if (target == null || depth > 3 || !visited.add(target.getClass())) return null;

        // MAX stores the listener the app registered in a field called adListener, that is
        // the one to call; the impl's own wrapper sits in other fields and only forwards.
        for (Class<?> c = target.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
            for (Field field : c.getDeclaredFields()) {
                if (!"adListener".equals(field.getName())) continue;
                Object value = read(field, target);
                if (value != null && isListener(value.getClass())) return value;
            }
        }

        for (Class<?> c = target.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
            for (Field field : c.getDeclaredFields()) {
                Object value = read(field, target);
                if (value != null && isListener(value.getClass())) return value;
            }
        }

        // Not a direct field: follow AppLovin's own members (the impl object, wrappers, ...).
        for (Class<?> c = target.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
            for (Field field : c.getDeclaredFields()) {
                Object value = read(field, target);
                if (value == null || !isAppLovin(value.getClass())) continue;
                Object found = findListener(value, visited, depth + 1);
                if (found != null) return found;
            }
        }
        return null;
    }

    private static Object read(Field field, Object target) {
        try {
            field.setAccessible(true);
            return field.get(target);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static boolean isListener(Class<?> type) {
        if (type == null) return false;
        for (String listener : LISTENERS) {
            if (listener.equals(type.getName())) return true;
        }
        for (Class<?> iface : type.getInterfaces()) {
            if (isListener(iface)) return true;
        }
        return isListener(type.getSuperclass());
    }

    private static boolean isAppLovin(Class<?> type) {
        for (Class<?> c = type; c != null && c != Object.class; c = c.getSuperclass()) {
            if (c.getName().startsWith("com.applovin.")) return true;
        }
        return false;
    }

    /** Invokes every method of that name the listener declares, once per signature. */
    private static void deliver(Object listener, Object ad, String name) {
        Set<String> seen = new HashSet<>();
        for (Method method : listenerMethods(listener)) {
            if (!name.equals(method.getName())) continue;
            if (!seen.add(method.toGenericString())) continue;
            invoke(listener, method, buildArgs(method, ad));
        }
    }

    private static void invoke(Object listener, Method method, Object[] args) {
        try {
            method.setAccessible(true);
            method.invoke(listener, args);
            Log.d(TAG, "invoked " + method.getName());
        } catch (Throwable t) {
            Log.w(TAG, "invoke " + method.getName() + " failed", t);
        }
    }

    private static Object[] buildArgs(Method method, Object ad) {
        Class<?>[] types = method.getParameterTypes();
        Object[] args = new Object[types.length];
        for (int i = 0; i < types.length; i++) {
            Class<?> type = types[i];
            if (ad != null && type.isInstance(ad)) {
                args[i] = ad;
            } else if (type == String.class) {
                args[i] = "";
            } else if (type.isEnum()) {
                args[i] = preferredConstant(type);
            } else if (type.isInterface()) {
                // MaxReward and friends: a proxy answering with plausible defaults.
                args[i] = stub(type);
            } else {
                args[i] = instance(type);
            }
        }
        return args;
    }

    private static Method[] listenerMethods(Object listener) {
        Set<Method> methods = new HashSet<>();
        for (Class<?> c = listener.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
            try {
                methods.addAll(java.util.Arrays.asList(c.getMethods()));
            } catch (Throwable ignored) {
            }
        }
        return methods.toArray(new Method[0]);
    }

    private static Object preferredConstant(Class<?> enumType) {
        Object[] constants = enumType.getEnumConstants();
        if (constants == null || constants.length == 0) return null;
        for (String wanted : new String[]{"COMPLETED", "REWARDED", "REWARD"}) {
            for (Object constant : constants) {
                if (constant.toString().contains(wanted)) return constant;
            }
        }
        return constants[0];
    }

    private static Object stub(Class<?> iface) {
        try {
            return Proxy.newProxyInstance(iface.getClassLoader(), new Class<?>[]{iface},
                    (proxy, method, args) -> defaultValue(method.getReturnType()));
        } catch (Throwable t) {
            return null;
        }
    }

    private static Object instance(Class<?> type) {
        try {
            Constructor<?>[] constructors = type.getDeclaredConstructors();
            java.util.Arrays.sort(constructors, (a, b) ->
                    Integer.compare(a.getParameterCount(), b.getParameterCount()));
            for (Constructor<?> constructor : constructors) {
                try {
                    constructor.setAccessible(true);
                    Class<?>[] types = constructor.getParameterTypes();
                    Object[] args = new Object[types.length];
                    for (int i = 0; i < types.length; i++) args[i] = defaultValue(types[i]);
                    return constructor.newInstance(args);
                } catch (Throwable ignored) {
                }
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    private static Object defaultValue(Class<?> type) {
        if (type == boolean.class) return true;
        if (type == byte.class) return (byte) 1;
        if (type == short.class) return (short) 1;
        if (type == int.class) return 1;
        if (type == long.class) return 1L;
        if (type == float.class) return 1F;
        if (type == double.class) return 1D;
        if (type == char.class) return ' ';
        if (type == String.class) return "";
        return null;
    }
}
