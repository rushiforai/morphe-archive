/*
 * Copyright 2026 IMXEren.
 * https://gitlab.com/IMXEren/mix-patches
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */

package app.mix.extension.syncforreddit;

import android.content.Context;
import android.content.SharedPreferences;
import android.net.Uri;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.IOException;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

import app.mix.extension.shared.requests.Requester;

@SuppressWarnings("unused")
public final class ProfileFeedMerger {
    private static final String ARCTIC_HOST = "arctic-shift.photon-reddit.com";
    private static final String ARCTIC_BASE = "https://" + ARCTIC_HOST + "/api/";
    private static final String REDDIT_URL = "https://oauth.reddit.com/";
    private static final String TOKEN_URL = "https://ssl.reddit.com/api/v1/access_token";
    private static final int ARCHIVE_LIMIT = 100;
    private static final int MAX_SEEN_IDS = 1200;

    private static final Map<String, FeedState> states = new HashMap<>();
    private static volatile String cachedAccessToken;
    private static volatile long cachedAccessTokenExpiry;

    private ProfileFeedMerger() {
    }

    public static String rewriteUrl(String originalUrl, String key, String after,
                                    String access, String sort) {
        if (key == null || !key.toLowerCase(Locale.ROOT).startsWith("user###")) {
            return originalUrl;
        }
        String[] parts = key.split("###");
        if (parts.length < 3) {
            return originalUrl;
        }
        String tab = parts[1];
        String name = parts[2];
        if (!isSupportedTab(tab) || RateLimitThrottle.isThrottled()) {
            return originalUrl;
        }

        SortOption option = SortOption.profile(access, sort);
        String stateKey = tab.toLowerCase(Locale.ROOT) + '|' + option.stateKey();
        Long before;
        synchronized (ProfileFeedMerger.class) {
            String userKey = name.toLowerCase(Locale.ROOT);
            FeedState state = stateFor(userKey);
            boolean fresh = after == null || after.isEmpty() || "null".equals(after);
            boolean changed = state.key != null && !state.key.equals(stateKey);
            if (fresh || changed) {
                state.resetPaging();
            }
            state.key = stateKey;
            state.tab = tab;
            state.sort = option.name;
            state.time = option.time;
            before = "Comments".equalsIgnoreCase(tab)
                    ? state.oldestCommentCreatedUtc : state.oldestPostCreatedUtc;
        }
        String kind = "Comments".equalsIgnoreCase(tab) ? "t1" : "t3";
        return archiveSearchUrl(kind, name, before);
    }

    public static boolean isArchiveUrl(String url) {
        return url != null && url.contains(ARCTIC_HOST);
    }

    public static Map<String, String> sanitizeHeaders(String url, Map<String, String> headers) {
        if (isArchiveUrl(url)) {
            headers.remove("Authorization");
        }
        return headers;
    }

    public static String merge(Context context, String url, String body,
                               String basicAuth, String userAgent) {
        if (!isArchiveUrl(url) || body == null) {
            return body;
        }
        try {
            String name = queryAuthor(url);
            if (name == null) {
                return body;
            }
            String userKey = name.toLowerCase(Locale.ROOT);
            FeedSnapshot snapshot;
            synchronized (ProfileFeedMerger.class) {
                FeedState state = states.get(userKey);
                if (state == null) {
                    return body;
                }
                snapshot = new FeedSnapshot(state);
            }

            String primaryKind = url.contains("/comments/") ? "t1" : "t3";
            List<Thing> archiveThings = parseArchiveThings(body, primaryKind);
            if ("Overview".equalsIgnoreCase(snapshot.tab) && "t3".equals(primaryKind)) {
                archiveThings.addAll(fetchArchiveThings(
                        archiveSearchUrl("t1", name, snapshot.oldestCommentCreatedUtc),
                        "t1", userAgent));
            }
            enrichComments(archiveThings, userAgent);
            NativePage nativePage = fetchNative(
                    context, name, snapshot, basicAuth, userAgent);
            return buildListing(context, userKey, snapshot, archiveThings, nativePage);
        } catch (Exception ignored) {
            return body;
        }
    }

