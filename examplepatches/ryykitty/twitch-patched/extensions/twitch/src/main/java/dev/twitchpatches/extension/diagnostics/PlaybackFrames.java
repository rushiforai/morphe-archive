package dev.twitchpatches.extension.diagnostics;

import android.os.SystemClock;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import com.amazonaws.ivs.player.Statistics;
import java.util.Map;
import java.util.WeakHashMap;
import java.lang.ref.WeakReference;

public final class PlaybackFrames {
    private static final Map<Object, Entry> SAMPLES = new WeakHashMap<>();
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static int nextPlayer;
    private static final FrameSampler.Host HOST = new FrameSampler.Host() {
        @Override public Statistics read(Object player) { return readPlayingStatistics(player); }
        @Override public void schedule(Runnable task) { MAIN.postDelayed(task, 5000); }
        @Override public void cancel(Runnable task) { MAIN.removeCallbacks(task); }
        @Override public void unavailable() { Log.i("TwitchPatchesTrace", "frame sampling stopped; statistics unavailable"); }
        @Override public void record(FrameSampler sampler, Object player, Statistics statistics) {
            synchronized (PlaybackFrames.class) {
                Entry entry = SAMPLES.get(player);
                if (entry != null && entry.sampler == sampler && !sampler.isClosed()) log(entry, statistics);
            }
        }
    };

    public static synchronized void observe(Object player, Statistics statistics) {
        if (player == null || statistics == null) return;
        Entry entry = SAMPLES.get(player);
        if (entry == null || entry.sampler.isClosed()) {
            if (SAMPLES.size() >= 8) {
                for (Entry old : SAMPLES.values()) old.sampler.close();
                SAMPLES.clear();
            }
            entry = new Entry(++nextPlayer, new FrameSampler(new WeakReference<>(player), HOST));
            SAMPLES.put(player, entry); entry.sampler.start();
        }
        log(entry, statistics);
    }

    private static void log(Entry entry, Statistics statistics) {
        String message = entry.progress.sample(SystemClock.elapsedRealtime(), statistics.getDecodedFrames(),
                statistics.getRenderedFrames(), statistics.getDroppedFrames());
        if (message != null) Log.i("TwitchPatchesTrace", "player=" + entry.number + " " + message);
    }

    // Injected SDK state bridge.
    public static Statistics readPlayingStatistics(Object player) {
        throw new IllegalStateException("Frame snapshot bridge was not installed");
    }

    private static final class Entry {
        final int number;
        final FrameProgress progress = new FrameProgress();
        final FrameSampler sampler;
        Entry(int number, FrameSampler sampler) { this.number = number; this.sampler = sampler; }
    }
}
