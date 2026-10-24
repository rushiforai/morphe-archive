/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.menu;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

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
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;

/** The Menu tiles list (#153): what a deep link keys to, and how the saved list is read and kept. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class MenuTilesTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before
    public void startClean() {
        MenuTiles.forgetForTests();
    }

    @After
    public void restore() {
        Settings.HIDDEN_MENU_TILES.resetToDefault();
        Settings.SEEN_MENU_TILES.resetToDefault();
        MenuTiles.forgetForTests();
    }

    /** Links as 583's Menu handed them to the hook on 2026-10-19, cut where nothing after counts. */
    static final String FEEDS = "fb://recent_feed/?source=tab";
    static final String REELS = "fb://watch/";
    static final String BIRTHDAYS = "fb://bloks_screen/?bloks_screen_id=com.bloks.www.meta.birthday_center"
            + "&bloks_screen_options=%7B%22ttrc_marker_id%22%3A719983200%7D";
    static final String CRISIS_RESPONSE = "fb://bloks_screen_query/?app_id=com.bloks.www.bloks.crisis_response"
            + ".BloksCrisisResponseBookmarkScreenQuery&bloks_screen_options=%7B%22cache_ttl%22%3A3600%7D";
    static final String COMMUNITY_NOTES = "fb://bloks_screen_query/?app_id=com.bloks.www.community_notes.rating"
            + "&bloks_screen_options=%7B%22cache_ttl%22%3A3600%7D";
    static final String PAGES = "fb://nt_screen/FB-SCREEN-FB?a=%7B%22title%22%3A%22Pages%22%7D"
            + "&p=%2Fpages%2Fnt_launchpoint_redesign%2Fhomescreen%2F&q=%7B%22ref%22%3A%22bookmark%22%7D&b=%5B%5D";

    /** Each of 583's tiles keys to its own word, the ones behind a shared route by the screen they open. */
    @Test
    public void the583MenusLinksEachKeyToTheirOwnTile() {
        assertEquals("recent_feed", MenuTiles.keyOf(FEEDS));
        assertEquals("watch", MenuTiles.keyOf(REELS));
        assertEquals("meta_birthday_center", MenuTiles.keyOf(BIRTHDAYS));
        assertEquals("crisis_response", MenuTiles.keyOf(CRISIS_RESPONSE));
        assertEquals("community_notes_rating", MenuTiles.keyOf(COMMUNITY_NOTES));
        assertEquals("pages", MenuTiles.keyOf(PAGES));
        assertEquals("memories_home", MenuTiles.keyOf("fb://memories_home/?source=bookmark"));
        assertEquals("gemstone", MenuTiles.keyOf("fbinternal://gemstone/?entry_point=BOOKMARK"));
        assertEquals("fb_avatar_editor", MenuTiles.keyOf("fb-avatar://fb_avatar_editor/?surface=bookmarks"));
        assertEquals("friends", MenuTiles.keyOf("fb://friends/home?source_ref=FIND_FRIENDS_BOOKMARK"));
        for (String key : Arrays.asList("recent_feed", "watch", "meta_birthday_center", "memories_home", "gemstone")) {
            assertTrue(key + " isn't offered before the Menu is seen", MenuTiles.CATALOG.contains(key));
        }
    }

    /** A shared route whose screen can't be read keys to nothing, so it never hides the others behind it. */
    @Test
    public void aSharedRouteWithoutItsScreenKeysToNothing() {
        assertNull(MenuTiles.keyOf("fb://bloks_screen/"));
        assertNull(MenuTiles.keyOf("fb://bloks_screen/?bloks_screen_options=%7B%7D"));
        assertNull(MenuTiles.keyOf("fb://bloks_screen_query/?app_id="));
        assertNull(MenuTiles.keyOf("fb://bloks_screen_query/?app_id=com.bloks.www.BloksOnlyAClass"));
        assertNull(MenuTiles.keyOf("fb://nt_screen/FB-SCREEN-FB?p=%2F"));
        assertNull(MenuTiles.keyOf("fb://nt_screen/FB-SCREEN-FB?p=%ZZpages"));
        assertEquals("pages", MenuTiles.keyOf("fb://nt_screen/FB-SCREEN-FB?p=%2Fpages%2F#p=%2Fgroups%2F"));
    }

    /** 0.15.0's guessed keys still hide what was ticked: Feeds, Reels, Memories, Birthdays and Dating. */
    @Test
    public void aListSavedWithTheOldGuessedKeysHidesTheRealTiles() {
        Settings.HIDDEN_MENU_TILES.save("feeds,reels,memories,birthdays,dating,gaming,watch");
        List<String> real = Arrays.asList("recent_feed", "watch", "memories_home", "meta_birthday_center", "gemstone",
                "gaming");
        assertEquals(real, new ArrayList<>(MenuTiles.hidden()));
        assertEquals(real, new ArrayList<>(MenuTiles.hiddenNow()));
        assertTrue(MenuTiles.choices().containsAll(real));
        assertFalse(MenuTiles.choices().contains("feeds"));
    }

    /** Once the Menu is seen the list offers its tiles, in its order and words, and keeps an older pick. */
    @Test
    public void theTilesTheMenuShowedAreOfferedByTheirOwnNames() {
        Map<String, String> shown = new LinkedHashMap<>();
        shown.put("recent_feed", "Fils");
        shown.put("pokes_dashboard", "Pokes");
        shown.put("crisis_response", "Crisis response");
        MenuTiles.remember(shown);
        assertEquals("recent_feed=Fils\npokes_dashboard=Pokes\ncrisis_response=Crisis response",
                Settings.SEEN_MENU_TILES.savedValue());
        Settings.HIDDEN_MENU_TILES.save("jobs");
        assertEquals(Arrays.asList("recent_feed", "pokes_dashboard", "crisis_response", "jobs"), MenuTiles.choices());
        assertEquals("Fils", MenuTiles.label("recent_feed"));
        assertEquals("Pokes", MenuTiles.label("pokes_dashboard"));
        assertEquals("Jobs", MenuTiles.label("jobs"));

        MenuTiles.forgetForTests();
        assertEquals("a fresh start read the written-down tiles back", "Fils", MenuTiles.label("recent_feed"));
        Map<String, String> renamed = new LinkedHashMap<>();
        renamed.put("events", "Events");
        renamed.put("recent_feed", "Feeds");
        MenuTiles.remember(renamed);
        assertEquals("recent_feed=Feeds\npokes_dashboard=Pokes\ncrisis_response=Crisis response\nevents=Events",
                Settings.SEEN_MENU_TILES.savedValue());
    }

    /** The written-down list stays small and one tile a line, whatever a name or the setting holds. */
    @Test
    public void theWrittenDownListStaysBoundedAndOneTileALine() {
        Map<String, String> many = new LinkedHashMap<>();
        for (int i = 0; i < MenuTiles.SEEN_LIMIT + 10; i++) many.put("tile_" + i, "Tile " + i);
        many.put("long", "Name over two\nlines " + new String(new char[100]).replace('\0', 'x'));
        MenuTiles.remember(many);
        Map<String, String> kept = MenuTiles.parseSeen(Settings.SEEN_MENU_TILES.savedValue());
        assertEquals(MenuTiles.SEEN_LIMIT, kept.size());
        assertFalse(kept.containsKey("long"));
        String name = MenuTiles.cleanName("Name over two\nlines " + new String(new char[100]).replace('\0', 'x'));
        assertEquals(MenuTiles.NAME_CHARS, name.length());
        assertTrue(name.startsWith("Name over two lines x"));
        assertNull(MenuTiles.cleanName(" \n "));
        Map<String, String> read = MenuTiles.parseSeen("gaming=Games\nBad Key=No\n=Nameless\nkeyless\nsaved=\nwatch=Reels=Videos");
        assertEquals(Arrays.asList("gaming", "watch"), new ArrayList<>(read.keySet()));
        assertEquals("Reels=Videos", read.get("watch"));
    }

    @Test
    public void aDeepLinkKeysToItsFirstWord() {
        assertEquals("marketplace", MenuTiles.keyOf("fb://marketplace"));
        assertEquals("marketplace", MenuTiles.keyOf("fb://marketplace_tab"));
        assertEquals("gaming", MenuTiles.keyOf("FB://Gaming/home?ref=menu"));
        assertEquals("marketplace", MenuTiles.keyOf("https://www.facebook.com/marketplace/"));
        assertEquals("watch", MenuTiles.keyOf("https://m.facebook.com/watch/?ref=bookmarks#top"));
        assertEquals("groups", MenuTiles.keyOf("https://facebook.com//groups/feed&x=1"));
    }

    @Test
    public void aLinkWithNoWordOrNotFacebooksKeysToNothing() {
        assertNull(MenuTiles.keyOf(null));
        assertNull(MenuTiles.keyOf(""));
        assertNull(MenuTiles.keyOf("marketplace"));
        assertNull(MenuTiles.keyOf("fb://"));
        assertNull(MenuTiles.keyOf("fb://?a=b"));
        assertNull(MenuTiles.keyOf("https://example.com/marketplace"));
        assertNull(MenuTiles.keyOf("https://notfacebook.com/marketplace"));
        assertNull(MenuTiles.keyOf("fb://Market place"));
    }

    /** 584's Finds has no link, so it keys by Facebook's id for the app it bookmarks (#224). */
    @Test
    public void aTileWithNoLinkKeysByTheAppItBookmarks() {
        assertEquals(MenuTiles.FINDS, MenuTiles.appKey("204127677323356"));
        assertEquals("app_7", MenuTiles.appKey(" 7 "));
        assertEquals("Finds", MenuTiles.label(MenuTiles.FINDS));
        assertEquals("App 7", MenuTiles.label("app_7"));
        assertEquals(MenuTiles.Hidden.SAVED, MenuTiles.hide(Collections.singletonList(MenuTiles.FINDS)));
        assertEquals(Collections.singleton(MenuTiles.FINDS), MenuTiles.hidden());
        assertTrue(MenuTiles.choices().contains(MenuTiles.FINDS));
        assertNull(MenuTiles.appKey(null));
        assertNull(MenuTiles.appKey(""));
        assertNull(MenuTiles.appKey("0"));
        assertNull(MenuTiles.appKey("-204127677323356"));
        assertNull(MenuTiles.appKey("204127677323356x"));
        assertNull(MenuTiles.appKey("12345678901234567890"));
    }

    @Test
    public void thePickedKeysAreSavedCleanAndKeepOrder() {
        assertEquals(MenuTiles.Hidden.SAVED, MenuTiles.hide(Arrays.asList("gaming", "marketplace")));
        assertEquals("gaming,marketplace", Settings.HIDDEN_MENU_TILES.savedValue());
        assertEquals(Arrays.asList("gaming", "marketplace"), new ArrayList<>(MenuTiles.hidden()));
        assertEquals(MenuTiles.Hidden.SAVED, MenuTiles.hide(Collections.<String>emptyList()));
        assertEquals("", Settings.HIDDEN_MENU_TILES.savedValue());
    }

    @Test
    public void aListThatIsntCleanIsCleanedAndAKeyNotInTheCatalogIsKept() {
        assertEquals("gaming,new_tile", MenuTiles.clean("gaming, ,Bad Key,gaming,new_tile"));
        assertTrue(MenuTiles.isClean("gaming,new_tile"));
        assertFalse(MenuTiles.isClean("gaming,gaming"));
        assertFalse(MenuTiles.isClean(null));
        assertEquals(2, MenuTiles.count("gaming,new_tile"));
        Settings.HIDDEN_MENU_TILES.save("new_tile");
        assertTrue(MenuTiles.choices().containsAll(MenuTiles.CATALOG));
        assertTrue(MenuTiles.choices().contains("new_tile"));
    }

    @Test
    public void aListTooLongForTheSettingSavesNothing() {
        List<String> keys = new ArrayList<>();
        for (int i = 0; i < 100; i++) keys.add("tile_number_" + i);
        assertEquals(MenuTiles.Hidden.NO_ROOM, MenuTiles.hide(keys));
        assertEquals("", Settings.HIDDEN_MENU_TILES.savedValue());
    }

    /** A Help or Settings row keys by its group and Facebook's id; ours, with negative ids, never key. */
    @Test
    public void aRowKeysByItsGroupAndIdAndOursNever() {
        assertEquals("help_1188456", MenuTiles.rowKey(MenuTiles.HELP, 1188456));
        assertEquals("settings_" + Long.MAX_VALUE, MenuTiles.rowKey(MenuTiles.SETTINGS, Long.MAX_VALUE));
        assertNull(MenuTiles.rowKey(MenuTiles.HELP, 0));
        assertNull(MenuTiles.rowKey(MenuTiles.SETTINGS, MenuSettingsRow.ROW_ID));
        assertNull(MenuTiles.rowKey(MenuTiles.SETTINGS, MenuSettingsRow.SAVED_ROW_ID));
        assertTrue(MenuTiles.isRowKey("help_12"));
        assertFalse("a tile's key isn't a row's", MenuTiles.isRowKey("help_center"));
        assertFalse(MenuTiles.isRowKey("settings_0"));
        assertFalse(MenuTiles.isRowKey("gaming_12"));
        assertEquals("rows are kept like tiles", "help_12,gaming,settings_99", MenuTiles.clean("help_12,gaming,settings_99"));
        assertEquals("Settings and privacy: 42", MenuTiles.label("settings_42"));
    }

    /** Every row of both groups fits beside every tile of the catalog. */
    @Test
    public void everyRowOfBothGroupsFitsBesideTheCatalog() {
        List<String> keys = new ArrayList<>(MenuTiles.CATALOG);
        for (int i = 0; i < 30; i++) keys.add(MenuTiles.rowKey(i % 2 == 0 ? MenuTiles.HELP : MenuTiles.SETTINGS, 0x438c058b24a72L + i));
        assertEquals(MenuTiles.Hidden.SAVED, MenuTiles.hide(keys));
        assertEquals(keys, new ArrayList<>(MenuTiles.hidden()));
    }

    /** Rows seen before any tile leave the catalog offered, and the tiles come first whatever the order seen. */
    @Test
    public void tilesComeFirstThenHelpThenSettings() {
        Map<String, String> shown = new LinkedHashMap<>();
        shown.put("settings_5", "Orders and payments");
        shown.put("help_9", "Report a problem");
        shown.put("gaming", "Gaming");
        shown.put("help_3", "Support");
        MenuTiles.remember(shown);
        assertEquals(Arrays.asList("gaming", "help_9", "help_3", "settings_5"), MenuTiles.choices());
        assertEquals("Help and support: Support", MenuTiles.label("help_3"));
    }

    @Test
    public void everyCatalogTileHasAReadableLabel() {
        for (String key : MenuTiles.CATALOG) {
            assertFalse(key, MenuTiles.label(key).isEmpty());
            assertFalse(key + " is labeled with its key", MenuTiles.label(key).equals(key));
        }
        assertEquals("New tile", MenuTiles.label("new_tile"));
    }
}
