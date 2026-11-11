package app.sledgesune.extension.waze;

import android.util.Log;

import java.lang.reflect.Method;

@SuppressWarnings("unused")
public final class DisableRerouteAutoAcceptPatch {

    private static final String TAG = "DisableRerouteAutoAccept";

    /** Alert provider id the native core uses for the "faster route found" prompt. */
    private static final String REROUTE_PROVIDER_ID = "RerouteSuggestion";

    /**
     * The native core starts its own fallback timer when the prompt is shown and applies the
     * default action (usually "accept") when it fires. Push it out to 24 hours.
     * Kept below 2^31 ms because the native side converts it to milliseconds.
     */
    private static final long FALLBACK_TIMER_SECONDS = 24 * 60 * 60;

    /**
     * Injection point. Replaces {@code AlerterInfo.getTimerType()} where native alert info is
     * converted to the app's alert model.
     * <p>
     * Waze's classes are not on the extension's compile classpath, so they are reached by reflection.
     * The protobuf classes and ConfigManager keep their real names in the release build.
     */
    public static Object getTimerType(Object alerterInfo) {
        final Object timerType;
        try {
            timerType = call(alerterInfo, "getTimerType");
        } catch (Throwable t) {
            throw new IllegalStateException("AlerterInfo.getTimerType() not found", t);
        }

        try {
            Object alertId = call(alerterInfo, "getAlertId");
            if (!REROUTE_PROVIDER_ID.equals(call(alertId, "getProviderId"))) {
                return timerType;
            }

            postponeNativeFallbackTimer();

            // The converter creates no timeout at all for UNRECOGNIZED,
            // so neither button counts down. (NONE would still give a timer bar.)
            return timerType.getClass().getField("UNRECOGNIZED").get(null);
        } catch (Throwable t) {
            Log.e(TAG, "Could not remove the reroute prompt timer", t);
            return timerType;
        }
    }

    private static void postponeNativeFallbackTimer() {
        try {
            Object config = Class.forName("com.waze.config.ConfigValues")
                    .getField("CONFIG_VALUE_REROUTE_SUGGESTION_FALLBACK_TIMER_SECONDS")
                    .get(null);
            Class<?> managerClass = Class.forName("com.waze.ConfigManager");
            Object manager = managerClass.getMethod("getInstance").invoke(null);
            managerClass.getMethod("setConfigValueLong", config.getClass(), long.class)
                    .invoke(manager, config, FALLBACK_TIMER_SECONDS);
        } catch (Throwable t) {
            Log.e(TAG, "Could not postpone the native fallback timer", t);
        }
    }

    private static Object call(Object target, String methodName) throws Exception {
        Method method = target.getClass().getMethod(methodName);
        return method.invoke(target);
    }
}
