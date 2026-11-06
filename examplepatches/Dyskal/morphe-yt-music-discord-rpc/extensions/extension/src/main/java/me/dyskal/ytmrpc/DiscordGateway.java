package me.dyskal.ytmrpc;

import org.json.JSONObject;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.Future;
import java.util.concurrent.atomic.AtomicBoolean;

import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.WebSocket;
import okhttp3.WebSocketListener;

/** Serialized socket state; token HTTP requests never block heartbeats or close/cancel commands. */
public final class DiscordGateway implements AutoCloseable {
    public interface TokenProvider {
        String get(boolean forceRefresh) throws Exception;
        default void cancel() { }
    }
    public interface StatusListener {
        void changed(String status);
        default void failed(DiscordFailure error) { changed(error.getMessage()); }
    }
    private final ScheduledExecutorService worker = Executors.newSingleThreadScheduledExecutor(r -> thread(r, "Discord gateway"));
    private final ExecutorService tokenWorker = Executors.newSingleThreadExecutor(r -> thread(r, "Discord token"));
    private static final OkHttpClient HTTP = Http.CLIENT.newBuilder()
            .connectTimeout(15, TimeUnit.SECONDS).readTimeout(0, TimeUnit.MILLISECONDS).build();
    private final TokenProvider tokens;
    private final StatusListener status;
    private final String appId, url;
    private final AtomicBoolean closed = new AtomicBoolean();
    private WebSocket socket;
    private long generation, heartbeatInterval, lastHeartbeatNanos;
    private boolean enabled, ready, awaitingAck, refreshNextIdentify, refreshedAfterRejection;
    private int attempts;
    private Object sequence = JSONObject.NULL;
    private String desired, desiredKey, sentKey;
    private long lastSentNanos;
    private ScheduledFuture<?> heartbeat, watchdog, retry, flush;
    private Future<?> tokenRequest;

    public DiscordGateway(String appId, TokenProvider tokens, StatusListener status) {
        this(appId, tokens, status, "wss://gateway.discord.gg/?v=10&encoding=json");
    }
    DiscordGateway(String appId, TokenProvider tokens, StatusListener status, String url) {
        this.appId = appId; this.tokens = tokens; this.status = status; this.url = url;
    }
    private static Thread thread(Runnable action, String name) {
        Thread thread = new Thread(action, name); thread.setDaemon(true); return thread;
    }

    public void start() {
        if (closed.get()) return;
        dispatch(() -> { if (!enabled && !closed.get()) { enabled = true; attempts = 0; connect(); } });
    }
    public void update(String presence, String key) {
        if (closed.get()) return;
        dispatch(() -> { desired = presence; desiredKey = key; sendLatest(); });
    }

    private void connect() {
        if (!enabled || closed.get()) return;
        long id = ++generation;
        ready = false; awaitingAck = false; sequence = JSONObject.NULL; sentKey = null;
        status.changed("Connecting to Discord");
        socket = HTTP.newWebSocket(new Request.Builder().url(url).build(), new WebSocketListener() {
            @Override public void onMessage(WebSocket ws, String text) {
                dispatch(() -> {
                    if (id != generation || !enabled || closed.get()) return;
                    try { frame(text); }
                    catch (Exception error) {
                        fatal(id, new DiscordFailure(DiscordFailure.Kind.PROTOCOL, "Invalid Discord gateway response (" + error.getClass().getSimpleName() + ")"));
                    }
                });
            }
            @Override public void onClosing(WebSocket ws, int code, String reason) {
                ws.close(code, null); dispatch(() -> failed(id, code, null));
            }
            @Override public void onClosed(WebSocket ws, int code, String reason) { dispatch(() -> failed(id, code, null)); }
            @Override public void onFailure(WebSocket ws, Throwable error, Response response) {
                int code = response == null ? 0 : response.code();
                DiscordFailure failure;
                if (code == 401) failure = new DiscordFailure(DiscordFailure.Kind.AUTHORIZATION, "Discord gateway HTTP 401; sign in again", code, 0);
                else if (code == 403) failure = new DiscordFailure(DiscordFailure.Kind.CONFIGURATION, "Discord gateway HTTP 403; check application permissions", code, 0);
                else if (response != null) failure = new DiscordFailure(code >= 300 && code < 500 && code != 429
                        ? DiscordFailure.Kind.CONFIGURATION : DiscordFailure.Kind.TRANSIENT, "Discord gateway HTTP " + code, code, 0);
                else failure = DiscordFailure.network(error);
                if (code == 429) {
                    long delay = Http.retryAfterMillis(response.header("Retry-After"), 60_000);
                    failure = new DiscordFailure(DiscordFailure.Kind.TRANSIENT, "Discord gateway rate limited (HTTP 429)", code, delay);
                }
                DiscordFailure result = failure;
                dispatch(() -> failed(id, code, result));
            }
        });
        watchdog = worker.schedule(() -> failed(id, 0,
                new DiscordFailure(DiscordFailure.Kind.TRANSIENT, "Discord gateway connection timed out")), 30, TimeUnit.SECONDS);
    }

