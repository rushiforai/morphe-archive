package app.ckzombies.extension;

import android.media.AudioManager;
import android.media.MediaMetadataRetriever;
import android.media.MediaPlayer;
import android.media.SoundPool;
import android.os.Handler;
import android.os.Looper;

import java.util.HashMap;
import java.util.HashSet;

/**
 * A MediaPlayer whose audio actually comes from a SoundPool sample.
 *
 * The engine never touches the MediaPlayer machinery in one of these: it only calls
 * setLooping / start / pause / stop / setVolume / release over JNI (seekTo and
 * getCurrentPosition exist as wrappers in CJavaMediaPlayer but nothing calls them --
 * checked by cross-referencing the library). All six are overridden here, so the
 * superclass stays Idle and its decoder is never created. That is the whole win: a
 * SoundPool sample is decoded once and every later play costs nothing.
 *
 * SoundPool has no completion callback, and the engine needs one --
 * GluPlatformActivity$1 -> GluPlatformActivityJNI.SoundEventCompleted -- or a sound
 * event never ends. It is synthesised from the sample duration, read once per file
 * with MediaMetadataRetriever. A generation counter drops stale timers so a stopped
 * or recycled player cannot fire a completion for a sound that is long gone.
 *
 * Only sounds whose decoded audio fits SoundPool's buffer come here; SoundBudget decides,
 * and the rest stay with the MediaPlayer tier, which plays them whole.
 */
public class PoolPlayer extends MediaPlayer {

    static final String TAG = "SNDPOOL";
    static final int MAX_STREAMS = 16;

    static SoundPool sp;
    static final HashMap<String, Integer> sampleOf = new HashMap<String, Integer>();
    static final HashMap<String, Integer> durOf = new HashMap<String, Integer>();
    static final HashMap<Integer, String> loading = new HashMap<Integer, String>();
    static final HashSet<String> requested = new HashSet<String>();
    /** Paths tier 1 must never serve: no readable duration, or too long for SoundPool. */
    static final HashSet<String> tier2Only = new HashSet<String>();

    // SoundPool.Builder needs API 21, and the game still installs down to API 7.
    @SuppressWarnings("deprecation")
    static synchronized void init() {
        if (sp != null) {
            return;
        }
        sp = new SoundPool(MAX_STREAMS, AudioManager.STREAM_MUSIC, 0);
        sp.setOnLoadCompleteListener(new SoundPool.OnLoadCompleteListener() {
            public void onLoadComplete(SoundPool pool, int sampleId, int status) {
                synchronized (PoolPlayer.class) {
                    String path = loading.remove(Integer.valueOf(sampleId));
                    if (path != null && status == 0) {
                        sampleOf.put(path, Integer.valueOf(sampleId));
                        android.util.Log.i(TAG, "ready " + sampleOf.size() + " " + path);
                    }
                }
            }
        });
    }

    /** Sample id if this path is decoded and ready, else -1 (and a load is kicked off). */
    static synchronized int sampleFor(String path) {
        init();
        Integer id = sampleOf.get(path);
        if (id != null) {
            return id.intValue();
        }
        if (tier2Only.contains(path)) {
            return -1;
        }
        if (!requested.contains(path)) {
            requested.add(path);
            warm(path);
        }
        return -1;
    }

    /** Read the duration and hand the file to SoundPool, off the caller's thread. */
    static void warm(final String path) {
        new Thread(new Runnable() {
            public void run() {
                int dur = 0;
                MediaMetadataRetriever r = null;
                try {
                    r = new MediaMetadataRetriever();
                    r.setDataSource(path);
                    String s = r.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DURATION);
                    if (s != null) {
                        dur = Integer.parseInt(s.trim());
                    }
                } catch (Throwable t) {
                } finally {
                    try {
                        if (r != null) {
                            r.release();
                        }
                    } catch (Throwable t) {
                    }
                }
                int[] format = SoundBudget.vorbisFormat(path);
                synchronized (PoolPlayer.class) {
                    if (dur <= 0) {
                        // No duration means no synthesised completion, and without that the
                        // engine never learns the sound ended and stops replaying it. Leave
                        // this one to the prepared-MediaPlayer tier, which needs no metadata.
                        // This is also what happens wholesale below API 10, where
                        // MediaMetadataRetriever does not exist: the build degrades to the
                        // pooled-MediaPlayer behaviour instead of breaking.
                        tier2Only.add(path);
                        android.util.Log.i(TAG, "no duration, tier 2 " + path);
                        return;
                    }
                    if (!SoundBudget.fitsSoundPool(dur, format)) {
                        // SoundPool would keep the first 1 MiB of decoded audio and drop the rest
                        // without an error, so a briefing would stop mid-sentence.
                        tier2Only.add(path);
                        android.util.Log.i(TAG, "too long for SoundPool, tier 2 " + path);
                        return;
                    }
                    durOf.put(path, Integer.valueOf(dur));
                    try {
                        int id = sp.load(path, 1);
                        loading.put(Integer.valueOf(id), path);
                    } catch (Throwable t) {
                        tier2Only.add(path);
                    }
                }
            }
        }).start();
    }

    // ---- instance ----

    public String path;
    public boolean busy;
    int sampleId = -1;
    int durationMs;
    int streamId;
    int gen;
    boolean looping;
    float lvol = 1.0f;
    float rvol = 1.0f;
    MediaPlayer.OnCompletionListener listener;
    final Handler handler = new Handler(Looper.getMainLooper());

    /** Point this handle at a decoded sample. */
    void bind(String p, int sid) {
        path = p;
        sampleId = sid;
        Integer d = durOf.get(p);
        durationMs = (d == null) ? 0 : d.intValue();
        looping = false;
        lvol = 1.0f;
        rvol = 1.0f;
        streamId = 0;
        gen++;
    }

    @Override
    public void setOnCompletionListener(OnCompletionListener l) {
        listener = l;
    }

    @Override
    public void setLooping(boolean loop) {
        looping = loop;
    }

    @Override
    public void setVolume(float l, float r) {
        lvol = l;
        rvol = r;
        if (streamId != 0) {
            try {
                sp.setVolume(streamId, l, r);
            } catch (Throwable t) {
            }
        }
    }

    @Override
    public void start() {
        final int myGen = ++gen;
        try {
            streamId = sp.play(sampleId, lvol, rvol, 1, looping ? -1 : 0, 1.0f);
        } catch (Throwable t) {
            streamId = 0;
        }
        if (looping || durationMs <= 0) {
            return;
        }
        handler.postDelayed(new Runnable() {
            public void run() {
                fire(myGen);
            }
        }, durationMs);
    }

    /** The synthesised end-of-playback, ignored if anything moved on since. */
    void fire(int myGen) {
        OnCompletionListener l;
        synchronized (this) {
            if (myGen != gen || listener == null) {
                return;
            }
            l = listener;
            streamId = 0;
        }
        try {
            l.onCompletion(this);
        } catch (Throwable t) {
        }
    }

    private void quiet() {
        gen++;
        if (streamId != 0) {
            try {
                sp.stop(streamId);
            } catch (Throwable t) {
            }
            streamId = 0;
        }
    }

    @Override
    public void pause() {
        if (streamId != 0) {
            try {
                sp.pause(streamId);
            } catch (Throwable t) {
            }
        }
    }

    @Override
    public void stop() {
        quiet();
    }

    @Override
    public void release() {
        quiet();
        busy = false;
    }
}
