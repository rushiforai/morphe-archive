/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.menu;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import com.facebook.graphservice.tree.TreeJNI;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.ArrayList;
import java.util.Arrays;
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
 * The hook after the Menu's shortcut section reads its bookmarks: with the switch on, the bookmark
 * named Meta AI leaves the list and every other one stays in Facebook's order. Off, paused, before
 * the settings are ready, or for a list without it, the list handed in comes back as it is.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class MenuShortcutsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static TreeJNI bookmark(String name) {
        return new TreeJNI().with("name", name);
    }

    /** The shortcut rows as a phone showed them on 2026-10-15, with two of See more's after them. */
    private static List<Object> menu() {
        return new ArrayList<>(Arrays.asList(bookmark("Feeds"), bookmark("Marketplace"), bookmark("Reels"),
                bookmark("Groups"), bookmark("Meta AI"), bookmark("Events"), bookmark("Memories")));
    }

    private static List<String> names(List<?> bookmarks) {
        List<String> names = new ArrayList<>();
        for (Object bookmark : bookmarks) names.add(((TreeJNI) bookmark).getString(MenuShortcuts.NAME));
        return names;
    }

    private static String line(List<String> report, String prefix) {
        for (String line : report) {
            if (line.startsWith(prefix + ":")) return line;
        }
        return null;
    }

    @Before
    public void startClean() {
        FeedFilterCounters.clear();
        HookStatus.clear();
        MenuTiles.forgetForTests();
        Settings.HIDE_MENU_META_AI.save(true);
    }

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.HIDE_MENU_META_AI.resetToDefault();
        Settings.HIDDEN_MENU_TILES.resetToDefault();
        Settings.SEEN_MENU_TILES.resetToDefault();
        MenuTiles.forgetForTests();
        FeedFilterCounters.clear();
        HookStatus.clear();
    }

    private static TreeJNI tile(String name, String link) {
        return new TreeJNI().with("name", name).with("url", link);
    }

    /** The first eight of 583's Menu and three that share a route, as the hook read them on 2026-10-19. */
    private static List<Object> menu583() {
        return new ArrayList<>(Arrays.asList(tile("Feeds", MenuTilesTest.FEEDS),
                tile("Marketplace", "fb://marketplace/?referralSurface=bookmark"), tile("Reels", MenuTilesTest.REELS),
                tile("Groups", "fb://groups/tab?source=bookmark"),
                tile("Meta AI", "fb://gen_ai_chat/?as_bottom_sheet=0&entry_point=fb_feed%3Ameta_ai_bookmark"),
                tile("Birthdays", MenuTilesTest.BIRTHDAYS), tile("Saved", "fb://saved/?section_name=ALL&referer=29"),
                tile("Memories", "fb://memories_home/?source=bookmark"), tile("Crisis response", MenuTilesTest.CRISIS_RESPONSE),
                tile("Pages", MenuTilesTest.PAGES), tile("Community Notes", MenuTilesTest.COMMUNITY_NOTES)));
    }

    /**
     * #153: Feeds, Reels, Birthdays and Pages ticked in 0.15.0's list leave 583's Menu, and the
     * tiles that share Birthdays' and Pages' routes stay.
     */
    @Test
    public void the583MenuLosesTheTickedTilesAndOnlyThose() {
        Settings.HIDE_MENU_META_AI.save(false);
        Settings.HIDDEN_MENU_TILES.save("feeds,reels,birthdays,pages");
        assertEquals(Arrays.asList("Marketplace", "Groups", "Meta AI", "Saved", "Memories", "Crisis response",
                "Community Notes"), names(MenuShortcuts.kept(menu583())));
        MenuTiles.hide(Arrays.asList("memories_home", "crisis_response"));
        assertEquals(Arrays.asList("Feeds", "Marketplace", "Reels", "Groups", "Meta AI", "Birthdays", "Saved", "Pages",
                "Community Notes"), names(MenuShortcuts.kept(menu583())));
    }

    /** Reading the Menu writes its tiles down for the list, in order and by name, without Meta AI. */
    @Test
    public void readingTheMenuWritesDownItsTilesWithoutMetaAi() {
        Settings.HIDE_MENU_META_AI.save(false);
        List<Object> bookmarks = menu583();
        assertSame("nothing ticked, the list isn't Facebook's", bookmarks, MenuShortcuts.kept(bookmarks));
        assertEquals("recent_feed=Feeds\nmarketplace=Marketplace\nwatch=Reels\ngroups=Groups\n"
                        + "meta_birthday_center=Birthdays\nsaved=Saved\nmemories_home=Memories\n"
                        + "crisis_response=Crisis response\npages=Pages\ncommunity_notes_rating=Community Notes",
                Settings.SEEN_MENU_TILES.savedValue());
        assertEquals("recent_feed", MenuTiles.choices().get(0));
        assertFalse(MenuTiles.choices().contains("gen_ai_chat"));
        assertEquals("Community Notes", MenuTiles.label("community_notes_rating"));
    }

    /** The rows as a phone showed them, each with the deep link it opens. */
    private static List<Object> linkedMenu() {
        return new ArrayList<>(Arrays.asList(tile("Feeds", "fb://feeds"), tile("Marketplace", "fb://marketplace_tab"),
                tile("Reels", "fb://reels_tab"), tile("Gaming", "https://www.facebook.com/gaming/"),
                tile("Meta AI", "fb://meta_ai"), tile("Events", "fb://events")));
    }

    /** Marketplace and Gaming go by their links, whatever the Menu calls them, and the rest keep their order. */
    @Test
    public void pickedTilesLeaveByTheirLinkAndTheRestKeepTheirOrder() {
        Settings.HIDE_MENU_META_AI.save(false);
        MenuTiles.hide(Arrays.asList("marketplace", "gaming"));
        assertEquals(Arrays.asList("Feeds", "Reels", "Meta AI", "Events"), names(MenuShortcuts.kept(linkedMenu())));
        List<Object> translated = new ArrayList<>(Arrays.asList(tile("Mercado", "fb://marketplace"), tile("Feeds", "fb://feeds")));
        assertEquals(Collections.singletonList("Feeds"), names(MenuShortcuts.kept(translated)));
        List<Object> sameLabelOtherLink = new ArrayList<>(Arrays.asList(tile("Marketplace", "fb://other"), tile("Feeds", "fb://feeds")));
        assertSame("a tile with the label but another link went", sameLabelOtherLink, MenuShortcuts.kept(sameLabelOtherLink));
    }

    /**
     * #224: 584's Finds bookmark has no link, its server sends the route, so it goes by the id of
     * the app it bookmarks, and a folder with neither is passed over.
     */
    @Test
    public void aTileWithNoLinkGoesByWhatItBookmarks() {
        Settings.HIDE_MENU_META_AI.save(false);
        TreeJNI finds = new TreeJNI().with("name", "Finds")
                .with("bookmarked_node", new TreeJNI("Application").with("id", "204127677323356"));
        TreeJNI folder = new TreeJNI("FolderBookmark").with("name", "Featured");
        List<Object> menu = new ArrayList<>(Arrays.asList(tile("Feeds", "fb://feeds"), finds, folder,
                tile("Saved", "fb://saved/?section_name=ALL")));
        assertSame("nothing ticked, the list isn't Facebook's", menu, MenuShortcuts.kept(menu));
        assertEquals("feeds=Feeds\napp_204127677323356=Finds\nsaved=Saved", Settings.SEEN_MENU_TILES.savedValue());
        assertEquals("Finds", MenuTiles.label(MenuTiles.FINDS));
        MenuTiles.hide(Collections.singletonList(MenuTiles.FINDS));
        assertEquals(Arrays.asList("Feeds", "Featured", "Saved"), names(MenuShortcuts.kept(menu)));
        TreeJNI released = new TreeJNI().with("name", "Finds")
                .with("bookmarked_node", new TreeJNI("Application").with("id", "204127677323356")).releasedTree();
        List<Object> gone = new ArrayList<>(Arrays.asList(released, tile("Feeds", "fb://feeds")));
        assertSame("a released bookmark isn't read", gone, MenuShortcuts.kept(gone));
        assertFalse(released.readAfterRelease);
    }

    /** Unticking brings the tile back, and a list with none of the picked tiles comes back as it is. */
    @Test
    public void untickedTheTileIsBackAndNoMatchLeavesTheListAlone() {
        Settings.HIDE_MENU_META_AI.save(false);
        List<Object> bookmarks = linkedMenu();
        assertSame(bookmarks, MenuShortcuts.kept(bookmarks));
        MenuTiles.hide(Collections.singletonList("marketplace"));
        assertEquals(5, MenuShortcuts.kept(bookmarks).size());
        MenuTiles.hide(Collections.<String>emptyList());
        assertSame(bookmarks, MenuShortcuts.kept(bookmarks));
        MenuTiles.hide(Collections.singletonList("jobs"));
        assertSame(bookmarks, MenuShortcuts.kept(bookmarks));
    }

    /** Both ways work in one pass, each counted under its own name. */
    @Test
    public void metaAiAndPickedTilesLeaveTogetherAndAreCountedApart() {
        MenuTiles.hide(Collections.singletonList("gaming"));
        assertEquals(Arrays.asList("Feeds", "Marketplace", "Reels", "Events"), names(MenuShortcuts.kept(linkedMenu())));
        String counters = line(FeedFilterCounters.report(), MenuShortcuts.ROUTE);
        assertNotNull(counters);
        assertTrue(counters, counters.contains(MenuShortcuts.HIDDEN + " 1"));
        assertTrue(counters, counters.contains(MenuShortcuts.TILE_HIDDEN + " 1"));
    }

    /** Paused, or a released model, and the picked tiles stay too. */
    @Test
    public void pausedOrReleasedPickedTilesStay() {
        Settings.HIDE_MENU_META_AI.save(false);
        MenuTiles.hide(Collections.singletonList("marketplace"));
        List<Object> bookmarks = linkedMenu();
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        assertSame(bookmarks, MenuShortcuts.kept(bookmarks));
        PauseForTests.resume();
        TreeJNI released = tile("Marketplace", "fb://marketplace").releasedTree();
        List<Object> one = new ArrayList<>(Arrays.asList(tile("Feeds", "fb://feeds"), released));
        assertSame(one, MenuShortcuts.kept(one));
        assertFalse("a released model was read", released.readAfterRelease);
    }

    @Test
    public void theSwitchStartsOff() {
        Settings.HIDE_MENU_META_AI.resetToDefault();
        assertFalse("the Meta AI shortcut switch starts on", Settings.HIDE_MENU_META_AI.get());
        List<Object> bookmarks = menu();
        assertSame(bookmarks, MenuShortcuts.kept(bookmarks));
    }

    /** The rest keep their order, so the first of See more's moves up into the fifth row. */
    @Test
    public void onTheMetaAiShortcutLeavesAndTheRestKeepTheirOrder() {
        assertEquals(Arrays.asList("Feeds", "Marketplace", "Reels", "Groups", "Events", "Memories"),
                names(MenuShortcuts.kept(menu())));
    }

    @Test
    public void aListWithoutItComesBackAsItIs() {
        List<Object> bookmarks = new ArrayList<>(Arrays.asList(bookmark("Feeds"), bookmark("Meta AI Studio fans"),
                bookmark("Groups")));
        assertSame(bookmarks, MenuShortcuts.kept(bookmarks));
        List<Object> empty = Collections.emptyList();
        assertSame(empty, MenuShortcuts.kept(empty));
        assertNull(MenuShortcuts.kept(null));
    }

    @Test
    public void theNameIsMatchedWholeWhateverItsCase() {
        assertTrue(MenuShortcuts.isMetaAiName("Meta AI"));
        assertTrue(MenuShortcuts.isMetaAiName(" meta ai "));
        assertFalse(MenuShortcuts.isMetaAiName("Meta AI Studio"));
        assertFalse(MenuShortcuts.isMetaAiName("Meta"));
        assertFalse(MenuShortcuts.isMetaAiName(""));
        assertFalse(MenuShortcuts.isMetaAiName(null));
    }

    @Test
    public void offOrPausedTheListIsFacebooks() {
        Settings.HIDE_MENU_META_AI.save(false);
        List<Object> bookmarks = menu();
        assertSame(bookmarks, MenuShortcuts.kept(bookmarks));
        Settings.HIDE_MENU_META_AI.save(true);

        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        assertSame(bookmarks, MenuShortcuts.kept(bookmarks));
        PauseForTests.pause(HushfacebookPause.Reason.CRASH_LOOP);
        assertSame(bookmarks, MenuShortcuts.kept(bookmarks));
        PauseForTests.resume();
        assertEquals(6, MenuShortcuts.kept(bookmarks).size());
    }

    @Test
    public void untilTheSettingsAreReadyTheListIsFacebooks() {
        List<Object> bookmarks = menu();
        Object[] kept = new Object[2];
        SettingsContextRule.withoutContext(() -> kept[0] = MenuShortcuts.kept(bookmarks));
        SettingsContextRule.beforeThePauseIsDecided(() -> kept[1] = MenuShortcuts.kept(bookmarks));
        assertSame(bookmarks, kept[0]);
        assertSame(bookmarks, kept[1]);
    }

    /** A released model is never read, and whatever isn't a model is left where it is. */
    @Test
    public void aReleasedModelOrAnythingElseStays() {
        TreeJNI released = bookmark("Meta AI").releasedTree();
        List<Object> bookmarks = new ArrayList<>(Arrays.asList(bookmark("Feeds"), released, "Meta AI", null));
        assertSame(bookmarks, MenuShortcuts.kept(bookmarks));
        assertFalse("a released model was read", released.readAfterRelease);
    }

    @Test
    public void theReportCountsTheBookmarksAskedAboutAndTheShortcutHidden() {
        MenuShortcuts.kept(menu());
        String counters = line(FeedFilterCounters.report(), MenuShortcuts.ROUTE);
        assertNotNull(FeedFilterCounters.report().toString(), counters);
        assertTrue(counters, counters.startsWith(MenuShortcuts.ROUTE + ": 1 lists, 7 items, 1 removed."));
        assertTrue(counters, counters.contains("Removed: " + MenuShortcuts.HIDDEN + " 1"));
        assertEquals(FamilyNames.MENU_PROMOTIONS + ": invoked 1, 1 found, 0 missing",
                line(HookStatus.report(), FamilyNames.MENU_PROMOTIONS));
    }
}
