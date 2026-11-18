package io.github.kirby1997.extension.twitter;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Bypasses the empty profile Media tab that X 12.7.1 shows for sensitive/restricted content, by
 * rebuilding it from a source the server does not withhold.
 * <p>
 * The Media tab is served by the {@code media_timeline_v2} operation (MediaTimelineV2,
 * safety_level UserScopedTimeline). For an account whose media X treats as sensitive, the server
 * returns that operation <em>empty</em> (the "@user hasn't posted media" state) whenever the
 * viewer is not authorised for sensitive content - e.g. a viewer account that is itself
 * age/region-restricted. The restriction is server-side and applies on every client (the web
 * {@code UserPhotoTimeline} grid is empty for the same viewer too), so no amount of client-side
 * "show sensitive media" unmasking can fill it: the media is never delivered to that operation.
 * <p>
 * The posts-and-replies timeline ({@code user_with_profile_tweets_and_replies_query_v2}, the
 * operation the Replies tab uses) is <strong>not</strong> withheld the same way - the owner's own
 * sensitive media still comes back on it. It carries the same variables (rest_id,
 * includeTweetVisibilityNudge) and the same response path, so it can feed the Media tab instead.
 * This patch therefore falls the Media tab back to posts-and-replies, trimmed to the owner's own
 * posts that carry media, surfacing what the withheld media grid refuses to.
 * <p>
 * It is a <strong>fallback, not an unconditional swap</strong>: swapping every profile would wreck
 * the normal case, because posts-and-replies is a far sparser media source than the server's media
 * grid (a non-restricted account with hundreds of photos yields only a handful of own-media items
 * per page). So {@link #operation} keeps requesting {@code media_timeline_v2} and only switches an
 * owner to posts-and-replies once that owner's media timeline has actually come back empty
 * ({@link #onProfileMediaResponse} records it). Profiles whose media grid loads normally are left
 * completely untouched; a withheld profile needs one extra Media-tab load to fill in, and the set
 * of fallback owners is process-lifetime only.
 * <p>
 * Reposts are excluded: the Media feed shows only the owner's own media, so entries whose resolved
 * tweet is authored by someone else (reposts carry the original author) are dropped along with
 * other people's posts. The posts-and-replies source is inherently limited - for an account that
 * mostly reposts, its own-media count is genuinely low, and own media buried deep under reposts
 * only appears as the viewer scrolls further pages.
 * <p>
 * Called from the top of {@code com.twitter.api.legacy.request.urt.t.a(z3, v2)}, the converter
 * every legacy URT response passes through on its way to the database. The argument is the
 * parsed response ({@code com.twitter.model.timeline.urt.z3}); only responses for the profile
 * media timeline (timeline type 15) are touched.
 * <p>
 * Field names are the R8-obfuscated ones of 12.7.1 and are resolved reflectively so this class
 * needs no stubs. Any mismatch leaves the response untouched rather than crashing the timeline.
 *
 * <pre>
 * z3            a: q (global objects)      b: t1 (instructions)       c: z3$b (metadata)
 * z3$b          b: e2 (timeline key)
 * e2            a: int timeline type       c: long timeline owner id
 * q             a: Map&lt;String, core.b&gt; tweets by id
 * t1            b: List&lt;f2&gt; instructions
 * instructions  n.a: List&lt;a2&gt; (AddEntries)   o.c: List&lt;n2&gt; (AddToModule)   h.a: a2 (PinEntry)
 * a2 entries    v4.j: r4 (tweet item, r4.a = tweet id)   t2.e: List&lt;n2&gt; (module items)
 * core.b        b: l1 author (l1.a = id)   f: core.d
 * core.d        o: long in_reply_to_status_id   k: h1 text entities
 * h1.f: j1      j1.g: c0 media list    c0.a (from s): List&lt;b0&gt;    b0.p: b0$d media type enum
 * </pre>
 */
@SuppressWarnings("unused")
public final class ProfileMediaTimelineFilter {
    private static final int PROFILE_MEDIA_TIMELINE = 15;

    private static final String ADD_ENTRIES = "com.twitter.model.timeline.urt.instructions.n";
    private static final String ADD_TO_MODULE = "com.twitter.model.timeline.urt.instructions.o";
    private static final String PIN_ENTRY = "com.twitter.model.timeline.urt.instructions.h";
    private static final String TWEET_ENTRY = "com.twitter.model.timeline.urt.v4";
    private static final String MODULE_ENTRY = "com.twitter.model.timeline.urt.t2";

    private static final int KEEP_OWN_MEDIA = 1;
    private static final int HIDE_GIF_REPLIES = 2;

    /** Operation the Media tab falls back to once its {@code media_timeline_v2} came back empty. */
    private static final String REPLIES_OPERATION = "user_with_profile_tweets_and_replies_query_v2";

    /**
     * Owner rest_ids whose {@code media_timeline_v2} returned no posts this session, so their
     * Media tab should be served from the posts-and-replies timeline instead. Populated by
     * {@link #onProfileMediaResponse}; read by {@link #operation}. Process-lifetime only.
     */
    private static final Set<Long> repliesFallbackOwners =
            Collections.synchronizedSet(new HashSet<Long>());

    private ProfileMediaTimelineFilter() {
    }

    /**
     * Chooses the GraphQL operation for a profile Media tab request. Returns {@code mediaOperation}
     * ({@code media_timeline_v2}) for every owner until one is recorded as having an empty media
     * timeline, then returns {@link #REPLIES_OPERATION} for that owner. Called from the top of
     * {@code com.twitter.api.legacy.request.urt.timelines.o.n0()} with the owner rest_id and the
     * original operation string; any unexpected input falls back to the original operation.
     */
    public static String operation(long ownerId, String mediaOperation) {
        try {
            return repliesFallbackOwners.contains(ownerId) ? REPLIES_OPERATION : mediaOperation;
        } catch (Throwable ignored) {
            return mediaOperation;
        }
    }

    /**
     * Handles a profile Media tab response. If the owner is already on the posts-and-replies
     * fallback, trims the response to their own posts with media. Otherwise, if the server's
     * {@code media_timeline_v2} came back with no posts (a withheld/sensitive media grid), records
     * the owner so the next load of their Media tab uses the posts-and-replies source.
     */
    public static void onProfileMediaResponse(Object response) {
        try {
            Object timelineKey = get(get(response, "c"), "b");
            if (((Number) get(timelineKey, "a")).intValue() != PROFILE_MEDIA_TIMELINE) return;

            long ownerId = ((Number) get(timelineKey, "c")).longValue();
            if (repliesFallbackOwners.contains(ownerId)) {
                filter(response, KEEP_OWN_MEDIA);
            } else if (!hasAnyPosts(response)) {
                repliesFallbackOwners.add(ownerId);
            }
        } catch (Throwable ignored) {
            // Unexpected shape: leave the response as the server sent it.
        }
    }

    /**
     * Drops replies whose media is an animated GIF. Only acts on owners served from the
     * posts-and-replies fallback — the server's media timeline carries no reply GIFs to remove.
     */
    public static void hideGifReplies(Object response) {
        try {
            Object timelineKey = get(get(response, "c"), "b");
            if (((Number) get(timelineKey, "a")).intValue() != PROFILE_MEDIA_TIMELINE) return;
            if (!repliesFallbackOwners.contains(((Number) get(timelineKey, "c")).longValue())) return;
        } catch (Throwable ignored) {
            return;
        }
        filter(response, HIDE_GIF_REPLIES);
    }

    /** True if any AddEntries/AddToModule instruction carries at least one tweet item. */
    private static boolean hasAnyPosts(Object response) throws Exception {
        List<?> instructions = (List<?>) get(get(response, "b"), "b");
        for (Object instruction : instructions) {
            String type = instruction.getClass().getName();
            if (ADD_ENTRIES.equals(type)) {
                for (Object entry : (List<?>) get(instruction, "a")) {
                    String entryType = entry.getClass().getName();
                    if (TWEET_ENTRY.equals(entryType)) return true;
                    if (MODULE_ENTRY.equals(entryType)) {
                        for (Object item : (List<?>) get(entry, "e")) {
                            if (TWEET_ENTRY.equals(item.getClass().getName())) return true;
                        }
                    }
                }
            } else if (ADD_TO_MODULE.equals(type)) {
                for (Object item : (List<?>) get(instruction, "c")) {
                    if (TWEET_ENTRY.equals(item.getClass().getName())) return true;
                }
            }
        }
        return false;
    }

    private static void filter(Object response, int mode) {
        try {
            Object timelineKey = get(get(response, "c"), "b");
            if (((Number) get(timelineKey, "a")).intValue() != PROFILE_MEDIA_TIMELINE) return;

            Context context = new Context(
                    mode,
                    ((Number) get(timelineKey, "c")).longValue(),
                    (Map<?, ?>) get(get(response, "a"), "a")
            );

            Object instructionHolder = get(response, "b");
            List<?> instructions = (List<?>) get(instructionHolder, "b");
            List<Object> keptInstructions = new ArrayList<>(instructions.size());
            boolean instructionsChanged = false;

            for (Object instruction : instructions) {
                String type = instruction.getClass().getName();
                if (ADD_ENTRIES.equals(type)) {
                    List<?> entries = (List<?>) get(instruction, "a");
                    List<Object> kept = filterEntries(entries, context);
                    if (kept != null) replaceList(instruction, "a", entries, kept);
                } else if (ADD_TO_MODULE.equals(type)) {
                    List<?> items = (List<?>) get(instruction, "c");
                    List<Object> kept = filterItems(items, context);
                    if (kept != null) replaceList(instruction, "c", items, kept);
                } else if (PIN_ENTRY.equals(type) && !keepEntrySafe(context, get(instruction, "a"))) {
                    instructionsChanged = true;
                    continue;
                }
                keptInstructions.add(instruction);
            }

            if (instructionsChanged) {
                replaceList(instructionHolder, "b", instructions, keptInstructions);
            }
        } catch (Throwable ignored) {
            // Unexpected shape: show the response as the server sent it.
        }
    }

    // Replace the contents of a list-typed field. The model's list fields are `final` (e.g.
    // instructions.n.a), and on current ART a reflective set of a final instance field can silently
    // no-op - leaving the original (unfiltered) list in place. So mutate the existing list object in
    // place (clear + addAll) when it is mutable; only if that is rejected fall back to set().
    private static void replaceList(Object owner, String field, List<?> current, List<Object> kept) {
        try {
            @SuppressWarnings("unchecked")
            List<Object> mutable = (List<Object>) current;
            mutable.clear();
            mutable.addAll(kept);
            return;
        } catch (Throwable inPlaceFailed) {
            // Immutable list - fall through to replacing the reference.
        }
        try {
            set(owner, field, kept);
        } catch (Throwable ignored) {
            // Could not write the filtered list - leave the response as the server sent it.
        }
    }

    // Per-entry fail-open: a single malformed entry must not abort the whole filter (which would
    // leak every repost). On any reflective error for one entry, keep that entry and move on.
    private static boolean keepEntrySafe(Context context, Object entry) {
        try {
            return context.keepEntry(entry);
        } catch (Throwable t) {
            return true;
        }
    }

    /** Returns the filtered entries, or null when nothing was removed. */
    private static List<Object> filterEntries(List<?> entries, Context context) {
        List<Object> kept = new ArrayList<>(entries.size());
        for (Object entry : entries) {
            if (keepEntrySafe(context, entry)) kept.add(entry);
        }
        return kept.size() == entries.size() ? null : kept;
    }

    /** Filters module items, keeping every non-post item (cursors, headers, footers). */
    private static List<Object> filterItems(List<?> items, Context context) {
        List<Object> kept = new ArrayList<>(items.size());
        for (Object item : items) {
            boolean keep;
            try {
                keep = !TWEET_ENTRY.equals(item.getClass().getName()) || context.keepPost(item);
            } catch (Throwable t) {
                keep = true;
            }
            if (keep) kept.add(item);
        }
        return kept.size() == items.size() ? null : kept;
    }

    private static final class Context {
        final int mode;
        final long ownerId;
        final Map<?, ?> tweets;

        Context(int mode, long ownerId, Map<?, ?> tweets) {
            this.mode = mode;
            this.ownerId = ownerId;
            this.tweets = tweets;
        }

        boolean keepEntry(Object entry) throws Exception {
            String type = entry.getClass().getName();
            if (TWEET_ENTRY.equals(type)) return keepPost(entry);
            if (!MODULE_ENTRY.equals(type)) return true;

            List<?> items = (List<?>) get(entry, "e");
            int posts = 0;
            for (Object item : items) {
                if (TWEET_ENTRY.equals(item.getClass().getName())) posts++;
            }
            List<Object> kept = filterItems(items, this);
            if (kept == null) return true;

            int keptPosts = posts - (items.size() - kept.size());
            // A conversation or grid module with none of its posts left would render as an
            // empty shell, so drop the whole module.
            if (posts > 0 && keptPosts == 0) return false;
            replaceList(entry, "e", items, kept);
            return true;
        }

        boolean keepPost(Object tweetEntry) throws Exception {
            Object tweetId = get(get(tweetEntry, "j"), "a");
            Object tweet = tweetId == null ? null : tweets.get(tweetId);
            if (tweet == null) return mode != KEEP_OWN_MEDIA;

            Object core = get(tweet, "f");
            List<?> media = media(core);

            if (mode == KEEP_OWN_MEDIA) {
                long authorId = ((Number) get(get(tweet, "b"), "a")).longValue();
                // Reposts carry the original author here, so they fall out with other people's posts.
                return authorId == ownerId && !media.isEmpty();
            }

            boolean isReply = ((Number) get(core, "o")).longValue() != 0;
            return !(isReply && hasGif(media));
        }
    }

    private static List<?> media(Object core) throws Exception {
        Object entities = get(get(core, "k"), "f");
        Object mediaList = entities == null ? null : get(entities, "g");
        Object list = mediaList == null ? null : get(mediaList, "a");
        return list instanceof List ? (List<?>) list : Collections.emptyList();
    }

    private static boolean hasGif(List<?> media) throws Exception {
        for (Object item : media) {
            Object type = get(item, "p");
            if (type instanceof Enum && "ANIMATED_GIF".equals(((Enum<?>) type).name())) return true;
        }
        return false;
    }

    private static Object get(Object target, String name) throws Exception {
        return field(target.getClass(), name).get(target);
    }

    private static void set(Object target, String name, Object value) throws Exception {
        field(target.getClass(), name).set(target, value);
    }

    private static Field field(Class<?> type, String name) throws NoSuchFieldException {
        for (Class<?> c = type; c != null; c = c.getSuperclass()) {
            try {
                Field field = c.getDeclaredField(name);
                field.setAccessible(true);
                return field;
            } catch (NoSuchFieldException ignored) {
            }
        }
        throw new NoSuchFieldException(type.getName() + "." + name);
    }
}
