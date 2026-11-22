package app.drbushytop.extension.relay;

import android.util.Log;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Random;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import reddit.news.oauth.reddit.RedditApi;
import reddit.news.oauth.reddit.model.RedditListing;
import reddit.news.oauth.reddit.model.RedditResponse;
import reddit.news.oauth.reddit.model.RedditSubreddit;
import rx.Observable;
import rx.schedulers.Schedulers;

/**
 * Brings back Relay's "Random Subreddit" and "RandomNSFW Subreddit" menu items.
 *
 * <p>Relay opens them as the subreddits {@code random} and {@code randNSFW} and lets Reddit pick,
 * but Reddit removed both, so the request now fails with 404. The feed's request goes through
 * {@link #getListing} instead: for those two it asks for a real subreddit picked here. Relay then
 * does what it always did with Reddit's pick: it switches the title bar and sidebar to the
 * subreddit of the first post, loads further pages from it, and picks again on refresh.
 *
 * <ul>
 *   <li>Random picks from Reddit's popular subreddits list (about 1,000 of the most active ones,
 *       none NSFW). The first 100 are fetched before the first pick and the rest in the
 *       background; the list is kept until Relay is closed.</li>
 *   <li>RandomNSFW picks from {@link RandomNsfwSubreddits}, a list bundled with the patch, because
 *       Reddit's popular list leaves NSFW subreddits out.</li>
 * </ul>
 *
 * A pick that turns out to be banned, private or gone is skipped, and another one is tried.
 */
@SuppressWarnings({"unused", "rawtypes", "unchecked"})
public final class RandomSubreddit {
    private static final String TAG = "RelayRandom";

    private static void debug(String message) {
        if (Log.isLoggable(TAG, Log.DEBUG)) Log.d(TAG, message);
    }

    /** Relay's feed path for the two items: r/random or r/randNSFW, then the sort, if any. */
    private static final Pattern RANDOM_PATH =
            Pattern.compile("/?r/(random|randnsfw)(/.*)?", Pattern.CASE_INSENSITIVE);

    /** Picks tried before giving up and letting Relay show its error. */
    private static final int MAX_TRIES = 5;

    /** Pages of the popular list (100 each) fetched; the first before the first pick. */
    private static final int MAX_POPULAR_PAGES = 10;

    /** How many recent picks are not picked again. */
    private static final int RECENT = 30;

    private static final Random random = new Random();

    // Guarded by the class lock: picks and page loads run on Relay's network threads.
    private static final LinkedHashSet<String> popular = new LinkedHashSet<>();
    private static String popularAfter;
    private static int popularPages;
    private static boolean popularDone;
    private static boolean popularLoading;

    private static List<String> nsfw;

    private static final Set<String> unavailable = new HashSet<>();
    private static final ArrayDeque<String> recent = new ArrayDeque<>();
    private static String lastSfw;
    private static String lastNsfw;

    private RandomSubreddit() {
    }

    /** A request's error, passed on as a value. */
    private static final class Failed {
        final Object error;

        Failed(Object error) {
            this.error = error;
        }
    }

    /**
     * Stands in for {@code RedditApi#getListing(path, query)} in Relay's subreddit feed.
     */
    public static Observable getListing(RedditApi api, String path, Map query) {
        Matcher matcher = path == null ? null : RANDOM_PATH.matcher(path);
        if (matcher == null || !matcher.matches()) {
            return api.getListing(path, query);
        }
        boolean isNsfw = matcher.group(1).equalsIgnoreCase("randnsfw");
        String sortPath = matcher.group(2) == null ? "" : matcher.group(2);

        // A further page, asked for before Relay switched to the picked subreddit: keep to it.
        Object after = query == null ? null : query.get("after");
        String last;
        synchronized (RandomSubreddit.class) {
            last = isNsfw ? lastNsfw : lastSfw;
        }
        if (after != null && !after.toString().isEmpty() && last != null) {
            return api.getListing("r/" + last + sortPath, query);
        }

        if (isNsfw) {
            return loadPick(api, path, sortPath, query, true, MAX_TRIES);
        }
        boolean havePopular;
        synchronized (RandomSubreddit.class) {
            havePopular = !popular.isEmpty() || popularLoading;
        }
        // The first page takes a second or two, so only it is waited for. The rest is fetched in
        // the background for later picks.
        Observable ready = havePopular ? Observable.w(null) : loadPopularPages(api, 1);
        return ready.s(ignored -> {
            loadRestOfPopular(api);
            return loadPick(api, path, sortPath, query, false, MAX_TRIES);
        });
    }