    private void dispatch(Runnable action) {
        try { if (!worker.isShutdown()) worker.execute(action); }
        catch (java.util.concurrent.RejectedExecutionException ignored) { }
    }

    private void frame(String text) throws Exception {
        JSONObject frame = new JSONObject(text);
        if (frame.has("s") && !frame.isNull("s")) sequence = frame.get("s");
        switch (frame.getInt("op")) {
            case 10 -> {
                heartbeatInterval = frame.getJSONObject("d").getLong("heartbeat_interval");
                if (heartbeatInterval < 1000 || heartbeatInterval > 120_000) throw new IllegalStateException();
                cancel(heartbeat);
                heartbeat = worker.scheduleWithFixedDelay(() -> {
                    if (awaitingAck) {
                        if (TimeUnit.NANOSECONDS.toMillis(System.nanoTime() - lastHeartbeatNanos) >= heartbeatInterval) {
                            failed(generation, 0, new DiscordFailure(DiscordFailure.Kind.TRANSIENT, "Discord heartbeat acknowledgement timed out"));
                        }
                        return;
                    }
                    sendHeartbeat();
                }, (long) (Math.random() * heartbeatInterval), heartbeatInterval, TimeUnit.MILLISECONDS);
                identifyAsync();
            }
            case 0 -> {
                if ("READY".equals(frame.optString("t"))) {
                    ready = true; attempts = 0; refreshedAfterRejection = false;
                    cancel(watchdog); status.changed("Connected to Discord"); sendLatest();
                }
            }
            case 1 -> sendHeartbeat();
            case 11 -> awaitingAck = false;
            case 7, 9 -> failed(generation, 0, null);
            default -> { }
        }
    }

    private void identifyAsync() {
        long id = generation;
        boolean forceRefresh = refreshNextIdentify;
        tokenRequest = tokenWorker.submit(() -> {
            try {
                if (closed.get() || Thread.currentThread().isInterrupted()) return;
                String token = tokens.get(forceRefresh);
                dispatch(() -> {
                    if (id != generation || !enabled || closed.get()) return;
                    try {
                        if (forceRefresh) { refreshedAfterRejection = true; refreshNextIdentify = false; }
                        JSONObject data = new JSONObject().put("token", "Bearer " + token).put("intents", 0)
                                .put("compress", false).put("properties", new JSONObject()
                                        .put("os", "android").put("browser", "Discord Android").put("device", appId));
                        send(new JSONObject().put("op", 2).put("d", data).toString());
                    } catch (Exception error) { failed(id, 0, DiscordFailure.network(error)); }
                });
            } catch (Exception error) {
                DiscordFailure failure = error instanceof DiscordFailure ? (DiscordFailure) error : DiscordFailure.network(error);
                dispatch(() -> failed(id, 0, failure));
            }
        });
    }

