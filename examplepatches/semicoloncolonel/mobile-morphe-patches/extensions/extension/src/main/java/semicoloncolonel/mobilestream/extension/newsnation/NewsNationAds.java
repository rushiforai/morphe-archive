package semicoloncolonel.mobilestream.extension.newsnation;

import android.util.Log;

import java.lang.reflect.Method;

/**
 * NewsNation (phone app, React Native) — "Skip ads". Every ad the app's
 * JavaScript shows goes through a native ad view, and each view tells the
 * JavaScript when its ad could not be filled. The patched load methods call
 * {@link #noFill(Object)} instead of requesting an ad, which sends that same
 * "no ad" event, so the app treats the slot exactly like an unfilled one.
 *
 * The ad views' classes and their sendEvent methods are not visible here at
 * compile time, so they are reached by reflection.
 */
@SuppressWarnings("unused")
public final class NewsNationAds {
    private static final String TAG = "MSP-NewsNationAds";
    private static final String NO_FILL =
            "The ad request was successful, but no ad was returned due to lack of ad inventory.";

    private NewsNationAds() {
    }

    /** Sends the view's own "ad failed to load" event to the JavaScript. */
    public static void noFill(Object view) {
        if (view == null) return;
        try {
            Object payload;
            String event;
            if (view.getClass().getName().equals("com.nexstar.newsnation.BannerView")) {
                // The app's own GAM/Prebid banner: { errorMessage }.
                event = "AD_Custom_FAILED";
                payload = createMap();
                putString(payload, "errorMessage", NO_FILL);
            } else {
                // react-native-ad-manager views: { error: { message } }.
                event = "onAdFailedToLoad";
                Object error = createMap();
                putString(error, "message", NO_FILL);
                payload = createMap();
                Method putMap = payload.getClass().getMethod("putMap", String.class, readableMapClass());
                putMap.invoke(payload, "error", error);
            }
            Method sendEvent = findSendEvent(view.getClass());
            sendEvent.setAccessible(true);
            sendEvent.invoke(view, event, payload);
        } catch (Throwable t) {
            Log.w(TAG, "noFill failed for " + view.getClass().getName(), t);
        }
    }

    /** Rejects an interstitial request's promise as an unfilled ad. */
    public static void rejectNoFill(Object promise) {
        if (promise == null) return;
        try {
            Method reject = promise.getClass().getMethod("reject", String.class, String.class);
            reject.invoke(promise, "E_AD_REQUEST_FAILED", NO_FILL);
        } catch (Throwable t) {
            Log.w(TAG, "rejectNoFill failed", t);
        }
    }

    private static Object createMap() throws Exception {
        return Class.forName("com.facebook.react.bridge.Arguments").getMethod("createMap").invoke(null);
    }

    private static Class<?> readableMapClass() throws ClassNotFoundException {
        return Class.forName("com.facebook.react.bridge.ReadableMap");
    }

    private static void putString(Object map, String key, String value) throws Exception {
        map.getClass().getMethod("putString", String.class, String.class).invoke(map, key, value);
    }

    private static Method findSendEvent(Class<?> type) throws NoSuchMethodException {
        Class<?> writableMap;
        try {
            writableMap = Class.forName("com.facebook.react.bridge.WritableMap");
        } catch (ClassNotFoundException e) {
            throw new NoSuchMethodException("WritableMap not found");
        }
        for (Class<?> c = type; c != null; c = c.getSuperclass()) {
            try {
                return c.getDeclaredMethod("sendEvent", String.class, writableMap);
            } catch (NoSuchMethodException ignored) {
                // Try the superclass.
            }
        }
        throw new NoSuchMethodException(type.getName() + ".sendEvent");
    }
}
