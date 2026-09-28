/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.ads;

import androidx.annotation.Nullable;

import app.morphe.extension.facebook.feed.FeedFilter;
import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.FeedFilterCounters;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * What the Hide sponsored profile posts patch asks before Facebook draws a post on a profile's
 * timeline.
 *
 * <p>Every post on a profile or Page timeline is drawn by one component, and for a story its render
 * method asks the story for its {@code sponsored_data} model, which a story only carries when it's
 * delivered as an ad. Facebook tags that row as a sponsored timeline story. The patch runs
 * {@link #hide} first in that render method with the unit the row draws, and answers no component
 * for a story with sponsored data while the switch is on. The render method already answers none
 * for a row it won't draw, and that leaves no row behind.
 *
 * <p>The story's accessor for the model is a Redex name that changes every build, so the patch
 * fills in {@link #sponsoredData}. A unit that isn't a story never reaches it.
 *
 * <p>It fails open: switch off, a pause, settings that aren't ready, a unit it can't read, or any
 * failure in here, and Facebook draws the row.
 */
public final class ProfileAdFilter {
    /** The diagnostic counter route: each timeline row drawn, by kind, and the ads left out. */
    static final String ROUTE = "Profile posts";

    /** The kinds a row counts under. A unit that isn't a story counts under its GraphQL type. */
    static final String SPONSORED = "sponsored story";
    static final String ORGANIC = "story";
    static final String OTHER_UNIT = "other unit";
    static final String NOT_PATCHED = "accessor not patched";
    static final String READ_FAILED = "read failed";

    /** What a hidden row is counted under: the field that marks it an ad. */
    static final String REASON = "sponsored_data";

    /** The kept name of the story model the rule reads. */
    static final String STORY_CLASS = "com.facebook.graphql.model.GraphQLStory";

    /** What {@link #sponsoredData} answers until the patch fills it in. */
    static final Object UNPATCHED = new Object();

    /** A story's sponsored data, read through the stub the patch filled in or a test's stand-in. */
    interface Reader {
        @Nullable
        Object sponsoredData(Object story);
    }

    static final Reader PATCHED = ProfileAdFilter::sponsoredData;

    private ProfileAdFilter() {
    }

    /**
     * Injection point, first thing in the timeline story component's render method. True answers
     * no component, so the row isn't drawn. Never throws.
     *
     * @param unit the timeline unit the row draws.
     */
    public static boolean hide(Object unit) {
        return hide(unit, PATCHED);
    }

    /** {@link #hide(Object)} with the story read passed in, so a test can stand in for the stub. */
    static boolean hide(Object unit, Reader reader) {
        try {
            HookStatus.invoked(FamilyNames.SPONSORED_PROFILE_POSTS);
            FeedFilterCounters.sawList(ROUTE, 1);
            String kind = kind(unit, reader);
            FeedFilterCounters.sawKind(ROUTE, kind);
            // What the row is, as a kind or a GraphQL type name, never what it shows.
            Logger.printDebug(() -> "Profile timeline row: " + kind);
            if (!SPONSORED.equals(kind)) return false;
            if (!Utils.settingsReady() || !Settings.HIDE_SPONSORED_PROFILE_POSTS.get()) return false;
            FeedFilterCounters.removed(ROUTE, 1, REASON);
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SPONSORED_PROFILE_POSTS, "timeline row", failure);
            Logger.printException(() -> "Profile ads: could not judge a timeline row", failure);
            return false;
        }
    }

    /**
     * Injection point, filled in by the patch: the story's {@code sponsored_data} model, or null
     * when it has none. The patch replaces this body with a call to the story's accessor. Only a
     * GraphQLStory may be passed.
     */
    public static Object sponsoredData(Object story) {
        return UNPATCHED;
    }

    /** What the row draws: a sponsored story, a story, or another unit by its type. Never throws. */
    static String kind(Object unit, Reader reader) {
        if (!isStory(unit)) {
            String type = FeedFilter.typeName(unit);
            return type == null ? OTHER_UNIT : type;
        }
        Object data;
        try {
            data = reader.sponsoredData(unit);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SPONSORED_PROFILE_POSTS, "sponsored data accessor", failure);
            return READ_FAILED;
        }
        if (data == UNPATCHED) {
            HookStatus.missingMember(FamilyNames.SPONSORED_PROFILE_POSTS, "method", "GraphQLStory", REASON);
            return NOT_PATCHED;
        }
        HookStatus.bound(FamilyNames.SPONSORED_PROFILE_POSTS, "GraphQLStory#" + REASON);
        return data == null ? ORGANIC : SPONSORED;
    }

    /** Whether [unit] is Facebook's story model or extends it. */
    static boolean isStory(Object unit) {
        if (unit == null) return false;
        for (Class<?> type = unit.getClass(); type != null; type = type.getSuperclass()) {
            if (STORY_CLASS.equals(type.getName())) return true;
        }
        return false;
    }
}
