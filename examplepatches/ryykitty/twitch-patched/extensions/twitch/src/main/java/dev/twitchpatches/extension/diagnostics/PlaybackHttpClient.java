package dev.twitchpatches.extension.diagnostics;

import android.util.Log;
import com.amazonaws.ivs.net.*;
import dev.twitchpatches.extension.ads.hls.HlsPlaylist;
import java.net.URI;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;

final class PlaybackHttpClient implements HttpClient {
    private static final AtomicInteger CLIENTS = new AtomicInteger();
    private final int client = CLIENTS.incrementAndGet();
    private final HttpClient original;
    private final ThreadPoolExecutor worker = new ThreadPoolExecutor(1, 1, 30, TimeUnit.SECONDS,
            new ArrayBlockingQueue<>(8), task -> new Thread(task, "TwitchPatchHlsTrace"));
    private volatile boolean released;
    private String previous;
    private long lastLog;

    PlaybackHttpClient(HttpClient original) { this.original = original; worker.allowCoreThreadTimeOut(true); }
    @Override public String description() { return original.description(); }
    @Override public void execute(Request request, ResponseCallback callback) {
        if (released || request.getMethod() != Method.GET || !playlist(request.getUrl())) {
            original.execute(request, callback); return;
        }
        original.execute(request, new ResponseCallback() {
            @Override public void onError(Exception error) { callback.onError(error); }
            @Override public void onResponse(Response response) {
                if (response.getStatus() != 200) { callback.onResponse(response); return; }
                callback.onResponse(new Response(response.getStatus(), response.getUrl()) {
                    @Override public String getHeader(String name) { return response.getHeader(name); }
                    @Override public void readContent(ReadCallback consumer) {
                        response.readContent(new PlaylistTee(consumer, body -> observe(request, body)));
                    }
                });
            }
        });
    }

    private void observe(Request request, byte[] body) {
        if (released || request.isCancelled()) return;
        try { worker.execute(() -> {
            if (released || request.isCancelled()) return;
            String shape = PlaylistShape.summarize(new String(body, java.nio.charset.StandardCharsets.UTF_8));
            long now = System.nanoTime();
            if (!shape.equals(previous) || now - lastLog > TimeUnit.SECONDS.toNanos(5)) {
                Log.i("TwitchPatchesTrace", "client=" + client + " " + shape); previous = shape; lastLog = now;
            }
        }); } catch (RejectedExecutionException exception) { /* Diagnostics queue full. */ }
    }

    private static boolean playlist(String url) {
        try {
            URI uri = URI.create(url);
            return HlsPlaylist.twitchUri(uri) && uri.getPath() != null && uri.getPath().endsWith(".m3u8");
        } catch (IllegalArgumentException exception) { return false; }
    }

    @Override public void release() { released = true; worker.shutdownNow(); original.release(); }
}
