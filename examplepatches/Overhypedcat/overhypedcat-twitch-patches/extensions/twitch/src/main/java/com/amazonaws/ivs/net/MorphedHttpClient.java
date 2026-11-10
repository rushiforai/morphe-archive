package com.amazonaws.ivs.net;

import java.io.ByteArrayOutputStream;
import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import android.widget.Toast;

import app.morphed.extension.twitch.adblock.RequestStats;
import app.morphed.extension.twitch.hls.UrlKey;
import app.morphed.extension.twitch.patches.DebugLog;
import app.morphed.extension.twitch.patches.StreamAdsPatch;

/**
 * Wraps the IVS player's HTTP client and lets {@link StreamAdsPatch} rewrite live playlists.
 * Lives in the IVS package because {@link ReadCallback} and {@link StreamConsumer} are package-private.
 */
@SuppressWarnings("unused")
public final class MorphedHttpClient implements HttpClient {
    // Backup searches make their own network calls, so keep them off the player's network threads.
    private static final ExecutorService EXECUTOR = Executors.newCachedThreadPool(runnable -> {
        Thread thread = new Thread(runnable, "TwitchMorphed-playlist");
        thread.setDaemon(true);
        return thread;
    });

    private static volatile boolean setupFailureShown;

    private final HttpClient delegate;

    private MorphedHttpClient(HttpClient delegate) {
        this.delegate = delegate;
    }

    /** Injected at the end of {@code HttpClientFactory.create()}. */
    public static HttpClient wrap(HttpClient client) {
        return wrap(client, () -> {
            DebugLog.resumeIfEnabled();
            StreamAdsPatch.prepare();
        });
    }

    /** {@code setup} readies the ad blocker; if it fails, the player keeps its own client. */
    static HttpClient wrap(HttpClient client, Runnable setup) {
        if (client == null || client instanceof MorphedHttpClient) return client;
        try {
            setup.run();
            DebugLog.log("Player HTTP client created: " + client.description());
            return new MorphedHttpClient(client);
        } catch (Throwable t) {
            // Setting up the ad blocker failed: the player keeps its own client so video still plays.
            reportSetupFailure(t);
            return client;
        }
    }

    /**
     * Tells the user that stream ads are not blocked. The failure can be StreamAdsPatch's own setup,
     * so its error reporting cannot be relied on: then a message is shown directly.
     */
    private static void reportSetupFailure(Throwable t) {
        Log.e("TwitchMorphed", "Ad blocker setup failed", t);
        try {
            StreamAdsPatch.setupFailed(t);
            return;
        } catch (Throwable ignored) {
            // StreamAdsPatch itself is broken: fall through to the direct message.
        }
        if (setupFailureShown) return;
        setupFailureShown = true;
        new Handler(Looper.getMainLooper()).post(() -> {
            try {
                Context context = (Context) Class.forName("android.app.ActivityThread")
                        .getMethod("currentApplication").invoke(null);
                if (context != null) {
                    Toast.makeText(context, "Ad blocker needs an update (E3)\nSetup failed, ads may play\n" + t,
                            Toast.LENGTH_LONG).show();
                }
            } catch (Throwable shown) {
                Log.e("TwitchMorphed", "Could not show the setup failure", shown);
            }
        });
    }

    @Override
    public String description() {
        return delegate.description();
    }

    @Override
    public void release() {
        delegate.release();
    }

    @Override
    public void execute(Request request, ResponseCallback callback) {
        String url = request.getUrl();
        long start = SystemClock.elapsedRealtime();
        if (!StreamAdsPatch.shouldInspect(url)) {
            // Timed only while the detailed log is on, so normal playback pays nothing for it.
            delegate.execute(request, DebugLog.isOn() ? timed(url, start, callback) : callback);
            return;
        }
        delegate.execute(request, new ResponseCallback() {
            @Override
            public void onError(Exception exception) {
                logRequest(url, start, -1, exception);
                callback.onError(exception);
            }

            @Override
            public void onResponse(Response response) {
                if (response.getStatus() != 200) {
                    logRequest(url, start, response.getStatus(), null);
                    callback.onResponse(response);
                    return;
                }
                response.readContent(new BodyCollector(request) {
                    @Override
                    void onBody(byte[] body) {
                        long downloaded = SystemClock.elapsedRealtime();
                        EXECUTOR.execute(() -> deliver(request, response, callback, url, body, start, downloaded));
                    }

                    @Override
                    public void onError(Exception exception) {
                        logRequest(url, start, -1, exception);
                        callback.onError(exception);
                    }
                });
            }
        });
    }