    private static List<Thing> fetchArchiveThings(String url, String kind, String userAgent) {
        if (RateLimitThrottle.isThrottled()) {
            return new ArrayList<>();
        }
        HttpURLConnection connection = null;
        try {
            connection = (HttpURLConnection) new URL(url).openConnection();
            connection.setRequestMethod("GET");
            setUserAgent(connection, userAgent);
            int status = connection.getResponseCode();
            if (status == 429) {
                RateLimitThrottle.observe(
                        url,
                        status,
                        connection.getHeaderField("X-RateLimit-Reset"),
                        connection.getHeaderField("X-RateLimit-Reset-At"));
            }
            if (status != 200) {
                return new ArrayList<>();
            }
            return parseArchiveThings(Requester.parseStringAndDisconnect(connection), kind);
        } catch (Exception ignored) {
            return new ArrayList<>();
        } finally {
            if (connection != null) {
                connection.disconnect();
            }
        }
    }

    private static List<Thing> parseArchiveThings(String body, String kind) throws Exception {
        List<Thing> things = new ArrayList<>();
        JSONArray data = new JSONObject(body).optJSONArray("data");
        if (data == null) {
            return things;
        }
        for (int i = 0; i < data.length(); i++) {
            JSONObject value = data.optJSONObject(i);
            if (value == null) {
                continue;
            }
            value.remove("media_metadata");
            if ("t1".equals(kind) && !value.has("name")) {
                value.put("name", "t1_" + value.optString("id"));
            }
            things.add(new Thing(kind, value, true));
        }
        return things;
    }

    private static void enrichComments(List<Thing> things, String userAgent) {
        Set<String> linkIds = new LinkedHashSet<>();
        for (Thing thing : things) {
            if ("t1".equals(thing.kind)) {
                String id = stripPrefix(thing.data.optString("link_id"));
                if (!id.isEmpty()) {
                    linkIds.add(id);
                }
            }
        }
        if (linkIds.isEmpty() || RateLimitThrottle.isThrottled()) {
            return;
        }

        String ids = Uri.encode(String.join(",", linkIds), ",");
        String url = ARCTIC_BASE + "posts/ids?ids=" + ids;
        List<Thing> linkedPosts = fetchArchiveThings(url, "t3", userAgent);
        Map<String, JSONObject> postsById = new HashMap<>();
        for (Thing post : linkedPosts) {
            postsById.put(post.data.optString("id"), post.data);
        }
        for (Thing thing : things) {
            if (!"t1".equals(thing.kind)) {
                continue;
            }
            JSONObject post = postsById.get(stripPrefix(thing.data.optString("link_id")));
            if (post == null) {
                continue;
            }
            copyIfPresent(post, "title", thing.data, "link_title");
            copyIfPresent(post, "author", thing.data, "link_author");
            copyIfPresent(post, "permalink", thing.data, "link_permalink");
            copyIfPresent(post, "url", thing.data, "link_url");
        }
    }

    private static void copyIfPresent(JSONObject source, String sourceKey,
                                      JSONObject target, String targetKey) {
        if (source.has(sourceKey) && !source.isNull(sourceKey)) {
            try {
                target.put(targetKey, source.opt(sourceKey));
            } catch (Exception ignored) {
            }
        }
    }

