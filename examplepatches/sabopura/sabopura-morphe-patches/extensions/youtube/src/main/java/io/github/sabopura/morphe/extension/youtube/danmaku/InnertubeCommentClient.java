package io.github.sabopura.morphe.extension.youtube.danmaku;

import android.util.Log;

import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicLong;

/** API-key-free Innertube transport for comments and live chat. */
final class InnertubeCommentClient {
    private static final String TAG = "DanmakuComments";
    private static final String API_ROOT = "https://www.youtube.com/youtubei/v1/";
    private static final String WATCH_ROOT = "https://www.youtube.com/watch?v=";
    private static final String REPLAY_ROOT = "https://www.youtube.com/live_chat_replay?continuation=";
    private static final String DEFAULT_CLIENT_VERSION = "21.04.223";
    private static final String WEB_USER_AGENT = "Mozilla/5.0 (Linux; Android 14) "
            + "AppleWebKit/537.36 Chrome/127.0 Mobile Safari/537.36";
    private static final int CONNECT_TIMEOUT_MS = 10_000;
    private static final int READ_TIMEOUT_MS = 30_000;
    private static final int MAX_RESPONSE_BYTES = 16 * 1024 * 1024;
    private static final int MAX_REGULAR_PAGES = 30;
    /**
     * A comment list read to its end without a single comment is retried this often, in case
     * the request context was not captured yet. Videos without comments (including ones whose
     * "comments are turned off" message is in a language the parser does not know) then stop.
     */
    private static final int MAX_EMPTY_REGULAR_RETRIES = 2;
    /** Live chat is not polled while YouTube has not reported playback for this long. */
    private static final long LIVE_IDLE_AFTER_MS = 30_000;
    private static final long REPLAY_PREFETCH_WINDOW_MS = 60_000;

    private static volatile AuthSnapshot authSnapshot = AuthSnapshot.EMPTY;

    private InnertubeCommentClient() {
    }

    static Session start(String videoId, int maxComments, int streamCommentMode,
                         boolean officialLiveChat, Callback callback) {
        Session session = new Session(videoId, Math.max(20, maxComments),
                streamCommentMode, officialLiveChat, callback);
        session.start();
        return session;
    }

    static void captureRequestHeaders(String url, Map<String, String> headers) {
        if (url == null || headers == null || headers.isEmpty()
                || !url.contains("youtube")) return;
        captureRequestHeaders(headers);
    }

    static void captureRequestHeaders(Map<String, String> headers) {
        if (headers == null || headers.isEmpty()) return;
        AuthSnapshot previous = authSnapshot;
        AuthSnapshot updated = AuthSnapshot.from(headers, previous);
        if (!updated.equals(previous)) {
            authSnapshot = updated;
            Log.d(TAG, "Updated in-memory YouTube request context");
        }
    }

    enum VideoKind {
        REGULAR,
        LIVE,
        PREMIERE,
        LIVE_REPLAY,
        PREMIERE_REPLAY
    }

    interface Callback {
        /** Return false to stop fetching because this video type is disabled. */
        boolean onVideoKind(VideoKind kind, long liveStartEpochMs);

        /** Returns the number of accepted regular comments currently retained. */
        int onRegularComments(List<InnertubeResponseParser.CommentData> comments);

        void onLiveComments(List<InnertubeResponseParser.CommentData> comments,
                            long liveStartEpochMs, boolean firstBatch);

        long getCurrentVideoTimeMs();

        /** Milliseconds since YouTube last reported the playback position of this video. */
        long millisSincePlaybackReport();

        /** True while enough upcoming chat is buffered and fetching further ahead should wait. */
        boolean isStreamBufferFull();

        void onFetchState(String state);
    }

