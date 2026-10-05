package dev.twitchpatches.extension.ads;

import android.util.Log;
import com.amazonaws.ivs.net.HttpClient;
import com.amazonaws.ivs.net.Method;
import com.amazonaws.ivs.net.Request;
import com.amazonaws.ivs.net.Response;
import com.amazonaws.ivs.net.ResponseCallback;
import dev.twitchpatches.extension.ads.hls.HlsPlaylist;
import java.net.URI;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

public final class AdHttpClient implements HttpClient {
    private final HttpClient original;
    private final ThreadPoolExecutor worker = new ThreadPoolExecutor(2, 2, 30, TimeUnit.SECONDS,
            new ArrayBlockingQueue<>(16), task -> new Thread(task, "TwitchPatchPlaylist"));
    private final PlaylistSessions sessions;
    private volatile boolean released;

    public AdHttpClient(HttpClient original) {
        this.original = original;
        this.sessions = new PlaylistSessions(original);
        worker.allowCoreThreadTimeOut(true);
    }

    @Override public String description() { return original.description(); }

    @Override public void execute(Request request, ResponseCallback callback) {
        if (released || request.getMethod() != Method.GET || !playlistUrl(request.getUrl())) {
            original.execute(request, callback);
            return;
        }
        original.execute(request, new ResponseCallback() {
            @Override public void onError(Exception error) { deliverError(request, callback, error); }
            @Override public void onResponse(Response response) {
                if (response.getStatus() != 200) { deliver(request, callback, response); return; }
                response.readContent(new PlaylistBody(new PlaylistBody.Completion() {
                    @Override public void error(Exception error) { deliverError(request, callback, error); }
                    @Override public void complete(byte[] body) {
                        Runnable process = () -> {
                            if (released || request.isCancelled()) return;
                            long revision = AdRuntime.policyRevision();
                            String text = PlaylistBody.text(body);
                            try {
                                text = sessions.transform(request, response.getUrl(), text, AdSettings.enabled(2));
                            } catch (IllegalArgumentException exception) {
                                Log.i("TwitchPatchesAds", "Unsupported playlist; original playback retained");
                            }
                            byte[] transformed = revision == AdRuntime.policyRevision() ? text.getBytes(StandardCharsets.UTF_8) : body;
                            deliver(request, callback, PlaylistBody.response(request, response, transformed));
                        };
                        try { worker.execute(process); }
                        catch (RejectedExecutionException exception) {
                            deliver(request, callback, PlaylistBody.response(request, response, body));
                        }
                    }
                }));
            }
        });
    }

    private static boolean playlistUrl(String url) {
        try {
            URI uri = URI.create(url);
            return HlsPlaylist.twitchUri(uri) && uri.getPath() != null && uri.getPath().endsWith(".m3u8");
        } catch (IllegalArgumentException exception) { return false; }
    }

    private static void deliver(Request request, ResponseCallback callback, Response response) {
        synchronized (request.lock()) { if (!request.isCancelled()) callback.onResponse(response); }
    }
    private static void deliverError(Request request, ResponseCallback callback, Exception error) {
        synchronized (request.lock()) { if (!request.isCancelled()) callback.onError(error); }
    }

    @Override public void release() {
        released = true;
        sessions.close();
        worker.shutdownNow();
        original.release();
    }
}
