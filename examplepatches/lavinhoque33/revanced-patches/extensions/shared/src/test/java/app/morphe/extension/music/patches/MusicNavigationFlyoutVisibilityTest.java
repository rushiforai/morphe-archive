/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-20.
 */
package app.morphe.extension.music.patches;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.content.pm.PackageInfo;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;

import java.util.List;

import app.morphe.extension.music.patches.flyout.FlyoutPatch;
import app.morphe.extension.music.patches.navigation.NavigationPatch;
import app.morphe.extension.music.settings.Settings;
import app.morphe.extension.shared.utils.Utils;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 28)
public class MusicNavigationFlyoutVisibilityTest {
    private record Tab(String rvxPivotBrowseId) implements NavigationPatch.PivotTab { }

    private enum Icon {
        PERSON_CIRCLE_SLASH, HIDE, ARTIST, ADD_TO_PLAYLIST, OFFLINE_DOWNLOAD, QUEUE_MUSIC, FLAG, PERSON_CIRCLE
    }

    @Before
    public void setUp() {
        var context = RuntimeEnvironment.getApplication();
        PackageInfo packageInfo = new PackageInfo();
        packageInfo.packageName = context.getPackageName();
        packageInfo.versionName = "9.40.51";
        packageInfo.applicationInfo = context.getApplicationInfo();
        Shadows.shadowOf(context.getPackageManager()).installPackage(packageInfo);
        Utils.setContext(context);
        Settings.HIDE_NAVIGATION_SEARCH_TAB.resetToDefault();
        Settings.HIDE_SEARCH_BUTTON.resetToDefault();
        Settings.REPLACE_NAVIGATION_SAMPLES_BUTTON.resetToDefault();
        Settings.HIDE_FLYOUT_MENU_DONT_RECOMMEND_ARTIST.resetToDefault();
        Settings.HIDE_FLYOUT_MENU_NOT_INTERESTED.resetToDefault();
        Settings.HIDE_FLYOUT_MENU_GO_TO_ARTIST.resetToDefault();
    }

    @Test
    public void defaultsKeepTheStockTabListAndMenuRows() {
        var tabs = List.of(new Tab("FEmusic_home"), new Tab("FEsearch"), new Tab("FEmusic_search"));
        assertSame(tabs, NavigationPatch.filterSearchTab(tabs));
        assertSame(tabs, NavigationPatch.filterLegacySearchTab(tabs));
        for (Icon icon : Icon.values()) {
            assertFalse(icon.name(), FlyoutPatch.hideComponentsWithArtistRule(icon));
        }
    }

    @Test
    public void searchTabFilteringKeepsTheVersionSpecificIdAndAdjacentTabsDistinct() {
        Settings.HIDE_NAVIGATION_SEARCH_TAB.save(true);
        Settings.REPLACE_NAVIGATION_SAMPLES_BUTTON.save(true);
        Settings.HIDE_SEARCH_BUTTON.save(false);

        var home = new Tab("FEmusic_home");
        var samples = new Tab("FEmusic_immersive");
        var explore = new Tab("FEmusic_explore");
        var library = new Tab("FEmusic_library_landing");
        var legacySearch = new Tab("FEmusic_search");
        var search = new Tab("FEsearch");
        var similarId = new Tab("FEsearch_more");
        var tabs = List.of(home, search, samples, explore, legacySearch, library, similarId);

        assertEquals(List.of(home, samples, explore, legacySearch, library, similarId),
                NavigationPatch.filterSearchTab(tabs));
        assertEquals(List.of(home, search, samples, explore, library, similarId),
                NavigationPatch.filterLegacySearchTab(tabs));
        assertEquals(List.of(home, search, samples, explore, legacySearch, library, similarId), tabs);
        assertTrue(Settings.REPLACE_NAVIGATION_SAMPLES_BUTTON.get());
        assertFalse(Settings.HIDE_SEARCH_BUTTON.get());

        Settings.HIDE_NAVIGATION_SEARCH_TAB.save(false);
        Settings.HIDE_SEARCH_BUTTON.save(true);
        assertSame(tabs, NavigationPatch.filterSearchTab(tabs));
        assertSame(tabs, NavigationPatch.filterLegacySearchTab(tabs));
    }

    @Test
    public void noNativeSearchTabOrNoRecognizedModelLeavesTheOriginalList() {
        Settings.HIDE_NAVIGATION_SEARCH_TAB.save(true);
        var noSearch = List.of(new Tab("FEmusic_home"), new Tab(null), "FEsearch", "FEmusic_search");
        assertSame(noSearch, NavigationPatch.filterSearchTab(noSearch));
        assertSame(noSearch, NavigationPatch.filterLegacySearchTab(noSearch));
        assertNull(NavigationPatch.filterSearchTab(null));
        assertNull(NavigationPatch.filterLegacySearchTab(null));
    }

    @Test
    public void artistRuleSkipsOnlyItsOwnRowAndCannotActivateOnTheLegacyHook() {
        Settings.HIDE_FLYOUT_MENU_DONT_RECOMMEND_ARTIST.save(true);
        assertTrue(FlyoutPatch.hideComponentsWithArtistRule(Icon.PERSON_CIRCLE_SLASH));
        assertFalse(FlyoutPatch.hideComponents(Icon.PERSON_CIRCLE_SLASH));
        assertFalse(FlyoutPatch.hideComponentsWithArtistRule(null));

        for (Icon icon : Icon.values()) {
            if (icon != Icon.PERSON_CIRCLE_SLASH) {
                assertFalse(icon.name(), FlyoutPatch.hideComponentsWithArtistRule(icon));
                assertFalse(icon.name(), FlyoutPatch.hideComponents(icon));
            }
        }

        Settings.HIDE_FLYOUT_MENU_DONT_RECOMMEND_ARTIST.save(false);
        Settings.HIDE_FLYOUT_MENU_NOT_INTERESTED.save(true);
        assertTrue(FlyoutPatch.hideComponentsWithArtistRule(Icon.HIDE));
        assertTrue(FlyoutPatch.hideComponents(Icon.HIDE));
        assertFalse(FlyoutPatch.hideComponentsWithArtistRule(Icon.PERSON_CIRCLE_SLASH));
        assertFalse(FlyoutPatch.hideComponentsWithArtistRule(Icon.ARTIST));

        Settings.HIDE_FLYOUT_MENU_NOT_INTERESTED.save(false);
        Settings.HIDE_FLYOUT_MENU_GO_TO_ARTIST.save(true);
        assertTrue(FlyoutPatch.hideComponentsWithArtistRule(Icon.ARTIST));
        assertTrue(FlyoutPatch.hideComponents(Icon.ARTIST));
        assertFalse(FlyoutPatch.hideComponentsWithArtistRule(Icon.HIDE));
        assertFalse(FlyoutPatch.hideComponentsWithArtistRule(Icon.PERSON_CIRCLE_SLASH));
    }
}
