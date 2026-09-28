/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.feed;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import com.facebook.graphql.model.GraphQLStory;
import com.facebook.graphservice.tree.TreeJNI;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import app.morphe.extension.facebook.feed.FeedGuardForTests.ReelItem;
import app.morphe.extension.facebook.feed.FeedGuardForTests.ReelModel;
import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.FeedFilterCounters;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/**
 * The GenAI rule for Reels and Watch: it takes a reel off a page only on a definite true of the
 * attribution's flag, keeps every other item with a reason in the report, counts on routes of its
 * own, edits a section's list in place, and reads nothing of an item while its switch is off or
 * Hushfacebook is paused.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class GenAiReelFilterTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final String MODEL = ReelModel.class.getName();

    /** Stands in for the finder the patch fills in, and counts how often the filter asked it. */
    private static final class Finding implements GenAiReelFilter.Finder {
        int calls;

        @Override
        public Object attribution(Object model) {
            calls++;
            return ((ReelModel) model).attribution;
        }
    }

    private static final GenAiReelFilter.Finder FINDER = model -> ((ReelModel) model).attribution;
    private static final StoryFlag.Accessor NO_STORY_INFO = story -> null;

    /** A section wrapper: the screen reads the list it holds. */
    public static final class Section {
        List<Object> items;

        Section(List<Object> items) {
            this.items = items;
        }
    }

    /** An attribution whose type can't be read: the call itself fails. */
    public static final class Unreadable extends TreeJNI {
        Unreadable() {
            super(GenAiReelFilter.ATTRIBUTION_TYPE);
        }

        @Override
        public String getTypeName() {
            throw new IllegalStateException("not materialised");
        }
    }

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.HIDE_AI_DETECTED_REELS.resetToDefault();
        StoryFlag.cachedMembers = null;
        GenAiReelFilter.READERS.clear();
        FeedFilterCounters.clear();
        HookStatus.clear();
    }

    private static Collection<?> page(Object... items) {
        return Arrays.asList(items);
    }

    private static Collection<?> filter(Collection<?> page) {
        return GenAiReelFilter.withoutAiReels(page, MODEL, FINDER, NO_STORY_INFO);
    }

    /** The line a route wrote, or null when nothing was counted on it. */
    private static String line(String route) {
        for (String line : FeedFilterCounters.report()) {
            if (line.startsWith(route + ": ")) return line;
        }
        return null;
    }

    private static ReelItem reel(TreeJNI attribution) {
        return new ReelItem(new ReelModel(attribution));
    }

    private static TreeJNI attribution(boolean flagged) {
        return new TreeJNI(GenAiReelFilter.ATTRIBUTION_TYPE).holding(GenAiReelFilter.DETECTED_FLAG, flagged);
    }

    /** The key is the flag's String.hashCode(), the same the feed's model keys it by, and the type is the viewer's. */
    @Test
    public void theKeysAreTheOnesFacebookUses() {
        assertEquals(0x723ea5fe, GenAiReelFilter.DETECTED_FLAG_KEY);
        assertEquals("XFBFBShortsGenAITransparencyAttribution", GenAiReelFilter.ATTRIBUTION_TYPE);
        assertEquals("com.facebook.graphservice.tree.TreeJNI", GenAiReelFilter.TREE_CLASS);
    }

    @Test
    public void theSwitchStartsOff() {
        assertFalse("the switch has to start off until a signed-in Reels feed has been recorded",
                Settings.HIDE_AI_DETECTED_REELS.defaultValue);
        assertFalse(Settings.HIDE_AI_DETECTED_REELS.get());
    }

    /** The one case that hides: a reel whose attribution's detected flag is true, with the switch on. */
    @Test
    public void aReelFacebookDetectedAsAiComesOffThePage() {
        Settings.HIDE_AI_DETECTED_REELS.save(true);
        TreeJNI flagged = attribution(true);
        ReelItem hidden = reel(flagged);
        Object other = new Object();
        ReelItem plain = reel(attribution(false));

        Collection<?> kept = filter(page(other, hidden, plain));

        assertEquals(Arrays.asList(other, plain), new ArrayList<>(kept));
        assertEquals("the flag was read once", 1, flagged.booleanReads);
        assertEquals(GenAiReelFilter.PAGES_ROUTE + ": 1 lists, 3 items, 1 removed. Last reason: "
                + "was_detected_as_ai_generated. Removed: was_detected_as_ai_generated 1", line(GenAiReelFilter.PAGES_ROUTE));
        assertEquals(GenAiReelFilter.ITEMS_ROUTE + ": 3 lists, 3 items, 1 removed. Last reason: flag true. "
                + "Removed: flag true 1. Kinds: flag false 1, flag true 1, no model 1", line(GenAiReelFilter.ITEMS_ROUTE));
    }

    /**
     * The mutation control for the one above: the same reel with the flag false, and every way the
     * attribution can be missing or unclear, keeps the item and records why.
     */
    @Test
    public void falseUnsetMissingOrAmbiguousMetadataKeepsTheReelAndSaysWhy() {
        Settings.HIDE_AI_DETECTED_REELS.save(true);

        keeps("false", reel(attribution(false)));
        keeps("unset", reel(new TreeJNI(GenAiReelFilter.ATTRIBUTION_TYPE)));
        keeps("no attribution", reel(null));
        TreeJNI chip = new TreeJNI("XFBFBShortsRemixAttribution").holding(GenAiReelFilter.DETECTED_FLAG, true);
        keeps("an attribution of another type, even with a true flag at the same key", reel(chip));
        assertEquals("an attribution of another type isn't read", 0, chip.booleanReads);
        keeps("a released attribution", reel(attribution(true).releasedTree()));
        keeps("an attribution whose type can't be read", reel(new Unreadable()));
        keeps("an attribution that isn't a tree", new ReelItem(new ReelModel(new Object())));
        keeps("an item holding no model", new ReelItem(null));
        keeps("an item of another kind", new Object());
        keeps("no item", (Object) null);
        assertTrue("the finder was never filled in",
                GenAiReelFilter.withoutAiReels(page(reel(attribution(true))), MODEL, GenAiReelFilter.PATCHED, NO_STORY_INFO)
                        .size() == 1);
        assertTrue("a finder that throws", GenAiReelFilter.withoutAiReels(page(reel(attribution(true))), MODEL,
                model -> { throw new IllegalStateException("gone"); }, NO_STORY_INFO).size() == 1);

        assertEquals(GenAiReelFilter.ITEMS_ROUTE + ": 12 lists, 12 items, 0 removed. Kinds: no model 3, "
                        + "accessor not patched 1, ambiguous: attribution not a tree 1, ambiguous: attribution of another type 1, "
                        + "attribution released 1, attribution type unreadable 1, flag false 1, flag unset 1, no AI attribution 1, "
                        + "read failed 1",
                line(GenAiReelFilter.ITEMS_ROUTE));
        assertTrue(line(GenAiReelFilter.PAGES_ROUTE), line(GenAiReelFilter.PAGES_ROUTE).startsWith(
                GenAiReelFilter.PAGES_ROUTE + ": 12 lists, 12 items, 0 removed"));
        assertEquals(Arrays.asList(
                "method " + MODEL + "#the XFBFBShortsGenAITransparencyAttribution finder",
                "a working 'GenAI attribution finder' hook (it threw java.lang.IllegalStateException)"),
                HookStatus.missing(FamilyNames.AI_DETECTED_REELS));
    }

    private static void keeps(String what, Object item) {
        Collection<?> kept = filter(page(item));
        assertEquals(what + " came off the page", 1, kept.size());
    }

    /** A Watch video that comes as a GraphQLStory carries the feed's flag, and is read the way the feed reads it. */
    @Test
    public void aStoryBackedVideoIsReadTheWayTheFeedReadsIt() {
        Settings.HIDE_AI_DETECTED_REELS.save(true);
        GraphQLStory flaggedStory = new GraphQLStory();
        ReelItem flagged = new ReelItem(flaggedStory);
        ReelItem plain = new ReelItem(new GraphQLStory());
        StoryFlag.Accessor info = story -> FeedGuardForTests.detectedInfo(story == flaggedStory);

        Collection<?> kept = GenAiReelFilter.withoutAiReels(page(flagged, plain), MODEL, FINDER, info);

        assertEquals(Collections.singletonList(plain), new ArrayList<>(kept));
        assertEquals(GenAiReelFilter.ITEMS_ROUTE + ": 2 lists, 2 items, 1 removed. Last reason: story flag true. "
                + "Removed: story flag true 1. Kinds: story flag false 1, story flag true 1", line(GenAiReelFilter.ITEMS_ROUTE));
    }

    /** The mutation control: a page with nothing to hide comes back as the very same object. */
    @Test
    public void aPageWithNothingToHideIsHandedBackUntouched() {
        Settings.HIDE_AI_DETECTED_REELS.save(true);
        List<Object> page = Collections.unmodifiableList(Arrays.asList(reel(attribution(false)), new Object()));

        assertSame(page, filter(page));
        assertSame(page, GenAiReelFilter.withoutAiSections(page, MODEL, FINDER, NO_STORY_INFO));
    }

    @Test
    public void aSectionLosesItsFlaggedReelsAndAnEmptiedSectionGoes() {
        Settings.HIDE_AI_DETECTED_REELS.save(true);
        ReelItem plain = reel(attribution(false));
        Section mixed = new Section(new ArrayList<>(Arrays.asList(plain, reel(attribution(true)))));
        Section flaggedOnly = new Section(Collections.unmodifiableList(Collections.singletonList(reel(attribution(true)))));

        List<?> kept = GenAiReelFilter.withoutAiSections(Arrays.asList(mixed, flaggedOnly), MODEL, FINDER, NO_STORY_INFO);

        assertEquals(1, kept.size());
        assertSame(mixed, kept.get(0));
        assertEquals(Collections.singletonList(plain), mixed.items);
        assertTrue("an immutable list is replaced rather than edited", flaggedOnly.items.isEmpty());
        assertEquals(GenAiReelFilter.SECTIONS_ROUTE + ": 1 lists, 2 items, 2 removed. Last reason: "
                + "was_detected_as_ai_generated. Removed: was_detected_as_ai_generated 2", line(GenAiReelFilter.SECTIONS_ROUTE));
        assertEquals(GenAiReelFilter.ITEMS_ROUTE + ": 3 lists, 3 items, 2 removed. Last reason: flag true. "
                + "Removed: flag true 2. Kinds: flag true 2, flag false 1", line(GenAiReelFilter.ITEMS_ROUTE));
    }

    /** Off, the rule doesn't ask for any item's attribution, so Facebook's path is all that runs. */
    @Test
    public void switchedOffTheRuleReadsNothing() {
        TreeJNI flagged = attribution(true);
        Finding finder = new Finding();
        List<Object> page = Arrays.asList(reel(flagged), new Object());

        assertSame(page, GenAiReelFilter.withoutAiReels(page, MODEL, finder, NO_STORY_INFO));
        Section section = new Section(new ArrayList<>(page));
        GenAiReelFilter.withoutAiSections(Collections.singletonList(section), MODEL, finder, NO_STORY_INFO);

        assertEquals("the finder was asked with the switch off", 0, finder.calls);
        assertEquals(0, flagged.booleanReads);
        assertEquals(2, section.items.size());
        assertNull("the rule counted an item with its switch off", line(GenAiReelFilter.ITEMS_ROUTE));
    }

    @Test
    public void pausedTheRuleReadsNothing() {
        Settings.HIDE_AI_DETECTED_REELS.save(true);
        for (HushfacebookPause.Reason why : new HushfacebookPause.Reason[]{
                HushfacebookPause.Reason.SWITCH, HushfacebookPause.Reason.CRASH_LOOP,
                HushfacebookPause.Reason.MARKER_FILE}) {
            PauseForTests.pause(why);
            Finding finder = new Finding();
            List<Object> page = Collections.singletonList(reel(attribution(true)));
            assertSame(why + " hid a reel", page, GenAiReelFilter.withoutAiReels(page, MODEL, finder, NO_STORY_INFO));
            assertEquals(why + " asked the finder", 0, finder.calls);
        }
        assertNull(line(GenAiReelFilter.ITEMS_ROUTE));

        PauseForTests.resume();
        assertTrue("the rule didn't come back after the pause", filter(page(reel(attribution(true)))).isEmpty());
    }

    /** Without the patch the stub answers its marker, and the public filters keep every item. */
    @Test
    public void anUnpatchedBuildKeepsEveryReel() {
        Settings.HIDE_AI_DETECTED_REELS.save(true);
        List<Object> page = Collections.singletonList(reel(attribution(true)));
        assertSame(page, GenAiReelFilter.withoutAiReels(page, MODEL));
        Section section = new Section(new ArrayList<>(page));
        assertEquals(1, GenAiReelFilter.withoutAiSections(Collections.singletonList(section), MODEL).size());
        assertEquals(1, section.items.size());
        assertEquals(GenAiReelFilter.ITEMS_ROUTE + ": 2 lists, 2 items, 0 removed. Kinds: accessor not patched 2",
                line(GenAiReelFilter.ITEMS_ROUTE));
    }

    /**
     * The reels row of Hook status names the members the reader found, and a build missing one
     * keeps every reel while the row names what's missing.
     */
    @Test
    public void theReportSaysWhetherTheReaderFoundWhatItNeeds() {
        Settings.HIDE_AI_DETECTED_REELS.save(true);
        filter(page(reel(attribution(false))));
        List<String> found = HookStatus.report();
        assertTrue(String.join("\n", found),
                found.contains(FamilyNames.AI_DETECTED_REELS + ": invoked 1, 4 found, 0 missing"));

        HookStatus.clear();
        FeedFilterCounters.clear();
        List<Object> page = Collections.singletonList(reel(attribution(true)));
        assertSame(page, GenAiReelFilter.withoutAiReels(page, "no.such.ReelModel", FINDER, NO_STORY_INFO));
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains(FamilyNames.AI_DETECTED_REELS + ": invoked 1, 3 found, 1 missing. "
                + "First missing: class no.such.ReelModel#reel model"));
        assertEquals(GenAiReelFilter.ITEMS_ROUTE + ": 1 lists, 1 items, 0 removed. Kinds: model class missing 1",
                line(GenAiReelFilter.ITEMS_ROUTE));
    }
}
