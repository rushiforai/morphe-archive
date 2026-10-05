package dev.twitchpatches.extension.diagnostics;

import android.util.Log;
import com.amazonaws.ivs.net.HttpClient;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

public final class PlaybackTrace {
    private static final ThreadPoolExecutor CUES = new ThreadPoolExecutor(1, 1, 30, TimeUnit.SECONDS,
            new ArrayBlockingQueue<>(16), task -> new Thread(task, "TwitchPatchCueTrace"));
    static { CUES.allowCoreThreadTimeOut(true); }

    public static HttpClient wrap(HttpClient original) { return new PlaybackHttpClient(original); }

    public static void cue(String payload) {
        if (payload == null || payload.length() > 8192) return;
        try { CUES.execute(() -> {
            String category = payload.contains("twitch-stitched-ad") ? "stitched ad cue" :
                    payload.contains("twitch-maf-ad") ? "MAF ad cue" :
                    payload.contains("twitch-stream-source") ? "stream source cue" : null;
            if (category != null) Log.i("TwitchPatchesTrace", category);
        }); } catch (RejectedExecutionException exception) { /* Diagnostics queue full. */ }
    }
}
