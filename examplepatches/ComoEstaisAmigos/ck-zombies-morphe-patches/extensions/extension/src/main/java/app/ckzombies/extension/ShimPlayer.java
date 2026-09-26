package app.ckzombies.extension;

import android.media.MediaPlayer;

/**
 * A MediaPlayer that can be parked and replayed instead of rebuilt.
 *
 * The engine asks GluCallback.InitialiseSoundEvent for a MediaPlayer per sound
 * event and then drives it over JNI (start/stop/pause/seekTo/setVolume/
 * setLooping/release). Building one costs ~34 ms, of which prepare() is ~10 ms
 * and blocks, which is the hitch you hear on every shot.
 *
 * None of those methods is final and MediaPlayer itself is not final, so the
 * engine's cached jmethodIDs dispatch virtually into these overrides. The
 * native library is untouched.
 *
 * stop() must not really stop: from Stopped the player would need another
 * prepare() before it could start again, which is the cost we are removing.
 * pause()+seekTo(0) leaves it in Paused, from which start() is legal and cheap.
 * Only short effects are pooled; anything large keeps stock behaviour.
 */
public class ShimPlayer extends MediaPlayer {

    public static final long MAX_POOLED_BYTES = 524288;

    public String sndPath;
    public boolean busy;
    public boolean poolable;

    /** The volume the engine last set. */
    float leftVolume = 1.0f;
    float rightVolume = 1.0f;

    public ShimPlayer(String path) {
        super();
        sndPath = path;
        poolable = SndCache.small(path);
    }

    /** Actually free it; used by the cache when evicting. */
    public void hardRelease() {
        try {
            super.release();
        } catch (Throwable t) {
        }
    }

    private void rewind() {
        try {
            if (super.isPlaying()) {
                super.pause();
            }
        } catch (Throwable t) {
        }
        try {
            super.seekTo(0);
        } catch (Throwable t) {
        }
    }

    @Override
    public void setVolume(float left, float right) {
        leftVolume = left;
        rightVolume = right;
        super.setVolume(left, right);
    }

    /**
     * Puts a parked player back the way a freshly built one starts: at the beginning, not
     * looping, at full volume. The engine expects that, because CSoundEvent_Android::Play() only
     * sets looping and starts, and it sets the volume only when a sound's gain changes. When a
     * mission closes before its briefing ends, the engine fades the voice out to nothing first,
     * so without this the next briefing would start silent on the same player.
     */
    void reuse() {
        try {
            super.setLooping(false);
        } catch (Throwable t) {
        }
        try {
            setVolume(1.0f, 1.0f);
        } catch (Throwable t) {
        }
        try {
            super.seekTo(0);
        } catch (Throwable t) {
        }
    }

    @Override
    public void stop() {
        if (!poolable) {
            super.stop();
            return;
        }
        rewind();
    }

    @Override
    public void release() {
        if (!poolable) {
            super.release();
            return;
        }
        rewind();
        busy = false;
    }
}