    /**
     * @param officialLiveChat Morphe's official Niconico comments patch already shows the
     *                         chat, so it is neither fetched nor drawn a second time.
     */
    static SourcePlan selectSources(VideoKind kind, boolean chatAvailable,
                                    int streamCommentMode, boolean officialLiveChat) {
        if (kind == VideoKind.REGULAR) return new SourcePlan(false, true);
        if (streamCommentMode == DanmakuSettings.STREAM_MODE_REGULAR_ONLY) {
            return new SourcePlan(false, true);
        }
        boolean chat = chatAvailable && !officialLiveChat;
        if (streamCommentMode == DanmakuSettings.STREAM_MODE_CHAT_AND_TIMESTAMPS) {
            return new SourcePlan(chat, true);
        }
        // The default keeps chat authoritative and uses regular comments only
        // when YouTube confirms that no chat/replay continuation exists.
        return new SourcePlan(chat, !chatAvailable);
    }

    static final class SourcePlan {
        final boolean stream;
        final boolean regular;

        SourcePlan(boolean stream, boolean regular) {
            this.stream = stream;
            this.regular = regular;
        }
    }

    static final class Session implements AutoCloseable {
        private final String videoId;
        private final int maxComments;
        private final int streamCommentMode;
        private final boolean officialLiveChat;
        private final Callback callback;
        private final AtomicBoolean cancelled = new AtomicBoolean();
        private final AtomicLong replaySeekVersion = new AtomicLong();
        private volatile long replaySeekPositionMs;
        private final Set<HttpURLConnection> activeConnections =
                Collections.synchronizedSet(new HashSet<>());
        private Thread worker;
        private volatile Thread regularWorker;
        private volatile boolean regularCompleted;

        Session(String videoId, int maxComments, int streamCommentMode,
                boolean officialLiveChat, Callback callback) {
            this.videoId = videoId;
            this.maxComments = maxComments;
            this.streamCommentMode = streamCommentMode;
            this.officialLiveChat = officialLiveChat;
            this.callback = callback;
        }

        void start() {
            worker = new Thread(this::run, "Danmaku-Innertube");
            worker.setDaemon(true);
            worker.start();
        }

        void requestReplaySeek(long videoTimeMs) {
            replaySeekPositionMs = Math.max(0, videoTimeMs);
            replaySeekVersion.incrementAndGet();
        }

        private void run() {
            long retryMs = 1_000;
            int emptyRegularRuns = 0;
            while (!cancelled.get()) {
                try {
                    callback.onFetchState("bootstrap");
                    InnertubeResponseParser.PlayerInfo player = InnertubeResponseParser
                            .parsePlayer(post("player", initialBody()));
                    InnertubeResponseParser.InitialState initial = InnertubeResponseParser
                            .parseInitial(post("next", initialBody()));
                    if (initial.liveContinuation == null
                            && (player.liveContent || player.upcoming)) {
                        try {
                            InnertubeResponseParser.InitialState watch = InnertubeResponseParser
                                    .parseWatchPage(get(watchUrl()));
                            initial = mergeInitial(initial, watch);
                            callback.onFetchState("watch-fallback");
                        } catch (Throwable throwable) {
                            Log.d(TAG, "Watch-page live metadata unavailable: "
                                    + throwable.getClass().getSimpleName());
                        }
                    }

                    VideoKind kind = classifyVideo(initial, player);
                    if (!callback.onVideoKind(kind, player.liveStartEpochMs)) return;
                    SourcePlan sources = selectSources(kind,
                            initial.liveContinuation != null, streamCommentMode,
                            officialLiveChat);
                    callback.onFetchState("sources-stream-" + sources.stream
                            + "-regular-" + sources.regular);
                    if (!sources.stream && !sources.regular) return;
                    if (sources.stream) {
                        if (sources.regular) {
                            startRegularWorker(initial.commentContinuation);
                        }
                        runLive(initial, player, kind);
                    } else {
                        if (runRegular(initial.commentContinuation)) return;
                        if (++emptyRegularRuns > MAX_EMPTY_REGULAR_RETRIES) {
                            callback.onFetchState("regular-empty");
                            return;
                        }
                        callback.onFetchState("regular-retry");
                        if (!waitFor(retryMs)) return;
                        retryMs = Math.min(30_000, retryMs * 2);
                        continue;
                    }
                    retryMs = 1_000;
                } catch (HttpStatusException exception) {
                    if (cancelled.get()) return;
                    retryMs = exception.statusCode == 429
                            ? 60_000 : Math.min(30_000, Math.max(1_000, retryMs * 2));
                    callback.onFetchState("http-" + exception.statusCode);
                    if (!waitFor(retryMs)) return;
                } catch (Throwable throwable) {
                    if (cancelled.get()) return;
                    Log.w(TAG, "Background comment request failed: "
                            + throwable.getClass().getSimpleName());
                    callback.onFetchState("retry");
                    if (!waitFor(retryMs)) return;
                    retryMs = Math.min(30_000, retryMs * 2);
                }
            }
        }

