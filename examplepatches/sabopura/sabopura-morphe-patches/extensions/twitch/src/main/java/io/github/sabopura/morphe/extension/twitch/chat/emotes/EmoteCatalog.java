// Adapted from Hooman's patches, GPL-3.0; see NOTICE for source and revision.
package io.github.sabopura.morphe.extension.twitch.chat.emotes;

import android.content.Context;

import io.github.sabopura.morphe.extension.twitch.chat.ChatSettings;
import io.github.sabopura.morphe.extension.twitch.chat.PublicApi;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.function.Consumer;

final class EmoteCatalog {
    private static final long CACHE_TTL_MS = 6L * 60L * 60L * 1000L;
    private static final long RETRY_BACKOFF_MS = 5L * 60L * 1000L;
    /** Only the download queue was full, which says nothing about the provider. */
    private static final long QUEUE_FULL_RETRY_MS = 10_000L;
    private static final int MAX_RESPONSE_BYTES = 4 * 1024 * 1024;
    private static final int MAX_CHANNEL_CATALOGS = 32;

    private final Object channelCacheLock = new Object();
    private final LinkedHashMap<String, ChannelState> channels =
            new LinkedHashMap<>(16, 0.75f, true);
    private final ProviderState globalSevenTv = new ProviderState();
    private final ProviderState globalBetterTtv = new ProviderState();
    private final ProviderState globalFfz = new ProviderState();
    private final Consumer<String> onUpdated;

    EmoteCatalog(Consumer<String> onUpdated) {
        this.onUpdated = onUpdated;
    }

    void ensureLoaded(Context context, String channelId) {
        Context app = context.getApplicationContext();
        long now = System.currentTimeMillis();
        ChatSettings settings = ChatSettings.get(context);
        if (settings.sevenTv)
            schedule(app, globalSevenTv, null, "7tv-global", "https://7tv.io/v3/emote-sets/global", false,
                    (text, out) -> parseSevenTv(new JSONObject(text), out, true));
        if (settings.bttv)
            schedule(app, globalBetterTtv, null, "bttv-global", "https://api.betterttv.net/3/cached/emotes/global", false,
                    (text, out) -> parseBetterTtvArray(new JSONArray(text), out, true));
        if (settings.ffz)
            schedule(app, globalFfz, null, "ffz-global", "https://api.frankerfacez.com/v1/set/global", true,
                    (text, out) -> parseFfz(new JSONObject(text), out, true));
        if (channelId == null) return;
        ChannelState channel = getChannel(channelId, true);
        if (settings.sevenTv)
            schedule(app, channel.sevenTv, channelId, "7tv-channel-" + channelId, "https://7tv.io/v3/users/twitch/" + channelId, true,
                    (text, out) -> {
                        JSONObject set = new JSONObject(text).optJSONObject("emote_set");
                        if (set != null) parseSevenTv(set, out, false);
                    });
        if (settings.bttv)
            schedule(app, channel.betterTtv, channelId, "bttv-channel-" + channelId, "https://api.betterttv.net/3/cached/users/twitch/" + channelId, true,
                    (text, out) -> {
                        JSONObject root = new JSONObject(text);
                        parseBetterTtvArray(root.optJSONArray("channelEmotes"), out, false);
                        parseBetterTtvArray(root.optJSONArray("sharedEmotes"), out, false);
                    });
        if (settings.ffz)
            schedule(app, channel.ffz, channelId, "ffz-channel-" + channelId, "https://api.frankerfacez.com/v1/room/id/" + channelId, true,
                    (text, out) -> parseFfz(new JSONObject(text), out, false));
    }

