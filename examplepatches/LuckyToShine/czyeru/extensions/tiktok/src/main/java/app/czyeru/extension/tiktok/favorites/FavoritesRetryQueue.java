package app.czyeru.extension.tiktok.favorites;

import java.lang.reflect.Method;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Favorites the server refused with "You're adding to Favorites too fast", in the order they were
 * tapped, with the backoff for the next retry. Plain Java (no Android), so it is tested off-device.
 * Not thread safe: {@link FavoritesRetryPatch} holds its lock around every call.
 */
final class FavoritesRetryQueue {
    /** ApiServerException code TikTok's favorite buttons treat as "too fast" (shows the server message). */
    static final int RATE_LIMIT_CODE = 3009020;
    /** Wait after each refusal in a row. Stays at the last value until a save succeeds. */
    static final long[] BACKOFF_MS = {30_000, 60_000, 120_000, 300_000, 600_000, 900_000, 1_800_000};
    /** Gap between queued saves once the server accepts again. */
    static final long SPACING_MS = 5_000;
    static final int MAX_ATTEMPTS = 20;
    static final long MAX_AGE_MS = 48L * 60 * 60 * 1000;

    static final class Entry {
        final String aid;
        /** Request params as AwemeCollectionAgent reads them: privacy_setting Integer, the rest strings. */
        final Map<String, Object> params;
        final long addedAt;
        int attempts;

        Entry(String aid, Map<String, Object> params, long addedAt, int attempts) {
            this.aid = aid;
            this.params = params;
            this.addedAt = addedAt;
            this.attempts = attempts;
        }
    }

    private final LinkedHashMap<String, Entry> entries = new LinkedHashMap<>();
    /** Refusals in a row. */
    private int backoffLevel;
    private long nextAttemptAt;

    boolean isEmpty() {
        return entries.isEmpty();
    }

    int size() {
        return entries.size();
    }

    boolean contains(String aid) {
        return entries.containsKey(aid);
    }

    /** The server refused a favorite as too fast. Returns true when the video was not queued yet. */
    boolean onRateLimited(String aid, Map<String, ?> params, long now) {
        Entry entry = entries.get(aid);
        boolean added = entry == null;
        if (added) {
            entries.put(aid, new Entry(aid, copyParams(params), now, 0));
        } else {
            entry.attempts++;
        }
        nextAttemptAt = now + BACKOFF_MS[Math.min(backoffLevel, BACKOFF_MS.length - 1)];
        backoffLevel++;
        prune(now);
        return added;
    }

    /** A favorite was saved. Returns true when it was queued. */
    boolean onSaved(String aid, long now) {
        backoffLevel = 0;
        nextAttemptAt = now + SPACING_MS;
        return entries.remove(aid) != null;
    }

    /**
     * A queued favorite failed for another reason. A server error (deleted or private video, ...)
     * will not pass later either, so it is dropped. Anything else (no network) is tried again.
     * Returns true when the video was queued.
     */
    boolean onOtherFailure(String aid, boolean serverError, long now) {
        Entry entry = entries.get(aid);
        if (entry == null) {
            return false;
        }
        if (serverError) {
            entries.remove(aid);
        } else {
            entry.attempts++;
            nextAttemptAt = Math.max(nextAttemptAt, now + BACKOFF_MS[0]);
            prune(now);
        }
        return true;
    }

    /** The video was unfavorited or is favorited already. Returns true when it was queued. */
    boolean remove(String aid) {
        return entries.remove(aid) != null;
    }

    /** Milliseconds until the next retry may run. */
    long delayUntilNext(long now) {
        return Math.max(0, nextAttemptAt - now);
    }

    /** Oldest queued favorite still worth retrying, or null. */
    Entry next(long now) {
        prune(now);
        Iterator<Entry> iterator = entries.values().iterator();
        return iterator.hasNext() ? iterator.next() : null;
    }

    /** Drops favorites tried too often or queued too long ago. Returns how many were dropped. */
    int prune(long now) {
        int dropped = 0;
        for (Iterator<Entry> iterator = entries.values().iterator(); iterator.hasNext(); ) {
            Entry entry = iterator.next();
            if (entry.attempts >= MAX_ATTEMPTS || now - entry.addedAt > MAX_AGE_MS || now < entry.addedAt) {
                iterator.remove();
                dropped++;
            }
        }
        return dropped;
    }

