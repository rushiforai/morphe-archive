package io.github.sabopura.morphe.extension.twitch.ads;

import com.amazonaws.ivs.net.HttpClient;
import com.amazonaws.ivs.net.Method;
import com.amazonaws.ivs.net.ReadCallback;
import com.amazonaws.ivs.net.Request;
import com.amazonaws.ivs.net.Response;
import com.amazonaws.ivs.net.ResponseCallback;
import com.amazonaws.ivs.net.StreamConsumer;
import io.github.sabopura.morphe.extension.twitch.Diagnostics;
import io.github.sabopura.morphe.extension.twitch.player.LiveProxy;
import io.github.sabopura.morphe.extension.twitch.ui.Feature;
import io.github.sabopura.morphe.extension.twitch.ui.Features;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.CancellationException;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.Future;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/**
 * Wraps the HTTP client of Amazon IVS, the player behind both Twitch's native and React Native
 * screens. Live playlists with a stitched ad are answered with the same rendition from an
 * ad-free backup session. The stream being watched opens that session in the background, two
 * small requests per stream; previews are left alone, and a stream proxy that fails falls back
 * to Twitch.
 */
public final class AdFreeHttpClient implements HttpClient {
    private static final int BODY_LIMIT = 1024 * 1024;
    /** How long a playlist answer may wait for a backup, so playback never stalls for long. */
    private static final long BACKUP_BUDGET_MS = 4000;
    /** The first playlist of a stream: the player shows its loading state meanwhile. */
    private static final long FIRST_BUDGET_MS = 6000;
    /** Opening a backup source, which goes on in the background past the playlist that waits for it. */
    private static final long OPEN_BUDGET_MS = 10000;
    private static final int MAX_SESSIONS = 6;
    private static final int MAX_PREVIEW_PATHS = 256;
    private static final long CANCEL_POLL_MS = 50;
    /** A playing stream polls about every two seconds; a longer silence can mean its URL moved. */
    private static final long MOVED_AFTER_MS = 2500;
    private static final long MOVED_WINDOW_MS = 30_000;

    /*
     * Shared by every wrapped client. From 31.9.0 Twitch loads a stream's master playlist with one
     * client (a preloader) and polls its media playlists with another (the player), so a session
     * kept per client was unknown to the client that met the ad.
     */
    private static final ThreadPoolExecutor worker = new ThreadPoolExecutor(4, 4, 30, TimeUnit.SECONDS,
            new ArrayBlockingQueue<>(32), task -> {
                Thread t = new Thread(task, "SabopuraTwitchPlaylist");
                t.setDaemon(true);
                return t;
            });
    /** Live sessions by master playlist URL. Also guards {@link #previewPaths}. */
    private static final Map<String, Session> sessions = new LinkedHashMap<>();
    private static final Set<String> previewPaths = Collections.newSetFromMap(new LinkedHashMap<String, Boolean>() {
        @Override
        protected boolean removeEldestEntry(Map.Entry<String, Boolean> eldest) {
            return size() > MAX_PREVIEW_PATHS;
        }
    });

    static {
        worker.allowCoreThreadTimeOut(true);
    }

    private final HttpClient original;
    private volatile boolean released;

    /** Injection point: the return value of HttpClientFactory.create(). */
    public static HttpClient wrap(HttpClient original) {
        return original == null || original instanceof AdFreeHttpClient ? original : new AdFreeHttpClient(original);
    }

    private AdFreeHttpClient(HttpClient original) {
        this.original = original;
    }

    @Override
    public String description() {
        return original.description();
    }

    @Override
    public void release() {
        // The sessions stay: another client may be the one playing them.
        released = true;
        original.release();
    }

    @Override
    public void execute(Request request, ResponseCallback callback) {
        ResponseCallback answer;
        try {
            answer = answer(request, callback);
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("ads.playlist-request", e);
            answer = callback;
        }
        original.execute(request, answer);
    }