    Emote find(Context context, String channelId, String name) {
        ChatSettings settings = ChatSettings.get(context);
        if (channelId != null) {
            ChannelState channel = getChannel(channelId, false);
            if (channel != null) {
                Emote emote = settings.sevenTv ? channel.sevenTv.emotes.get(name) : null;
                if (emote != null) {
                    return emote;
                }
                emote = settings.bttv ? channel.betterTtv.emotes.get(name) : null;
                if (emote != null) {
                    return emote;
                }
                emote = settings.ffz ? channel.ffz.emotes.get(name) : null;
                if (emote != null) return emote;
            }
        }
        Emote emote = settings.sevenTv ? globalSevenTv.emotes.get(name) : null;
        if (emote == null && settings.bttv) emote = globalBetterTtv.emotes.get(name);
        if (emote == null && settings.ffz) emote = globalFfz.emotes.get(name);
        return emote;
    }

    /** The emotes chat draws in this channel: its own ones, or the global ones no channel emote hides. */
    java.util.List<Emote> emotes(Context context, String channelId, boolean global) {
        java.util.List<Emote> found = new java.util.ArrayList<>();
        for (String name : names(context, channelId)) {
            Emote emote = find(context, channelId, name);
            if (emote != null && emote.global == global) found.add(emote);
        }
        found.sort((a, b) -> a.name.compareToIgnoreCase(b.name));
        return found;
    }

    java.util.List<String> names(Context context, String channelId) {
        ensureLoaded(context, channelId);
        java.util.Set<String> names = new java.util.TreeSet<>();
        ChatSettings s = ChatSettings.get(context);
        if (s.sevenTv) names.addAll(globalSevenTv.emotes.keySet());
        if (s.bttv) names.addAll(globalBetterTtv.emotes.keySet());
        if (s.ffz) names.addAll(globalFfz.emotes.keySet());
        ChannelState c = channelId == null ? null : getChannel(channelId, false);
        if (c != null) {
            if (s.sevenTv) names.addAll(c.sevenTv.emotes.keySet());
            if (s.bttv) names.addAll(c.betterTtv.emotes.keySet());
            if (s.ffz) names.addAll(c.ffz.emotes.keySet());
        }
        return new java.util.ArrayList<>(names);
    }

    static void parseFfz(JSONObject root, Map<String, Emote> target, boolean global) {
        JSONObject sets = root.optJSONObject("sets");
        if (sets == null) return;
        JSONArray defaults = root.optJSONArray("default_sets");
        java.util.Iterator<String> keys = sets.keys();
        while (keys.hasNext()) {
            String key = keys.next();
            if (global) {
                boolean selected = false;
                if (defaults != null)
                    for (int i = 0; i < defaults.length(); i++)
                        if (key.equals(defaults.optString(i))) selected = true;
                if (!selected) continue;
            }
            JSONObject set = sets.optJSONObject(key);
            JSONArray emotes = set == null ? null : set.optJSONArray("emoticons");
            if (emotes == null) continue;
            for (int i = 0; i < emotes.length(); i++) {
                JSONObject emote = emotes.optJSONObject(i);
                if (emote == null) continue;
                JSONObject animated = emote.optJSONObject("animated");
                JSONObject urls = animated != null ? animated : emote.optJSONObject("urls");
                String name = emote.optString("name", "");
                String url = urls == null ? "" : urls.optString("2", urls.optString("1", ""));
                if (url.startsWith("//")) url = "https:" + url;
                if (!name.isEmpty() && EmoteUrls.allowed(url))
                    target.put(name, new Emote("ffz", emote.optString("id", ""), name, url, animated != null, false, global));
            }
        }
    }

    private interface Parser {
        void parse(String text, Map<String, Emote> out) throws JSONException;
    }

    private void schedule(Context context, ProviderState state, String channelId, String cacheKey, String url,
                          boolean allowNotFound, Parser parser) {
        long now = System.currentTimeMillis();
        if (!state.needsRefresh(now) || !state.loading.compareAndSet(false, true)) return;
        if (!PublicApi.submit(() -> load(context, state, channelId, cacheKey, url, allowNotFound, parser))) {
            state.loading.set(false);
            state.retryAfter = now + QUEUE_FULL_RETRY_MS;
        }
    }