    private void sendHeartbeat() {
        try {
            send(new JSONObject().put("op", 1).put("d", sequence).toString());
            if (!awaitingAck) lastHeartbeatNanos = System.nanoTime();
            awaitingAck = true;
        } catch (Exception error) { failed(generation, 0, DiscordFailure.network(error)); }
    }

    private void sendLatest() {
        if (!ready || desired == null || java.util.Objects.equals(desiredKey, sentKey)) return;
        long remaining = 4_100 - TimeUnit.NANOSECONDS.toMillis(System.nanoTime() - lastSentNanos);
        if (lastSentNanos != 0 && remaining > 0) {
            if (flush == null || flush.isDone()) flush = worker.schedule(this::sendLatest, remaining, TimeUnit.MILLISECONDS);
            return;
        }
        if (socket != null && socket.send(desired)) { sentKey = desiredKey; lastSentNanos = System.nanoTime(); }
        else failed(generation, 0, new DiscordFailure(DiscordFailure.Kind.TRANSIENT, "Discord presence send failed"));
    }

    private void send(String text) {
        if (socket == null || !socket.send(text)) throw new IllegalStateException("Discord socket closed");
    }

    private void stopSocket() {
        ++generation; ready = false;
        cancel(heartbeat); cancel(watchdog); cancel(flush);
        if (tokenRequest != null) tokenRequest.cancel(true);
        tokens.cancel();
        if (socket != null) socket.cancel();
        socket = null;
    }

    private void fatal(long id, DiscordFailure error) {
        if (id != generation || !enabled || closed.get()) return;
        stopSocket(); enabled = false; cancel(retry);
        DiscordDiagnostics.failure("Gateway stopped", error);
        status.failed(error);
    }

    private void failed(long id, int code, DiscordFailure error) {
        if (id != generation || !enabled || closed.get()) return;
        if (error != null && !error.isRetryable()) { fatal(id, error); return; }
        if (code == 4004) {
            if (refreshedAfterRejection) {
                fatal(id, new DiscordFailure(DiscordFailure.Kind.AUTHORIZATION, "Discord rejected refreshed authorization; sign in again")); return;
            }
            refreshNextIdentify = true;
        } else if (code == 4010 || code == 4011 || code == 4013 || code == 4014) {
            fatal(id, new DiscordFailure(DiscordFailure.Kind.CONFIGURATION, "Discord gateway rejected application configuration (" + code + ")")); return;
        }
        if (attempts >= 7) {
            fatal(id, new DiscordFailure(DiscordFailure.Kind.TRANSIENT, "Discord reconnect attempts exhausted; tap Connect to retry"
                    + (error == null ? "" : ". " + error.getMessage()))); return;
        }
        stopSocket();
        long delay = Math.min(60_000, 1000L << Math.min(attempts++, 6));
        if (error != null) delay = Math.max(delay, error.retryAfterMillis);
        DiscordFailure detail = error == null ? new DiscordFailure(DiscordFailure.Kind.TRANSIENT, "Discord connection closed (" + code + ")") : error;
        DiscordDiagnostics.failure("Gateway reconnect", detail);
        status.changed(detail.getMessage() + "; retrying in " + Math.max(1, delay / 1000) + "s");
        retry = worker.schedule(this::connect, delay, TimeUnit.MILLISECONDS);
    }

    private static void cancel(ScheduledFuture<?> task) { if (task != null) task.cancel(false); }

    @Override public void close() {
        if (!closed.compareAndSet(false, true)) return;
        tokens.cancel();
        dispatch(() -> {
            if (socket != null) {
                try { if (ready) socket.send(DiscordPresence.update(null)); }
                catch (Exception error) { DiscordDiagnostics.failure("Clear presence", error); }
                socket.close(1000, null);
            }
            ++generation; enabled = false; ready = false; socket = null;
            cancel(heartbeat); cancel(watchdog); cancel(retry); cancel(flush);
            if (tokenRequest != null) tokenRequest.cancel(true);
            tokens.cancel();
            status.changed("Disconnected");
            tokenWorker.shutdownNow();
            worker.shutdown();
        });
    }
}
