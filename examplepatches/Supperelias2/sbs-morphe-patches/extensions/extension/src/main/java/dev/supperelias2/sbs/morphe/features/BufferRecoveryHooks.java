package dev.supperelias2.sbs.morphe.features;

import android.app.Activity;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.view.ViewTreeObserver;

import java.lang.ref.WeakReference;
import java.lang.reflect.Method;

import dev.supperelias2.sbs.morphe.MorpheSettings;

/** Bounded, foreground-only recovery of an existing clear direct-VOD player. */
public final class BufferRecoveryHooks {
    private static final String KEY = "buffer_recovery";
    private static final String MAIN_ACTIVITY = "com.sbs.ondemand.MainActivity";
    private static final String DIRECT = "com.sbs.ondemand.model.playback.PlaybackStreamProvider$AkamaiHLSProvider";
    private static WeakReference<Object> owner = new WeakReference<>(null);
    private static Handler handler;
    private static SharedPreferences preferences;
    private static WeakReference<ViewTreeObserver> focusObserver = new WeakReference<>(null);
    private static Policy policy = new Policy();
    private static boolean scheduled;
    private static final Runnable UPDATE = BufferRecoveryHooks::update;
    private static final ViewTreeObserver.OnWindowFocusChangeListener FOCUS = focused -> {
        if (focused) schedule();
        else cancelPolling();
    };
    private static final SharedPreferences.OnSharedPreferenceChangeListener CHANGES = (prefs, key) -> {
        if (!KEY.equals(key)) return;
        if (MorpheSettings.enabled(KEY, false)) schedule();
        else cancelPolling();
    };

    private BufferRecoveryHooks() {}

    /** Android-free clock and retry budget, also exercised by semantic JVM tests. */
    public static final class Policy {
        private String mediaId = "";
        private WeakReference<Object> player = new WeakReference<>(null);
        private WeakReference<Object> item = new WeakReference<>(null);
        private long stalledAt = -1L;
        private int attempts;

        public static boolean eligible(boolean enabled, boolean foreground, boolean directVod,
                                       boolean ad, boolean clearMedia, boolean noError,
                                       boolean playWhenReady, int playbackState) {
            return enabled && foreground && directVod && !ad && clearMedia && noError
                    && playWhenReady && playbackState == 2;
        }

        public boolean shouldRecover(long now, String id, Object currentPlayer, Object currentItem, boolean eligible) {
            if (id == null || id.isEmpty() || currentPlayer == null || currentItem == null) {
                resetClock();
                return false;
            }
            if (!id.equals(mediaId)) {
                mediaId = id;
                attempts = 0;
                resetClock();
            }
            if (player.get() != currentPlayer || item.get() != currentItem) {
                player = new WeakReference<>(currentPlayer);
                item = new WeakReference<>(currentItem);
                resetClock();
            }
            if (!eligible || attempts >= 2) {
                resetClock();
                return false;
            }
            if (stalledAt < 0L || now < stalledAt) {
                stalledAt = now;
                return false;
            }
            if (now - stalledAt < 25_000L) return false;
            // Consume before attempting recovery: failures cannot cause retry loops.
            attempts++;
            stalledAt = now;
            return true;
        }

        public void resetClock() { stalledAt = -1L; }
        public int attempts() { return attempts; }
    }

    public static void onPlayerReady(Object manager) {
        if (owner.get() != manager) policy = new Policy();
        owner = new WeakReference<>(manager);
        observeFocus();
        SharedPreferences current = MorpheSettings.getPreferences();
        if (current != preferences) {
            if (preferences != null) preferences.unregisterOnSharedPreferenceChangeListener(CHANGES);
            preferences = current;
            if (preferences != null) preferences.registerOnSharedPreferenceChangeListener(CHANGES);
        }
        if (MorpheSettings.enabled(KEY, false)) schedule();
    }

    public static void onPlayerReleased(Object manager) {
        if (owner.get() != manager) return;
        cancelPolling();
        owner.clear();
        policy = new Policy();
        if (preferences != null) preferences.unregisterOnSharedPreferenceChangeListener(CHANGES);
        preferences = null;
        ViewTreeObserver observer = focusObserver.get();
        if (observer != null && observer.isAlive()) observer.removeOnWindowFocusChangeListener(FOCUS);
        focusObserver.clear();
    }

    private static void schedule() {
        if (owner.get() == null || !MorpheSettings.enabled(KEY, false) || !foreground()) return;
        if (handler == null) handler = new Handler(Looper.getMainLooper());
        if (scheduled) return;
        scheduled = true;
        handler.post(UPDATE);
    }

    private static void cancelPolling() {
        if (handler != null) handler.removeCallbacks(UPDATE);
        scheduled = false;
        policy.resetClock();
    }

    private static boolean foreground() {
        Activity activity = MorpheSettings.getActivity();
        return activity != null && MAIN_ACTIVITY.equals(activity.getClass().getName()) && activity.hasWindowFocus();
    }

    private static void observeFocus() {
        Activity activity = MorpheSettings.getActivity();
        if (activity == null || !MAIN_ACTIVITY.equals(activity.getClass().getName())) return;
        ViewTreeObserver current = activity.getWindow().getDecorView().getViewTreeObserver();
        ViewTreeObserver previous = focusObserver.get();
        if (previous == current) return;
        if (previous != null && previous.isAlive()) previous.removeOnWindowFocusChangeListener(FOCUS);
        current.addOnWindowFocusChangeListener(FOCUS);
        focusObserver = new WeakReference<>(current);
    }