    private static NativePage fetchNative(Context context, String name, FeedSnapshot state,
                                          String basicAuth, String userAgent) {
        try {
            if (basicAuth == null || basicAuth.isEmpty()) {
                return null;
            }
            SharedPreferences prefs = context.getSharedPreferences(
                    context.getPackageName() + "_preferences", Context.MODE_PRIVATE);
            String refreshToken = prefs.getString("refresh_token", null);
            if (refreshToken == null || refreshToken.isEmpty()) {
                return null;
            }
            String accessToken = getAccessToken(basicAuth, refreshToken, userAgent);
            if (accessToken == null) {
                return null;
            }

            StringBuilder url = new StringBuilder(REDDIT_URL)
                    .append("user/").append(encode(name)).append('/')
                    .append(state.tab.toLowerCase(Locale.ROOT)).append(".json?limit=25")
                    .append("&sort=").append(encode(state.sort));
            if (state.time != null) {
                url.append("&t=").append(encode(state.time));
            }
            if (state.nativeAfter != null) {
                url.append("&after=").append(encode(state.nativeAfter));
            }

            HttpURLConnection connection =
                    (HttpURLConnection) new URL(url.toString()).openConnection();
            connection.setRequestMethod("GET");
            setUserAgent(connection, userAgent);
            connection.setRequestProperty("Authorization", "bearer " + accessToken);
            if (connection.getResponseCode() != 200) {
                connection.disconnect();
                return null;
            }

            JSONObject data = new JSONObject(Requester.parseStringAndDisconnect(connection))
                    .optJSONObject("data");
            if (data == null) {
                return null;
            }
            List<Thing> things = new ArrayList<>();
            JSONArray children = data.optJSONArray("children");
            if (children != null) {
                for (int i = 0; i < children.length(); i++) {
                    JSONObject child = children.optJSONObject(i);
                    JSONObject value = child == null ? null : child.optJSONObject("data");
                    if (value != null) {
                        String kind = child.optString("kind", value.has("body") ? "t1" : "t3");
                        if ("t1".equals(kind) || "t3".equals(kind)) {
                            things.add(new Thing(kind, value, false));
                        }
                    }
                }
            }
            return new NativePage(things, nullIfEmpty(data.optString("after")));
        } catch (Exception ignored) {
            return null;
        }
    }

    private static synchronized String getAccessToken(String basicAuth, String refreshToken,
                                                      String userAgent) throws IOException {
        if (cachedAccessToken != null && System.currentTimeMillis() < cachedAccessTokenExpiry) {
            return cachedAccessToken;
        }
        HttpURLConnection connection = (HttpURLConnection) new URL(TOKEN_URL).openConnection();
        try {
            connection.setRequestMethod("POST");
            connection.setDoOutput(true);
            connection.setRequestProperty("Authorization", basicAuth);
            connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            setUserAgent(connection, userAgent);
            byte[] form = ("grant_type=refresh_token&refresh_token="
                    + encode(refreshToken)).getBytes(StandardCharsets.UTF_8);
            connection.setFixedLengthStreamingMode(form.length);
            try (OutputStream output = connection.getOutputStream()) {
                output.write(form);
            }
            if (connection.getResponseCode() != 200) {
                return null;
            }
            JSONObject json = Requester.parseJSONObjectAndDisconnect(connection);
            cachedAccessToken = nullIfEmpty(json.optString("access_token"));
            long expiresIn = json.optLong("expires_in", 3600L);
            cachedAccessTokenExpiry = System.currentTimeMillis()
                    + Math.max(0L, expiresIn - 60L) * 1000L;
            return cachedAccessToken;
        } catch (Exception ignored) {
            return null;
        } finally {
            connection.disconnect();
        }
    }