    /** Twitch's own callback, or one that reads the live playlist on its way back. */
    private ResponseCallback answer(Request request, ResponseCallback callback) {
        String url = request.getUrl();
        String proxiedFrom = LiveProxy.originalOf(url);
        boolean inspect = Features.has(Feature.ADS_REPLACE) && AdBlock.enabled()
                && (proxiedFrom != null || url.contains(".m3u8"));
        if (released || request.getMethod() != Method.GET || proxiedFrom == null && !inspect) return callback;
        return new ResponseCallback() {
            @Override
            public void onError(Exception error) {
                Request direct = directRetry(-1, request, proxiedFrom);
                if (direct != null) retryDirect(request, direct, callback);
                else fail(request, callback, error);
            }

            @Override
            public void onResponse(Response response) {
                int status = response.getStatus();
                Request direct = directRetry(status, request, proxiedFrom);
                if (direct != null) {
                    discard(response);
                    retryDirect(request, direct, callback);
                } else if (status != 200 || !inspect) {
                    deliver(request, callback, response);
                } else {
                    response.readContent(new Body() {
                        @Override
                        void complete(byte[] body) {
                            try {
                                worker.execute(() -> rewriteAndDeliver(request, response, body, callback));
                            } catch (RejectedExecutionException e) {
                                deliver(request, callback, copy(request, response, body));
                            }
                        }

                        @Override
                        void failed(Exception error) {
                            fail(request, callback, error);
                        }
                    });
                }
            }
        };
    }

    /** Runs on a worker thread, where anything uncaught would end the whole app. */
    private void rewriteAndDeliver(Request request, Response response, byte[] body, ResponseCallback callback) {
        byte[] out = body;
        try {
            if (request.isCancelled()) return;
            String changed = rewrite(request, response.getUrl(), new String(body, StandardCharsets.UTF_8));
            if (changed != null) out = changed.getBytes(StandardCharsets.UTF_8);
        } catch (Throwable e) {
            Diagnostics.note("ads.playlist-rewrite", e);
        }
        Response copied;
        try {
            copied = copy(request, response, out);
        } catch (Throwable e) {
            Diagnostics.note("ads.playlist-copy", e);
            // The body was read and cannot be handed on. An error makes the player ask again at once;
            // silence would leave it waiting for its own timeout.
            try {
                fail(request, callback, new IOException("playlist not delivered"));
            } catch (Throwable ignored) {
            }
            return;
        }
        try {
            deliver(request, callback, copied);
        } catch (Throwable e) {
            Diagnostics.note("ads.playlist-deliver", e);
        }
    }

    /**
     * The same request to Twitch when the stream proxy failed it, or null to give the player the proxy's own
     * answer, which is also what a failure here falls back to.
     */
    private static Request directRetry(int status, Request request, String proxiedFrom) {
        try {
            if (proxiedFrom == null || !LiveProxy.proxyFailed(status)) return null;
            AdBlock.issue("The stream proxy failed; using Twitch directly for 5 minutes");
            Request direct = new Request(proxiedFrom, "GET");
            direct.setTimeout(5);
            for (Map.Entry<String, String> header : request.getHeaders().entrySet()) {
                direct.setHeader(header.getKey(), header.getValue());
            }
            return direct;
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("ads.proxy-retry-start", e);
            return null;
        }
    }

    private void retryDirect(Request request, Request direct, ResponseCallback callback) {
        ResponseCallback answer = new ResponseCallback() {
            @Override
            public void onError(Exception error) {
                fail(request, callback, error);
            }

            @Override
            public void onResponse(Response response) {
                deliver(request, callback, response);
            }
        };
        // Started off this thread, which holds the failed request's lock: starting takes the direct
        // request's lock, and its callbacks take the failed request's lock while holding their own.
        try {
            worker.execute(() -> {
                try {
                    if (!request.isCancelled()) execute(direct, answer);
                } catch (Throwable e) {
                    Diagnostics.note("ads.proxy-retry", e);
                    try {
                        fail(request, callback, new IOException(e));
                    } catch (Throwable unreported) {
                        Diagnostics.note("ads.proxy-retry-error", unreported);
                    }
                }
            });
        } catch (RejectedExecutionException e) {
            fail(request, callback, e);
        }
    }

    /** The playlist to give the player instead, or null to keep the original bytes. */
    private String rewrite(Request request, String responseUrl, String text) {
        String url = request.getUrl();
        if (Playlists.isMaster(text)) {
            // With the stream proxy on, the player asks the proxy; backups still need Twitch's URL.
            String usher = Playlists.channel(url) != null ? url : LiveProxy.originalOf(url);
            String login = usher == null ? null : Playlists.channel(usher);
            if (login != null) openSession(login, url, usher, Playlists.variants(text, responseUrl), request);
            return null;
        }
        if (!Playlists.isMediaPlaylist(text)) return null;
        String path = Playlists.path(url);
        Located located = path == null ? null : locate(path, text);
        if (located == null) {
            if (Playlists.hasStitchedAd(text)) AdBlock.issue("No session for an ad playlist: " + Playlists.describe(url));
            return null;
        }
        String marker = Playlists.unknownAdMarker(text);
        if (marker != null) AdBlock.noticeUnknownMarker(marker);
        if (located.session.firstPollBy(this)) AdBlock.log("Stream of " + located.session.login + " is played by another client than the one that loaded it");
        return located.session.media(this, request, located.variant, text);
    }

