package dev.supperelias2.sbs.morphe.features;

import android.os.Handler;
import android.os.Looper;

import java.lang.ref.WeakReference;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.CancellationException;

import dev.supperelias2.sbs.morphe.MorpheSettings;

/** Small runtime gates. Disabled experiments retain the original instructions. */
@SuppressWarnings("unused")
public final class GeneralHooks {
    private static final Map<Object, Runnable> HIDE_JOBS = new WeakHashMap<>();
    private static Handler handler;

    private GeneralHooks() {}

    public static boolean removeVodAds() { return MorpheSettings.enabled("remove_vod_ads", true); }
    public static boolean removeLiveAds() { return MorpheSettings.enabled("remove_live_ads", true); }

    public static long controlsTimeout(long original) {
        if (!MorpheSettings.enabled("controls_timeout_enabled", false)) return original;
        return Math.max(1, Math.min(30, MorpheSettings.getInt("controls_timeout_seconds", 3))) * 1000L;
    }

    /** Schedule only this optional paused-screen behavior; leave SBS's normal job intact. */
    public static void onControlsTimerReset(Object controller) {
        if (controller == null) return;
        if (handler == null) handler = new Handler(Looper.getMainLooper());
        synchronized (HIDE_JOBS) {
            Runnable previous = HIDE_JOBS.remove(controller);
            if (previous != null) handler.removeCallbacks(previous);
            if (!MorpheSettings.enabled("clean_pause_overlay", false)) return;
            WeakReference<Object> reference = new WeakReference<>(controller);
            Runnable job = () -> {
                Object target = reference.get();
                if (target == null || !MorpheSettings.enabled("clean_pause_overlay", false)) return;
                synchronized (HIDE_JOBS) { HIDE_JOBS.remove(target); }
                if (!Reflect.bool(Reflect.field(target, "_controlVisibility")) || Reflect.bool(Reflect.field(target, "_isPlaying"))) return;
                Object vm = Reflect.viewModel(target);
                // Kotlin's getter is flavor-mangled; the verified backing field is stable.
                Object pauseAds = Reflect.field(vm, "pauseAdController");
                Object adState = Reflect.value(Reflect.call(pauseAds, "getShowPauseAd"));
                if (!Boolean.FALSE.equals(adState)) return;
                // This is the original synchronized visibility path, not forceHideControls().
                Reflect.call(target, "changeControlsVisibility", false);
            };
            HIDE_JOBS.put(controller, job);
            handler.postDelayed(job, controlsTimeout(3000L));
        }
    }

    public static boolean blockInactivity(Object viewModel) {
        if (!MorpheSettings.enabled("disable_still_watching", false)) return false;
        Reflect.call(Reflect.field(viewModel, "_showStillWatchingPrompt"), "setValue", false);
        Object timer = Reflect.field(viewModel, "userInactivityTimer");
        Object prompt = Reflect.field(viewModel, "promptTimeoutTimer");
        Reflect.call(timer, "cancel", (CancellationException) null);
        Reflect.call(prompt, "cancel", (CancellationException) null);
        return true;
    }

    public static boolean reduceTelemetry() { return MorpheSettings.enabled("minimal_telemetry", false); }

    /** SBS starts at nine; each positive count waits one second before decrementing. */
    public static int nextEpisodeCountdown() {
        if (!MorpheSettings.enabled("next_episode_countdown_enabled", false)) return 9;
        return Math.max(1, Math.min(60, MorpheSettings.getInt("next_episode_delay_seconds", 9)));
    }
}
