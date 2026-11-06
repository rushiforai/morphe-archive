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
 *
 * When "Mask live ad breaks" is also applied, live streams keep DAI on: the
 * slot YouTube TV fills on a live channel is then announced through cue
 * points, which the mask uses to cover it. Without DAI, the network's own
 * feed plays in that slot and there is no signal to cover it with.
 */
@SuppressWarnings("unused")
public final class YttvDaiDisabler {
    private static final String TAG = "MSP-YTTV-DAI";
    private static final String WRAPPER =
        "com.google.android.libraries.youtube.media.interfaces.CuePointDataProviderWrapper";

    private static final Map<Object, Boolean> done =
        Collections.synchronizedMap(new WeakHashMap<>());

    private static volatile Object controller;

    private YttvDaiDisabler() {
    }

    /** Overwritten by Skip ads: true turns DAI off. */
    public static boolean disableDai() {
        return false;
    }

        /** Overwritten by "Mask live ad breaks": true keeps DAI on for live streams. */
    public static boolean keepLiveDai() {
        return false;
    }

    /** Overwritten by Skip ads: the controller's playback field. */
    public static String playbackField() {
        return null;
    }

    /** Overwritten by Skip ads: the playback's VideoStreamingData field. */
    public static String streamField() {
        return null;
    }

    /** Overwritten by Skip ads: VideoStreamingData's stream-type label method. */
    public static String streamLabelMethod() {
        return null;
    }

    /** Called just before onCuePointProvider, with the PlaybackControllerWrapper. */
    public static void setController(Object playbackController) {
        controller = playbackController;
    }

    /** Called from PlaybackControllerWrapper wherever it stores the cue-point provider. */
    public static void onCuePointProvider(Object provider) {
        // Taken and cleared at once, so a closed controller is not kept alive.
        Object playbackController = controller;
        controller = null;
        if (provider == null || done.put(provider, Boolean.TRUE) != null) return;
        // A new playback: the previous one's live ad slots no longer apply.
        YttvLiveMask.reset();
        if (!disableDai()) return;
        if (keepLiveDai()) {
            String label = streamLabel(playbackController);
            if (isLive(label)) {
                Log.i(TAG, "live stream (" + label + "): DAI left on for the mask");
                return;
            }
        }
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

    /** The stream type, such as "vod", "otf", "windowed-live" or "manifestless", or null. */
    private static String streamLabel(Object playbackController) {
        try {
            if (playbackController == null) return null;
            Object playback = field(playbackController, playbackField());
            Object stream = playback == null ? null : field(playback, streamField());
            if (stream == null) return null;
            Method label = stream.getClass().getMethod(streamLabelMethod());
            return (String) label.invoke(stream);
        } catch (Throwable t) {
            Log.w(TAG, "could not read the stream type", t);
            return null;
        }
    }

    // A live channel plays as "manifestless", including when rewound. DVR
    // recordings play as "windowed-live" and keep DAI off like on-demand
    // titles, so their ads stay skipped and fast-forward stays free.
    private static boolean isLive(String label) {
        return "manifestless".equals(label);
    }

    private static Object field(Object owner, String name) throws Exception {
        if (name == null) return null;
        for (Class<?> c = owner.getClass(); c != null; c = c.getSuperclass()) {
            try {
                Field f = c.getDeclaredField(name);
                f.setAccessible(true);
                return f.get(owner);
            } catch (NoSuchFieldException ignored) {
            }
        }
        return null;
    }
}