        private boolean runRegular(String continuation) throws Exception {
            if (continuation == null || continuation.isEmpty()) {
                continuation = generateCommentContinuation(videoId);
                callback.onFetchState("regular-generated-continuation");
            }

            String previous = null;
            boolean sawComments = false;
            for (int pageIndex = 0; pageIndex < MAX_REGULAR_PAGES
                    && continuation != null && !cancelled.get(); pageIndex++) {
                if (continuation.equals(previous)) break;
                previous = continuation;
                InnertubeResponseParser.RegularPage page = InnertubeResponseParser
                        .parseRegularPage(post("next", continuationBody(continuation, false)));
                sawComments |= !page.comments.isEmpty();
                int retained = callback.onRegularComments(page.comments);
                callback.onFetchState("regular-page-" + (pageIndex + 1));
                if (retained >= maxComments || page.commentsDisabled) return true;
                continuation = page.continuation;
            }
            return sawComments;
        }

        private synchronized void startRegularWorker(String continuation) {
            if (regularCompleted || cancelled.get()
                    || (regularWorker != null && regularWorker.isAlive())) return;
            final String seed = continuation;
            regularWorker = new Thread(() -> {
                long retryMs = 1_000;
                int emptyRuns = 0;
                while (!cancelled.get() && !regularCompleted) {
                    try {
                        if (runRegular(seed)) {
                            regularCompleted = true;
                            callback.onFetchState("mixed-regular-complete");
                            return;
                        }
                        if (++emptyRuns > MAX_EMPTY_REGULAR_RETRIES) {
                            regularCompleted = true;
                            callback.onFetchState("mixed-regular-empty");
                            return;
                        }
                        callback.onFetchState("mixed-regular-retry");
                    } catch (HttpStatusException exception) {
                        callback.onFetchState("mixed-regular-http-" + exception.statusCode);
                        retryMs = exception.statusCode == 429 ? 60_000
                                : Math.min(30_000, retryMs * 2);
                    } catch (Throwable throwable) {
                        if (cancelled.get()) return;
                        Log.d(TAG, "Parallel regular comments unavailable: "
                                + throwable.getClass().getSimpleName());
                        callback.onFetchState("mixed-regular-retry");
                        retryMs = Math.min(30_000, retryMs * 2);
                    }
                    if (!waitFor(retryMs)) return;
                }
            }, "Danmaku-Regular");
            regularWorker.setDaemon(true);
            regularWorker.start();
        }