    private void openSession(String login, String url, String usher, List<Playlists.Variant> variants, Request request) {
        if (Playlists.isPreview(usher)) {
            synchronized (sessions) {
                for (Playlists.Variant v : variants) {
                    String path = Playlists.path(v.uri);
                    if (path != null) previewPaths.add(path);
                }
            }
            return;
        }
        Session session = new Session(this, login, url, usher, variants, request.getHeaders().get("User-Agent"));
        register(session);
        session.warmUp(this);
        AdBlock.log("Live session for " + login + ": " + variants.size() + " renditions, player type "
                + Playlists.playerType(usher) + (usher.equals(url) ? "" : " (through the stream proxy)"));
    }

    private static void register(Session session) {
        synchronized (sessions) {
            sessions.remove(session.key);
            sessions.put(session.key, session);
            SessionLimit.trim(sessions, session.key, MAX_SESSIONS);
        }
    }

    /** The session and rendition of a media playlist path, following a playlist that moved server. */
    private static Located locate(String path, String text) {
        synchronized (sessions) {
            if (previewPaths.contains(path)) return null;
            Session latest = null;
            for (Session s : sessions.values()) {
                Playlists.Variant v = s.byPath.get(path);
                if (v != null) return new Located(s, v);
                if (latest == null || s.lastPoll > latest.lastPoll) latest = s;
            }
            if (latest == null || latest.lastVariant == null) return null;
            long quiet = System.currentTimeMillis() - latest.lastPoll;
            if (quiet < MOVED_AFTER_MS || quiet > MOVED_WINDOW_MS || !Playlists.shareSegment(latest.lastPrimary, text)) {
                return null;
            }
            latest.byPath.put(path, latest.lastVariant);
            AdBlock.log("Playlist of " + latest.login + " moved to another server");
            return new Located(latest, latest.lastVariant);
        }
    }

    private static final class Located {
        final Session session;
        final Playlists.Variant variant;

        Located(Session session, Playlists.Variant variant) {
            this.session = session;
            this.variant = variant;
        }
    }

    /**
     * One live stream as the player loaded it, and its backup sources. Whichever client is asking
     * does the network work ({@code via}), since the client that opened the session may be gone.
     */
    private static final class Session implements SessionLimit.Used {
        final String login;
        /** The master playlist URL the player loaded. */
        final String key;
        /** Twitch's usher URL for the stream, the template for backup tokens. */
        final String usherUrl;
        /** Renditions by playlist path; guarded by {@link #sessions}. */
        final Map<String, Playlists.Variant> byPath = new HashMap<>();
        private final BackupSource[] sources = new BackupSource[BackupSessions.SOURCES.length];
        private final StreamSwitch streamSwitch = new StreamSwitch();
        private final String userAgent;
        volatile long lastPoll;
        volatile String lastPrimary = "";
        volatile Playlists.Variant lastVariant;
        private BackupSource lastGood;
        private long lastAdLog;
        private boolean firstMedia = true;
        /** The client that loaded the master playlist, until the first media playlist arrives. */
        private AdFreeHttpClient loader;

        Session(AdFreeHttpClient loader, String login, String key, String usherUrl, List<Playlists.Variant> variants,
                String userAgent) {
            this.loader = loader;
            this.login = login;
            this.key = key;
            this.usherUrl = usherUrl;
            this.userAgent = userAgent;
            for (Playlists.Variant v : variants) {
                String path = Playlists.path(v.uri);
                if (path != null) byPath.put(path, v);
            }
            for (int i = 0; i < sources.length; i++) sources[i] = new BackupSource(i, System::currentTimeMillis);
        }

        @Override
        public long lastUsed() {
            return lastPoll;
        }

        /** True once, when the first media playlist comes through another client than the loader. */
        synchronized boolean firstPollBy(AdFreeHttpClient client) {
            AdFreeHttpClient first = loader;
            loader = null;
            return first != null && first != client;
        }

        /** Opens the first source in the background: it serves full quality and was ad-free in every measurement. */
        void warmUp(AdFreeHttpClient via) {
            try {
                sources[0].start(opener(via, sources[0]), worker);
            } catch (RejectedExecutionException ignored) {
            }
        }