    private static String buildListing(Context context, String userKey, FeedSnapshot state,
                                       List<Thing> archiveThings,
                                       NativePage nativePage) throws Exception {
        List<Thing> nativeThings = nativePage == null
                ? new ArrayList<>() : nativePage.things;
        Map<String, Integer> nativeRanks = new HashMap<>();
        Map<String, Thing> byId = new LinkedHashMap<>();
        for (int i = 0; i < nativeThings.size(); i++) {
            Thing thing = nativeThings.get(i);
            String key = thing.key();
            if (key != null) {
                nativeRanks.put(key, i);
                byId.put(key, thing);
            }
        }

        long oldestPost = Long.MAX_VALUE;
        long oldestComment = Long.MAX_VALUE;
        int postCount = 0;
        int commentCount = 0;
        for (Thing thing : archiveThings) {
            String key = thing.key();
            if (key != null && !byId.containsKey(key)) {
                byId.put(key, thing);
            }
            long created = createdUtc(thing.data);
            if ("t1".equals(thing.kind)) {
                commentCount++;
                if (created > 0L && created < oldestComment) {
                    oldestComment = created;
                }
            } else {
                postCount++;
                if (created > 0L && created < oldestPost) {
                    oldestPost = created;
                }
            }
        }

        List<Thing> ordered = new ArrayList<>(byId.values());
        if ("new".equals(state.sort)) {
            Collections.sort(ordered, (left, right) -> Long.compare(
                    createdUtc(right.data), createdUtc(left.data)));
        } else {
            Collections.sort(ordered, (left, right) -> compareRanked(
                    left, right, state.sort, nativeRanks));
        }

        long cutoff = cutoff(state.sort, state.time);
        JSONArray children = new JSONArray();
        Set<String> archiveIds = new HashSet<>();
        Set<String> nativeIds = new HashSet<>();
        String appAfter = null;
        synchronized (ProfileFeedMerger.class) {
            FeedState liveState = stateFor(userKey);
            if (liveState.seen.size() > MAX_SEEN_IDS) {
                liveState.seen.clear();
            }
            for (Thing thing : ordered) {
                if (cutoff > 0L && createdUtc(thing.data) < cutoff) {
                    continue;
                }
                String key = thing.key();
                if (key == null || !liveState.seen.add(key)) {
                    continue;
                }
                JSONObject child = new JSONObject();
                child.put("kind", thing.kind);
                child.put("data", thing.data);
                children.put(child);
                (thing.archive ? archiveIds : nativeIds).add(thing.id());
                appAfter = thing.fullName();
            }
            if (oldestPost != Long.MAX_VALUE) {
                liveState.oldestPostCreatedUtc = oldestPost;
            }
            if (oldestComment != Long.MAX_VALUE) {
                liveState.oldestCommentCreatedUtc = oldestComment;
            }
            if (nativePage != null) {
                liveState.nativeAfter = nativePage.after;
            }
        }

        ArchiveSourceBadge.remember(context, archiveIds, nativeIds);

        boolean postsMayContinue = postCount >= ARCHIVE_LIMIT
                && (cutoff == 0L || oldestPost >= cutoff);
        boolean commentsMayContinue = commentCount >= ARCHIVE_LIMIT
                && (cutoff == 0L || oldestComment >= cutoff);
        boolean archiveMayContinue;
        if ("Submitted".equalsIgnoreCase(state.tab)) {
            archiveMayContinue = postsMayContinue;
        } else if ("Comments".equalsIgnoreCase(state.tab)) {
            archiveMayContinue = commentsMayContinue;
        } else {
            archiveMayContinue = postsMayContinue || commentsMayContinue;
        }
        boolean nativeMayContinue = nativePage != null && nativePage.after != null;
        JSONObject data = new JSONObject();
        data.put("after", appAfter != null && (archiveMayContinue || nativeMayContinue)
                ? appAfter : "null");
        data.put("children", children);
        JSONObject listing = new JSONObject();
        listing.put("kind", "Listing");
        listing.put("data", data);
        return listing.toString();
    }

    private static int compareRanked(Thing left, Thing right, String sort,
                                     Map<String, Integer> nativeRanks) {
        Integer leftRank = nativeRanks.get(left.key());
        Integer rightRank = nativeRanks.get(right.key());
        if (leftRank != null && rightRank != null) {
            return Integer.compare(leftRank, rightRank);
        }
        if (leftRank != null) {
            return -1;
        }
        if (rightRank != null) {
            return 1;
        }

        int comparison = 0;
        if ("top".equals(sort)) {
            comparison = Long.compare(
                    right.data.optLong("score", 0L), left.data.optLong("score", 0L));
        } else if ("hot".equals(sort)) {
            comparison = Double.compare(hotRank(right.data), hotRank(left.data));
        } else if ("controversial".equals(sort)) {
            comparison = Double.compare(
                    controversialRank(right.data), controversialRank(left.data));
        }
        return comparison != 0 ? comparison : Long.compare(
                createdUtc(right.data), createdUtc(left.data));
    }

    private static double hotRank(JSONObject value) {
        long score = value.optLong("score", 0L);
        double order = Math.log10(Math.max(Math.abs(score), 1L));
        return Math.signum(score) * order + createdUtc(value) / 45000.0;
    }

    private static double controversialRank(JSONObject value) {
        if (value.optInt("controversiality", 0) > 0) {
            return Double.MAX_VALUE / 2.0 + Math.abs(value.optLong("score", 0L));
        }
        double ratio = value.optDouble("upvote_ratio", 0.5);
        long score = Math.abs(value.optLong("score", 0L));
        double distance = Math.abs(2.0 * ratio - 1.0);
        double estimatedVotes = distance > 0.01 ? score / distance : score;
        double balance = Math.min(ratio, 1.0 - ratio) / Math.max(ratio, 1.0 - ratio);
        return estimatedVotes * balance + value.optLong("num_comments", 0L);
    }

