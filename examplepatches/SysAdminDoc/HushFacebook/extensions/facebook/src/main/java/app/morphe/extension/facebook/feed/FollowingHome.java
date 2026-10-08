/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.feed;

import androidx.annotation.Nullable;

import app.morphe.extension.facebook.navigation.FeedsSubtabRoute;
import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * Following feed on Home: Home asks Facebook for its Following feed instead of the ranked one.
 *
 * <p>Facebook builds every news feed request's parameters in one place, which is handed the feed
 * type the request is for and turns it into the query's feed style. Home's own feed type keeps the
 * name {@value #HOME}, and the Following feed's keeps {@value #FOLLOWING}, both public constants of
 * Facebook's FeedType. The patch hands the feed type to {@link #feedType} first thing, and keeps
 * what it answers in its place. While the switch is on, Home's answers the Following feed's, so the
 * request goes out as Facebook's own Following feed request does. Every other feed type, the Feeds
 * tab's filters among them, is handed back as it came.
 *
 * <p>Off, paused, before the settings are ready, or when anything here fails, the feed type is
 * handed back as it came and Home loads the ranked feed.
 */
public final class FollowingHome {
    /** The name Home's ranked feed type keeps. */
    static final String HOME = "top_stories";

    /** The name the Following feed's type keeps. */
    static final String FOLLOWING = "following_feed";

    /** Facebook's feed type class, the owner the report names when the Following feed isn't in it. */
    static final String FEED_TYPE_CLASS = "com.facebook.api.feedtype.FeedType";

    /** Counted each time Home's request goes out for the Following feed. */
    static final String SWAPPED = "Home asked for the Following feed";

    /** The member the report names once a request for Home's feed has come through. */
    static final String REQUEST = "Home feed request";

    private static final String FAMILY = FamilyNames.FOLLOWING_HOME;

    /** The Following feed's type, once found. */
    @Nullable
    private static volatile Object following;

    private static volatile boolean logged;

    private FollowingHome() {
    }

    /**
     * The hook, first thing in the news feed parameter builder, handed the feed type the request is
     * for. Answers the Following feed's type in place of Home's while the switch is on, and
     * [requested] otherwise.
     */
    @Nullable
    public static Object feedType(@Nullable Object requested) {
        try {
            HookStatus.invoked(FAMILY);
            if (requested == null || !HOME.equals(requested.toString())) return requested;
            HookStatus.bound(FAMILY, REQUEST);
            if (!Utils.settingsReady() || !Settings.FOLLOWING_FEED_HOME.get()) return requested;
            Object chosen = followingLike(requested);
            if (chosen == null) {
                HookStatus.missingMember(FAMILY, "feed type", FEED_TYPE_CLASS, FOLLOWING);
                return requested;
            }
            HookStatus.counted(FAMILY, SWAPPED);
            if (!logged) {
                logged = true;
                Logger.printDebug(() -> "Following feed on Home: Home asked for the Following feed");
            }
            return chosen;
        } catch (Throwable failure) {
            HookStatus.threw(FAMILY, "home feed request", failure);
            return requested;
        }
    }

    /** The Following feed's type among the constants of [requested]'s class, or null. */
    @Nullable
    private static Object followingLike(Object requested) {
        Object found = following;
        if (found != null && found.getClass() == requested.getClass()) return found;
        found = FeedsSubtabRoute.feedTypeNamed(requested.getClass(), FOLLOWING);
        if (found != null) following = found;
        return found;
    }
}
