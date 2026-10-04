/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.feed;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import app.hushgram.extension.instagram.settings.FamilyNames;
import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.Logger;
import app.hushgram.extension.shared.Utils;
import app.hushgram.extension.shared.diagnostics.FeedFilterCounters;
import app.hushgram.extension.shared.diagnostics.HookStatus;
import app.hushgram.extension.shared.settings.BooleanSetting;

/**
 * Helper for the "Hide suggested posts" patch.
 *
 * <p>The patch passes every item Instagram's home feed parse helper reads through {@link #filter},
 * beside Hide Reels in the feed's filter when both are in. Suggestions are items of their own kinds: a row
 * of accounts to follow is one of the {@link #ACCOUNT_UNITS}, and a single post or reel from an
 * account you don't follow, labeled "Suggested for you" or "Suggested Reel", is an
 * {@link #SUGGESTED_POST}, which carries its post inside it. A post from an account you follow is a
 * MEDIA item and stays. Threads' units ({@link #THREADS_UNITS}) bring in posts, communities and
 * accounts from Threads. Each comes back as null while its switch is on, and every caller of that
 * helper skips a null item, the home feed's page loads and its cache of recommended posts alike.
 *
 * <p>Explore's grid doesn't go through that helper (S22, Instagram 449), so it keeps its posts.
 */
public final class FeedSuggestions {
    /**
     * The feed item kinds of suggested accounts, shops, hashtags and lists, by the constant names
     * Instagram 449 gives them.
     */
    static final Set<String> ACCOUNT_UNITS = Collections.unmodifiableSet(new HashSet<>(Arrays.asList(
            "SUGGESTED_USERS", "SUGGESTED_TOP_ACCOUNTS", "SUGGESTED_PRODUCERS", "SUGGESTED_PRODUCERS_V2",
            "SUGGESTED_CLOSE_FRIENDS", "SUGGESTED_BUSINESSES", "SUGGESTED_SHOPS", "SUGGESTED_HASHTAGS",
            "SUGGESTED_SHAREABLE_LISTS", "FOLLOW_CHAIN_USERS", "TYA_SUGGESTIONS_IN_FEED_UNIT")));

    /** The kind of a single suggested post or reel ("explore_story" in the feed's JSON). */
    static final String SUGGESTED_POST = "EXPLORE_STORY";

    /**
     * Threads' units: its posts ("threads_in_feed_unit", and the one at the end of the feed), and
     * the ones its JSON names text_app_ (accounts to follow on Threads, communities, live chats and
     * game threads).
     */
    static final Set<String> THREADS_UNITS = Collections.unmodifiableSet(new HashSet<>(Arrays.asList(
            "THREADS_IN_FEED_UNIT", "TIFU_IN_EXPLORE", "EOF_TIFU", "KICKSTART_FEED_UNIT",
            "COMMUNITIES_IN_FEED_UNIT", "SMSL_IN_FEED_UNIT", "LIVE_CHAT_IN_FEED_UNIT", "SPORT_GAME_IN_FEED_UNIT")));

    /** Every kind this patch reads. */
    static final Set<String> KINDS;

    static {
        Set<String> kinds = new HashSet<>(ACCOUNT_UNITS);
        kinds.add(SUGGESTED_POST);
        kinds.addAll(THREADS_UNITS);
        KINDS = Collections.unmodifiableSet(kinds);
    }

    /** The diagnostic counter route: the suggestions seen, and the ones taken out. */
    static final String ROUTE = "Feed suggestions";

    /** Set once {@link #filter} has taken an item out of the home feed in this run. Tests clear it. */
    static volatile boolean tookOut;

    private FeedSuggestions() {
    }