        private void runLive(InnertubeResponseParser.InitialState initial,
                             InnertubeResponseParser.PlayerInfo player,
                             VideoKind kind) throws Exception {
            boolean replay = kind == VideoKind.LIVE_REPLAY
                    || kind == VideoKind.PREMIERE_REPLAY;
            if (replay) {
                runReplay(initial.liveContinuation, player.liveStartEpochMs);
                return;
            }

            String continuation = initial.liveContinuation;
            boolean firstBatch = true;
            while (!cancelled.get()) {
                if (callback.millisSincePlaybackReport() >= LIVE_IDLE_AFTER_MS) {
                    // Paused, closed or in the background: nothing would be shown, so stop
                    // polling until playback reports again. The backlog is then trimmed like
                    // the first batch instead of flooding the screen.
                    callback.onFetchState("live-idle");
                    while (callback.millisSincePlaybackReport() >= LIVE_IDLE_AFTER_MS) {
                        if (!waitFor(1_000)) return;
                    }
                    firstBatch = true;
                }
                InnertubeResponseParser.LivePage page = InnertubeResponseParser.parseLivePage(
                        post("live_chat/get_live_chat", continuationBody(continuation, true)));
                callback.onLiveComments(page.comments, player.liveStartEpochMs, firstBatch);
                firstBatch = false;
                callback.onFetchState("live-poll");
                if (page.continuation == null || page.continuation.isEmpty()) {
                    throw new IOException("Live continuation ended");
                }
                continuation = page.continuation;
                if (!waitFor(page.timeoutMs)) return;
            }
        }

        private void runReplay(String seedContinuation, long liveStartEpochMs) throws Exception {
            if (seedContinuation == null || seedContinuation.isEmpty()) {
                throw new IOException("Replay continuation missing");
            }
            long observedSeekVersion = replaySeekVersion.get();
            while (!cancelled.get()) {
                String continuation = replayBootstrapContinuation(seedContinuation);
                if (continuation == null || continuation.isEmpty()) {
                    continuation = seedContinuation;
                }
                callback.onFetchState("replay-bootstrap");

                while (!cancelled.get()) {
                    long currentSeekVersion = replaySeekVersion.get();
                    if (currentSeekVersion != observedSeekVersion) {
                        observedSeekVersion = currentSeekVersion;
                        callback.onFetchState("replay-seek-" + replaySeekPositionMs);
                        break;
                    }
                    InnertubeResponseParser.LivePage page = InnertubeResponseParser.parseLivePage(
                            post("live_chat/get_live_chat_replay",
                                    continuationBody(continuation, true)));
                    // Replay bootstrap responses are already centered on the
                    // requested player offset. Keep the whole first response;
                    // the live-only last-20 trimming would discard comments
                    // at the seek point and retain only far-future messages.
                    callback.onLiveComments(page.comments, liveStartEpochMs, false);
                    callback.onFetchState("replay-poll");
                    if (page.continuation == null || page.continuation.isEmpty()) {
                        throw new IOException("Replay continuation ended");
                    }
                    continuation = page.continuation;

                    boolean waitedForWindow = false;
                    boolean seekDuringWait = false;
                    while (!cancelled.get()) {
                        currentSeekVersion = replaySeekVersion.get();
                        if (currentSeekVersion != observedSeekVersion) {
                            observedSeekVersion = currentSeekVersion;
                            callback.onFetchState("replay-seek-" + replaySeekPositionMs);
                            seekDuringWait = true;
                            break;
                        }
                        long delayMs = replayPrefetchDelayMs(page.lastOffsetMs,
                                callback.getCurrentVideoTimeMs());
                        // Busy chats: do not run further ahead than the buffer can hold.
                        if (delayMs <= 0 && callback.isStreamBufferFull()) delayMs = 500;
                        if (delayMs <= 0) break;
                        waitedForWindow = true;
                        if (!waitFor(Math.min(1_000, delayMs))) return;
                    }
                    if (seekDuringWait) break;
                    if (!waitedForWindow && !waitFor(page.timeoutMs)) return;
                }
            }
        }

        static long replayPrefetchDelayMs(long lastFetchedOffsetMs,
                                          long currentPlayerOffsetMs) {
            if (lastFetchedOffsetMs < 0) return 0;
            return Math.max(0, lastFetchedOffsetMs
                    - Math.max(0, currentPlayerOffsetMs) - REPLAY_PREFETCH_WINDOW_MS);
        }

