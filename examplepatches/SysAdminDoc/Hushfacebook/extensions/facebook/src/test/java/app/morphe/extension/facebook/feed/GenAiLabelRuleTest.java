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
import com.facebook.graphql.modelutil.BaseModelWithTree;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.Arrays;
import java.util.List;

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
 * The creator AI label rule in the shared feed guard. Facebook's header label shows on a post its
 * creator labelled as AI as well as on one its detection marked. The detected-only default keeps
 * the first kind; the opt-in switch hides both, counts each on its own route, and fails open.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class GenAiLabelRuleTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    enum Category { ORGANIC, SPONSORED }

    /** Stands in for a stub the patch fills in, and counts how often the guard asked it. */
    private static final class Answer implements StoryFlag.Accessor {
        private final Object info;
        int calls;

        Answer(Object info) {
            this.info = info;
        }

        @Override
        public Object model(Object story) {
            calls++;
            if (info instanceof RuntimeException) throw (RuntimeException) info;
            return info;
        }
    }

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.HIDE_AI_DETECTED_POSTS.resetToDefault();
        Settings.HIDE_AI_LABELLED_POSTS.resetToDefault();
        BaseSettings.DEBUG.resetToDefault();
        LogBufferManager.clearLogBuffer();
        StoryFlag.cachedMembers = null;
        FeedFilterCounters.clear();
        HookStatus.clear();
    }

    private static boolean guard(Object unit, StoryFlag.Accessor detected, StoryFlag.Accessor label) {
        return guard(Category.ORGANIC, unit, detected, label);
    }

    private static boolean guard(Object category, Object unit, StoryFlag.Accessor detected, StoryFlag.Accessor label) {
        return FeedFilter.hideEdge(category, unit, true, true, story -> null, true, detected, false,
                ShowcaseType.PATCHED, false, PostText.MESSAGE, PostText.ATTACHED, label);
    }

    private static String line(String route) {
        for (String line : FeedFilterCounters.report()) {
            if (line.startsWith(route + ": ")) return line;
        }
        return null;
    }

    private static String feedLine() {
        return line(FeedFilter.FEED_ROUTE);
    }

    /**
     * The keys read from Facebook 577 and 580: the self-disclosed flag's String.hashCode() and the
     * MD5 tag of the self-disclosure info's GraphQL type. The patch's own test pins the same numbers.
     */
    @Test
    public void theKeysAreTheOnesFacebookUses() {
        assertEquals(0xbc6e7b43, GenAiLabel.SELF_DISCLOSED_FLAG_KEY);
        assertEquals(0x9213d34e, GenAiLabel.SELF_DISCLOSURE_INFO_TYPE_TAG);
        assertEquals(0x73da0c74, GenAiLabel.SELF_DISCLOSURE_INFO_FIELD.hashCode());
        assertTrue("the two infos share a type tag", GenAiLabel.SELF_DISCLOSURE_INFO_TYPE_TAG
                != GenAiLabel.DETECTED_INFO_TYPE_TAG);
    }

    @Test
    public void theSwitchStartsOff() {
        assertFalse("the switch has to start off until a labelled post has been seen going on a signed-in feed",
                Settings.HIDE_AI_LABELLED_POSTS.defaultValue);
        assertFalse(Settings.HIDE_AI_LABELLED_POSTS.get());
    }

    /** With the switch on, a post only its creator labelled goes, on the label's own route and kind. */
    @Test
    public void aPostItsCreatorLabelledIsHiddenWithTheSwitchOn() {
        Settings.HIDE_AI_LABELLED_POSTS.save(true);
        BaseModelWithTree label = FeedGuardForTests.selfDisclosureInfo(true);

        assertTrue(guard(new GraphQLStory(), new Answer(FeedGuardForTests.detectedInfo(false)), new Answer(label)));
        assertEquals("the flag was read once", 1, label.reads);
        assertEquals(FeedFilter.FEED_ROUTE + ": 1 lists, 1 items, 1 removed. Last reason: "
                + "was_self_disclosed_as_ai_generated. Removed: was_self_disclosed_as_ai_generated 1. Kinds: ORGANIC 1",
                feedLine());
        assertEquals(FeedFilter.AI_LABEL_ROUTE + ": 1 lists, 1 items, 1 removed. Last reason: flag true. "
                + "Removed: flag true 1. Kinds: flag true 1", line(FeedFilter.AI_LABEL_ROUTE));
        assertEquals("the detection rule read it first and kept it",
                FeedFilter.AI_ROUTE + ": 1 lists, 1 items, 0 removed. Kinds: flag false 1", line(FeedFilter.AI_ROUTE));
    }

    /**
     * The mutation control for the one above, and the default left as it was: with only the detection
     * switch on, the same post stays and its creator's label isn't even asked for.
     */
    @Test
    public void theDetectionSwitchAloneKeepsAPostOnlyItsCreatorLabelled() {
        Settings.HIDE_AI_DETECTED_POSTS.save(true);
        Answer label = new Answer(FeedGuardForTests.selfDisclosureInfo(true));

        assertFalse(guard(new GraphQLStory(), new Answer(FeedGuardForTests.detectedInfo(false)), label));
        assertEquals("the label was asked for with its switch off", 0, label.calls);
        assertNull(line(FeedFilter.AI_LABEL_ROUTE));
        assertTrue("a detected post still goes",
                guard(new GraphQLStory(), new Answer(FeedGuardForTests.detectedInfo(true)), label));
        assertEquals(0, label.calls);
    }

    /**
     * The label shows on a detected post too, so the switch hides one even with the detection
     * switch off. The detection rule counts it, and the label isn't read after it.
     */
    @Test
    public void theSwitchAloneHidesADetectedPostToo() {
        Settings.HIDE_AI_LABELLED_POSTS.save(true);
        Answer label = new Answer(FeedGuardForTests.selfDisclosureInfo(false));

        assertTrue(guard(new GraphQLStory(), new Answer(FeedGuardForTests.detectedInfo(true)), label));
        assertEquals("the label was read after the detected flag hid the post", 0, label.calls);
        assertTrue(feedLine(), feedLine().contains("Last reason: was_detected_as_ai_generated"));
        assertEquals(FeedFilter.AI_ROUTE + ": 1 lists, 1 items, 1 removed. Last reason: flag true. "
                + "Removed: flag true 1. Kinds: flag true 1", line(FeedFilter.AI_ROUTE));
        assertNull(line(FeedFilter.AI_LABEL_ROUTE));
    }

    /** A post with neither flag, and every way the label can be missing or unclear, stays and says why. */
    @Test
    public void falseNullMissingOrAmbiguousLabelKeepsThePostAndSaysWhy() {
        Settings.HIDE_AI_LABELLED_POSTS.save(true);
        GraphQLStory story = new GraphQLStory();
        Answer none = new Answer(null);

        assertFalse("false", guard(story, none, new Answer(FeedGuardForTests.selfDisclosureInfo(false))));
        assertFalse("a model that doesn't hold the flag reads false",
                guard(story, none, new Answer(new BaseModelWithTree(GenAiLabel.SELF_DISCLOSURE_INFO_TYPE_TAG))));
        assertFalse("null", guard(story, none, new Answer(null)));
        assertFalse("not a story", guard(new Object(), none, new Answer(FeedGuardForTests.selfDisclosureInfo(true))));
        assertFalse("the stub was never filled in", guard(story, none, GenAiLabel.SELF_LABEL_PATCHED));
        BaseModelWithTree detectedType = new BaseModelWithTree(GenAiLabel.DETECTED_INFO_TYPE_TAG)
                .with(GenAiLabel.SELF_DISCLOSED_FLAG, true);
        assertFalse("info of the detected type, even with a true flag at the same key",
                guard(story, none, new Answer(detectedType)));
        assertEquals("a model of another type isn't read", 0, detectedType.reads);
        assertFalse("info that isn't a tree model", guard(story, none, new Answer(new Object())));
        assertFalse("an accessor that throws", guard(story, none, new Answer(new IllegalStateException())));

        assertEquals(FeedFilter.AI_LABEL_ROUTE + ": 8 lists, 8 items, 0 removed. Kinds: flag false 2, "
                        + "accessor not patched 1, ambiguous: info not a tree model 1, ambiguous: info of another type 1, "
                        + "no creator AI label info 1, not a story 1, read failed 1",
                line(FeedFilter.AI_LABEL_ROUTE));
        assertTrue(feedLine(), feedLine().startsWith(FeedFilter.FEED_ROUTE + ": 8 lists, 8 items, 0 removed"));

        List<String> misses = HookStatus.missing(FamilyNames.AI_DETECTED_POSTS);
        assertEquals(Arrays.asList(
                "method com.facebook.graphql.model.GraphQLStory#the ai_generated_self_disclosure_info accessor",
                "a working 'creator AI label info accessor' hook (it threw java.lang.IllegalStateException)"), misses);
    }

    @Test
    public void pausedTheRuleReadsNothing() {
        Settings.HIDE_AI_LABELLED_POSTS.save(true);
        for (HushfacebookPause.Reason why : new HushfacebookPause.Reason[]{
                HushfacebookPause.Reason.SWITCH, HushfacebookPause.Reason.CRASH_LOOP,
                HushfacebookPause.Reason.MARKER_FILE}) {
            PauseForTests.pause(why);
            Answer label = new Answer(FeedGuardForTests.selfDisclosureInfo(true));
            assertFalse(why + " hid a post", guard(new GraphQLStory(), new Answer(null), label));
            assertEquals(why + " asked the stub", 0, label.calls);
        }
        assertNull(line(FeedFilter.AI_LABEL_ROUTE));

        PauseForTests.resume();
        assertTrue("the rule didn't come back after the pause", guard(new GraphQLStory(), new Answer(null),
                new Answer(FeedGuardForTests.selfDisclosureInfo(true))));
    }

    /** Without the patch the rule doesn't run whatever the switch says. */
    @Test
    public void anUnpatchedBuildHidesNothing() {
        Settings.HIDE_AI_LABELLED_POSTS.save(true);
        Answer label = new Answer(FeedGuardForTests.selfDisclosureInfo(true));
        assertFalse(FeedFilter.hideEdge(Category.ORGANIC, new GraphQLStory(), true, true, story -> null, false,
                story -> null, false, ShowcaseType.PATCHED, false, PostText.MESSAGE, PostText.ATTACHED, label));
        assertEquals(0, label.calls);
        assertFalse(FeedFilter.hideEdge(Category.ORGANIC, new GraphQLStory()));
        assertNull(line(FeedFilter.AI_LABEL_ROUTE));
    }

    /** A post an earlier rule already hid isn't read again. */
    @Test
    public void anEarlierRuleWins() {
        Settings.HIDE_AI_LABELLED_POSTS.save(true);
        Answer label = new Answer(FeedGuardForTests.selfDisclosureInfo(true));
        assertTrue(guard(Category.SPONSORED, new GraphQLStory(), new Answer(null), label));
        assertEquals(0, label.calls);
        assertNull(line(FeedFilter.AI_LABEL_ROUTE));
    }

    /**
     * With debug logging on, each edge's line says what both GenAI flags read, so a post on screen
     * showing Facebook's AI label can be matched to the flag behind it with both switches off. It
     * names no post and no account. Without the patch neither flag is read.
     */
    @Test
    public void theDebugLineSaysWhatBothFlagsRead() {
        BaseSettings.DEBUG.save(true);
        LogBufferManager.clearLogBuffer();
        guard(new GraphQLStory(), new Answer(FeedGuardForTests.detectedInfo(false)),
                new Answer(FeedGuardForTests.selfDisclosureInfo(true)));
        guard(new GraphQLStory(), new Answer(FeedGuardForTests.detectedInfo(true)), new Answer(null));
        Answer unpatched = new Answer(FeedGuardForTests.selfDisclosureInfo(true));
        FeedFilter.hideEdge(Category.SPONSORED, new GraphQLStory(), false, false, story -> null, false,
                story -> null, false, ShowcaseType.PATCHED, false, PostText.MESSAGE, PostText.ATTACHED, unpatched);

        String log = LogBufferManager.buildExportText();
        assertTrue(log, log.contains("Feed edge: ORGANIC null ifr=none genai=false ailabel=true"));
        assertTrue(log, log.contains("Feed edge: ORGANIC null ifr=none genai=true ailabel=none"));
        assertTrue(log, log.contains("Feed edge: SPONSORED null ifr=none"));
        assertFalse(log, log.contains("Feed edge: SPONSORED null ifr=none genai"));
        assertEquals("the label was read with the GenAI patch out", 0, unpatched.calls);
        assertNull("the debug line counted as a read of the rule", line(FeedFilter.AI_LABEL_ROUTE));
        assertNull(line(FeedFilter.AI_ROUTE));
    }
}