    /** Loads the feed of a fresh pick, trying another one when that subreddit can't be read. */
    private static Observable loadPick(RedditApi api, String originalPath, String sortPath,
                                       Map query, boolean isNsfw, int triesLeft) {
        String pick = pick(isNsfw);
        if (pick == null) {
            Log.w(TAG, "Nothing to pick from (NSFW: " + isNsfw + ")");
            return api.getListing(originalPath, query);
        }
        debug("Picked r/" + pick);
        Observable feed = api.getListing("r/" + pick + sortPath, query);
        if (triesLeft <= 1) {
            return feed;
        }
        // Relay's RxJava keeps onErrorReturn but not onErrorResumeNext: turn the error into a
        // value, then swap it for another pick.
        return feed.J(Failed::new).s(response -> {
            if (!(response instanceof Failed)) return Observable.w(response);
            debug("r/" + pick + " can't be read, picking again: " + ((Failed) response).error);
            synchronized (RandomSubreddit.class) {
                unavailable.add(pick.toLowerCase(Locale.ROOT));
            }
            return loadPick(api, originalPath, sortPath, query, isNsfw, triesLeft - 1);
        });
    }

    private static synchronized String pick(boolean isNsfw) {
        List<String> pool = new ArrayList<>();
        for (String name : isNsfw ? nsfwNames() : popular) {
            String key = name.toLowerCase(Locale.ROOT);
            if (!unavailable.contains(key) && !recent.contains(key)) pool.add(name);
        }
        if (pool.isEmpty()) {
            // Everything was picked lately: allow repeats rather than fail.
            recent.clear();
            for (String name : isNsfw ? nsfwNames() : popular) {
                if (!unavailable.contains(name.toLowerCase(Locale.ROOT))) pool.add(name);
            }
            if (pool.isEmpty()) return null;
        }
        String pick = pool.get(random.nextInt(pool.size()));
        recent.addLast(pick.toLowerCase(Locale.ROOT));
        while (recent.size() > RECENT) recent.removeFirst();
        if (isNsfw) lastNsfw = pick;
        else lastSfw = pick;
        return pick;
    }

    private static synchronized List<String> nsfwNames() {
        if (nsfw == null) {
            List<String> names = new ArrayList<>();
            Collections.addAll(names, RandomNsfwSubreddits.NAMES.split(","));
            nsfw = names;
        }
        return nsfw;
    }

    private static void loadRestOfPopular(RedditApi api) {
        synchronized (RandomSubreddit.class) {
            if (popularLoading || popularPages == 0 || popularDone || popularPages >= MAX_POPULAR_PAGES) {
                return;
            }
            popularLoading = true;
        }
        loadPopularPages(api, MAX_POPULAR_PAGES)
                .U(Schedulers.d())
                .T(done -> loadingFinished(), error -> loadingFinished());
    }

    private static synchronized void loadingFinished() {
        popularLoading = false;
    }

    /**
     * Fetches up to {@code pages} more pages of Reddit's popular subreddits. A failed page ends
     * it early: whatever is already known is picked from.
     */
    private static Observable loadPopularPages(RedditApi api, int pages) {
        Map<String, String> params = new HashMap<>();
        synchronized (RandomSubreddit.class) {
            if (pages <= 0 || popularDone || popularPages >= MAX_POPULAR_PAGES) {
                return Observable.w(null);
            }
            params.put("limit", "100");
            if (popularAfter != null) params.put("after", popularAfter);
        }
        return api.getListing("subreddits/popular", params)
                .J(Failed::new)
                .s(response -> {
                    if (response instanceof Failed) {
                        Log.w(TAG, "Couldn't load popular subreddits: " + ((Failed) response).error);
                        return Observable.w(null);
                    }
                    addPopularPage(response);
                    return loadPopularPages(api, pages - 1);
                });
    }

    private static synchronized void addPopularPage(Object response) {
        Object data = ((RedditResponse) response).data;
        if (!(data instanceof RedditListing)) {
            popularDone = true;
            return;
        }
        RedditListing listing = (RedditListing) data;
        for (Object child : listing.children) {
            if (!(child instanceof RedditSubreddit)) continue;
            RedditSubreddit subreddit = (RedditSubreddit) child;
            if (subreddit.over18 || subreddit.quarantine || subreddit.displayName == null) continue;
            popular.add(subreddit.displayName);
        }
        popularPages++;
        popularAfter = listing.getAfter();
        if (popularAfter == null || popularAfter.isEmpty()) popularDone = true;
        debug("Popular subreddits known: " + popular.size());
    }
}