        private String replayBootstrapContinuation(String continuation) throws Exception {
            String encoded = URLEncoder.encode(continuation, StandardCharsets.UTF_8.name());
            return InnertubeResponseParser.parseReplayBootstrap(get(REPLAY_ROOT + encoded))
                    .continuation;
        }

        private VideoKind classifyVideo(InnertubeResponseParser.InitialState initial,
                                        InnertubeResponseParser.PlayerInfo player) {
            boolean premiere = initial.premiere || player.premiere;
            boolean replay = initial.replay || player.replay();
            if (replay) return premiere ? VideoKind.PREMIERE_REPLAY : VideoKind.LIVE_REPLAY;
            if (initial.liveContinuation != null || player.liveNow || player.upcoming) {
                return premiere ? VideoKind.PREMIERE : VideoKind.LIVE;
            }
            return VideoKind.REGULAR;
        }

        private InnertubeResponseParser.InitialState mergeInitial(
                InnertubeResponseParser.InitialState primary,
                InnertubeResponseParser.InitialState fallback) {
            return new InnertubeResponseParser.InitialState(
                    primary.commentContinuation != null
                            ? primary.commentContinuation : fallback.commentContinuation,
                    primary.liveContinuation != null
                            ? primary.liveContinuation : fallback.liveContinuation,
                    primary.replay || fallback.replay,
                    primary.premiere || fallback.premiere
            );
        }

        private String watchUrl() throws Exception {
            return WATCH_ROOT + URLEncoder.encode(videoId, StandardCharsets.UTF_8.name())
                    + "&bpctr=9999999999&has_verified=1";
        }

        private JSONObject initialBody() throws Exception {
            JSONObject body = new JSONObject();
            body.put("context", clientContext());
            body.put("videoId", videoId);
            body.put("contentCheckOk", true);
            body.put("racyCheckOk", true);
            return body;
        }

        private JSONObject continuationBody(String continuation, boolean includePlayerState)
                throws Exception {
            JSONObject body = new JSONObject();
            body.put("context", clientContext());
            body.put("continuation", continuation);
            if (includePlayerState) {
                putCurrentPlayerState(body, callback.getCurrentVideoTimeMs());
            }
            return body;
        }

        static void putCurrentPlayerState(JSONObject body, long playerOffsetMs)
                throws Exception {
            JSONObject state = new JSONObject();
            // Innertube represents protobuf int64 values as JSON strings.
            // A JSON number is accepted by the endpoint but ignored when it
            // initializes a replay after a seek.
            state.put("playerOffsetMs", Long.toString(Math.max(0, playerOffsetMs)));
            body.put("currentPlayerState", state);
        }

        private JSONObject clientContext() throws Exception {
            AuthSnapshot auth = authSnapshot;
            JSONObject client = new JSONObject();
            client.put("clientName", "ANDROID");
            client.put("clientVersion", auth.clientVersion.isEmpty()
                    ? DEFAULT_CLIENT_VERSION : auth.clientVersion);
            client.put("hl", Locale.getDefault().getLanguage());
            String country = Locale.getDefault().getCountry();
            if (!country.isEmpty()) client.put("gl", country);
            JSONObject context = new JSONObject();
            context.put("client", client);
            return context;
        }

        private String get(String targetUrl) throws Exception {
            if (cancelled.get()) throw new IOException("Cancelled");
            HttpURLConnection connection = (HttpURLConnection) new URL(targetUrl).openConnection();
            activeConnections.add(connection);
            connection.setRequestMethod("GET");
            connection.setConnectTimeout(CONNECT_TIMEOUT_MS);
            connection.setReadTimeout(READ_TIMEOUT_MS);
            connection.setRequestProperty("User-Agent", WEB_USER_AGENT);
            connection.setRequestProperty("Accept-Language",
                    Locale.getDefault().toLanguageTag() + ",en;q=0.7");
            connection.setRequestProperty("Accept", "text/html,application/json;q=0.9,*/*;q=0.5");
            connection.setInstanceFollowRedirects(true);

            int status = connection.getResponseCode();
            if (status < 200 || status >= 300) {
                disconnect(connection);
                throw new HttpStatusException(status);
            }
            try (InputStream input = connection.getInputStream()) {
                return readBounded(input);
            } finally {
                disconnect(connection);
            }
        }

