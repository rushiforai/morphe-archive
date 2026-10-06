/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.feed;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.FeedFilterCounters;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/**
 * The Meta AI card rule in the shared feed guard: Hide AI-detected posts takes out the Meta AI
 * cards Facebook adds between posts by their type name alone, under a switch of its own that starts
 * on, and keeps every other unit.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class MetaAiFeedUnitTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    enum Category { ORGANIC, ENGAGEMENT }

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.HIDE_META_AI_FEED_UNITS.resetToDefault();
        FeedFilterCounters.clear();
        HookStatus.clear();
    }

    /** The guard with only Hide AI-detected posts in the build, or without it. */
    private static boolean guard(Object unit, boolean aiPatched) {
        return FeedFilter.hideEdge(Category.ENGAGEMENT, unit, false, false, story -> null, aiPatched,
                story -> null, false, ShowcaseType.PATCHED, false, PostText.MESSAGE, PostText.ATTACHED,
                story -> null);
    }

    private static TypedFeedUnit metaAiCard() {
        return new TypedFeedUnit("XFBFBImplicitMetaAIFeedUnit");
    }

    private static String feedLine() {
        for (String line : FeedFilterCounters.report()) {
            if (line.startsWith(FeedFilter.FEED_ROUTE + ": ")) return line;
        }
        return null;
    }

    @Test
    public void theTypeIsTheOneFacebooksDispatcherNames() {
        assertEquals("XFBFBImplicitMetaAIFeedUnit", FeedFilter.META_AI_UNIT_TYPE);
    }

    @Test
    public void theSwitchStartsOn() {
        assertTrue(Settings.HIDE_META_AI_FEED_UNITS.defaultValue);
        assertTrue(Settings.HIDE_META_AI_FEED_UNITS.get());
    }

    /** On, the card goes and the report names it by its type, which is all it says of it. */
    @Test
    public void aMetaAiCardIsHidden() {
        assertTrue(guard(metaAiCard(), true));
        assertEquals(FeedFilter.FEED_ROUTE + ": 1 lists, 1 items, 1 removed. Last reason: XFBFBImplicitMetaAIFeedUnit. "
                + "Removed: XFBFBImplicitMetaAIFeedUnit 1. Kinds: ENGAGEMENT 1", feedLine());
    }

    /** A post, a unit with a near name and a unit whose type can't be read all stay. */
    @Test
    public void everyOtherUnitStays() {
        assertFalse(guard(new TypedFeedUnit("Story"), true));
        assertFalse(guard(new TypedFeedUnit("XFBFBImplicitMetaAIFeedUnitEdge"), true));
        assertFalse(guard(new TypedFeedUnit("QuickPromotionFeedUnit"), true));
        assertFalse(guard(new TypedFeedUnit.Unreadable(), true));
        assertFalse(guard(null, true));
    }

    @Test
    public void offTheCardStays() {
        Settings.HIDE_META_AI_FEED_UNITS.save(false);
        assertFalse(guard(metaAiCard(), true));
        assertEquals(FeedFilter.FEED_ROUTE + ": 1 lists, 1 items, 0 removed. Kinds: ENGAGEMENT 1", feedLine());
    }

    /** Without Hide AI-detected posts the rule doesn't run, whatever the switch says. */
    @Test
    public void withoutThePatchTheCardStays() {
        assertFalse(guard(metaAiCard(), false));
    }

    @Test
    public void pausedTheCardStays() {
        for (HushfacebookPause.Reason why : new HushfacebookPause.Reason[]{
                HushfacebookPause.Reason.SWITCH, HushfacebookPause.Reason.CRASH_LOOP,
                HushfacebookPause.Reason.MARKER_FILE}) {
            PauseForTests.pause(why);
            assertFalse(why + " hid the card", guard(metaAiCard(), true));
        }
        PauseForTests.resume();
        assertTrue("the rule didn't come back after the pause", guard(metaAiCard(), true));
    }

    /** The row sits in Hide AI-detected posts' family, so its settings, backup and labels follow it. */
    @Test
    public void theSwitchBelongsToHideAiDetectedPosts() {
        assertTrue(app.morphe.extension.facebook.settings.PatchFamily.AI_DETECTED_POSTS.switches
                .contains(Settings.HIDE_META_AI_FEED_UNITS));
        assertNull("a Meta AI card isn't a suggested unit", FeedFilter.suggestedUnitName(metaAiCard()));
    }
}
