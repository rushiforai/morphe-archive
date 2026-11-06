package me.dyskal.ytmrpc;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.ActivityNotFoundException;
import android.media.MediaMetadata;
import android.media.session.PlaybackState;
import android.net.Uri;
import android.os.SystemClock;
import android.os.Handler;
import android.os.Looper;

import org.json.JSONObject;

import java.util.concurrent.Executors;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.Future;
import java.util.concurrent.locks.ReentrantLock;
import java.lang.ref.WeakReference;
import java.util.function.Consumer;

/** Application-level initialization covers normal and service-only playback starts. */
public final class DiscordRpcPatch {
    public static final String DEFAULT_APPLICATION_ID = "1559278040175878146";
    private static final ScheduledExecutorService worker = Executors.newSingleThreadScheduledExecutor();
    private static final ExecutorService authorizationIO = Executors.newSingleThreadExecutor();
    private static final ExecutorService artworkIO = Executors.newSingleThreadExecutor();
    private static final DiscordExternalAssets externalAssets = new DiscordExternalAssets();
    private static final ReentrantLock tokenRefreshLock = new ReentrantLock();
    private static final CopyOnWriteArrayList<WeakReference<Runnable>> settingsListeners = new CopyOnWriteArrayList<>();
    private static final DiscordAuthorization authorization = new DiscordAuthorization();
    private static final AtomicReference<DiscordOAuth> exchangeRequest = new AtomicReference<>();
    private static final Object credentialsLock = new Object();
    private static final Handler main = new Handler(Looper.getMainLooper());
    private static volatile String status = "Not connected";
    private static MediaMetadata metadata;
    private static PlaybackState playback;
    private static final DiscordMetadataState trackMetadata = new DiscordMetadataState();
    private static volatile boolean initialized, authorized;
    private static SharedPreferences preferences;
    private static DiscordTokenStore tokenStore;
    private static JSONObject credentials = new JSONObject();
    private static long credentialsEpoch;
    private static volatile DiscordGateway gateway;
    private static volatile long connectionEpoch;
    private static ScheduledFuture<?> ticker, idleClose, authorizationTimeout;
    private static String previousTrackKey;
    private static long previousStart;
    private static Future<?> artworkTask;
    private static final AtomicReference<DiscordOAuth> artworkTokenRequest = new AtomicReference<>();
    private static long artworkRevision;
    private static String artworkKey, artwork;
    private static volatile String artworkWarning;
    private static long artworkRetryAt;

    private DiscordRpcPatch() { }

    public static String getApplicationId() {
        return preferences == null ? DEFAULT_APPLICATION_ID : preferences.getString("application_id", DEFAULT_APPLICATION_ID);
    }
    public static String status() { return artworkWarning == null ? status : status + "\nCover: " + artworkWarning; }
    public static boolean usesArtistHeadline() { return preferences == null || "artist".equals(preferences.getString("headline", "artist")); }
    public static void addSettingsListener(Runnable listener) {
        for (WeakReference<Runnable> entry : settingsListeners) if (entry.get() == null) settingsListeners.remove(entry);
        settingsListeners.add(new WeakReference<>(listener));
    }
    private static void notifySettings() {
        main.post(() -> {
            for (WeakReference<Runnable> entry : settingsListeners) {
                Runnable listener = entry.get();
                if (listener == null) settingsListeners.remove(entry);
                else listener.run();
            }
        });
    }
    private static void setStatus(String value) { status = value; notifySettings(); }
    public static boolean isAuthorized() { return authorized; }
    public static boolean isAuthorizing() { return authorization.isBusy(); }
    public static boolean isSharingEnabled() { return preferences != null && preferences.getBoolean("enabled", false); }

    public static synchronized void initialize(Context value) {
        if (initialized) return;
        DiscordDiagnostics.enableAndroidLogging();
        Context context = value.getApplicationContext();
        preferences = context.getSharedPreferences("dyskal_discord_settings", Context.MODE_PRIVATE);
        tokenStore = new DiscordTokenStore(context);
        initialized = true;
        worker.execute(() -> {
            try {
                JSONObject saved;
                synchronized (credentialsLock) {
                    credentials = tokenStore.read();
                    updateAuthorized();
                    saved = copyCredentials();
                }
                DiscordAuthorization.Attempt restored = authorization.restore(saved.optJSONObject("pending"), System.currentTimeMillis());
                if (restored != null) {
                    scheduleAuthorizationTimeout(restored);
                    setStatus("Waiting for Discord authorization");
                } else {
                    if (saved.has("pending") && !authorization.isBusy()) removePending(null);
                    setStatus(authorized ? "Signed in; waiting for playback" : "Not connected");
                }
                reconcileSafely();
            } catch (Exception error) { report("Load Discord credentials", error); }
        });
    }

