package app.twoeno.extension.googleads;

import java.lang.reflect.Method;

import app.twoeno.extension.shared.Logger;
import app.twoeno.extension.shared.Reflection;

/**
 * Blocks ads of React Native apps using
 * <a href="https://github.com/invertase/react-native-google-mobile-ads">react-native-google-mobile-ads</a>.
 * <p>
 * Instead of only skipping the ad request, each request is answered with a "no fill" error.
 * The JavaScript side of the app then behaves as if no ad was available
 * and does not wait for it or retry endlessly.
 */
@SuppressWarnings("unused")
public final class ReactNativeAdsPatch {
    private static final String WRITABLE_MAP = "com.facebook.react.bridge.WritableMap";
    private static final String NO_FILL_CODE = "no-fill";
    private static final String NO_FILL_MESSAGE = "Ad blocked";

    private ReactNativeAdsPatch() {
    }

    private static Object noFill(ClassLoader classLoader) throws ReflectiveOperationException {
        Class<?> arguments = Class.forName("com.facebook.react.bridge.Arguments", false, classLoader);
        Object map = Reflection.findMethod(arguments, "createMap").invoke(null);
        Method putString = Reflection.findMethod(map.getClass(), "putString", "java.lang.String", "java.lang.String");
        putString.invoke(map, "code", NO_FILL_CODE);
        putString.invoke(map, "message", NO_FILL_MESSAGE);
        return map;
    }

    /**
     * Replaces {@code ReactNativeGoogleMobileAdsBannerAdViewManager.requestAd(ReactNativeAdView)}.
     */
    public static void blockBannerAd(Object viewManager, Object adView) {
        try {
            Method sendEvent = Reflection.findMethod(viewManager.getClass(), "sendEvent",
                    "io.invertase.googlemobileads.common.ReactNativeAdView", "java.lang.String", WRITABLE_MAP);
            sendEvent.invoke(viewManager, adView, "onAdFailedToLoad", noFill(viewManager.getClass().getClassLoader()));
        } catch (Throwable ex) {
            Logger.error("blockBannerAd failure", ex);
        }
    }

    /**
     * Replaces {@code ReactNativeGoogleMobileAdsFullScreenAdModule.load(int, String, ReadableMap)}.
     * Used for interstitial, rewarded and app open ads.
     */
    public static void blockFullScreenAd(Object module, int requestId, String adUnitId) {
        try {
            Method sendAdEvent = Reflection.findMethod(module.getClass(), "sendAdEvent",
                    "java.lang.String", "int", "java.lang.String", WRITABLE_MAP, WRITABLE_MAP);
            sendAdEvent.invoke(module, "error", requestId, adUnitId, noFill(module.getClass().getClassLoader()), null);
        } catch (Throwable ex) {
            Logger.error("blockFullScreenAd failure", ex);
        }
    }

    /**
     * Replaces {@code ReactNativeGoogleMobileAdsNativeModule.load(String, ReadableMap, Promise)}.
     */
    public static void blockNativeAd(Object promise) {
        try {
            Method reject = Reflection.findMethod(promise.getClass(), "reject",
                    "java.lang.String", "java.lang.String", WRITABLE_MAP);
            reject.invoke(promise, NO_FILL_CODE, NO_FILL_MESSAGE, noFill(promise.getClass().getClassLoader()));
        } catch (Throwable ex) {
            Logger.error("blockNativeAd failure", ex);
        }
    }
}
