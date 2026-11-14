/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/1065
 * https://github.com/MorpheApp/morphe-patches/pull/3635
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 * Modified by lavinhoque33, 2026-11-13.
 */

package app.morphe.extension.music.patches;

import static app.morphe.extension.shared.utils.StringRef.str;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.media.AudioDeviceInfo;
import android.media.AudioManager;
import android.media.MediaRouter;
import android.media.audiofx.AudioEffect;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.os.VibrationEffect;
import android.os.Vibrator;
import android.os.VibratorManager;
import android.view.KeyEvent;
import android.view.Surface;
import android.view.View;
import android.view.ViewGroup;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CopyOnWriteArraySet;

import app.morphe.extension.music.settings.Settings;
import app.morphe.extension.music.patches.crossfade.PcmFadeBridge;
import app.morphe.extension.music.patches.crossfade.CrossfadeEngine;
import app.morphe.extension.music.patches.crossfade.ModeSwitchRequest;
import app.morphe.extension.music.patches.crossfade.CrossfadeEngine.NextAvailability;
import app.morphe.extension.music.patches.crossfade.QueueAdvanceBridge;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;

/**
 * Crossfades by keeping the outgoing ExoPlayer alive and loading the next track into a second
 * player built by YouTube Music's own factory, so it gets the same DRM and data source setup.
 */
@SuppressWarnings("unused")
public class CrossfadeManager {

    public enum CrossFadeDuration {
        MILLISECONDS_250(250),
        MILLISECONDS_500(500),
        MILLISECONDS_750(750),
        MILLISECONDS_1000(1_000),
        MILLISECONDS_2000(2_000),
        MILLISECONDS_3000(3_000),
        MILLISECONDS_4000(4_000),
        MILLISECONDS_5000(5_000),
        MILLISECONDS_6000(6_000),
        MILLISECONDS_7000(7_000),
        MILLISECONDS_8000(8_000),
        MILLISECONDS_9000(9_000),
        MILLISECONDS_10000(10_000),
        MILLISECONDS_11000(11_000),
        MILLISECONDS_12000(12_000);

        public final int milliseconds;

        CrossFadeDuration(int milliseconds) {
            this.milliseconds = milliseconds;
        }
    }

    public interface PlayerCoordinatorAccess {
        Object patch_getExoPlayer();
        void patch_setPlayerWithBindings(Object player);
        Object patch_getSession();
        Object patch_getLoadControl();
        Object patch_getSharedState();
        Object patch_getSharedCallback();
        Object patch_getVideoSurface();
        /**
         * Lives in the player's audio offload listener set, not in its ListenerSet.
         */
        Object patch_getCoordinatorListener();
        /** The app volume, including track normalization, before applying a fade. */
        float patch_getVolume();
    }

    public interface ExoPlayerAccess {
        int patch_getPlaybackState();
        boolean patch_getPlayWhenReady();
        long patch_getCurrentPosition();
        long patch_getDuration();
        void patch_setVolume(float volume);
        float patch_getRawVolume();
        int patch_getAudioSessionId();
        boolean patch_hasPlaybackError();
        void patch_setPlayWhenReady(boolean play);
        void patch_setVideoSurface(Surface surface);
        void patch_release();
        void patch_setDltCallback(Object dlt);
        void patch_addDirectListener(Object listener);
        void patch_removeDirectListener(Object listener);
        /**
         * Called on the outgoing player before release, so its isPlayingChanged(false)
         * does not reach the MediaSession.
         */
        void patch_detachCwhFromEventDispatch();
        void patch_attachCwhToEventDispatch();
    }

    public interface SessionAccess {
        Object patch_getFactory();
    }

    public interface PlayerFactoryAccess {
        Object patch_createPlayer(Object coordinator, Object loadControl, int flags);
    }

    public interface SharedStateAccess {
        Object patch_getTimeline();
        void patch_setTimeline(Object timeline);
    }

    public interface SharedCallbackAccess {
        Object patch_getCqb();
        void patch_setCqb(Object cqb);
        Object patch_getDlt();
        void patch_setDlt(Object dlt);
    }

    public interface VideoSurfaceAccess {
        void patch_setPlayerReference(Object player);
    }

    public interface MedialibPlayerAccess {
        Object patch_getPlayerChain();
        void patch_playNextInQueue();
        void patch_loadVideoWith(Object descriptor);
        String patch_getDescriptorVideoId(Object descriptor);
    }

    public interface DelegateAccess {
        Object patch_getDelegate();
    }

    private static void logDebug(Logger.LogMessage msg) {
        Logger.printDebug(msg);
    }

    private static void logInfo(Logger.LogMessage msg) {
        Logger.printInfo(msg);
    }

    /**
     * Recoverable problems are logged as info, since printException shows an error toast.
     */
    private static void logWarn(Logger.LogMessage msg) {
        Logger.printInfo(msg);
    }

    private static void logWarn(Logger.LogMessage msg, Exception e) {
        Logger.printInfo(msg, e);
    }

    private static void logError(Logger.LogMessage msg) {
        Logger.printException(msg);
    }

    private static void logError(Logger.LogMessage msg, Exception e) {
        Logger.printException(msg, e);
    }

    public enum FadeCurve {
        EQUAL_POWER,
        EASE_OUT_CUBIC,
        EASE_OUT_QUAD,
        SMOOTHSTEP;

        public float out(float t) {
            return switch (this) {
                case EASE_OUT_CUBIC -> 1.0f - t * t * t;
                case EASE_OUT_QUAD -> (1.0f - t) * (1.0f - t);
                case SMOOTHSTEP -> 1.0f - (3.0f * t * t - 2.0f * t * t * t);
                default -> (float) Math.cos(t * Math.PI / 2.0);
            };
        }

        public float in(float t) {
            if (this == SMOOTHSTEP) return 3.0f * t * t - 2.0f * t * t * t;
            return (float) Math.sin(t * Math.PI / 2.0);
        }
    }