    public static void onSetMetadata(MediaMetadata value) {
        worker.execute(() -> {
            metadata = value;
            trackMetadata.metadata(value == null ? null : DiscordTrack.from(value));
            if (initialized && isSharingEnabled()) reconcileSafely();
        });
    }
    public static void onSetPlaybackState(PlaybackState value) {
        worker.execute(() -> {
            playback = value;
            if (initialized && isSharingEnabled()) reconcileSafely();
        });
    }

    public static void onNativeVideoId(String videoId) {
        if (DiscordTrack.videoId(videoId) == null) return;
        worker.execute(() -> {
            if (!trackMetadata.videoId(videoId)) return;
            if (initialized && isSharingEnabled()) reconcileSafely();
        });
    }

    public static void onNativeQueueMetadata(byte[] renderer) {
        if (renderer == null || renderer.length > 1_048_576) return;
        worker.execute(() -> {
            try {
                DiscordNativeMetadata data = DiscordNativeMetadata.parse(renderer);
                if (data == null) return;
                if (trackMetadata.nativeMetadata(data)) DiscordDiagnostics.info("Native track metadata: video=true, artist=" + (data.artistId != null)
                        + ", album=" + (data.albumId != null) + ", cover=" + (data.artworkUrl != null));
                if (initialized && isSharingEnabled()) reconcileSafely();
            } catch (Exception error) { DiscordDiagnostics.failure("Decode native track metadata", error); }
        });
    }

    public static void setSharingEnabled(boolean enabled) {
        if (preferences == null) return;
        preferences.edit().putBoolean("enabled", enabled && authorized).apply();
        notifySettings();
        if (!enabled) {
            DiscordGateway active = gateway;
            if (active != null) active.close();
        }
        worker.execute(() -> {
            reconcileSafely();
            if (!enabled) setStatus(authorized ? "Signed in; sharing is off" : "Not connected");
        });
    }

    /** Duplicate taps are ignored immediately; an existing grant reconnects without browser login. */
    public static void authorize(Context context, String applicationId) {
        initialize(context);
        String appId = applicationId.trim();
        if (!DiscordOAuth.isValidApplicationId(appId)) {
            report("Connect", new DiscordFailure(DiscordFailure.Kind.CONFIGURATION, "Enter a valid 17–20 digit application ID")); return;
        }
        DiscordAuthorization.Attempt attempt = authorization.begin(appId, System.currentTimeMillis(), DiscordAuthLauncher.taskId(context));
        if (attempt == null) return;
        notifySettings();
        worker.execute(() -> {
            try {
                if (!authorization.isCurrent(attempt)) return;
                boolean reusable;
                synchronized (credentialsLock) {
                    reusable = appId.equals(getApplicationId()) && appId.equals(credentials.optString("app_id"))
                            && !credentials.optString("access_token").isEmpty()
                            && (credentials.optLong("expires_at") > System.currentTimeMillis() || !credentials.optString("refresh_token").isEmpty());
                }
                if (reusable) {
                    synchronized (authorization) {
                        if (!authorization.isCurrent(attempt)) return;
                        removePending(null);
                        authorization.finish(attempt);
                        preferences.edit().putBoolean("enabled", true).apply();
                    }
                    if (gateway == null) setStatus("Signed in; waiting for playback");
                    else notifySettings();
                    reconcileSafely();
                    return;
                }
                String url = DiscordOAuth.authorizeUrl(appId, attempt.state, attempt.verifier);
                synchronized (authorization) {
                    if (!authorization.isCurrent(attempt)) return;
                    synchronized (credentialsLock) {
                        JSONObject next = copyCredentials().put("pending", attempt.toJson());
                        tokenStore.write(next);
                        credentials = next;
                    }
                    preferences.edit().putBoolean("enabled", false).apply();
                    stopAll();
                    scheduleAuthorizationTimeout(attempt);
                }
                setStatus("Waiting for Discord authorization");
                main.post(() -> {
                    if (!authorization.isCurrent(attempt)) return;
                    try { DiscordAuthLauncher.launch(context, url); }
                    catch (ActivityNotFoundException error) {
                        worker.execute(() -> finishAuthorization(attempt,
                                new DiscordFailure(DiscordFailure.Kind.CONFIGURATION, "No Discord app or browser is available for sign-in")));
                    } catch (Exception error) { worker.execute(() -> finishAuthorization(attempt, error)); }
                });
            } catch (Exception error) { finishAuthorization(attempt, error); }
        });
    }