        synchronized String media(AdFreeHttpClient via, Request request, Playlists.Variant wanted, String primary) {
            lastPoll = System.currentTimeMillis();
            lastPrimary = primary;
            lastVariant = wanted;
            // The player waits for its first playlist anyway; later it plays from its buffer.
            long deadline = lastPoll + (firstMedia ? FIRST_BUDGET_MS : BACKUP_BUDGET_MS);
            firstMedia = false;
            String out = streamSwitch.choose(primary, () -> backup(via, request, wanted, deadline));
            switch (streamSwitch.lastOutcome()) {
                case SWITCHED_TO_BACKUP:
                    AdBlock.count(AdBlock.REPLACED);
                    AdBlock.log("Ad replaced for " + login + " from " + lastGood.name);
                    break;
                case BACK_TO_ORIGINAL:
                    // The next ad break starts again from the best quality.
                    lastGood = null;
                    AdBlock.log("Back to the original session of " + login);
                    break;
                case AD_KEPT:
                    long now = System.currentTimeMillis();
                    if (now - lastAdLog > 10_000) {
                        lastAdLog = now;
                        AdBlock.log("No ad-free backup for " + login + "; the ad stays");
                    }
                    break;
                default:
                    break;
            }
            return out;
        }

        /** The sources to try: the one that worked in this ad break first, then by quality. */
        private List<BackupSource> order() {
            List<BackupSource> list = new ArrayList<>(sources.length);
            if (lastGood != null) list.add(lastGood);
            for (BackupSource s : sources) if (s != lastGood) list.add(s);
            return list;
        }

        /** The matching rendition of a clean backup; a source that fails rests before the next try. */
        private String backup(AdFreeHttpClient via, Request request, Playlists.Variant wanted, long deadline) {
            for (BackupSource source : order()) {
                if (System.currentTimeMillis() >= deadline || request.isCancelled()) return null;
                if (source.resting()) continue;
                List<Playlists.Variant> variants = source.variants();
                if (variants == null) {
                    Future<?> opening;
                    try {
                        opening = source.start(opener(via, source), worker);
                    } catch (RejectedExecutionException e) {
                        return null;
                    }
                    if (opening != null && !BackupSource.await(opening, deadline, request::isCancelled)) {
                        // Not a failure: the opening goes on, and the next refresh can use it.
                        AdBlock.issue("Backup " + source.name + " was too slow this time");
                        return null;
                    }
                    variants = source.variants();
                    if (variants == null) continue;
                }
                Playlists.Variant v = Playlists.match(variants, wanted);
                if (v == null) {
                    AdBlock.issue("Backup " + source.name + " has no matching rendition");
                    source.coolDown();
                    continue;
                }
                Fetched f = via.fetch(userAgent, v.uri, deadline, request);
                if (f.text != null && Playlists.isCleanLive(f.text)) {
                    lastGood = source;
                    return f.text;
                }
                if (f.late) {
                    // Keep the opened backup: the next refresh, two seconds later, only needs this request.
                    AdBlock.issue("Backup " + source.name + " was too slow this time");
                    return null;
                }
                AdBlock.issue(f.text == null ? "Backup " + source.name + " playlist could not be loaded"
                        : "Backup " + source.name + " also has an ad");
                source.coolDown();
            }
            return null;
        }

        /** Opens on a worker thread and logs anything unexpected that stopped it. */
        private BackupSource.Opener opener(AdFreeHttpClient via, BackupSource source) {
            return () -> {
                List<Playlists.Variant> found = null;
                try {
                    if (!via.released) found = open(via, source);
                } catch (Throwable e) {
                    Diagnostics.note("ads.backup-open", e);
                }
                // A client released meanwhile says nothing about the source: the next client opens it.
                if (found == null && via.released) throw new CancellationException();
                return found;
            };
        }

        /** The renditions of a backup source, or null. */
        private List<Playlists.Variant> open(AdFreeHttpClient via, BackupSource source) {
            long deadline = System.currentTimeMillis() + OPEN_BUDGET_MS;
            String url;
            if (BackupSessions.PROXY.equals(BackupSessions.SOURCES[source.index])) {
                url = LiveProxy.proxyAvailable() ? LiveProxy.proxyUrl(AdBlock.proxyBase(), login) : null;
                if (url == null) return null; // No working stream proxy in the settings.
            } else {
                String[] token = BackupSessions.token(login, BackupSessions.SOURCES[source.index], deadline);
                if (token == null) {
                    AdBlock.issue("No " + source.name + " token from Twitch");
                    return null;
                }
                url = Playlists.withToken(usherUrl, token[0], token[1]);
            }
            String master = via.fetch(userAgent, url, deadline, null).text;
            if (master == null || !Playlists.isMaster(master)) {
                AdBlock.issue("Backup " + source.name + " master playlist could not be loaded");
                return null;
            }
            List<Playlists.Variant> parsed = Playlists.variants(master, url);
            if (parsed.isEmpty()) return null;
            AdBlock.log("Backup session for " + login + ": " + source.name);
            return parsed;
        }
    }

