/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import android.app.Activity;
import android.app.AlertDialog;
import android.view.ActionMode;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.View;
import android.widget.EditText;

import app.hushtelegram.extension.shared.L10nTablesForTests;
import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.fakes.RoboMenu;
import org.robolectric.shadows.ShadowAlertDialog;
import org.robolectric.shadows.ShadowLooper;
import org.robolectric.shadows.ShadowToast;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class TextDirectionTest {
    private static final String RLM = String.valueOf(TextDirection.RLM);
    private static final String LRM = String.valueOf(TextDirection.LRM);
    private static final String FAILED = "Couldn't change the text.";

    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void reset() { restore(); }
    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.TEXT_DIRECTION);
        Settings.TEXT_DIRECTION.resetToDefault();
        HookStatus.clear();
        ShadowAlertDialog.reset();
        ShadowToast.reset();
    }

    @Test public void offByDefaultAddsNothing() {
        assertFalse(Settings.TEXT_DIRECTION.get());
        Mode mode = new Mode();
        TextDirection.menu(box("hello"), mode);
        assertEquals(0, mode.menu.size());
        assertTrue(String.join("\n", HookStatus.report()).contains(FamilyNames.TEXT_DIRECTION));
    }

    @Test public void theMenuGetsTheThreeItemsOnceAtTheEnd() {
        Settings.TEXT_DIRECTION.save(true);
        Mode mode = new Mode();
        mode.menu.add(Menu.NONE, 0x7f0900eb, 6, "Bold");
        EditText field = box("hello");
        TextDirection.menu(field, mode);
        TextDirection.menu(field, mode);
        assertEquals("a menu started twice for one long press keeps one set", 4, mode.menu.size());
        assertEquals("Right to left", mode.menu.findItem(TextDirection.RIGHT_TO_LEFT).getTitle().toString());
        assertEquals("Left to right", mode.menu.findItem(TextDirection.LEFT_TO_RIGHT).getTitle().toString());
        assertEquals("Control character", mode.menu.findItem(TextDirection.CONTROL).getTitle().toString());
        assertTrue("after Telegram's own items", mode.menu.findItem(TextDirection.RIGHT_TO_LEFT).getOrder() > 6);
        assertEquals("the toolbar is drawn again with them", 1, mode.invalidated);
    }

    @Test public void onlyAnEditorsMenuGetsThem() {
        Settings.TEXT_DIRECTION.save(true);
        Mode mode = new Mode();
        TextDirection.menu(new Object(), mode);
        TextDirection.menu(null, mode);
        assertEquals(0, mode.menu.size());
        TextDirection.menu(box("hello"), null);
        Mode empty = new Mode();
        empty.menu = null;
        TextDirection.menu(box("hello"), empty);
        assertTrue(HookStatus.missing(FamilyNames.TEXT_DIRECTION).isEmpty());
    }

    @Test public void rightToLeftMarksEveryLineTheSelectionTouches() {
        Settings.TEXT_DIRECTION.save(true);
        EditText field = box("one\ntwo\nthree");
        field.setSelection(1, 6);
        assertTrue(TextDirection.chosen(field, TextDirection.RIGHT_TO_LEFT));
        assertEquals(RLM + "one\n" + RLM + "two\nthree", field.getText().toString());
        assertTrue(String.join("\n", HookStatus.report()).contains("right to left"));
    }

    @Test public void theCursorAloneMarksItsOwnLine() {
        Settings.TEXT_DIRECTION.save(true);
        EditText field = box("one\ntwo\nthree");
        field.setSelection(5);
        assertTrue(TextDirection.chosen(field, TextDirection.LEFT_TO_RIGHT));
        assertEquals("one\n" + LRM + "two\nthree", field.getText().toString());
        EditText blank = box("");
        assertTrue(TextDirection.chosen(blank, TextDirection.RIGHT_TO_LEFT));
        assertEquals("an empty box starts with the mark, so what's typed reads that way", RLM, blank.getText().toString());
    }

    @Test public void theOtherDirectionSwapsTheMarkInsteadOfAddingOne() {
        Settings.TEXT_DIRECTION.save(true);
        EditText field = box(RLM + "one\ntwo");
        field.setSelection(7, 2);
        assertTrue(TextDirection.chosen(field, TextDirection.LEFT_TO_RIGHT));
        assertEquals("a backwards selection works too", LRM + "one\n" + LRM + "two", field.getText().toString());
        assertTrue(TextDirection.chosen(field, TextDirection.LEFT_TO_RIGHT));
        assertEquals("the same direction again changes nothing", LRM + "one\n" + LRM + "two", field.getText().toString());
        field.setSelection(0, field.length());
        assertTrue(TextDirection.chosen(field, TextDirection.RIGHT_TO_LEFT));
        assertEquals(RLM + "one\n" + RLM + "two", field.getText().toString());
    }

    @Test public void aSelectionEndingRightAfterALineBreakLeavesTheNextLine() {
        Settings.TEXT_DIRECTION.save(true);
        EditText field = box("ab\ncd");
        field.setSelection(0, 3);
        assertTrue(TextDirection.chosen(field, TextDirection.RIGHT_TO_LEFT));
        assertEquals(RLM + "ab\ncd", field.getText().toString());
    }

    @Test public void telegramsOwnItemsPassThrough() {
        Settings.TEXT_DIRECTION.save(true);
        EditText field = box("hello");
        field.setSelection(0, 5);
        for (int id : new int[] {0, 1, 0x7f0900f7, 0x7f0900eb, 0x48545408}) {
            assertFalse(TextDirection.chosen(field, id));
        }
        assertEquals("hello", field.getText().toString());
    }

    @Test public void anItemLeftOpenAfterTheSwitchWentOffDoesNothing() {
        EditText field = box("hello");
        assertTrue("it's still ours, so Telegram doesn't get a number it never made",
                TextDirection.chosen(field, TextDirection.RIGHT_TO_LEFT));
        assertTrue(TextDirection.chosen(new Object(), TextDirection.CONTROL));
        assertEquals("hello", field.getText().toString());
        assertNull(ShadowAlertDialog.getLatestAlertDialog());
    }

    @Test public void controlCharacterListsTheMarksAndPutsThePickedOneInPlaceOfTheSelection() {
        Settings.TEXT_DIRECTION.save(true);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            EditText field = new EditText(controller.get());
            field.setText("hello");
            field.setSelection(1, 3);
            assertTrue(TextDirection.chosen(field, TextDirection.CONTROL));
            AlertDialog list = (AlertDialog) ShadowAlertDialog.getLatestAlertDialog();
            assertTrue(list.isShowing());
            assertEquals("Control character", Shadows.shadowOf(list).getTitle().toString());
            CharSequence[] rows = Shadows.shadowOf(list).getItems();
            assertEquals(TextDirection.MARKS.length, rows.length);
            assertEquals("RLM  Right-to-left mark", rows[1].toString());
            field.setSelection(0);
            Shadows.shadowOf(list).clickOnItem(1);
            assertEquals("where the menu was, though Telegram moved the cursor", "h" + RLM + "lo", field.getText().toString());
            assertEquals(2, field.getSelectionStart());
            assertTrue(String.join("\n", HookStatus.report()).contains("control character inserted"));
        }
    }

    @Test public void eachMarkHasItsOwnNames() {
        String[] names = TextDirection.names();
        assertEquals(TextDirection.MARKS.length, names.length);
        assertEquals(TextDirection.MARKS.length, TextDirection.SHORT_NAMES.length);
        Set<Character> marks = new HashSet<>();
        for (char mark : TextDirection.MARKS) {
            assertTrue("an invisible format character", Character.getType(mark) == Character.FORMAT);
            marks.add(mark);
        }
        assertEquals(TextDirection.MARKS.length, marks.size());
        assertEquals(TextDirection.MARKS.length, new HashSet<>(java.util.Arrays.asList(names)).size());
    }

    @Test public void aBoxOutsideAScreenSaysSo() {
        Settings.TEXT_DIRECTION.save(true);
        EditText field = box("hello");
        assertTrue(TextDirection.chosen(field, TextDirection.CONTROL));
        ShadowLooper.idleMainLooper();
        assertNull(ShadowAlertDialog.getLatestAlertDialog());
        assertEquals(FAILED, ShadowToast.getTextOfLatestToast());
    }

    @Test public void aMenuThatBreaksLeavesTelegramRunning() {
        Settings.TEXT_DIRECTION.save(true);
        Mode broken = new Mode();
        broken.failAdd = true;
        TextDirection.menu(box("hello"), broken);
        assertEquals(0, broken.menu.size());
        assertFalse(HookStatus.missing(FamilyNames.TEXT_DIRECTION).isEmpty());
    }

    @Test public void pausedOrNotReadyLeavesTelegramAlone() {
        Settings.TEXT_DIRECTION.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            Mode mode = new Mode();
            EditText field = box("hello");
            TextDirection.menu(field, mode);
            assertEquals(reason.name(), 0, mode.menu.size());
            assertTrue(TextDirection.chosen(field, TextDirection.RIGHT_TO_LEFT));
            assertEquals(reason.name(), "hello", field.getText().toString());
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> assertFalse(TextDirection.active()));
        SettingReadsForTests.breakReads(Settings.TEXT_DIRECTION);
        Mode mode = new Mode();
        TextDirection.menu(box("hello"), mode);
        assertEquals(0, mode.menu.size());
        assertFalse(HookStatus.missing(FamilyNames.TEXT_DIRECTION).isEmpty());
    }

    @Test public void theToastFitsTwoLinesInEveryLanguage() {
        assertFitsATwoLineToast("en", FAILED);
        for (String language : new String[]{"bg", "de", "es", "in", "pt-rbr", "tr"}) {
            String row = L10nTablesForTests.of(language).get(FAILED);
            assertNotNull(language, row);
            assertFitsATwoLineToast(language, row);
        }
    }

    /** A toast line holds about 34 characters on a small phone; 28 leaves room for wider letters. */
    private static void assertFitsATwoLineToast(String language, String text) {
        List<String> lines = new ArrayList<>();
        StringBuilder line = new StringBuilder();
        for (String word : text.split(" ")) {
            if (line.length() > 0 && line.length() + 1 + word.length() > 28) {
                lines.add(line.toString());
                line.setLength(0);
            }
            if (line.length() > 0) line.append(' ');
            line.append(word);
        }
        if (line.length() > 0) lines.add(line.toString());
        assertTrue(language + ": " + text, lines.size() <= 2);
        for (String each : lines) assertTrue(language + ": " + each, each.length() <= 28);
    }

    private static EditText box(String text) {
        EditText field = new EditText(RuntimeEnvironment.getApplication());
        field.setText(text);
        field.setSelection(0);
        return field;
    }

    /** A floating text menu, as the box's startActionMode returns it. */
    static final class Mode extends ActionMode {
        RoboMenu menu = new RoboMenu(RuntimeEnvironment.getApplication()) {
            @Override public android.view.MenuItem add(int group, int id, int order, CharSequence title) {
                if (failAdd) throw new IllegalStateException("menu unavailable");
                return super.add(group, id, order, title);
            }
        };
        boolean failAdd;
        int invalidated;

        @Override public void setTitle(CharSequence title) {}
        @Override public void setTitle(int resId) {}
        @Override public void setSubtitle(CharSequence subtitle) {}
        @Override public void setSubtitle(int resId) {}
        @Override public void setCustomView(View view) {}
        @Override public void invalidate() { invalidated++; }
        @Override public void finish() {}
        @Override public Menu getMenu() { return menu; }
        @Override public CharSequence getTitle() { return null; }
        @Override public CharSequence getSubtitle() { return null; }
        @Override public View getCustomView() { return null; }
        @Override public MenuInflater getMenuInflater() { return null; }
    }
}
