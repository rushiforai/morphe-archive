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

import android.app.Activity;
import android.view.View;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowLooper;
import org.robolectric.shadows.ShadowToast;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/**
 * The Hushfacebook row in the Menu's Settings and privacy group: added once after Facebook's rows,
 * looking like the first of them, known by its id; a tap on it opens the settings and a tap on any
 * other row is Facebook's; it stays while paused, like the settings entry's other ways in.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class MenuSettingsRowTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** A stand-in for Facebook's row item, with the two helpers the patch adds to it. */
    public static final class Row {
        final CharSequence title;
        final int icon;
        final String address;
        final long id;

        Row(CharSequence title, int icon, String address, long id) {
            this.title = title;
            this.icon = icon;
            this.address = address;
            this.id = id;
        }

        public static Object hushfacebookRow(Object template, CharSequence title, long id) {
            return new Row(title, ((Row) template).icon, null, id);
        }

        public static long hushfacebookRowId(Object row) {
            return ((Row) row).id;
        }
    }

    /** A row item from a build the patch didn't reach: no helpers. */
    public static final class Unpatched {
    }

    private final Row settings = new Row("Settings", 17, "fb://settings", 1_188_298_679_798_386L);
    private final Row language = new Row("Language", 23, "fb://language", 239_655_269_434_058L);

    @Before
    public void startClean() {
        MenuSettingsRow.forget();
        HookStatus.clear();
        ShadowToast.reset();
    }

    @After
    public void restore() {
        PauseForTests.resume();
        MenuSettingsRow.forget();
        HookStatus.clear();
    }

    private static String statusLine() {
        for (String line : HookStatus.report()) {
            if (line.startsWith(FamilyNames.MENU_SETTINGS_ROW + ":")) return line;
        }
        return null;
    }

    @Test
    public void theRowComesOnceAfterFacebooksRowsWithTheFirstRowsIcon() {
        List<?> rows = MenuSettingsRow.withRow(Arrays.asList(settings, language));
        assertEquals(3, rows.size());
        assertSame(settings, rows.get(0));
        assertSame(language, rows.get(1));
        Row ours = (Row) rows.get(2);
        assertEquals("Hushfacebook settings", ours.title.toString());
        assertEquals(MenuSettingsRow.ROW_ID, ours.id);
        assertEquals("the row has the first row's icon", 17, ours.icon);
        assertNull("the row has an address Facebook would open", ours.address);
        // Facebook hands the same list back on the next pass, or the one with the row in it.
        assertEquals(3, MenuSettingsRow.withRow(rows).size());
        assertSame(rows, MenuSettingsRow.withRow(rows));
    }

    /** The row's id is its own: negative, where every id of Facebook's is a positive object id. */
    @Test
    public void theRowIsKnownByAnIdFacebookNeverUses() {
        assertTrue(MenuSettingsRow.ROW_ID < 0);
        assertTrue(MenuSettingsRow.isRow(MenuSettingsRow.ROW_ID));
        assertFalse(MenuSettingsRow.isRow(settings.id));
        assertFalse(MenuSettingsRow.isRow(0));
    }

    @Test
    public void anEmptyGroupStaysEmptyAndNothingIsNeverNull() {
        List<Object> empty = Collections.emptyList();
        assertSame(empty, MenuSettingsRow.withRow(empty));
        assertNotNull("the builder's ImmutableList.copyOf would throw on null", MenuSettingsRow.withRow(null));
        assertTrue(MenuSettingsRow.withRow(null).isEmpty());
    }

    /** Rows the patch didn't give its helpers are left as they are, and the report says so. */
    @Test
    public void rowsWithoutTheHelpersAreLeftAndReported() {
        List<Object> rows = Collections.singletonList(new Unpatched());
        assertSame(rows, MenuSettingsRow.withRow(rows));
        List<String> missing = HookStatus.missing(FamilyNames.MENU_SETTINGS_ROW);
        assertEquals(missing.toString(), 1, missing.size());
        assertTrue(missing.get(0), missing.get(0).contains(Unpatched.class.getName() + "#hushfacebookRow"));
    }

    /** Until Hushfacebook has a context, the Menu builds without the row, and the next pass adds it. */
    @Test
    public void beforeTheContextTheListIsFacebooks() {
        List<Row> rows = Arrays.asList(settings, language);
        Object[] seen = new Object[1];
        SettingsContextRule.withoutContext(() -> seen[0] = MenuSettingsRow.withRow(rows));
        assertSame(rows, seen[0]);
        assertEquals(3, MenuSettingsRow.withRow(rows).size());
    }

    /** Pause doesn't reach the row: the settings screen is where a pause is lifted. */
    @Test
    public void pausedTheRowStays() {
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        assertEquals(3, MenuSettingsRow.withRow(Arrays.asList(settings, language)).size());
        PauseForTests.pause(HushfacebookPause.Reason.CRASH_LOOP);
        assertEquals(3, MenuSettingsRow.withRow(Arrays.asList(settings, language)).size());
    }

    @Test
    public void aTapOnTheRowOpensTheSettings() {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            View row = new View(activity);
            assertTrue(MenuSettingsRow.onTap(row, MenuSettingsRow.ROW_ID));
            ShadowLooper.idleMainLooper();
            assertNotNull("the settings didn't open", activity.getFragmentManager().findFragmentByTag("hushfacebook_settings"));
            assertNull("a toast said it couldn't open", ShadowToast.getTextOfLatestToast());
        }
    }

    /** A tap on any of Facebook's rows is Facebook's, and costs nothing here. */
    @Test
    public void aTapOnAnyOtherRowIsFacebooks() {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            assertFalse(MenuSettingsRow.onTap(new View(activity), settings.id));
            assertFalse(MenuSettingsRow.onTap(null, 0));
            ShadowLooper.idleMainLooper();
            assertNull(activity.getFragmentManager().findFragmentByTag("hushfacebook_settings"));
        }
        assertNull("another row's tap was counted", statusLine());
    }

    /** With nowhere to open over, the row still answers the tap and says where the settings are. */
    @Test
    public void aTapWithNoScreenBehindItSaysWhereTheSettingsAre() {
        assertTrue(MenuSettingsRow.onTap(null, MenuSettingsRow.ROW_ID));
        ShadowLooper.idleMainLooper();
        assertEquals("Hushfacebook settings can't open here. Long-press the Facebook logo instead.",
                ShadowToast.getTextOfLatestToast());
    }

    @Test
    public void theReportCountsTheListAndTheTap() {
        MenuSettingsRow.withRow(Arrays.asList(settings, language));
        MenuSettingsRow.onTap(null, MenuSettingsRow.ROW_ID);
        MenuSettingsRow.onTap(null, settings.id);
        assertEquals(FamilyNames.MENU_SETTINGS_ROW + ": invoked 2, 2 found, 0 missing", statusLine());
        assertEquals("Hushfacebook in the Menu", FamilyNames.MENU_SETTINGS_ROW);
    }
}
