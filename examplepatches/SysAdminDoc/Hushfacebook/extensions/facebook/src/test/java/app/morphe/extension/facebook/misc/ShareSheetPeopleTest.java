/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.AbstractCollection;
import java.util.ArrayList;
import java.util.Arrays;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/**
 * Share sheet items' people switch (#169): on, the people row (and its placeholder) never joins the
 * sheet's children; off, paused or before the settings are ready, the add is Facebook's own.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ShareSheetPeopleTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private final AbstractCollection<Object> children = new ArrayList<>();
    private final Object row = new Object();

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.HIDE_SHARE_PEOPLE_ROW.resetToDefault();
        ShareSheetPeople.forgetForTests();
        HookStatus.clear();
    }

    private static String statusLine() {
        for (String line : HookStatus.report()) {
            if (line.startsWith(FamilyNames.SHARE_SHEET_ITEMS + ":")) return line;
        }
        return "";
    }

    @Test
    public void theSwitchStartsOffAndOffTheRowIsAdded() {
        assertFalse(Settings.HIDE_SHARE_PEOPLE_ROW.defaultValue);
        assertTrue(ShareSheetPeople.addRow(children, row));
        assertEquals(1, children.size());
        assertTrue(children.contains(row));
    }

    @Test
    public void onTheRowIsLeftOutAndCounted() {
        Settings.HIDE_SHARE_PEOPLE_ROW.save(true);
        assertFalse(ShareSheetPeople.addRow(children, row));
        assertFalse(ShareSheetPeople.addRow(children, new Object()));
        assertTrue("the row joined the children", children.isEmpty());

        String line = statusLine();
        assertTrue(line, line.contains(ShareSheetPeople.ROW_KEPT_OUT + " 2"));
    }

    @Test
    public void otherChildrenAreUntouched() {
        Settings.HIDE_SHARE_PEOPLE_ROW.save(true);
        Object search = new Object();
        children.add(search);
        ShareSheetPeople.addRow(children, row);
        assertEquals(1, children.size());
        assertTrue(children.contains(search));
    }

    @Test
    public void pausedTheRowComesBack() {
        Settings.HIDE_SHARE_PEOPLE_ROW.save(true);
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        assertTrue(ShareSheetPeople.addRow(children, row));
        assertEquals(1, children.size());
        PauseForTests.resume();
        assertFalse(ShareSheetPeople.addRow(children, new Object()));
        assertEquals(1, children.size());
    }

    @Test
    public void theSharedAddKeepsWhatFollowsTheRow() {
        Object next = new Object();
        ShareSheetPeople.addRowThen(row, next, children);
        assertEquals(Arrays.asList(row, next), new ArrayList<>(children));
        ShareSheetPeople.addRowThen(row, null, children);
        assertEquals(Arrays.asList(row, next, row), new ArrayList<>(children));

        children.clear();
        Settings.HIDE_SHARE_PEOPLE_ROW.save(true);
        ShareSheetPeople.addRowThen(row, next, children);
        assertEquals(Arrays.asList(next), new ArrayList<>(children));
        ShareSheetPeople.addRowThen(row, null, children);
        assertEquals(Arrays.asList(next), new ArrayList<>(children));
        String line = statusLine();
        assertTrue(line, line.contains(ShareSheetPeople.ROW_KEPT_OUT + " 2"));
    }

    @Test
    public void beforeTheSettingsAreReadyTheRowIsAdded() {
        Settings.HIDE_SHARE_PEOPLE_ROW.save(true);
        SettingsContextRule.withoutContext(() -> assertTrue(ShareSheetPeople.addRow(children, row)));
        assertEquals(1, children.size());
    }
}
