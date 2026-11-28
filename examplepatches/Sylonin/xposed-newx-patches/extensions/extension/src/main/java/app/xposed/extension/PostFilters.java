package app.xposed.extension;

import android.util.Log;

/**
 * Applies the filters to X's post and quote composables, which are hidden or get the
 * highlight, and to person rows in people lists, which are only ever highlighted.
 */
final class PostFilters {
    private static Object lastHost;
    private static boolean lastHostIsList;
    private static volatile boolean listsBroken;

    private PostFilters() {
    }

    /**
     * Called when a post or quote card composes, with its author, its AvailablePost (null for
     * a quote card), its modifier (null when it uses the default), the composer, the row's
     * PaddingValues (null when it has none) and whether it is the post the user opened.
     * Returns the modifier for it, or {@link Hooks#HIDE} when it should not be shown. Quote
     * cards are never hidden here: Hide mode collapses them earlier ({@link Placeholders#quote}),
     * and a card that still composes was revealed or is outside timelines.
     */
    static Object onPost(Object user, Object post, Object modifier, Object composer, Object padding, boolean focal) {
        Object original = Highlights.original(modifier);
        String handle = FilterText.handle(ModelBridge.screenName(user));
        if (handle == null) return original;
        long userId = ModelBridge.userId(user);
        Users.put(userId, handle);
        Observed.user(handle, user);
        States.observe(handle);
        long postId = 0;
        if (post != null) {
            Observed.viewer(ModelBridge.viewerId(post));
            postId = ModelBridge.postId(post);
        }
        int reasons = Verdicts.forPost(user, handle, userId, Observed.language(postId), post == null);
        if (post != null && !focal && Placeholders.related(post, postId, handle, userId, original, padding, composer)) {
            return Hooks.HIDE;
        }
        switch (action(reasons, composer, focal)) {
            case HIDE:
                return post != null ? Hooks.HIDE : original;
            case HIGHLIGHT:
                return Highlights.apply(original);
            default:
                return original;
        }
    }

    /**
     * What to do with a post that matched these filters, where it is shown. An opened post
     * is only highlighted unless an account filter matched it, and curated Lists can keep
     * Highlight while other timelines hide, as in X-Posed.
     */
    static Filters.Action action(int reasons, Object composer, boolean focal) {
        Filters.Action action = Filters.action(reasons);
        if (action != Filters.Action.HIDE) return action;
        if (focal && !FilterMatcher.Reason.ACCOUNT.in(reasons)) return Filters.Action.HIGHLIGHT;
        if (Filters.rules().highlightInLists && inList(composer)) return Filters.Action.HIGHLIGHT;
        return action;
    }

    /** True when the composable being composed is in a curated List's timeline. Main thread. */
    private static boolean inList(Object composer) {
        if (listsBroken || composer == null) return false;
        try {
            Object host = ComposeBridge.timelineHost(composer);
            if (host != lastHost) {
                lastHostIsList = ModelBridge.isListTimeline(host);
                lastHost = host;
            }
            return lastHostIsList;
        } catch (Throwable t) {
            listsBroken = true;
            Log.e(Hooks.TAG, "Lists can't be told apart from other timelines", t);
            return false;
        }
    }

    /** Person rows match the account filters and are highlighted in either mode, as in X-Posed. */
    static Object onPersonRow(Object user, Object modifier) {
        Object original = Highlights.original(modifier);
        String handle = FilterText.handle(ModelBridge.screenName(user));
        if (handle == null) return original;
        long userId = ModelBridge.userId(user);
        Users.put(userId, handle);
        Observed.user(handle, user);
        States.observe(handle);
        int reasons = Verdicts.forPost(user, handle, userId, null, false);
        return reasons != 0 ? Highlights.apply(original) : original;
    }
}
