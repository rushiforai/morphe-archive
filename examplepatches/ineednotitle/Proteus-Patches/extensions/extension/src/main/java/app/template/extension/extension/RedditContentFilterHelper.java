package app.template.extension.extension;

import android.util.Base64;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * Runtime support for the Proteus Reddit "Block AutoMod comments" and
 * "Content filters" patches.
 *
 * <p>The extension is compiled against the Android SDK only, so it cannot import
 * {@code com.reddit.domain.model.Link} / {@code Comment}.  Everything is resolved
 * reflectively on the merged app's own classes.  All reflection lookups are
 * cached per concrete class, and every reflective operation is guarded: if a
 * future Reddit build renames a getter or a field, the helper degrades to a
 * no-op instead of crashing feed or comment rendering.
 *
 * <p>Injection contract used by the patches:
 * <ul>
 *   <li>{@code hideAutoModComments(List) -> List} — drops comment rows authored
 *       by u/AutoModerator (posts by AutoModerator are kept).  Logs a one-time
 *       "filter is live" probe and throttled drop counts to {@code System.out}
 *       (visible via {@code adb logcat}) so device builds can confirm the
 *       choke point ran; when the author getter cannot be resolved it falls
 *       back to the canonical AutoModerator boilerplate footer before giving
 *       up.</li>
 *   <li>{@code filterContent(List) -> List} — applies the patch-time keyword /
 *       community / author / flair rules and, when enabled, clears local
 *       NSFW / spoiler / quarantine / blur gates on the returned items.</li>
 * </ul>
 *
 * <p>{@link #patchConfig()} returns a placeholder string in the shipped
 * .mpe.  The "Content filters" patch rewrites every {@code const-string}
 * carrying that value to a Base64-encoded config, so no extra register is
 * needed at the {@code Listing.children} injection sites.
 *
 * <p>Do not move the placeholder into a {@code static final String} field:
 * D8 encodes such fields as DEX static-field initial values and drops the
 * {@code <clinit>} assignment, which leaves no instruction for the patch to
 * replace (seen on Patcher 2.2.0 / Reddit 2026.42.0).
 */
public final class RedditContentFilterHelper {

    /** Replaced at patch time by ContentFiltersPatch. */
    private static String patchConfig() {
        return "PROTEUS_REDDIT_FILTER_CONFIG_V1";
    }

    private static volatile Config parsedConfig;

    /** Set once the first hideAutoModComments pass completes; lets device logs prove the hook is live. */
    private static final AtomicBoolean AUTO_MOD_PROBE_LOGGED = new AtomicBoolean();
    private static final AtomicInteger AUTO_MOD_DROP_LOG_COUNT = new AtomicInteger();

    private static void logAutoMod(String message) {
        System.out.println("[Proteus][Block AutoMod] " + message);
    }

    private static void logAutoModDrop(int dropped, int total) {
        int n = AUTO_MOD_DROP_LOG_COUNT.incrementAndGet();
        if (n <= 5 || n % 25 == 0) {
            logAutoMod("dropped " + dropped + " of " + total + " rows (event " + n + ")");
        }
    }

    private static final Map<Class<?>, Boolean> MODEL_CLASS_CACHE = new ConcurrentHashMap<>();
    private static final Map<Class<?>, Accessors> ACCESSOR_CACHE = new ConcurrentHashMap<>();
    private static final Map<Class<?>, List<Field>> GATE_FIELD_CACHE = new ConcurrentHashMap<>();

    private static final String[] TITLE_GETTERS = {
            "getTitle", "getLinkTitle", "getPostTitle"
    };
    private static final String[] BODY_GETTERS = {
            "getBody", "getSelftext", "getSelfText", "getText", "getCommentBody"
    };
    private static final String[] SELFTEXT_GETTERS = {
            "getSelftext", "getSelfText", "getBody"
    };
    private static final String[] AUTHOR_GETTERS = {
            "getAuthor", "getAuthorName", "getAuthorFullname", "getAuthorFullName",
            "getAuthorDisplayName", "getUsername", "getUser", "getCreatorName",
            "getNickname", "getName"
    };
    private static final String[] COMMUNITY_GETTERS = {
            "getSubreddit", "getSubredditName", "getCommunity", "getCommunityName",
            "getSubredditNamePrefixed"
    };
    private static final String[] FLAIR_GETTERS = {
            "getLinkFlairText", "getFlairText", "getFlair", "getAuthorFlairText"
    };
    private static final String[] KIND_GETTERS = {
            "getKindWithId", "getKind", "getFullName", "getFullname", "getType"
    };
    private static final String[] COMMENT_MARKER_GETTERS = {
            "getParentId", "getLinkId", "getDepth", "getReplies", "getParent"
    };

    private RedditContentFilterHelper() {
        // Static injection surface only.
    }

    // ── Injection surface ────────────────────────────────────────────────────

    /**
     * Drops every comment-shaped row whose author is AutoModerator / AutoMod.
     * Post-shaped rows (kind "t3_*", or with a title getter) are deliberately
     * kept: weekly threads and other AutoModerator submissions are not comments.
     *
     * <p>Results are memoized per list identity (see {@link ProteusListMemo}):
     * Compose re-reads {@code Listing.getChildren()} on the UI path, and each
     * read would otherwise redo the reflective row scan.  Output is unchanged
     * on every pass of the same list instance.
     */
    public static List<?> hideAutoModComments(List<?> list) {
        if (list == null || list.isEmpty()) {
            return list;
        }
        List<?> memoized = ProteusListMemo.get(list);
        if (memoized != null) {
            return memoized;
        }
        List<?> result = hideAutoModCommentsInner(list);
        ProteusListMemo.put(list, result);
        return result;
    }

    private static List<?> hideAutoModCommentsInner(List<?> list) {
        if (!AUTO_MOD_PROBE_LOGGED.getAndSet(true)) {
            logAutoMod("filter is live (first pass over " + list.size() + " rows)");
        }

        List<Object> filtered = null;
        int dropped = 0;
        for (int i = 0, size = list.size(); i < size; i++) {
            Object item = list.get(i);
            if (isAutoModComment(item)) {
                dropped++;
                if (filtered == null) {
                    filtered = new ArrayList<Object>(list.subList(0, i));
                }
                continue;
            }
            if (filtered != null) {
                filtered.add(item);
            }
        }
        if (filtered != null) {
            logAutoModDrop(dropped, list.size());
            return filtered;
        }
        return list;
    }

    /**
     * Applies the configured content rules.  Also clears local content gates on
     * kept items when "Bypass built-in content gates" is enabled.  This cannot
     * restore posts that Reddit never returned (server-side filtering).
     *
     * <p>Results are memoized per list identity (see {@link ProteusListMemo}):
     * Compose reads the listing's {@code getChildren()} repeatedly, and each
     * read would otherwise redo the reflective row scan.  Output is unchanged
     * on every pass of the same list instance.
     */
    public static List<?> filterContent(List<?> list) {
        if (list == null || list.isEmpty()) {
            return list;
        }
        List<?> memoized = ProteusListMemo.get(list);
        if (memoized != null) {
            return memoized;
        }
        List<?> result = filterContentInner(list);
        ProteusListMemo.put(list, result);
        return result;
    }

    private static List<?> filterContentInner(List<?> list) {
        Config config = config();
        if (!config.active()) {
            return list;
        }

        List<Object> filtered = null;
        for (int i = 0, size = list.size(); i < size; i++) {
            Object item = list.get(i);

            if (config.bypassGates) {
                unlockContentGates(item);
            }

            if (shouldDrop(item, config)) {
                if (filtered == null) {
                    filtered = new ArrayList<Object>(list.subList(0, i));
                }
                continue;
            }
            if (filtered != null) {
                filtered.add(item);
            }
        }
        return filtered != null ? filtered : list;
    }

    // ── AutoModerator detection ──────────────────────────────────────────────

    private static boolean isAutoModComment(Object item) {
        Object model = findModel(item);
        if (model == null) {
            return false;
        }
        Accessors accessors = accessors(model.getClass());
        if (!accessors.isCommentLike(model)) {
            return false;
        }
        String author = stringValue(invoke(accessors.author, model));
        if (isAutoModerator(author)) {
            return true;
        }
        // Fallback for builds where the author getter cannot be resolved:
        // AutoModerator footers always carry this canonical sentence, and a
        // resolved non-AutoModerator author must win over text matching.
        if (author == null || author.trim().isEmpty()) {
            String body = stringValue(invoke(accessors.body, model));
            return body != null && body.toLowerCase(Locale.ROOT)
                    .contains(AUTO_MOD_BOILERPLATE);
        }
        return false;
    }

    /** Canonical closing sentence present in every AutoModerator bot footer. */
    private static final String AUTO_MOD_BOILERPLATE =
            "i am a bot, and this action was performed automatically";

    private static boolean isAutoModerator(String raw) {
        String author = raw == null ? "" : raw.trim();
        if (author.startsWith("/u/")) {
            author = author.substring(3);
        } else if (author.startsWith("u/")) {
            author = author.substring(2);
        }
        return author.equalsIgnoreCase("AutoModerator") || author.equalsIgnoreCase("AutoMod");
    }

    // ── Content rules ────────────────────────────────────────────────────────

    private static boolean shouldDrop(Object item, Config config) {
        Object model = findModel(item);
        if (model == null) {
            return false;
        }

        Accessors accessors = accessors(model.getClass());
        boolean isComment = accessors.isCommentLike(model);
        if (isComment && !config.filterComments) {
            return false;
        }

        String title = stringValue(invoke(accessors.title, model));
        String body = stringValue(invoke(accessors.body, model));
        String selftext = stringValue(invoke(accessors.selftext, model));
        String flair = stringValue(invoke(accessors.flair, model)).trim();
        String community = normalizeCommunity(stringValue(invoke(accessors.community, model)));
        String author = normalizeAuthor(stringValue(invoke(accessors.author, model)));

        String text = (title + "\n" + body + "\n" + selftext + "\n" + flair)
                .toLowerCase(Locale.ROOT);

        boolean keywords = !config.keywords.isEmpty() && containsAny(text, config.keywords);
        boolean communities = !config.communities.isEmpty()
                && equalsAny(community, config.communities);
        boolean authors = !config.authors.isEmpty() && equalsAny(author, config.authors);
        boolean flairs = !config.flairs.isEmpty()
                && matchesFlair(community, flair, config.flairs);

        if (!config.matchAll) {
            return keywords || communities || authors || flairs;
        }

        // "All categories": only drop when every configured category matches.
        boolean anyConfigured = !config.keywords.isEmpty() || !config.communities.isEmpty()
                || !config.authors.isEmpty() || !config.flairs.isEmpty();
        if (!anyConfigured) {
            return false;
        }
        return (config.keywords.isEmpty() || keywords)
                && (config.communities.isEmpty() || communities)
                && (config.authors.isEmpty() || authors)
                && (config.flairs.isEmpty() || flairs);
    }

    private static boolean containsAny(String haystack, List<String> needles) {
        for (String needle : needles) {
            if (!needle.isEmpty() && haystack.contains(needle)) {
                return true;
            }
        }
        return false;
    }

    private static boolean equalsAny(String value, List<String> rules) {
        for (String rule : rules) {
            if (rule.equals(value)) {
                return true;
            }
        }
        return false;
    }

    private static boolean matchesFlair(String community, String flair, List<String> rules) {
        String wantedFlair = flair.trim().toLowerCase(Locale.ROOT);
        for (String rule : rules) {
            int separator = rule.indexOf("::");
            if (separator >= 0) {
                String wantedCommunity = normalizeCommunity(rule.substring(0, separator));
                String wanted = rule.substring(separator + 2).trim().toLowerCase(Locale.ROOT);
                if (!wantedCommunity.isEmpty() && wantedCommunity.equals(community)
                        && wanted.equals(wantedFlair)) {
                    return true;
                }
            } else if (rule.equals(wantedFlair)) {
                return true;
            }
        }
        return false;
    }

    // ── Local content gates (best-effort) ────────────────────────────────────

    /**
     * Clears boolean NSFW / spoiler / quarantine / blur / age-gate flags on
     * feed and comment models.  R8 may rename model fields, in which case this
     * finds nothing and does nothing — the Account-level over-18 flags forced by
     * the patch still apply.  Never touches non-gate booleans.
     */
    private static void unlockContentGates(Object item) {
        if (item == null) {
            return;
        }
        clearGateFields(item);
        Object model = findModel(item);
        if (model != null && model != item) {
            clearGateFields(model);
        }
    }

    private static void clearGateFields(Object target) {
        List<Field> fields = gateFields(target.getClass());
        for (Field field : fields) {
            try {
                field.set(target, gateShouldBeEnabled(field.getName()));
            } catch (Throwable ignored) {
                // Final field on a locked-down runtime: skip, never crash.
            }
        }
    }

    private static List<Field> gateFields(Class<?> type) {
        List<Field> cached = GATE_FIELD_CACHE.get(type);
        if (cached != null) {
            return cached;
        }

        List<Field> fields = new ArrayList<>();
        try {
            for (Class<?> owner = type; owner != null && owner != Object.class;
                 owner = owner.getSuperclass()) {
                for (Field field : owner.getDeclaredFields()) {
                    if (Modifier.isStatic(field.getModifiers())) {
                        continue;
                    }
                    Class<?> fieldType = field.getType();
                    if (fieldType != boolean.class && fieldType != Boolean.class) {
                        continue;
                    }
                    if (!isGateName(field.getName())) {
                        continue;
                    }
                    try {
                        field.setAccessible(true);
                        fields.add(field);
                    } catch (Throwable ignored) {
                        // Keep scanning the other fields.
                    }
                }
            }
        } catch (Throwable ignored) {
            // Reflection on a framework superclass can be restricted.
        }

        GATE_FIELD_CACHE.put(type, fields);
        return fields;
    }

    private static boolean isGateName(String name) {
        String normalized = name.toLowerCase(Locale.ROOT).replace("_", "");
        return normalized.contains("nsfw")
                || normalized.contains("over18")
                || normalized.contains("spoiler")
                || normalized.contains("quarantine")
                || normalized.contains("mature")
                || normalized.contains("blur")
                || normalized.contains("agegate")
                || normalized.contains("gated")
                || normalized.contains("filtered")
                || normalized.contains("restricted")
                || normalized.contains("sensitive");
    }

    private static boolean gateShouldBeEnabled(String name) {
        String normalized = name.toLowerCase(Locale.ROOT).replace("_", "");
        return normalized.startsWith("show")
                || normalized.startsWith("enable")
                || normalized.startsWith("allow")
                || normalized.contains("shownsfw")
                || normalized.contains("showmature");
    }

    // ── Model discovery ──────────────────────────────────────────────────────

    /**
     * Unwraps feed/comment row wrappers and returns the first Reddit model that
     * exposes useful getters.  Depth and identity tracking keep cyclic graphs
     * bounded.  Verified shapes on Reddit 2026.37/2026.42 include
     * {@code com.reddit.domain.model.Link} (getTitle/getBody/getSubreddit/...) and
     * comment models (getAuthor/getBody/getParentId/...).
     */
    private static Object findModel(Object value) {
        // Fast path: rows that already are Reddit models skip the
        // IdentityHashMap allocation and the recursive field walk entirely.
        if (value != null && isRedditModel(value.getClass())) {
            return value;
        }
        return findModel(value, 0, Collections.newSetFromMap(new IdentityHashMap<Object, Boolean>()));
    }

    private static Object findModel(Object value, int depth, Set<Object> seen) {
        if (value == null || depth > 4 || seen.contains(value)) {
            return null;
        }

        Class<?> type = value.getClass();
        String name = type.getName();
        if (name.startsWith("java.") || name.startsWith("android.")
                || name.startsWith("kotlin.")) {
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
                    if (Modifier.isStatic(field.getModifiers())
                            || field.getType().isPrimitive()) {
                        continue;
                    }
                    field.setAccessible(true);
                    Object found = findModel(field.get(value), depth + 1, seen);
                    if (found != null) {
                        return found;
                    }
                }
            }
        } catch (Throwable ignored) {
            // Wrapper drifted: treat as regular content.
        }
        return null;
    }

    /**
     * Prefer actual post/comment models over nested value objects such as a
     * Subreddit or an author summary that happen to expose a title getter.
     * A primary model is the Link class, a comment-shaped class, or any Reddit
     * class exposing author / kind / comment-marker accessors.
     */
    private static boolean isRedditModel(Class<?> type) {
        Boolean cached = MODEL_CLASS_CACHE.get(type);
        if (cached != null) {
            return cached;
        }

        String name = type.getName();
        String lower = name.toLowerCase(Locale.ROOT);
        boolean reddit = name.startsWith("com.reddit.")
                || lower.contains("reddit")
                || lower.contains("comment");
        boolean primary = lower.equals("com.reddit.domain.model.link")
                || lower.contains("comment")
                || firstMethod(type, AUTHOR_GETTERS) != null
                || firstMethod(type, KIND_GETTERS) != null
                || firstMethod(type, COMMENT_MARKER_GETTERS) != null;

        boolean result = reddit && primary;
        MODEL_CLASS_CACHE.put(type, result);
        return result;
    }

    // ── Cached accessors ─────────────────────────────────────────────────────

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
        private final Class<?> type;
        final Method title;
        final Method body;
        final Method selftext;
        final Method author;
        final Method community;
        final Method flair;
        final Method kind;
        final Method parentId;
        final Method linkId;
        final Method depth;

        Accessors(Class<?> type) {
            this.type = type;
            title = firstMethod(type, TITLE_GETTERS);
            body = firstMethod(type, BODY_GETTERS);
            selftext = firstMethod(type, SELFTEXT_GETTERS);
            author = firstMethod(type, AUTHOR_GETTERS);
            community = firstMethod(type, COMMUNITY_GETTERS);
            flair = firstMethod(type, FLAIR_GETTERS);
            kind = firstMethod(type, KIND_GETTERS);
            parentId = noArgMethod(type, "getParentId");
            linkId = noArgMethod(type, "getLinkId");
            depth = firstMethod(type, COMMENT_MARKER_GETTERS);
        }

        boolean isCommentLike(Object model) {
            String kindValue = stringValue(invoke(kind, model)).toLowerCase(Locale.ROOT);
            if (kindValue.equals("t1") || kindValue.startsWith("t1_")) {
                return true;
            }
            if (kindValue.equals("t3") || kindValue.startsWith("t3_")) {
                return false;
            }

            String className = type.getName().toLowerCase(Locale.ROOT);
            if (className.contains("comment") || className.contains("reply")) {
                return true;
            }
            if (title != null) {
                return false;
            }
            return parentId != null || linkId != null || depth != null || body != null;
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
        try {
            Method method = type.getMethod(name);
            if (method.getParameterTypes().length == 0) {
                return method;
            }
        } catch (Throwable ignored) {
            // Try declared (possibly non-public) methods next.
        }
        try {
            Method method = type.getDeclaredMethod(name);
            if (method.getParameterTypes().length == 0) {
                method.setAccessible(true);
                return method;
            }
        } catch (Throwable ignored) {
            // Getter not present on this model shape.
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
        // Author / community values are sometimes model objects rather than
        // plain strings.  Resolve the common display-name accessors.
        String[] getters = {
                "getName", "getDisplayName", "getDisplayNamePrefixed",
                "getUsername", "getText", "getTitle", "getUrl"
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

    // ── Config decoding ──────────────────────────────────────────────────────

    private static Config config() {
        Config config = parsedConfig;
        if (config != null) {
            return config;
        }
        synchronized (RedditContentFilterHelper.class) {
            if (parsedConfig == null) {
                parsedConfig = Config.parse(patchConfig());
            }
            return parsedConfig;
        }
    }

    private static final class Config {
        final List<String> keywords = new ArrayList<>();
        final List<String> communities = new ArrayList<>();
        final List<String> authors = new ArrayList<>();
        final List<String> flairs = new ArrayList<>();
        boolean bypassGates;
        boolean filterComments;
        boolean matchAll;

        boolean active() {
            return bypassGates || !keywords.isEmpty() || !communities.isEmpty()
                    || !authors.isEmpty() || !flairs.isEmpty();
        }

        static Config parse(String raw) {
            Config config = new Config();
            if (raw == null) {
                return config;
            }

            String[] parts = raw.split("\\|", -1);
            if (parts.length < 5) {
                // The unpatched placeholder (and any malformed value) has no
                // pipe-separated fields, so it is a safe no-op.
                return config;
            }

            config.keywords.addAll(splitRules(decode(parts[0])));
            config.communities.addAll(normalizeRules(splitRules(decode(parts[1]))));
            config.authors.addAll(normalizeRules(splitRules(decode(parts[2]))));
            config.flairs.addAll(splitRules(decode(parts[3])));

            String flags = decode(parts[4]);
            config.bypassGates = flag(flags, "bypass", true);
            config.filterComments = flag(flags, "comments", false);
            config.matchAll = flags.contains("mode=all");
            return config;
        }
    }

    private static String decode(String part) {
        if (part == null || part.isEmpty()) {
            return "";
        }
        try {
            return new String(Base64.decode(part, Base64.URL_SAFE), StandardCharsets.UTF_8);
        } catch (Throwable ignored) {
            return "";
        }
    }

    private static List<String> splitRules(String value) {
        List<String> rules = new ArrayList<>();
        if (value == null || value.isEmpty()) {
            return rules;
        }
        for (String part : value.split("[,\\n\\r]+")) {
            String rule = part.trim();
            if (!rule.isEmpty()) {
                rules.add(rule.toLowerCase(Locale.ROOT));
            }
        }
        return rules;
    }

    private static List<String> normalizeRules(List<String> rules) {
        List<String> normalized = new ArrayList<>(rules.size());
        for (String rule : rules) {
            String value = rule.trim().toLowerCase(Locale.ROOT);
            if (value.startsWith("/r/")) {
                value = value.substring(3);
            } else if (value.startsWith("r/")) {
                value = value.substring(2);
            } else if (value.startsWith("/u/")) {
                value = value.substring(3);
            } else if (value.startsWith("u/")) {
                value = value.substring(2);
            }
            if (!value.isEmpty()) {
                normalized.add(value);
            }
        }
        return normalized;
    }

    private static boolean flag(String flags, String key, boolean fallback) {
        for (String token : flags.split(";")) {
            String[] pair = token.split("=", 2);
            if (pair.length == 2 && pair[0].trim().equals(key)) {
                String value = pair[1].trim();
                return value.equals("1") || value.equalsIgnoreCase("true");
            }
        }
        return fallback;
    }

    private static String normalizeCommunity(String value) {
        String normalized = value == null ? "" : value.trim().toLowerCase(Locale.ROOT);
        if (normalized.startsWith("/r/")) {
            normalized = normalized.substring(3);
        } else if (normalized.startsWith("r/")) {
            normalized = normalized.substring(2);
        }
        return normalized;
    }

    private static String normalizeAuthor(String value) {
        String normalized = value == null ? "" : value.trim().toLowerCase(Locale.ROOT);
        if (normalized.startsWith("/u/")) {
            normalized = normalized.substring(3);
        } else if (normalized.startsWith("u/")) {
            normalized = normalized.substring(2);
        }
        return normalized;
    }
}
