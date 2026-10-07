/*
 * Copyright 2026 IMXEren.
 * https://gitlab.com/IMXEren/mix-patches
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */

package app.mix.extension.syncforreddit;

import android.content.Context;
import android.os.SystemClock;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;

import app.mix.extension.reddit.ArcticShiftApi;

@SuppressWarnings("unused")
public final class DeletedPostRestorer {
    private static final int MAX_ENTRIES = 1000;
    private static final long MISS_TTL_MS = 300_000L;
    private static final Map<String, CacheEntry> cache = new LinkedHashMap<>(16, 0.75f, true) {
        @Override
        public boolean removeEldestEntry(Map.Entry<String, CacheEntry> eldest) {
            return size() > MAX_ENTRIES;
        }
    };

    private DeletedPostRestorer() {
    }

    public static String restore(Context context, String body, String userAgent) {
        try {
            JSONArray response = new JSONArray(body);
            JSONObject listing = response.optJSONObject(0);
            JSONObject data = listing == null ? null : listing.optJSONObject("data");
            JSONArray children = data == null ? null : data.optJSONArray("children");
            JSONObject child = children == null ? null : children.optJSONObject(0);
            JSONObject post = child == null ? null : child.optJSONObject("data");
            if (post == null || !"t3".equals(child.optString("kind"))
                    || !isDeleted(post.optString("selftext"))) {
                return body;
            }
            String id = post.optString("id");
            if (id.isEmpty()) {
                return body;
            }
            JSONObject archived = lookup(id, userAgent);
            if (archived == null) {
                return body;
            }
            boolean restored = false;
            for (String field : new String[]{"selftext", "title", "author", "url"}) {
                String current = post.optString(field);
                String replacement = archived.optString(field);
                if ((current.isEmpty() || isDeleted(current))
                        && !replacement.isEmpty() && !isDeleted(replacement)) {
                    post.put(field, replacement);
                    if ("selftext".equals(field)) {
                        post.remove("selftext_html");
                    }
                    restored = true;
                }
            }
            if (!restored) {
                return body;
            }
            ArchiveSourceBadge.remember(context, Collections.singleton(id), Collections.emptySet());
            return response.toString();
        } catch (Exception ignored) {
            return body;
        }
    }

    private static JSONObject lookup(String id, String userAgent) throws Exception {
        synchronized (cache) {
            CacheEntry entry = cache.get(id);
            if (entry != null) {
                if (entry.post != null || SystemClock.elapsedRealtime() < entry.expiresAt) {
                    return entry.post;
                }
                cache.remove(id);
            }
        }
        JSONArray posts = ArcticShiftApi.postsByIds(Collections.singleton(id),
                "id,selftext,title,author,url", userAgent);
        if (posts == null) {
            return null;
        }
        JSONObject post = null;
        for (int i = 0; i < posts.length(); i++) {
            JSONObject candidate = posts.optJSONObject(i);
            if (candidate != null && id.equals(candidate.optString("id"))) {
                post = candidate;
                break;
            }
        }
        if (posts.length() > 0 && post == null) {
            return null;
        }
        synchronized (cache) {
            cache.put(id, new CacheEntry(post, SystemClock.elapsedRealtime() + MISS_TTL_MS));
        }
        return post;
    }

    private static boolean isDeleted(String value) {
        return "[deleted]".equals(value) || "[removed]".equals(value);
    }

    @SuppressWarnings("ClassCanBeRecord")
    private static final class CacheEntry {
        final JSONObject post;
        final long expiresAt;

        CacheEntry(JSONObject post, long expiresAt) {
            this.post = post;
            this.expiresAt = expiresAt;
        }
    }
}