    private static final boolean CROSSFADE_ENABLED = Settings.CROSSFADE_ENABLED.get();
    private static final Handler mainHandler = new Handler(Looper.getMainLooper());
    private static final Runnable NO_OP_RUNNABLE = () -> {};
    public static volatile boolean suppressCwhU;
    private static boolean isCrossfadePaused;
    private static boolean activityRunning;
    private static boolean sleepTimerEndOfTrack;
    private static boolean internalPlayNext;
    private static boolean monitorRequested;
    private static NextAvailability monitorAvailability = NextAvailability.UNKNOWN;
    private static boolean loadIssued;
    private static boolean pumping;
    private static long nativeLoadGeneration;
    private static long nativeQueueGeneration;
    private static final long MODE_SWITCH_LOAD_TIMEOUT_MS = 3_000;
    private static long automaticTrackGeneration = -1;
    private static long emptyQueueTrackGeneration = -1;
    private static Object lastLoadDescriptor;
    private static WeakReference<Object> lastAtadRef = new WeakReference<>(null);
    private static final Runnable PUMP = CrossfadeManager::pump;
    private static PlayerCoordinatorAccess activeCoordinator;
    private static SharedCallbackAccess activeSharedCallback;
    private static int playersCreated;
    private static int playersReleased;
    private static final List<Intent> heldAudioEffectSessionCloses = new ArrayList<>();
    private static final java.util.Set<Integer> closedAudioSessions = new java.util.HashSet<>();
    private static final java.util.Set<Object> detachedPlayers =
            java.util.Collections.newSetFromMap(new java.util.IdentityHashMap<>());

    private static final CrossfadeEngine engine = new CrossfadeEngine(new CrossfadeEngine.Output() {
        public void anchor(Object player, float gain) {
            if (PcmFadeBridge.hasProcessor(player)) PcmFadeBridge.setGain(player, gain, 0);
        }

        public void envelope(Object player, float target, long durationMs, int curve) {
            PcmFadeBridge.setEnvelope(player, target, durationMs, curve);
            if (CrossfadeTrace.isEnabled()) {
                CrossfadeTrace.event("FADE", player, () -> "target=" + target
                        + " durationFramesAtRate=" + durationMs + " curve=" + curve);
            }
        }

        public void play(Object player, boolean playing) {
            if (PcmFadeBridge.hasProcessor(player)) PcmFadeBridge.pause(player, !playing);
            ((ExoPlayerAccess) player).patch_setPlayWhenReady(playing);
        }

        public void select(Object previous, Object current) {
            if (activeCoordinator != null) {
                if (detachedPlayers.remove(current)) {
                    ((ExoPlayerAccess) current).patch_attachCwhToEventDispatch();
                }
                swapCoordinatorPlayer(activeCoordinator, (ExoPlayerAccess) previous, (ExoPlayerAccess) current);
            }
        }

        public void release(Object player) { releasePlayer((ExoPlayerAccess) player); }
        public void role(Object player, CrossfadeEngine.Role role) { CrossfadeTrace.role(player, role.name()); }
    }, Looper.getMainLooper().getThread());

    static final class PlaybackState {
        static boolean hasOutgoingTrack(int state) { return state != 1 && state != 4; }
    }

    public static Runnable filterAnalyticsRelease(Runnable runnable) {
        return suppressCwhU ? NO_OP_RUNNABLE : runnable;
    }

    private static Object currentIdentity() {
        return engine.current() == null ? null : engine.current().identity;
    }

    /** Native bindings for the main-owner request reducer; pending loads do not own later queue commands. */
    public static final class ModeSwitch extends ModeSwitchRequest {
        ModeSwitch(PlayerCoordinatorAccess coordinator, String sourceId, String targetId) {
            super(coordinator, coordinator.patch_getExoPlayer(), nativeLoadGeneration, engine.generation(),
                    nativeQueueGeneration, sourceId, targetId);
        }
    }

    private static ModeSwitch modeSwitch;
    private static ModeSwitch stockToggle;

    public static ModeSwitch beginModeSwitch(String sourceId, String targetId) {
        if (!CROSSFADE_ENABLED) return null;
        PlayerCoordinatorAccess coordinator = getCoordinatorFromAtad(lastAtadRef.get(), false);
        if (coordinator == null || coordinator.patch_getExoPlayer() == null) return null;
        activeCoordinator = coordinator;
        observe(coordinator);
        engine.modeSwitch();
        if (modeSwitch != null) finishModeSwitch(modeSwitch, "replaced");
        ModeSwitch intent = new ModeSwitch(coordinator, sourceId, targetId);
        modeSwitch = intent;
        traceModeSwitch(intent, "arm", "native-dispatch");
        mainHandler.postDelayed(() -> {
            if (modeSwitch == intent) finishModeSwitch(intent, "load-timeout");
        }, MODE_SWITCH_LOAD_TIMEOUT_MS);
        return intent;
    }

    public static void modeSwitchDispatched(ModeSwitch intent) {
        if (intent != null) intent.dispatched();
    }

    public static boolean playNextForModeSwitch(ModeSwitch intent) {
        if (intent == null || intent != modeSwitch || intent.ended
                || !(lastAtadRef.get() instanceof MedialibPlayerAccess access)) return false;
        access.patch_playNextInQueue();
        return true;
    }

    /** Native navigation and direct-next entries, before their asynchronous stop/load work is submitted. */
    public static void onQueueCommand() {
        if (!CROSSFADE_ENABLED) return;
        if (Looper.myLooper() != Looper.getMainLooper()) {
            mainHandler.post(CrossfadeManager::onQueueCommand);
            return;
        }
        nativeQueueGeneration++;
        ModeSwitch intent = modeSwitch;
        if (intent != null && !intent.queueCommand(nativeQueueGeneration)) {
            finishModeSwitch(intent, "different-queue-request");
        }
    }

    public static boolean hasModeSwitchLoaded(ModeSwitch intent) {
        return intent == null || intent.loadStarted;
    }

    public static void endModeSwitch(ModeSwitch intent, String reason) {
        if (intent == null) return;
        if (Looper.myLooper() != Looper.getMainLooper()) {
            mainHandler.post(() -> endModeSwitch(intent, reason));
            return;
        }
        if (intent.ended && modeSwitch != intent) return;
        intent.dispatched();
        if (intent.loadStarted || reason.endsWith("-failed") || reason.endsWith("-unacknowledged")
                || reason.endsWith("-no-mode") || "display-only".equals(reason)) {
            finishModeSwitch(intent, reason);
        }
    }

    private static void finishModeSwitch(ModeSwitch intent, String reason) {
        boolean active = modeSwitch == intent;
        boolean changed = intent.finish();
        if (active) modeSwitch = null;
        if (active || changed) traceModeSwitch(intent, "end", reason);
    }

    private static boolean consumesModeSwitch(PlayerCoordinatorAccess coordinator, String hook) {
        ModeSwitch intent = modeSwitch;
        if (intent == null) return false;
        if (!intent.matches(coordinator, coordinator.patch_getExoPlayer(),
                nativeLoadGeneration, engine.generation(), nativeQueueGeneration)) {
            finishModeSwitch(intent, "different-player-or-load");
            return false;
        }
        traceModeSwitch(intent, "consume", hook);
        return true;
    }

