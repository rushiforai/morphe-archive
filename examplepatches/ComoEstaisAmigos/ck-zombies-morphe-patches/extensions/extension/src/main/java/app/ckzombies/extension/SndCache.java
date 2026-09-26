package app.ckzombies.extension;

import android.media.MediaPlayer;
import android.util.Log;

import java.io.File;
import java.util.ArrayList;

/**
 * What InitialiseSoundEvent hands back to the engine, in three tiers.
 *
 *   1. a PoolPlayer  - audio from a decoded SoundPool sample; costs nothing per play,
 *                      and overlapping copies of one sound are free
 *   2. a ShimPlayer  - a real MediaPlayer, kept prepared and rewound instead of rebuilt;
 *                      covers a sound the first few times, while tier 1 decodes it
 *   3. null          - caller falls through to the stock build-and-prepare path
 *
 * Tier 1 warms itself: the first request for a path starts the decode in the background
 * and is served by tier 2, and every later request is served by tier 1.
 */
public class SndCache {

    static final String TAG = "SNDCACHE";
    static final int MAX = 16;

    static final ArrayList<ShimPlayer> pool = new ArrayList<ShimPlayer>();
    static final ArrayList<PoolPlayer> handles = new ArrayList<PoolPlayer>();

    static boolean small(String path) {
        try {
            long n = new File(path).length();
            return n > 0 && n <= ShimPlayer.MAX_POOLED_BYTES;
        } catch (Throwable t) {
            return false;
        }
    }

    /** A recycled handle, or a new one. These are reused across every sound. */
    static PoolPlayer freeHandle() {
        for (int i = 0; i < handles.size(); i++) {
            PoolPlayer p = handles.get(i);
            if (!p.busy) {
                return p;
            }
        }
        PoolPlayer p = new PoolPlayer();
        handles.add(p);
        Log.i(TAG, "handles=" + handles.size());
        return p;
    }

    public static synchronized MediaPlayer get(String path) {
        if (small(path)) {
            int sid = PoolPlayer.sampleFor(path);
            if (sid >= 0) {
                PoolPlayer p = freeHandle();
                p.bind(path, sid);
                p.busy = true;
                return p;
            }
        }
        for (int i = 0; i < pool.size(); i++) {
            ShimPlayer p = pool.get(i);
            if (!p.busy && path.equals(p.sndPath)) {
                p.busy = true;
                p.reuse();
                pool.remove(i);
                pool.add(p);
                return p;
            }
        }
        return null;
    }

    public static synchronized void put(ShimPlayer p) {
        if (p == null || !p.poolable) {
            return;
        }
        p.busy = true;
        pool.add(p);
        while (pool.size() > MAX) {
            int idx = -1;
            for (int i = 0; i < pool.size(); i++) {
                if (!pool.get(i).busy) {
                    idx = i;
                    break;
                }
            }
            if (idx < 0) {
                break;
            }
            ShimPlayer d = pool.remove(idx);
            d.hardRelease();
        }
    }
}
