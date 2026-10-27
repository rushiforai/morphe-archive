/*
 * Forked from https://github.com/SysAdminDoc/HushThreads at b141524 (GPL-3.0),
 * modified for HushTelegram (Telegram), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.hushtelegram.extension.telegram.settings;

import static org.junit.Assert.*;

import android.app.Activity;
import android.app.AlertDialog;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.preference.Preference;
import android.preference.PreferenceCategory;
import android.preference.SwitchPreference;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.TextView;

import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.EnumSet;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.settings.BaseSettings;
import app.hushtelegram.extension.shared.settings.FailingStore;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.Setting;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.shadows.ShadowLooper;
import org.robolectric.shadows.ShadowToast;

/** Exercises the actual dialog host and its filtered view of the original preference model. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, qualifiers = "w390dp-h844dp-night-xhdpi")
@SuppressWarnings("deprecation")
public class SettingsNavigationTest {
    @Rule public final SettingsContextRule settings = new SettingsContextRule();
    private ActivityController<Activity> controller;
    private SettingsDialog dialog;
    private HushTelegramPreferenceFragment page;

    @Before public void open() {
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        PauseForTests.resume();
        controller = Robolectric.buildActivity(Activity.class).setup().visible();
        dialog = SettingsL10nTest.show(controller.get());
        page = page(dialog);
    }

    @After public void close() {
        controller.close();
        PatchFamily.inBuildForTests = null;
        PatchFamily.capabilitiesForTests = null;
        Settings.HIDE_ADS.resetToDefault();
        Settings.REVEAL_SPOILERS.resetToDefault();
        Settings.DISABLE_UPDATE_CHECKS.resetToDefault();
        SettingsNavigation.PLAIN_ROWS.resetToDefault();
        BaseSettings.PAUSED.resetToDefault();
        app.hushtelegram.extension.shared.settings.preference.QuickSetups.forget();
        app.hushtelegram.extension.shared.settings.preference.AbstractPreferenceFragment.restartPending.remove(
                Settings.HIDE_ADS.key);
        app.hushtelegram.extension.shared.settings.preference.AbstractPreferenceFragment.restartPending.remove(
                Settings.REVEAL_SPOILERS.key);
        PauseForTests.resume();
    }

    @Test @Config(sdk = {28, 30, 33, 36})
    public void homeAndEveryCategoryAreReachableWithoutRemovingTheModel() {
        assertNotNull(page.navigation);
        // Nothing is paused, so there is no status card: the thirteen section headings, Changed
        // switches, Report a problem and Support HushTelegram.
        assertEquals(16, list().getCount());
        assertEquals(13, page.sections().size());
        int total = page.getPreferenceScreen().getRootAdapter().getCount();
        for (Preference section : page.sections()) {
            String id = section.getTitle().toString();
            assertFalse(id + " starts open", page.navigation.isExpanded(id));
            assertEquals(id + " lists rows while closed", 0, sectionRows(id).size());
            assertTrue(page.navigation.open(section));
            assertTrue(page.navigation.isExpanded(id));
            PreferenceCategory category = (PreferenceCategory) section;
            // Every row once, plus a heading per group on the two split sections.
            int groups = 0;
            for (PatchFamily.Group group : PatchFamily.Group.values()) {
                if (group.page.title.contentEquals(section.getTitle())) groups++;
            }
            assertEquals(category.getPreferenceCount() + groups, sectionRows(id).size());
            for (int i = 0; i < category.getPreferenceCount(); i++) {
                assertEquals(1, occurrences(category.getPreference(i)));
            }
            assertEquals(total, page.getPreferenceScreen().getRootAdapter().getCount());
            assertNotNull(page.findPreference(Settings.HIDE_ADS.key));
            // The heading closes its section in place, and the home list has no page to go back from.
            tap("section_" + id);
            assertFalse(page.navigation.isExpanded(id));
            assertEquals(0, sectionRows(id).size());
            assertFalse(page.navigation.back());
        }
        assertEquals(16, list().getCount());
    }

    @Test public void categoryClickChangesOnlyTheSettingWhoseRowWasTapped() {
        assertTrue(page.navigation.open(page.findPreference(Settings.DISABLE_UPDATE_CHECKS.key)));
        assertTrue(Settings.DISABLE_UPDATE_CHECKS.savedValue());
        tap(Settings.DISABLE_UPDATE_CHECKS.key);
        assertFalse(Settings.DISABLE_UPDATE_CHECKS.savedValue());
        assertTrue(Settings.DISABLE_ANALYTICS.savedValue());
        assertTrue(Settings.HIDE_ADS.savedValue());
    }

    /** Each task has its own section that opens in place, while search still reaches every original control. */
    @Test public void pauseBackupAndDiagnosticsSectionsOpenInPlaceInEveryShippedLanguage() {
        String[][] languages = {{"en", null}, {"bg", "bg"}, {"de", "de"}, {"es", "es"}, {"in-rID", "in"}, {"pt-rBR", "pt-rbr"}, {"tr", "tr"}};
        for (String[] language : languages) {
            controller.close();
            org.robolectric.RuntimeEnvironment.setQualifiers("+" + language[0]);
            controller = Robolectric.buildActivity(Activity.class).setup().visible();
            dialog = SettingsL10nTest.show(controller.get());
            page = page(dialog);
            Map<String, String> table = language[1] == null ? new TreeMap<>() : SettingsL10nTest.TranslationsForTests.of(language[1]);
            for (String[] group : controlGroups()) {
                String title = table.getOrDefault(group[0], group[0]);
                if (language[1] != null) assertTrue(group[0] + " has no " + language[0] + " translation", table.containsKey(group[0]));
                // Leave the last search for the home list, where the section headings are.
                while (page.navigation.back()) { }
                assertTrue("missing section " + group[0], contains("section_" + group[0]));
                assertEquals(title, ((Preference) list().getItemAtPosition(position("section_" + group[0]))).getTitle());
                assertFalse(page.navigation.isExpanded(group[0]));
                tap("section_" + group[0]);
                assertTrue(page.navigation.isExpanded(group[0]));
                assertEquals("unexpected controls on " + title, group.length - 1, sectionRows(group[0]).size());
                for (int i = 1; i < group.length; i++) {
                    Preference control = page.findPreference(group[i]);
                    assertEquals(title, control.getParent().getTitle());
                    assertSame(control, list().getItemAtPosition(position(group[i])));
                    page.navigation.search(control.getTitle().toString());
                    assertSame("search lost " + group[i], control, list().getItemAtPosition(position(group[i])));
                    assertEquals("search repeated " + group[i], 1, occurrences(group[i]));
                    assertTrue(page.navigation.open(control));
                    assertTrue("opening " + group[i] + " left " + title + " closed", page.navigation.isExpanded(group[0]));
                }
                page.navigation.search(title);
                for (int i = 1; i < group.length; i++) assertEquals("group search lost " + group[i], 1, occurrences(group[i]));
            }
        }
    }

    /** The screen title is spoken once as a heading, each section keeps its localized name, and every control wraps at either text size. */
    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void groupedPagesKeepTheirHeadingsAndAllControlsAtNormalAndDoubleText() {
        String[] languages = {"en", "bg", "de", "es", "in-rID", "pt-rBR", "tr"};
        try {
            for (String language : languages) for (float scale : new float[]{1f, 2f}) {
                controller.close();
                org.robolectric.RuntimeEnvironment.setQualifiers("+" + language);
                org.robolectric.RuntimeEnvironment.setFontScale(scale);
                controller = Robolectric.buildActivity(Activity.class).setup().visible();
                dialog = SettingsL10nTest.show(controller.get());
                page = page(dialog);
                for (String[] group : controlGroups()) {
                    page.navigation.navigate(group[0]);
                    layout(dialog.getView());
                    TextView heading = pageTitle();
                    assertEquals("HushTelegram", heading.getText().toString());
                    assertTrue(heading.createAccessibilityNodeInfo().isHeading());
                    assertCompleteText(heading);
                    assertEquals(L10n.t(group[0]), String.valueOf(
                            ((Preference) list().getItemAtPosition(position("section_" + group[0]))).getTitle()));
                    assertEquals(group.length - 1, sectionRows(group[0]).size());
                    for (int i = 1; i < group.length; i++) {
                        int position = position(group[i]);
                        list().setSelection(position);
                        layout(dialog.getView());
                        View row = list().getChildAt(position - list().getFirstVisiblePosition());
                        assertNotNull(language + " at " + scale + " hid " + group[i], row);
                        android.view.accessibility.AccessibilityNodeInfo info = row.createAccessibilityNodeInfo();
                        assertFalse(group[i] + " repeats the page heading", info.isHeading());
                        assertTrue(group[i] + " has no double tap", info.isClickable());
                        assertEquals(page.findPreference(group[i]) instanceof SwitchPreference
                                ? android.widget.Switch.class.getName() : android.widget.Button.class.getName(), info.getClassName());
                        TextView title = row.findViewById(android.R.id.title);
                        assertEquals(page.findPreference(group[i]).getTitle(), title.getText());
                        assertNotEquals(heading.getText().toString(), title.getText().toString());
                        assertCompleteText(title);
                        assertCompleteText(row.findViewById(android.R.id.summary));
                    }
                }
            }
        } finally {
            org.robolectric.RuntimeEnvironment.setFontScale(1f);
        }
    }

    private static String[][] controlGroups() {
        return new String[][]{{"Pause", BaseSettings.PAUSED.key, SettingsNavigation.LOCK},
                {"Settings backup", "action_export_settings", "action_import_settings", SettingsNavigation.QUICK_SETUPS},
                {"Diagnostics", BaseSettings.DEBUG.key, "action_export_diagnostic_report", "action_clear_diagnostic_data"}};
    }

    private TextView pageTitle() {
        return dialog.getView().findViewWithTag(SettingsDialog.PAGE_TITLE);
    }

    private int occurrences(String key) {
        int found = 0;
        for (int i = 0; i < list().getCount(); i++) if (key.equals(((Preference) list().getItemAtPosition(i)).getKey())) found++;
        return found;
    }

    private int occurrences(Preference row) {
        int found = 0;
        for (int i = 0; i < list().getCount(); i++) if (list().getItemAtPosition(i) == row) found++;
        return found;
    }

    /**
     * Conversations and Look and feel open split under their headings, in the order the groups are
     * listed, each heading spoken as one and never tappable. A row with no switch of its own stays
     * under the switch it belongs to, and a link to a row brings its heading into view with it.
     * The groups sit inside the section, under its own heading on the home list.
     */
    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void theLongPagesAreSplitUnderHeadingsInGroupOrder() {
        for (PatchFamily.Page split : new PatchFamily.Page[]{PatchFamily.Page.CONVERSATIONS, PatchFamily.Page.LOOK}) {
            page.navigation.navigate(split.title);
            layout(dialog.getView());
            List<String> headings = new ArrayList<>();
            List<String> expected = new ArrayList<>();
            for (PatchFamily.Group group : PatchFamily.Group.values()) if (group.page == split) expected.add(group.title);
            PatchFamily.Group current = null;
            int first = position("section_" + split.title) + 1;
            int last = first + sectionRows(split.title).size();
            for (int i = first; i < last; i++) {
                Preference item = (Preference) list().getItemAtPosition(i);
                if (item instanceof PreferenceCategory) {
                    headings.add(String.valueOf(item.getTitle()));
                    assertFalse(item.getTitle() + " is tappable", list().getAdapter().isEnabled(i));
                    list().setSelection(i);
                    layout(dialog.getView());
                    View row = list().getChildAt(i - list().getFirstVisiblePosition());
                    assertTrue(item.getTitle() + " isn't a heading", row.createAccessibilityNodeInfo().isHeading());
                    for (PatchFamily.Group group : PatchFamily.Group.values()) {
                        if (group.title.contentEquals(item.getTitle())) current = group;
                    }
                    continue;
                }
                // Settings look is about the settings screen, not a patch, so it heads Look and feel on its own.
                if (i == first && split == PatchFamily.Page.LOOK && SettingsNavigation.SETTINGS_LOOK.equals(item.getKey())) continue;
                assertNotNull(item.getTitle() + " comes before any heading", current);
                PatchFamily owner = item.hasKey() ? PatchFamily.Group.owner(item.getKey()) : null;
                if (owner != null) assertSame(item.getTitle() + " is under " + current, current, PatchFamily.Group.of(owner));
            }
            assertEquals(expected, headings);
        }
        page.navigation.navigate(PatchFamily.Page.CONVERSATIONS.title);
        assertEquals(position(Settings.HIDE_TRANSLATE_BAR.key) + 1, position(Settings.OUTSIDE_TRANSLATE.key));
        assertEquals(position(Settings.HIDE_BY_KEYWORD.key) + 1, position(FilterEditor.GROUPS));
        assertEquals(position(FilterEditor.GROUPS) + 1, position(FilterEditor.CHANNELS));
        assertEquals(position(Settings.KEEP_DELETED_MESSAGES.key) + 1, position(Settings.RED_DELETED_LABEL.key));
        assertEquals(position(Settings.RED_DELETED_LABEL.key) + 1, position(HushTelegramPreferenceFragment.CLEAR_KEPT));
        assertEquals(position(HushTelegramPreferenceFragment.CLEAR_KEPT) + 1, position(Settings.KEEP_EDIT_HISTORY.key));
        assertEquals(position(Settings.KEEP_EDIT_HISTORY.key) + 1, position(HushTelegramPreferenceFragment.CLEAR_EDITS));
        page.navigation.navigate(PatchFamily.Page.LOOK.title);
        assertEquals(position(Settings.CHANGE_STICKER_SIZE.key) + 1, position(HushTelegramPreferenceFragment.STICKER_SIZE_ROW));
        assertEquals(position(Settings.HOLIDAY_LOOK.key) + 1, position(TitleEmojiEditor.KEY));
        assertEquals(position(Settings.AMOLED_BLACK.key) - 1, titles().indexOf("Theme"));
        assertTrue(page.navigation.open(page.findPreference(Settings.HIDE_TRANSLATE_BAR.key)));
        layout(dialog.getView());
        assertEquals("Translation", String.valueOf(((Preference) list().getItemAtPosition(list().getFirstVisiblePosition())).getTitle()));
        // Further down a group, the row itself is what comes to the top.
        assertTrue(page.navigation.open(page.findPreference(Settings.OUTSIDE_TRANSLATE.key)));
        layout(dialog.getView());
        assertEquals(position(Settings.OUTSIDE_TRANSLATE.key), list().getFirstVisiblePosition());
        // Search isn't split: a match on these pages sits under its page's name as before.
        page.navigation.search("sticker size");
        assertFalse(titles().contains("Messages and stickers"));
        assertTrue(contains(Settings.CHANGE_STICKER_SIZE.key));
    }

    private static void assertCompleteText(TextView view) {
        assertNotNull(view);
        android.text.Layout text = view.getLayout();
        assertNotNull(view.getText() + " wasn't laid out", text);
        int last = text.getLineCount() - 1;
        assertEquals(view.getText().length(), text.getLineEnd(last));
        for (int line = 0; line <= last; line++) assertEquals(0, text.getEllipsisCount(line));
        assertTrue(view.getText() + " was clipped vertically", text.getLineBottom(last)
                <= view.getHeight() - view.getCompoundPaddingTop() - view.getCompoundPaddingBottom());
    }

    @Test public void overviewPauseAndUndoUpdateTheSavedSwitchAndRestartNotice() {
        layout(dialog.getView());
        // Nothing is paused, so no status card is drawn and Pause sits in the toolbar.
        assertNotSame(page.getPreferenceScreen().getPreference(0), list().getItemAtPosition(0));
        assertEquals(View.VISIBLE, dialog.pauseAction.getVisibility());
        android.widget.Button action = statusAction();
        assertSame(dialog.pauseAction, action);
        assertEquals("Pause", action.getText().toString());
        assertTrue(action.getMinimumWidth() <= Math.round(48 * action.getResources().getDisplayMetrics().density));
        assertTrue("a keyboard on the button wouldn't show",
                action.getBackground().isStateful());
        action.performClick();
        ShadowLooper.idleMainLooper();
        layout(dialog.getView());
        assertTrue(BaseSettings.PAUSED.savedValue());
        // A pause waiting for a restart brings the card up, and the card carries the button.
        assertSame(page.getPreferenceScreen().getPreference(0), list().getItemAtPosition(0));
        assertTrue(((Preference) list().getItemAtPosition(0)).getSummary().toString()
                .contains("pauses when Telegram restarts"));
        assertEquals(View.GONE, dialog.pauseAction.getVisibility());
        list().setSelection(0);
        layout(dialog.getView());
        action = statusAction();
        assertNotSame(dialog.pauseAction, action);
        assertEquals("Undo", action.getText().toString());
        action.performClick();
        ShadowLooper.idleMainLooper();
        layout(dialog.getView());
        assertFalse(BaseSettings.PAUSED.savedValue());
        assertEquals(View.VISIBLE, dialog.pauseAction.getVisibility());
        assertEquals("Pause", statusAction().getText().toString());
        assertTrue(Settings.HIDE_ADS.savedValue());
    }

    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void theBorderlessSupportRowShowsKeyboardSelection() {
        View row = list().getAdapter().getView(list().getCount() - 1, null, list());
        row.measure(View.MeasureSpec.makeMeasureSpec(780, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(96, View.MeasureSpec.EXACTLY));
        row.layout(0, 0, 780, 96);
        row.getBackground().setBounds(0, 0, 780, 96);
        Bitmap idle = Bitmap.createBitmap(780, 96, Bitmap.Config.ARGB_8888);
        row.getBackground().draw(new Canvas(idle));
        // The ring runs along the card's inset from the row's edge.
        int ringX = Math.round(ScreenColors.CARD_INSET * list().getResources().getDisplayMetrics().density) + 1;
        assertEquals("the link should be borderless until selected", 0, idle.getPixel(ringX, 48));
        row.setSelected(true);
        Bitmap selected = Bitmap.createBitmap(780, 96, Bitmap.Config.ARGB_8888);
        row.getBackground().draw(new Canvas(selected));
        assertEquals("keyboard selection must be visible", ScreenColors.DEFAULT.accent,
                selected.getPixel(ringX, 48));
        idle.recycle();
        selected.recycle();
    }

    /** A Resume the store can't keep leaves the pause on screen, in storage and in the switch, and says so. */
    @Test public void aResumeTheStoreCanNotKeepLeavesThePauseAndSaysSo() {
        BaseSettings.PAUSED.save(true);
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        recreate();
        layout(dialog.getView());
        assertEquals("Resume", statusAction().getText().toString());
        try (FailingStore ignored = FailingStore.install(FailingStore.Fault.COMMIT_THROWS, FailingStore.Fault.COMMIT_THROWS)) {
            statusAction().performClick();
            ShadowLooper.idleMainLooper();
        }
        layout(dialog.getView());
        assertEquals("Couldn't turn HushTelegram back on. Try again.", ShadowToast.getTextOfLatestToast());
        assertTrue(BaseSettings.PAUSED.savedValue());
        assertTrue(Setting.preferences.preferences.getBoolean(BaseSettings.PAUSED.key, false));
        assertTrue(((SwitchPreference) page.findPreference(BaseSettings.PAUSED.key)).isChecked());
        assertEquals("Resume", statusAction().getText().toString());

        // The same tap with the store working turns it back on from the next start.
        statusAction().performClick();
        ShadowLooper.idleMainLooper();
        layout(dialog.getView());
        assertFalse(BaseSettings.PAUSED.savedValue());
        assertFalse(((SwitchPreference) page.findPreference(BaseSettings.PAUSED.key)).isChecked());
        assertEquals("Undo", statusAction().getText().toString());
    }

    /** A marker Resume can't remove keeps the Pause switch on, and the card says both steps. */
    @Test public void aMarkerResumeCanNotRemoveKeepsTheSwitchAndSaysWhatToDo() throws Exception {
        File marker = HushTelegramPause.markerFile(controller.get());
        File held = new File(marker, "held");
        // A folder with something in it can't be deleted.
        assertTrue(marker.mkdirs() && held.createNewFile());
        try {
            BaseSettings.PAUSED.save(true);
            PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
            recreate();
            layout(dialog.getView());
            statusAction().performClick();
            ShadowLooper.idleMainLooper();
            layout(dialog.getView());
            assertTrue(BaseSettings.PAUSED.savedValue());
            assertEquals("Resume", statusAction().getText().toString());
            String line = String.valueOf(((Preference) list().getItemAtPosition(0)).getSummary());
            assertTrue(line, line.contains("couldn't be removed") && line.endsWith("then tap Resume again."));
        } finally {
            held.delete();
            marker.delete();
        }
    }

    private static final String PAUSED_LINE = "Until you resume, every switch except Debug logging acts as if it were off. Your choices stay "
            + "saved. Edits made when you patched stay in.";

    /**
     * Paused, the status card at the top of the home list says so while a section is open under it,
     * and the saved switches keep showing what was chosen. Resume and Undo act from the card, the
     * list stays where it was, and the headings keep their place when the card's wording changes.
     */
    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(qualifiers = "w390dp-h600dp-night-xhdpi")
    public void aPausedCategoryPageSaysSoAndKeepsItsPlaceThroughResumeAndUndo() {
        BaseSettings.PAUSED.save(true);
        Settings.REVEAL_SPOILERS.save(true);
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        recreate();
        layout(dialog.getView(), 1200);
        Preference card = (Preference) list().getItemAtPosition(0);
        assertSame(page.getPreferenceScreen().getPreference(0), card);
        assertEquals("HushTelegram is paused", String.valueOf(card.getTitle()));
        // Opening a section under the card leaves the card where it is, at the top.
        tap("section_Conversations");
        layout(dialog.getView(), 1200);
        assertSame(card, list().getItemAtPosition(0));
        assertEquals(0, list().getFirstVisiblePosition());
        assertEquals("a section added its own paused line", 1, occurrences(card));
        assertEquals("Your choices are saved. Tap Resume, then restart Telegram.",
                String.valueOf(((TextView) list().getChildAt(0).findViewById(android.R.id.summary)).getText()));
        // A paused card acts at once on a tap (it takes the pause off the next start), so a screen
        // reader hears it as a button that can be clicked.
        android.view.accessibility.AccessibilityNodeInfo lineNode = list().getChildAt(0).createAccessibilityNodeInfo();
        assertTrue("the paused card can't be pressed", lineNode.isClickable());
        assertTrue("the paused card has no click action", lineNode.getActionList()
                .contains(android.view.accessibility.AccessibilityNodeInfo.AccessibilityAction.ACTION_CLICK));
        assertEquals(android.widget.Button.class.getName(), String.valueOf(lineNode.getClassName()));
        assertTrue("a saved choice was changed to look paused",
                ((SwitchPreference) page.findPreference(Settings.REVEAL_SPOILERS.key)).isChecked());
        assertTrue(Settings.REVEAL_SPOILERS.savedValue());

        list().scrollListBy(40);
        layout(dialog.getView(), 1200);
        int position = list().getFirstVisiblePosition();
        int offset = list().getChildAt(0).getTop();
        android.widget.Button action = pageAction();
        assertEquals("Resume", action.getText().toString());
        assertTrue(action.getMinimumHeight() >= Math.round(48 * action.getResources().getDisplayMetrics().density));
        action.performClick();
        ShadowLooper.idleMainLooper();
        layout(dialog.getView(), 1200);
        assertFalse(BaseSettings.PAUSED.savedValue());
        assertEquals("HushTelegram turns back on when Telegram restarts.",
                String.valueOf(((Preference) list().getItemAtPosition(0)).getSummary()));
        assertTrue("Resume closed the section", contains(Settings.REVEAL_SPOILERS.key));
        assertEquals(position, list().getFirstVisiblePosition());
        assertEquals(offset, list().getChildAt(0).getTop());

        action = pageAction();
        assertEquals("Undo", action.getText().toString());
        action.performClick();
        ShadowLooper.idleMainLooper();
        layout(dialog.getView(), 1200);
        assertTrue(BaseSettings.PAUSED.savedValue());
        assertEquals("Your choices are saved. Tap Resume, then restart Telegram.",
                String.valueOf(((TextView) list().getChildAt(0).findViewById(android.R.id.summary)).getText()));
        assertEquals("Resume", pageAction().getText().toString());
        assertEquals(position, list().getFirstVisiblePosition());
        assertEquals(offset, list().getChildAt(0).getTop());
        assertTrue("Undo closed the section", page.navigation.isExpanded("Conversations"));
    }

    /** Cancelling a pending Pause must not clamp the list after its status card or line disappears. */
    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(qualifiers = "w390dp-h600dp-night-xhdpi")
    public void undoPendingPauseKeepsTheCategoryOffset() throws Exception {
        pendingPauseUndoKeepsOffset("Conversations", null, false);
    }

    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(qualifiers = "w390dp-h600dp-night-xhdpi")
    public void undoPendingPauseKeepsTheSearchOffset() throws Exception {
        pendingPauseUndoKeepsOffset(null, "Hide", false);
    }

    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(qualifiers = "w390dp-h600dp-night-xhdpi")
    public void undoPendingPauseKeepsTheOffsetWithAnExistingRestartNotice() throws Exception {
        pendingPauseUndoKeepsOffset("Conversations", null, true);
    }

    private void pendingPauseUndoKeepsOffset(String route, String search, boolean restart) throws Exception {
        int normalBottomPadding = list().getPaddingBottom();
        if (restart) app.hushtelegram.extension.shared.settings.preference.AbstractPreferenceFragment.restartPending.add(
                Settings.REVEAL_SPOILERS.key);
        BaseSettings.PAUSED.save(true);
        page.navigation.restartChanged();
        if (search == null) {
            // The section opens in place under the status card, which carries Undo and stays in reach.
            layout(dialog.getView(), 1200);
            tap("section_" + route);
        } else {
            findSearch(dialog.getView()).setText(search);
        }
        layout(dialog.getView(), 1200);
        list().scrollListBy(40);
        layout(dialog.getView(), 1200);
        int position = list().getFirstVisiblePosition();
        int offset = list().getChildAt(0).getTop();
        assertTrue("regression needs a genuinely scrolled page", offset < 0);
        assertEquals("Undo", pageAction().getText().toString());
        pageAction().performClick();
        ShadowLooper.idleMainLooper();
        layout(dialog.getView(), 1200);
        assertFalse(BaseSettings.PAUSED.savedValue());
        assertFalse(HushTelegramPause.isPaused());
        assertEquals(position, list().getFirstVisiblePosition());
        assertEquals(offset, list().getChildAt(0).getTop());
        if (restart) {
            assertEquals(position(Settings.REVEAL_SPOILERS.key) + 1, position(SettingsNavigation.RESTART));
            assertEquals("Restart Telegram to apply this change",
                    String.valueOf(((Preference) list().getItemAtPosition(position(SettingsNavigation.RESTART))).getTitle()));
        } else {
            assertFalse(titles().contains("HushTelegram is on"));
        }
        capture("undo-pending-" + (restart ? "restart" : search == null ? "category" : "search"), 1200);

        page.navigation.navigate("About");
        layout(dialog.getView(), 1200);
        assertEquals(normalBottomPadding, list().getPaddingBottom());
        assertTrue("About's heading isn't in view", position("section_About") >= list().getFirstVisiblePosition()
                && position("section_About") <= list().getLastVisiblePosition());
        findSearch(dialog.getView()).setText("Hide");
        layout(dialog.getView(), 1200);
        assertEquals(normalBottomPadding, list().getPaddingBottom());
        assertFalse(titles().contains("HushTelegram is on"));
    }

    /**
     * Search results say it too. An open section adds no line of its own, since the status card
     * says it once for the whole home list, and a search that finds nothing Pause turns off, like
     * About's licenses, doesn't carry one.
     */
    @Test public void pausedSearchSaysSoAndSectionsLeaveTheLineToTheStatusCard() {
        BaseSettings.PAUSED.save(true);
        PauseForTests.pause(HushTelegramPause.Reason.CRASH_LOOP);
        recreate();
        findSearch(dialog.getView()).setText("Hide ads");
        ShadowLooper.idleMainLooper();
        assertEquals(PAUSED_LINE, String.valueOf(((Preference) list().getItemAtPosition(0)).getSummary()));
        assertTrue(contains(Settings.HIDE_ADS.key));
        page.navigation.back();
        assertSame(page.getPreferenceScreen().getPreference(0), list().getItemAtPosition(0));
        assertEquals("HushTelegram is paused", String.valueOf(((Preference) list().getItemAtPosition(0)).getTitle()));
        page.navigation.navigate("Links");
        assertEquals("Links has Pause-controlled switches", categoryCount("Links"), sectionRows("Links").size());
        assertEquals("the section drew a paused line of its own", 1, paused());
        assertTrue(contains(Settings.OPEN_EXTERNAL_LINKS.key));
        assertTrue(contains(Settings.STRIP_LINK_TRACKING.key));
        page.navigation.navigate("About");
        assertEquals("About", categoryCount("About"), sectionRows("About").size());
        assertEquals(1, paused());
        // A search that only reaches rows Pause doesn't turn off has no line.
        page.navigation.search("licenses");
        assertTrue(titles().contains("Licenses"));
        assertEquals("a search of About drew a paused line", 0, paused());
        page.navigation.search("");
        // Without either link family the same Links section still has no Pause-controlled setting.
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.HIDE_ADS);
        recreate();
        page.navigation.navigate("Links");
        assertEquals("Links without the link patches", categoryCount("Links"), sectionRows("Links").size());
        assertFalse(contains(Settings.OPEN_EXTERNAL_LINKS.key));
        assertFalse(contains(Settings.STRIP_LINK_TRACKING.key));
    }

    /** How many rows are titled as the paused status. */
    private int paused() {
        int found = 0;
        for (String title : titles()) if (title.equals("HushTelegram is paused")) found++;
        return found;
    }

    /** A home row names only what its page holds in this build, down to the ad hooks inserted. */
    @Test public void homeLinesNameOnlyWhatThisBuildPutOnTheirPages() {
        assertEquals("Ads in channels and search, and more", homeLine("Ads"));
        assertEquals("Usage reports and call diagnostics, and more", homeLine("Privacy"));
        for (String quiet : new String[] {"Chat list", "Conversations", "Playback", "Notifications", "Look and feel"}) {
            assertTrue("missing page " + quiet, contains("section_" + quiet));
            assertNull(quiet, homeLine(quiet));
        }
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.HIDE_ADS, PatchFamily.DISABLE_ANALYTICS);
        recreate();
        assertEquals("Ads in channels and search", homeLine("Ads"));
        assertEquals("Usage reports", homeLine("Privacy"));
        assertFalse("a page with nothing on it", contains("section_Conversations"));
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.HIDE_STORIES, PatchFamily.DISABLE_CALL_DEBUG);
        recreate();
        assertFalse("an Ads page with nothing on it", contains("section_Ads"));
        assertEquals("Call diagnostics", homeLine("Privacy"));
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.HIDE_ADS, PatchFamily.HIDE_POPULAR_APPS);
        recreate();
        assertEquals("Ads in channels and search, and more", homeLine("Ads"));
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.HIDE_ADS, PatchFamily.HIDE_COMMERCE);
        recreate();
        assertEquals("Ads in channels and search, and more", homeLine("Ads"));
        // A switch on another page adds nothing to the Ads line.
        for (PatchFamily elsewhere : EnumSet.of(PatchFamily.DISABLE_CHAT_SWIPE, PatchFamily.QUIET_CONTACTS_NAG,
                PatchFamily.HOLIDAY_LOOK, PatchFamily.HIDE_RECOMMENDATIONS)) {
            PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.HIDE_ADS, elsewhere);
            recreate();
            assertEquals(elsewhere.name(), "Ads in channels and search", homeLine("Ads"));
            PatchFamily.inBuildForTests = EnumSet.of(elsewhere);
            recreate();
            assertFalse(elsewhere.name(), contains("section_Ads"));
        }
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.DISABLE_ANALYTICS, PatchFamily.DISABLE_DRAFT_PREVIEWS);
        recreate();
        assertEquals("Usage reports, and more", homeLine("Privacy"));
        // The draft switch is off as shipped, but a page holding only it still names what it holds.
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.DISABLE_DRAFT_PREVIEWS);
        recreate();
        assertEquals("Draft link previews", homeLine("Privacy"));
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.GALLERY_CAMERA_ON_TAP);
        recreate();
        assertEquals("Gallery camera", homeLine("Privacy"));
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.DISABLE_DRAFT_PREVIEWS, PatchFamily.GALLERY_CAMERA_ON_TAP);
        recreate();
        assertEquals("Draft link previews, and more", homeLine("Privacy"));
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.DISABLE_CALL_DEBUG, PatchFamily.GALLERY_CAMERA_ON_TAP);
        recreate();
        assertEquals("Call diagnostics, and more", homeLine("Privacy"));
        // The phone number switch moved here from Chats: it adds "and more", and alone names nothing.
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.DISABLE_ANALYTICS, PatchFamily.HIDE_PHONE_NUMBER);
        recreate();
        assertEquals("Usage reports, and more", homeLine("Privacy"));
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.GALLERY_CAMERA_ON_TAP, PatchFamily.HIDE_PHONE_NUMBER);
        recreate();
        assertEquals("Gallery camera, and more", homeLine("Privacy"));
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.HIDE_PHONE_NUMBER);
        recreate();
        assertTrue(contains("section_Privacy"));
        assertNull(homeLine("Privacy"));
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        PatchFamily.capabilitiesForTests = EnumSet.of(PatchFamily.Capability.CHANNEL_ADS, PatchFamily.Capability.VIDEO_ADS);
        recreate();
        assertEquals("Ads in channels, and more", homeLine("Ads"));
        PatchFamily.capabilitiesForTests = EnumSet.of(PatchFamily.Capability.SEARCH_ADS);
        recreate();
        assertEquals("Ads in search, and more", homeLine("Ads"));
        PatchFamily.capabilitiesForTests = EnumSet.noneOf(PatchFamily.Capability.class);
        recreate();
        assertNull(homeLine("Ads"));
    }

    /**
     * Pause switched on from its own section is owed a restart: the status card says so, the restart
     * row sits with it, and Undo takes both back. A change owed a restart brings the row up under
     * the switch that asked for it, and first in the list, or under the status card, when that
     * switch is out of view.
     */
    @Test public void aPauseOrAChangeWaitingOnARestartBringsUpTheRestartRow() {
        page.navigation.navigate("Pause");
        tap(BaseSettings.PAUSED.key);
        layout(dialog.getView());
        assertSame(page.getPreferenceScreen().getPreference(0), list().getItemAtPosition(0));
        Preference line = (Preference) list().getItemAtPosition(0);
        assertEquals("HushTelegram is on", String.valueOf(line.getTitle()));
        assertEquals("HushTelegram pauses when Telegram restarts.", String.valueOf(line.getSummary()));
        int at = position(SettingsNavigation.RESTART);
        assertTrue("the restart row isn't with the card or the Pause switch",
                at == 1 || at == position(BaseSettings.PAUSED.key) + 1);
        Preference restart = (Preference) list().getItemAtPosition(at);
        assertEquals("Restart Telegram to apply this change", String.valueOf(restart.getTitle()));
        assertEquals("Telegram closes and reopens on this page.", String.valueOf(restart.getSummary()));
        assertTrue("the restart row can't be tapped", list().getAdapter().isEnabled(at));
        assertNull("a restart saved message went to a toast instead of the row", ShadowToast.getLatestToast());
        list().setSelection(0);
        layout(dialog.getView());
        assertEquals("Undo", pageAction().getText().toString());
        pageAction().performClick();
        ShadowLooper.idleMainLooper();
        layout(dialog.getView());
        assertFalse(BaseSettings.PAUSED.savedValue());
        assertEquals("section_Ads", ((Preference) list().getItemAtPosition(0)).getKey());
        assertFalse(contains(SettingsNavigation.RESTART));
        assertEquals(View.VISIBLE, dialog.pauseAction.getVisibility());
        // Close Pause again so the counts below are the bare home list.
        tap("section_Pause");
        assertFalse(page.navigation.isExpanded("Pause"));

        app.hushtelegram.extension.shared.settings.preference.AbstractPreferenceFragment.restartPending.add(
                Settings.HIDE_ADS.key);
        page.navigation.navigate("Ads");
        layout(dialog.getView());
        // The switch is in view, so the row sits right under it.
        at = position(SettingsNavigation.RESTART);
        assertEquals(position(Settings.HIDE_ADS.key) + 1, at);
        line = (Preference) list().getItemAtPosition(at);
        assertEquals(String.valueOf(line.getTitle()),
                String.valueOf(((android.widget.TextView) list().getAdapter().getView(at, null, list())
                        .findViewById(android.R.id.title)).getText()));
        assertEquals(categoryCount("Ads"), sectionRows("Ads").size());
        // Closed, the switch is out of view and no card is drawn, so the row leads the list.
        tap("section_Ads");
        assertEquals(SettingsNavigation.RESTART, ((Preference) list().getItemAtPosition(0)).getKey());
        page.navigation.navigate("Privacy");
        assertEquals(SettingsNavigation.RESTART, ((Preference) list().getItemAtPosition(0)).getKey());
        assertEquals(categoryCount("Privacy"), sectionRows("Privacy").size());
        tap("section_Privacy");
        assertEquals(SettingsNavigation.RESTART, ((Preference) list().getItemAtPosition(0)).getKey());
        assertEquals(17, list().getCount());

        // With the status card drawn the row goes under it.
        BaseSettings.PAUSED.save(true);
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        recreate();
        assertSame(page.getPreferenceScreen().getPreference(0), list().getItemAtPosition(0));
        assertEquals(SettingsNavigation.RESTART, ((Preference) list().getItemAtPosition(1)).getKey());
        assertEquals(18, list().getCount());

        // Two changes are counted, and the row goes once neither is owed.
        app.hushtelegram.extension.shared.settings.preference.AbstractPreferenceFragment.restartPending.add(
                Settings.USE_SYSTEM_FONT.key);
        page.navigation.restartChanged();
        assertEquals("Restart Telegram to apply 2 changes",
                String.valueOf(((Preference) list().getItemAtPosition(1)).getTitle()));
        app.hushtelegram.extension.shared.settings.preference.AbstractPreferenceFragment.restartPending.clear();
        page.navigation.restartChanged();
        assertFalse(contains(SettingsNavigation.RESTART));
        assertEquals(17, list().getCount());
    }

    /** A switch that needs a restart brings the row up the moment it's flipped, and flipping it back takes it away. */
    @Test public void flippingARestartGatedSwitchShowsTheRowAtOnce() {
        try {
            page.navigation.navigate("Look and feel");
            assertFalse(contains(SettingsNavigation.RESTART));
            tap(Settings.USE_SYSTEM_FONT.key);
            assertTrue(Settings.USE_SYSTEM_FONT.savedValue());
            int at = position(Settings.USE_SYSTEM_FONT.key) + 1;
            assertEquals(SettingsNavigation.RESTART, ((Preference) list().getItemAtPosition(at)).getKey());
            assertEquals("Restart Telegram to apply this change",
                    String.valueOf(((Preference) list().getItemAtPosition(at)).getTitle()));
            assertNull("the restart was said in a toast with nothing to tap", ShadowToast.getLatestToast());
            tap(Settings.USE_SYSTEM_FONT.key);
            assertFalse(Settings.USE_SYSTEM_FONT.savedValue());
            assertFalse(contains(SettingsNavigation.RESTART));
        } finally {
            Settings.USE_SYSTEM_FONT.resetToDefault();
        }
    }

    /** The row restarts Telegram and leaves a marker that opens the screen again with this section open. */
    @Test public void theRestartRowRestartsIntoThePageItWasTappedOn() {
        List<android.content.Context> restarted = new ArrayList<>();
        app.hushtelegram.extension.shared.settings.preference.ReopenSettingsAfterRestart.setRestarterForTests(restarted::add);
        app.hushtelegram.extension.shared.settings.preference.AbstractPreferenceFragment.restartPending.add(
                Settings.USE_SYSTEM_FONT.key);
        page.navigation.navigate("Look and feel");
        Map<String, Object> before = savedValues();
        tap(SettingsNavigation.RESTART);
        assertEquals(1, restarted.size());
        assertEquals(before, savedValues());
        String marker = app.hushtelegram.extension.shared.settings.preference.ReopenSettingsAfterRestart
                .takeFresh(Setting.preferences.preferences, android.os.SystemClock.elapsedRealtime());
        assertNotNull(marker);
        assertTrue(marker, marker.startsWith(SettingsNavigation.RESTART_STATE + "?"));
        android.os.Bundle state = SettingsNavigation.restartState(marker);
        assertNotNull(state);
        assertEquals(Collections.singletonList("Look and feel"), state.getStringArrayList("expanded"));
        assertEquals("", state.getString("query"));

        // A screen started with the marker comes back with that section open.
        dialog.dismissAllowingStateLoss();
        ShadowLooper.idleMainLooper();
        dialog = SettingsDialog.onPage(marker);
        dialog.show(controller.get().getFragmentManager(), "hushtelegram_settings");
        controller.get().getFragmentManager().executePendingTransactions();
        ShadowLooper.idleMainLooper();
        page = page(dialog);
        assertTrue(page.navigation.isExpanded("Look and feel"));
        assertTrue(contains(Settings.USE_SYSTEM_FONT.key));
        assertFalse(page.navigation.isExpanded("Ads"));
    }

    /** Asked to open on a page, as after that restart, the screen starts with that section open. */
    @Test public void aScreenAskedToStartOnAPageOpensThere() {
        dialog.dismissAllowingStateLoss();
        ShadowLooper.idleMainLooper();
        dialog = SettingsDialog.onPage("Links");
        dialog.show(controller.get().getFragmentManager(), "hushtelegram_settings");
        controller.get().getFragmentManager().executePendingTransactions();
        ShadowLooper.idleMainLooper();
        page = page(dialog);
        assertEquals("Links", dialog.startPage());
        assertTrue(page.navigation.isExpanded("Links"));
        assertTrue(contains(Settings.OPEN_EXTERNAL_LINKS.key));
        assertEquals(categoryCount("Links"), sectionRows("Links").size());
        assertEquals("HushTelegram", pageTitle().getText().toString());
        assertFalse("Back from the home list closes the dialog", page.navigation.back());
        assertTrue(contains("section_Links"));

        // A page this build doesn't have opens the home list with every section closed.
        dialog.dismissAllowingStateLoss();
        ShadowLooper.idleMainLooper();
        dialog = SettingsDialog.onPage("No such page");
        dialog.show(controller.get().getFragmentManager(), "hushtelegram_settings");
        controller.get().getFragmentManager().executePendingTransactions();
        ShadowLooper.idleMainLooper();
        page = page(dialog);
        assertEquals(16, list().getCount());
        for (Preference section : page.sections()) assertFalse(page.navigation.isExpanded(section.getTitle().toString()));
    }

    /** The paused card on the home list and over an open section, dark and light, for a look before the phone does. */
    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void renderPausedPages() throws Exception {
        BaseSettings.PAUSED.save(true);
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        recreate();
        capture("paused-home");
        assertUncutText(dialog.getView());
        page.navigation.navigate("Conversations");
        capture("paused-feed");
        assertUncutText(dialog.getView());
        list().setSelection(0);
        layout(dialog.getView());
        pageAction().performClick();
        ShadowLooper.idleMainLooper();
        capture("paused-feed-resume-pending");
        findSearch(dialog.getView()).setText("links");
        capture("paused-search");
    }

    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(sdk = {28, 30, 33, 36}, qualifiers = "ar-rXB-ldrtl-w390dp-h844dp-night-xhdpi")
    public void aPausedPageKeepsItsLineWholeAtLargeRightToLeftText() throws Exception {
        BaseSettings.PAUSED.save(true);
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        org.robolectric.RuntimeEnvironment.setFontScale(2f);
        try {
            recreate();
            page.navigation.navigate("Privacy");
            layout(dialog.getView());
            assertUncutText(dialog.getView());
            // The card keeps its whole line at the top of the list too.
            list().setSelection(0);
            layout(dialog.getView());
            assertSame(page.getPreferenceScreen().getPreference(0), list().getItemAtPosition(0));
            assertUncutText(dialog.getView());
            capture("large-rtl-paused-privacy");
        } finally {
            org.robolectric.RuntimeEnvironment.setFontScale(1f);
        }
    }

    /** The button Pause, Resume or Undo is on: the status card's or search line's when one is drawn first, else the toolbar's. */
    private android.widget.Button pageAction() {
        return statusAction();
    }

    /** The rows an open section draws under its heading, in order. Empty while it is closed. */
    private List<Preference> sectionRows(String id) {
        List<Preference> rows = new ArrayList<>();
        int heading = position("section_" + id);
        assertTrue("no heading for " + id, heading >= 0);
        for (int i = heading + 1; i < list().getCount(); i++) {
            Preference item = (Preference) list().getItemAtPosition(i);
            String key = item.getKey();
            if (key != null && (key.startsWith("section_") || key.equals(SettingsNavigation.CHANGED))) break;
            if (SettingsNavigation.RESTART.equals(key)) continue;
            rows.add(item);
        }
        return rows;
    }

    private int categoryCount(String title) {
        for (Preference section : page.sections()) {
            if (title.contentEquals(section.getTitle())) return ((PreferenceCategory) section).getPreferenceCount();
        }
        throw new AssertionError("No section " + title);
    }

    /** Paused, the overview says what to do in order. It used to read as if a restart came before Resume. */
    @Test public void aPausedOverviewSaysToTapResumeThenRestart() {
        BaseSettings.PAUSED.save(true);
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        recreate();
        layout(dialog.getView());
        TextView summary = list().getChildAt(0).findViewById(android.R.id.summary);
        assertEquals("Your choices are saved. Tap Resume, then restart Telegram.", String.valueOf(summary.getText()));
    }

    /**
     * At twice the text size the button beside the status text left the name too little room and
     * "HushTelegram" broke inside the word. From one and a half times, the button goes under the text.
     */
    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void atLargeTextTheStatusActionSitsUnderItsText() {
        BaseSettings.PAUSED.save(true);
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        org.robolectric.RuntimeEnvironment.setFontScale(2f);
        try {
            recreate();
            layout(dialog.getView());
            View row = list().getChildAt(0);
            assertSame(page.getPreferenceScreen().getPreference(0), list().getItemAtPosition(0));
            TextView title = row.findViewById(android.R.id.title);
            TextView summary = row.findViewById(android.R.id.summary);
            android.text.Layout lines = title.getLayout();
            for (int line = 0; line + 1 < lines.getLineCount(); line++) {
                char last = title.getText().charAt(lines.getLineEnd(line) - 1);
                assertTrue("\"" + title.getText() + "\" breaks inside a word after line " + line, Character.isWhitespace(last));
            }
            assertEquals(View.GONE, row.findViewById(android.R.id.widget_frame).getVisibility());
            android.widget.Button action = firstButton(row);
            assertNotNull("no Resume button in the status row", action);
            assertEquals(summary.getParent(), action.getParent());
            assertTrue("the button isn't under the text", action.getTop() >= summary.getBottom());
            assertEquals("Resume", action.getText().toString());

            // Unpaused there is no card, and the toolbar's Pause goes under the screen title the same way.
            PauseForTests.resume();
            BaseSettings.PAUSED.resetToDefault();
            recreate();
            layout(dialog.getView());
            assertEquals(View.VISIBLE, dialog.pauseAction.getVisibility());
            assertEquals("Pause", dialog.pauseAction.getText().toString());
            assertSame(pageTitle().getParent(), dialog.pauseAction.getParent());
            assertTrue("the toolbar's button isn't under the title", dialog.pauseAction.getTop() >= pageTitle().getBottom());
        } finally {
            org.robolectric.RuntimeEnvironment.setFontScale(1f);
        }
    }

    private static android.widget.Button firstButton(View view) {
        if (view instanceof android.widget.Button) return (android.widget.Button) view;
        if (view instanceof android.view.ViewGroup) {
            android.view.ViewGroup group = (android.view.ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                android.widget.Button found = firstButton(group.getChildAt(i));
                if (found != null) return found;
            }
        }
        return null;
    }

    /**
     * The button on the first row when that row is the status card or a page's pause line, else
     * the toolbar's Pause, Resume or Undo, which is what shows when no card is drawn.
     */
    private android.widget.Button statusAction() {
        View first = list().getChildAt(0);
        View card = first == null ? null : first.findViewWithTag("hushtelegram_status_action");
        if (card != null) return (android.widget.Button) card;
        assertEquals("no card is drawn, so the toolbar has to carry the button", View.VISIBLE, dialog.pauseAction.getVisibility());
        return dialog.pauseAction;
    }

    @Test public void searchUsesRealControlsAndClearReturnsHome() {
        EditText search = findSearch(dialog.getView());
        assertNotNull(search);
        search.setText("update checks");
        ShadowLooper.idleMainLooper();
        assertTrue(contains(Settings.DISABLE_UPDATE_CHECKS.key));
        tap(Settings.DISABLE_UPDATE_CHECKS.key);
        assertFalse(Settings.DISABLE_UPDATE_CHECKS.savedValue());
        search.setText("noSuchSetting987654");
        assertEquals(1, list().getCount());
        assertFalse(list().getAdapter().isEnabled(0));
        assertEquals("No matching settings", ((Preference) list().getItemAtPosition(0)).getTitle());
        assertTrue(page.navigation.back());
        assertEquals("", search.getText().toString());
        assertEquals(16, list().getCount());
    }

    /** A row with no summary used to carry the word "null" into its search text. */
    @Test public void aRowWithNoSummaryIsNotFoundByTheWordNull() {
        Preference row = page.findPreference(Settings.DISABLE_UPDATE_CHECKS.key);
        row.setSummary(null);
        page.navigation.search("update checks null");
        assertEquals(1, list().getCount());
        assertEquals("No matching settings", ((Preference) list().getItemAtPosition(0)).getTitle());
        page.navigation.search("update checks");
        assertTrue("the row is still found by its title", contains(Settings.DISABLE_UPDATE_CHECKS.key));
    }

    /**
     * On the S22 with TalkBack, typing a search said only "Edit box": the list changed without a
     * word. The count now sits in a polite live region, written once the typing settles.
     */
    @Test public void searchSpeaksItsResultCountOnceTheTypingSettles() {
        EditText search = findSearch(dialog.getView());
        TextView before = resultCount(dialog.getView());
        assertTrue(before == null || before.getVisibility() == View.GONE);
        java.util.List<String> spoken = new java.util.ArrayList<>();
        search.setText("h");
        TextView count = resultCount(dialog.getView());
        assertNotNull("a live region for the result count", count);
        count.addTextChangedListener(new android.text.TextWatcher() {
            @Override public void beforeTextChanged(CharSequence s, int start, int before, int after) { }
            @Override public void onTextChanged(CharSequence s, int start, int before, int after) { spoken.add(s.toString()); }
            @Override public void afterTextChanged(android.text.Editable s) { }
        });
        search.setText("hi");
        search.setText("hide");
        search.setText("hide ads");
        ShadowLooper.idleMainLooper(2, java.util.concurrent.TimeUnit.SECONDS);
        int rows = 0;
        for (int i = 0; i < list().getCount(); i++) if (!(list().getItemAtPosition(i) instanceof PreferenceCategory)) rows++;
        assertTrue(rows > 0);
        assertEquals(java.util.Collections.singletonList(rows + (rows == 1 ? " setting found" : " settings found")), spoken);
        assertEquals(View.VISIBLE, count.getVisibility());
        search.setText("noSuchSetting987654");
        ShadowLooper.idleMainLooper(2, java.util.concurrent.TimeUnit.SECONDS);
        assertEquals("0 settings found", count.getText().toString());
        search.setText("");
        ShadowLooper.idleMainLooper(2, java.util.concurrent.TimeUnit.SECONDS);
        assertEquals(View.GONE, count.getVisibility());
    }

    /**
     * On the S22, Back left TalkBack's focus on the whole screen, so a screen reader user lost
     * their place in the list. It goes back to the row the page was opened from. Robolectric's
     * window has no surface and drops accessibility focus on its next traversal, so the test
     * reads the focus event the row sent rather than the row's state afterwards.
     */
    @Test public void backPutsScreenReaderFocusOnTheRowThePageCameFrom() {
        android.view.accessibility.AccessibilityManager a11y = controller.get().getSystemService(android.view.accessibility.AccessibilityManager.class);
        org.robolectric.Shadows.shadowOf(a11y).setEnabled(true);
        org.robolectric.Shadows.shadowOf(a11y).setTouchExplorationEnabled(true);
        layout(dialog.getView());
        // A section opened or closed in place hands focus to its own heading, so the place isn't lost.
        page.navigation.navigate("Privacy");
        layout(dialog.getView());
        tap("section_Privacy");
        layout(dialog.getView());
        assertFalse(page.navigation.isExpanded("Privacy"));
        assertEquals("Privacy", focusedTitle(a11y));
        tap("section_About");
        layout(dialog.getView());
        assertTrue(page.navigation.isExpanded("About"));
        assertEquals("About", focusedTitle(a11y));
        tap("section_About");
        layout(dialog.getView());
        assertEquals("About", focusedTitle(a11y));
        // Back from Changed switches returns to the row that opened it.
        list().setSelection(titles().indexOf("Changed switches"));
        layout(dialog.getView());
        tap(SettingsNavigation.CHANGED);
        layout(dialog.getView());
        assertTrue(page.navigation.back());
        layout(dialog.getView());
        assertEquals("Changed switches", focusedTitle(a11y));
    }

    /** The first text of the last row that took accessibility focus. */
    private static String focusedTitle(android.view.accessibility.AccessibilityManager a11y) {
        String title = null;
        for (android.view.accessibility.AccessibilityEvent event : org.robolectric.Shadows.shadowOf(a11y).getSentAccessibilityEvents()) {
            if (event.getEventType() != android.view.accessibility.AccessibilityEvent.TYPE_VIEW_ACCESSIBILITY_FOCUSED) continue;
            title = event.getText().isEmpty() ? null : String.valueOf(event.getText().get(0));
        }
        return title;
    }

    private static TextView resultCount(View view) {
        if (view instanceof TextView && !(view instanceof EditText)
                && view.getAccessibilityLiveRegion() == View.ACCESSIBILITY_LIVE_REGION_POLITE) return (TextView) view;
        if (view instanceof android.view.ViewGroup) {
            android.view.ViewGroup group = (android.view.ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                TextView found = resultCount(group.getChildAt(i));
                if (found != null) return found;
            }
        }
        return null;
    }

    @Test @Config(sdk = {28, 30, 33, 36})
    public void recreationKeepsTheOpenSectionAndSearchQuery() {
        page.navigation.open(page.findPreference(Settings.DISABLE_UPDATE_CHECKS.key));
        recreate();
        assertTrue(contains(Settings.DISABLE_UPDATE_CHECKS.key));
        assertTrue(page.navigation.isExpanded("Updates"));
        assertFalse(page.navigation.isExpanded("Ads"));
        // Updates: Turn off Telegram's update checks, Check for new HushTelegram releases and Check now.
        assertEquals(3, sectionRows("Updates").size());
        findSearch(dialog.getView()).setText("update checks");
        recreate();
        assertEquals("update checks", findSearch(dialog.getView()).getText().toString());
        assertTrue(contains(Settings.DISABLE_UPDATE_CHECKS.key));
    }

    @Test public void bothBackPathsReturnHomeFromChangedSwitchesBeforeClosingTheDialog() {
        tap(SettingsNavigation.CHANGED);
        assertEquals("Changed switches", pageTitle().getText().toString());
        SettingsL10nTest.backOf(dialog).performClick();
        assertTrue(dialog.getDialog().isShowing());
        assertEquals(16, list().getCount());
        assertEquals("HushTelegram", pageTitle().getText().toString());
        tap(SettingsNavigation.CHANGED);
        dialog.getDialog().onBackPressed();
        assertTrue(dialog.getDialog().isShowing());
        assertEquals(16, list().getCount());
        // Sections open in place on the home list, so there is nothing between it and leaving.
        page.navigation.navigate("About");
        android.app.Dialog shown = dialog.getDialog();
        shown.onBackPressed();
        ShadowLooper.idleMainLooper();
        assertFalse("system Back left the dialog up", shown.isShowing());
        assertFalse(controller.get().isFinishing());

        // The toolbar's arrow on the home list closes it as well.
        dialog = SettingsL10nTest.show(controller.get());
        page = page(dialog);
        shown = dialog.getDialog();
        assertTrue(shown.isShowing());
        SettingsL10nTest.backOf(dialog).performClick();
        ShadowLooper.idleMainLooper();
        assertFalse("the toolbar's arrow left the dialog up", shown.isShowing());
        assertFalse(controller.get().isFinishing());
    }

    /**
     * The home page ends with Support HushTelegram, under Report a problem. A tap opens the Ko-fi page
     * in a browser of its own, and with no browser a tip names the address and Telegram keeps running.
     */
    @Test public void theHomePageEndsWithSupportWhichOpensKoFi() {
        Map<String, Object> before = savedValues();
        int last = list().getCount() - 1;
        Preference row = (Preference) list().getItemAtPosition(last);
        assertEquals(HushTelegramPreferenceFragment.SUPPORT, row.getKey());
        assertEquals("Support HushTelegram", String.valueOf(row.getTitle()));
        assertNull("the support row is its title alone", row.getSummary());
        assertEquals("Report a problem", String.valueOf(((Preference) list().getItemAtPosition(last - 1)).getTitle()));
        assertEquals("Changed switches", String.valueOf(((Preference) list().getItemAtPosition(last - 2)).getTitle()));
        assertTrue(list().getAdapter().isEnabled(last));

        tap(HushTelegramPreferenceFragment.SUPPORT);
        android.content.Intent started = org.robolectric.Shadows.shadowOf(controller.get()).getNextStartedActivity();
        assertNotNull("nothing opened", started);
        assertEquals(android.content.Intent.ACTION_VIEW, started.getAction());
        assertEquals("https://ko-fi.com/X8K126YVER", started.getDataString());
        assertTrue(started.hasCategory(android.content.Intent.CATEGORY_BROWSABLE));
        assertTrue("the page would open inside Telegram's task",
                (started.getFlags() & android.content.Intent.FLAG_ACTIVITY_NEW_TASK) != 0);
        assertNull(started.getComponent());
        assertEquals("the tap left the home page", last + 1, list().getCount());

        org.robolectric.shadows.ShadowApplication application =
                org.robolectric.Shadows.shadowOf(org.robolectric.RuntimeEnvironment.getApplication());
        application.checkActivities(true);
        try {
            tap(HushTelegramPreferenceFragment.SUPPORT);
            assertEquals("Can't open the link. Go to " + L10n.isolate("ko-fi.com/X8K126YVER") + ".",
                    ShadowToast.getTextOfLatestToast());
            assertFalse(controller.get().isFinishing());
        } finally {
            application.checkActivities(false);
        }
        assertEquals(before, savedValues());
        assertEquals(16, list().getCount());
    }

    /**
     * The home page leads with the switch sections: the first heading is the first row while
     * nothing is paused, and neither Quick setups nor the lock is on it (Matt, 2026-10-16).
     */
    @Test public void theHomePageLeadsWithTheSwitchSections() {
        assertEquals("section_Ads", ((Preference) list().getItemAtPosition(0)).getKey());
        assertFalse("a heading above the sections", titles().contains("Browse settings"));
        assertFalse(contains(SettingsNavigation.QUICK_SETUPS));
        assertFalse(contains(SettingsNavigation.LOCK));
        assertEquals(16, list().getCount());
    }

    /** Quick setups opens from Settings backup, and search still finds it. */
    @Test public void quickSetupsOpenFromSettingsBackup() {
        page.navigation.navigate("Settings backup");
        Preference row = page.findPreference(SettingsNavigation.QUICK_SETUPS);
        assertEquals("Quick setups", String.valueOf(row.getTitle()));
        assertEquals("Turn on a set of switches in one tap, or put every switch back the way it started.",
                String.valueOf(row.getSummary()));
        assertTrue(contains(SettingsNavigation.QUICK_SETUPS));
        tap(SettingsNavigation.QUICK_SETUPS);
        AlertDialog choices = (AlertDialog) org.robolectric.shadows.ShadowDialog.getLatestDialog();
        assertNotNull("Quick setups opened no dialog", choices);
        choices.dismiss();
        while (page.navigation.back()) { }
        page.navigation.search("quick setups");
        assertTrue("search lost Quick setups", contains(SettingsNavigation.QUICK_SETUPS));
    }

    /** The lock sits on the Pause page under Pause, search finds it, and its row reads the lock's state as it's drawn. */
    @Test public void theLockSitsOnThePausePage() {
        page.navigation.navigate("Pause");
        assertTrue("the lock comes after Pause", position(BaseSettings.PAUSED.key) < position(SettingsNavigation.LOCK));
        Preference lock = page.findPreference(SettingsNavigation.LOCK);
        assertEquals("Lock HushTelegram settings", String.valueOf(lock.getTitle()));
        long[] now = {1_800_000_000_000L};
        SettingsLockForTests.handClocks(now);
        try {
            tap(SettingsNavigation.LOCK);
            assertEquals(SettingsLock.State.JUST_LOCKED, SettingsLock.state());
            assertEquals("Unlock now", String.valueOf(lock.getTitle()));
            now[0] += SettingsLock.QUICK_UNLOCK_MILLIS;
            assertEquals(SettingsLock.State.LOCKED, SettingsLock.state());
            assertEquals("Start unlock", String.valueOf(lock.getTitle()));
            View drawn = list().getAdapter().getView(position(SettingsNavigation.LOCK), null, list());
            assertEquals("Start unlock", String.valueOf(((android.widget.TextView) drawn.findViewById(android.R.id.title)).getText()));
            while (page.navigation.back()) { }
            page.navigation.search("start unlock");
            assertTrue("search lost the lock", contains(SettingsNavigation.LOCK));
        } finally {
            SettingsLockForTests.forget();
        }
    }

    /**
     * Settings look heads Look and feel, says which look is on, and a tap redraws every page in the
     * other one (#18). The choice is the screen's own.
     */
    @Test public void theSettingsLookRowSwitchesThePagesBetweenCardsAndPlainRows() throws Exception {
        int dp = Math.round(list().getResources().getDisplayMetrics().density);
        page.navigation.navigate("Look and feel");
        int at = position(SettingsNavigation.SETTINGS_LOOK);
        assertTrue("no Settings look row on Look and feel", at >= 0);
        for (int i = 0; i < at; i++) {
            Preference before = (Preference) list().getItemAtPosition(i);
            assertFalse("a switch came before Settings look", before instanceof android.preference.TwoStatePreference);
        }
        Preference look = (Preference) list().getItemAtPosition(at);
        assertEquals("Settings look", String.valueOf(look.getTitle()));
        assertEquals("Cards. Tap for plain rows.", String.valueOf(look.getSummary()));
        // Cards keep the text clear of the card's edge and its inset.
        assertEquals((ScreenColors.CARD_INSET + 14) * dp,
                list().getAdapter().getView(position(Settings.AMOLED_BLACK.key), null, list()).getPaddingStart());

        tap(SettingsNavigation.SETTINGS_LOOK);
        assertTrue(SettingsNavigation.PLAIN_ROWS.savedValue());
        assertEquals("Plain rows. Tap for cards.", String.valueOf(look.getSummary()));
        assertTrue("the page left Look and feel", contains(Settings.AMOLED_BLACK.key));
        View plain = list().getAdapter().getView(position(Settings.AMOLED_BLACK.key), null, list());
        assertEquals(16 * dp, plain.getPaddingStart());
        assertTrue(plain.getBackground() instanceof android.graphics.drawable.RippleDrawable);

        page.navigation.search("plain rows");
        assertTrue("search lost the look row", contains(SettingsNavigation.SETTINGS_LOOK));
        page.navigation.search("");

        assertTrue("the look has to hold while paused", SettingsNavigation.PLAIN_ROWS.isKeptWhenPaused());
        assertFalse(SettingsBackup.create().contains(SettingsNavigation.PLAIN_ROWS.key));
        for (Map<app.hushtelegram.extension.shared.settings.BooleanSetting, Boolean> preset : Arrays.asList(
                QuickSetupKeys.quiet(), QuickSetupKeys.privacy(), QuickSetupKeys.defaults())) {
            assertFalse(preset.containsKey(SettingsNavigation.PLAIN_ROWS));
        }

        page.navigation.navigate("Look and feel");
        tap(SettingsNavigation.SETTINGS_LOOK);
        assertFalse(SettingsNavigation.PLAIN_ROWS.savedValue());
        assertEquals("Cards. Tap for plain rows.", String.valueOf(look.getSummary()));
        assertEquals((ScreenColors.CARD_INSET + 14) * dp,
                list().getAdapter().getView(position(Settings.AMOLED_BLACK.key), null, list()).getPaddingStart());
    }

    /** Each Quick setups choice changes its switches through their rows and says how many changed. */
    @Test public void quickSetupsChangeTheirSwitchesAndSayHowMany() {
        page.navigation.navigate("Settings backup");
        Preference row = (Preference) list().getItemAtPosition(position(SettingsNavigation.QUICK_SETUPS));
        assertEquals("Quick setups", String.valueOf(row.getTitle()));
        tap(SettingsNavigation.QUICK_SETUPS);
        AlertDialog choices = (AlertDialog) org.robolectric.shadows.ShadowDialog.getLatestDialog();
        assertNotNull("Quick setups opened no dialog", choices);
        android.widget.ListAdapter cards = choices.getListView().getAdapter();
        assertEquals(3, cards.getCount());
        assertTrue(String.valueOf(cards.getItem(0)).startsWith("Quiet\n"));
        assertTrue(String.valueOf(cards.getItem(1)).startsWith("Privacy\n"));
        assertTrue(String.valueOf(cards.getItem(2)).startsWith("Back to defaults\n"));
        try {
            // Most of Quiet starts on, so a fresh install has only the rest to change.
            int quietOff = offOnScreen(QuickSetupKeys.QUIET);
            assertTrue("Quiet changes nothing on a fresh install", quietOff > 0);
            choices.getListView().performItemClick(null, 0, 0);
            ShadowLooper.idleMainLooper();
            assertEquals(0, offOnScreen(QuickSetupKeys.QUIET));
            assertEquals(changed(quietOff), ShadowToast.getTextOfLatestToast());
            assertFalse("nothing in Quiet waits for a restart", contains(SettingsNavigation.RESTART));
            assertEquals(0, page.applyQuickSetup(QuickSetupKeys.quiet()));
            assertEquals("Changed 0 settings", ShadowToast.getTextOfLatestToast());

            int privacyOff = offOnScreen(QuickSetupKeys.PRIVACY);
            assertTrue("Privacy changes nothing on a fresh install", privacyOff > 0);
            assertEquals(privacyOff, page.applyQuickSetup(QuickSetupKeys.privacy()));
            assertEquals(0, offOnScreen(QuickSetupKeys.PRIVACY));
            assertFalse(contains(SettingsNavigation.RESTART));

            assertEquals(quietOff + privacyOff, page.applyQuickSetup(QuickSetupKeys.defaults()));
            for (app.hushtelegram.extension.shared.settings.BooleanSetting setting : QuickSetupKeys.DEFAULTS) {
                assertEquals(setting.key, setting.defaultValue, setting.savedValue());
            }
        } finally {
            for (app.hushtelegram.extension.shared.settings.BooleanSetting setting : QuickSetupKeys.DEFAULTS) {
                setting.resetToDefault();
            }
        }
    }

    /**
     * A Quick setups change runs the row's own change listener first, as a tap does. Telegram's rows
     * do work there (Translate with an outside service forgets its chats as it goes off), and a
     * listener that turns the change down keeps the switch as it was, uncounted.
     */
    @Test public void quickSetupsGoThroughEachRowsChangeListener() {
        SwitchPreference contacts = (SwitchPreference) page.findPreference(Settings.HIDE_CONTACTS_BLOCK.key);
        SwitchPreference greeting = (SwitchPreference) page.findPreference(Settings.HIDE_GREETING_STICKERS.key);
        assertFalse(contacts.isChecked());
        assertFalse(greeting.isChecked());
        List<Object> heard = new ArrayList<>();
        contacts.setOnPreferenceChangeListener((changed, value) -> false);
        greeting.setOnPreferenceChangeListener((changed, value) -> { heard.add(value); return true; });
        Map<app.hushtelegram.extension.shared.settings.BooleanSetting, Boolean> both = new java.util.LinkedHashMap<>();
        both.put(Settings.HIDE_CONTACTS_BLOCK, true);
        both.put(Settings.HIDE_GREETING_STICKERS, true);
        try {
            assertEquals(1, page.applyQuickSetup(both));
            assertEquals(changed(1), ShadowToast.getTextOfLatestToast());
            assertFalse("a change its row turned down went through", contacts.isChecked());
            assertFalse(Settings.HIDE_CONTACTS_BLOCK.savedValue());
            assertTrue(greeting.isChecked());
            assertTrue(Settings.HIDE_GREETING_STICKERS.savedValue());
            assertEquals("the row's listener didn't hear the change", Arrays.asList((Object) Boolean.TRUE), heard);
        } finally {
            Settings.HIDE_CONTACTS_BLOCK.resetToDefault();
            Settings.HIDE_GREETING_STICKERS.resetToDefault();
        }
    }

    private static final String ONLY_SWITCHES =
            "Only switches go back. Anything a switch already cleared, like chats' translate choices, stays cleared.";

    /**
     * After a choice that changed switches, the Quick setups dialog's last card names what it turned
     * on and how many it found set already, and Undo puts back only the switches nothing has written
     * since, through their rows. A switch turned off and on again in between is the person's own
     * now, even though it holds the value the choice put there. A choice that changes nothing keeps
     * the undo.
     */
    @Test public void undoTheLastSetupPutsBackOnlyWhatItChanged() {
        List<app.hushtelegram.extension.shared.settings.BooleanSetting> off = new ArrayList<>();
        List<String> titles = new ArrayList<>();
        int onRows = 0;
        for (app.hushtelegram.extension.shared.settings.BooleanSetting setting : QuickSetupKeys.PRIVACY) {
            Preference row = page.findPreference(setting.key);
            if (!(row instanceof SwitchPreference)) continue;
            if (((SwitchPreference) row).isChecked()) {
                onRows++;
            } else {
                off.add(setting);
                titles.add(String.valueOf(row.getTitle()));
            }
        }
        assertTrue("Privacy has too little to change on a fresh install", off.size() >= 2);
        String alreadySet = onRows == 0 ? "" : onRows == 1 ? " 1 other switch was already set."
                : " " + onRows + " other switches were already set.";
        try {
            assertEquals("an undo card before any choice", 3, setupCards().size());
            assertEquals(off.size(), page.applyQuickSetup(QuickSetupKeys.privacy()));
            assertEquals(changed(off.size()), ShadowToast.getTextOfLatestToast());
            assertEquals(0, page.applyQuickSetup(QuickSetupKeys.privacy()));
            assertEquals("Changed 0 settings", ShadowToast.getTextOfLatestToast());
            List<String> cards = setupCards();
            assertEquals(4, cards.size());
            assertEquals("Undo the last setup\nTurned on: " + L10n.join(titles) + "." + alreadySet + " " + ONLY_SWITCHES,
                    cards.get(3));

            // Turned off and back on from its own page.
            app.hushtelegram.extension.shared.settings.BooleanSetting mine = off.get(0);
            ((AlertDialog) org.robolectric.shadows.ShadowDialog.getLatestDialog()).dismiss();
            assertTrue(page.navigation.open(page.findPreference(mine.key)));
            tap(mine.key);
            tap(mine.key);
            assertTrue(mine.savedValue());
            while (page.navigation.back()) { }
            List<String> rest = titles.subList(1, titles.size());
            assertEquals("Undo the last setup\nTurned on: " + L10n.join(rest) + "." + alreadySet
                    + " 1 switch you changed since stays as you set it. " + ONLY_SWITCHES, setupCards().get(3));

            AlertDialog choices = (AlertDialog) org.robolectric.shadows.ShadowDialog.getLatestDialog();
            choices.getListView().performItemClick(null, 3, 3);
            ShadowLooper.idleMainLooper();
            int back = off.size() - 1;
            assertEquals(back == 1 ? "Put back 1 switch" : "Put back " + back + " switches", ShadowToast.getTextOfLatestToast());
            for (app.hushtelegram.extension.shared.settings.BooleanSetting setting : off.subList(1, off.size())) {
                assertFalse(setting.key, setting.savedValue());
                assertFalse(setting.key, ((SwitchPreference) page.findPreference(setting.key)).isChecked());
            }
            assertTrue("Undo took back a switch the person set since", mine.savedValue());
            assertEquals("the undo card stayed after its undo", 3, setupCards().size());
        } finally {
            for (app.hushtelegram.extension.shared.settings.BooleanSetting setting : QuickSetupKeys.PRIVACY) {
                setting.resetToDefault();
            }
        }
    }

    /**
     * Undo goes through the rows like a tap: a switch that needs a restart owes one after the choice
     * and owes nothing once it's back. Only the latest choice that changed something undoes, and the
     * settings lock turns Undo down like any other change.
     */
    @Test public void undoOwesWhatATapOwesAndOnlyTheLatestChoiceUndoes() {
        long[] now = {1_800_000_000_000L};
        SettingsLockForTests.handClocks(now);
        try {
            assertEquals(1, page.applyQuickSetup(Collections.singletonMap(Settings.USE_SYSTEM_FONT, true)));
            assertTrue(contains(SettingsNavigation.RESTART));
            assertEquals(1, page.undoQuickSetup());
            assertEquals("Put back 1 switch", ShadowToast.getTextOfLatestToast());
            assertFalse(Settings.USE_SYSTEM_FONT.savedValue());
            assertFalse("the font owes a restart after it went back", contains(SettingsNavigation.RESTART));
            assertEquals("nothing left to undo", 0, page.undoQuickSetup());

            assertEquals(1, page.applyQuickSetup(Collections.singletonMap(Settings.REVEAL_SPOILERS, true)));
            assertEquals(1, page.applyQuickSetup(Collections.singletonMap(Settings.HIDE_ADS, false)));
            assertEquals(1, page.undoQuickSetup());
            assertTrue(Settings.HIDE_ADS.savedValue());
            assertTrue("Undo reached past the latest choice", Settings.REVEAL_SPOILERS.savedValue());

            assertEquals(1, page.applyQuickSetup(Collections.singletonMap(Settings.HIDE_ADS, false)));
            page.navigation.navigate("Pause");
            tap(SettingsNavigation.LOCK);
            assertTrue(SettingsLock.locked());
            now[0] += SettingsLock.QUICK_UNLOCK_MILLIS;
            ShadowToast.reset();
            assertEquals(0, page.undoQuickSetup());
            assertEquals(LOCKED_NOTE, ShadowToast.getTextOfLatestToast());
            assertFalse(Settings.HIDE_ADS.savedValue());
        } finally {
            SettingsLockForTests.forget();
            Settings.USE_SYSTEM_FONT.resetToDefault();
        }
    }

    /**
     * An undo that couldn't put every switch back leaves the rest to undo, without the choice's own
     * counts of what was already set, couldn't change or was written since, which no longer describe
     * what's left.
     */
    @Test public void anUndoThatLeavesASwitchDropsTheChoicesOwnCounts() {
        Map<app.hushtelegram.extension.shared.settings.BooleanSetting, Boolean> choice = new LinkedHashMap<>();
        choice.put(Settings.HIDE_ADS, true);
        choice.put(Settings.REVEAL_SPOILERS, true);
        choice.put(Settings.USE_SYSTEM_FONT, true);
        choice.put(Settings.HIDE_GREETING_STICKERS, true);
        Preference font = page.findPreference(Settings.USE_SYSTEM_FONT.key);
        Preference.OnPreferenceChangeListener own = font.getOnPreferenceChangeListener();
        try {
            assertEquals(3, page.applyQuickSetup(choice));
            assertEquals("Hide ads was already on", 1, app.hushtelegram.extension.shared.settings.preference.QuickSetups.last().already);
            // Something else writes one of the choice's switches before the undo.
            Settings.HIDE_GREETING_STICKERS.save(false);
            ShadowLooper.idleMainLooper();
            assertEquals(1, app.hushtelegram.extension.shared.settings.preference.QuickSetups.writtenSince());
            font.setOnPreferenceChangeListener((row, value) -> false);
            assertEquals(1, page.undoQuickSetup());
            app.hushtelegram.extension.shared.settings.preference.QuickSetups.Outcome left =
                    app.hushtelegram.extension.shared.settings.preference.QuickSetups.last();
            assertEquals(Collections.singleton(Settings.USE_SYSTEM_FONT), left.changed.keySet());
            assertEquals(0, left.already);
            assertEquals(0, left.refused);
            assertEquals(0, app.hushtelegram.extension.shared.settings.preference.QuickSetups.writtenSince());
            assertFalse(Settings.REVEAL_SPOILERS.savedValue());
        } finally {
            font.setOnPreferenceChangeListener(own);
            Settings.USE_SYSTEM_FONT.resetToDefault();
            Settings.REVEAL_SPOILERS.resetToDefault();
            Settings.HIDE_GREETING_STICKERS.resetToDefault();
        }
    }

    /**
     * A clear on another thread is settled later on the main thread. A choice made in between wrote
     * its switches after the clear, so it keeps its undo, also on Android 11, where the file's own
     * notice of the clear comes late too.
     */
    @Test @Config(sdk = {28, 30})
    public void aClearHeardLateKeepsAChoiceMadeSince() throws InterruptedException {
        try {
            assertEquals(1, page.applyQuickSetup(Collections.singletonMap(Settings.REVEAL_SPOILERS, true)));
            Thread clearing = new Thread(app.hushtelegram.extension.shared.settings.Setting.preferences::clear);
            clearing.start();
            clearing.join();
            assertEquals(1, page.applyQuickSetup(Collections.singletonMap(Settings.HIDE_ADS, false)));
            ShadowLooper.idleMainLooper();
            app.hushtelegram.extension.shared.settings.preference.QuickSetups.Outcome last =
                    app.hushtelegram.extension.shared.settings.preference.QuickSetups.last();
            assertNotNull("the clear took the newer choice's undo", last);
            assertEquals(Collections.singleton(Settings.HIDE_ADS), last.changed.keySet());
            assertEquals(1, page.undoQuickSetup());
            assertTrue(Settings.HIDE_ADS.savedValue());
        } finally {
            Settings.REVEAL_SPOILERS.resetToDefault();
            Settings.HIDE_ADS.resetToDefault();
        }
    }

    /**
     * A clear heard late that came in the middle of a choice, after its first switch was written,
     * leaves nothing to undo, as a clear after the whole choice does.
     */
    @Test @Config(sdk = {28, 30})
    public void aClearInTheMiddleOfAChoiceLeavesNothingToUndo() {
        Map<app.hushtelegram.extension.shared.settings.BooleanSetting, Boolean> choice = new LinkedHashMap<>();
        choice.put(Settings.REVEAL_SPOILERS, true);
        choice.put(Settings.USE_SYSTEM_FONT, true);
        Preference font = page.findPreference(Settings.USE_SYSTEM_FONT.key);
        Preference.OnPreferenceChangeListener own = font.getOnPreferenceChangeListener();
        try {
            // Another thread clears the file after the first switch is written, before the second.
            font.setOnPreferenceChangeListener((row, value) -> {
                Thread clearing = new Thread(app.hushtelegram.extension.shared.settings.Setting.preferences::clear);
                clearing.start();
                try {
                    clearing.join();
                } catch (InterruptedException interrupted) {
                    throw new AssertionError(interrupted);
                }
                return true;
            });
            page.applyQuickSetup(choice);
            ShadowLooper.idleMainLooper();
            assertNull("a choice cut by a clear kept its undo",
                    app.hushtelegram.extension.shared.settings.preference.QuickSetups.last());
        } finally {
            font.setOnPreferenceChangeListener(own);
            Settings.USE_SYSTEM_FONT.resetToDefault();
            Settings.REVEAL_SPOILERS.resetToDefault();
        }
    }

    /**
     * A choice after a clear whose every save failed changed nothing, so the clear, heard late,
     * still takes the older choice's undo, whose switches it wiped.
     */
    @Test @Config(sdk = {28, 30})
    public void aClearHeardLateStillTakesTheUndoWhenTheChoiceSinceSavedNothing() throws InterruptedException {
        try {
            assertEquals(1, page.applyQuickSetup(Collections.singletonMap(Settings.REVEAL_SPOILERS, true)));
            Thread clearing = new Thread(app.hushtelegram.extension.shared.settings.Setting.preferences::clear);
            clearing.start();
            clearing.join();
            // A row that doesn't save stands in for a choice whose every save failed: it starts
            // writing and changes nothing. (Rows save through Android's own store, out of FailingStore's reach.)
            Preference ads = page.findPreference(Settings.HIDE_ADS.key);
            ads.setPersistent(false);
            try {
                assertEquals(0, page.applyQuickSetup(Collections.singletonMap(Settings.HIDE_ADS, false)));
            } finally {
                ((android.preference.TwoStatePreference) ads).setChecked(Settings.HIDE_ADS.savedValue());
                ads.setPersistent(true);
            }
            ShadowLooper.idleMainLooper();
            assertNull("the clear left the undo of switches it wiped",
                    app.hushtelegram.extension.shared.settings.preference.QuickSetups.last());
        } finally {
            Settings.REVEAL_SPOILERS.resetToDefault();
            Settings.HIDE_ADS.resetToDefault();
        }
    }

    /** A cleared settings file leaves nothing to undo, also on Android 9 and 10, where clearing tells no listener. */
    @Test @Config(sdk = {28, 29, 30})
    public void aClearedSettingsFileLeavesNothingToUndo() {
        assertEquals(1, page.applyQuickSetup(Collections.singletonMap(Settings.REVEAL_SPOILERS, true)));
        assertNotNull(app.hushtelegram.extension.shared.settings.preference.QuickSetups.last());
        app.hushtelegram.extension.shared.settings.Setting.preferences.clear();
        ShadowLooper.idleMainLooper();
        assertNull(app.hushtelegram.extension.shared.settings.preference.QuickSetups.last());
        assertEquals(0, page.undoQuickSetup());
    }

    /** Opens Quick setups and gives each card's text, its name and what it does on the next line. */
    private List<String> setupCards() {
        page.navigation.navigate("Settings backup");
        tap(SettingsNavigation.QUICK_SETUPS);
        AlertDialog choices = (AlertDialog) org.robolectric.shadows.ShadowDialog.getLatestDialog();
        android.widget.ListAdapter cards = choices.getListView().getAdapter();
        List<String> texts = new ArrayList<>();
        for (int i = 0; i < cards.getCount(); i++) texts.add(String.valueOf(cards.getItem(i)));
        return texts;
    }

    private static final String LOCKED_NOTE = "Settings are locked. Tap Start unlock, then wait 24 hours.";

    /**
     * The settings lock (#17) sits on the Pause page. Locked, a switch, Quick setups, the status
     * card's Pause, the Pause switch, import and every chooser leave their setting as it is and say
     * why, while Resume, Debug logging, Export and the lock row itself still work.
     */
    @Test public void lockedEverySettingStaysAsItIsAndSaysWhy() {
        long[] now = {1_800_000_000_000L};
        SettingsLockForTests.handClocks(now);
        try {
            page.navigation.navigate("Pause");
            Preference lock = (Preference) list().getItemAtPosition(position(SettingsNavigation.LOCK));
            assertEquals("Lock HushTelegram settings", String.valueOf(lock.getTitle()));
            assertEquals("Makes every setting here read-only. A tap within 10 min unlocks them again. After that, unlocking takes 24 hours.",
                    String.valueOf(lock.getSummary()));
            assertTrue("the lock row acts at once", ((HushTelegramPreferenceFragment.Row) lock).actsOnTap());
            tap(SettingsNavigation.LOCK);
            assertEquals("Settings locked. Changed your mind? Tap again within 10 min.", ShadowToast.getTextOfLatestToast());
            assertTrue(SettingsLock.locked());
            assertEquals("Unlock now", String.valueOf(((Preference) list().getItemAtPosition(position(SettingsNavigation.LOCK))).getTitle()));
            now[0] += SettingsLock.QUICK_UNLOCK_MILLIS;
            assertEquals("Start unlock", String.valueOf(((Preference) list().getItemAtPosition(position(SettingsNavigation.LOCK))).getTitle()));
            Map<String, Object> before = savedValues();

            // A switch, tapped on its page.
            assertTrue(page.navigation.open(page.findPreference(Settings.DISABLE_UPDATE_CHECKS.key)));
            ShadowToast.reset();
            tap(Settings.DISABLE_UPDATE_CHECKS.key);
            assertTrue(Settings.DISABLE_UPDATE_CHECKS.savedValue());
            assertTrue(((SwitchPreference) page.findPreference(Settings.DISABLE_UPDATE_CHECKS.key)).isChecked());
            assertEquals(LOCKED_NOTE, ShadowToast.getTextOfLatestToast());
            while (page.navigation.back()) { }

            // Quick setups, Back to defaults among them, neither opens nor changes anything.
            page.navigation.navigate("Settings backup");
            android.app.Dialog shown = org.robolectric.shadows.ShadowDialog.getLatestDialog();
            ShadowToast.reset();
            tap(SettingsNavigation.QUICK_SETUPS);
            assertSame("Quick setups opened while locked", shown, org.robolectric.shadows.ShadowDialog.getLatestDialog());
            assertEquals(LOCKED_NOTE, ShadowToast.getTextOfLatestToast());
            assertEquals(0, page.applyQuickSetup(QuickSetupKeys.quiet()));
            assertEquals(0, page.applyQuickSetup(QuickSetupKeys.defaults()));
            while (page.navigation.back()) { }

            // The toolbar's Pause, and the Pause switch turned on.
            layout(dialog.getView());
            assertSame(dialog.pauseAction, statusAction());
            assertEquals("Pause", statusAction().getText().toString());
            ShadowToast.reset();
            statusAction().performClick();
            ShadowLooper.idleMainLooper();
            assertFalse(BaseSettings.PAUSED.savedValue());
            assertEquals(LOCKED_NOTE, ShadowToast.getTextOfLatestToast());
            page.navigation.navigate("Pause");
            tap(BaseSettings.PAUSED.key);
            assertFalse(BaseSettings.PAUSED.savedValue());
            assertFalse(((SwitchPreference) page.findPreference(BaseSettings.PAUSED.key)).isChecked());

            // A pause set before the lock can still be taken back, by the switch or by Undo on the card.
            BaseSettings.PAUSED.save(true);
            page.refreshSwitches();
            tap(BaseSettings.PAUSED.key);
            assertFalse("Resume was turned down", BaseSettings.PAUSED.savedValue());
            BaseSettings.PAUSED.save(true);
            page.refreshSwitches();
            while (page.navigation.back()) { }
            page.navigation.restartChanged();
            list().setSelection(0);
            layout(dialog.getView());
            assertNotSame(dialog.pauseAction, statusAction());
            assertEquals("Undo", statusAction().getText().toString());
            statusAction().performClick();
            ShadowLooper.idleMainLooper();
            assertFalse("Undo on a pause was turned down", BaseSettings.PAUSED.savedValue());

            // Debug logging only changes what a report holds, so it flips either way.
            page.navigation.navigate("Diagnostics");
            assertFalse(BaseSettings.DEBUG.savedValue());
            tap(BaseSettings.DEBUG.key);
            assertTrue("Debug logging was turned down", BaseSettings.DEBUG.savedValue());
            tap(BaseSettings.DEBUG.key);
            assertFalse(BaseSettings.DEBUG.savedValue());
            while (page.navigation.back()) { }

            // Import is turned down before a file is picked. Export still saves one.
            page.navigation.navigate("Settings backup");
            org.robolectric.shadows.ShadowActivity activity = org.robolectric.Shadows.shadowOf(controller.get());
            ShadowToast.reset();
            tap("action_import_settings");
            assertNull("import opened a file picker", activity.getNextStartedActivityForResult());
            assertEquals(LOCKED_NOTE, ShadowToast.getTextOfLatestToast());
            tap("action_export_settings");
            org.robolectric.shadows.ShadowActivity.IntentForResult export = activity.getNextStartedActivityForResult();
            assertNotNull("export didn't open a file picker", export);
            assertEquals(android.content.Intent.ACTION_CREATE_DOCUMENT, export.intent.getAction());
            while (page.navigation.back()) { }

            // Every chooser: sticker size, both filter lists, the translation service and language, and the push app.
            for (String key : Arrays.asList(HushTelegramPreferenceFragment.STICKER_SIZE_ROW, FilterEditor.GROUPS,
                    FilterEditor.CHANNELS, TranslateServiceEditor.KEY, TranslateTargetPicker.KEY, UnifiedPushPicker.KEY)) {
                Preference row = page.findPreference(key);
                assertNotNull(key, row);
                shown = org.robolectric.shadows.ShadowDialog.getLatestDialog();
                ShadowToast.reset();
                assertTrue(row.getOnPreferenceClickListener().onPreferenceClick(row));
                ShadowLooper.idleMainLooper();
                assertSame(key + " opened while locked", shown, org.robolectric.shadows.ShadowDialog.getLatestDialog());
                assertEquals(key, LOCKED_NOTE, ShadowToast.getTextOfLatestToast());
            }
            page.showStickerSizes(controller.get(), page.findPreference(HushTelegramPreferenceFragment.STICKER_SIZE_ROW));
            assertSame("sticker sizes opened while locked", shown, org.robolectric.shadows.ShadowDialog.getLatestDialog());
            // Every setting that was loaded when the lock went on holds what it held then.
            Map<String, Object> after = savedValues();
            after.keySet().retainAll(before.keySet());
            assertEquals(before, after);
        } finally {
            SettingsLockForTests.forget();
            BaseSettings.PAUSED.resetToDefault();
            BaseSettings.DEBUG.resetToDefault();
        }
    }

    /**
     * Start unlock waits 24 hours, which the row counts down and can cancel. Once the wait has run
     * the lock is off and a switch flips again.
     */
    @Test public void anUnlockWaitsADayCanBeCanceledAndThenLetsSwitchesChange() {
        long[] now = {1_800_000_000_000L};
        SettingsLockForTests.handClocks(now);
        try {
            page.navigation.navigate("Pause");
            tap(SettingsNavigation.LOCK);
            now[0] += SettingsLock.QUICK_UNLOCK_MILLIS;
            tap(SettingsNavigation.LOCK);
            assertEquals("Unlock started. Settings open in 24 hours unless you cancel.", ShadowToast.getTextOfLatestToast());
            Preference lock = (Preference) list().getItemAtPosition(position(SettingsNavigation.LOCK));
            assertEquals("Cancel unlock", String.valueOf(lock.getTitle()));
            assertEquals("Settings unlock in 24 h 0 min. Tap to cancel and keep them locked.", String.valueOf(lock.getSummary()));

            // An hour on, the row and a turned-down switch both say how long is left.
            now[0] += 60 * 60 * 1000L;
            page.navigation.restartChanged();
            assertEquals("Settings unlock in 23 h 0 min. Tap to cancel and keep them locked.",
                    String.valueOf(((Preference) list().getItemAtPosition(position(SettingsNavigation.LOCK))).getSummary()));
            assertTrue(page.navigation.open(page.findPreference(Settings.DISABLE_UPDATE_CHECKS.key)));
            tap(Settings.DISABLE_UPDATE_CHECKS.key);
            assertTrue(Settings.DISABLE_UPDATE_CHECKS.savedValue());
            assertEquals("Settings are locked. They unlock in 23 h 0 min.", ShadowToast.getTextOfLatestToast());

            // Canceled, the settings stay locked however long passes.
            page.navigation.navigate("Pause");
            tap(SettingsNavigation.LOCK);
            assertEquals("Unlock canceled. Settings stay locked.", ShadowToast.getTextOfLatestToast());
            now[0] += 3 * SettingsLock.WAIT_MILLIS;
            page.navigation.restartChanged();
            assertEquals("Start unlock", String.valueOf(((Preference) list().getItemAtPosition(position(SettingsNavigation.LOCK))).getTitle()));

            // Started again and left to run, the lock comes off and the switch flips.
            tap(SettingsNavigation.LOCK);
            now[0] += SettingsLock.WAIT_MILLIS;
            page.navigation.restartChanged();
            assertEquals("Lock HushTelegram settings",
                    String.valueOf(((Preference) list().getItemAtPosition(position(SettingsNavigation.LOCK))).getTitle()));
            assertTrue(page.navigation.open(page.findPreference(Settings.DISABLE_UPDATE_CHECKS.key)));
            tap(Settings.DISABLE_UPDATE_CHECKS.key);
            assertFalse(Settings.DISABLE_UPDATE_CHECKS.savedValue());
        } finally {
            SettingsLockForTests.forget();
        }
    }

    /**
     * A lock tapped in a hurry (#23): for ten minutes the row reads Unlock now, a turned-down switch
     * says so, and the next tap takes the lock off at once so the switch flips again.
     */
    @Test public void aLockTappedInAHurryComesOffWithTheNextTap() {
        long[] now = {1_800_000_000_000L};
        SettingsLockForTests.handClocks(now);
        try {
            page.navigation.navigate("Pause");
            tap(SettingsNavigation.LOCK);
            now[0] += 3 * 60 * 1000L;
            page.navigation.restartChanged();
            Preference lock = (Preference) list().getItemAtPosition(position(SettingsNavigation.LOCK));
            assertEquals("Unlock now", String.valueOf(lock.getTitle()));
            assertEquals("Locked just now. Tap within 7 min to unlock right away. After that, unlocking takes 24 hours.",
                    String.valueOf(lock.getSummary()));
            assertTrue(page.navigation.open(page.findPreference(Settings.DISABLE_UPDATE_CHECKS.key)));
            tap(Settings.DISABLE_UPDATE_CHECKS.key);
            assertTrue(Settings.DISABLE_UPDATE_CHECKS.savedValue());
            assertEquals("Settings are locked. Tap Unlock now within 7 min.", ShadowToast.getTextOfLatestToast());

            page.navigation.navigate("Pause");
            tap(SettingsNavigation.LOCK);
            assertEquals("Settings unlocked. They change as usual again.", ShadowToast.getTextOfLatestToast());
            assertEquals(SettingsLock.State.OFF, SettingsLock.state());
            assertEquals("Lock HushTelegram settings",
                    String.valueOf(((Preference) list().getItemAtPosition(position(SettingsNavigation.LOCK))).getTitle()));
            assertTrue(page.navigation.open(page.findPreference(Settings.DISABLE_UPDATE_CHECKS.key)));
            tap(Settings.DISABLE_UPDATE_CHECKS.key);
            assertFalse(Settings.DISABLE_UPDATE_CHECKS.savedValue());
        } finally {
            SettingsLockForTests.forget();
            Settings.DISABLE_UPDATE_CHECKS.resetToDefault();
        }
    }

    /**
     * Changed switches lists the switches that aren't the way they started, a default-on one turned
     * off among them, each under its page's title. Flipping one there goes through its own row and
     * takes it off the page, a flip the lock turns down keeps it there, and the page comes back as it
     * was when the screen is recreated.
     */
    @Test public void changedSwitchesShowsWhatDiffersAndFlipsItBack() {
        List<String> home = titles();
        assertEquals("it sits just above Report a problem", home.indexOf("Report a problem") - 1, home.indexOf("Changed switches"));
        assertEquals("Every switch is the way it started.", changedLine());
        tap(SettingsNavigation.CHANGED);
        assertEquals("Changed switches", pageTitle().getText().toString());
        assertEquals(Collections.singletonList("No changed switches"), titles());
        assertTrue(page.navigation.back());

        Settings.HIDE_ADS.save(false);
        Settings.REVEAL_SPOILERS.save(true);
        page.refreshSwitches();
        assertEquals("2 switches differ from how they started. Open to flip any of them back.", changedLine());
        tap(SettingsNavigation.CHANGED);
        assertEquals(new HashSet<>(Arrays.asList(Settings.HIDE_ADS.key, Settings.REVEAL_SPOILERS.key)), switchesShown());
        for (String key : switchesShown()) {
            int at = position(key);
            while (!(list().getItemAtPosition(at) instanceof PreferenceCategory)) at--;
            assertSame(key + " isn't under its page's title", page.findPreference(key).getParent(), list().getItemAtPosition(at));
        }

        tap(Settings.REVEAL_SPOILERS.key);
        assertFalse("the flip went through the row", Settings.REVEAL_SPOILERS.savedValue());
        assertEquals("a switch put back leaves the page", Collections.singleton(Settings.HIDE_ADS.key), switchesShown());

        recreate();
        assertEquals("Changed switches", pageTitle().getText().toString());
        assertEquals(Collections.singleton(Settings.HIDE_ADS.key), switchesShown());
        assertTrue(page.navigation.back());
        assertEquals("1 switch differs from how it started. Open to flip it back.", changedLine());

        long[] now = {1_800_000_000_000L};
        SettingsLockForTests.handClocks(now);
        try {
            page.navigation.navigate("Pause");
            tap(SettingsNavigation.LOCK);
            now[0] += SettingsLock.QUICK_UNLOCK_MILLIS;
            page.navigation.navigate("");
            tap(SettingsNavigation.CHANGED);
            ShadowToast.reset();
            tap(Settings.HIDE_ADS.key);
            assertEquals(LOCKED_NOTE, ShadowToast.getTextOfLatestToast());
            assertFalse(Settings.HIDE_ADS.savedValue());
            assertEquals("a flip turned down keeps the row", Collections.singleton(Settings.HIDE_ADS.key), switchesShown());
        } finally {
            SettingsLockForTests.forget();
        }
        assertTrue(page.navigation.back());
        assertTrue(contains(SettingsNavigation.CHANGED));
    }

    /** The line under the home page's Changed switches row. */
    private String changedLine() {
        return String.valueOf(((Preference) list().getItemAtPosition(position(SettingsNavigation.CHANGED))).getSummary());
    }

    /** The keys of the switch rows the list shows now. */
    private Set<String> switchesShown() {
        Set<String> keys = new HashSet<>();
        for (int i = 0; i < list().getCount(); i++) {
            Object item = list().getItemAtPosition(i);
            if (item instanceof SwitchPreference) keys.add(((Preference) item).getKey());
        }
        return keys;
    }

    /** Report a problem opens GitHub's bug form in a browser with the versions and switches filled in. */
    @Test public void reportAProblemOpensAFilledInGitHubForm() throws Exception {
        Map<String, Object> before = savedValues();
        assertEquals("Opens a GitHub report with your versions and settings filled in. Add what happened.",
                String.valueOf(((Preference) list().getItemAtPosition(position(SettingsNavigation.REPORT))).getSummary()));
        tap(SettingsNavigation.REPORT);
        android.content.Intent started = org.robolectric.Shadows.shadowOf(controller.get()).getNextStartedActivity();
        assertNotNull("nothing opened", started);
        assertEquals(android.content.Intent.ACTION_VIEW, started.getAction());
        assertTrue(started.hasCategory(android.content.Intent.CATEGORY_BROWSABLE));
        assertTrue((started.getFlags() & android.content.Intent.FLAG_ACTIVITY_NEW_TASK) != 0);
        assertNull(started.getComponent());
        String url = started.getDataString();
        assertTrue(url, url.startsWith("https://github.com/SysAdminDoc/HushTelegram/issues/new?template=bug_report.yml&"));
        assertTrue(url, url.length() <= app.hushtelegram.extension.shared.settings.preference.ReportProblem.MAX_LENGTH);
        String decoded = java.net.URLDecoder.decode(url, "UTF-8");
        assertTrue(decoded, decoded.contains("&versions=HushTelegram "));
        assertTrue(decoded, decoded.contains(" on Telegram "));
        assertTrue(decoded, decoded.contains("&device="));
        assertTrue(decoded, decoded.contains("What happened:"));
        assertTrue(decoded, decoded.contains("What I expected:"));
        // Hide ads starts on, Hide contacts on Telegram starts off.
        assertTrue(decoded, decoded.contains("&additional_context=Switches on: "));
        String switches = decoded.substring(decoded.indexOf("&additional_context=Switches on: "));
        assertTrue(switches, switches.contains("Hide ads"));
        assertFalse(switches, switches.contains("Hide contacts on Telegram"));
        assertEquals("the tap left the home page", 16, list().getCount());

        org.robolectric.shadows.ShadowApplication application =
                org.robolectric.Shadows.shadowOf(org.robolectric.RuntimeEnvironment.getApplication());
        application.checkActivities(true);
        try {
            tap(SettingsNavigation.REPORT);
            assertEquals("Can't open the link. Go to " + L10n.isolate("github.com/SysAdminDoc/HushTelegram") + ".",
                    ShadowToast.getTextOfLatestToast());
            assertFalse(controller.get().isFinishing());
        } finally {
            application.checkActivities(false);
        }
        assertEquals(before, savedValues());
    }

    /** How many of [settings] have a switch on this screen that's off. */
    private int offOnScreen(List<app.hushtelegram.extension.shared.settings.BooleanSetting> settings) {
        int off = 0;
        for (app.hushtelegram.extension.shared.settings.BooleanSetting setting : settings) {
            Preference row = page.findPreference(setting.key);
            if (row instanceof SwitchPreference && !((SwitchPreference) row).isChecked()) off++;
        }
        return off;
    }

    /** The toast after a choice that changed [count] switches, which points at the undo card. */
    private static String changed(int count) {
        return count == 1 ? "Changed 1 setting. Undo it from Quick setups."
                : "Changed " + count + " settings. Undo them from Quick setups.";
    }

    // A window as short as the layouts below, 400 px, so the window's own layout leaves the home
    // list taller than the list and it doesn't snap back to the top.
    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(qualifiers = "w390dp-h200dp-night-xhdpi")
    public void aNewPageStartsAtTheTopAfterThePreviousPageWasScrolled() {
        Object root = org.robolectric.util.ReflectionHelpers.callInstanceMethod(
                dialog.getDialog().getWindow().getDecorView(), "getViewRootImpl");
        org.robolectric.util.ReflectionHelpers.callInstanceMethod(root, "ensureTouchMode",
                org.robolectric.util.ReflectionHelpers.ClassParameter.from(boolean.class, true));
        try {
            layout(dialog.getView(), 400);
            assertTrue(list().isInTouchMode());
            list().scrollListBy(120);
            int homePosition = list().getFirstVisiblePosition();
            int homeOffset = list().getChildAt(0).getTop();
            assertTrue(homePosition > 0 || homeOffset < 0);
            // A section sent to from the scrolled home list comes to the top.
            page.navigation.navigate("Pause");
            layout(dialog.getView(), 400);
            assertEquals(position("section_Pause"), list().getFirstVisiblePosition());
            assertEquals(list().getPaddingTop(), list().getChildAt(0).getTop());
            list().scrollListBy(100);
            // Preference updates can arrive after navigation but before the next layout.
            page.navigation.navigate("Diagnostics");
            ((android.widget.BaseAdapter) page.getPreferenceScreen().getRootAdapter()).notifyDataSetChanged();
            layout(dialog.getView(), 400);
            assertEquals(position("section_Diagnostics"), list().getFirstVisiblePosition());
            assertEquals(list().getPaddingTop(), list().getChildAt(0).getTop());
            // Closing the heading in place leaves it where it was.
            int headingTop = list().getChildAt(0).getTop();
            tap("section_Diagnostics");
            layout(dialog.getView(), 400);
            assertFalse(page.navigation.isExpanded("Diagnostics"));
            assertEquals(position("section_Diagnostics"), list().getFirstVisiblePosition());
            assertEquals(headingTop, list().getChildAt(0).getTop());
            list().scrollListBy(60);
            layout(dialog.getView(), 400);
            int placePosition = list().getFirstVisiblePosition();
            int placeOffset = list().getChildAt(0).getTop();
            // A search takes the list to its top, and clearing it returns to the place it left.
            page.navigation.search("hide");
            layout(dialog.getView(), 400);
            assertEquals(0, list().getFirstVisiblePosition());
            assertEquals(list().getPaddingTop(), list().getChildAt(0).getTop());
            assertTrue(page.navigation.back());
            layout(dialog.getView(), 400);
            assertEquals(placePosition, list().getFirstVisiblePosition());
            assertEquals(placeOffset, list().getChildAt(0).getTop());
        } finally {
            org.robolectric.util.ReflectionHelpers.callInstanceMethod(root, "ensureTouchMode",
                    org.robolectric.util.ReflectionHelpers.ClassParameter.from(boolean.class, false));
        }
    }

    @Test public void visibleNavigationAndSearchKeepTheirAccessibilityRoles() {
        layout(dialog.getView());
        View feed = list().getChildAt(position("section_Ads") - list().getFirstVisiblePosition());
        android.view.accessibility.AccessibilityNodeInfo info = feed.createAccessibilityNodeInfo();
        assertTrue("a section heading isn't spoken as a heading", info.isHeading());
        assertEquals(android.widget.Button.class.getName(), info.getClassName());
        assertEquals("Collapsed", String.valueOf(info.getStateDescription()));
        assertTrue(info.getActionList().contains(android.view.accessibility.AccessibilityNodeInfo.AccessibilityAction.ACTION_EXPAND));
        assertFalse(info.getActionList().contains(android.view.accessibility.AccessibilityNodeInfo.AccessibilityAction.ACTION_COLLAPSE));
        assertTrue(feed.performAccessibilityAction(android.view.accessibility.AccessibilityNodeInfo.ACTION_CLICK, null));
        assertTrue(page.navigation.isExpanded("Ads"));
        assertEquals("Hide ads", ((Preference) list().getItemAtPosition(position("section_Ads") + 1)).getTitle());
        layout(dialog.getView());
        feed = list().getChildAt(position("section_Ads") - list().getFirstVisiblePosition());
        info = feed.createAccessibilityNodeInfo();
        assertTrue(info.isHeading());
        assertEquals("Expanded", String.valueOf(info.getStateDescription()));
        assertTrue(info.getActionList().contains(android.view.accessibility.AccessibilityNodeInfo.AccessibilityAction.ACTION_COLLAPSE));
        assertTrue(feed.performAccessibilityAction(android.view.accessibility.AccessibilityNodeInfo.ACTION_COLLAPSE, null));
        assertFalse(page.navigation.isExpanded("Ads"));
        findSearch(dialog.getView()).setText("Hide ads");
        layout(dialog.getView());
        View toggle = list().getChildAt(position(Settings.HIDE_ADS.key) - list().getFirstVisiblePosition());
        assertEquals(android.widget.Switch.class.getName(), toggle.createAccessibilityNodeInfo().getClassName());
        assertTrue(toggle.performAccessibilityAction(android.view.accessibility.AccessibilityNodeInfo.ACTION_CLICK, null));
        assertFalse(Settings.HIDE_ADS.savedValue());
    }

    /**
     * The switches live in one application-wide store, and Telegram can hold several accounts. The
     * About row and both backup rows say so, and each shipped language's word for accounts finds
     * all three in search.
     */
    @Test public void theAccountScopeIsSearchableInEveryShippedLanguage() {
        String[][] languages = {{"en", null}, {"bg", "bg"}, {"de", "de"}, {"es", "es"}, {"in-rID", "in"}, {"pt-rBR", "pt-rbr"}, {"tr", "tr"}};
        for (String[] language : languages) {
            controller.close();
            org.robolectric.RuntimeEnvironment.setQualifiers("+" + language[0]);
            controller = Robolectric.buildActivity(Activity.class).setup().visible();
            dialog = SettingsL10nTest.show(controller.get());
            page = page(dialog);
            Map<String, String> table = language[1] == null ? new TreeMap<>() : SettingsL10nTest.TranslationsForTests.of(language[1]);
            String word = table.getOrDefault("Accounts", "Accounts").toLowerCase(java.util.Locale.ROOT);
            findSearch(dialog.getView()).setText(word);
            ShadowLooper.idleMainLooper(1, java.util.concurrent.TimeUnit.SECONDS);
            List<String> found = new ArrayList<>();
            for (int i = 0; i < list().getCount(); i++) {
                Object item = list().getItemAtPosition(i);
                if (item instanceof Preference && !(item instanceof PreferenceCategory)) found.add(String.valueOf(((Preference) item).getTitle()));
            }
            for (String title : Arrays.asList("Accounts", "Export settings", "Import settings")) {
                assertTrue(language[0] + ": searching " + word + " misses " + title + " in " + found,
                        found.contains(table.getOrDefault(title, title)));
            }
        }
    }

    /** All pages are rendered with the same viewport as the design reference. */
    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void switchDescriptionsUseTheRowWidthAndTheRowStillChangesTheSavedChoice() {
        page.navigation.navigate("Ads");
        layout(dialog.getView());
        // The first switch under the Ads heading.
        int at = position(Settings.HIDE_ADS.key);
        assertEquals(position("section_Ads") + 1, at);
        View row = list().getChildAt(at - list().getFirstVisiblePosition());
        TextView summary = row.findViewById(android.R.id.summary);
        TextView title = row.findViewById(android.R.id.title);
        assertTrue("the switch must not narrow its explanation", summary.getWidth() > title.getWidth());
        assertEquals(row.getWidth() - row.getPaddingLeft() - row.getPaddingRight(), summary.getWidth());
        SwitchPreference preference = (SwitchPreference) list().getItemAtPosition(at);
        boolean previous = preference.isChecked();
        list().performItemClick(row, at, list().getItemIdAtPosition(at));
        ShadowLooper.idleMainLooper();
        assertEquals(!previous, preference.isChecked());
        assertEquals(!previous, Settings.HIDE_ADS.get());
    }

    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(sdk = 33)
    public void overviewActionKeepsItsFullTouchHeight() {
        layout(dialog.getView());
        View action = statusAction();
        assertSame("the toolbar carries Pause while no card is drawn", dialog.pauseAction, action);
        int minimum = Math.round(48 * action.getResources().getDisplayMetrics().density);
        assertTrue("Pause touch target was clipped in the toolbar", action.getHeight() >= minimum);

        BaseSettings.PAUSED.save(true);
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        recreate();
        layout(dialog.getView());
        action = statusAction();
        assertNotSame(dialog.pauseAction, action);
        assertNotNull(action);
        assertTrue("Resume touch target was clipped to the text column", action.getHeight() >= minimum);
    }

    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void renderEveryPageAndSearchOffscreen() throws Exception {
        capture("00-overview");
        for (Preference section : page.sections()) {
            // A fresh window avoids reusing native renderer display lists from another bitmap.
            recreate();
            page.navigation.navigate(section.getTitle().toString());
            capture(section.getTitle().toString().toLowerCase(java.util.Locale.ROOT).replaceAll("[^a-z]+", "-"));
        }
        recreate();
        for (String tool : new String[]{"Links", "Updates", "Pause", "Settings backup", "Diagnostics", "About"}) {
            page.navigation.navigate(tool);
        }
        capture("tool-sections");
        findSearch(dialog.getView()).setText("links");
        ShadowLooper.idleMainLooper(1, java.util.concurrent.TimeUnit.SECONDS);
        capture("search-results");
        findSearch(dialog.getView()).setText("noSuchSetting987654");
        ShadowLooper.idleMainLooper(1, java.util.concurrent.TimeUnit.SECONDS);
        capture("search-empty");
        page.navigation.back();
        page.navigation.navigate("Diagnostics");
        Preference export = page.findPreference("action_export_diagnostic_report");
        export.getOnPreferenceClickListener().onPreferenceClick(export);
        AlertDialog report = (AlertDialog) org.robolectric.shadows.ShadowDialog.getLatestDialog();
        captureDialog("dialog-report", report);
        report.dismiss();
        page.navigation.navigate("Settings backup");
        page.pendingImport = SettingsBackup.parse("{\"format\":\"hushtelegram-settings\",\"schema\":1,\"settings\":{\"hushtelegram_hide_ads\":false}}").toBundle();
        SettingsBackupPreference.onPageResumed(page);
        captureDialog("dialog-import", page.importPreview);
        page.importPreview.getButton(AlertDialog.BUTTON_NEGATIVE).performClick();
        page.navigation.navigate("About");
        PreferenceCategory about = (PreferenceCategory) page.sections().get(page.sections().size() - 1);
        Preference licenses = null;
        for (int i = 0; i < about.getPreferenceCount(); i++) {
            if ("Licenses".contentEquals(about.getPreference(i).getTitle())) licenses = about.getPreference(i);
        }
        assertNotNull("no Licenses row on About", licenses);
        licenses.getOnPreferenceClickListener().onPreferenceClick(licenses);
        AlertDialog notice = (AlertDialog) org.robolectric.shadows.ShadowDialog.getLatestDialog();
        captureDialog("dialog-licenses", notice);
        notice.dismiss();
    }

    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(qualifiers = "ar-rXB-ldrtl-w390dp-h844dp-night-xhdpi")
    public void largeRightToLeftPagesKeepTheirCompleteText() throws Exception {
        org.robolectric.RuntimeEnvironment.setFontScale(2f);
        try {
            recreate();
            capture("large-rtl-overview");
            for (Preference section : page.sections()) {
                page.navigation.open(section);
                layout(dialog.getView());
                assertUncutText(dialog.getView());
            }
            capture("large-rtl-about");
        } finally {
            org.robolectric.RuntimeEnvironment.setFontScale(1f);
        }
    }

    /**
     * Brazilian Portuguese runs longer than English. Every page still wraps its
     * whole text at twice the text size, and the table is the one on screen.
     */
    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(qualifiers = "pt-rBR-w390dp-h844dp-night-xhdpi")
    public void brazilianPortuguesePagesKeepTheirCompleteText() throws Exception {
        assertEquals("Lista de conversas", String.valueOf(page.sections().get(1).getTitle()));
        assertEquals("Privacidade", String.valueOf(page.sections().get(6).getTitle()));
        capture("pt-br-overview");
        page.navigation.navigate("Privacy");
        capture("pt-br-privacy");
        org.robolectric.RuntimeEnvironment.setFontScale(2f);
        try {
            recreate();
            for (Preference section : page.sections()) {
                page.navigation.open(section);
                layout(dialog.getView());
                assertUncutText(dialog.getView());
            }
            page.navigation.navigate("Privacy");
            capture("pt-br-large-privacy");
            page.navigation.navigate("Links");
            capture("pt-br-large-links");
            page.navigation.navigate("Pause");
            capture("pt-br-large-pause");
        } finally {
            org.robolectric.RuntimeEnvironment.setFontScale(1f);
        }
    }

    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void recoveryKeepsRetryAndBackVisible() throws Exception {
        dialog.dismiss();
        controller.get().getFragmentManager().executePendingTransactions();
        HushTelegramPreferenceFragment.failNextInitialization = new IllegalStateException("render recovery");
        dialog = SettingsL10nTest.show(controller.get());
        page = page(dialog);
        capture("recovery");
        assertNull(page.navigation);
        assertEquals(3, list().getCount());
        assertUncutText(dialog.getView());
    }

    private static void assertUncutText(View view) {
        if (view.getVisibility() != View.VISIBLE) return;
        if (view instanceof android.widget.TextView && !(view instanceof EditText)) {
            android.text.Layout text = ((android.widget.TextView) view).getLayout();
            if (text != null) for (int line = 0; line < text.getLineCount(); line++) assertEquals(0, text.getEllipsisCount(line));
        }
        if (view instanceof android.view.ViewGroup) {
            android.view.ViewGroup group = (android.view.ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) assertUncutText(group.getChildAt(i));
        }
    }

    private void captureDialog(String name, AlertDialog modal) throws Exception {
        assertNotNull(modal);
        layout(dialog.getView());
        ShadowLooper.idleMainLooper();
        View content = modal.getWindow().getDecorView();
        assertTrue(content.getWidth() > 0 && content.getHeight() > 0);
        Bitmap image = Bitmap.createBitmap(780, 1688, Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(image);
        dialog.getView().draw(canvas);
        canvas.drawColor(0x99000000);
        canvas.translate((780 - content.getWidth()) / 2f, (1688 - content.getHeight()) / 2f);
        content.draw(canvas);
        try (FileOutputStream out = new FileOutputStream(new File("build/reports/settings-design", name + ".png"))) {
            assertTrue(image.compress(Bitmap.CompressFormat.PNG, 100, out));
        }
        image.recycle();
    }

    private void capture(String name) throws Exception {
        capture(name, 1688);
    }

    private void capture(String name, int height) throws Exception {
        File folder = new File("build/reports/settings-design");
        assertTrue(folder.isDirectory() || folder.mkdirs());
        View root = dialog.getView();
        layout(root, height);
        invalidateTree(root);
        Bitmap image = Bitmap.createBitmap(780, height, Bitmap.Config.ARGB_8888);
        root.draw(new Canvas(image));
        try (FileOutputStream out = new FileOutputStream(new File(folder, name + ".png"))) {
            assertTrue(image.compress(Bitmap.CompressFormat.PNG, 100, out));
        }
        image.recycle();
    }

    private static void invalidateTree(View view) {
        view.invalidate();
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) invalidateTree(group.getChildAt(i));
        }
    }

    private static void layout(View root) {
        layout(root, 1688);
    }

    private static void layout(View root, int height) {
        root.measure(View.MeasureSpec.makeMeasureSpec(780, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(height, View.MeasureSpec.EXACTLY));
        root.layout(0, 0, 780, height);
        ShadowLooper.idleMainLooper();
        root.measure(View.MeasureSpec.makeMeasureSpec(780, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(height, View.MeasureSpec.EXACTLY));
        root.layout(0, 0, 780, height);
    }

    private void recreate() {
        controller.recreate();
        ShadowLooper.idleMainLooper();
        dialog = (SettingsDialog) controller.get().getFragmentManager().findFragmentByTag("hushtelegram_settings");
        assertNotNull(dialog);
        page = page(dialog);
    }

    private static HushTelegramPreferenceFragment page(SettingsDialog dialog) {
        return (HushTelegramPreferenceFragment) dialog.getChildFragmentManager().findFragmentById(SettingsDialog.CONTAINER_ID);
    }

    private ListView list() { return dialog.getView().findViewById(android.R.id.list); }

    /** The line under a home row, or null when it has none. */
    private String homeLine(String id) {
        for (int i = 0; i < list().getCount(); i++) {
            Object item = list().getItemAtPosition(i);
            if (item instanceof Preference && ("section_" + id).equals(((Preference) item).getKey())) {
                CharSequence summary = ((Preference) item).getSummary();
                return summary == null ? null : summary.toString();
            }
        }
        throw new AssertionError("no home row for " + id);
    }

    private boolean contains(String key) {
        return position(key) >= 0;
    }

    private int position(String key) {
        for (int i = 0; i < list().getCount(); i++) {
            if (key.equals(((Preference) list().getItemAtPosition(i)).getKey())) return i;
        }
        return -1;
    }

    private List<String> titles() {
        List<String> titles = new ArrayList<>();
        for (int i = 0; i < list().getCount(); i++) titles.add(String.valueOf(((Preference) list().getItemAtPosition(i)).getTitle()));
        return titles;
    }

    private static Map<String, Object> savedValues() {
        Map<String, Object> values = new TreeMap<>();
        for (Setting<?> setting : Setting.allLoadedSettings()) values.put(setting.key, setting.savedValue());
        return values;
    }

    private void tap(String key) {
        for (int i = 0; i < list().getCount(); i++) {
            if (!key.equals(((Preference) list().getItemAtPosition(i)).getKey())) continue;
            View row = list().getAdapter().getView(i, null, list());
            assertTrue(list().performItemClick(row, i, list().getAdapter().getItemId(i)));
            ShadowLooper.idleMainLooper();
            return;
        }
        fail("No visible row " + key);
    }

    private static EditText findSearch(View view) {
        if (view instanceof EditText) return (EditText) view;
        if (view instanceof android.view.ViewGroup) {
            android.view.ViewGroup group = (android.view.ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                EditText found = findSearch(group.getChildAt(i));
                if (found != null) return found;
            }
        }
        return null;
    }
}
