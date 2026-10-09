/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.feed;

import androidx.annotation.Nullable;

import java.util.regex.Pattern;

import app.morphe.extension.facebook.navigation.FeedsSubtabRoute;
import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * Following feed on Home: Home asks Facebook for the newest posts from the friends, groups and
 * Pages you follow, the feed the Feeds tab's All shows, instead of the ranked one.
 *
 * <p>Facebook builds every news feed request's parameters in one place, which is handed the feed
 * type the request is for and turns it into the query's feed style. Home's own feed type keeps the
 * name {@value #HOME}, and the most recent feed's keeps {@value #MOST_RECENT}, both public constants
 * of Facebook's FeedType; the builder gives the second the MOST_RECENT_FEED_DEFAULT style, as it
 * does the Feeds tab's All. The patch hands the feed type to {@link #feedType} first thing, and
 * keeps what it answers in its place. While the switch is on, Home's answers the most recent
 * feed's. Every other feed type, the Feeds tab's filters among them, is handed back as it came.
 *
 * <p>It used to answer the Following feed's type ("following_feed", the FOLLOWING_FEED style).
 * On the S22 test account (581, 2026-10-08) that request came back as the ranked feed, suggestions
 * and all, while the Feeds tab's All showed only followed posts, so Facebook's servers no longer
 * honour that style for every account.
 *
 * <p>Off, paused, before the settings are ready, or when anything here fails, the feed type is
 * handed back as it came and Home loads the ranked feed.
 */
public final class FollowingHome {
    /** The name Home's ranked feed type keeps. */
    static final String HOME = "top_stories";

    /** The name the most recent feed's type keeps. */
    static final String MOST_RECENT = "most_recent";

    /** Facebook's feed type class, the owner the report names when the most recent feed isn't in it. */
    static final String FEED_TYPE_CLASS = "com.facebook.api.feedtype.FeedType";

    /** Counted each time Home's request goes out for the most recent feed. */
    static final String SWAPPED = "Home asked for the most recent feed";

    /** The member the report names once a request for Home's feed has come through. */
    static final String REQUEST = "Home feed request";

    /**
     * Counted, followed by the feed type's name, for each request for another feed while the switch
     * is on. On the S25 (581, 2026-10-08) a cold start's Home matched the Feeds tab's All, while a
     * pull to refresh showed ranked posts again, so the report says which feed types go out.
     */
    static final String LEFT_ALONE = "Request left as ";

    /** A feed type's name as Facebook writes its built-in ones. Anything else is counted unnamed. */
    private static final Pattern FEED_TYPE_NAME = Pattern.compile("[a-z0-9_]{1,40}");

    private static final String FAMILY = FamilyNames.FOLLOWING_HOME;

    /** The most recent feed's type, once found. */
    @Nullable
    private static volatile Object mostRecent;

    private static volatile boolean logged;

    private FollowingHome() {
    }

    /**
     * The hook, first thing in the news feed parameter builder, handed the feed type the request is
     * for. Answers the most recent feed's type in place of Home's while the switch is on, and
     * [requested] otherwise.
     */
    @Nullable
    public static Object feedType(@Nullable Object requested) {
        try {
            HookStatus.invoked(FAMILY);
            if (requested == null) return null;
            String name = requested.toString();
            if (!HOME.equals(name)) {
                countLeftAlone(name);
                return requested;
            }
            HookStatus.bound(FAMILY, REQUEST);
            if (!Utils.settingsReady() || !Settings.FOLLOWING_FEED_HOME.get()) return requested;
            Object chosen = mostRecentLike(requested);
            if (chosen == null) {
                HookStatus.missingMember(FAMILY, "feed type", FEED_TYPE_CLASS, MOST_RECENT);
                return requested;
            }
            HookStatus.counted(FAMILY, SWAPPED);
            if (!logged) {
                logged = true;
                Logger.printDebug(() -> "Following feed on Home: Home asked for the most recent feed");
            }
            return chosen;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "home feed request", failure);
            return requested;
        }
    }

    /** Counts a request for another feed while the switch is on, under its type's name when it reads like one. */
    private static void countLeftAlone(@Nullable String name) {
        if (!Utils.settingsReady() || !Settings.FOLLOWING_FEED_HOME.get()) return;
        HookStatus.counted(FAMILY, LEFT_ALONE
                + (name != null && FEED_TYPE_NAME.matcher(name).matches() ? name : "another type"));
    }

    /** The most recent feed's type among the constants of [requested]'s class, or null. */
    @Nullable
    private static Object mostRecentLike(Object requested) {
        Object found = mostRecent;
        if (found != null && found.getClass() == requested.getClass()) return found;
        found = FeedsSubtabRoute.feedTypeNamed(requested.getClass(), MOST_RECENT);
        if (found != null) mostRecent = found;
        return found;
    }
}
