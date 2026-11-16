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

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import app.morphed.extension.twitch.App;
import app.morphed.extension.twitch.Included;
import app.morphed.extension.twitch.Messages;
import app.morphed.extension.twitch.adblock.RequestStats;
import app.morphed.extension.twitch.musicfilter.SongRemoval;
import app.morphed.extension.twitch.net.Web;
import app.morphed.extension.twitch.settings.PatchSettings;
import app.morphed.extension.twitch.unlock.QualityUnlock;
import app.morphed.extension.twitch.hls.UrlKey;
import app.morphed.extension.twitch.patches.DebugLog;
import app.morphed.extension.twitch.patches.Watching;
import app.morphed.extension.twitch.patches.StreamAdsPatch;

/**
 * Wraps the IVS player's HTTP client: the one place every player request passes. The ad blocker
 * ({@link StreamAdsPatch}) rewrites live playlists here, the quality unlock routes an unlocked stream through the
 * VPN, song removal learns which stream plays, and Debug mode logs the requests.
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

    /** {@code setup} readies the patches; if it fails, the player keeps its own client. */
    static HttpClient wrap(HttpClient client, Runnable setup) {
        if (client == null || client instanceof MorphedHttpClient) return client;
        try {
            setup.run();
            DebugLog.log("Player HTTP client created: " + client.description());
            return new MorphedHttpClient(client);
        } catch (Throwable t) {
            // Setting up failed: the player keeps its own client so video still plays (without the patches).
            reportSetupFailure(t);
            return client;
        }
    }

    /**
     * Tells the user the patches on the player don't work. The failure can be StreamAdsPatch's own setup,
     * so its error reporting cannot be relied on: then a message is shown directly.
     */
    private static void reportSetupFailure(Throwable t) {
        Log.e(App.TAG, "Player setup failed", t);
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
                Context context = App.application();
                if (context != null) {
                    Toast.makeText(context, "Twitch Morphed needs an update (E3): " + lost()
                            + " on the player\n" + Messages.of(t), Toast.LENGTH_LONG).show();
                }
            } catch (Throwable shown) {
                Log.e(App.TAG, "Couldn't show the setup failure", shown);
            }
        });
    }

    /** What stops working when the player can't be hooked: the parts included in this build. */
    private static String lost() {
        StringBuilder parts = new StringBuilder();
        if (Included.adBlock()) parts.append("ads may play");
        if (Included.songRemoval()) parts.append(parts.length() > 0 ? ", " : "").append("song removal is off");
        if (Included.qualityUnlock()) parts.append(parts.length() > 0 ? ", " : "").append("the quality unlock is off");
        return parts.length() > 0 ? parts.toString() : "the patches don't work";
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
        String channel = QualityUnlock.channelOf(url);
        boolean preview = channel != null && StreamAdsPatch.isPreview(url);
        if (!preview) noteStream(url, channel);
        Watching.request(url);
        if (QualityUnlock.routes(url)) {
            // The video of an unlocked stream: through the VPN tunnel, like the playlist it came from.
            EXECUTOR.execute(() -> viaTunnel(request, callback, url, start));
            return;
        }
        boolean unlock = channel != null && !preview && Included.qualityUnlock()
                && PatchSettings.qualityUnlock();
        direct(request, callback, url, start, unlock, StreamAdsPatch.shouldInspect(url), !preview && isStreamList(url, channel));
    }

    /** A stream's playlist list (live or a past broadcast): the one opened to watch, unless it's a preview's. */
    private static boolean isStreamList(String url, String channel) {
        return url.contains("usher.ttvnw.net") && url.contains(".m3u8")
                && (channel != null || url.contains("/vod/"));
    }

    /** A request over the normal connection, its playlist unlocked and ad-blocked as needed. */
    private void direct(Request request, ResponseCallback callback, String url, long start, boolean unlock, boolean inspect,
                        boolean opened) {
        if (!inspect && !unlock && !opened) {
            // Timed only while the debug mode is on, so normal playback pays nothing for it.
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
                        EXECUTOR.execute(() -> deliver(request, response, callback, url, body, start, downloaded,
                                unlock, inspect, opened));
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

    private static final Pattern VOD = Pattern.compile("usher\\.ttvnw\\.net/vod/(?:v2/)?(\\d+)");

    /** Tells song removal which stream plays: a channel, or a past broadcast. */
    static void noteStream(String url, String channel) {
        try {
            if (channel != null) {
                SongRemoval.stream("channel:" + channel);
            } else if (url.contains("usher.ttvnw.net/vod/")) {
                Matcher vod = VOD.matcher(url);
                if (vod.find()) SongRemoval.stream("vod:" + vod.group(1));
            }
        } catch (Throwable t) {
            Log.e(App.TAG, "Noting the stream failed", t);
        }
    }

    /**
     * The tunnel can't serve this request: over the normal connection instead, through the same playlist handling
     * (the ad blocker included), and the user is told the unlock stopped.
     */
    private void tunnelFallback(Request request, ResponseCallback callback, String url, long start, String why) {
        DebugLog.log("Quality unlock: " + UrlKey.of(url) + " goes direct (" + why + ")");
        QualityUnlock.tunnelFailed(why);
        direct(request, callback, url, start, false, StreamAdsPatch.shouldInspect(url), false);
    }

    /** A request of an unlocked stream, made through the VPN tunnel and answered to the player. */
    private void viaTunnel(Request request, ResponseCallback callback, String url, long start) {
        try {
            viaTunnelOrFail(request, callback, url, start);
        } catch (Throwable t) { // never leave the player waiting for its timeout
            Log.e(App.TAG, "A tunneled request failed", t);
            try {
                if (!request.isCancelled()) tunnelFallback(request, callback, url, start, Messages.of(t));
            } catch (Throwable again) {
                callback.onError(t instanceof Exception ? (Exception) t : new RuntimeException(t));
            }
        }
    }

    private void viaTunnelOrFail(Request request, ResponseCallback callback, String url, long start) {
        Web web = QualityUnlock.tunnelWeb();
        if (web == null) {
            tunnelFallback(request, callback, url, start, "the VPN isn't connected");
            return;
        }
        if (request.isCancelled()) return;
        Web.Response answer;
        try {
            // IVS gives its timeout in seconds.
            answer = web.send(Web.Request.get(url).timeout(Math.max(5000, request.getTimeout() * 1000)));
        } catch (Exception e) {
            tunnelFallback(request, callback, url, start, Messages.of(e));
            return;
        }
        byte[] body = answer.body;
        long downloaded = SystemClock.elapsedRealtime();
        boolean playlist = url.contains(".m3u8");
        if (playlist && answer.ok()) {
            String text = new String(body, StandardCharsets.UTF_8);
            QualityUnlock.learnAddresses(text);
            if (StreamAdsPatch.shouldInspect(url)) {
                String rewritten = StreamAdsPatch.process(url, text);
                if (rewritten != null && !rewritten.equals(text)) body = rewritten.getBytes(StandardCharsets.UTF_8);
            }
        }
        synchronized (request.lock()) {
            if (request.isCancelled()) return;
            try {
                Response response = new Response(answer.status, url);
                for (java.util.Map.Entry<String, String> header : answer.headers.entrySet()) {
                    String name = header.getKey();
                    if (name.equals("content-length") || name.equals("transfer-encoding") || name.equals("connection")) continue;
                    response.setHeader(name, header.getValue());
                }
                response.setHeader("Content-Length", String.valueOf(body.length));
                response.setConsumer(null, new BytesConsumer(request, body));
                callback.onResponse(response);
            } catch (Throwable t) {
                Log.e(App.TAG, "Answering a tunneled request failed", t);
                callback.onError(t instanceof Exception ? (Exception) t : new RuntimeException(t));
                return;
            }
        }
        if (DebugLog.isOn()) {
            DebugLog.log("VPN " + UrlKey.of(url) + " -> " + answer.status + " in " + (downloaded - start) + "ms, "
                    + body.length + " bytes");
        }
    }

    private static void deliver(Request request, Response response, ResponseCallback callback, String url,
                                byte[] body, long start, long downloaded, boolean unlock, boolean inspect, boolean opened) {
        // The player may have given up on this request (left the stream, switched quality, timed out).
        if (request.isCancelled()) {
            if (DebugLog.isOn()) DebugLog.log("Playlist " + UrlKey.of(url) + " cancelled before processing");
            return;
        }
        long processingStart = SystemClock.elapsedRealtime();
        byte[] output = body;
        try {
            String original = new String(body, StandardCharsets.UTF_8);
            String playlist = original;
            // The unlock first (it may hand over the VPN's playlist), then the ad blocker learns that one.
            if (unlock) playlist = QualityUnlock.master(url, playlist, false);
            if (inspect) playlist = StreamAdsPatch.process(url, playlist);
            // The stream opened to watch: song removal works for it while its playlists are asked for.
            if (opened && playlist != null) Watching.opened(url, playlist);
            if (playlist != null && !playlist.equals(original)) {
                output = playlist.getBytes(StandardCharsets.UTF_8);
            }
        } catch (Throwable t) {
            // Fall back to the original body; playback must never break because of the patches.
            // (process() reports its own failures; this is reading or encoding the body.)
            output = body;
            try {
                StreamAdsPatch.deliveryFailed(url, t);
            } catch (Throwable reportFailed) {
                // The playlist must still be answered below, or the player waits for its timeout.
                Log.e(App.TAG, "Playlist processing failed for " + url, t);
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
                    Log.e(App.TAG, "Playlist delivery failed for " + url, t);
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

    /** One player request in the debug log; the time is until the response headers arrived. */
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