    private static void traceModeSwitch(ModeSwitch intent, String phase, String reason) {
        if (CrossfadeTrace.isEnabled()) {
            CrossfadeTrace.event("MODE_SWITCH", intent.player, () -> "phase=" + phase
                    + " source=" + intent.sourceId + " target=" + intent.targetId
                    + " transition=" + intent.transitionGeneration + " reason=" + reason);
        }
    }

    public static void onVideoToggle(Object nba) {
        stockToggle = beginModeSwitch(null, null);
    }

    public static void onVideoToggleFinished() {
        ModeSwitch intent = stockToggle;
        stockToggle = null;
        if (intent != null) endModeSwitch(intent, intent.loadStarted ? "native-load" : "display-only");
    }

    private static void observe(PlayerCoordinatorAccess coordinator) {
        ExoPlayerAccess player = (ExoPlayerAccess) coordinator.patch_getExoPlayer();
        if (player == null) return;
        if (currentIdentity() != player) {
            engine.observe(player, coordinator.patch_getVolume(), player.patch_getPlayWhenReady());
            automaticTrackGeneration = -1;
        }
    }

    private static boolean startTransition(PlayerCoordinatorAccess coordinator, CrossfadeEngine.Kind kind,
                                           NextAvailability availability) {
        if (getCrossfadeDurationMs() <= 0) return false;
        ExoPlayerAccess outgoing = (ExoPlayerAccess) coordinator.patch_getExoPlayer();
        if (outgoing == null || !PlaybackState.hasOutgoingTrack(outgoing.patch_getPlaybackState())) return false;
        observe(coordinator);
        engine.nextAvailability(availability);
        if (kind == CrossfadeEngine.Kind.AUTO_ADVANCE && !engine.canAutoAdvance()) return false;
        PcmFadeBridge.Snapshot output = PcmFadeBridge.snapshot(outgoing);
        if (!output.negotiated || !output.supported || isAudioRoutedToCast() || isCrossfadePaused) return false;
        CrossfadeEngine.Player current = engine.current();
        engine.intent(current, current.transitionGeneration, outgoing.patch_getPlayWhenReady(), false);
        publishFrames(current);
        long transition = engine.reserve(kind, getCrossfadeDurationMs(), Settings.CROSSFADE_CURVE.get().ordinal());
        if (transition < 0) return false;
        activeCoordinator = coordinator;
        ExoPlayerAccess incoming = createNewPlayer(coordinator);
        if (incoming == null) {
            engine.allocationFailed(transition);
            return false;
        }
        // Incoming normalization is seeded explicitly, independent of whether the coordinator cache changes.
        float normalization = coordinator.patch_getVolume();
        PcmFadeBridge.setGain(incoming, 0, 0);
        incoming.patch_setVolume(PcmFadeBridge.normalization(incoming, normalization));
        if (!engine.prepared(transition, incoming, normalization)) {
            releasePlayer(incoming);
            return false;
        }
        detachCwh(outgoing);
        loadIssued = false;
        ensurePump();
        return true;
    }

    public static boolean onBeforeStopVideo(Object atad, int reason) {
        if (!CROSSFADE_ENABLED) return false;
        lastAtadRef = new WeakReference<>(atad);
        PlayerCoordinatorAccess coordinator = getCoordinatorFromAtad(atad, false);
        if (coordinator == null || consumesModeSwitch(coordinator, "stop/" + reason)) return false;
        if (reason != 5) return false;
        if (isFromTaskRemoval()) {
            dispose(false);
            return false;
        }
        if (engine.transitioning() && !loadIssued) return false;
        ExoPlayerAccess player = (ExoPlayerAccess) coordinator.patch_getExoPlayer();
        boolean automatic = monitorRequested;
        NextAvailability availability = automatic ? monitorAvailability : QueueAdvanceBridge.availability();
        monitorRequested = false;
        if (player != null && player.patch_getDuration() > 0) {
            long remaining = player.patch_getDuration() - player.patch_getCurrentPosition();
            automatic |= remaining >= 0 && remaining < 5000;
        }
        if (automatic && (!Settings.CROSSFADE_ON_AUTO_ADVANCE.get() || sleepTimerEndOfTrack)
                || !automatic && !Settings.CROSSFADE_ON_SKIP.get()) return false;
        startTransition(coordinator, automatic ? CrossfadeEngine.Kind.AUTO_ADVANCE : CrossfadeEngine.Kind.MANUAL_SKIP,
                availability);
        return false;
    }

    public static boolean onBeforePlayNext(Object instance) {
        if (!CROSSFADE_ENABLED || internalPlayNext) return false;
        PlayerCoordinatorAccess coordinator = (PlayerCoordinatorAccess) instance;
        if (consumesModeSwitch(coordinator, "playNext")) return false;
        if (engine.transitioning()) {
            return loadIssued && engine.kind() != CrossfadeEngine.Kind.MANUAL_SKIP;
        }
        NextAvailability availability = QueueAdvanceBridge.availability();
        engine.nextAvailability(availability);
        if (!engine.canAutoAdvance()) return false;
        if (!Settings.CROSSFADE_ON_AUTO_ADVANCE.get() || sleepTimerEndOfTrack) return false;
        if (!startTransition(coordinator, CrossfadeEngine.Kind.AUTO_ADVANCE, availability)) return false;
        Object medialib = lastAtadRef.get();
        if (!(medialib instanceof MedialibPlayerAccess access)) {
            engine.failed(engine.current(), engine.current().transitionGeneration);
            return false;
        }
        internalPlayNext = true;
        try {
            access.patch_playNextInQueue();
        } finally {
            internalPlayNext = false;
        }
        return true;
    }

    public static void onBeforeLoadVideo(Object medialib, Object descriptor) {
        if (Looper.myLooper() != Looper.getMainLooper()) {
            mainHandler.post(() -> onBeforeLoadVideo(medialib, descriptor));
            return;
        }
        if (!CROSSFADE_ENABLED) return;
        ModeSwitch intent = modeSwitch;
        if (intent != null) {
            PlayerCoordinatorAccess coordinator = getCoordinatorFromAtad(medialib, false);
            String videoId = descriptor != null && medialib instanceof MedialibPlayerAccess access
                    ? access.patch_getDescriptorVideoId(descriptor) : null;
            boolean loaded = coordinator != null && intent.loaded(coordinator, coordinator.patch_getExoPlayer(),
                    nativeLoadGeneration, engine.generation(), nativeQueueGeneration, videoId);
            finishModeSwitch(intent, loaded ? "native-load" : "different-load-request");
        }
        nativeLoadGeneration++;
        QueueAdvanceBridge.invalidate();
        engine.nativeLoad();
        if (descriptor != null) lastLoadDescriptor = descriptor;
        if (medialib instanceof MedialibPlayerAccess) lastAtadRef = new WeakReference<>(medialib);
        loadIssued = true;
        if (CrossfadeTrace.isEnabled()) {
            CrossfadeTrace.event("LOAD_BEGIN", currentIdentity(), () -> "descriptor=" + CrossfadeTrace.id(descriptor)
                    + " medialib=" + CrossfadeTrace.id(medialib));
        }
        ensurePump();
    }

