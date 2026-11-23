package app.voidhack.extension.twitter.spaces.mute;

import android.media.AudioTrack;
import android.util.Log;

import java.lang.reflect.Field;
import java.util.Collections;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Static bytecode-hook entry points for the public Spaces local mute patch.
 * Every method catches Throwable so a hook error can never crash the host app.
 */
@SuppressWarnings("unused")
public final class SpaceLocalMuteHooks {
    private static final String LOG_TAG = "VoidhackSpaceMute";
    private static final Map<Object, Float> MEDIA3_VOLUMES =
            Collections.synchronizedMap(new WeakHashMap<Object, Float>());

    private static volatile boolean hooksActive;
    private static volatile Field fExo2AudioTrack;
    private static volatile Field fExo2Volume;

    private SpaceLocalMuteHooks() {}

    public static boolean isActive() {
        return hooksActive;
    }

    public static void attachLiveSpaceHeader(Object liveViewDelegate) {
        hooksActive = true;
        try {
            SpaceLocalMuteUi.attachToViewDelegate(liveViewDelegate, false);
        } catch (Throwable ignored) {}
    }

    public static void attachReplaySpaceHeader(Object replayViewDelegate) {
        hooksActive = true;
        try {
            SpaceLocalMuteUi.attachToViewDelegate(replayViewDelegate, true);
        } catch (Throwable ignored) {}
    }

    public static void attachProfileLocalMute(Object profileViewDelegate, Object profileState) {
        hooksActive = true;
        try {
            SpaceLocalMuteUi.attachProfileLocalMute(profileViewDelegate, profileState);
        } catch (Throwable ignored) {}
    }

    public static void onRoomState(Object b4RoomState) {
        hooksActive = true;
        try {
            SpaceLocalMuteSessionTracker.onRoomState(b4RoomState);
        } catch (Throwable ignored) {}
    }

    public static void onHlsPlaybackStarted(Object audioSpaceMetaJ, Object playbackMode) {
        hooksActive = true;
        try {
            SpaceLocalMuteSessionTracker.onHlsPlaybackStarted(audioSpaceMetaJ, playbackMode);
        } catch (Throwable ignored) {}
    }

    public static void onHlsPlaybackStopped() {
        try {
            SpaceLocalMuteSessionTracker.onHlsPlaybackStopped();
        } catch (Throwable ignored) {}
    }

    public static void onMedia3SetVolume(Object audioTrackAudioOutput, float volume) {
        try {
            if (audioTrackAudioOutput != null) {
                MEDIA3_VOLUMES.put(audioTrackAudioOutput, volume);
            }
        } catch (Throwable ignored) {}
    }

    public static void onMedia3AudioTick(Object audioTrackAudioOutput, AudioTrack audioTrack) {
        try {
            SpaceLocalMuteController ctrl = SpaceLocalMuteController.get();
            if (audioTrack == null || (!ctrl.hasActiveMuteRules() && !ctrl.isActivelySilencing())) {
                return;
            }
            Float vol = audioTrackAudioOutput != null ? MEDIA3_VOLUMES.get(audioTrackAudioOutput) : null;
            ctrl.onExoPlaybackTick(audioTrack, vol != null ? vol : 1.0f);
        } catch (Throwable t) {
            Log.w(LOG_TAG, "onMedia3AudioTick error", t);
        }
    }

    public static void onExo2AudioTick(Object defaultAudioSink) {
        try {
            if (defaultAudioSink == null) return;
            SpaceLocalMuteController ctrl = SpaceLocalMuteController.get();
            if (!ctrl.hasActiveMuteRules() && !ctrl.isActivelySilencing()) {
                return;
            }
            resolveExo2Fields(defaultAudioSink.getClass());
            AudioTrack track = fExo2AudioTrack != null ? (AudioTrack) fExo2AudioTrack.get(defaultAudioSink) : null;
            float volume = fExo2Volume != null ? fExo2Volume.getFloat(defaultAudioSink) : 1.0f;
            if (track != null) {
                ctrl.onExoPlaybackTick(track, volume);
            }
        } catch (Throwable t) {
            Log.w(LOG_TAG, "onExo2AudioTick error", t);
        }
    }

    public static void onWebRtcRemoteTrackAdded(String userId, Object webRtcAudioTrack) {
        hooksActive = true;
        try {
            SpaceLocalMuteController.get().onWebRtcRemoteTrackAdded(userId, webRtcAudioTrack);
        } catch (Throwable ignored) {}
    }

    public static void onWebRtcRemoteTrackRemoved(String userId, Object webRtcAudioTrack) {
        try {
            SpaceLocalMuteController.get().onWebRtcRemoteTrackRemoved(userId, webRtcAudioTrack);
        } catch (Throwable ignored) {}
    }

    public static void onWebRtcAudioSourceEnabled(Object hydraAudioSource) {
        try {
            SpaceLocalMuteController.get().onWebRtcAudioSourceEnabled(hydraAudioSource);
        } catch (Throwable ignored) {}
    }

    private static void resolveExo2Fields(Class<?> cls) {
        if (fExo2AudioTrack != null) return;
        try {
            Field fv = cls.getDeclaredField("v");
            fv.setAccessible(true);
            Field fn = cls.getDeclaredField("N");
            fn.setAccessible(true);
            fExo2AudioTrack = fv;
            fExo2Volume = fn;
        } catch (Throwable ignored) {}
    }
}