    /**
     * Injected at each read of the home feed adapter's "no next page" flag. Answers 1 (no next
     * page) once {@link #filter} has taken items out and a suggestion switch is still on, and
     * [noMorePages] otherwise. Turning every switch off restores Instagram's answer in this run.
     *
     * <p>Instagram reads that flag only beside its own checks that the feed is empty and no page is
     * loading. With both true and a next page left it draws its loading placeholder, and nothing asks
     * for that page while the feed is empty, so a Home emptied of suggestions kept the placeholder for
     * good. Saying there's no next page gets Instagram's own empty feed card instead. A feed with posts
     * left, or one waiting on a page, draws what it did.
     */
    public static int feedEnded(int noMorePages) {
        if (noMorePages != 0 || !tookOut) return noMorePages;
        try {
            if (!Utils.settingsReady()) return noMorePages;
            return Settings.HIDE_SUGGESTED_POSTS.get() || Settings.HIDE_SUGGESTED_ACCOUNTS.get()
                    || Settings.HIDE_THREADS_POSTS.get() ? 1 : noMorePages;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.FEED_SUGGESTIONS, "empty feed", failure);
            return noMorePages;
        }
    }

    /**
     * Injected where the home feed's load more row asks whether its feed's pages come from
     * Following. Only then does Instagram hide the row under an end of feed card with no posts
     * above it, once there's no next page. Past that card the pages are suggested posts, paged from
     * another source, so the rule stopped applying just when it was needed. Answers 1 once
     * {@link #filter} has taken items out and Hide suggested posts is on, and [following] otherwise.
     * The rule still needs the card in the feed and no post in it, so a feed with posts keeps its
     * row. Never throws.
     */
    public static int endCardRule(int following) {
        if (following != 0 || !suggestionsGone()) return following;
        Logger.printDebug(() -> "Feed suggestions: load more row checked as Following's");
        return 1;
    }

    /**
     * Injected where that rule asks whether there's a next page. Answers 0 (no next page) once
     * {@link #filter} has taken items out and Hide suggested posts is on, and [hasMore] otherwise.
     *
     * <p>Everything past the end card is a suggested post, which {@link #filter} takes out, so the
     * pages come in empty while a next page is still promised, and the row kept its spinner under
     * the card for good. With no next page the row goes. Never throws.
     */
    public static int moreAfterFollowing(int hasMore) {
        if (hasMore == 0 || !suggestionsGone()) return hasMore;
        Logger.printDebug(() -> "Feed suggestions: no next page past the end card");
        return 0;
    }

    /** Whether {@link #filter} has taken items out and Hide suggested posts is on. */
    private static boolean suggestionsGone() {
        if (!tookOut) return false;
        try {
            return Utils.settingsReady() && Settings.HIDE_SUGGESTED_POSTS.get();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.FEED_SUGGESTIONS, "end card", failure);
            return false;
        }
    }

    /**
     * Injected at the return of Instagram's feed item parse helper. Answers null for a unit of
     * suggested accounts, a suggested post or a Threads unit while its switch is on, and [item]
     * itself otherwise, or when anything goes wrong. Never throws.
     */
    public static Object filter(Object item) {
        if (item == null) return null;
        try {
            HookStatus.invoked(FamilyNames.FEED_SUGGESTIONS);
            String kind = FeedItemKinds.kindIn(item, KINDS, FamilyNames.FEED_SUGGESTIONS);
            if (kind == null) return item;
            FeedFilterCounters.sawKind(ROUTE, kind);
            BooleanSetting setting = switchFor(kind);
            if (!Utils.settingsReady() || !setting.get()) return item;
            FeedFilterCounters.removed(ROUTE, 1, kind);
            tookOut = true;
            Logger.printDebug(() -> "Feed suggestions: took out a " + kind + " item");
            return null;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.FEED_SUGGESTIONS, "feed item", failure);
            return item;
        }
    }

    private static BooleanSetting switchFor(String kind) {
        if (SUGGESTED_POST.equals(kind)) return Settings.HIDE_SUGGESTED_POSTS;
        if (THREADS_UNITS.contains(kind)) return Settings.HIDE_THREADS_POSTS;
        return Settings.HIDE_SUGGESTED_ACCOUNTS;
    }
}