    public static void onPauseVideo() {
        if (!CROSSFADE_ENABLED) return;
        if (Looper.myLooper() != Looper.getMainLooper()) {
            mainHandler.post(CrossfadeManager::onPauseVideo);
            return;
        }
        engine.pause(true);
    }

    public static void onPlayVideo(Object atad) {
        if (!CROSSFADE_ENABLED) return;
        if (Looper.myLooper() != Looper.getMainLooper()) {
            mainHandler.post(() -> onPlayVideo(atad));
            return;
        }
        lastAtadRef = new WeakReference<>(atad);
        engine.pause(false);
        ensurePump();
    }

    public static void onSleepTimerStateChanged(Object state) {
        if (!CROSSFADE_ENABLED) return;
        if (Looper.myLooper() != Looper.getMainLooper()) {
            mainHandler.post(() -> onSleepTimerStateChanged(state));
            return;
        }
        sleepTimerEndOfTrack = state instanceof Enum<?> value && "ACTIVE_END_OF_TRACK".equals(value.name());
        engine.sleepEnd(sleepTimerEndOfTrack);
    }

    public static void onLoopStateChanged(Object state) {
        if (!CROSSFADE_ENABLED) return;
        if (Looper.myLooper() != Looper.getMainLooper()) {
            mainHandler.post(() -> onLoopStateChanged(state));
            return;
        }
        if (!(state instanceof Enum<?> value)) return;
        engine.loopState(value.name());
    }

    private static void publishFrames(CrossfadeEngine.Player player) {
        if (player.released) return;
        ExoPlayerAccess nativePlayer = (ExoPlayerAccess) player.identity;
        player.audioSessionId = nativePlayer.patch_getAudioSessionId();
        if (player != engine.current() && engine.state() != CrossfadeEngine.State.PAUSED) {
            engine.intent(player, player.transitionGeneration, nativePlayer.patch_getPlayWhenReady(), false);
            if (player.released) return;
        }
        PcmFadeBridge.Snapshot facts = PcmFadeBridge.snapshot(player.identity);
        if (facts.ended && !player.ended && CrossfadeTrace.isEnabled()) {
            CrossfadeTrace.event("OUTPUT_END", player.identity, () -> "nativeState="
                    + nativePlayer.patch_getPlaybackState() + " sinkGeneration=" + facts.sinkGeneration
                    + " submitted=" + facts.submittedFrames + " played=" + facts.playedFrames
                    + " audible=" + facts.audibleFrames);
        }
        engine.frames(player, player.transitionGeneration, new CrossfadeEngine.Frames(
                facts.sinkGeneration, facts.submittedFrames, facts.playedFrames, facts.audibleFrames,
                facts.sampleRate, facts.negotiated, facts.supported, facts.ended, facts.stopped, facts.gain));
    }

    private static void ensurePump() {
        if (!CROSSFADE_ENABLED || pumping) return;
        pumping = true;
        mainHandler.post(PUMP);
    }

    private static void pump() {
        pumping = false;
        try {
            PlayerCoordinatorAccess coordinator = getCoordinatorFromAtad(lastAtadRef.get(), false);
            if (coordinator != null) {
                activeCoordinator = coordinator;
                observe(coordinator);
                if (modeSwitch != null && !modeSwitch.matches(coordinator, coordinator.patch_getExoPlayer(),
                        nativeLoadGeneration, engine.generation(), nativeQueueGeneration)) {
                    finishModeSwitch(modeSwitch, "different-generation");
                }
            }
            for (CrossfadeEngine.Player player : engine.players()) publishFrames(player);
            CrossfadeEngine.Player current = engine.current();
            if (current != null) {
                ExoPlayerAccess nativePlayer = (ExoPlayerAccess) current.identity;
                int state = nativePlayer.patch_getPlaybackState();
                CrossfadeTrace.state(nativePlayer);
                if (engine.state() == CrossfadeEngine.State.PAUSED && nativePlayer.patch_getPlayWhenReady()) {
                    engine.intent(current, current.transitionGeneration, true, false);
                }
                if (engine.transitioning() && nativePlayer.patch_hasPlaybackError()) {
                    engine.failed(current, current.transitionGeneration);
                }
                if (state == 4) engine.ended(current, current.transitionGeneration);
                if (coordinator != null && engine.current() == current) {
                    automaticDeadline(coordinator, nativePlayer, current);
                }
            }
            flushAudioEffectSessionCloses();
        } catch (Exception exception) {
            logWarn(() -> "Crossfade output event failed", exception);
        }
        if (activityRunning || engine.current() != null || engine.hasRetiredPlayers()) {
            pumping = true;
            mainHandler.postDelayed(PUMP, engine.transitioning() || engine.hasRetiredPlayers() ? 50 : 100);
        }
    }

    private static void automaticDeadline(PlayerCoordinatorAccess coordinator, ExoPlayerAccess player,
                                          CrossfadeEngine.Player record) {
        if (engine.transitioning() || isCrossfadePaused || sleepTimerEndOfTrack || modeSwitch != null
                || !Settings.CROSSFADE_ON_AUTO_ADVANCE.get() || !player.patch_getPlayWhenReady()
                || player.patch_getPlaybackState() != 3 || automaticTrackGeneration == record.trackGeneration) return;
        long duration = player.patch_getDuration();
        long remaining = duration - player.patch_getCurrentPosition();
        if (duration <= getCrossfadeDurationMs() || remaining <= 0 || remaining > getCrossfadeDurationMs()) return;
        NextAvailability availability = QueueAdvanceBridge.availability();
        engine.nextAvailability(availability);
        if (!engine.canAutoAdvance()) {
            if (CrossfadeTrace.isEnabled() && emptyQueueTrackGeneration != record.trackGeneration) {
                emptyQueueTrackGeneration = record.trackGeneration;
                CrossfadeTrace.event("QUEUE_END", player, () -> "source=MEDIA_NEXT next=" + availability
                        + " track=" + record.trackGeneration
                        + " position=" + player.patch_getCurrentPosition() + " duration=" + duration);
            }
            return;
        }
        automaticTrackGeneration = record.trackGeneration;
        Object medialib = lastAtadRef.get();
        if (engine.repeatOne() && medialib instanceof MedialibPlayerAccess access && lastLoadDescriptor != null) {
            if (CrossfadeTrace.isEnabled()) {
                CrossfadeTrace.event("QUEUE_REPEAT", player, () -> "source=DESCRIPTOR kind=REPEAT_ONE next="
                        + availability + " track=" + record.trackGeneration + " remaining=" + remaining);
            }
            if (startTransition(coordinator, CrossfadeEngine.Kind.REPEAT_ONE, availability)) {
                access.patch_loadVideoWith(lastLoadDescriptor);
            }
            return;
        }
        Context context = Utils.getContext();
        AudioManager manager = context == null ? null : (AudioManager) context.getSystemService(Context.AUDIO_SERVICE);
        if (manager == null || isAudioRoutedToCast()) return;
        monitorRequested = true;
        monitorAvailability = availability;
        if (CrossfadeTrace.isEnabled()) {
            CrossfadeTrace.event("QUEUE_NEXT", player, () -> "source=MEDIA_NEXT next=" + availability
                    + " track=" + record.trackGeneration);
        }
        long now = SystemClock.uptimeMillis();
        manager.dispatchMediaKeyEvent(new KeyEvent(now, now, KeyEvent.ACTION_DOWN, KeyEvent.KEYCODE_MEDIA_NEXT, 0));
        manager.dispatchMediaKeyEvent(new KeyEvent(now, now, KeyEvent.ACTION_UP, KeyEvent.KEYCODE_MEDIA_NEXT, 0));
    }