        private String post(String route, JSONObject body) throws Exception {
            if (cancelled.get()) throw new IOException("Cancelled");
            URL url = new URL(API_ROOT + route + "?prettyPrint=false");
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            activeConnections.add(connection);
            AuthSnapshot auth = authSnapshot;
            connection.setRequestMethod("POST");
            connection.setConnectTimeout(CONNECT_TIMEOUT_MS);
            connection.setReadTimeout(READ_TIMEOUT_MS);
            connection.setRequestProperty("Content-Type", "application/json");
            connection.setRequestProperty("User-Agent", auth.userAgent.isEmpty()
                    ? "com.google.android.youtube/" + DEFAULT_CLIENT_VERSION
                    + " (Linux; U; Android 14)" : auth.userAgent);
            connection.setRequestProperty("X-YouTube-Client-Name", "3");
            connection.setRequestProperty("X-YouTube-Client-Version",
                    auth.clientVersion.isEmpty() ? DEFAULT_CLIENT_VERSION : auth.clientVersion);
            connection.setRequestProperty("Origin", "https://www.youtube.com");
            connection.setRequestProperty("X-Origin", "https://www.youtube.com");
            auth.apply(connection);
            connection.setDoOutput(true);

            byte[] payload = body.toString().getBytes(StandardCharsets.UTF_8);
            connection.setFixedLengthStreamingMode(payload.length);
            try (OutputStream output = connection.getOutputStream()) {
                output.write(payload);
            }

            int status = connection.getResponseCode();
            if (status < 200 || status >= 300) {
                disconnect(connection);
                throw new HttpStatusException(status);
            }
            try (InputStream input = connection.getInputStream()) {
                return readBounded(input);
            } finally {
                disconnect(connection);
            }
        }

        private void disconnect(HttpURLConnection connection) {
            activeConnections.remove(connection);
            connection.disconnect();
        }

        private String readBounded(InputStream input) throws IOException {
            ByteArrayOutputStream output = new ByteArrayOutputStream(64 * 1024);
            byte[] buffer = new byte[16 * 1024];
            int total = 0;
            int read;
            while ((read = input.read(buffer)) != -1) {
                total += read;
                if (total > MAX_RESPONSE_BYTES) throw new IOException("Response too large");
                output.write(buffer, 0, read);
                if (cancelled.get()) throw new IOException("Cancelled");
            }
            return output.toString(StandardCharsets.UTF_8.name());
        }

        private boolean waitFor(long delayMs) {
            long deadline = System.currentTimeMillis() + Math.max(0, delayMs);
            while (!cancelled.get()) {
                long remaining = deadline - System.currentTimeMillis();
                if (remaining <= 0) return true;
                try {
                    Thread.sleep(Math.min(250, remaining));
                } catch (InterruptedException ignored) {
                    Thread.currentThread().interrupt();
                    return false;
                }
            }
            return false;
        }

        @Override
        public void close() {
            cancelled.set(true);
            HttpURLConnection[] connections;
            synchronized (activeConnections) {
                connections = activeConnections.toArray(new HttpURLConnection[0]);
                activeConnections.clear();
            }
            for (HttpURLConnection connection : connections) connection.disconnect();
            Thread currentWorker = worker;
            if (currentWorker != null) currentWorker.interrupt();
            Thread currentRegularWorker = regularWorker;
            if (currentRegularWorker != null) currentRegularWorker.interrupt();
        }
    }