    /** A fetched playlist, or why there is none. */
    private static final class Fetched {
        final String text;
        /** True when the wait ended early (deadline or cancel); the source itself may be fine. */
        final boolean late;

        Fetched(String text, boolean late) {
            this.text = text;
            this.late = late;
        }
    }

    /** GET through the original client, waiting until the deadline or the player cancels. */
    private Fetched fetch(String userAgent, String url, long deadline, Request parent) {
        if (released || parent != null && parent.isCancelled()) return new Fetched(null, true);
        Request request = new Request(url, "GET");
        request.setTimeout(5);
        if (userAgent != null) request.setHeader("User-Agent", userAgent);
        CountDownLatch done = new CountDownLatch(1);
        byte[][] result = new byte[1][];
        try {
            original.execute(request, new ResponseCallback() {
                @Override
                public void onError(Exception error) {
                    done.countDown();
                }

                @Override
                public void onResponse(Response response) {
                    // Read even an error body to its end, which hands the connection back.
                    boolean ok = response.getStatus() == 200;
                    response.readContent(new Body() {
                        @Override
                        void complete(byte[] body) {
                            if (ok) result[0] = body;
                            done.countDown();
                        }

                        @Override
                        void failed(Exception error) {
                            done.countDown();
                        }
                    });
                }
            });
            while (!done.await(Math.min(CANCEL_POLL_MS, Math.max(0, deadline - System.currentTimeMillis())), TimeUnit.MILLISECONDS)) {
                if (System.currentTimeMillis() >= deadline || parent != null && parent.isCancelled()) {
                    request.cancel();
                    return new Fetched(null, true);
                }
            }
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
            request.cancel();
            return new Fetched(null, true);
        } catch (RuntimeException e) {
            // The client can be released between the check above and this call.
            return new Fetched(null, false);
        }
        return new Fetched(result[0] == null ? null : new String(result[0], StandardCharsets.UTF_8), false);
    }

    private static Response copy(Request request, Response original, byte[] body) {
        Response response = new Response(original.getStatus(), original.getUrl());
        response.setHeader("Content-Type", "application/vnd.apple.mpegurl");
        response.setHeader("Content-Length", Integer.toString(body.length));
        for (String name : new String[]{"Date", "Last-Modified", "ETag", "Cache-Control", "Age"}) {
            String value = original.getHeader(name);
            if (value != null) response.setHeader(name, value);
        }
        response.setConsumer(null, new StreamConsumer() {
            @Override
            public void consume(ReadCallback callback) {
                ByteBuffer buffer = ByteBuffer.allocateDirect(body.length);
                buffer.put(body);
                ((java.nio.Buffer) buffer).flip();
                synchronized (request.lock()) {
                    if (!request.isCancelled()) callback.onData(buffer, true);
                }
            }
        });
        return response;
    }

    /**
     * Under the request's lock, as Twitch's own clients call back (OkHttpClient, ByteBufferConsumer):
     * the player cancels under that lock, so no callback reaches it after a cancel.
     */
    private static void deliver(Request request, ResponseCallback callback, Response response) {
        synchronized (request.lock()) {
            if (!request.isCancelled()) callback.onResponse(response);
        }
    }

    private static void fail(Request request, ResponseCallback callback, Exception error) {
        synchronized (request.lock()) {
            if (!request.isCancelled()) callback.onError(error);
        }
    }

    /** Reads a body nobody needs to its end, which hands the connection back. */
    private static void discard(Response response) {
        response.readContent(new Body() {
            @Override
            void complete(byte[] body) {
            }

            @Override
            void failed(Exception error) {
            }
        });
    }

    /** Collects a response body into memory; playlists are small. */
    private abstract static class Body implements ReadCallback {
        private final ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        private boolean finished;

        abstract void complete(byte[] body);

        abstract void failed(Exception error);

        @Override
        public int getTimeout() {
            return 5;
        }

        @Override
        public void onData(ByteBuffer data, boolean end) {
            byte[] chunk = new byte[data.remaining()];
            data.get(chunk);
            onData(chunk, chunk.length, end);
        }

        @Override
        public synchronized void onData(byte[] data, int length, boolean end) {
            if (finished) return;
            if (length < 0 || length > data.length || bytes.size() + length > BODY_LIMIT) {
                onError(new IOException("Playlist too large"));
                return;
            }
            bytes.write(data, 0, length);
            if (end) {
                finished = true;
                complete(bytes.toByteArray());
            }
        }

        @Override
        public synchronized void onError(Exception error) {
            if (finished) return;
            finished = true;
            failed(error);
        }
    }
}