    public static void callback(Context context, Uri uri, Consumer<DiscordAuthorization.Attempt> accepted) {
        initialize(context);
        if (uri == null || !"ytmdiscord".equals(uri.getScheme()) || !"oauth2".equals(uri.getHost()) || !"/callback".equals(uri.getPath())) {
            main.post(() -> accepted.accept(null)); return;
        }
        worker.execute(() -> {
            DiscordAuthorization.Attempt attempt;
            try { attempt = authorization.claim(uri.getQueryParameter("state"), System.currentTimeMillis()); }
            catch (Exception error) {
                DiscordDiagnostics.failure("OAuth callback", error);
                main.post(() -> accepted.accept(null)); return;
            }
            // Runs after initialization restores pending PKCE state, including after process death.
            main.post(() -> accepted.accept(attempt));
            String code = uri.getQueryParameter("code"), errorCode = uri.getQueryParameter("error");
            if (errorCode != null || code == null) {
                finishAuthorization(attempt, new DiscordFailure("invalid_scope".equals(errorCode)
                        ? DiscordFailure.Kind.CONFIGURATION : DiscordFailure.Kind.CANCELLED,
                        "invalid_scope".equals(errorCode) ? "Discord denied the presence scope; check Social SDK configuration" : "Discord authorization cancelled"));
                return;
            }
            authorizationIO.execute(() -> {
                DiscordOAuth request = new DiscordOAuth();
                exchangeRequest.set(request);
                try {
                    if (!authorization.isCurrent(attempt)) { request.cancel(); return; }
                    JSONObject result = request.exchange(attempt.appId, code, attempt.verifier);
                    worker.execute(() -> completeAuthorization(attempt, result));
                } catch (Exception error) { worker.execute(() -> finishAuthorization(attempt, error)); }
                finally { exchangeRequest.compareAndSet(request, null); }
            });
        });
    }

    public static void cancelAuthorization() {
        DiscordAuthorization.Attempt attempt = authorization.cancel();
        DiscordOAuth request = exchangeRequest.getAndSet(null);
        if (request != null) request.cancel();
        if (attempt == null) return;
        notifySettings();
        worker.execute(() -> {
            try {
                if (removePending(attempt)) { cancel(authorizationTimeout); setStatus("Authorization cancelled"); }
            } catch (Exception error) { report("Cancel authorization", error); }
        });
    }

    public static void disconnect(Context context) {
        initialize(context);
        authorization.cancel();
        DiscordOAuth request = exchangeRequest.getAndSet(null);
        if (request != null) request.cancel();
        DiscordGateway active = gateway;
        if (active != null) active.close();
        preferences.edit().putBoolean("enabled", false).apply();
        synchronized (credentialsLock) { ++credentialsEpoch; }
        worker.execute(() -> {
            stopAll(); cancel(authorizationTimeout);
            try {
                clearCredentials(false);
                setStatus("Not connected");
            } catch (Exception error) { report("Forget Discord account", error); }
        });
    }

    private static void completeAuthorization(DiscordAuthorization.Attempt attempt, JSONObject result) {
        try {
            synchronized (authorization) {
                if (!authorization.isCurrent(attempt)) return;
                synchronized (credentialsLock) {
                    JSONObject next = tokenData(attempt.appId, result, "");
                    tokenStore.write(next);
                    preferences.edit().putString("application_id", attempt.appId).putBoolean("enabled", true).apply();
                    credentials = next; ++credentialsEpoch; updateAuthorized();
                }
                authorization.finish(attempt);
            }
            cancel(authorizationTimeout);
            setStatus("Signed in; play a track to share presence");
            reconcileSafely();
        } catch (Exception error) { finishAuthorization(attempt, error); }
    }

    private static void finishAuthorization(DiscordAuthorization.Attempt attempt, Throwable error) {
        if (!authorization.finish(attempt)) return;
        cancel(authorizationTimeout);
        try { removePending(attempt); }
        catch (Exception storageError) { report("Clear pending authorization", storageError); }
        report("Discord sign-in", error);
    }