    public static float filterVolume(Object player, float volume) {
        if (!CROSSFADE_ENABLED) return volume;
        // Stock focus ducking is applied downstream. Neither path multiplies by the PCM envelope.
        if (Looper.myLooper() == Looper.getMainLooper()) engine.normalization(player, volume);
        else mainHandler.post(() -> engine.normalization(player, volume));
        return PcmFadeBridge.normalization(player, volume);
    }

    public static void closeAudioEffectSession(Context context, Intent intent) {
        if (Looper.myLooper() != Looper.getMainLooper()) {
            Intent copy = new Intent(intent);
            mainHandler.post(() -> closeAudioEffectSession(context, copy));
            return;
        }
        int session = intent.getIntExtra(AudioEffect.EXTRA_AUDIO_SESSION, -1);
        if (closedAudioSessions.contains(session)) return;
        if (holdsSession(session)) {
            for (Intent held : heldAudioEffectSessionCloses) {
                if (held.getIntExtra(AudioEffect.EXTRA_AUDIO_SESSION, -1) == session) return;
            }
            heldAudioEffectSessionCloses.add(new Intent(intent));
            traceSession(intent, "held");
        } else {
            closedAudioSessions.add(session);
            traceSession(intent, "sent");
            context.sendBroadcast(intent);
        }
    }

    private static boolean holdsSession(int session) {
        if (session <= 0) return false;
        for (CrossfadeEngine.Player player : engine.players()) {
            if (!player.released && player.audioSessionId == session
                    && (player != engine.current() || engine.transitioning())) return true;
        }
        return false;
    }

    private static void flushAudioEffectSessionCloses() {
        for (int index = heldAudioEffectSessionCloses.size() - 1; index >= 0; index--) {
            Intent intent = heldAudioEffectSessionCloses.get(index);
            int session = intent.getIntExtra(AudioEffect.EXTRA_AUDIO_SESSION, -1);
            if (holdsSession(session)) continue;
            heldAudioEffectSessionCloses.remove(index);
            if (closedAudioSessions.add(session)) {
                traceSession(intent, "sentAfterDrain");
                Utils.getContext().sendBroadcast(intent);
            }
        }
    }

    private static void dispose(boolean stop) {
        Object nativeOwned = activeCoordinator == null ? currentIdentity() : activeCoordinator.patch_getExoPlayer();
        engine.dispose(nativeOwned);
        QueueAdvanceBridge.invalidate();
        if (nativeOwned != null) {
            if (PcmFadeBridge.hasProcessor(nativeOwned)) PcmFadeBridge.setGain(nativeOwned, 1, 0);
            if (stop) ((ExoPlayerAccess) nativeOwned).patch_setPlayWhenReady(false);
        }
        if (modeSwitch != null) finishModeSwitch(modeSwitch, "disposed");
        flushAudioEffectSessionCloses();
    }

    public static void onQueueDismissed() { if (CROSSFADE_ENABLED) dispose(true); }
    public static void onActivityStop() { activityRunning = false; }
    public static void onActivityDestroy() {
        activityRunning = false;
        if (CROSSFADE_ENABLED) dispose(false);
        mainHandler.removeCallbacks(PUMP);
        pumping = false;
    }
    public static void onActivityStart() {
        activityRunning = true;
        isCrossfadePaused = false;
        tryAttachLongPressHandler();
        ensurePump();
    }
    private static int getCrossfadeDurationMs() { return Settings.CROSSFADE_DURATION.get().milliseconds; }

