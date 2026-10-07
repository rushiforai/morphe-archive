/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.feed;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import com.facebook.graphql.model.GraphQLStory;
import com.facebook.graphql.model.GraphQLStoryAttachment;
import com.facebook.graphservice.tree.TreeJNI;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.FeedFilterCounters;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/**
 * Hide AI character posts' rule for posts featuring one of Meta's AI characters: with Hide
 * AI-detected posts in and the switch on, a post goes when one of its attachments has Facebook's
 * AI character style, counted by kind only, and every other post stays. The switch starts off and
 * answers to itself alone, not to the Meta AI cards' switch. Off, paused or without the patch,
 * nothing of a post is read.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class AiCharacterPostsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    enum Category { ORGANIC }

    private static final GraphQLStoryAttachment PLAIN = new GraphQLStoryAttachment(null);
    private static final GraphQLStoryAttachment CHARACTER = new GraphQLStoryAttachment(null);

    private final AtomicInteger attachmentReads = new AtomicInteger();
    private final List<String> typesAsked = Collections.synchronizedList(new ArrayList<>());

    /** The story's attachments, as the patch's accessor answers them, counting each read. */
    private final StoryFlag.Accessor attachments = story -> {
        attachmentReads.incrementAndGet();
        return ((GraphQLStory) story).A0n();
    };

    /** Facebook's finder, standing in: the character attachment has the style, the plain one none. */
    private final AiCharacterPosts.Finder finder = (attachment, type) -> {
        typesAsked.add(type);
        return attachment == CHARACTER && AiCharacterPosts.STYLE_TYPE.equals(type) ? new TreeJNI(type) : null;
    };

    /** The rule's tests run with the switch on; the ones about it being off say so. */
    @Before
    public void switchOn() {
        Settings.HIDE_AI_CHARACTER_POSTS.save(true);
    }

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.HIDE_META_AI_FEED_UNITS.resetToDefault();
        Settings.HIDE_AI_CHARACTER_POSTS.resetToDefault();
        FeedFilterCounters.clear();
        HookStatus.clear();
    }

    private boolean guard(Object unit, boolean aiPatched) {
        return guard(unit, aiPatched, attachments, finder);
    }

    private static boolean guard(Object unit, boolean aiPatched, StoryFlag.Accessor attachments,
            AiCharacterPosts.Finder finder) {
        return FeedFilter.hideEdge(Category.ORGANIC, unit, false, false, story -> null, aiPatched, story -> null,
                false, ShowcaseType.PATCHED, false, PostText.MESSAGE, PostText.ATTACHED, story -> null,
                attachments, finder);
    }

    private static String line(String route) {
        for (String line : FeedFilterCounters.report()) {
            if (line.startsWith(route + ": ")) return line;
        }
        return null;
    }

    private static String statusLine() {
        for (String line : HookStatus.report()) {
            if (line.startsWith(FamilyNames.AI_DETECTED_POSTS + ":")) return line;
        }
        return null;
    }

    @Test
    public void theStyleIsTheOneFacebooksFinderIsHanded() {
        assertEquals("AiInteractiveEmbodimentAttachmentStyleInfo", AiCharacterPosts.STYLE_TYPE);
    }

    /** These are someone's posts and none has been seen on a real feed, so the switch starts off. */
    @Test
    public void theSwitchStartsOffAndBelongsToHideAiDetectedPosts() {
        assertFalse(Settings.HIDE_AI_CHARACTER_POSTS.defaultValue);
        Settings.HIDE_AI_CHARACTER_POSTS.resetToDefault();
        assertFalse(guard(new GraphQLStory(null, CHARACTER), true));
        assertEquals(0, attachmentReads.get());
        assertTrue(app.morphe.extension.facebook.settings.PatchFamily.AI_DETECTED_POSTS.switches
                .contains(Settings.HIDE_AI_CHARACTER_POSTS));
    }

    /** The Meta AI cards' switch neither turns the rule on nor holds it back. */
    @Test
    public void theCardsSwitchDoesntGovernTheRule() {
        Settings.HIDE_META_AI_FEED_UNITS.save(false);
        assertTrue(guard(new GraphQLStory(null, CHARACTER), true));
        Settings.HIDE_META_AI_FEED_UNITS.save(true);
        Settings.HIDE_AI_CHARACTER_POSTS.save(false);
        assertFalse(guard(new GraphQLStory(null, CHARACTER), true));
        assertEquals(1, attachmentReads.get());
    }

    /** On, the post goes, and the report names the style and the kind, which is all it says of it. */
    @Test
    public void aPostFeaturingAnAiCharacterIsHidden() {
        assertTrue(guard(new GraphQLStory(null, CHARACTER), true));
        assertEquals(Collections.singletonList(AiCharacterPosts.STYLE_TYPE), typesAsked);
        assertEquals(FeedFilter.FEED_ROUTE + ": 1 lists, 1 items, 1 removed. Last reason: "
                + "AiInteractiveEmbodimentAttachmentStyleInfo. Removed: AiInteractiveEmbodimentAttachmentStyleInfo 1. "
                + "Kinds: ORGANIC 1", line(FeedFilter.FEED_ROUTE));
        assertEquals(AiCharacterPosts.ROUTE + ": 1 lists, 1 items, 1 removed. Last reason: AI character. "
                + "Removed: AI character 1. Kinds: AI character 1", line(AiCharacterPosts.ROUTE));
    }

    /** Any one attachment with the style is enough, wherever it sits among them. */
    @Test
    public void theCharacterCanBeAnyOfTheAttachments() {
        assertTrue(guard(new GraphQLStory(null, PLAIN, CHARACTER), true));
        assertEquals(2, typesAsked.size());
    }

    /** Posts without the style stay, each counted under why. */
    @Test
    public void everyOtherPostStays() {
        assertFalse(guard(new GraphQLStory(null, PLAIN), true));
        assertFalse(guard(new GraphQLStory(), true));
        assertFalse(guard(new TypedFeedUnit("Story"), true));
        assertFalse(guard(null, true));
        assertEquals(AiCharacterPosts.ROUTE + ": 4 lists, 4 items, 0 removed. Kinds: not a story 2, "
                + "no AI character 1, no attachments 1", line(AiCharacterPosts.ROUTE));
    }

    /** A story whose tree Facebook already released isn't read: the finder's native read would crash. */
    @Test
    public void aReleasedStoryIsNotRead() {
        GraphQLStory released = new GraphQLStory(null, CHARACTER);
        released.released();
        assertFalse(guard(released, true));
        assertEquals(0, attachmentReads.get());
        assertEquals(AiCharacterPosts.ROUTE + ": 1 lists, 1 items, 0 removed. Kinds: tree released 1",
                line(AiCharacterPosts.ROUTE));
    }

    /** Without the patch's stubs the post stays, and the report names what wasn't filled in. */
    @Test
    public void unfilledStubsKeepThePostAndSaySo() {
        assertFalse(guard(new GraphQLStory(null, CHARACTER), true, AiCharacterPosts.ATTACHMENTS, finder));
        assertTrue(statusLine(), statusLine().contains("the attachments accessor"));
        HookStatus.clear();
        assertFalse(guard(new GraphQLStory(null, CHARACTER), true, attachments, AiCharacterPosts.STYLES));
        assertTrue(statusLine(), statusLine().contains("Facebook's style finder"));
        assertTrue(line(AiCharacterPosts.ROUTE), line(AiCharacterPosts.ROUTE).endsWith("Kinds: accessor not patched 2"));
    }

    /** A reader that throws keeps the post, and the report names it. */
    @Test
    public void aFailedReadKeepsThePost() {
        StoryFlag.Accessor throwing = story -> {
            throw new IllegalStateException("tree gone");
        };
        assertFalse(guard(new GraphQLStory(null, CHARACTER), true, throwing, finder));
        AiCharacterPosts.Finder failing = (attachment, type) -> {
            throw new IllegalStateException("tree gone");
        };
        assertFalse(guard(new GraphQLStory(null, CHARACTER), true, attachments, failing));
        assertTrue(line(AiCharacterPosts.ROUTE), line(AiCharacterPosts.ROUTE).endsWith("Kinds: read failed 2"));
        assertTrue(statusLine(), statusLine().contains("attachments accessor"));
    }

    /** Off, nothing of the post is read and it stays. */
    @Test
    public void offNothingIsRead() {
        Settings.HIDE_AI_CHARACTER_POSTS.save(false);
        assertFalse(guard(new GraphQLStory(null, CHARACTER), true));
        assertEquals(0, attachmentReads.get());
        assertNull(line(AiCharacterPosts.ROUTE));
    }

    /** Without Hide AI-detected posts the rule doesn't run, whatever the switch says. */
    @Test
    public void withoutThePatchNothingIsRead() {
        assertFalse(guard(new GraphQLStory(null, CHARACTER), false));
        assertEquals(0, attachmentReads.get());
        assertNull(line(AiCharacterPosts.ROUTE));
    }

    @Test
    public void pausedNothingIsRead() {
        for (HushfacebookPause.Reason why : new HushfacebookPause.Reason[]{
                HushfacebookPause.Reason.SWITCH, HushfacebookPause.Reason.CRASH_LOOP,
                HushfacebookPause.Reason.MARKER_FILE}) {
            PauseForTests.pause(why);
            assertFalse(why + " hid the post", guard(new GraphQLStory(null, CHARACTER), true));
        }
        assertEquals(0, attachmentReads.get());
        PauseForTests.resume();
        assertTrue("the rule didn't come back after the pause", guard(new GraphQLStory(null, CHARACTER), true));
    }

    /** The overloads without the two readers leave the rule out, so the other rules' tests read nothing new. */
    @Test
    public void theOlderOverloadsReadNoAttachments() {
        assertFalse(FeedFilter.hideEdge(Category.ORGANIC, new GraphQLStory(null, CHARACTER), false, false,
                story -> null, true, story -> null, false, ShowcaseType.PATCHED, false, PostText.MESSAGE,
                PostText.ATTACHED, story -> null));
        assertNull(line(AiCharacterPosts.ROUTE));
    }
}
