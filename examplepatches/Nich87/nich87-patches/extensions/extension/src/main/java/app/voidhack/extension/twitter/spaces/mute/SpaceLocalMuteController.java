package app.voidhack.extension.twitter.spaces.mute;

import android.content.Context;
import android.media.AudioTrack;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.concurrent.CopyOnWriteArraySet;

/**
 * Runtime controller for listener-side per-user local muting in Twitter/X Spaces.
 *
 * Operates across both Spaces audio engines:
 * 1. WebRTC (Speaker / Co-Host / Host mode): calls {@code org.webrtc.AudioTrack.setVolume(0.0d)}
 *    per individual remote speaker for zero-crosstalk hardware muting.
 * 2. HLS Live Listener & Space Replay (ExoPlayer2 / Media3): applies a smooth real-time
 *    active-speaker volume gate on the Space {@link AudioTrack} with 400ms word-gap hangover
 *    and selectable Smart (unmuted speaker cuts through) vs Strict overlap modes.
 */
public final class SpaceLocalMuteController {

    public interface MuteStateListener {
        void onLocalMuteStateChanged();
    }

    private static final String LOG_TAG = "VoidhackSpaceMute";
    private static final double WEBRTC_DEFAULT_VOLUME = 2.5d;
    private static final SpaceLocalMuteController INSTANCE = new SpaceLocalMuteController();

    private final Handler mainHandler = new Handler(Looper.getMainLooper());
    private final CopyOnWriteArraySet<MuteStateListener> listeners = new CopyOnWriteArraySet<>();
    private final SpaceLocalMuteLogic logic = new SpaceLocalMuteLogic();

    private final Object stateLock = new Object();
    private volatile boolean prefsLoaded = false;
    private volatile boolean hasActiveRules = false;
    private volatile boolean strictOverlapMute = false;
    private volatile boolean activelySilencing = false;
    private volatile Context appContext;

    private Map<String, SpaceLocalMuteLogic.SpeakerIdentity> speakerDirectory = Collections.emptyMap();
    private Set<String> activeTalkingKeys = Collections.emptySet();
    private boolean spaceConnected = false;

    // HLS / Replay ExoPlayer AudioTrack tracking
    private WeakReference<AudioTrack> activeExoTrackRef = new WeakReference<>(null);
    private float lastSinkVolume = 1.0f;
    private float currentGateGain = 1.0f;
    private float lastAppliedTrackVolume = -1.0f;
    private long lastRampUptimeMs = 0L;

    // WebRTC remote per-speaker org.webrtc.AudioTrack tracking (periscopeUserId -> track)
    private final Map<String, WeakReference<Object>> webRtcTracksByUserId = new HashMap<>();
    private final Map<Object, String> webRtcTrackToUserId = new WeakHashMap<>();
    private final Map<String, WeakReference<AudioTrack>> isolatedAndroidTracksByUserId = new HashMap<>();
    private volatile Method mWebRtcSetVolume;
    private volatile Field fHydraAudioSourceTrack;

    private final Runnable hangoverReleaseCheck = new Runnable() {
        @Override
        public void run() {
            reevaluateHlsNow(false);
        }
    };

    private SpaceLocalMuteController() {}

    public static SpaceLocalMuteController get() {
        return INSTANCE;
    }

    public void ensureLoaded(Context context) {
        if (context == null) return;
        Context app = context.getApplicationContext();
        if (appContext == null) {
            appContext = app;
        }
        if (prefsLoaded) return;
        synchronized (stateLock) {
            if (prefsLoaded) return;
            List<SpaceLocalMuteLogic.MutedUser> saved = SpaceLocalMutePrefs.getMutedUsers(app);
            logic.loadMutedUsers(saved);
            strictOverlapMute = SpaceLocalMutePrefs.isStrictOverlapMute(app);
            hasActiveRules = logic.hasMutedUsers();
            prefsLoaded = true;
        }
    }

    public void addListener(MuteStateListener l) {
        if (l != null) listeners.add(l);
    }

