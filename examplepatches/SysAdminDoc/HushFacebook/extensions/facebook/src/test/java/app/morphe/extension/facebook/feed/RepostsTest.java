/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.feed;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import com.facebook.graphql.model.GraphQLMedia;
import com.facebook.graphql.model.GraphQLStory;
import com.facebook.graphql.model.GraphQLStoryAttachment;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.IdentityHashMap;
import java.util.List;
import java.util.Map;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.FeedFilterCounters;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;
import app.morphe.extension.shared.settings.preference.LogBufferManager;

/**
 * Hide reposts: a story whose attached story is a story goes, with a caption or without, an
 * original post and anything that can't be read stay, the rule never asks for a post's words, and
 * nothing is read with the switch off, without the patch or while Hushfacebook is paused.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class RepostsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    enum Category { ORGANIC }

    /** Stands in for the two stubs Hide posts by words fills, and counts what each was asked. */
    private static final class Stand {
        final Map<Object, Object> messages = new IdentityHashMap<>();
        int messageCalls;
        int attachedCalls;

        final StoryFlag.Accessor message = story -> {
            messageCalls++;
            return messages.get(story);
        };
        final StoryFlag.Accessor attached = story -> {
            attachedCalls++;
            return ((GraphQLStory) story).A04();
        };
    }

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.HIDE_REPOSTS.resetToDefault();
        PostText.cachedMembers = null;
        FeedFilterCounters.clear();
        HookStatus.clear();
        LogBufferManager.clearLogBuffer();
    }

    /** The guard with Hide posts by words in, or left out when [patched] is false. */
    private static boolean guard(Object unit, boolean patched, StoryFlag.Accessor message, StoryFlag.Accessor attached) {
        return FeedFilter.hideEdge(Category.ORGANIC, unit, true, true, story -> null, false, GenAiLabel.PATCHED, false,
                ShowcaseType.PATCHED, patched, message, attached);
    }

    private static boolean guard(Object unit, Stand stand) {
        return guard(unit, true, stand.message, stand.attached);
    }

    /** The guard where the attached story stub answers [attached] for any story. */
    private static boolean guard(Object unit, StoryFlag.Accessor attached) {
        return guard(unit, true, story -> null, attached);
    }

    private static GraphQLStory share() {
        return new GraphQLStory(new GraphQLStory());
    }

    /** The line a route wrote, or null when nothing counted on it. */
    private static String line(String route) {
        for (String reported : FeedFilterCounters.report()) {
            if (reported.startsWith(route + ": ")) return reported;
        }
        return null;
    }

    @Test
    public void aShareGoesWithACaptionOrWithout() {
        Stand stand = new Stand();
        GraphQLStory plain = share();
        GraphQLStory captioned = share();
        stand.messages.put(captioned, FeedGuardForTests.postText("Look at this"));
        assertFalse("the switch starts off", Settings.HIDE_REPOSTS.defaultValue);
        assertFalse("switch off", guard(plain, stand));
        assertEquals("nothing was read with the switch off", 0, stand.attachedCalls);
        assertNull(line(PostText.REPOST_ROUTE));

        Settings.HIDE_REPOSTS.save(true);
        assertTrue("a share with no caption", guard(plain, stand));
        assertTrue("a share with a caption", guard(captioned, stand));
        assertEquals("the rule asked for a post's words", 0, stand.messageCalls);
        assertEquals(PostText.REPOST_ROUTE + ": 2 lists, 2 items, 2 removed. Last reason: repost. "
                + "Removed: repost 2. Kinds: repost 2", line(PostText.REPOST_ROUTE));
        assertEquals(FeedFilter.FEED_ROUTE + ": 3 lists, 3 items, 2 removed. Last reason: repost. "
                + "Removed: repost 2. Kinds: ORGANIC 3", line(FeedFilter.FEED_ROUTE));
        assertFalse("the report holds a post's words",
                String.join("\n", FeedFilterCounters.report()).contains("Look at this"));
    }

    @Test
    public void anOriginalPostStays() {
        Settings.HIDE_REPOSTS.save(true);
        Stand stand = new Stand();
        GraphQLStory written = new GraphQLStory();
        stand.messages.put(written, FeedGuardForTests.postText("My own words"));
        assertFalse("a post of the poster's own words", guard(written, stand));
        assertFalse("a photo of the poster's own",
                guard(new GraphQLStory(null, new GraphQLStoryAttachment(new GraphQLMedia("Photo"))), stand));
        assertEquals(PostText.REPOST_ROUTE + ": 2 lists, 2 items, 0 removed. Kinds: original post 2",
                line(PostText.REPOST_ROUTE));
    }

    @Test
    public void whatCantBeReadStaysAndSaysWhy() {
        Settings.HIDE_REPOSTS.save(true);
        Stand stand = new Stand();
        assertFalse("the stub unfilled", guard(share(), PostText.ATTACHED));
        List<String> misses = HookStatus.missing(FamilyNames.POST_WORDS);
        assertTrue(misses.toString(),
                misses.contains("method " + StoryFlag.STORY_CLASS + "#the " + PostText.ATTACHED_STORY_FIELD + " accessor"));

        assertFalse("not a story", guard(new Object(), stand));
        assertFalse("an accessor that throws", guard(share(), story -> {
            throw new IllegalStateException("tree gone");
        }));
        assertFalse("an attached model that isn't a story", guard(share(), story -> new Object()));
        assertFalse("a released story", guard(share().released(), stand));
        GraphQLStory gone = new GraphQLStory();
        gone.released();
        assertFalse("a released shared story", guard(new GraphQLStory(gone), stand));
        PostText.cachedMembers = new PostText.Members(null, null, null, null, null, null);
        assertFalse("a build without GraphQLStory", guard(share(), stand));

        assertEquals(PostText.REPOST_ROUTE + ": 7 lists, 7 items, 0 removed. Kinds: accessor not patched 1, "
                + "ambiguous: shared post not a story 1, not a story 1, read failed 1, reader missing 1, "
                + "shared post's tree released 1, tree released 1", line(PostText.REPOST_ROUTE));
    }

    @Test
    public void withoutThePatchTheSwitchReadsNothing() {
        Settings.HIDE_REPOSTS.save(true);
        Stand stand = new Stand();
        assertFalse(guard(share(), false, stand.message, stand.attached));
        assertEquals(0, stand.attachedCalls);
        assertNull(line(PostText.REPOST_ROUTE));
    }

    @Test
    public void pausedOrOffReadsNothingAndKeepsTheShare() {
        Settings.HIDE_REPOSTS.save(true);
        Stand stand = new Stand();
        GraphQLStory share = share();
        for (HushfacebookPause.Reason why : new HushfacebookPause.Reason[]{
                HushfacebookPause.Reason.SWITCH, HushfacebookPause.Reason.CRASH_LOOP,
                HushfacebookPause.Reason.MARKER_FILE}) {
            PauseForTests.pause(why);
            assertFalse("paused by " + why, guard(share, stand));
            PauseForTests.resume();
        }
        assertEquals(0, stand.attachedCalls);
        assertNull(line(PostText.REPOST_ROUTE));
        assertTrue("the switch didn't come back after the pause", guard(share, stand));

        Settings.HIDE_REPOSTS.save(false);
        assertFalse("turned off again", guard(share, stand));
        assertEquals("the rule read a post with its switch off", 1, stand.attachedCalls);
    }
}
