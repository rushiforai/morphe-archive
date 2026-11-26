package app.bin0culars.extension.reddit;

import app.bin0culars.extension.reddit.settings.BinocularsMods;
import java.util.Iterator;
import java.util.List;

public final class SameSubredditMediaPatch {

    private static final String KEY = "fullscreen_same_subreddit";
    private static volatile String activeSubredditId;

    private SameSubredditMediaPatch() {}

    public static boolean shouldRelabel(Object mediaContext) {
        if (mediaContext == null) {
            return false;
        }
        if (!BinocularsMods.isEnabled(KEY)) {
            activeSubredditId = null;
            return false;
        }
        List<?> seeds = seedsOf(mediaContext);
        Object type = listingTypeOf(mediaContext);
        String name = type instanceof Enum ? ((Enum<?>) type).name() : null;
        if (seeds != null && seeds.size() == 1 && name != null && !isProfileFeed(name)) {
            activeSubredditId = String.valueOf(seeds.get(0));
            return !"SUBREDDIT".equals(name);
        }
        activeSubredditId = null;
        return false;
    }

    private static boolean isProfileFeed(String name) {
        return "USER_SUBMITTED".equals(name) || "SUBMITTED_POSTS".equals(name);
    }

    public static void filterResults(Object listing) {
        String id = activeSubredditId;
        if (id == null || listing == null || !BinocularsMods.isEnabled(KEY)) {
            return;
        }
        List<?> children = childrenOf(listing);
        if (children == null || children.isEmpty()) {
            return;
        }
        try {
            Iterator<?> iterator = children.iterator();
            while (iterator.hasNext()) {
                Object child = iterator.next();
                if (!id.equals(subredditIdOf(child))) {
                    iterator.remove();
                }
            }
        } catch (UnsupportedOperationException ignored) {
        }
    }

    public static String endIfNoneMatch(List<?> posts, String after) {
        String id = activeSubredditId;
        if (id == null || after == null || posts == null || posts.isEmpty() || !BinocularsMods.isEnabled(KEY)) {
            return after;
        }
        for (Object child : posts) {
            if (child == null) {
                continue;
            }
            try {
                if (id.equals(subredditIdOf(child))) {
                    return after;
                }
            } catch (RuntimeException ignored) {
            }
        }
        return null;
    }

    private static List<?> seedsOf(Object mediaContext) {
        // Modified during patching.
        return null;
    }

    private static Object listingTypeOf(Object mediaContext) {
        // Modified during patching.
        return null;
    }

    private static List<?> childrenOf(Object listing) {
        // Modified during patching.
        return null;
    }

    private static String subredditIdOf(Object link) {
        // Modified during patching.
        return null;
    }
}