    /**
     * AwemeCollectionAgent reads privacy_setting only as an Integer and every other param with
     * toString(), so this keeps Integers and stores everything else as its string.
     */
    static Map<String, Object> copyParams(Map<String, ?> params) {
        Map<String, Object> copy = new LinkedHashMap<>();
        if (params != null) {
            for (Map.Entry<String, ?> param : params.entrySet()) {
                Object value = param.getValue();
                if (param.getKey() == null || value == null) {
                    continue;
                }
                copy.put(param.getKey(), value instanceof Integer ? value : value.toString());
            }
        }
        return copy;
    }

    // One line per favorite: aid, attempts, addedAt, then key=i:<int> or key=s:<text>. URL-encoded.
    String encode() {
        StringBuilder out = new StringBuilder();
        for (Entry entry : entries.values()) {
            out.append(enc(entry.aid)).append('\t').append(entry.attempts).append('\t').append(entry.addedAt);
            for (Map.Entry<String, Object> param : entry.params.entrySet()) {
                Object value = param.getValue();
                out.append('\t').append(enc(param.getKey())).append('=')
                        .append(value instanceof Integer ? "i:" + value : "s:" + enc(value.toString()));
            }
            out.append('\n');
        }
        return out.toString();
    }

    /** Reads {@link #encode()} output. Lines that do not parse are skipped. */
    static FavoritesRetryQueue decode(String stored) {
        FavoritesRetryQueue queue = new FavoritesRetryQueue();
        if (stored == null || stored.isEmpty()) {
            return queue;
        }
        for (String line : stored.split("\n")) {
            try {
                String[] parts = line.split("\t");
                if (parts.length < 3) {
                    continue;
                }
                String aid = dec(parts[0]);
                if (aid.isEmpty()) {
                    continue;
                }
                Map<String, Object> params = new LinkedHashMap<>();
                for (int i = 3; i < parts.length; i++) {
                    int eq = parts[i].indexOf('=');
                    String key = dec(parts[i].substring(0, eq));
                    String value = parts[i].substring(eq + 1);
                    params.put(key, value.startsWith("i:")
                            ? (Object) Integer.valueOf(value.substring(2))
                            : dec(value.substring(2)));
                }
                queue.entries.put(aid, new Entry(aid, params, Long.parseLong(parts[2]), Integer.parseInt(parts[1])));
            } catch (RuntimeException ignored) {
                // Damaged line: drop it, keep the rest.
            }
        }
        return queue;
    }

    /** Video ids in queue order. */
    List<String> aids() {
        return new ArrayList<>(entries.keySet());
    }

    private static String enc(String text) {
        try {
            return URLEncoder.encode(text, "UTF-8");
        } catch (java.io.UnsupportedEncodingException e) {
            throw new IllegalStateException(e);
        }
    }

    private static String dec(String text) {
        try {
            return URLDecoder.decode(text, "UTF-8");
        } catch (java.io.UnsupportedEncodingException e) {
            throw new IllegalStateException(e);
        }
    }

    /**
     * True for the "too fast" refusal. TikTok passes a wrapper whose getE() is the
     * ApiServerException (getErrorCode, getErrorMsg); its class names are obfuscated, its method
     * names are not. The message check covers a changed code on English accounts.
     */
    static boolean isRateLimit(Throwable throwable) {
        Throwable error = apiError(throwable);
        if (error == null) {
            return false;
        }
        Object code = call(error, "getErrorCode");
        if (code instanceof Integer && (Integer) code == RATE_LIMIT_CODE) {
            return true;
        }
        for (String getter : new String[]{"getErrorMsg", "getPrompt"}) {
            Object message = call(error, getter);
            if (message instanceof String && ((String) message).toLowerCase().contains("too fast")) {
                return true;
            }
        }
        return false;
    }

    /** True when the server answered with an error (not a network failure). */
    static boolean isServerError(Throwable throwable) {
        return apiError(throwable) != null;
    }

    /** The ApiServerException inside TikTok's wrapper or cause chain, or null. */
    private static Throwable apiError(Throwable throwable) {
        Throwable current = throwable;
        for (int depth = 0; current != null && depth < 6; depth++) {
            if (call(current, "getErrorCode") instanceof Integer) {
                return current;
            }
            Object inner = call(current, "getE");
            current = inner instanceof Throwable && inner != current ? (Throwable) inner : current.getCause();
        }
        return null;
    }

    private static Object call(Object target, String name) {
        try {
            Method method = target.getClass().getMethod(name);
            return method.invoke(target);
        } catch (Throwable ignored) {
            return null;
        }
    }
}
