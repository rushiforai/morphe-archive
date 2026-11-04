package semicoloncolonel.mobilestream.extension.yttv.ads;

import android.util.Log;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Collections;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Turns off server-stitched ad insertion (DAI) for each YouTube TV playback.
 *
 * YouTube TV's native player core owns ad breaks. It exposes its own off
 * switch, CuePointDataProviderWrapper.nativeSetDaiDisabledByNoConfig(ptr),
 * which the app calls only when server experiment 45731777 is on. It does so
 * by scheduling a small lambda on the provider's executor. This class
 * schedules that same lambda for every cue-point provider the player
 * receives, so the core is always told that DAI is off.
 */
@SuppressWarnings("unused")
public final class YttvDaiDisabler {
    private static final String TAG = "MSP-YTTV-DAI";
    private static final String WRAPPER =
        "com.google.android.libraries.youtube.media.interfaces.CuePointDataProviderWrapper";

    private static final Map<Object, Boolean> done =
        Collections.synchronizedMap(new WeakHashMap<>());

    private YttvDaiDisabler() {
    }

    /** Called from PlaybackControllerWrapper wherever it stores the cue-point provider. */
    public static void onCuePointProvider(Object provider) {
        if (provider == null || done.put(provider, Boolean.TRUE) != null) return;
        try {
            Class<?> wrapper = provider.getClass();
            while (wrapper != null && !WRAPPER.equals(wrapper.getName())) wrapper = wrapper.getSuperclass();
            if (wrapper == null) return;

            Field executorField = wrapper.getDeclaredField("a");
            executorField.setAccessible(true);
            Object executor = executorField.get(provider);
            if (executor == null) return;

            Runnable disable = appLambda(wrapper, provider);
            Method schedule = executor.getClass().getMethod("schedule", Runnable.class);
            schedule.setAccessible(true);
            schedule.invoke(executor, disable);
            Log.i(TAG, "scheduled DAI off");
        } catch (Throwable t) {
            Log.w(TAG, "could not turn DAI off", t);
        }
    }

    // The app's own lambda checks that the provider is not released before it
    // calls the native switch, on the provider's executor thread.
    private static Runnable appLambda(Class<?> wrapper, Object provider) throws Exception {
        Class<?> lambda = Class.forName(WRAPPER + "$$ExternalSyntheticLambda0", false, wrapper.getClassLoader());
        Constructor<?> constructor = lambda.getDeclaredConstructor(wrapper);
        constructor.setAccessible(true);
        return (Runnable) constructor.newInstance(provider);
    }
}
