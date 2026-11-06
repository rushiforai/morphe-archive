package me.dyskal.ytmrpc;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;

import okhttp3.Call;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

/** Discord Gateway artwork uses mp:external references, unlike the desktop RPC URL convenience API. */
public final class DiscordExternalAssets {
    private static final OkHttpClient HTTP = Http.CLIENT.newBuilder().connectTimeout(5, TimeUnit.SECONDS)
            .readTimeout(10, TimeUnit.SECONDS).callTimeout(10, TimeUnit.SECONDS).build();
    private static final class Entry {
        final String asset;
        final long retryAt;
        final DiscordFailure error;
        Entry(String asset, long retryAt, DiscordFailure error) { this.asset = asset; this.retryAt = retryAt; this.error = error; }
    }
    private final LinkedHashMap<String, Entry> cache = new LinkedHashMap<>(128, .75f, true);
    private final AtomicReference<Call> active = new AtomicReference<>();
    private final String endpoint;
    public DiscordExternalAssets() { this("https://discord.com/api/v9/applications/"); }
    DiscordExternalAssets(String endpoint) { this.endpoint = endpoint; }

    public void cancel() { Call call = active.getAndSet(null); if (call != null) call.cancel(); }
    public synchronized String cached(String appId, String imageUrl) {
        Entry entry = cache.get(appId + '\n' + imageUrl); return entry == null ? null : entry.asset;
    }
    public synchronized boolean canRequest(String appId, String imageUrl) {
        Entry entry = cache.get(appId + '\n' + imageUrl);
        return entry == null || (entry.asset == null && System.currentTimeMillis() >= entry.retryAt);
    }
    public synchronized DiscordFailure cachedFailure(String appId, String imageUrl) {
        Entry entry = cache.get(appId + '\n' + imageUrl); return entry == null ? null : entry.error;
    }
    private synchronized void remember(String key, Entry entry) {
        cache.put(key, entry);
        while (cache.size() > 128) cache.remove(cache.keySet().iterator().next());
    }

    public String resolve(String appId, String token, String imageUrl) throws Exception {
        if (!DiscordOAuth.isValidApplicationId(appId) || DiscordTrack.publicUrl(imageUrl) == null) {
            throw new DiscordFailure(DiscordFailure.Kind.CONFIGURATION, "Artwork needs a public HTTP(S) URL and valid application ID");
        }
        String cached = cached(appId, imageUrl);
        if (cached != null) return cached;
        if (Thread.currentThread().isInterrupted()) throw cancelled();
        String key = appId + '\n' + imageUrl;
        String body = new JSONObject().put("urls", new JSONArray().put(imageUrl)).toString();
        Call call = HTTP.newCall(new Request.Builder().url(endpoint + appId + "/external-assets")
                .header("Authorization", "Bearer " + token)
                .header("User-Agent", "DyskalDiscordRPC (https://github.com/Dyskal/morphe-yt-music-discord-rpc; 1.0)")
                .post(RequestBody.create(MediaType.parse("application/json"), body)).build());
        active.set(call);
        if (Thread.currentThread().isInterrupted()) call.cancel();
        try (Response response = call.execute()) {
            if (!response.isSuccessful()) {
                long delay = Http.retryAfterMillis(response.header("Retry-After"), 60_000);
                // An artwork-route rejection must not discard a working music presence/login.
                throw new DiscordFailure(response.code() == 429 || response.code() >= 500
                        ? DiscordFailure.Kind.TRANSIENT : DiscordFailure.Kind.CONFIGURATION,
                        "Discord artwork HTTP " + response.code(), response.code(), delay);
            }
            String result = Http.readBody(response, "Discord artwork");
            String path;
            try { path = new JSONArray(result).getJSONObject(0).getString("external_asset_path"); }
            catch (Exception error) { throw new DiscordFailure(DiscordFailure.Kind.PROTOCOL, "Discord returned invalid artwork JSON"); }
            if (!path.startsWith("external/")) throw new DiscordFailure(DiscordFailure.Kind.PROTOCOL, "Discord returned an invalid external artwork reference");
            String asset = "mp:" + path;
            remember(key, new Entry(asset, 0, null));
            return asset;
        } catch (IOException error) {
            DiscordFailure failure = call.isCanceled() || Thread.currentThread().isInterrupted() ? cancelled()
                    : error instanceof DiscordFailure ? (DiscordFailure) error : DiscordFailure.network(error);
            if (failure.kind != DiscordFailure.Kind.CANCELLED) remember(key,
                    new Entry(null, System.currentTimeMillis() + Math.max(60_000, failure.retryAfterMillis), failure));
            throw failure;
        } finally { active.compareAndSet(call, null); }
    }
    private static DiscordFailure cancelled() { return new DiscordFailure(DiscordFailure.Kind.CANCELLED, "Artwork lookup cancelled"); }
}