    private static void scheduleAuthorizationTimeout(DiscordAuthorization.Attempt attempt) {
        cancel(authorizationTimeout);
        long remaining = Math.max(1, DiscordAuthorization.TIMEOUT_MILLIS - (System.currentTimeMillis() - attempt.startedAt));
        authorizationTimeout = worker.schedule(() -> {
            if (!authorization.isCurrent(attempt)) return;
            DiscordOAuth request = exchangeRequest.getAndSet(null);
            if (request != null) request.cancel();
            finishAuthorization(attempt, new DiscordFailure(DiscordFailure.Kind.CANCELLED, "Authorization expired; connect again"));
        }, remaining, TimeUnit.MILLISECONDS);
    }

    private static boolean removePending(DiscordAuthorization.Attempt attempt) throws Exception {
        synchronized (credentialsLock) {
            JSONObject pending = credentials.optJSONObject("pending");
            if (pending == null || (attempt != null && !attempt.state.equals(pending.optString("state")))) return false;
            JSONObject next = copyCredentials(); next.remove("pending");
            tokenStore.write(next); credentials = next; updateAuthorized(); return true;
        }
    }

    private static JSONObject copyCredentials() throws Exception { return new JSONObject(credentials.toString()); }
    private static void clearCredentials(boolean keepPending) throws Exception {
        synchronized (credentialsLock) {
            JSONObject next = keepPending ? copyCredentials() : new JSONObject();
            for (String key : new String[]{"app_id", "access_token", "refresh_token", "expires_at"}) next.remove(key);
            if (keepPending) tokenStore.write(next); else tokenStore.clear();
            credentials = next; ++credentialsEpoch; updateAuthorized();
        }
    }
    private static void updateAuthorized() {
        authorized = getApplicationId().equals(credentials.optString("app_id")) && !credentials.optString("access_token").isEmpty();
        notifySettings();
    }
    private static JSONObject tokenData(String appId, JSONObject result, String oldRefresh) throws Exception {
        return new JSONObject().put("app_id", appId).put("access_token", result.getString("access_token"))
                .put("refresh_token", result.optString("refresh_token", oldRefresh))
                .put("expires_at", System.currentTimeMillis() + result.getLong("expires_in") * 1000);
    }

    /** Called by the gateway's token I/O executor. No lock is held while HTTP runs. */
    private static String accessToken(boolean forceRefresh, AtomicReference<DiscordOAuth> requests) throws Exception {
        tokenRefreshLock.lockInterruptibly();
        try { return accessTokenLocked(forceRefresh, requests); }
        finally { tokenRefreshLock.unlock(); }
    }

    private static String accessTokenLocked(boolean forceRefresh, AtomicReference<DiscordOAuth> requests) throws Exception {
        if (!isSharingEnabled() || Thread.currentThread().isInterrupted()) {
            throw new DiscordFailure(DiscordFailure.Kind.CANCELLED, "Token request cancelled");
        }
        JSONObject snapshot;
        long epoch;
        synchronized (credentialsLock) { snapshot = copyCredentials(); epoch = credentialsEpoch; }
        String appId = snapshot.optString("app_id");
        if (!appId.equals(getApplicationId()) || snapshot.optString("access_token").isEmpty()) {
            throw new DiscordFailure(DiscordFailure.Kind.AUTHORIZATION, "No saved Discord authorization; connect again");
        }
        if (!forceRefresh && snapshot.optLong("expires_at") > System.currentTimeMillis() + 60_000) return snapshot.getString("access_token");
        String refresh = snapshot.optString("refresh_token");
        if (refresh.isEmpty()) throw new DiscordFailure(DiscordFailure.Kind.AUTHORIZATION, "Discord authorization expired; sign in again");
        DiscordOAuth request = new DiscordOAuth();
        requests.set(request);
        try {
            JSONObject result = request.refresh(appId, refresh);
            synchronized (credentialsLock) {
                if (epoch != credentialsEpoch || request.isCancelled() || !isSharingEnabled() || Thread.currentThread().isInterrupted()) {
                    throw new DiscordFailure(DiscordFailure.Kind.CANCELLED, "Token refresh cancelled");
                }
                JSONObject next = tokenData(appId, result, refresh);
                if (credentials.has("pending")) next.put("pending", credentials.getJSONObject("pending"));
                tokenStore.write(next); credentials = next; ++credentialsEpoch; updateAuthorized();
            }
            return result.getString("access_token");
        } finally { requests.compareAndSet(request, null); }
    }

