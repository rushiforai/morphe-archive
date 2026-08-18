package app.template.extension.ads;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

/**
 * Reports an ad as "failed to load" to the Flutter side of the google_mobile_ads
 * plugin, without ever requesting an ad.
 *
 * <p>Why this exists: simply skipping the ad load leaves the Dart widget waiting
 * forever, so the app keeps the ad slot's reserved height on screen and the user
 * sees an empty grey box. A real Google Ad Manager "no fill" instead delivers
 * onAdFailedToLoad, which the app already handles (no-fill happens constantly in
 * production) by collapsing the slot. This reproduces that signal.
 *
 * <p>Everything is done reflectively so this class compiles standalone, without
 * stubs for the plugin's package-private types, and so it degrades to a harmless
 * no-op if the plugin's internals ever change. It must never throw: any failure
 * here would surface as a crash in the host app.
 */
public final class AdFailure {

    /** com.google.android.gms.ads.AdRequest.ERROR_CODE_NO_FILL */
    private static final int ERROR_CODE_NO_FILL = 3;

    private static final String PKG = "io.flutter.plugins.googlemobileads.";

    private AdFailure() {
    }

    /**
     * @param flutterAd an io.flutter.plugins.googlemobileads.FlutterAd instance
     *                  (banner or native), passed as Object to avoid needing the
     *                  package-private type at compile time.
     */
    public static void reportNoFill(Object flutterAd) {
        try {
            if (flutterAd == null) {
                return;
            }

            Object manager = readField(flutterAd, "manager");
            Object adId = readField(flutterAd, "adId");
            if (manager == null || !(adId instanceof Integer)) {
                return;
            }

            Class<?> responseInfoClass = Class.forName(PKG + "FlutterAd$FlutterResponseInfo");
            Class<?> errorClass = Class.forName(PKG + "FlutterAd$FlutterLoadAdError");

            Constructor<?> errorCtor = errorClass.getDeclaredConstructor(
                    int.class, String.class, String.class, responseInfoClass);
            errorCtor.setAccessible(true);
            Object error = errorCtor.newInstance(
                    ERROR_CODE_NO_FILL, "com.google.android.gms.ads", "No fill.", null);

            Method onAdFailedToLoad = findMethod(
                    manager.getClass(), "onAdFailedToLoad", int.class, errorClass);
            if (onAdFailedToLoad == null) {
                return;
            }
            onAdFailedToLoad.setAccessible(true);
            onAdFailedToLoad.invoke(manager, adId, error);
        } catch (Throwable ignored) {
            // Suppressing an ad must never break the app.
        }
    }

    /** Reads a field by name, walking up the class hierarchy (adId lives on FlutterAd). */
    private static Object readField(Object target, String name) {
        for (Class<?> c = target.getClass(); c != null; c = c.getSuperclass()) {
            try {
                Field field = c.getDeclaredField(name);
                field.setAccessible(true);
                return field.get(target);
            } catch (NoSuchFieldException e) {
                // Try the superclass.
            } catch (Throwable t) {
                return null;
            }
        }
        return null;
    }

    private static Method findMethod(Class<?> owner, String name, Class<?>... params) {
        for (Class<?> c = owner; c != null; c = c.getSuperclass()) {
            try {
                return c.getDeclaredMethod(name, params);
            } catch (NoSuchMethodException e) {
                // Try the superclass.
            } catch (Throwable t) {
                return null;
            }
        }
        return null;
    }
}