    public void removeListener(MuteStateListener l) {
        if (l != null) listeners.remove(l);
    }

    public boolean hasActiveMuteRules() {
        return hasActiveRules;
    }

    public int getMutedCount() {
        return logic.getMutedCount();
    }

    public List<SpaceLocalMuteLogic.MutedUser> getMutedUsers() {
        return logic.getMutedUsers();
    }

    public boolean isActivelySilencing() {
        return activelySilencing;
    }

    public boolean isWebRtcHardwareMuteActive() {
        synchronized (stateLock) {
            pruneWebRtcTracksLocked();
            return !webRtcTracksByUserId.isEmpty();
        }
    }

    public boolean isStrictOverlapMute(Context ctx) {
        ensureLoaded(ctx);
        return strictOverlapMute;
    }

    public void setStrictOverlapMute(Context ctx, boolean strict) {
        ensureLoaded(ctx);
        strictOverlapMute = strict;
        SpaceLocalMutePrefs.setStrictOverlapMute(ctx != null ? ctx : appContext, strict);
        reevaluateHlsNow(true);
        notifyListeners();
    }

    public boolean isMuted(String twitterUserId, String periscopeUserId, String username) {
        return logic.isMuted(twitterUserId, periscopeUserId, username);
    }

    public boolean isMutedByAnyId(String anyId) {
        if (!hasActiveRules || anyId == null || anyId.isEmpty()) return false;
        Map<String, SpaceLocalMuteLogic.SpeakerIdentity> dir;
        synchronized (stateLock) {
            dir = speakerDirectory;
        }
        return logic.isMutedByAnyId(anyId, dir);
    }

    public boolean toggleMute(Context ctx, String twitterUserId, String periscopeUserId,
                              String username, String displayName) {
        ensureLoaded(ctx);
        Context persistCtx = ctx != null ? ctx : appContext;
        SpaceLocalMuteLogic.MutedUser entry = new SpaceLocalMuteLogic.MutedUser(
                twitterUserId, periscopeUserId, username, displayName, System.currentTimeMillis());

        boolean nowMuted;
        synchronized (stateLock) {
            nowMuted = logic.toggleMute(entry);
            if (nowMuted) {
                logic.enrichFromDirectory(speakerDirectory);
            }
            hasActiveRules = logic.hasMutedUsers();
            SpaceLocalMutePrefs.saveMutedUsers(persistCtx, logic.getMutedUsers());
            syncAllWebRtcTracksLocked();
        }
        Log.i(LOG_TAG, (nowMuted ? "Muted" : "Unmuted") + " user locally: "
                + entry.displayName + " (@" + entry.username + ")");

        if (!hasActiveRules) {
            restoreExoTrackVolumeImmediate();
        } else {
            reevaluateHlsNow(true);
        }
        notifyListeners();
        return nowMuted;
    }

    public void unmuteAll(Context ctx) {
        ensureLoaded(ctx);
        Context persistCtx = ctx != null ? ctx : appContext;
        synchronized (stateLock) {
            logic.clearAll();
            hasActiveRules = false;
            activelySilencing = false;
            SpaceLocalMutePrefs.saveMutedUsers(persistCtx, logic.getMutedUsers());
            syncAllWebRtcTracksLocked();
        }
        restoreExoTrackVolumeImmediate();
        notifyListeners();
    }