    private static void reconcileSafely() {
        try { reconcile(); }
        catch (Exception error) { report("Presence update", error); }
    }

    private static void reconcile() throws Exception {
        if (!isSharingEnabled() || !authorized) {
            stopAll(); return;
        }
        MediaMetadata track = metadata;
        PlaybackState state = playback;
        if (!trackMetadata.isCurrent()) {
            stopTicker();
            cancelArtwork();
            if (gateway != null) gateway.update(DiscordPresence.update(null), "clear");
            return;
        }
        String title = track == null ? null : track.getString(MediaMetadata.METADATA_KEY_TITLE);
        boolean playing = state != null && state.getState() == PlaybackState.STATE_PLAYING
                && title != null && !title.trim().isEmpty();
        long now = SystemClock.elapsedRealtime();
        long duration = track == null ? 0 : track.getLong(MediaMetadata.METADATA_KEY_DURATION);
        long position = state == null ? -1 : state.getPosition();
        if (playing && position >= 0 && state.getLastPositionUpdateTime() > 0) {
            position += (long) (Math.max(0, now - state.getLastPositionUpdateTime()) * state.getPlaybackSpeed());
        }
        if (duration > 0 && position >= duration) playing = false;
        if (!playing) {
            stopTicker();
            cancelArtwork();
            if (gateway != null) {
                gateway.update(DiscordPresence.update(null), "clear");
                if (idleClose == null) idleClose = worker.schedule(() -> {
                    stopGateway(); idleClose = null; setStatus("Signed in; waiting for playback");
                }, 60, TimeUnit.SECONDS);
            }
            return;
        }
        cancel(idleClose); idleClose = null;
        // Also rechecks artwork backoff/cache expiry; playback callbacks alone do not retry failed covers.
        if (ticker == null) ticker = worker.scheduleWithFixedDelay(DiscordRpcPatch::reconcileSafely, 1, 1, TimeUnit.SECONDS);
        if (gateway == null) {
            long epoch = ++connectionEpoch;
            gateway = new DiscordGateway(getApplicationId(), new DiscordGateway.TokenProvider() {
                private final AtomicReference<DiscordOAuth> requests = new AtomicReference<>();
                @Override public String get(boolean forceRefresh) throws Exception { return accessToken(forceRefresh, requests); }
                @Override public void cancel() {
                    DiscordOAuth request = requests.getAndSet(null);
                    if (request != null) request.cancel();
                }
            }, new DiscordGateway.StatusListener() {
                @Override public void changed(String value) { if (epoch == connectionEpoch) setStatus(value); }
                @Override public void failed(DiscordFailure error) {
                    worker.execute(() -> {
                        if (epoch != connectionEpoch) return;
                        connectionFailed(error);
                    });
                }
            });
            gateway.start();
        }
        DiscordTrack snapshot = trackMetadata.snapshot();
        ensureArtwork(snapshot);
        long wallNow = System.currentTimeMillis();
        JSONObject activity = DiscordPresence.track(getApplicationId(), snapshot, usesArtistHeadline(), artwork,
                duration, position, state.getPlaybackSpeed(), wallNow);
        String trackKey = snapshot.key() + '\n' + artwork + '\n' + usesArtistHeadline() + '\n' + duration + '\n' + state.getPlaybackSpeed();
        boolean timed = activity.has("timestamps");
        long start = timed ? wallNow - position : -1;
        if (!trackKey.equals(previousTrackKey) || Math.abs(start - previousStart) > 2000) { previousTrackKey = trackKey; previousStart = start; }
        gateway.update(DiscordPresence.update(activity), trackKey + '\n' + previousStart);
    }

    private static void stopGateway() {
        if (gateway != null) { ++connectionEpoch; gateway.close(); gateway = null; }
    }
    private static void stopAll() {
        stopGateway(); stopTicker(); cancelArtwork(); cancel(idleClose); idleClose = null;
    }
    private static void stopTicker() { cancel(ticker); ticker = null; }
    private static void cancel(ScheduledFuture<?> task) { if (task != null) task.cancel(false); }
    private static void report(String operation, Throwable error) {
        DiscordDiagnostics.failure(operation, error); setStatus(operation + ": " + DiscordFailure.describe(error));
    }