    private void load(Context context, ProviderState state, String channelId, String cacheKey, String url,
                      boolean allowNotFound, Parser parser) {
        boolean updated = false;
        try {
            LoadedText text = loadText(context, cacheKey, url, allowNotFound);
            Map<String, Emote> loaded = new LinkedHashMap<>();
            try {
                parser.parse(text.value, loaded);
            } catch (JSONException failure) {
                //noinspection ResultOfMethodCallIgnored
                cacheFile(context, cacheKey).delete();
                throw failure;
            }
            state.publish(loaded, text.loadedAt);
            updated = true;
        } catch (Throwable ignored) {
            state.failed();
        } finally {
            state.loading.set(false);
        }
        if (updated) onUpdated.accept(channelId);
    }

    private ChannelState getChannel(String channelId, boolean create) {
        synchronized (channelCacheLock) {
            ChannelState channel = channels.get(channelId);
            if (channel == null && create) {
                channel = new ChannelState();
                channels.put(channelId, channel);
                while (channels.size() > MAX_CHANNEL_CATALOGS) {
                    String oldest = channels.keySet().iterator().next();
                    channels.remove(oldest);
                }
            }
            return channel;
        }
    }

    static void parseSevenTv(JSONObject root, Map<String, Emote> target, boolean global)
            throws JSONException {
        JSONArray emotes = root.optJSONArray("emotes");
        if (emotes == null) {
            return;
        }
        for (int index = 0; index < emotes.length(); index++) {
            JSONObject item = emotes.optJSONObject(index);
            if (item == null) {
                continue;
            }
            String name = item.optString("name", "");
            JSONObject data = item.optJSONObject("data");
            JSONObject host = data == null ? null : data.optJSONObject("host");
            String hostUrl = host == null ? "" : host.optString("url", "");
            JSONArray files = host == null ? null : host.optJSONArray("files");
            String fileName = chooseSevenTvFile(files);
            if (name.isEmpty() || hostUrl.isEmpty() || fileName == null) {
                continue;
            }
            if (hostUrl.startsWith("//")) {
                hostUrl = "https:" + hostUrl;
            } else if (!hostUrl.startsWith("http://") && !hostUrl.startsWith("https://")) {
                hostUrl = "https://" + hostUrl;
            }
            String url = hostUrl.endsWith("/") ? hostUrl + fileName : hostUrl + "/" + fileName;
            if (EmoteUrls.allowed(url))
                target.put(
                        name,
                        new Emote(
                                "7tv",
                                item.optString("id", ""),
                                name,
                                url,
                                data != null && data.optBoolean("animated", false),
                                (item.optInt("flags", 0) & 1) != 0,
                                global));
        }
    }

    private static String chooseSevenTvFile(JSONArray files) {
        if (files == null) {
            return null;
        }
        String fallback = null;
        for (int index = 0; index < files.length(); index++) {
            JSONObject file = files.optJSONObject(index);
            if (file == null || !"WEBP".equalsIgnoreCase(file.optString("format"))) {
                continue;
            }
            String name = file.optString("name", "");
            if (name.isEmpty()) {
                continue;
            }
            if ("2x.webp".equalsIgnoreCase(name)) {
                return name;
            }
            fallback = name;
        }
        return fallback;
    }

    static void parseBetterTtvArray(JSONArray emotes, Map<String, Emote> target, boolean global) {
        if (emotes == null) {
            return;
        }
        for (int index = 0; index < emotes.length(); index++) {
            JSONObject item = emotes.optJSONObject(index);
            if (item == null) {
                continue;
            }
            String id = item.optString("id", "");
            String name = item.optString("code", "");
            if (!id.matches("[a-zA-Z0-9]+") || name.isEmpty()) {
                continue;
            }
            target.put(
                    name,
                    new Emote(
                            "bttv",
                            id,
                            name,
                            "https://cdn.betterttv.net/emote/" + id + "/2x.webp",
                            item.optBoolean("animated", false),
                            false,
                            global));
        }
    }