    void onRoomStateUpdated(SpaceLocalMuteSessionTracker.Snapshot snap, boolean justDisconnected) {
        if (snap == null) return;
        boolean stateChanged;
        boolean scheduleHangover = false;
        synchronized (stateLock) {
            spaceConnected = snap.connected;
            speakerDirectory = SpaceLocalMuteLogic.buildDirectoryMap(snap.allSpeakers);
            activeTalkingKeys = snap.activeTalkingKeys != null
                    ? new LinkedHashSet<>(snap.activeTalkingKeys)
                    : Collections.<String>emptySet();

            if (hasActiveRules && logic.enrichFromDirectory(speakerDirectory)) {
                Context ctx = appContext;
                if (ctx != null) {
                    SpaceLocalMutePrefs.saveMutedUsers(ctx, logic.getMutedUsers());
                }
                syncAllWebRtcTracksLocked();
            }

            if (justDisconnected || !snap.connected) {
                logic.resetGateState();
                boolean wasSilencing = activelySilencing;
                activelySilencing = false;
                restoreExoTrackVolumeLocked();
                stateChanged = wasSilencing;
            } else if (!hasActiveRules) {
                boolean wasSilencing = activelySilencing;
                activelySilencing = false;
                if (currentGateGain < 0.999f) {
                    restoreExoTrackVolumeLocked();
                }
                stateChanged = wasSilencing;
            } else {
                long nowMs = SystemClock.elapsedRealtime();
                SpaceLocalMuteLogic.GateDecision dec = logic.evaluateHlsGate(
                        activeTalkingKeys, speakerDirectory, nowMs,
                        strictOverlapMute, SpaceLocalMuteLogic.DEFAULT_HANGOVER_MS);
                boolean prev = activelySilencing;
                activelySilencing = dec.shouldMute;
                stateChanged = (prev != dec.shouldMute);
                currentGateGain = dec.shouldMute ? 0.0f : 1.0f;
                lastRampUptimeMs = nowMs;
                applyExoTrackVolumeLocked();
                if (dec.shouldMute && !dec.mutedTalkingNow) {
                    scheduleHangover = true;
                }
            }
        }
        mainHandler.removeCallbacks(hangoverReleaseCheck);
        if (scheduleHangover) {
            mainHandler.postDelayed(hangoverReleaseCheck, SpaceLocalMuteLogic.DEFAULT_HANGOVER_MS + 40L);
        }
        if (stateChanged) {
            notifyListeners();
        }
    }

    void onHlsPlaybackStopped() {
        boolean wasSilencing;
        synchronized (stateLock) {
            wasSilencing = activelySilencing;
            activelySilencing = false;
            logic.resetGateState();
            restoreExoTrackVolumeLocked();
            activeExoTrackRef = new WeakReference<>(null);
        }
        mainHandler.removeCallbacks(hangoverReleaseCheck);
        if (wasSilencing) {
            notifyListeners();
        }
    }

    void onExoPlaybackTick(AudioTrack audioTrack, float sinkVolume) {
        if (audioTrack == null || sinkVolume <= 0.001f) return;

        boolean isSpaceAudio = SpaceLocalMuteSessionTracker.isHlsSpaceAudioExpected();
        boolean silencingChanged = false;
        synchronized (stateLock) {
            AudioTrack tracked = activeExoTrackRef.get();
            if (!isSpaceAudio) {
                if (tracked == audioTrack && currentGateGain < 0.999f) {
                    lastSinkVolume = sinkVolume;
                    currentGateGain = 1.0f;
                    lastAppliedTrackVolume = -1.0f;
                    safeSetAudioTrackVolume(audioTrack, sinkVolume);
                }
                return;
            }

            if (tracked != audioTrack) {
                if (tracked != null && currentGateGain < 0.999f) {
                    safeSetAudioTrackVolume(tracked, lastSinkVolume);
                }
                activeExoTrackRef = new WeakReference<>(audioTrack);
                lastAppliedTrackVolume = -1.0f;
            }
            lastSinkVolume = sinkVolume;

            if (!hasActiveRules) {
                if (currentGateGain < 0.999f) {
                    currentGateGain = 1.0f;
                    activelySilencing = false;
                    lastAppliedTrackVolume = -1.0f;
                    safeSetAudioTrackVolume(audioTrack, sinkVolume);
                    silencingChanged = true;
                }
                return;
            }

            long nowMs = SystemClock.elapsedRealtime();
            long dtMs = lastRampUptimeMs > 0L ? Math.max(0L, nowMs - lastRampUptimeMs) : 20L;
            lastRampUptimeMs = nowMs;

            SpaceLocalMuteLogic.GateDecision dec = logic.evaluateHlsGate(
                    activeTalkingKeys, speakerDirectory, nowMs,
                    strictOverlapMute, SpaceLocalMuteLogic.DEFAULT_HANGOVER_MS);
            boolean prevSilencing = activelySilencing;
            activelySilencing = dec.shouldMute;
            silencingChanged = (prevSilencing != dec.shouldMute);

            currentGateGain = SpaceLocalMuteLogic.stepVolume(currentGateGain, dec.shouldMute, dtMs);
            applyExoTrackVolumeLocked();
        }
        if (silencingChanged) {
            notifyListeners();
        }
    }