    private static long cutoff(String sort, String time) {
        if (time == null || "all".equals(time)
                || !("top".equals(sort) || "controversial".equals(sort))) {
            return 0L;
        }
        long seconds;
        switch (time) {
            case "hour":
                seconds = 3600L;
                break;
            case "day":
                seconds = 86400L;
                break;
            case "week":
                seconds = 604800L;
                break;
            case "month":
                seconds = 2592000L;
                break;
            case "year":
                seconds = 31536000L;
                break;
            default:
                return 0L;
        }
        return System.currentTimeMillis() / 1000L - seconds;
    }

    private static String archiveSearchUrl(String kind, String name, Long before) {
        String endpoint = "t1".equals(kind) ? "comments/search" : "posts/search";
        StringBuilder url = new StringBuilder(ARCTIC_BASE)
                .append(endpoint).append("?author=").append(encode(name))
                .append("&limit=").append(ARCHIVE_LIMIT).append("&sort=desc");
        if ("t1".equals(kind)) {
            url.append("&md2html=true");
        }
        if (before != null) {
            url.append("&before=").append(Math.max(0L, before - 1L));
        }
        return url.toString();
    }

    private static boolean isSupportedTab(String tab) {
        return "Overview".equalsIgnoreCase(tab)
                || "Submitted".equalsIgnoreCase(tab)
                || "Comments".equalsIgnoreCase(tab);
    }

    private static long createdUtc(JSONObject value) {
        return value.optLong("created_utc", 0L);
    }

    private static FeedState stateFor(String key) {
        FeedState state = states.get(key);
        if (state == null) {
            state = new FeedState();
            states.put(key, state);
        }
        return state;
    }

    private static String queryAuthor(String url) {
        String marker = "author=";
        int start = url.indexOf(marker);
        if (start < 0) {
            return null;
        }
        start += marker.length();
        int end = url.indexOf('&', start);
        String encoded = end < 0 ? url.substring(start) : url.substring(start, end);
        return nullIfEmpty(Uri.decode(encoded));
    }

    private static String stripPrefix(String id) {
        int separator = id.indexOf('_');
        return separator >= 0 ? id.substring(separator + 1) : id;
    }

    private static void setUserAgent(HttpURLConnection connection, String userAgent) {
        if (userAgent != null && !userAgent.isEmpty()) {
            connection.setRequestProperty("User-Agent", userAgent);
        }
    }

    private static String nullIfEmpty(String value) {
        return value == null || value.isEmpty() || "null".equals(value) ? null : value;
    }

    private static String encode(String value) {
        return Uri.encode(value);
    }

    private static final class FeedState {
        String key;
        String tab;
        String sort = "new";
        String time;
        Long oldestPostCreatedUtc;
        Long oldestCommentCreatedUtc;
        String nativeAfter;
        final Set<String> seen = new HashSet<>();

        void resetPaging() {
            oldestPostCreatedUtc = null;
            oldestCommentCreatedUtc = null;
            nativeAfter = null;
            seen.clear();
        }
    }

    private static final class FeedSnapshot {
        final String tab;
        final String sort;
        final String time;
        final Long oldestCommentCreatedUtc;
        final String nativeAfter;

        FeedSnapshot(FeedState state) {
            tab = state.tab;
            sort = state.sort;
            time = state.time;
            oldestCommentCreatedUtc = state.oldestCommentCreatedUtc;
            nativeAfter = state.nativeAfter;
        }
    }

    @SuppressWarnings("ClassCanBeRecord")
    private static final class Thing {
        final String kind;
        final JSONObject data;
        final boolean archive;

        Thing(String kind, JSONObject data, boolean archive) {
            this.kind = kind;
            this.data = data;
            this.archive = archive;
        }

        String id() {
            return data.optString("id");
        }

        String key() {
            String id = id();
            return id.isEmpty() ? null : kind + ':' + id;
        }

        String fullName() {
            String id = data.optString("id");
            return id.isEmpty() ? null : kind + '_' + id;
        }
    }

    @SuppressWarnings("ClassCanBeRecord")
    private static final class NativePage {
        final List<Thing> things;
        final String after;

        NativePage(List<Thing> things, String after) {
            this.things = things;
            this.after = after;
        }
    }
}
