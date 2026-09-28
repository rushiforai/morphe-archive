/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.menu;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.List;

import app.morphe.extension.facebook.menu.MenuSectionsForTests.Group;
import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.FeedFilterCounters;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/**
 * The hooks in the two sections of every Menu group: the Upgrades and Also from Meta groups build
 * nothing while their switches are on, each by its own switch, and every other group, and every
 * group while paused or before the settings are ready, builds as Facebook built it.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class MenuSectionsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before
    public void startClean() {
        MenuSectionsForTests.newProcess();
        FeedFilterCounters.clear();
        HookStatus.clear();
    }

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.HIDE_MENU_UPGRADES.resetToDefault();
        Settings.HIDE_MENU_ALSO_FROM_META.resetToDefault();
        MenuSectionsForTests.newProcess();
        FeedFilterCounters.clear();
        HookStatus.clear();
    }

    private static String line(List<String> report, String prefix) {
        for (String line : report) {
            if (line.startsWith(prefix + ":")) return line;
        }
        return null;
    }

    @Test
    public void bothSwitchesStartOnAndHideTheirGroupsInBothSections() {
        assertTrue("the Upgrades switch starts off", Settings.HIDE_MENU_UPGRADES.get());
        assertTrue("the Also from Meta switch starts off", Settings.HIDE_MENU_ALSO_FROM_META.get());
        assertTrue(MenuSectionsForTests.hidesUpgrades());
        assertTrue(MenuSectionsForTests.hidesAlsoFromMeta());
        assertTrue(MenuSectionsForTests.hidesServerUpgrades());
        assertTrue(MenuSectionsForTests.hidesServerAlsoFromMeta());
    }

    /** Settings, Help and support, Log out, the shortcuts and the rest are never the patch's to hide. */
    @Test
    public void everyOtherGroupBuildsAsFacebookBuiltIt() {
        for (Group group : Group.values()) {
            if (group == Group.UPSELL || group == Group.PRODUCTS_FROM_FACEBOOK) continue;
            assertFalse(group + " was hidden", MenuSections.hideSection(group));
            assertFalse(group + "'s server part was hidden", MenuSections.hideServerSection(group));
            assertNull(group + " has a switch", MenuSections.switchFor(group.name()));
        }
        assertSame(Settings.HIDE_MENU_UPGRADES, MenuSections.switchFor("UPSELL"));
        assertSame(Settings.HIDE_MENU_ALSO_FROM_META, MenuSections.switchFor("PRODUCTS_FROM_FACEBOOK"));
    }

    /** Each switch reaches its own group and leaves the other one hidden. */
    @Test
    public void eachGroupGoesByItsOwnSwitch() {
        Settings.HIDE_MENU_UPGRADES.save(false);
        assertFalse(MenuSectionsForTests.hidesUpgrades());
        assertFalse(MenuSectionsForTests.hidesServerUpgrades());
        assertTrue(MenuSectionsForTests.hidesAlsoFromMeta());
        assertTrue(MenuSectionsForTests.hidesServerAlsoFromMeta());

        Settings.HIDE_MENU_UPGRADES.save(true);
        Settings.HIDE_MENU_ALSO_FROM_META.save(false);
        assertTrue(MenuSectionsForTests.hidesUpgrades());
        assertTrue(MenuSectionsForTests.hidesServerUpgrades());
        assertFalse(MenuSectionsForTests.hidesAlsoFromMeta());
        assertFalse(MenuSectionsForTests.hidesServerAlsoFromMeta());

        Settings.HIDE_MENU_UPGRADES.save(false);
        assertFalse(MenuSectionsForTests.hidesUpgrades());
        assertFalse(MenuSectionsForTests.hidesAlsoFromMeta());
    }

    @Test
    public void pausedBothGroupsComeBack() {
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        assertFalse(MenuSectionsForTests.hidesUpgrades());
        assertFalse(MenuSectionsForTests.hidesServerAlsoFromMeta());
        PauseForTests.pause(HushfacebookPause.Reason.CRASH_LOOP);
        assertFalse(MenuSectionsForTests.hidesAlsoFromMeta());
        assertFalse(MenuSectionsForTests.hidesServerUpgrades());
        PauseForTests.resume();
        assertTrue(MenuSectionsForTests.hidesUpgrades());
        assertTrue(MenuSectionsForTests.hidesServerAlsoFromMeta());
    }

    /** Until the settings are ready, the Menu is Facebook's. */
    @Test
    public void untilTheSettingsAreReadyTheMenuIsFacebooks() {
        boolean[] hid = {true, true};
        SettingsContextRule.withoutContext(() -> {
            hid[0] = MenuSectionsForTests.hidesUpgrades();
            hid[1] = MenuSectionsForTests.hidesServerAlsoFromMeta();
        });
        assertFalse(hid[0]);
        assertFalse(hid[1]);
        SettingsContextRule.beforeThePauseIsDecided(() -> {
            hid[0] = MenuSectionsForTests.hidesAlsoFromMeta();
            hid[1] = MenuSectionsForTests.hidesServerUpgrades();
        });
        assertFalse(hid[0]);
        assertFalse(hid[1]);
        assertTrue(MenuSectionsForTests.hidesUpgrades());
    }

    /**
     * A group is known by its enum's name only. A string that reads UPSELL is a title, not a
     * group, so it's left alone, and so is nothing at all; the report names what came instead.
     */
    @Test
    public void anythingButAnEnumIsLeftAndReported() {
        assertFalse(MenuSections.hideSection("UPSELL"));
        assertFalse(MenuSections.hideServerSection(null));
        List<String> missing = HookStatus.missing(FamilyNames.MENU_PROMOTIONS);
        assertEquals(missing.toString(), 2, missing.size());
        assertTrue(missing.toString(), missing.get(0).contains("Menu group enum " + MenuSections.NATIVE_HOOK
                + "#java.lang.String"));
        assertTrue(missing.toString(), missing.get(1).contains("Menu group enum " + MenuSections.SERVER_HOOK + "#null"));
        assertNull("a non-group was counted", line(FeedFilterCounters.report(), MenuSections.ROUTE));
    }

    /**
     * Every group each section asks about is counted by its enum name, with the hidden ones under
     * their Menu titles, and each hook that read a group counts as found.
     */
    @Test
    public void theReportSaysWhatEachSectionBuiltAndWhatWent() {
        MenuSections.hideSection(Group.HELP);
        MenuSections.hideSection(Group.SETTINGS);
        MenuSectionsForTests.hidesUpgrades();
        MenuSectionsForTests.hidesAlsoFromMeta();
        MenuSectionsForTests.hidesUpgrades();
        MenuSections.hideServerSection(Group.PROFILE);
        Settings.HIDE_MENU_UPGRADES.save(false);
        MenuSectionsForTests.hidesServerUpgrades();

        List<String> counters = FeedFilterCounters.report();
        assertEquals(MenuSections.ROUTE + ": 5 lists, 5 items, 3 removed. Last reason: Upgrades. "
                + "Removed: Upgrades 2, Also from Meta 1. Kinds: UPSELL 2, HELP 1, PRODUCTS_FROM_FACEBOOK 1, SETTINGS 1",
                line(counters, MenuSections.ROUTE));
        assertEquals(MenuSections.SERVER_ROUTE + ": 2 lists, 2 items, 0 removed. Kinds: PROFILE 1, UPSELL 1",
                line(counters, MenuSections.SERVER_ROUTE));
        assertEquals(FamilyNames.MENU_PROMOTIONS + ": invoked 7, 2 found, 0 missing",
                line(HookStatus.report(), FamilyNames.MENU_PROMOTIONS));
        assertEquals("Hide Menu promotions", FamilyNames.MENU_PROMOTIONS);
    }
}