    void onWebRtcRemoteTrackAdded(String userId, Object webRtcAudioTrack) {
        if (userId == null || userId.isEmpty() || webRtcAudioTrack == null) return;
        synchronized (stateLock) {
            webRtcTracksByUserId.put(userId, new WeakReference<>(webRtcAudioTrack));
            webRtcTrackToUserId.put(webRtcAudioTrack, userId);
            if (hasActiveRules && logic.isMutedByAnyId(userId, speakerDirectory)) {
                setWebRtcTrackVolume(webRtcAudioTrack, 0.0d);
            }
        }
    }

    void onWebRtcRemoteTrackRemoved(String userId, Object webRtcAudioTrack) {
        synchronized (stateLock) {
            if (userId != null) {
                WeakReference<Object> ref = webRtcTracksByUserId.get(userId);
                if (ref != null && (ref.get() == null || ref.get() == webRtcAudioTrack)) {
                    webRtcTracksByUserId.remove(userId);
                }
            }
            if (webRtcAudioTrack != null) {
                webRtcTrackToUserId.remove(webRtcAudioTrack);
            }
        }
    }

    void onWebRtcAudioSourceEnabled(Object hydraAudioSource) {
        if (hydraAudioSource == null || !hasActiveRules) return;
        try {
            Object audioTrack = readHydraAudioTrack(hydraAudioSource);
            if (audioTrack == null) return;
            synchronized (stateLock) {
                String userId = webRtcTrackToUserId.get(audioTrack);
                if (userId != null && logic.isMutedByAnyId(userId, speakerDirectory)) {
                    setWebRtcTrackVolume(audioTrack, 0.0d);
                }
            }
        } catch (Throwable ignored) {}
    }

    /**
     * Applies per-speaker local mute to an isolated Android AudioTrack bound to a specific speaker.
     */
    public void onIsolatedAudioTrackTick(String speakerId, AudioTrack androidAudioTrack) {
        if (speakerId == null || speakerId.isEmpty() || androidAudioTrack == null) return;
        synchronized (stateLock) {
            isolatedAndroidTracksByUserId.put(speakerId, new WeakReference<>(androidAudioTrack));
            boolean muted = hasActiveRules && logic.isMutedByAnyId(speakerId, speakerDirectory);
            safeSetAudioTrackVolume(androidAudioTrack, muted ? 0.0f : 1.0f);
        }
    }

    private void reevaluateHlsNow(boolean immediateJump) {
        boolean changed;
        synchronized (stateLock) {
            if (!hasActiveRules || !spaceConnected) {
                boolean prev = activelySilencing;
                activelySilencing = false;
                restoreExoTrackVolumeLocked();
                changed = prev;
            } else {
                long nowMs = SystemClock.elapsedRealtime();
                SpaceLocalMuteLogic.GateDecision dec = logic.evaluateHlsGate(
                        activeTalkingKeys, speakerDirectory, nowMs,
                        strictOverlapMute, SpaceLocalMuteLogic.DEFAULT_HANGOVER_MS);
                boolean prev = activelySilencing;
                activelySilencing = dec.shouldMute;
                changed = (prev != dec.shouldMute);
                if (immediateJump || !dec.shouldMute) {
                    currentGateGain = dec.shouldMute ? 0.0f : 1.0f;
                    lastRampUptimeMs = nowMs;
                    applyExoTrackVolumeLocked();
                }
            }
        }
        if (changed) {
            notifyListeners();
        }
    }