    @SuppressLint("MissingPermission")
    private static void toggleSessionPause() {
        isCrossfadePaused = !isCrossfadePaused;
        if (isCrossfadePaused) engine.modeSwitch();
        Context context = Utils.getContext();
        if (context != null) {
            try {
                Vibrator vibrator;
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
                    VibratorManager manager = (VibratorManager)
                            context.getSystemService(Context.VIBRATOR_MANAGER_SERVICE);
                    vibrator = manager == null ? null : manager.getDefaultVibrator();
                } else {
                    vibrator = (Vibrator) context.getSystemService(Context.VIBRATOR_SERVICE);
                }
                if (vibrator != null && vibrator.hasVibrator()) {
                    vibrator.vibrate(VibrationEffect.createOneShot(100, VibrationEffect.DEFAULT_AMPLITUDE));
                }
            } catch (Exception ignored) {}
        }
        Utils.showToastShort(str(isCrossfadePaused
                ? "morphe_music_crossfade_paused_toast" : "morphe_music_crossfade_resumed_toast"));
        ensurePump();
    }
    public static void traceAppVolumeBefore(Object coordinator, float requested) {
        traceAppVolume(coordinator, requested, false);
    }

    public static void traceAppVolumeAfter(Object coordinator, float requested) {
        traceAppVolume(coordinator, requested, true);
    }

    public static void traceRawVolumeBefore(Object player, float requested) {
        traceRawVolume(player, requested, false);
    }

    public static void traceRawVolumeAfter(Object player, float requested) {
        traceRawVolume(player, requested, true);
    }

    /** Reuses the native logger's existing argument array, without evaluating its event supplier. */
    public static void traceNativeLoad(Object[] arguments) {
        if (!CrossfadeTrace.isEnabled() || arguments == null || arguments.length < 6) return;
        CrossfadeTrace.event("LOAD", currentIdentity(), () -> "requestedVolume=" + arguments[5]
                + " playWhenReady=" + arguments[1] + " positionMs=" + arguments[2]
                + " videoId=" + arguments[4] + " client=see_SOURCE sabr=see_SOURCE");
    }

    /** Existing coordinator normalization method, before and after its cached-volume update. */
    public static void traceAppVolume(Object instance, float requested, boolean after) {
        if (!CrossfadeTrace.isEnabled() || !(instance instanceof PlayerCoordinatorAccess coordinator)) return;
        CrossfadeTrace.event("APP_VOLUME", coordinator.patch_getExoPlayer(), () -> "requested=" + requested
                + " phase=" + (after ? "after" : "before")
                + " normalized=" + (after ? coordinator.patch_getVolume() : "pending")
                + " coordinatorCached=" + coordinator.patch_getVolume());
    }

    /** Both native app writes and the existing raw fade bridge pass through this body. */
    public static void traceRawVolume(Object instance, float requested, boolean after) {
        if (!CrossfadeTrace.isEnabled() || !(instance instanceof ExoPlayerAccess player)) return;
        CrossfadeTrace.event("RAW_VOLUME", player, () -> "requested=" + requested
                + " phase=" + (after ? "after" : "before") + " cached=" + player.patch_getRawVolume()
                + " effective=preFocus");
        CrossfadeTrace.state(player);
    }

    public static void tracePlayWhenReady(Object player, boolean requested) {
        if (!CrossfadeTrace.isEnabled()) return;
        CrossfadeTrace.event("PLAY_WHEN_READY", player, () -> "requested=" + requested);
    }

    /** Passes the original broadcast through unchanged; no effect-session policy is added. */
    public static void traceSessionBroadcast(Context context, Intent intent) {
        if (AudioEffect.ACTION_OPEN_AUDIO_EFFECT_CONTROL_SESSION.equals(intent.getAction())) {
            int session = intent.getIntExtra(AudioEffect.EXTRA_AUDIO_SESSION, -1);
            if (Looper.myLooper() == Looper.getMainLooper()) closedAudioSessions.remove(session);
            else mainHandler.post(() -> closedAudioSessions.remove(session));
        }
        traceSession(intent, "sent");
        context.sendBroadcast(intent);
    }

    private static void traceSession(Intent intent, String disposition) {
        if (!CrossfadeTrace.isEnabled()) return;
        String action = intent.getAction();
        String event = AudioEffect.ACTION_OPEN_AUDIO_EFFECT_CONTROL_SESSION.equals(action)
                ? "SESSION_OPEN" : "SESSION_CLOSE";
        CrossfadeTrace.event(event, null, () -> "session="
                + intent.getIntExtra(AudioEffect.EXTRA_AUDIO_SESSION, -1) + " disposition=" + disposition
                + " action=" + action);
    }
    private static void swapCoordinatorPlayer(PlayerCoordinatorAccess coordinator,
                                              ExoPlayerAccess outgoing, ExoPlayerAccess incoming) {
        // In video mode the outgoing keeps rendering into the surface that is rebound for the
        // next track, and the failing video decoder stops its audio as well.
        if (outgoing != null) {
            try {
                outgoing.patch_setVideoSurface(null);
            } catch (Exception e) {
                logWarn(() -> "swap: clearing outgoing video surface failed: " + e.getMessage());
            }
        }

        Object listener = null;
        try {
            listener = coordinator.patch_getCoordinatorListener();
            if (listener != null && outgoing != null) {
                outgoing.patch_removeDirectListener(listener);
            }
        } catch (Exception e) {
            logWarn(() -> "swap: removing coordinator listener failed: " + e.getMessage());
        }

        coordinator.patch_setPlayerWithBindings(incoming);
        logDebug(() -> "swap: coordinator -> @" + System.identityHashCode(incoming)
                + " (from @" + System.identityHashCode(outgoing) + ")");

        if (listener != null) {
            try {
                incoming.patch_addDirectListener(listener);
            } catch (Exception e) {
                logWarn(() -> "swap: adding coordinator listener failed: " + e.getMessage());
            }
        }
        VideoSurfaceAccess surface = (VideoSurfaceAccess) coordinator.patch_getVideoSurface();
        if (surface != null) {
            surface.patch_setPlayerReference(incoming);
        }
    }

    private static void detachCwh(ExoPlayerAccess player) {
        try {
            player.patch_detachCwhFromEventDispatch();
            detachedPlayers.add(player);
        } catch (Exception e) {
            logWarn(() -> "detachCwh failed on @" + System.identityHashCode(player) + ": " + e.getMessage());
        }
    }
    private static ExoPlayerAccess createNewPlayer(PlayerCoordinatorAccess coordinator) {
        if (CrossfadeTrace.isEnabled()) {
            CrossfadeTrace.begin(coordinator.patch_getExoPlayer(), coordinator);
        }
        try {
            SessionAccess session = (SessionAccess) coordinator.patch_getSession();
            PlayerFactoryAccess factory = session == null ? null : (PlayerFactoryAccess) session.patch_getFactory();
            Object loadControl = coordinator.patch_getLoadControl();
            SharedStateAccess sharedState = (SharedStateAccess) coordinator.patch_getSharedState();
            SharedCallbackAccess sharedCallback = (SharedCallbackAccess) coordinator.patch_getSharedCallback();
            if (factory == null || loadControl == null || sharedState == null || sharedCallback == null) {
                logError(() -> "createNewPlayer: missing session=" + (session != null)
                        + " factory=" + (factory != null) + " loadControl=" + (loadControl != null)
                        + " sharedState=" + (sharedState != null) + " sharedCallback=" + (sharedCallback != null));
                return null;
            }
            activeSharedCallback = sharedCallback;

            Object oldTimeline = sharedState.patch_getTimeline();
            Object oldCqb = sharedCallback.patch_getCqb();
            logDebug(() -> "Pre-factory shared state: cqb=" + (oldCqb != null));
            sharedState.patch_setTimeline(null);
            sharedCallback.patch_setCqb(null);

            ExoPlayerAccess newExo = createPlayerViaFactory(factory, coordinator, loadControl);
            if (CrossfadeTrace.isEnabled()) {
                CrossfadeTrace.event("FACTORY_END", newExo, () -> "coordinator=" + CrossfadeTrace.id(coordinator));
            }
            if (newExo == null) {
                logError(() -> "Factory returned null, restoring");
                sharedState.patch_setTimeline(oldTimeline);
                sharedCallback.patch_setCqb(oldCqb);
                return null;
            }

            Object postTimeline = sharedState.patch_getTimeline();
            Object postCqb = sharedCallback.patch_getCqb();
            logDebug(() -> "Post-factory shared state: cqb=" + (postCqb != null)
                    + " newExo=" + System.identityHashCode(newExo));
            if (postTimeline == null) {
                logWarn(()-> "Factory did not re-set timeline (expected on 9.x, field is final, restoring)");
                sharedState.patch_setTimeline(oldTimeline);
            }
            if (postCqb == null) {
                logError(() -> "Factory failed to set cqb, aborting");
                sharedState.patch_setTimeline(oldTimeline);
                sharedCallback.patch_setCqb(oldCqb);
                releasePlayer(newExo);
                return null;
            }

            return newExo;
        } catch (Exception e) {
            logError(()-> "createNewPlayer error", e);
            return null;
        }
    }
    private static ExoPlayerAccess createPlayerViaFactory(
            PlayerFactoryAccess factory,
            PlayerCoordinatorAccess coordinator,
            Object loadControl) {
        try {
            Object player = factory.patch_createPlayer(coordinator, loadControl, 0);
            if (player != null) {
                playersCreated++;
                logDebug(() -> "Factory created player @"
                        + System.identityHashCode(player)
                        + " [created=" + playersCreated
                        + " released=" + playersReleased
                        + " outstanding="
                        + (playersCreated - playersReleased) + "]");
            }
            return (ExoPlayerAccess) player;
        } catch (Exception e) {
            logError(()-> "createPlayerViaFactory failed", e);
            return null;
        }
    }

    private static boolean isFromTaskRemoval() {
        for (StackTraceElement frame : Thread.currentThread().getStackTrace()) {
            if ("onTaskRemoved".equals(frame.getMethodName())) return true;
        }
        return false;
    }

    private static PlayerCoordinatorAccess getCoordinatorFromAtad(Object atadInstance) {
        return getCoordinatorFromAtad(atadInstance, true);
    }

    /**
     * @param log False for the monitor, which calls this on every poll.
     */
    private static PlayerCoordinatorAccess getCoordinatorFromAtad(Object atadInstance, boolean log) {
        try {
            Object chain = ((MedialibPlayerAccess) atadInstance).patch_getPlayerChain();
            if (chain == null) {
                if (log) logError(() -> "atad player chain is null");
                return null;
            }

            int depth = 0;
            while (chain instanceof DelegateAccess) {
                Object delegate = ((DelegateAccess) chain).patch_getDelegate();
                if (delegate == null || delegate == chain) break;
                chain = delegate;
                depth++;
            }

            if (chain instanceof PlayerCoordinatorAccess coordinator) {
                if (log) {
                    final int depthFinal = depth;
                    logDebug(() -> "Traversed " + depthFinal + " delegates -> "
                            + coordinator.getClass().getName());
                }
                return coordinator;
            }
            if (log) {
                Object chainFinal = chain;
                logError(() -> "Innermost class is not a PlayerCoordinatorAccess: "
                        + chainFinal.getClass().getName());
            }
            return null;
        } catch (Exception e) {
            if (log) logError(() -> "getCoordinatorFromAtad error", e);
            return null;
        }
    }
    private static void releasePlayer(ExoPlayerAccess p) {
        if (p == null) return;
        detachedPlayers.remove(p);
        CrossfadeTrace.role(p, "RELEASED");
        PcmFadeBridge.release(p);

        playersReleased++;
        logDebug(() -> "releasePlayer: @" + System.identityHashCode(p)
                + " [created=" + playersCreated + " released=" + playersReleased
                + " outstanding=" + (playersCreated - playersReleased) + "]");

        SharedCallbackAccess callback = activeSharedCallback;
        Object savedCqb = null, savedDlt = null;
        if (callback != null) {
            savedCqb = callback.patch_getCqb();
            savedDlt = callback.patch_getDlt();
        }

        try { p.patch_setDltCallback(null); } catch (Exception ignored) {}

        // Done only now, so the outgoing keeps reporting pause and seek events during the fade.
        try {
            p.patch_detachCwhFromEventDispatch();
            logDebug(() -> "releasePlayer: 9.x detached cwh from event dispatch on @"
                    + System.identityHashCode(p));
        } catch (Exception e) {
            logDebug(() -> "releasePlayer: 9.x cwh event dispatch detach failed: " + e.getMessage());
        }

        suppressCwhU = true;
        try {
            p.patch_release();
        } catch (Exception e) {
            logDebug(() -> "releasePlayer: release() threw: " + e.getMessage());
        } finally {
            suppressCwhU = false;
        }

        if (callback != null) {
            Object postCqb = callback.patch_getCqb();
            Object postDlt = callback.patch_getDlt();
            if (savedCqb != null && postCqb == null) {
                callback.patch_setCqb(savedCqb);
                logDebug(() -> "releasePlayer: restored shared cqb");
            }
            if (savedDlt != null && postDlt == null) {
                callback.patch_setDlt(savedDlt);
                logDebug(() -> "releasePlayer: restored shared dlt");
            }
        }
    }
    private static volatile long lastCastCheckMs = 0;
    private static volatile boolean lastCastResult = false;
    private static final long CAST_CHECK_TTL_MS = 250;
    /**
     * Shown once per process, not on every track change while casting.
     */
    private static volatile boolean castUnstableToastShown = false;

    /**
     * The player swap flickers the MediaSession state, which receivers get as pause and
     * play commands, and strict ones drop the connection (#1549).
     */
    @SuppressWarnings({"deprecation", "RedundantSuppression"})
    private static boolean isAudioRoutedToCast() {
        if (Build.VERSION.SDK_INT < 28) return false;

        long now = System.currentTimeMillis();
        if (now - lastCastCheckMs < CAST_CHECK_TTL_MS) {
            return lastCastResult;
        }
        lastCastCheckMs = now;

        boolean casting = false;
        StringBuilder probe = new StringBuilder();
        try {
            Context ctx = Utils.getContext();
            if (ctx != null) {
                // A remote route decodes on the receiver, which is what breaks. Local decoding
                // (speaker, Bluetooth, wired, USB) is fine. MediaRouter2 is not on the classpath.
                MediaRouter mr = (MediaRouter) ctx.getSystemService(Context.MEDIA_ROUTER_SERVICE);
                if (mr != null) {
                    MediaRouter.RouteInfo selected = mr.getSelectedRoute(MediaRouter.ROUTE_TYPE_LIVE_AUDIO);
                    if (selected != null) {
                        int pt = selected.getPlaybackType();
                        probe.append("route{name=").append(selected.getName(ctx))
                                .append(",pbType=").append(pt).append("} ");
                        if (pt == MediaRouter.RouteInfo.PLAYBACK_TYPE_REMOTE) {
                            casting = true;
                        }
                    } else {
                        probe.append("route{null} ");
                    }
                }
                // MediaRouter does not reflect every remote output.
                if (!casting) {
                    AudioManager am = (AudioManager) ctx.getSystemService(Context.AUDIO_SERVICE);
                    if (am != null) {
                        // noinspection WrongConstant
                        for (AudioDeviceInfo info : am.getDevices(AudioManager.GET_DEVICES_OUTPUTS)) {
                            int type = info.getType();
                            probe.append("dev{type=").append(type)
                                    .append(",id=").append(info.getId()).append("} ");
                            // No TYPE_REMOTE_SUBMIX: Android Auto and screen recording use it but
                            // decode locally; Samsung mirroring cannot be distinguished here (#1549).
                            if (type == AudioDeviceInfo.TYPE_HDMI
                                    || type == AudioDeviceInfo.TYPE_HDMI_ARC
                                    || type == 29 /* TYPE_HDMI_EARC, API 31+ */
                                    || type == AudioDeviceInfo.TYPE_IP
                                    || type == AudioDeviceInfo.TYPE_BUS) {
                                casting = true;
                                break;
                            }
                        }
                    }
                }
            }
        } catch (Exception e) {
            logDebug(() -> "isAudioRoutedToCast check failed: " + e.getMessage());
        }

        if (casting != lastCastResult) {
            final boolean castingFinal = casting;
            logDebug(() -> "Cast routing " + (castingFinal ? "ENGAGED" : "RELEASED")
                    + ", crossfade " + (castingFinal ? "disabled" : "re-enabled")
                    + " [" + probe.toString().trim() + "]");
            // Otherwise crossfade would stop working with no visible reason.
            if (casting && !castUnstableToastShown) {
                castUnstableToastShown = true;
                try {
                    Utils.showToastShort(str("morphe_music_crossfade_cast_unstable_toast"));
                } catch (Exception ignored) {}
            }
        }

        lastCastResult = casting;
        return casting;
    }
    private static final String[] SHUFFLE_IDS = {
            "queue_shuffle_button",
            "queue_shuffle",
            "playback_queue_shuffle_button_view",
            "overlay_queue_shuffle_button_view"
    };

    private static android.view.ViewTreeObserver.OnGlobalLayoutListener longPressLayoutListener;
    private static WeakReference<View> longPressLayoutListenerHost = new WeakReference<>(null);

    /**
     * The hooks that attach the handler fire in quick bursts.
     */
    private static volatile boolean pendingLongPressAttach = false;

    private static void tryAttachLongPressHandler() {
        if (!CROSSFADE_ENABLED || !Settings.CROSSFADE_SESSION_CONTROL.get()) return;
        if (pendingLongPressAttach) return;
        pendingLongPressAttach = true;

        mainHandler.post(() -> {
            pendingLongPressAttach = false;
            tryAttachLongPressNow();
            registerLongPressLayoutListener();
        });
    }

    private static void tryAttachLongPressNow() {
        try {
            Activity activity = Utils.getActivity();
            if (activity == null || activity.getWindow() == null) return;

            View decorView = activity.getWindow().getDecorView();
            Resources res = activity.getResources();
            String pkg = activity.getPackageName();

            List<View> allButtons = new ArrayList<>();
            List<String> matchedIds = new ArrayList<>();
            for (String idName : SHUFFLE_IDS) {
                @SuppressLint("DiscouragedApi")
                int id = res.getIdentifier(idName, "id", pkg);
                if (id == 0) continue;
                List<View> matched = new ArrayList<>();
                findAllViewsById(decorView, id, matched);
                if (!matched.isEmpty()) {
                    matchedIds.add(idName + "(" + matched.size() + ")");
                }
                allButtons.addAll(matched);
            }

            if (allButtons.isEmpty()) return;

            StringBuilder attachLog = new StringBuilder("Long-press attach: matched=" + matchedIds + ", attaching to:");
            for (View shuffleBtn : allButtons) {
                attachTouchLongPress(shuffleBtn, "btn");
                attachLog.append(" btn@").append(System.identityHashCode(shuffleBtn))
                        .append("(").append(shuffleBtn.getClass().getSimpleName())
                        .append(" vis=").append(shuffleBtn.getVisibility())
                        .append(" clickable=").append(shuffleBtn.isClickable())
                        .append(")");

                View parent = (View) shuffleBtn.getParent();
                if (parent != null && parent != decorView) {
                    attachTouchLongPress(parent, "parent");
                    attachLog.append(" parent@").append(System.identityHashCode(parent))
                            .append("(").append(parent.getClass().getSimpleName()).append(")");
                }
            }
            logDebug(attachLog::toString);
        } catch (Exception e) {
            logDebug(() -> "tryAttachLongPressNow exception: " + e.getMessage());
        }
    }

    /**
     * Re-attaches on every layout and never removes itself, because the UI can rebind
     * the button's handlers at any time.
     */
    private static void registerLongPressLayoutListener() {
        try {
            Activity activity = Utils.getActivity();
            if (activity == null || activity.getWindow() == null) return;

            View decorView = activity.getWindow().getDecorView();
            View prevHost = longPressLayoutListenerHost.get();
            if (longPressLayoutListener != null && prevHost == decorView) return;
            if (longPressLayoutListener != null && prevHost != null
                    && prevHost.getViewTreeObserver() != null
                    && prevHost.getViewTreeObserver().isAlive()) {
                try {
                    prevHost.getViewTreeObserver().removeOnGlobalLayoutListener(longPressLayoutListener);
                } catch (Exception ignored) {}
            }
            longPressLayoutListener = CrossfadeManager::tryAttachLongPressNow;
            longPressLayoutListenerHost = new WeakReference<>(decorView);
            decorView.getViewTreeObserver().addOnGlobalLayoutListener(longPressLayoutListener);
            logDebug(() -> "Long-press attach: registered GlobalLayoutListener");
        } catch (Exception e) {
            logDebug(() -> "registerLongPressLayoutListener exception: " + e.getMessage());
        }
    }

    private static void findAllViewsById(View root, int id,
                                          List<View> out) {
        if (root.getId() == id) out.add(root);
        if (root instanceof ViewGroup vg) {
            for (int i = 0; i < vg.getChildCount(); i++) {
                findAllViewsById(vg.getChildAt(i), id, out);
            }
        }
    }

    private static void attachTouchLongPress(View btn, String tag) {
        final int viewId = System.identityHashCode(btn);

        // A long click listener survives the app rebinding its touch handler and keeps the normal tap.
        btn.setOnLongClickListener(v -> {
            toggleSessionPause();
            logDebug(() -> "Shuffle long-press fired on " + tag + "@" + viewId);
            return true;
        });
        btn.setLongClickable(true);
    }
}
