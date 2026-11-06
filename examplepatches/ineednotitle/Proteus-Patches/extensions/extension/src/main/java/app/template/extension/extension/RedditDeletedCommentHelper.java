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
 * Runtime support for the Proteus Reddit "Show deleted comments" patch.
 *
 * <p>Reddit does not send the text of a deleted or removed comment back to
 * clients, so the only way to display it is an external archive.  This helper
 * resolves archived bodies for exactly the comments that are rendered as
 * {@code [deleted]} / {@code [removed]} in the listings the app builds, and
 * swaps the placeholder for the archived text (prefixed with
 * {@link #MARKER} so the restored text is always recognisable).
 *
 * <p>Injection contract used by the patch
 * ({@code ShowDeletedCommentsPatch}):
 * <ul>
 *   <li>{@code undeleteComments(List) -> List} — called on the same
 *       {@code Listing.children} choke point used by the AutoMod / content
 *       filter helpers.  Comment pages are deserialized off the main thread,
 *       so the (synchronous) archive request runs off the UI thread.  No
 *       network call is made when a listing contains no deleted comments.</li>
 * </ul>
 *
 * <p>Behaviour details and fail-safes:
 * <ul>
 *   <li>Only comment-shaped rows whose body is exactly {@code [deleted]} or
 *       {@code [removed]} are looked up.  Post-shaped rows are ignored.</li>
 *   <li>The archive is queried in one batch per listing by comment id
 *       (Arctic Shift {@code /api/comments/ids}, falling back to PullPush
 *       {@code /reddit/search/comment}).  No API key is required by either
 *       service.  Only the comment ids from the visible thread are sent —
 *       never anything else — and nothing is written anywhere.</li>
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

    /** Shown in front of every restored comment so provenance is visible. */
    private static final String MARKER = "[archived] ";

    private static final String ARCHIVE_ENDPOINT =
            "https://arctic-shift.photon-reddit.com/api/comments/ids?ids=%s&fields=id,body";
    private static final String FALLBACK_ENDPOINT =
            "https://api.pullpush.io/reddit/search/comment/?ids=%s&size=%d";

    private static final int MAX_IDS_PER_REQUEST = 100;
    private static final int MAX_IDS_TOTAL = 300;
    private static final int CONNECT_TIMEOUT_MS = 2500;
    private static final int READ_TIMEOUT_MS = 4000;
    private static final int MAX_RESPONSE_CHARS = 4 * 1024 * 1024;

    /** Negative-cache sentinel: this id was looked up and is not archived. */
    private static final String MISS = "";

    private static final Map<String, String> CACHE = new ConcurrentHashMap<>();
    private static final Map<Class<?>, Boolean> MODEL_TYPE_CACHE = new ConcurrentHashMap<>();
    private static final Map<Class<?>, Accessors> ACCESSOR_CACHE = new ConcurrentHashMap<>();

    private static final String[] BODY_GETTERS = {
            "getBody", "getSelftext", "getSelfText", "getText", "getCommentBody"
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
            "body", "selftext", "self_text", "commentbody", "comment_body",
            "text", "content", "markdown"
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
    public static List<?> undeleteComments(List<?> list) {
        if (list == null || list.isEmpty()) {
            return list;
        }
        List<?> memoized = ProteusListMemo.get(list);
        if (memoized != null) {
            return memoized;
        }
        List<?> result = undeleteCommentsInner(list);
        ProteusListMemo.put(list, result);
        return result;
    }

    private static List<?> undeleteCommentsInner(List<?> list) {
        List<Pending> pending = null;
        for (Object item : list) {
            Object model = findModel(item);
            if (model == null || !isCommentLike(model)) {
                continue;
            }
            String body = bodyText(model);
            String lowerSentinel = deletedSentinel(body);
            if (lowerSentinel == null) {
                continue;
            }
            String id = commentId(model);
            if (id == null) {
                continue;
            }
            if (pending == null) {
                pending = new ArrayList<>();
            }
            pending.add(new Pending(model, id, lowerSentinel));
        }

        if (pending == null) {
            // No deleted comments in this listing: no network traffic at all.
            return list;
        }
        log("found " + pending.size() + " deleted/removed comment row(s); querying archive");

        List<String> ids = new ArrayList<>(pending.size());
        for (Pending entry : pending) {
            ids.add(entry.id);
        }

        Map<String, String> resolved;
        try {
            resolved = resolveBodies(ids);
        } catch (Throwable t) {
            log("archive lookup failed (" + t.getClass().getSimpleName() + "); keeping original rows");
            return list;
        }

        int hits = 0;
        for (Pending entry : pending) {
            String archived = resolved.get(entry.id);
            if (archived != null && !archived.isEmpty()) {
                hits++;
            }
        }
        log("archive returned bodies for " + hits + " of " + pending.size() + " id(s)");

        int restored = 0;
        for (Pending entry : pending) {
            String archived = resolved.get(entry.id);
            if (archived == null || archived.isEmpty()) {
                continue;
            }
            if (replaceBody(entry.model, entry.lowerSentinel, MARKER + archived)) {
                restored++;
            }
        }
        if (restored > 0) {
            log("restored " + restored + " archived comment(s)");
        } else if (hits > 0) {
            log("archive had bodies but no comment model could be rewritten "
                    + "(setter missing or model layout drift); staying [deleted]");
        } else {
            log("no archived copies found; very recent deletions are often not "
                    + "tracked yet; staying [deleted]");
        }
        return list;
    }

    // ── Comment shape detection ──────────────────────────────────────────────

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

    private static boolean isCommentLike(Object model) {
        Class<?> type = model.getClass();
        Accessors accessors = accessors(type);

        String kind = stringValue(invoke(accessors.kind, model))
                .trim().toLowerCase(Locale.ROOT);
        if (kind.startsWith("t1")) {
            return true;
        }
        if (kind.startsWith("t3")) {
            // Self-posts are t3_* and are out of scope for this patch.
            return false;
        }

        String className = type.getName().toLowerCase(Locale.ROOT);
        if (className.contains("comment")) {
            return true;
        }
        for (String marker : COMMENT_MARKER_GETTERS) {
            if (noArgMethod(type, marker) != null) {
                return true;
            }
        }
        return false;
    }

    private static String bodyText(Object model) {
        Accessors accessors = accessors(model.getClass());
        return stringValue(invoke(accessors.body, model));
    }

    private static String commentId(Object model) {
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
        if (value.startsWith("t1_")) {
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

    private static Map<String, String> resolveBodies(List<String> ids) {
        Map<String, String> result = new ConcurrentHashMap<>();
        List<String> missing = new ArrayList<>();
        Set<String> seen = new java.util.HashSet<>();

        for (String id : ids) {
            String cached = CACHE.get(id);
            if (cached != null) {
                if (!MISS.equals(cached)) {
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
            Map<String, String> chunkResult = fetchChunk(new ArrayList<>(chunk));
            if (chunkResult == null) {
                for (String id : chunk) {
                    CACHE.put(id, MISS);
                }
                continue;
            }
            for (String id : chunk) {
                String body = chunkResult.get(id);
                if (body == null || body.trim().isEmpty() || deletedSentinel(body) != null) {
                    CACHE.put(id, MISS);
                } else {
                    CACHE.put(id, body);
                    result.put(id, body);
                }
            }
        }
        return result;
    }

    /**
     * @return id → archived body, or null when every archive source failed.
     *         An empty (non-null) map means "archive has no copy of these ids".
     */
    private static Map<String, String> fetchChunk(List<String> chunk) {
        String joined = join(chunk, ",");

        String primaryJson = httpGet(String.format(Locale.US, ARCHIVE_ENDPOINT, joined));
        Map<String, String> primary = primaryJson == null ? null : parseDataArray(primaryJson);
        if (primary != null && !primary.isEmpty()) {
            return primary;
        }

        String fallbackJson =
                httpGet(String.format(Locale.US, FALLBACK_ENDPOINT, joined, chunk.size()));
        Map<String, String> fallback = fallbackJson == null ? null : parseDataArray(fallbackJson);
        if (fallback != null) {
            return fallback;
        }
        // Distinguish "archive error" (null → negative-cache all) from
        // "archive has nothing" (empty map → negative-cache all, same handling).
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

    // ── Body replacement ─────────────────────────────────────────────────────

    private static boolean replaceBody(Object model, String lowerSentinel, String replacement) {
        // Prefer a dedicated setter when the model exposes one.
        Method setter = stringSetter(model.getClass());
        if (setter != null) {
            try {
                setter.invoke(model, replacement);
                return true;
            } catch (Throwable ignored) {
                // Fall through to the field walk.
            }
        }

        // Field walk: set every String instance field whose current value is
        // exactly the placeholder, preferring body-like names.  Author/user-like
        // fields are never touched.
        List<Field> named = new ArrayList<>();
        List<Field> valued = new ArrayList<>();
        collectSentinelFields(model, lowerSentinel, named, valued);

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

    private static void collectSentinelFields(Object model, String lowerSentinel,
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
                if (isBodyFieldName(name)) {
                    named.add(field);
                } else {
                    valued.add(field);
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
        final Method id;
        final Method kind;

        Accessors(Class<?> type) {
            body = firstMethod(type, BODY_GETTERS);
            id = firstMethod(type, ID_GETTERS);
            kind = firstMethod(type, KIND_GETTERS);
        }
    }

    private static final class Pending {
        final Object model;
        final String id;
        final String lowerSentinel;

        Pending(Object model, String id, String lowerSentinel) {
            this.model = model;
            this.id = id;
            this.lowerSentinel = lowerSentinel;
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