    /** Normal preference save: changing applications explicitly disconnects and requires a new grant. */
    public static boolean setApplicationId(String value) {
        String id = value == null ? "" : value.trim();
        if (!DiscordOAuth.isValidApplicationId(id) || preferences == null) return false;
        if (id.equals(getApplicationId())) return true;
        cancelAuthorization();
        DiscordGateway active = gateway;
        if (active != null) active.close();
        preferences.edit().putBoolean("enabled", false).apply();
        worker.execute(() -> {
            stopAll();
            try {
                synchronized (credentialsLock) {
                    clearCredentials(false);
                    preferences.edit().putString("application_id", id).putBoolean("enabled", false).apply();
                }
                setStatus("Application ID saved; connect to Discord");
            } catch (Exception error) { report("Save application ID", error); }
        });
        return true;
    }

    public static void setArtistHeadline(boolean artist) {
        if (preferences == null) return;
        preferences.edit().putString("headline", artist ? "artist" : "application").apply();
        notifySettings(); worker.execute(DiscordRpcPatch::reconcileSafely);
    }

    private static void ensureArtwork(DiscordTrack track) {
        String appId = getApplicationId();
        String key = appId + '\n' + track.key();
        if (!key.equals(artworkKey)) {
            cancelArtwork(); artworkKey = key;
        }
        if (track.artworkUrl == null) {
            String warning = "Playback metadata has no public cover URL or YouTube video ID";
            if (!warning.equals(artworkWarning)) { artworkWarning = warning; notifySettings(); }
            return;
        }
        String cached = externalAssets.cached(appId, track.artworkUrl);
        if (cached != null) { artwork = cached; return; }
        if (artworkTask != null || System.currentTimeMillis() < artworkRetryAt) return;
        if (!externalAssets.canRequest(appId, track.artworkUrl)) {
            DiscordFailure failure = externalAssets.cachedFailure(appId, track.artworkUrl);
            if (failure != null && !failure.getMessage().equals(artworkWarning)) {
                artworkWarning = failure.getMessage(); notifySettings();
            }
            return;
        }
        long revision = artworkRevision;
        artworkTask = artworkIO.submit(() -> {
            try {
                String token = accessToken(false, artworkTokenRequest);
                String resolved = externalAssets.resolve(appId, token, track.artworkUrl);
                worker.execute(() -> {
                    if (revision != artworkRevision || !key.equals(artworkKey)) return;
                    artworkTask = null; artwork = resolved; artworkWarning = null;
                    notifySettings(); reconcileSafely();
                });
            } catch (Exception error) {
                worker.execute(() -> {
                    if (revision != artworkRevision || !key.equals(artworkKey)) return;
                    artworkTask = null;
                    if (error instanceof DiscordFailure && ((DiscordFailure) error).kind == DiscordFailure.Kind.CANCELLED) return;
                    if (error instanceof DiscordFailure && ((DiscordFailure) error).kind == DiscordFailure.Kind.AUTHORIZATION) {
                        connectionFailed((DiscordFailure) error); return;
                    }
                    DiscordDiagnostics.failure("Artwork lookup", error);
                    artworkRetryAt = System.currentTimeMillis() + Math.max(60_000,
                            error instanceof DiscordFailure ? ((DiscordFailure) error).retryAfterMillis : 0);
                    artworkWarning = DiscordFailure.describe(error); notifySettings();
                });
            }
        });
    }

    private static void cancelArtwork() {
        boolean changed = artworkKey != null || artworkWarning != null;
        ++artworkRevision;
        if (artworkTask != null) artworkTask.cancel(true);
        artworkTask = null; artworkKey = null; artwork = null; artworkWarning = null;
        artworkRetryAt = 0;
        externalAssets.cancel();
        DiscordOAuth token = artworkTokenRequest.getAndSet(null);
        if (token != null) token.cancel();
        if (changed) notifySettings();
    }

    private static void connectionFailed(DiscordFailure error) {
        preferences.edit().putBoolean("enabled", false).apply();
        stopAll();
        if (error.kind == DiscordFailure.Kind.AUTHORIZATION) {
            try {
                clearCredentials(true);
            } catch (Exception storageError) { report("Clear rejected authorization", storageError); }
        }
        report("Discord connection", error);
    }
}
