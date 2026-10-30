/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.feed;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import com.facebook.graphql.model.GraphQLStory;
import com.facebook.graphql.modelutil.BaseModelWithTree;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.Arrays;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.Map;

import app.morphe.extension.facebook.feed.FeedGuardForTests.JoinState;
import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.FeedFilterCounters;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;
import app.morphe.extension.shared.settings.preference.LogBufferManager;

/**
 * Hide posts from groups you're not in (#195) in the shared feed guard: a story posted in a group
 * whose join state is one Facebook shows its Join button for goes, and so does a story wrapping
 * one, the way a group post a friend commented on or shared reaches Home. A post in a group
 * you're in, a post you asked to join, a post with no group and a post whose state Home didn't
 * fetch stay, and so does one that can't be read. Off reads nothing, paused is stock, and the
 * report counts what each read found.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class GroupPostsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    enum Category { ORGANIC }

    /**
     * Stands in for the accessors the rule reads through: a target per story, a state per target,
     * and the post a story wraps.
     */
    private static final class Stand {
        final Map<Object, Object> targets = new IdentityHashMap<>();
        final Map<Object, Object> states = new IdentityHashMap<>();
        final Map<Object, Object> wrapped = new IdentityHashMap<>();
        int calls;

        /** A story posted in a group whose join state is [state]. */
        GraphQLStory inGroup(Object state) {
            BaseModelWithTree group = FeedGuardForTests.group();
            GraphQLStory story = new GraphQLStory();
            targets.put(story, group);
            states.put(group, state);
            return story;
        }

        /** A story posted to no profile that wraps [inner], as a friend's comment or share of it. */
        GraphQLStory wrapping(Object inner) {
            GraphQLStory story = new GraphQLStory();
            wrapped.put(story, inner);
            return story;
        }

        GroupPosts.Readers readers() {
            return new GroupPosts.Readers(story -> {
                calls++;
                Object target = targets.get(story);
                if (target instanceof RuntimeException) throw (RuntimeException) target;
                return target;
            }, target -> {
                calls++;
                Object state = states.get(target);
                if (state instanceof RuntimeException) throw (RuntimeException) state;
                return state;
            }, story -> {
                calls++;
                return wrapped.get(story);
            });
        }
    }

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.HIDE_GROUP_POSTS_NOT_JOINED.resetToDefault();
        FeedFilterCounters.clear();
        HookStatus.clear();
        LogBufferManager.clearLogBuffer();
    }

    private static boolean guard(Object unit, GroupPosts.Readers readers) {
        return FeedFilter.hideEdge(Category.ORGANIC, unit, true, true, story -> null, false, GenAiLabel.PATCHED, false,
                ShowcaseType.PATCHED, false, PostText.MESSAGE, PostText.ATTACHED, story -> null, null, null, null,
                readers);
    }

    private static String line(String route) {
        for (String reported : FeedFilterCounters.report()) {
            if (reported.startsWith(route + ": ")) return reported;
        }
        return null;
    }

    /** The names are the ones Facebook 583's join state enum and Join button rule use. */
    @Test
    public void theStatesAreTheOnesFacebooksJoinButtonShowsFor() {
        assertEquals(2, GroupPosts.NOT_JOINED.length);
        assertTrue(GroupPosts.notJoined("CAN_JOIN"));
        assertTrue(GroupPosts.notJoined("CAN_REQUEST"));
        assertTrue("read through the wrapped post", GroupPosts.notJoined(GroupPosts.WRAPPED + "CAN_JOIN"));
        for (String kept : new String[] {"MEMBER", "REQUESTED", "CANNOT_JOIN_OR_REQUEST",
                "UNSET_OR_UNRECOGNIZED_ENUM_VALUE", GroupPosts.NOT_A_GROUP, GroupPosts.READ_FAILED,
                GroupPosts.WRAPPED + "MEMBER", GroupPosts.WRAPPED + GroupPosts.NOT_A_GROUP,
                GroupPosts.NO_WRAPPED_READER, null}) {
            assertFalse(kept, GroupPosts.notJoined(kept));
        }
        assertFalse("off until picked", Settings.HIDE_GROUP_POSTS_NOT_JOINED.defaultValue);
    }

    @Test
    public void offReadsNothingAndHidesNothing() {
        Stand stand = new Stand();
        assertFalse(guard(stand.inGroup(JoinState.CAN_JOIN), stand.readers()));
        assertEquals("nothing was read with the switch off", 0, stand.calls);
        assertNull(line(GroupPosts.ROUTE));
    }

    @Test
    public void aPostInAGroupYouCanJoinGoesAndYourGroupsStay() {
        Stand stand = new Stand();
        Settings.HIDE_GROUP_POSTS_NOT_JOINED.save(true);
        assertTrue("a public group", guard(stand.inGroup(JoinState.CAN_JOIN), stand.readers()));
        assertTrue("a group that asks first", guard(stand.inGroup(JoinState.CAN_REQUEST), stand.readers()));
        assertFalse("your group", guard(stand.inGroup(JoinState.MEMBER), stand.readers()));
        assertFalse("asked to join", guard(stand.inGroup(JoinState.REQUESTED), stand.readers()));
        assertFalse("can't join", guard(stand.inGroup(JoinState.CANNOT_JOIN_OR_REQUEST), stand.readers()));
        assertFalse("Home didn't fetch the state",
                guard(stand.inGroup(JoinState.UNSET_OR_UNRECOGNIZED_ENUM_VALUE), stand.readers()));

        String route = line(GroupPosts.ROUTE);
        assertNotNull(route);
        assertTrue(route, route.contains("6 lists, 6 items, 2 removed"));
        assertTrue(route, route.contains("Group:CAN_JOIN 1"));
        assertTrue(route, route.contains("Group:CAN_REQUEST 1"));
        assertTrue(route, route.contains("MEMBER 1"));
        assertTrue(route, route.contains("UNSET_OR_UNRECOGNIZED_ENUM_VALUE 1"));
        String feed = line(FeedFilter.FEED_ROUTE);
        assertNotNull(feed);
        assertTrue(feed, feed.contains("Group:CAN_JOIN 1"));
    }

    /**
     * A friend's own post wraps nothing and a post on a Page has no group as its target, so no
     * group's state is asked.
     */
    @Test
    public void aPostNotInAGroupStaysWithoutAJoinStateRead() {
        Settings.HIDE_GROUP_POSTS_NOT_JOINED.save(true);
        Stand stand = new Stand();
        GraphQLStory own = new GraphQLStory();
        assertFalse(guard(own, stand.readers()));
        GraphQLStory onAPage = new GraphQLStory();
        BaseModelWithTree page = new BaseModelWithTree("Page") { };
        stand.targets.put(onAPage, page);
        stand.states.put(page, JoinState.CAN_JOIN);
        assertFalse(guard(onAPage, stand.readers()));
        assertEquals("the two targets and the own post's wrapped post were read", 3, stand.calls);

        String route = line(GroupPosts.ROUTE);
        assertNotNull(route);
        assertTrue(route, route.contains(GroupPosts.NO_TARGET + " 1"));
        assertTrue(route, route.contains(GroupPosts.NOT_A_GROUP + " 1"));
    }

    /**
     * A group post a friend commented on or shared reaches Home as a story posted to no profile
     * that wraps the group's post (the second report on #195): the wrapped post's group decides,
     * and the report says the read went through the wrapper. A wrapped post with no group, one
     * whose tree is gone, one that isn't a story and one a build without Hide posts with words
     * can't read all stay.
     */
    @Test
    public void aGroupPostAFriendCommentedOnOrSharedGoesByTheWrappedPostsGroup() {
        Settings.HIDE_GROUP_POSTS_NOT_JOINED.save(true);
        Stand stand = new Stand();
        assertTrue("commented on, in a public group",
                guard(stand.wrapping(stand.inGroup(JoinState.CAN_JOIN)), stand.readers()));
        assertTrue("shared from a group that asks first",
                guard(stand.wrapping(stand.inGroup(JoinState.CAN_REQUEST)), stand.readers()));
        assertFalse("from your own group", guard(stand.wrapping(stand.inGroup(JoinState.MEMBER)), stand.readers()));
        assertFalse("a share of a friend's own post", guard(stand.wrapping(new GraphQLStory()), stand.readers()));
        GraphQLStory onAPage = new GraphQLStory();
        BaseModelWithTree page = new BaseModelWithTree("Page") { };
        stand.targets.put(onAPage, page);
        stand.states.put(page, JoinState.CAN_JOIN);
        assertFalse("a share of a Page's post", guard(stand.wrapping(onAPage), stand.readers()));
        assertFalse("the wrapped post's tree is gone",
                guard(stand.wrapping(stand.inGroup(JoinState.CAN_JOIN).released()), stand.readers()));
        assertFalse("wraps something that isn't a story", guard(stand.wrapping(new Object()), stand.readers()));
        assertFalse("no reader of the wrapped post", guard(stand.wrapping(stand.inGroup(JoinState.CAN_JOIN)),
                new GroupPosts.Readers(story -> stand.targets.get(story), target -> stand.states.get(target))));

        String route = line(GroupPosts.ROUTE);
        assertNotNull(route);
        assertTrue(route, route.contains("8 lists, 8 items, 2 removed"));
        assertTrue(route, route.contains("Group:" + GroupPosts.WRAPPED + "CAN_JOIN 1"));
        assertTrue(route, route.contains("Group:" + GroupPosts.WRAPPED + "CAN_REQUEST 1"));
        assertTrue(route, route.contains(GroupPosts.WRAPPED + "MEMBER 1"));
        assertTrue(route, route.contains(GroupPosts.NO_TARGET + " 2"));
        assertTrue(route, route.contains(GroupPosts.WRAPPED + GroupPosts.NOT_A_GROUP + " 1"));
        assertTrue(route, route.contains(GroupPosts.RELEASED + " 1"));
        assertTrue(route, route.contains(GroupPosts.NO_WRAPPED_READER + " 1"));
        String feed = line(FeedFilter.FEED_ROUTE);
        assertNotNull(feed);
        assertTrue(feed, feed.contains("Group:" + GroupPosts.WRAPPED + "CAN_JOIN 1"));
    }

    @Test
    public void aPostThatCantBeReadStays() {
        Settings.HIDE_GROUP_POSTS_NOT_JOINED.save(true);
        Stand stand = new Stand();

        // Neither accessor filled in, as on a build without the anchors.
        assertFalse(guard(stand.inGroup(JoinState.CAN_JOIN), GroupPosts.PATCHED));
        // The join state accessor alone not filled in.
        GraphQLStory half = stand.inGroup(JoinState.CAN_JOIN);
        assertFalse(guard(half, new GroupPosts.Readers(story -> stand.targets.get(story),
                target -> StoryFlag.NOT_PATCHED)));
        // An accessor throws.
        GraphQLStory throwing = new GraphQLStory();
        stand.targets.put(throwing, new IllegalStateException("tree gone"));
        assertFalse(guard(throwing, stand.readers()));
        // The story's native tree is gone.
        assertFalse(guard(stand.inGroup(JoinState.CAN_JOIN).released(), stand.readers()));
        // The group's native tree is gone.
        GraphQLStory goneGroup = new GraphQLStory();
        BaseModelWithTree gone = FeedGuardForTests.group();
        gone.released();
        stand.targets.put(goneGroup, gone);
        stand.states.put(gone, JoinState.CAN_JOIN);
        assertFalse(guard(goneGroup, stand.readers()));
        assertFalse("a released group was read", gone.readAfterRelease);
        // Not a story.
        assertFalse(guard(new Object(), stand.readers()));
        // A state that isn't an enum, and none at all.
        assertFalse(guard(stand.inGroup("CAN_JOIN"), stand.readers()));
        assertFalse(guard(stand.inGroup(null), stand.readers()));

        String route = line(GroupPosts.ROUTE);
        assertNotNull(route);
        assertTrue(route, route.contains("0 removed"));
        assertTrue(route, route.contains(GroupPosts.NOT_PATCHED + " 2"));
        assertTrue(route, route.contains(GroupPosts.READ_FAILED + " 1"));
        assertTrue(route, route.contains(GroupPosts.RELEASED + " 2"));
        assertTrue(route, route.contains(GroupPosts.NOT_A_STORY + " 1"));
        assertTrue(route, route.contains(GroupPosts.NOT_AN_ENUM + " 1"));
        assertTrue(route, route.contains(GroupPosts.NO_STATE + " 1"));
    }

    @Test
    public void pausedFacebookKeepsEveryPost() {
        Stand stand = new Stand();
        Settings.HIDE_GROUP_POSTS_NOT_JOINED.save(true);
        assertTrue(guard(stand.inGroup(JoinState.CAN_JOIN), stand.readers()));
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        int before = stand.calls;
        assertFalse(guard(stand.inGroup(JoinState.CAN_JOIN), stand.readers()));
        assertEquals("a paused Facebook read nothing", before, stand.calls);
    }

    /**
     * With debug logging on, each edge's line says what the join state read found, the switch on or
     * off, so a device check can see the state Home fetched. The line isn't a read of the rule.
     */
    @Test
    public void theDebugLineSaysWhatTheJoinStateReads() {
        BaseSettings.DEBUG.save(true);
        LogBufferManager.clearLogBuffer();
        try {
            Stand stand = new Stand();
            guard(stand.inGroup(JoinState.CAN_JOIN), stand.readers());
            guard(new GraphQLStory(), stand.readers());
            String log = LogBufferManager.buildExportText();
            assertTrue(log, log.contains(" group=CAN_JOIN"));
            assertTrue(log, log.contains(" group=" + GroupPosts.NO_TARGET));
            assertNull("the debug line counted as a read of the rule", line(GroupPosts.ROUTE));
        } finally {
            BaseSettings.DEBUG.resetToDefault();
            LogBufferManager.clearLogBuffer();
        }
    }

    /**
     * A story posted to no profile and wrapping no story (the third report on #195) gets its shape on
     * the debug line: the type names its title's ranges point at, its shareable, and each attachment's
     * target, a group's with its join state. At most {@link GroupPosts#SHAPE_LIMIT} a list, and a post
     * in a group gets no shape.
     */
    @Test
    public void theDebugLineSaysWhereAStoryPostedToNoProfileNamesAGroup() {
        BaseSettings.DEBUG.save(true);
        LogBufferManager.clearLogBuffer();
        try {
            Stand stand = new Stand();
            BaseModelWithTree group = FeedGuardForTests.group();
            stand.states.put(group, JoinState.CAN_JOIN);
            BaseModelWithTree user = new BaseModelWithTree("User") { };
            BaseModelWithTree video = new BaseModelWithTree("Video") { };
            Object userRange = new Object();
            Object groupRange = new Object();
            Map<Object, Object> entities = new IdentityHashMap<>();
            entities.put(userRange, user);
            entities.put(groupRange, group);
            Object toGroup = new Object();
            Object toVideo = new Object();
            Map<Object, Object> targets = new IdentityHashMap<>();
            targets.put(toGroup, group);
            targets.put(toVideo, video);
            GraphQLStory story = new GraphQLStory();
            GraphQLStory longTitle = new GraphQLStory();
            Object title = new Object();
            Object manyRanges = new Object();
            GroupPosts.ShapeReaders shape = new GroupPosts.ShapeReaders(
                    s -> s == story ? title : s == longTitle ? manyRanges : null,
                    s -> null,
                    t -> t == title ? Arrays.asList(userRange, groupRange)
                            : t == manyRanges ? Collections.nCopies(GroupPosts.SHAPE_LIMIT + 2, userRange) : null,
                    entities::get,
                    s -> s == story ? Arrays.asList(toGroup, toVideo) : null,
                    targets::get,
                    target -> stand.states.get(target));
            GroupPosts.Readers readers = new GroupPosts.Readers(stand.targets::get, stand.states::get, s -> null, shape);

            guard(story, readers);
            guard(longTitle, readers);
            guard(stand.inGroup(JoinState.MEMBER), readers);
            String log = LogBufferManager.buildExportText();
            assertTrue(log, log.contains(" group=" + GroupPosts.NO_TARGET
                    + " shape=title:User+Group;shareable:-;attachments:Group/CAN_JOIN+Video"));
            assertTrue(log, log.contains(" shape=title:User+User+User+User+more;shareable:-;attachments:-"));
            assertTrue(log, log.contains(" group=MEMBER"));
            assertFalse(log, log.contains(" group=MEMBER shape="));
            assertNull("the debug line counted as a read of the rule", line(GroupPosts.ROUTE));
        } finally {
            BaseSettings.DEBUG.resetToDefault();
            LogBufferManager.clearLogBuffer();
        }
    }

    /** A build whose patch filled none of the shape's accessors says so with a "?" each, and nothing throws. */
    @Test
    public void theShapeOfAnUnpatchedBuildSaysSo() {
        assertEquals("title:?;shareable:?;attachments:?",
                GroupPosts.shape(new GraphQLStory(), GroupPosts.SHAPE_PATCHED));
        assertEquals(GroupPosts.RELEASED, GroupPosts.shape(new GraphQLStory().released(), GroupPosts.SHAPE_PATCHED));
        GroupPosts.ShapeReaders throwing = new GroupPosts.ShapeReaders(s -> {
            throw new IllegalStateException("tree gone");
        }, s -> null, t -> null, r -> null, s -> null, a -> null, g -> null);
        assertEquals(GroupPosts.READ_FAILED, GroupPosts.shape(new GraphQLStory(), throwing));
    }

    /** The guard without the readers, as the overloads before this rule call it, leaves the rule out. */
    @Test
    public void theOlderOverloadsLeaveTheRuleOut() {
        Settings.HIDE_GROUP_POSTS_NOT_JOINED.save(true);
        Stand stand = new Stand();
        assertFalse(FeedFilter.hideEdge(Category.ORGANIC, stand.inGroup(JoinState.CAN_JOIN), true, true));
        assertEquals(0, stand.calls);
        assertTrue(FeedGuardForTests.hidesGroupPost(Category.ORGANIC, FeedGuardForTests.group(), JoinState.CAN_JOIN));
    }

    private static String statusLine() {
        for (String reported : HookStatus.report()) {
            if (reported.startsWith(FamilyNames.SUGGESTED_POSTS + ":")) return reported;
        }
        return "";
    }

    /** Off, Home asks for join states only when Facebook would. */
    @Test
    public void offKeepsFacebooksAnswerForTheJoinStateQuery() {
        assertFalse(GroupPosts.askForJoinState(false));
        assertTrue(GroupPosts.askForJoinState(true));
        assertFalse(statusLine().contains(GroupPosts.ASKED));
    }

    /** On, Home always asks, so a group post reads its real state instead of the unset default. */
    @Test
    public void onAsksHomeForJoinStates() {
        Settings.HIDE_GROUP_POSTS_NOT_JOINED.save(true);
        assertTrue(GroupPosts.askForJoinState(false));
        String status = statusLine();
        assertTrue(status, status.contains(GroupPosts.ASKED + " 1"));
    }

    /** Facebook's own yes stays a yes and isn't counted as the switch's doing. */
    @Test
    public void facebooksYesIsKeptAndNotCounted() {
        Settings.HIDE_GROUP_POSTS_NOT_JOINED.save(true);
        assertTrue(GroupPosts.askForJoinState(true));
        assertFalse(statusLine().contains(GroupPosts.ASKED));
    }

    @Test
    public void pausedOrNotReadyKeepsFacebooksAnswerForTheJoinStateQuery() {
        Settings.HIDE_GROUP_POSTS_NOT_JOINED.save(true);
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        assertFalse(GroupPosts.askForJoinState(false));
        PauseForTests.resume();
        SettingsContextRule.withoutContext(() -> assertFalse(GroupPosts.askForJoinState(false)));
        assertTrue(GroupPosts.askForJoinState(false));
    }
}