    /** Fail closed if the actual Media3 configuration cannot be inspected. */
    private static boolean clearMedia(Object item) {
        if (item == null) return false;
        try {
            Object configuration = item.getClass().getField("localConfiguration").get(item);
            return configuration != null && configuration.getClass().getField("drmConfiguration").get(configuration) == null;
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            return false;
        }
    }

    private static String mediaId(Object manager) {
        Object controller = Reflect.field(Reflect.viewModel(manager), "playbackController");
        Object value = Reflect.value(Reflect.field(controller, "_currentContentId"));
        return value instanceof String ? (String) value : "";
    }

    private static boolean noPlayerError(Object player) {
        try {
            Method method = player.getClass().getMethod("getPlayerError");
            method.setAccessible(true);
            return method.invoke(player) == null;
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            return false;
        }
    }

    private static boolean noActiveDrm(Object player) {
        Object video = Reflect.call(player, "getVideoFormat");
        Object audio = Reflect.call(player, "getAudioFormat");
        return Reflect.field(video, "drmInitData") == null && Reflect.field(audio, "drmInitData") == null;
    }

    private static boolean eligible(Object manager, Object player, Object item) {
        Object viewModel = Reflect.viewModel(manager);
        Object controller = Reflect.field(viewModel, "playbackController");
        Object provider = Reflect.field(controller, "currentProvider");
        boolean directVod = provider != null && DIRECT.equals(provider.getClass().getName())
                && Boolean.FALSE.equals(Reflect.value(Reflect.field(controller, "_isMediaLive")));
        boolean noAd = Boolean.FALSE.equals(Reflect.value(Reflect.field(Reflect.field(viewModel, "adsController"), "_isAdPlaying")));
        long position = Reflect.number(Reflect.call(player, "getCurrentPosition"), -1L);
        long duration = Reflect.number(Reflect.call(player, "getDuration"), -1L);
        boolean safePosition = position >= 0L && duration > 0L && position < duration;
        boolean manualSeek = Boolean.TRUE.equals(Reflect.field(viewModel, "isSeekInProgress"))
                || Boolean.TRUE.equals(Reflect.value(Reflect.field(controller, "_isContentSeeking")));
        boolean playerThread = Reflect.call(player, "getApplicationLooper") == Looper.getMainLooper();
        return Policy.eligible(MorpheSettings.enabled(KEY, false), foreground(), directVod, !noAd,
                clearMedia(item) && noActiveDrm(player) && safePosition && !manualSeek && playerThread
                        && Boolean.TRUE.equals(Reflect.call(player, "isCurrentMediaItemSeekable")),
                noPlayerError(player), Boolean.TRUE.equals(Reflect.call(player, "getPlayWhenReady")),
                (int) Reflect.number(Reflect.call(player, "getPlaybackState"), 1L));
    }

    private static void update() {
        scheduled = false;
        if (!MorpheSettings.enabled(KEY, false) || !foreground()) { policy.resetClock(); return; }
        Object manager = owner.get();
        Object player = Reflect.player(manager);
        if (manager == null || player == null) { policy.resetClock(); return; }
        Object item = Reflect.call(player, "getCurrentMediaItem");
        String id = mediaId(manager);
        if (policy.shouldRecover(SystemClock.elapsedRealtime(), id, player, item, eligible(manager, player, item))) {
            // Recheck identities and guards immediately before the bounded action.
            if (Reflect.player(manager) == player && Reflect.call(player, "getCurrentMediaItem") == item
                    && id.equals(mediaId(manager)) && eligible(manager, player, item)) restart(player);
        }
        if (owner.get() == manager && MorpheSettings.enabled(KEY, false) && foreground()) {
            scheduled = true;
            handler.postDelayed(UPDATE, 1000L);
        }
    }

    /** Same item and position. No URI, request, provider change or fabricated event. */
    public static boolean restart(Object player) {
        if (player == null) return false;
        try {
            Class<?> type = player.getClass();
            Method stop = type.getMethod("stop");
            Method prepare = type.getMethod("prepare");
            Method seek = type.getMethod("seekTo", long.class);
            Method play = type.getMethod("play");
            Method positionMethod = type.getMethod("getCurrentPosition");
            Method parametersMethod = type.getMethod("getPlaybackParameters");
            for (Method method : new Method[]{stop, prepare, seek, play, positionMethod, parametersMethod}) method.setAccessible(true);
            Object parameters = parametersMethod.invoke(player);
            if (parameters == null) return false;
            Method restoreParameters = type.getMethod("setPlaybackParameters", parameters.getClass());
            restoreParameters.setAccessible(true);
            long position = ((Number) positionMethod.invoke(player)).longValue();
            if (position < 0L) return false;
            // SBS's IDLE listener only resets media-start/UI state; it does not
            // release or navigate. Media3 stop() retains the current item.
            stop.invoke(player);
            prepare.invoke(player);
            seek.invoke(player, position);
            restoreParameters.invoke(player, parameters);
            play.invoke(player);
            return true;
        } catch (ReflectiveOperationException | RuntimeException ignored) {
            return false;
        }
    }
}