    private static File cacheFile(Context context, String cacheKey) {
        return new File(new File(context.getCacheDir(), "morphe_emote_catalog"), cacheKey + ".json");
    }

    private static LoadedText loadText(Context context, String cacheKey, String url, boolean allowNotFound)
            throws IOException {
        File cache = cacheFile(context, cacheKey);
        File directory = cache.getParentFile();
        long now = System.currentTimeMillis();
        long savedAt = Math.min(now, cache.lastModified());
        if (cache.isFile() && now - savedAt <= CACHE_TTL_MS) {
            try {
                return new LoadedText(readText(cache), savedAt);
            } catch (IOException ignored) {
                //noinspection ResultOfMethodCallIgnored
                cache.delete();
            }
        }
        try {
            String result = request(url, allowNotFound);
            if (directory.isDirectory() || directory.mkdirs()) writeText(cache, result);
            return new LoadedText(result, now);
        } catch (IOException failure) {
            if (cache.isFile()) return new LoadedText(readText(cache), 0L);
            throw failure;
        }
    }

    private static String request(String url, boolean allowNotFound) throws IOException {
        try {
            return PublicApi.get(url);
        } catch (IOException failure) {
            if (allowNotFound && "HTTP 404".equals(failure.getMessage())) return "{}";
            throw failure;
        }
    }

    private static String readText(File file) throws IOException {
        try (InputStream input = new FileInputStream(file)) {
            return new String(PublicApi.readLimited(input, MAX_RESPONSE_BYTES), StandardCharsets.UTF_8);
        }
    }

    private static synchronized void writeText(File file, String text) throws IOException {
        File temporary = new File(file.getParentFile(), file.getName() + ".tmp");
        try (FileOutputStream output = new FileOutputStream(temporary)) {
            output.write(text.getBytes(StandardCharsets.UTF_8));
        }
        if (!temporary.renameTo(file)) {
            //noinspection ResultOfMethodCallIgnored
            temporary.delete();
        }
        File[] entries = file.getParentFile().listFiles((dir, name) -> name.endsWith(".json"));
        if (entries != null) {
            java.util.Arrays.sort(entries, java.util.Comparator.comparingLong(File::lastModified));
            long bytes = 0;
            for (File entry : entries) bytes += entry.length();
            int count = entries.length;
            for (File entry : entries) {
                if (bytes <= 32L * 1024 * 1024 && count <= 100) break;
                long size = entry.length();
                if (entry.delete()) {
                    bytes -= size;
                    count--;
                }
            }
        }
    }

    static final class ProviderState {
        final AtomicBoolean loading = new AtomicBoolean();
        volatile Map<String, Emote> emotes = Collections.emptyMap();
        volatile long loadedAt;
        volatile long retryAfter;

        boolean needsRefresh(long now) {
            return now >= retryAfter && (loadedAt == 0L || now - loadedAt >= CACHE_TTL_MS);
        }

        /** {@code at} is when the list was downloaded, or 0 for an expired copy used because the download failed. */
        void publish(Map<String, Emote> loaded, long at) {
            emotes = Collections.unmodifiableMap(loaded);
            loadedAt = at;
            retryAfter = at > 0L ? 0L : System.currentTimeMillis() + RETRY_BACKOFF_MS;
        }

        void failed() {
            retryAfter = System.currentTimeMillis() + RETRY_BACKOFF_MS;
        }
    }

    private static final class ChannelState {
        final ProviderState sevenTv = new ProviderState();
        final ProviderState betterTtv = new ProviderState();
        final ProviderState ffz = new ProviderState();
    }

    private static final class LoadedText {
        final String value;
        final long loadedAt;

        LoadedText(String value, long loadedAt) {
            this.value = value;
            this.loadedAt = loadedAt;
        }
    }
}