    private static void deliver(Request request, Response response, ResponseCallback callback, String url,
                                byte[] body, long start, long downloaded) {
        // The player may have given up on this request (left the stream, switched quality, timed out).
        if (request.isCancelled()) {
            if (DebugLog.isOn()) DebugLog.log("Playlist " + UrlKey.of(url) + " cancelled before processing");
            return;
        }
        long processingStart = SystemClock.elapsedRealtime();
        byte[] output = body;
        try {
            String original = new String(body, StandardCharsets.UTF_8);
            String rewritten = StreamAdsPatch.process(url, original);
            if (rewritten != null && !rewritten.equals(original)) {
                output = rewritten.getBytes(StandardCharsets.UTF_8);
            }
        } catch (Throwable t) {
            // Fall back to the original body; playback must never break because of the ad blocker.
            // (process() reports its own failures; this is reading or encoding the body.)
            output = body;
            try {
                StreamAdsPatch.deliveryFailed(url, t);
            } catch (Throwable reportFailed) {
                // The playlist must still be answered below, or the player waits for its timeout.
                Log.e("TwitchMorphed", "Playlist processing failed for " + url, t);
            }
        }
        // Same rule as IVS's own callbacks: the native side is only called under the request lock and
        // never for a cancelled request, whose native object may already be gone.
        synchronized (request.lock()) {
            if (request.isCancelled()) {
                if (DebugLog.isOn()) DebugLog.log("Playlist " + UrlKey.of(url) + " cancelled during processing");
                return;
            }
            boolean answered = false;
            try {
                if (response.getHeader("Content-Length") != null) {
                    response.setHeader("Content-Length", String.valueOf(output.length));
                }
                response.setConsumer(null, new BytesConsumer(request, output));
                answered = true;
                callback.onResponse(response);
            } catch (Throwable t) {
                // Without an answer the player would wait for its 10 second timeout.
                try {
                    StreamAdsPatch.deliveryFailed(url, t);
                } catch (Throwable reportFailed) {
                    Log.e("TwitchMorphed", "Playlist delivery failed for " + url, t);
                }
                if (!answered) callback.onError(t instanceof Exception ? (Exception) t : new RuntimeException(t));
                return;
            }
        }

        if (DebugLog.isOn()) {
            long end = SystemClock.elapsedRealtime();
            RequestStats.record(end - start, true);
            DebugLog.log("Playlist " + UrlKey.of(url) + " -> 200, download " + (downloaded - start) + "ms, waited "
                    + (processingStart - downloaded) + "ms, processing " + (end - processingStart) + "ms, "
                    + body.length + " -> " + output.length + " bytes" + (output == body ? "" : " (rewritten)"));
        }
    }

    private static ResponseCallback timed(String url, long start, ResponseCallback callback) {
        return new ResponseCallback() {
            @Override
            public void onError(Exception exception) {
                logRequest(url, start, -1, exception);
                callback.onError(exception);
            }

            @Override
            public void onResponse(Response response) {
                logRequest(url, start, response.getStatus(), null);
                callback.onResponse(response);
            }
        };
    }

    /** One player request in the detailed log; the time is until the response headers arrived. */
    private static void logRequest(String url, long start, int status, Exception error) {
        if (!DebugLog.isOn()) return;
        long ms = SystemClock.elapsedRealtime() - start;
        RequestStats.record(ms, error == null && status < 400);
        DebugLog.log("Player " + UrlKey.of(url) + " -> " + (error != null ? "failed: " + error : status) + " in " + ms + "ms");
    }

    /** Collects a response body that IVS hands out in chunks. */
    private abstract static class BodyCollector implements ReadCallback {
        private final Request request;
        private final ByteArrayOutputStream body = new ByteArrayOutputStream();

        BodyCollector(Request request) {
            this.request = request;
        }

        abstract void onBody(byte[] body);

        @Override
        public int getTimeout() {
            return request.getTimeout();
        }

        @Override
        public void onData(ByteBuffer buffer, boolean isLast) {
            byte[] chunk = new byte[buffer.remaining()];
            buffer.get(chunk);
            body.write(chunk, 0, chunk.length);
            if (isLast) onBody(body.toByteArray());
        }

        @Override
        public void onData(byte[] bytes, int length, boolean isLast) {
            body.write(bytes, 0, length);
            if (isLast) onBody(body.toByteArray());
        }
    }

    /** Hands a finished body to the player in one direct buffer, like IVS's own consumer. */
    private static final class BytesConsumer implements StreamConsumer {
        private final Request request;
        private final byte[] body;

        BytesConsumer(Request request, byte[] body) {
            this.request = request;
            this.body = body;
        }

        @Override
        public void consume(ReadCallback readCallback) {
            synchronized (request.lock()) {
                if (request.isCancelled()) return;
                ByteBuffer buffer = ByteBuffer.allocateDirect(body.length);
                buffer.put(body);
                buffer.flip();
                readCallback.onData(buffer, true);
            }
        }
    }
}
