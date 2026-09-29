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

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.FeedFilterCounters;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/**
 * The GenAI reel rule's second reader, for the Reels tab's own items. Those hold no reel model or
 * story in a field of their own: the model and the story sit together in a holder, beside raw
 * trees of the item's own. The reader reads {@code ai_generated_detected_info} and its
 * {@code was_detected_as_ai_generated} by key on the holder's model and story and on those raw
 * trees. A definite true hides the item; anything else keeps it with a kind that says why, and
 * nothing is read with the switch off or Hushfacebook paused.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class GenAiReelTreeTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** A reel's model as the Reels tab keeps it: a tree (580 LX/812, a Pando tree under TreeJNI). */
    public static class PandoReel extends TreeJNI {
    }

    /** The reel model class the patch names, here the stand-in above. */
    private static final String MODEL = PandoReel.class.getName();

    /** The holder a Reels item keeps its reel's model and story in (580 LX/7bV, 577 LX/7Z9). */
    public static final class VideoHolder {
        final Integer source = 0;
        PandoReel model;
        GraphQLStory story;

        VideoHolder(PandoReel model, GraphQLStory story) {
            this.model = model;
            this.story = story;
        }
    }

    /** Something every item points at that happens to hold a story. It declares no model, so it's no holder. */
    public static final class SharedState {
        final GraphQLStory current;

        SharedState(GraphQLStory current) {
            this.current = current;
        }
    }

    /** A holder of the model alone: without the story beside it, it isn't the pair the rule reads. */
    public static final class ModelOnly {
        final PandoReel model;

        ModelOnly(PandoReel model) {
            this.model = model;
        }
    }

    /**
     * A Reels tab item (580 LX/857, 577 LX/71s): three raw trees of its own, the holder, a shared
     * object and a string, and no field of the model's type or GraphQLStory's.
     */
    public static final class TabItem {
        final TreeJNI id = new TreeJNI();
        final TreeJNI edgeHeader = new TreeJNI();
        final TreeJNI unitMetadata = new TreeJNI();
        final VideoHolder video;
        final Object shared;
        final String cacheId = "unit";

        TabItem(VideoHolder video, Object shared) {
            this.video = video;
            this.shared = shared;
        }
    }

    /** An item holding one raw tree and nothing else, as 580's LX/5qo holds its reel's. */
    public static final class RawItem {
        final TreeJNI tree;

        RawItem(TreeJNI tree) {
            this.tree = tree;
        }
    }

    /** A section wrapper: the screen reads the list it holds. */
    public static final class Section {
        List<Object> items;

        Section(List<Object> items) {
            this.items = items;
        }
    }

    /** A raw tree whose getTree fails, as a read of a field in an unexpected state could. */
    public static final class FailingTree extends TreeJNI {
        @Override
        public TreeJNI getTree(int field) {
            throw new IllegalStateException("not materialised");
        }
    }

    /** The typed path's finder: no attribution for any model, so a typed read says so. */
    private static final GenAiReelFilter.Finder NO_ATTRIBUTION = model -> null;
    private static final StoryFlag.Accessor NO_STORY_INFO = story -> null;

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.HIDE_AI_DETECTED_REELS.resetToDefault();
        StoryFlag.cachedMembers = null;
        GenAiReelFilter.READERS.clear();
        FeedFilterCounters.clear();
        HookStatus.clear();
    }

    private static TreeJNI info(boolean flagged) {
        return new TreeJNI().holding(GenAiReelFilter.DETECTED_FLAG, flagged);
    }

    private static PandoReel reel(TreeJNI info) {
        PandoReel reel = new PandoReel();
        if (info != null) reel.with(GenAiReelFilter.DETECTED_INFO_FIELD, info);
        return reel;
    }

    /** A raw tree of another class than the model's, as the items' own trees are (580 LX/3SN). */
    private static TreeJNI raw(TreeJNI info) {
        TreeJNI tree = new TreeJNI();
        if (info != null) tree.with(GenAiReelFilter.DETECTED_INFO_FIELD, info);
        return tree;
    }

    private static TabItem item(PandoReel model, GraphQLStory story) {
        return new TabItem(new VideoHolder(model, story), null);
    }

    private static Collection<?> filter(Object... items) {
        return GenAiReelFilter.withoutAiReels(Arrays.asList(items), MODEL, NO_ATTRIBUTION, NO_STORY_INFO);
    }

    private static void keeps(String what, Object item) {
        assertEquals(what + " came off the page", 1, filter(item).size());
    }

    private static String line(String route) {
        for (String line : FeedFilterCounters.report()) {
            if (line.startsWith(route + ": ")) return line;
        }
        return null;
    }

    private static String reelsRow() {
        for (String row : HookStatus.report()) {
            if (row.startsWith(FamilyNames.AI_DETECTED_REELS + ": ")) return row;
        }
        return null;
    }

    /** The field and the flag are keyed the way Facebook's Reels menu and feed label read them. */
    @Test
    public void theKeysAreTheOnesFacebookUses() {
        assertEquals("ai_generated_detected_info", GenAiReelFilter.DETECTED_INFO_FIELD);
        assertEquals(0xb4f9e684, GenAiReelFilter.DETECTED_INFO_KEY);
        assertEquals(0x723ea5fe, GenAiReelFilter.DETECTED_FLAG_KEY);
        assertEquals("getTree", GenAiReelFilter.TREE_READER);
    }

    /** The case the S22 counted as "no model": the flag on the model the holder keeps hides the item. */
    @Test
    public void aTabItemWhoseReelFacebookDetectedComesOff() {
        Settings.HIDE_AI_DETECTED_REELS.save(true);
        TreeJNI flaggedInfo = info(true);
        TabItem flagged = item(reel(flaggedInfo), new GraphQLStory());
        TabItem plain = item(reel(info(false)), new GraphQLStory());

        Collection<?> kept = filter(plain, flagged);

        assertEquals(Collections.singletonList(plain), new ArrayList<>(kept));
        assertEquals("the flag was read once", 1, flaggedInfo.booleanReads);
        assertEquals(GenAiReelFilter.ITEMS_ROUTE + ": 2 lists, 2 items, 1 removed. Last reason: tree flag true. "
                + "Removed: tree flag true 1. Kinds: tree flag false 1, tree flag true 1", line(GenAiReelFilter.ITEMS_ROUTE));
        assertEquals(GenAiReelFilter.PAGES_ROUTE + ": 1 lists, 2 items, 1 removed. Last reason: "
                + "was_detected_as_ai_generated. Removed: was_detected_as_ai_generated 1", line(GenAiReelFilter.PAGES_ROUTE));
        assertEquals(FamilyNames.AI_DETECTED_REELS + ": invoked 1, 5 found, 0 missing", reelsRow());
    }

    /**
     * A holder built from a post keeps the story and no model yet, and an item can hold its reel as
     * a raw tree of its own. The flag is read on either.
     */
    @Test
    public void theHoldersStoryAndAnItemsOwnTreeAreReadToo() {
        Settings.HIDE_AI_DETECTED_REELS.save(true);
        GraphQLStory story = new GraphQLStory();
        story.with(GenAiReelFilter.DETECTED_INFO_FIELD, info(true));
        TabItem fromAPost = item(null, story);
        RawItem raw = new RawItem(raw(info(true)));

        assertTrue(filter(fromAPost).isEmpty());
        assertTrue(filter(raw).isEmpty());
        assertEquals(GenAiReelFilter.ITEMS_ROUTE + ": 2 lists, 2 items, 2 removed. Last reason: tree flag true. "
                + "Removed: tree flag true 2. Kinds: tree flag true 2", line(GenAiReelFilter.ITEMS_ROUTE));
    }

    /**
     * The mutation control for the two above: the same items without a definite true, and every
     * way the tree can be missing or unreadable, stay on the page with the reason counted.
     */
    @Test
    public void withoutADefiniteTrueTheItemStaysAndSaysWhy() {
        Settings.HIDE_AI_DETECTED_REELS.save(true);

        keeps("false", item(reel(info(false)), null));
        keeps("the info without the flag", item(reel(new TreeJNI()), null));
        keeps("no info on any tree", item(reel(null), new GraphQLStory()));
        TreeJNI released = raw(info(true)).releasedTree();
        keeps("an item whose one tree was released", new RawItem(released));
        assertFalse("a released tree was read", released.readAfterRelease);
        keeps("a tree that fails the read", new RawItem(new FailingTree()));

        // Objects an item points at that aren't the model and story pair are never read.
        GraphQLStory elsewhere = new GraphQLStory();
        TreeJNI elsewhereInfo = info(true);
        elsewhere.with(GenAiReelFilter.DETECTED_INFO_FIELD, elsewhereInfo);
        keeps("a flagged story in a shared object", new TabItem(null, new SharedState(elsewhere)));
        PandoReel alone = reel(info(true));
        keeps("a flagged model without its story beside it", new TabItem(null, new ModelOnly(alone)));
        assertEquals("a story outside the pair was read", 0, elsewhereInfo.booleanReads);
        assertEquals("a model outside the pair was read", 0, alone.treeReads);
        keeps("an item of another kind", new Object());

        assertEquals(GenAiReelFilter.ITEMS_ROUTE + ": 8 lists, 8 items, 0 removed. Kinds: tree no AI info 3, "
                        + "no model 1, tree flag false 1, tree flag unset 1, tree read failed 1, tree released 1",
                line(GenAiReelFilter.ITEMS_ROUTE));
        assertEquals(Collections.singletonList(
                "a working 'GenAI reel tree reader' hook (it threw java.lang.IllegalStateException)"),
                HookStatus.missing(FamilyNames.AI_DETECTED_REELS));
    }

    /**
     * Facebook's Reels menu decides its "AI info" row by the attribution first, then by the model's
     * own detected info. An item holding its model in a field of its own is read the same way now:
     * with no attribution, a model whose detected info says detected comes off. The rule used to
     * stop at the attribution, so such a reel stayed while Facebook offered AI info for it. A model
     * with no such info, or with the flag false, still stays under the attribution's reason.
     */
    @Test
    public void anItemHoldingTheModelItselfFallsBackToItsDetectedInfo() {
        Settings.HIDE_AI_DETECTED_REELS.save(true);
        assertEquals("a model Facebook detected, without an attribution", 0,
                filter(new RawItemHoldingModel(reel(info(true)))).size());
        keeps("a model whose detected info says no", new RawItemHoldingModel(reel(info(false))));
        keeps("a model with no detected info", new RawItemHoldingModel(reel(null)));
        String items = line(GenAiReelFilter.ITEMS_ROUTE);
        assertTrue(items, items.contains("1 removed") && items.contains("no AI attribution 2")
                && items.contains("tree flag true 1"));
    }

    /**
     * The other half of Facebook's decision on a Reels tab item: the attribution of the model its
     * holder keeps. The tree reader alone never asked for it, so a reel whose attribution says
     * detected but whose model holds no detected info stayed.
     */
    @Test
    public void aTabItemWhoseModelsAttributionSaysDetectedComesOff() {
        Settings.HIDE_AI_DETECTED_REELS.save(true);
        PandoReel model = reel(null);
        TreeJNI attribution = new TreeJNI(GenAiReelFilter.ATTRIBUTION_TYPE).holding(GenAiReelFilter.DETECTED_FLAG, true);
        GenAiReelFilter.Finder finder = candidate -> candidate == model ? attribution : null;
        assertEquals(0, GenAiReelFilter.withoutAiReels(Arrays.asList(item(model, null)), MODEL, finder, NO_STORY_INFO).size());
        String items = line(GenAiReelFilter.ITEMS_ROUTE);
        assertTrue(items, items.contains("1 removed") && items.contains(GenAiReelFilter.FLAGGED + " 1"));
        keeps("a tab item whose model has no attribution and no detected info", item(reel(null), null));
    }

    /** An item with a field of the model's own type, like 580's LX/5qk. */
    public static final class RawItemHoldingModel {
        final PandoReel model;

        RawItemHoldingModel(PandoReel model) {
            this.model = model;
        }
    }

    @Test
    public void aSectionLosesItsFlaggedTabItem() {
        Settings.HIDE_AI_DETECTED_REELS.save(true);
        TabItem plain = item(reel(info(false)), null);
        Section section = new Section(new ArrayList<>(Arrays.asList(plain, item(reel(info(true)), null))));

        List<?> kept = GenAiReelFilter.withoutAiSections(Collections.singletonList(section), MODEL, NO_ATTRIBUTION,
                NO_STORY_INFO);

        assertSame(section, kept.get(0));
        assertEquals(Collections.singletonList(plain), section.items);
        assertEquals(GenAiReelFilter.ITEMS_ROUTE + ": 2 lists, 2 items, 1 removed. Last reason: tree flag true. "
                + "Removed: tree flag true 1. Kinds: tree flag false 1, tree flag true 1", line(GenAiReelFilter.ITEMS_ROUTE));
    }

    /** Off, or paused for any reason, no tree of any item is asked anything. */
    @Test
    public void switchedOffOrPausedNoTreeIsRead() {
        PandoReel model = reel(info(true));
        List<Object> page = Collections.singletonList(item(model, null));

        assertSame(page, GenAiReelFilter.withoutAiReels(page, MODEL, NO_ATTRIBUTION, NO_STORY_INFO));
        assertEquals("a tree was read with the switch off", 0, model.treeReads);

        Settings.HIDE_AI_DETECTED_REELS.save(true);
        for (HushfacebookPause.Reason why : new HushfacebookPause.Reason[]{
                HushfacebookPause.Reason.SWITCH, HushfacebookPause.Reason.CRASH_LOOP,
                HushfacebookPause.Reason.MARKER_FILE}) {
            PauseForTests.pause(why);
            assertSame(why + " hid a reel", page, GenAiReelFilter.withoutAiReels(page, MODEL, NO_ATTRIBUTION, NO_STORY_INFO));
            assertEquals(why + " read a tree", 0, model.treeReads);
        }
        assertNull("the rule counted an item while off or paused", line(GenAiReelFilter.ITEMS_ROUTE));

        PauseForTests.resume();
        assertTrue("the rule didn't come back after the pause",
                GenAiReelFilter.withoutAiReels(page, MODEL, NO_ATTRIBUTION, NO_STORY_INFO).isEmpty());
    }

    /** A build whose TreeJNI lost getTree(int) keeps every tab item and names what's missing. */
    @Test
    public void aBuildWithoutTheTreeReaderKeepsEveryTabItem() {
        Settings.HIDE_AI_DETECTED_REELS.save(true);
        GenAiReelFilter.Readers full = GenAiReelFilter.Readers.lookUp(MODEL, GenAiReelTreeTest.class.getClassLoader());
        assertTrue("the stand-in TreeJNI has no getTree(int)", full.treeValue != null);
        GenAiReelFilter.READERS.put(MODEL, new GenAiReelFilter.Readers(full.model, full.story, full.tree,
                full.booleanValue, full.hasField, full.valid, null));

        keeps("a flagged tab item", item(reel(info(true)), null));

        assertEquals(GenAiReelFilter.ITEMS_ROUTE + ": 1 lists, 1 items, 0 removed. Kinds: tree reader missing 1",
                line(GenAiReelFilter.ITEMS_ROUTE));
        assertTrue(HookStatus.missing(FamilyNames.AI_DETECTED_REELS).toString(),
                HookStatus.missing(FamilyNames.AI_DETECTED_REELS)
                        .contains("method " + GenAiReelFilter.TREE_CLASS + "#getTree(int)"));
    }
}