    static String generateCommentContinuation(String videoId) throws IOException {
        if (videoId == null || videoId.length() != 11) {
            throw new IOException("Invalid YouTube video id");
        }
        byte[] id = videoId.getBytes(StandardCharsets.UTF_8);
        ByteArrayOutputStream token = new ByteArrayOutputStream(64);
        token.write(0x12);
        token.write(0x0d);
        token.write(0x12);
        token.write(0x0b);
        token.write(id);
        token.write(0x18);
        token.write(0x06);
        token.write(0x32);
        token.write(0x27);
        token.write(0x22);
        token.write(0x11);
        token.write(0x22);
        token.write(0x0b);
        token.write(id);
        token.write(0x30);
        token.write(0x00);
        token.write(0x78);
        token.write(0x02);
        token.write(0x30);
        token.write(0x00);
        token.write(0x42);
        token.write(0x10);
        token.write("comments-section".getBytes(StandardCharsets.UTF_8));
        return Base64.getEncoder().encodeToString(token.toByteArray());
    }

    private static final class AuthSnapshot {
        static final AuthSnapshot EMPTY = new AuthSnapshot(Collections.emptyMap(), "", "");

        final Map<String, String> headers;
        final String clientVersion;
        final String userAgent;

        AuthSnapshot(Map<String, String> headers, String clientVersion, String userAgent) {
            this.headers = headers;
            this.clientVersion = clientVersion;
            this.userAgent = userAgent;
        }

        static AuthSnapshot from(Map<String, String> source, AuthSnapshot previous) {
            Map<String, String> selected = new LinkedHashMap<>(previous.headers);
            String clientVersion = previous.clientVersion;
            String userAgent = previous.userAgent;
            for (Map.Entry<String, String> entry : source.entrySet()) {
                if (entry.getKey() == null || entry.getValue() == null) continue;
                String key = entry.getKey();
                String lower = key.toLowerCase(Locale.ROOT);
                if (lower.equals("authorization") || lower.equals("x-goog-visitor-id")
                        || lower.equals("x-goog-pageid") || lower.equals("x-goog-authuser")
                        || lower.equals("x-youtube-bootstrap-logged-in")) {
                    selected.put(canonicalHeader(lower), entry.getValue());
                } else if (lower.equals("x-youtube-client-version")) {
                    clientVersion = entry.getValue();
                } else if (lower.equals("user-agent")) {
                    userAgent = entry.getValue();
                }
            }
            return new AuthSnapshot(Collections.unmodifiableMap(selected), clientVersion, userAgent);
        }

        void apply(HttpURLConnection connection) {
            for (Map.Entry<String, String> entry : headers.entrySet()) {
                if (!entry.getValue().isEmpty()) {
                    connection.setRequestProperty(entry.getKey(), entry.getValue());
                }
            }
        }

        private static String canonicalHeader(String lower) {
            if (lower.equals("authorization")) return "Authorization";
            if (lower.equals("x-goog-visitor-id")) return "X-Goog-Visitor-Id";
            if (lower.equals("x-goog-pageid")) return "X-Goog-PageId";
            if (lower.equals("x-goog-authuser")) return "X-Goog-AuthUser";
            return "X-YouTube-Bootstrap-Logged-In";
        }

        @Override public boolean equals(Object other) {
            if (!(other instanceof AuthSnapshot)) return false;
            AuthSnapshot value = (AuthSnapshot) other;
            return headers.equals(value.headers)
                    && clientVersion.equals(value.clientVersion)
                    && userAgent.equals(value.userAgent);
        }

        @Override public int hashCode() {
            return headers.hashCode() * 31 + clientVersion.hashCode() * 17 + userAgent.hashCode();
        }
    }

    private static final class HttpStatusException extends IOException {
        final int statusCode;

        HttpStatusException(int statusCode) {
            super("HTTP " + statusCode);
            this.statusCode = statusCode;
        }
    }
}
