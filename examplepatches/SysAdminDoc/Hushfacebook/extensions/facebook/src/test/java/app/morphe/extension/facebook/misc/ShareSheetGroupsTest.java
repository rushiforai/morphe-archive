/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.misc;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/**
 * Share sheet items' group switch (#104): on, the footer's Send to group button comes back null and
 * every new-group entry answers off; off, paused or before the settings are ready, each answer is
 * Facebook's own. An entry Facebook already left off stays off either way.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ShareSheetGroupsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** Stands in for the FDSButton the footer builds. */
    private final Object button = new Object();

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.HIDE_SHARE_GROUP_BUTTONS.resetToDefault();
        ShareSheetGroups.forgetForTests();
        HookStatus.clear();
    }

    private static String statusLine() {
        for (String line : HookStatus.report()) {
            if (line.startsWith(FamilyNames.SHARE_SHEET_ITEMS + ":")) return line;
        }
        return "";
    }

    @Test
    public void theSwitchStartsOffAndOffEveryAnswerIsFacebooks() {
        assertFalse(Settings.HIDE_SHARE_GROUP_BUTTONS.defaultValue);
        assertSame(button, ShareSheetGroups.sendToGroupButton(button));
        assertTrue(ShareSheetGroups.offerNewGroup(true));
        assertFalse(ShareSheetGroups.offerNewGroup(false));
    }

    @Test
    public void onTheButtonIsKeptOutAndEveryNewGroupEntryAnswersOff() {
        Settings.HIDE_SHARE_GROUP_BUTTONS.save(true);
        assertNull(ShareSheetGroups.sendToGroupButton(button));
        assertFalse(ShareSheetGroups.offerNewGroup(true));
        assertFalse("an entry Facebook left off came on", ShareSheetGroups.offerNewGroup(false));
        // One pick: Facebook built no button, and nothing is counted for it.
        assertNull(ShareSheetGroups.sendToGroupButton(null));

        String line = statusLine();
        assertTrue(line, line.contains(ShareSheetGroups.BUTTON_KEPT_OUT + " 1"));
        assertTrue(line, line.contains(ShareSheetGroups.ENTRY_KEPT_OUT + " 1"));
    }

    @Test
    public void pausedFacebooksButtonsComeBack() {
        Settings.HIDE_SHARE_GROUP_BUTTONS.save(true);
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        assertSame(button, ShareSheetGroups.sendToGroupButton(button));
        assertTrue(ShareSheetGroups.offerNewGroup(true));
        PauseForTests.resume();
        assertNull(ShareSheetGroups.sendToGroupButton(button));
        assertFalse(ShareSheetGroups.offerNewGroup(true));
    }

    @Test
    public void beforeTheSettingsAreReadyEveryAnswerIsFacebooks() {
        Settings.HIDE_SHARE_GROUP_BUTTONS.save(true);
        SettingsContextRule.withoutContext(() -> {
            assertSame(button, ShareSheetGroups.sendToGroupButton(button));
            assertTrue(ShareSheetGroups.offerNewGroup(true));
        });
    }
}
