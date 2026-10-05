package dev.twitchpatches.extension.emotes;

import java.nio.charset.StandardCharsets;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.Future;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.function.Consumer;
import org.json.JSONException;

final class EmoteCatalog {
    private static final long TTL = 15 * 60 * 1000L;
    private static final long BACKOFF = 60 * 1000L;
    private final ThreadPoolExecutor workers = new ThreadPoolExecutor(2, 2, 0, TimeUnit.MILLISECONDS,
            new LinkedBlockingQueue<>(16), task -> { Thread thread = new Thread(task, "TwitchEmoteCatalog"); thread.setDaemon(true); return thread; });
    private final Map<String, Channel> channels = new LinkedHashMap<>(8, 0.75f, true);
    private final Channel global = new Channel();
    private final Consumer<String> changed;
    private final Fetcher fetcher;
    private final Runnable unavailable;

    interface Fetcher { String get(String url, boolean optional) throws java.io.IOException; }

    EmoteCatalog(Consumer<String> changed) {
        this(changed, (url, optional) -> new String(EmoteHttp.get(url, 8 * 1024 * 1024, optional), StandardCharsets.UTF_8),
                () -> android.util.Log.w("TwitchPatchesEmotes", "Catalog provider unavailable"));
    }

    EmoteCatalog(Consumer<String> changed, Fetcher fetcher, Runnable unavailable) {
        this.changed = changed;
        this.fetcher = fetcher;
        this.unavailable = unavailable;
    }

    synchronized void ensure(String id) {
        schedule(null, global, 0);
        schedule(null, global, 1);
        if (id == null) return;
        Channel state = channels.get(id);
        if (state == null) {
            state = new Channel();
            state.combined = global.combined;
            channels.put(id, state);
            if (channels.size() > 8) {
                String oldest = channels.keySet().iterator().next();
                cancel(channels.remove(oldest));
            }
        }
        schedule(id, state, 0);
        schedule(id, state, 1);
    }

    synchronized Map<String, Emote> snapshot(String id) {
        Channel state = id == null ? null : channels.get(id);
        return state == null ? global.combined : state.combined;
    }

    synchronized void cancelOutside(String id) {
        channels.forEach((key, state) -> { if (!key.equals(id)) cancel(state); });
        workers.purge();
    }

    synchronized void cancelPending() {
        cancel(global);
        channels.values().forEach(EmoteCatalog::cancel);
        workers.purge();
    }

    private static void cancel(Channel state) {
        for (Provider provider : state.providers) {
            if (provider.task != null) {
                provider.generation++;
                provider.task.cancel(true);
                provider.task = null;
            }
        }
    }

    private void schedule(String id, Channel state, int index) {
        Provider provider = state.providers[index];
        long now = System.currentTimeMillis();
        if (provider.task != null || now < provider.retryAfter || now - provider.loadedAt < TTL) return;
        long generation = ++provider.generation;
        try {
            provider.task = workers.submit(() -> load(id, state, index, generation));
        } catch (RejectedExecutionException error) { provider.retryAfter = now + BACKOFF; }
    }

    private void load(String id, Channel state, int index, long generation) {
        Map<String, Emote> loaded = null;
        try {
            String url = index == 0 ? (id == null ? EmoteProviders.BTTV_GLOBAL : "https://api.betterttv.net/3/cached/users/twitch/" + id)
                    : (id == null ? EmoteProviders.SEVEN_GLOBAL : "https://7tv.io/v3/users/twitch/" + id);
            String json = fetcher.get(url, id != null);
            loaded = index == 0 ? EmoteProviders.bttv(json, id == null) : EmoteProviders.sevenTv(json, id == null);
        } catch (java.io.IOException | JSONException error) {
            unavailable.run();
        }
        synchronized (this) {
            Provider provider = state.providers[index];
            if (provider.generation != generation || (id != null && channels.get(id) != state)) return;
            provider.task = null;
            long now = System.currentTimeMillis();
            if (loaded == null) { provider.retryAfter = now + BACKOFF; return; }
            provider.entries = Collections.unmodifiableMap(loaded);
            provider.loadedAt = now;
            provider.retryAfter = 0;
            if (id == null) {
                global.combined = combine(Collections.emptyMap(), global.providers[0].entries, global.providers[1].entries);
                channels.values().forEach(channel -> channel.combined = combine(global.combined,
                        channel.providers[0].entries, channel.providers[1].entries));
            } else state.combined = combine(global.combined, state.providers[0].entries, state.providers[1].entries);
        }
        changed.accept(id);
    }

    static Map<String, Emote> combine(Map<String, Emote> globals, Map<String, Emote> bttv, Map<String, Emote> seven) {
        Map<String, Emote> result = new LinkedHashMap<>(globals);
        result.putAll(bttv);
        result.putAll(seven);
        return Collections.unmodifiableMap(result);
    }

    private static final class Channel {
        final Provider[] providers = {new Provider(), new Provider()};
        Map<String, Emote> combined = Collections.emptyMap();
    }

    private static final class Provider {
        Map<String, Emote> entries = Collections.emptyMap();
        long loadedAt;
        long retryAfter;
        long generation;
        Future<?> task;
    }
}
