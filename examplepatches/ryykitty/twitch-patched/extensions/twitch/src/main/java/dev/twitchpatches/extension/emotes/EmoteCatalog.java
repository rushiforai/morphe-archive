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
    private int providerMask = EmotePolicy.ALL;

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
        schedule(null, global, 2);
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
        schedule(id, state, 2);
    }

    synchronized Map<String, Emote> snapshot(String id) {
        Channel state = id == null ? null : channels.get(id);
        return state == null ? global.combined : state.combined;
    }

    synchronized Map<String, Emote> providerSnapshot(String id, int index) {
        Channel state = id == null ? global : channels.get(id);
        return state == null ? Collections.emptyMap() : entries(state, index);
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

    synchronized void setProviderMask(int mask) {
        providerMask = mask & EmotePolicy.ALL;
        for (int index = 0; index < 3; index++) {
            if (EmotePolicy.includes(providerMask, index)) continue;
            cancel(global.providers[index]);
            for (Channel state : channels.values()) cancel(state.providers[index]);
        }
        global.combined = compose(Collections.emptyMap(), global);
        channels.values().forEach(state -> state.combined = compose(global.combined, state));
        workers.purge();
    }

    private static void cancel(Channel state) {
        for (Provider provider : state.providers) cancel(provider);
    }

    private static void cancel(Provider provider) {
        if (provider.task == null) return;
        provider.generation++;
        provider.task.cancel(true);
        provider.task = null;
    }

    private void schedule(String id, Channel state, int index) {
        if (!EmotePolicy.includes(providerMask, index)) return;
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
            String url = EmoteProviders.catalogUrl(index, id);
            String json = fetcher.get(url, id != null);
            loaded = EmoteProviders.parse(index, json, id == null);
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
                global.combined = compose(Collections.emptyMap(), global);
                channels.values().forEach(channel -> channel.combined = compose(global.combined, channel));
            } else state.combined = compose(global.combined, state);
        }
        changed.accept(id);
    }

    private Map<String, Emote> compose(Map<String, Emote> globals, Channel channel) {
        return combine(globals, entries(channel, 2), entries(channel, 0), entries(channel, 1));
    }

    private Map<String, Emote> entries(Channel channel, int index) {
        return EmotePolicy.includes(providerMask, index) ? channel.providers[index].entries : Collections.emptyMap();
    }

    @SafeVarargs
    static Map<String, Emote> combine(Map<String, Emote> globals, Map<String, Emote>... providers) {
        Map<String, Emote> result = new LinkedHashMap<>(globals);
        for (Map<String, Emote> provider : providers) result.putAll(provider);
        return Collections.unmodifiableMap(result);
    }

    private static final class Channel {
        final Provider[] providers = {new Provider(), new Provider(), new Provider()};
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