    private void restoreExoTrackVolumeImmediate() {
        mainHandler.removeCallbacks(hangoverReleaseCheck);
        synchronized (stateLock) {
            activelySilencing = false;
            restoreExoTrackVolumeLocked();
        }
    }

    private void restoreExoTrackVolumeLocked() {
        currentGateGain = 1.0f;
        AudioTrack track = activeExoTrackRef.get();
        if (track != null) {
            lastAppliedTrackVolume = lastSinkVolume;
            safeSetAudioTrackVolume(track, lastSinkVolume);
        } else {
            lastAppliedTrackVolume = -1.0f;
        }
    }

    private void applyExoTrackVolumeLocked() {
        AudioTrack track = activeExoTrackRef.get();
        if (track == null) return;
        float desired = Math.max(0.0f, Math.min(1.0f, lastSinkVolume * currentGateGain));
        if (lastAppliedTrackVolume < 0.0f || Math.abs(desired - lastAppliedTrackVolume) >= 0.005f) {
            lastAppliedTrackVolume = desired;
            safeSetAudioTrackVolume(track, desired);
        }
    }

    private void syncAllWebRtcTracksLocked() {
        pruneWebRtcTracksLocked();
        for (Map.Entry<String, WeakReference<Object>> e : webRtcTracksByUserId.entrySet()) {
            Object track = e.getValue().get();
            if (track == null) continue;
            boolean muted = hasActiveRules && logic.isMutedByAnyId(e.getKey(), speakerDirectory);
            setWebRtcTrackVolume(track, muted ? 0.0d : WEBRTC_DEFAULT_VOLUME);
        }
        Iterator<Map.Entry<String, WeakReference<AudioTrack>>> it =
                isolatedAndroidTracksByUserId.entrySet().iterator();
        while (it.hasNext()) {
            Map.Entry<String, WeakReference<AudioTrack>> e = it.next();
            AudioTrack at = e.getValue().get();
            if (at == null) {
                it.remove();
                continue;
            }
            boolean muted = hasActiveRules && logic.isMutedByAnyId(e.getKey(), speakerDirectory);
            safeSetAudioTrackVolume(at, muted ? 0.0f : 1.0f);
        }
    }

    private void pruneWebRtcTracksLocked() {
        Iterator<Map.Entry<String, WeakReference<Object>>> it =
                webRtcTracksByUserId.entrySet().iterator();
        while (it.hasNext()) {
            if (it.next().getValue().get() == null) {
                it.remove();
            }
        }
    }

    private void setWebRtcTrackVolume(Object webRtcAudioTrack, double volume) {
        if (webRtcAudioTrack == null) return;
        try {
            Method m = mWebRtcSetVolume;
            if (m == null) {
                m = webRtcAudioTrack.getClass().getMethod("setVolume", double.class);
                m.setAccessible(true);
                mWebRtcSetVolume = m;
            }
            m.invoke(webRtcAudioTrack, volume);
        } catch (Throwable ignored) {}
    }

    private Object readHydraAudioTrack(Object hydraAudioSource) throws Exception {
        Field f = fHydraAudioSourceTrack;
        if (f == null) {
            f = hydraAudioSource.getClass().getDeclaredField("a");
            f.setAccessible(true);
            fHydraAudioSourceTrack = f;
        }
        return f.get(hydraAudioSource);
    }

    private static void safeSetAudioTrackVolume(AudioTrack track, float volume) {
        if (track == null) return;
        try {
            if (track.getState() == AudioTrack.STATE_INITIALIZED) {
                track.setVolume(volume);
            }
        } catch (Throwable ignored) {}
    }

    private void notifyListeners() {
        mainHandler.post(new Runnable() {
            @Override
            public void run() {
                for (MuteStateListener l : listeners) {
                    try {
                        l.onLocalMuteStateChanged();
                    } catch (Throwable ignored) {}
                }
            }
        });
    }
}
