package app.xposed.extension;

import android.util.Log;

import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;

/**
 * X-Posed's collapsed posts. In Hide mode a quoted post by a filtered account, and with "Hide
 * replies and quotes of filtered posts" any reply or quote of a filtered post, becomes X's own
 * notice for posts it can't show. It names the filters and offers to show the post. The
 * notice keeps X's theme, fonts, right-to-left layout and TalkBack. Main thread.
 */
final class Placeholders {
    private static final String REVEAL_KEY = "\u0000reveal:";

    /** Posts the user chose to show, as "q" (quoted) or "r" (related) and the post id, until X closes. */
    private static final Set<String> revealed = Collections.newSetFromMap(lru(1000));
    /** Notice arguments per post, kind and reasons, so recompositions pass equal arguments and skip. */
    private static final Map<String, Notice> notices = lru(256);
    // Lambdas return null, not Unit.INSTANCE: R8 renamed that field in X ("a").
    private static final Function1<Object, Object> NO_LINKS = entity -> null;
    private static volatile boolean broken;

    private static final class Notice {
        final Object message, cta;
        /** The reveal state the notice was made for; a new one after eviction needs a new lambda. */
        final Object state;
        final Function0<Object> reveal;

        Notice(Object message, Object cta, Object state, Function0<Object> reveal) {
            this.message = message;
            this.cta = cta;
            this.state = state;
            this.reveal = reveal;
        }
    }

    private Placeholders() {
    }

    private static <K, V> Map<K, V> lru(int limit) {
        return Collections.synchronizedMap(new LinkedHashMap<K, V>(64, 0.75f, true) {
            @Override
            protected boolean removeEldestEntry(Map.Entry<K, V> eldest) {
                return size() > limit;
            }
        });
    }

    /**
     * Called at the start of X's quote item with the quoted post's author, the quoted
     * AvailablePost, the item's modifier and the composer. Returns true when it drew the
     * notice instead, so X's quote card must not be drawn.
     */
    static boolean quote(Object user, Object post, Object modifier, Object composer) {
        if (broken) return false;
        Notice notice;
        Object fill;
        try {
            String handle = FilterText.handle(ModelBridge.screenName(user));
            if (handle == null) return false;
            long userId = ModelBridge.userId(user);
            Users.put(userId, handle);
            Observed.viewer(ModelBridge.viewerId(post));
            States.observe(handle);
            int reasons = Verdicts.forPost(user, handle, userId, null, true);
            if (PostFilters.action(reasons, composer, false) != Filters.Action.HIDE) return false;
            notice = notice("q", ModelBridge.postId(post), reasons, "Quoted post hidden\n", "Show quoted post");
            if (notice == null) return false;
            fill = ComposeBridge.fillMaxWidth(modifier);
        } catch (Throwable t) {
            broken = true;
            Log.e(Hooks.TAG, "Collapsed quotes are unavailable", t);
            return false;
        }
        // Not caught: a failure inside a composable leaves the composition unusable anyway.
        ComposeBridge.notice(notice.message, notice.cta, NO_LINKS, fill, notice.reveal, composer);
        return true;
    }

    /**
     * With "Hide replies and quotes of filtered posts" on, draws the notice in place of a
     * timeline post that quotes or replies to a post whose author matches a filter, directly
     * or through a chain of replies and quotes. True when it did, so the post must not be
     * drawn. Its own author's verdict must be known ({@link Verdicts#forPost}) before.
     */
    static boolean related(Object post, long postId, String handle, long userId, Object modifier, Object padding,
                           Object composer) {
        if (broken || postId == 0 || !Filters.rules().hideRelatedPosts) return false;
        Notice notice;
        Object fill;
        try {
            if (Verdicts.isExempt(handle, userId)) return false;
            PostRelations.Source source = relatedSource(post, postId);
            if (source == null) return false;
            String relation = source.quote ? "Quotes a filtered post" : "Replies to a filtered post";
            notice = notice("r", postId, source.reasons, "Post hidden\n" + relation + " \u00B7 ", "Show post");
            if (notice == null) return false;
            fill = ComposeBridge.fillMaxWidth(modifier);
            if (padding != null) fill = ComposeBridge.padding(fill, padding);
        } catch (Throwable t) {
            broken = true;
            Log.e(Hooks.TAG, "Hiding related posts is unavailable", t);
            return false;
        }
        ComposeBridge.notice(notice.message, notice.cta, NO_LINKS, fill, notice.reveal, composer);
        return true;
    }

    /** The quoted post's author when it is shown in this post, else the walk over known relations. */
    private static PostRelations.Source relatedSource(Object post, long postId) {
        Object quoted = ModelBridge.quotedPost(post);
        if (quoted != null) {
            Object author = ModelBridge.postAuthor(quoted);
            String handle = author != null ? FilterText.handle(ModelBridge.screenName(author)) : null;
            if (handle != null) {
                int reasons = Verdicts.forPost(author, handle, ModelBridge.userId(author), null, true);
                if (reasons != 0) return new PostRelations.Source(true, reasons);
            }
        }
        return Observed.RELATIONS.find(postId, p -> Verdicts.forKnownPost(p.author, p.authorId, p.language));
    }

    /**
     * The notice for a post of a kind, reused while the post, its reasons and its reveal state
     * stay the same. Null when the post was revealed or can't be remembered as revealed.
     */
    private static Notice notice(String kind, long postId, int reasons, String prefix, String action) {
        if (postId == 0) return null;
        String id = kind + postId;
        Object state = States.observe(REVEAL_KEY + id);
        if (state == null || revealed.contains(id)) return null;
        String key = id + ":" + reasons;
        Notice n = notices.get(key);
        if (n == null || n.state != state) {
            Function0<Object> reveal = () -> {
                revealed.add(id);
                States.changedState(state);
                return null;
            };
            n = new Notice(ComposeBridge.richText(prefix + FilterMatcher.Reason.summary(reasons)),
                    ComposeBridge.richText(action), state, reveal);
            notices.put(key, n);
        }
        return n;
    }
}
