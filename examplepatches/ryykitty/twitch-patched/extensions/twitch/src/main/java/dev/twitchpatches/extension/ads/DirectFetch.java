package dev.twitchpatches.extension.ads;

import com.amazonaws.ivs.net.HttpClient;
import com.amazonaws.ivs.net.Request;
import com.amazonaws.ivs.net.Response;
import com.amazonaws.ivs.net.ResponseCallback;
import dev.twitchpatches.extension.ads.hls.HlsPlaylist;
import java.net.URI;
import java.util.Collections;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

final class DirectFetch implements AutoCloseable {
    private final HttpClient client;
    private final Set<Request> pending = Collections.newSetFromMap(new ConcurrentHashMap<>());
    private volatile boolean closed;
    DirectFetch(HttpClient client) { this.client = client; }

    String playlist(String url, Request parent, long deadline) throws InterruptedException {
        if (closed || parent.isCancelled() || !HlsPlaylist.twitchUri(URI.create(url))) return null;
        Request request = new Request(url, "GET");
        request.setTimeout(2);
        request.setHeader("Accept", "application/vnd.apple.mpegurl");
        String agent = parent.getHeaders().get("User-Agent");
        if (agent != null) request.setHeader("User-Agent", agent);
        CountDownLatch done = new CountDownLatch(1);
        byte[][] result = new byte[1][];
        pending.add(request);
        try {
            if (closed) return null;
            client.execute(request, new ResponseCallback() {
                @Override public void onError(Exception error) { done.countDown(); }
                @Override public void onResponse(Response response) {
                    if (response.getStatus() != 200) {
                        android.util.Log.i("TwitchPatchesAds", "Alternate HTTP status " + response.getStatus());
                        done.countDown(); return;
                    }
                    response.readContent(new PlaylistBody(new PlaylistBody.Completion() {
                        @Override public void complete(byte[] body) { result[0] = body; done.countDown(); }
                        @Override public void error(Exception error) { done.countDown(); }
                    }));
                }
            });
            while (!closed && !parent.isCancelled()) {
                long remaining = deadline - System.nanoTime();
                if (remaining <= 0) return null;
                if (done.await(Math.min(remaining, TimeUnit.MILLISECONDS.toNanos(50)), TimeUnit.NANOSECONDS))
                    return result[0] == null ? null : PlaylistBody.text(result[0]);
            }
            return null;
        } finally { pending.remove(request); request.cancel(); }
    }

    @Override public void close() {
        closed = true;
        for (Request request : pending) request.cancel();
        pending.clear();
    }
}
