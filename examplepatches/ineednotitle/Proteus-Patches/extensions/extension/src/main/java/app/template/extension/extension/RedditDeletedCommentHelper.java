package app.template.extension.extension;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Runtime support for the Proteus Reddit "Show deleted posts and comments" patch.
 *
 * <p>Reddit does not send the text of a deleted or removed post/comment back
 * to clients, so the only way to display it is an external archive.  This
 * helper resolves archived bodies for exactly the rows that are rendered as
 * {@code [deleted]} / {@code [removed]} in the listings the app builds, and
 * swaps the placeholder for the archived text (prefixed with
 * {@link #MARKER} so the restored text is always recognisable).
 *
 * <p>Injection contract used by the patch
 * ({@code ShowDeletedCommentsPatch}):
 * <ul>
 *   <li>{@code undeleteContent(List) -> List} — called on the same
 *       {@code Listing.children} choke point used by the AutoMod / content
 *       filter helpers.  Listings are deserialized off the main thread, so
 *       the (synchronous) archive request runs off the UI thread.  No
 *       network call is made when a listing contains no deleted rows.</li>
 * </ul>
 *
 * <p>Behaviour details and fail-safes:
 * <ul>
 *   <li>Comment-shaped rows ({@code t1}) whose body is exactly
 *       {@code [deleted]} or {@code [removed]} use the comment archive;
 *       post-shaped rows ({@code t3}) use the post archive and may restore
 *       both the selftext and the title.</li>
 *   <li>Archives are queried in batches by id (Arctic Shift
 *       {@code /api/comments/ids} and {@code /api/posts/ids}, falling back to
 *       PullPush {@code /reddit/search/comment} and
 *       {@code /reddit/search/submission}).  No API key is required by either
 *       service.  Only ids from the visible listing are sent — never anything
 *       else — and nothing is written anywhere.</li>
 *   <li>Results (including misses) are cached in memory for the lifetime of
 *       the process.</li>
 *   <li>Any failure — offline, timeout, rate limit, parse error, model layout
 *       drift — leaves the row exactly as Reddit sent it.  Nothing throws
 *       into app code.</li>
 * </ul>
 *
 * <p>The extension is compiled against the Android SDK only, so the Reddit
 * model classes are resolved reflectively.  Bodies are replaced by (1) a
 * dedicated {@code setBody}-style setter when the model exposes one, else
 * (2) instance {@code String} fields whose current value is exactly the
 * placeholder, preferring fields with body-like names and never touching
 * author/user-like fields.
 */
public final class RedditDeletedCommentHelper {

    /** Shown in front of every restored row so provenance is visible. */
    private static final String MARKER = "[archived] ";

    private static final String COMMENT_ARCHIVE_ENDPOINT =
            "https://arctic-shift.photon-reddit.com/api/comments/ids?ids=%s&fields=id,body";
    private static final String COMMENT_FALLBACK_ENDPOINT =
            "https://api.pullpush.io/reddit/search/comment/?ids=%s&size=%d";
    private static final String POST_ARCHIVE_ENDPOINT =
            "https://arctic-shift.photon-reddit.com/api/posts/ids?ids=%s&fields=id,selftext,title";
    private static final String POST_FALLBACK_ENDPOINT =
            "https://api.pullpush.io/reddit/search/submission/?ids=%s&size=%d";

    private static final int MAX_IDS_PER_REQUEST = 100;
    private static final int MAX_IDS_TOTAL = 300;
    private static final int CONNECT_TIMEOUT_MS = 2500;
    private static final int READ_TIMEOUT_MS = 4000;
    private static final int MAX_RESPONSE_CHARS = 4 * 1024 * 1024;

    /** Negative-cache sentinel: this id was looked up and is not archived. */
    private static final String MISS = "";

    private static final Map<String, String> COMMENT_CACHE = new ConcurrentHashMap<>();
    private static final Map<String, PostArchive> POST_CACHE = new ConcurrentHashMap<>();
    private static final Map<Class<?>, Boolean> MODEL_TYPE_CACHE = new ConcurrentHashMap<>();
    private static final Map<Class<?>, Accessors> ACCESSOR_CACHE = new ConcurrentHashMap<>();

    private static final String[] BODY_GETTERS = {
            "getBody", "getSelftext", "getSelfText", "getText", "getCommentBody"
    };
    private static final String[] TITLE_GETTERS = {
            "getTitle", "getPostTitle", "getLinkTitle"
    };
    private static final String[] ID_GETTERS = {
            "getId", "getCommentId", "getIdentifier", "getName",
            "getFullName", "getFullname", "getThingId"
    };
    private static final String[] KIND_GETTERS = {
            "getKindWithId", "getFullName", "getFullname"
    };
    private static final String[] COMMENT_MARKER_GETTERS = {
            "getParentId", "getLinkId", "getDepth", "getReplies"
    };
    private static final String[] BODY_FIELD_NAMES = {
            "body", "bodypreview", "selftext", "self_text", "commentbody", "comment_body",
            "text", "content", "markdown"
    };
    private static final String[] TITLE_FIELD_NAMES = {
            "title", "posttitle", "post_title", "linktitle", "link_title"
    };
    private static final String[] BODY_SETTER_NAMES = {
            "setBody", "setSelftext", "setSelfText", "setCommentBody", "setText"
    };

    private RedditDeletedCommentHelper() {
        // Static injection surface only.
    }

    // ── Injection surface ────────────────────────────────────────────────────

    /**
     * Replaces {@code [deleted]} / {@code [removed]} comment bodies with the
     * archived original (prefixed with {@link #MARKER}) when the archive has
     * one.  Returns the input list unchanged when there is nothing to do.
     *
     * <p>Results are memoized per list identity (see {@link ProteusListMemo}):
     * Compose reads {@code Listing.getChildren()} repeatedly on the UI path,
     * and each read would otherwise redo the reflective placeholder scan.
     * Output is unchanged on every pass of the same list instance.
     */
    public static List<?> undeleteContent(List<?> list) {
        if (list == null || list.isEmpty()) {
            return list;
        }
        List<?> memoized = ProteusListMemo.get("undeleteContent", list);
        if (memoized != null) {
            return memoized;
        }
        List<?> result = undeleteContentInner(list);
        ProteusListMemo.put("undeleteContent", list, result);
        return result;
    }

    /** Backwards-compatible alias for the original comment-only patch anchor. */
    public static List<?> undeleteComments(List<?> list) {
        return undeleteContent(list);
    }

    /**
     * Batch entry point for the obfuscated comment-tree `TreeData` constructor.
     * Comment threads build their rows through the comment tree store, not
     * through {@code Listing}.  The constructor receives the full id → comment
     * map, so all deleted comments in one emission are resolved with a single
     * archive request.  Non-deleted comments are a local no-op.
     */
    public static Map<?, ?> undeleteTreeComments(Map<?, ?> comments) {
        if (comments == null || comments.isEmpty()) {
            return comments;
        }
        List<Pending> pending = null;
        for (Object value : comments.values()) {
            Object model = findModel(value);
            if (model == null || rowKind(model) != RowKind.COMMENT) {
                continue;
            }
            String sentinel = deletedSentinel(bodyText(model));
            if (sentinel == null) {
                continue;
            }

            // Prefer the undo payload if Reddit attached one; avoids a request
            // for comments the client can already reconstruct.
            Object restore = commentToRestore(model);
            if (restore != null) {
                String original = bodyText(restore);
                if (deletedSentinel(original) == null && !original.trim().isEmpty()
                        && replaceBody(model, sentinel, MARKER + original)) {
                    continue;
                }
            }

            String id = rowId(model);
            if (id == null) {
                continue;
            }
            if (pending == null) {
                pending = new ArrayList<>();
            }
            pending.add(new Pending(model, id, sentinel, null));
        }

        if (pending == null) {
            return comments;
        }
        try {
            restoreComments(pending);
        } catch (Throwable t) {
            log("comment-tree restore failed (" + t.getClass().getSimpleName()
                    + "); keeping original rows");
        }
        return comments;
    }

    private static Object commentToRestore(Object model) {
        Accessors accessors = accessors(model.getClass());
        return invoke(accessors.commentToRestore, model);
    }

    private static List<?> undeleteContentInner(List<?> list) {
        List<Pending> comments = null;
        List<Pending> posts = null;
        for (Object item : list) {
            Object model = findModel(item);
            if (model == null) {
                continue;
            }
            RowKind kind = rowKind(model);
            if (kind == null) {
                continue;
            }
            String text = kind == RowKind.COMMENT ? bodyText(model) : postText(model);
            String lowerSentinel = deletedSentinel(text);
            String title = kind == RowKind.POST ? titleText(model) : null;
            String titleSentinel = kind == RowKind.POST ? deletedSentinel(title) : null;
            if (lowerSentinel == null && titleSentinel == null) {
                continue;
            }
            String id = rowId(model);
            if (id == null) {
                continue;
            }
            if (kind == RowKind.COMMENT) {
                if (comments == null) {
                    comments = new ArrayList<>();
                }
                comments.add(new Pending(model, id, lowerSentinel, null));
            } else {
                if (posts == null) {
                    posts = new ArrayList<>();
                }
                posts.add(new Pending(model, id, lowerSentinel, titleSentinel));
            }
        }

        if (comments == null && posts == null) {
            // No deleted content in this listing: no network traffic at all.
            return list;
        }

        int restored = 0;
        if (comments != null) {
            restored += restoreComments(comments);
        }
        if (posts != null) {
            restored += restorePosts(posts);
        }
        log("restored " + restored + " archived row(s)");
        return list;
    }

    private static int restoreComments(List<Pending> pending) {
        log("found " + pending.size() + " deleted/removed comment row(s); querying archive");
        Map<String, String> resolved;
        try {
            resolved = resolveComments(idsOf(pending));
        } catch (Throwable t) {
            log("comment archive lookup failed (" + t.getClass().getSimpleName()
                    + "); keeping original rows");
            return 0;
        }

        int restored = 0;
        for (Pending entry : pending) {
            String archived = resolved.get(entry.id);
            if (archived == null || archived.isEmpty()) {
                continue;
            }
            if (replaceBody(entry.model, entry.bodySentinel, MARKER + archived)) {
                restored++;
            }
        }
        if (restored == 0) {
            log("no restored comment bodies (no archive copy or model layout drift)");
        }
        return restored;
    }

    private static int restorePosts(List<Pending> pending) {
        log("found " + pending.size() + " deleted/removed post row(s); querying archive");
        Map<String, PostArchive> resolved;
        try {
            resolved = resolvePosts(idsOf(pending));
        } catch (Throwable t) {
            log("post archive lookup failed (" + t.getClass().getSimpleName()
                    + "); keeping original rows");
            return 0;
        }

        int restored = 0;
        for (Pending entry : pending) {
            PostArchive archived = resolved.get(entry.id);
            if (archived == null) {
                continue;
            }
            boolean changed = false;
            if (entry.bodySentinel != null && archived.selftext != null
                    && !archived.selftext.isEmpty()) {
                changed |= replaceBody(entry.model, entry.bodySentinel,
                        MARKER + archived.selftext);
            }
            if (entry.titleSentinel != null && archived.title != null
                    && !archived.title.isEmpty()) {
                changed |= replaceTitle(entry.model, entry.titleSentinel,
                        MARKER + archived.title);
            }
            if (changed) {
                restored++;
            }
        }
        if (restored == 0) {
            log("no restored post bodies/titles (no archive copy or model layout drift)");
        }
        return restored;
    }

    private static List<String> idsOf(List<Pending> pending) {
        List<String> ids = new ArrayList<>(pending.size());
        for (Pending entry : pending) {
            ids.add(entry.id);
        }
        return ids;
    }

    // ── Row shape detection ──────────────────────────────────────────────────

    /** Returns the lower-cased placeholder ("[deleted]" / "[removed]"), or null. */
    private static String deletedSentinel(String body) {
        if (body == null) {
            return null;
        }
        String trimmed = body.trim().toLowerCase(Locale.ROOT);
        if (trimmed.equals("[deleted]") || trimmed.equals("[removed]")) {
            return trimmed;
        }
        return null;
    }

    private enum RowKind {
        COMMENT,
        POST
    }

    private static RowKind rowKind(Object model) {
        Class<?> type = model.getClass();
        Accessors accessors = accessors(type);

        String kind = stringValue(invoke(accessors.kind, model))
                .trim().toLowerCase(Locale.ROOT);
        if (kind.startsWith("t1")) {
            return RowKind.COMMENT;
        }
        if (kind.startsWith("t3")) {
            return RowKind.POST;
        }

        String className = type.getName().toLowerCase(Locale.ROOT);
        if (className.contains("comment")) {
            return RowKind.COMMENT;
        }
        if (isPostLike(type)) {
            return RowKind.POST;
        }
        for (String marker : COMMENT_MARKER_GETTERS) {
            if (noArgMethod(type, marker) != null) {
                return RowKind.COMMENT;
            }
        }
        return null;
    }

    private static boolean isPostLike(Class<?> type) {
        String className = type.getName().toLowerCase(Locale.ROOT);
        if (className.contains("post") || className.contains("link")) {
            return true;
        }
        return noArgMethod(type, "getSelftext") != null
                && noArgMethod(type, "getTitle") != null;
    }

    private static String bodyText(Object model) {
        Accessors accessors = accessors(model.getClass());
        String body = stringValue(invoke(accessors.body, model));
        if (deletedSentinel(body) != null) {
            return body;
        }
        String preview = stringValue(invoke(accessors.preview, model));
        if (deletedSentinel(preview) != null) {
            return preview;
        }
        Object tombstone = tombstone(model);
        if (tombstone == null) {
            return body;
        }
        String tombstoneText = tombstoneText(tombstone);
        if (deletedSentinel(tombstoneText) != null) {
            return tombstoneText;
        }
        return body.isEmpty() ? "[deleted]" : body;
    }

    private static Object tombstone(Object model) {
        Accessors accessors = accessors(model.getClass());
        if (accessors.tombstone != null) {
            return invoke(accessors.tombstone, model);
        }
        for (Class<?> owner = model.getClass(); owner != null && owner != Object.class;
             owner = owner.getSuperclass()) {
            Field[] declared;
            try {
                declared = owner.getDeclaredFields();
            } catch (Throwable t) {
                continue;
            }
            for (Field field : declared) {
                if (Modifier.isStatic(field.getModifiers())
                        || !field.getName().toLowerCase(Locale.ROOT).contains("tombstone")) {
                    continue;
                }
                try {
                    field.setAccessible(true);
                    Object fieldValue = field.get(model);
                    if (fieldValue != null) {
                        return fieldValue;
                    }
                } catch (Throwable ignored) {
                    // Try the next field.
                }
            }
        }
        return null;
    }

    private static String tombstoneText(Object tombstone) {
        String markdown = stringValue(invoke(
                noArgMethod(tombstone.getClass(), "getMarkdown"), tombstone));
        if (deletedSentinel(markdown) != null) {
            return markdown;
        }
        String richtext = stringValue(invoke(
                noArgMethod(tombstone.getClass(), "getRichtext"), tombstone));
        if (deletedSentinel(richtext) != null) {
            return richtext;
        }
        return markdown;
    }

    private static String postText(Object model) {
        Accessors accessors = accessors(model.getClass());
        String body = stringValue(invoke(accessors.body, model));
        return body.isEmpty() ? stringValue(invoke(accessors.selftext, model)) : body;
    }

    private static String titleText(Object model) {
        Accessors accessors = accessors(model.getClass());
        return stringValue(invoke(accessors.title, model));
    }

    private static String rowId(Object model) {
        Accessors accessors = accessors(model.getClass());
        if (accessors.id == null) {
            return null;
        }
        return normalizeId(stringValue(invoke(accessors.id, model)));
    }

    private static String normalizeId(String raw) {
        if (raw == null) {
            return null;
        }
        String value = raw.trim().toLowerCase(Locale.ROOT);
        if (value.startsWith("t1_") || value.startsWith("t3_")) {
            value = value.substring(3);
        }
        if (value.length() < 3 || value.length() > 12) {
            return null;
        }
        for (int i = 0; i < value.length(); i++) {
            char c = value.charAt(i);
            boolean lower = c >= 'a' && c <= 'z';
            boolean digit = c >= '0' && c <= '9';
            if (!lower && !digit) {
                return null;
            }
        }
        return value;
    }

    // ── Archive lookup (batched, cached, fail-safe) ──────────────────────────

    private static Map<String, String> resolveComments(List<String> ids) {
        Map<String, String> result = new ConcurrentHashMap<>();
        List<String> missing = collectMissingIds(ids, new java.util.HashSet<>());
        for (String id : ids) {
            String cached = COMMENT_CACHE.get(id);
            if (cached != null && !MISS.equals(cached)) {
                result.put(id, cached);
            }
        }

        for (int start = 0; start < missing.size(); start += MAX_IDS_PER_REQUEST) {
            List<String> chunk =
                    missing.subList(start, Math.min(start + MAX_IDS_PER_REQUEST, missing.size()));
            Map<String, String> chunkResult = fetchCommentChunk(new ArrayList<>(chunk));
            for (String id : chunk) {
                String body = chunkResult == null ? null : chunkResult.get(id);
                if (body == null || body.trim().isEmpty() || deletedSentinel(body) != null) {
                    COMMENT_CACHE.put(id, MISS);
                } else {
                    COMMENT_CACHE.put(id, body);
                    result.put(id, body);
                }
            }
        }
        return result;
    }

    private static Map<String, PostArchive> resolvePosts(List<String> ids) {
        Map<String, PostArchive> result = new ConcurrentHashMap<>();
        Set<String> seen = new java.util.HashSet<>();
        List<String> missing = new ArrayList<>();
        for (String id : ids) {
            PostArchive cached = POST_CACHE.get(id);
            if (cached != null) {
                if (!cached.isMiss()) {
                    result.put(id, cached);
                }
                continue;
            }
            if (missing.size() < MAX_IDS_TOTAL && seen.add(id)) {
                missing.add(id);
            }
        }

        for (int start = 0; start < missing.size(); start += MAX_IDS_PER_REQUEST) {
            List<String> chunk =
                    missing.subList(start, Math.min(start + MAX_IDS_PER_REQUEST, missing.size()));
            Map<String, PostArchive> chunkResult = fetchPostChunk(new ArrayList<>(chunk));
            for (String id : chunk) {
                PostArchive archived = chunkResult == null ? null : chunkResult.get(id);
                if (archived == null || archived.isMiss()) {
                    POST_CACHE.put(id, PostArchive.MISS);
                } else {
                    POST_CACHE.put(id, archived);
                    result.put(id, archived);
                }
            }
        }
        return result;
    }

    private static List<String> collectMissingIds(List<String> ids, Set<String> seen) {
        List<String> missing = new ArrayList<>();
        for (String id : ids) {
            if (COMMENT_CACHE.get(id) == null && missing.size() < MAX_IDS_TOTAL
                    && seen.add(id)) {
                missing.add(id);
            }
        }
        return missing;
    }

    /**
     * @return id → archived body, or null when every archive source failed.
     *         An empty (non-null) map means "archive has no copy of these ids".
     */
    private static Map<String, String> fetchCommentChunk(List<String> chunk) {
        String joined = join(chunk, ",");

        String primaryJson =
                httpGet(String.format(Locale.US, COMMENT_ARCHIVE_ENDPOINT, joined));
        Map<String, String> primary = primaryJson == null ? null : parseDataArray(primaryJson);
        if (primary != null && !primary.isEmpty()) {
            return primary;
        }

        String fallbackJson =
                httpGet(String.format(Locale.US, COMMENT_FALLBACK_ENDPOINT, joined, chunk.size()));
        Map<String, String> fallback = fallbackJson == null ? null : parseDataArray(fallbackJson);
        if (fallback != null) {
            return fallback;
        }
        // Distinguish "archive error" (null → negative-cache all) from
        // "archive has nothing" (empty map → negative-cache all, same handling).
        return primary;
    }

    private static Map<String, PostArchive> fetchPostChunk(List<String> chunk) {
        String joined = join(chunk, ",");

        String primaryJson = httpGet(String.format(Locale.US, POST_ARCHIVE_ENDPOINT, joined));
        Map<String, PostArchive> primary =
                primaryJson == null ? null : parsePostDataArray(primaryJson);
        if (primary != null && !primary.isEmpty()) {
            return primary;
        }

        String fallbackJson =
                httpGet(String.format(Locale.US, POST_FALLBACK_ENDPOINT, joined, chunk.size()));
        Map<String, PostArchive> fallback =
                fallbackJson == null ? null : parsePostDataArray(fallbackJson);
        if (fallback != null) {
            return fallback;
        }
        return primary;
    }

    private static String httpGet(String urlString) {
        HttpURLConnection connection = null;
        try {
            connection = (HttpURLConnection) new URL(urlString).openConnection();
            connection.setConnectTimeout(CONNECT_TIMEOUT_MS);
            connection.setReadTimeout(READ_TIMEOUT_MS);
            connection.setInstanceFollowRedirects(true);
            connection.setRequestProperty("User-Agent", "Proteus-Patches");
            connection.setRequestProperty("Accept", "application/json");
            if (connection.getResponseCode() != HttpURLConnection.HTTP_OK) {
                return null;
            }
            InputStream input = connection.getInputStream();
            BufferedReader reader =
                    new BufferedReader(new InputStreamReader(input, StandardCharsets.UTF_8));
            StringBuilder response = new StringBuilder(2048);
            char[] buffer = new char[2048];
            int read;
            while ((read = reader.read(buffer)) != -1) {
                response.append(buffer, 0, read);
                if (response.length() > MAX_RESPONSE_CHARS) {
                    break;
                }
            }
            reader.close();
            return response.toString();
        } catch (Throwable t) {
            return null;
        } finally {
            if (connection != null) {
                connection.disconnect();
            }
        }
    }

    /** Parses {@code {"data":[{"id":"…","body":"…"}, …]}} (Arctic Shift / PullPush shape). */
    private static Map<String, String> parseDataArray(String json) {
        try {
            JSONObject root = new JSONObject(json);
            JSONArray data = root.optJSONArray("data");
            if (data == null) {
                return Collections.emptyMap();
            }
            Map<String, String> map = new ConcurrentHashMap<>();
            for (int i = 0; i < data.length(); i++) {
                JSONObject entry = data.optJSONObject(i);
                if (entry == null) {
                    continue;
                }
                String id = normalizeId(entry.optString("id", null));
                String body = entry.optString("body", null);
                if (id != null && body != null && !body.isEmpty()) {
                    map.put(id, body);
                }
            }
            return map;
        } catch (Throwable t) {
            return null;
        }
    }

    /**
     * Parses post archives ({@code selftext} + {@code title}) from Arctic
     * Shift or PullPush.  Entries that only contain placeholders are kept so
     * they can be negative-cached without another request.
     */
    private static Map<String, PostArchive> parsePostDataArray(String json) {
        try {
            JSONObject root = new JSONObject(json);
            JSONArray data = root.optJSONArray("data");
            if (data == null) {
                return Collections.emptyMap();
            }
            Map<String, PostArchive> map = new ConcurrentHashMap<>();
            for (int i = 0; i < data.length(); i++) {
                JSONObject entry = data.optJSONObject(i);
                if (entry == null) {
                    continue;
                }
                String id = normalizeId(entry.optString("id", null));
                if (id == null) {
                    continue;
                }
                String selftext = usableArchiveText(entry.optString("selftext", null));
                String title = usableArchiveText(entry.optString("title", null));
                if (selftext != null || title != null) {
                    map.put(id, new PostArchive(selftext, title));
                }
            }
            return map;
        } catch (Throwable t) {
            return null;
        }
    }

    private static String usableArchiveText(String value) {
        if (value == null || value.trim().isEmpty() || deletedSentinel(value) != null) {
            return null;
        }
        return value;
    }

    // ── Body replacement ─────────────────────────────────────────────────────

    private static boolean replaceBody(Object model, String lowerSentinel, String replacement) {
        boolean replaced = false;

        // Prefer a dedicated setter when the model exposes one.
        Method setter = stringSetter(model.getClass());
        if (setter != null) {
            try {
                setter.invoke(model, replacement);
                replaced = true;
            } catch (Throwable ignored) {
                // Fall through to the field walk.
            }
        }

        // Field walk: set every String instance field whose current value is
        // exactly the placeholder, preferring body-like names.  Author/user-like
        // fields are never touched.
        List<Field> named = new ArrayList<>();
        List<Field> valued = new ArrayList<>();
        collectSentinelFields(model, lowerSentinel, false, named, valued);

        List<Field> targets = !named.isEmpty() ? named : valued;
        for (Field field : targets) {
            try {
                field.set(model, replacement);
                replaced = true;
            } catch (Throwable ignored) {
                // Keep trying the other candidates.
            }
        }

        Object tombstone = tombstone(model);
        if (tombstone != null) {
            replaced |= replaceEmptyBodyFields(model, replacement);
            replaced |= replaceTombstone(tombstone, replacement);
        }
        return replaced;
    }

    private static boolean replaceEmptyBodyFields(Object model, String replacement) {
        boolean replaced = false;
        for (Class<?> owner = model.getClass(); owner != null && owner != Object.class;
             owner = owner.getSuperclass()) {
            Field[] declared;
            try {
                declared = owner.getDeclaredFields();
            } catch (Throwable t) {
                continue;
            }
            for (Field field : declared) {
                int modifiers = field.getModifiers();
                if (Modifier.isStatic(modifiers)
                        || !String.class.isAssignableFrom(field.getType())) {
                    continue;
                }
                String name = field.getName().toLowerCase(Locale.ROOT);
                if (!isBodyFieldName(name)) {
                    continue;
                }
                try {
                    field.setAccessible(true);
                    Object value = field.get(model);
                    if (value instanceof String && !((String) value).trim().isEmpty()) {
                        continue;
                    }
                    field.set(model, replacement);
                    replaced = true;
                } catch (Throwable ignored) {
                    // Try the next body field.
                }
            }
        }
        return replaced;
    }

    private static boolean replaceTombstone(Object tombstone, String replacement) {
        boolean replaced = false;
        for (Class<?> owner = tombstone.getClass(); owner != null && owner != Object.class;
             owner = owner.getSuperclass()) {
            Field[] declared;
            try {
                declared = owner.getDeclaredFields();
            } catch (Throwable t) {
                continue;
            }
            for (Field field : declared) {
                int modifiers = field.getModifiers();
                if (Modifier.isStatic(modifiers)
                        || !String.class.isAssignableFrom(field.getType())) {
                    continue;
                }
                String name = field.getName().toLowerCase(Locale.ROOT);
                try {
                    field.setAccessible(true);
                    if (name.equals("richtext")) {
                        field.set(tombstone, null);
                        replaced = true;
                    } else if (isBodyFieldName(name)) {
                        field.set(tombstone, replacement);
                        replaced = true;
                    }
                } catch (Throwable ignored) {
                    // Try the next tombstone field.
                }
            }
        }
        return replaced;
    }

    private static boolean replaceTitle(Object model, String lowerSentinel, String replacement) {
        List<Field> named = new ArrayList<>();
        List<Field> valued = new ArrayList<>();
        collectSentinelFields(model, lowerSentinel, true, named, valued);

        List<Field> targets = !named.isEmpty() ? named : valued;
        boolean replaced = false;
        for (Field field : targets) {
            try {
                field.set(model, replacement);
                replaced = true;
            } catch (Throwable ignored) {
                // Keep trying the other candidates.
            }
        }
        return replaced;
    }

    private static void collectSentinelFields(Object model, String lowerSentinel, boolean title,
            List<Field> named, List<Field> valued) {
        for (Class<?> owner = model.getClass(); owner != null && owner != Object.class;
             owner = owner.getSuperclass()) {
            Field[] declared;
            try {
                declared = owner.getDeclaredFields();
            } catch (Throwable t) {
                continue;
            }
            for (Field field : declared) {
                int modifiers = field.getModifiers();
                if (Modifier.isStatic(modifiers)
                        || !String.class.isAssignableFrom(field.getType())) {
                    continue;
                }
                String name = field.getName().toLowerCase(Locale.ROOT);
                if (name.contains("author") || name.contains("user") || name.equals("by")
                        || name.contains("distinguished")) {
                    continue;
                }
                try {
                    field.setAccessible(true);
                } catch (Throwable t) {
                    continue;
                }
                Object value;
                try {
                    value = field.get(model);
                } catch (Throwable t) {
                    continue;
                }
                if (!(value instanceof String)) {
                    continue;
                }
                String current = ((String) value).trim().toLowerCase(Locale.ROOT);
                if (!current.equals(lowerSentinel)) {
                    continue;
                }
                boolean bodyName = isBodyFieldName(name);
                boolean titleName = isTitleFieldName(name);
                if (title) {
                    if (bodyName) {
                        continue;
                    }
                    if (titleName) {
                        named.add(field);
                    } else {
                        valued.add(field);
                    }
                } else {
                    if (titleName) {
                        continue;
                    }
                    if (bodyName) {
                        named.add(field);
                    } else {
                        valued.add(field);
                    }
                }
            }
        }
    }

    private static boolean isBodyFieldName(String lowerName) {
        for (String wanted : BODY_FIELD_NAMES) {
            if (lowerName.equals(wanted)) {
                return true;
            }
        }
        return false;
    }

    private static boolean isTitleFieldName(String lowerName) {
        for (String wanted : TITLE_FIELD_NAMES) {
            if (lowerName.equals(wanted)) {
                return true;
            }
        }
        return false;
    }

    // ── Reflection plumbing ──────────────────────────────────────────────────

    private static Object findModel(Object value) {
        // Fast path: rows that already are Reddit models skip the
        // IdentityHashMap allocation and the recursive field walk entirely.
        if (value != null && isRedditModel(value.getClass())) {
            return value;
        }
        return findModel(value, 0,
                Collections.newSetFromMap(new IdentityHashMap<Object, Boolean>()));
    }

    private static Object findModel(Object value, int depth, Set<Object> seen) {
        if (value == null || depth > 4 || seen.contains(value)) {
            return null;
        }

        Class<?> type = value.getClass();
        String name = type.getName();
        if (name.startsWith("java.") || name.startsWith("android.") || name.startsWith("kotlin.")) {
            return null;
        }
        if (value instanceof Map<?, ?>) {
            return null;
        }
        if (value instanceof Iterable<?>) {
            for (Object child : (Iterable<?>) value) {
                Object found = findModel(child, depth + 1, seen);
                if (found != null) {
                    return found;
                }
            }
            return null;
        }

        seen.add(value);
        if (isRedditModel(type)) {
            return value;
        }

        try {
            for (Class<?> owner = type; owner != null && owner != Object.class;
                 owner = owner.getSuperclass()) {
                for (Field field : owner.getDeclaredFields()) {
                    int modifiers = field.getModifiers();
                    if (Modifier.isStatic(modifiers)) {
                        continue;
                    }
                    try {
                        field.setAccessible(true);
                        Object found = findModel(field.get(value), depth + 1, seen);
                        if (found != null) {
                            return found;
                        }
                    } catch (Throwable ignored) {
                        // Try the next field.
                    }
                }
            }
        } catch (Throwable ignored) {
            // Wrapper drifted: treat as regular content.
        }
        return null;
    }

    private static boolean isRedditModel(Class<?> type) {
        Boolean cached = MODEL_TYPE_CACHE.get(type);
        if (cached != null) {
            return cached;
        }
        String name = type.getName().toLowerCase(Locale.ROOT);
        boolean reddit = name.startsWith("com.reddit.")
                || name.contains("reddit")
                || name.contains("comment");
        boolean looksLikeModel = firstMethod(type, BODY_GETTERS) != null
                || firstMethod(type, TITLE_GETTERS) != null
                || firstMethod(type, KIND_GETTERS) != null
                || firstMethod(type, COMMENT_MARKER_GETTERS) != null;
        boolean result = reddit && looksLikeModel;
        MODEL_TYPE_CACHE.put(type, result);
        return result;
    }

    private static Accessors accessors(Class<?> type) {
        Accessors cached = ACCESSOR_CACHE.get(type);
        if (cached != null) {
            return cached;
        }
        Accessors created = new Accessors(type);
        ACCESSOR_CACHE.put(type, created);
        return created;
    }

    private static final class Accessors {
        final Method body;
        final Method preview;
        final Method selftext;
        final Method title;
        final Method id;
        final Method kind;
        final Method tombstone;
        final Method commentToRestore;

        Accessors(Class<?> type) {
            body = firstMethod(type, BODY_GETTERS);
            preview = firstMethod(type, new String[]{"getBodyPreview"});
            selftext = firstMethod(type, new String[]{"getSelftext", "getSelfText"});
            title = firstMethod(type, TITLE_GETTERS);
            id = firstMethod(type, ID_GETTERS);
            kind = firstMethod(type, KIND_GETTERS);
            tombstone = firstMethod(type, new String[]{"getCommentTombstone"});
            commentToRestore = firstMethod(type, new String[]{"getCommentToRestore"});
        }
    }

    private static final class Pending {
        final Object model;
        final String id;
        final String bodySentinel;
        final String titleSentinel;

        Pending(Object model, String id, String bodySentinel, String titleSentinel) {
            this.model = model;
            this.id = id;
            this.bodySentinel = bodySentinel;
            this.titleSentinel = titleSentinel;
        }
    }

    private static final class PostArchive {
        static final PostArchive MISS = new PostArchive(null, null);

        final String selftext;
        final String title;

        PostArchive(String selftext, String title) {
            this.selftext = selftext;
            this.title = title;
        }

        boolean isMiss() {
            return selftext == null && title == null;
        }
    }

    private static Method firstMethod(Class<?> type, String[] names) {
        for (String name : names) {
            Method method = noArgMethod(type, name);
            if (method != null) {
                return method;
            }
        }
        return null;
    }

    private static Method noArgMethod(Class<?> type, String name) {
        for (Class<?> owner = type; owner != null && owner != Object.class;
             owner = owner.getSuperclass()) {
            try {
                Method method = owner.getMethod(name);
                if (method.getParameterTypes().length == 0) {
                    return method;
                }
            } catch (NoSuchMethodException ignored) {
                // Try the declared classes next.
            } catch (Throwable ignored) {
                // Try the next class in the hierarchy.
            }
            try {
                Method method = owner.getDeclaredMethod(name);
                if (method.getParameterTypes().length == 0) {
                    method.setAccessible(true);
                    return method;
                }
            } catch (NoSuchMethodException ignored) {
                // Not on this level either.
            } catch (Throwable ignored) {
                // Keep walking.
            }
        }
        return null;
    }

    private static Method stringSetter(Class<?> type) {
        for (String name : BODY_SETTER_NAMES) {
            for (Class<?> owner = type; owner != null && owner != Object.class;
                 owner = owner.getSuperclass()) {
                try {
                    Method method = owner.getDeclaredMethod(name, String.class);
                    method.setAccessible(true);
                    return method;
                } catch (NoSuchMethodException ignored) {
                    // Not this name/class; try the next.
                } catch (Throwable ignored) {
                    // Keep walking.
                }
            }
        }
        return null;
    }

    private static Object invoke(Method method, Object target) {
        if (method == null) {
            return null;
        }
        try {
            return method.invoke(target);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static String stringValue(Object value) {
        if (value == null) {
            return "";
        }
        if (value instanceof CharSequence) {
            return value.toString();
        }
        String[] getters = {
                "getName", "getDisplayName", "getDisplayNamePrefixed",
                "getUsername", "getId", "getBody", "getText", "getUrl"
        };
        for (String getter : getters) {
            try {
                Method method = noArgMethod(value.getClass(), getter);
                if (method == null) {
                    continue;
                }
                Object result = method.invoke(value);
                if (result instanceof CharSequence) {
                    return result.toString();
                }
            } catch (Throwable ignored) {
                // Try the next accessor.
            }
        }
        return "";
    }

    private static String join(List<String> values, String delimiter) {
        StringBuilder out = new StringBuilder();
        for (int i = 0; i < values.size(); i++) {
            if (i > 0) {
                out.append(delimiter);
            }
            out.append(values.get(i));
        }
        return out.toString();
    }

    private static void log(String message) {
        System.out.println("[Proteus] Show deleted comments: " + message);
    }
}
