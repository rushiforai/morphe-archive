/*
 * Forked from https://github.com/SysAdminDoc/HushPinterest at debdac4 (GPL-3.0),
 * modified for HushTumblr (Tumblr), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/HushTelegram at 8c54a1d (GPL-3.0),
 * modified for HushPinterest (Pinterest), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/HushThreads at b141524 (GPL-3.0),
 * modified for HushTelegram (Telegram), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.hushtumblr.extension.tumblr.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNotSame;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Fragment;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.Color;
import android.os.Bundle;
import android.preference.Preference;
import android.preference.SwitchPreference;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.Button;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.TextView;

import app.hushtumblr.extension.shared.L10n;
import app.hushtumblr.extension.shared.SettingsContextRule;
import app.hushtumblr.extension.shared.settings.Setting;
import app.hushtumblr.extension.shared.settings.FailingStore;
import app.hushtumblr.extension.shared.settings.HushTumblrPause;
import app.hushtumblr.extension.shared.settings.PauseForTests;
import app.hushtumblr.extension.tumblr.timeline.PostRules;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowLooper;
import org.robolectric.shadows.ShadowAlertDialog;
import org.robolectric.shadows.ShadowToast;
import org.robolectric.util.ReflectionHelpers;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * The settings dialog as Tumblr hosts it: a dialog fragment over an activity that isn't ours,
 * with the preference page in the dialog's child manager.
 *
 * <p>The recovery page's Retry used to commit through the activity's manager, which can't see the
 * dialog's container; its Back finished the activity when the activity's back stack was empty,
 * which inside Tumblr is Tumblr itself; and a new container id on every view creation left a
 * page restored after rotation with no container to go back into.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
@SuppressWarnings("deprecation")
public class SettingsDialogTest {
    private static final String TAG = "hushtumblr_settings";
    private static final String ERROR = "morphe_settings_error_message";
    private static final String RETRY = "morphe_settings_error_retry";
    private static final String BACK = "morphe_settings_error_back";

    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private final ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup();

    @After
    public void tearDown() {
        HushTumblrPreferenceFragment.failNextInitialization = null;
        HushTumblrPreferenceFragment.editWorkerForTests = Runnable::run;
        SettingsDialog.failNextMount = null;
        Settings.CHECK_FOR_RELEASES.resetToDefault();
        controller.close();
        PatchFamily.inBuildForTests = null;
        // Setting values are static, so a list or switch a test saved stays for the tests after it.
        Settings.HIDE_POSTS_WITH_WORDS.resetToDefault();
        for (PostRules.WordField field : PostRules.WordField.values()) WordPreviewSection.switchFor(field).resetToDefault();
        TextSettings.HIDDEN_WORDS.resetToDefault();
        TextSettings.ALLOWED_WORDS.resetToDefault();
    }

    @Test
    public void aFailedInitializationShowsATitledReadableRecoveryPage() {
        HushTumblrPreferenceFragment.failNextInitialization = new IllegalStateException("injected");
        HushTumblrPreferenceFragment page = pageOf(show(controller.get()));

        Preference message = page.findPreference(ERROR);
        assertNotNull("no recovery page", message);
        assertEquals(String.valueOf(page.initializationErrorTitle(controller.get())), String.valueOf(message.getTitle()));
        assertTrue(String.valueOf(message.getTitle()), String.valueOf(message.getTitle()).contains("couldn't open"));
        for (String key : new String[]{ERROR, RETRY, BACK}) {
            Preference row = page.findPreference(key);
            assertNotNull(key, row);
            assertTrue(key + " has no title", row.getTitle() != null && row.getTitle().length() > 0);
            assertLightText(row);
        }
    }

    @Test
    public void failedWordsSavesKeepTheDraftAndEarlierSummary() {
        PatchFamily.inBuildForTests = java.util.EnumSet.allOf(PatchFamily.class);
        TextSettings.HIDDEN_WORDS.save("earlier words");
        HushTumblrPreferenceFragment page = pageOf(show(controller.get()));
        Preference row = page.findPreference(HushTumblrPreferenceFragment.HIDDEN_WORDS_ROW);
        String earlier = row.getSummary().toString();
        for (FailingStore.Fault fault : new FailingStore.Fault[]{FailingStore.Fault.COMMIT_FALSE,
                FailingStore.Fault.COMMIT_THROWS}) {
            click(row);
            AlertDialog editor = ShadowAlertDialog.getLatestAlertDialog();
            EditText field = editor.findViewById(android.R.id.edit);
            field.setText("attempted private words");
            try (FailingStore ignored = FailingStore.install(fault)) {
                editor.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            }
            ShadowLooper.idleMainLooper();
            assertTrue("failed Save closed the editor", editor.isShowing());
            assertEquals("attempted private words", field.getText().toString());
            assertEquals("earlier words", TextSettings.HIDDEN_WORDS.savedValue());
            assertEquals(earlier, row.getSummary());
            assertNotNull(ShadowToast.getTextOfLatestToast());
            editor.getButton(AlertDialog.BUTTON_NEGATIVE).performClick();
        }
    }

    @Test
    public void aQueuedWordsSaveKeepsTheConfirmedValueAndIgnoresRepeatedClicks() {
        PatchFamily.inBuildForTests = java.util.EnumSet.allOf(PatchFamily.class);
        TextSettings.HIDDEN_WORDS.save("earlier words");
        HushTumblrPreferenceFragment page = pageOf(show(controller.get()));
        Preference row = page.findPreference(HushTumblrPreferenceFragment.HIDDEN_WORDS_ROW);
        CharSequence summary = row.getSummary();
        click(row);
        AlertDialog editor = ShadowAlertDialog.getLatestAlertDialog();
        EditText field = editor.findViewById(android.R.id.edit);
        field.setText("saved first\nsaved second");
        List<Runnable> queued = new ArrayList<>();
        HushTumblrPreferenceFragment.editWorkerForTests = queued::add;
        Button save = editor.getButton(AlertDialog.BUTTON_POSITIVE);
        save.performClick();
        assertEquals(1, queued.size());
        assertTrue(editor.isShowing());
        assertFalse(field.isEnabled());
        assertFalse(save.isEnabled());
        assertFalse(editor.getButton(AlertDialog.BUTTON_NEGATIVE).isEnabled());
        assertEquals("earlier words", TextSettings.HIDDEN_WORDS.persistedValue());
        assertEquals(summary, row.getSummary());
        save.performClick();
        assertEquals("a repeated Save queued another write", 1, queued.size());
        // From here the worker runs at once: the refresh the save's own write asks for would
        // otherwise stay queued behind it, and count as an edit pending for every test after.
        HushTumblrPreferenceFragment.editWorkerForTests = Runnable::run;
        queued.remove(0).run();
        ShadowLooper.idleMainLooper();
        assertFalse(editor.isShowing());
        assertEquals("saved first\nsaved second", TextSettings.HIDDEN_WORDS.persistedValue());
        assertEquals(HushTumblrPreferenceFragment.wordsSummary("saved first\nsaved second"), row.getSummary());
    }

    @Test
    public void anOldWordsSaveDoesNotCloseOrReplaceAReplacementDialogsDraft() {
        PatchFamily.inBuildForTests = java.util.EnumSet.allOf(PatchFamily.class);
        TextSettings.HIDDEN_WORDS.save("earlier words");
        SettingsDialog original = show(controller.get());
        HushTumblrPreferenceFragment page = pageOf(original);
        click(page.findPreference(HushTumblrPreferenceFragment.HIDDEN_WORDS_ROW));
        AlertDialog oldEditor = ShadowAlertDialog.getLatestAlertDialog();
        ((EditText) oldEditor.findViewById(android.R.id.edit)).setText("saved first\nsaved second");
        List<Runnable> queued = new ArrayList<>();
        HushTumblrPreferenceFragment.editWorkerForTests = queued::add;
        oldEditor.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
        assertEquals(1, queued.size());
        original.dismiss();
        controller.get().getFragmentManager().executePendingTransactions();
        ShadowLooper.idleMainLooper();
        assertFalse(oldEditor.isShowing());
        SettingsDialog replacement = show(controller.get());
        HushTumblrPreferenceFragment current = pageOf(replacement);
        Preference currentRow = current.findPreference(HushTumblrPreferenceFragment.HIDDEN_WORDS_ROW);
        click(currentRow);
        AlertDialog editor = ShadowAlertDialog.getLatestAlertDialog();
        assertNotSame(oldEditor, editor);
        EditText field = editor.findViewById(android.R.id.edit);
        field.setText("a newer unsaved draft");
        // The save's own write asks for a refresh, which runs at once rather than staying queued.
        HushTumblrPreferenceFragment.editWorkerForTests = Runnable::run;
        queued.remove(0).run();
        ShadowLooper.idleMainLooper();
        assertTrue(replacement.getDialog().isShowing());
        assertTrue(editor.isShowing());
        assertEquals("a newer unsaved draft", field.getText().toString());
        assertTrue(field.isEnabled());
        assertTrue(editor.getButton(AlertDialog.BUTTON_POSITIVE).isEnabled());
        assertEquals("saved first\nsaved second", TextSettings.HIDDEN_WORDS.persistedValue());
        assertEquals(HushTumblrPreferenceFragment.wordsSummary("saved first\nsaved second"), currentRow.getSummary());
    }

    @Test
    public void longWordListsScrollWithinTheEditorInsteadOfHidingItsButtons() {
        PatchFamily.inBuildForTests = java.util.EnumSet.allOf(PatchFamily.class);
        HushTumblrPreferenceFragment page = pageOf(show(controller.get()));
        click(page.findPreference(HushTumblrPreferenceFragment.HIDDEN_WORDS_ROW));
        AlertDialog editor = ShadowAlertDialog.getLatestAlertDialog();
        EditText field = editor.findViewById(android.R.id.edit);
        String draft = "x".repeat(SettingsBackup.MAX_BYTES);
        field.setText(draft);
        field.measure(View.MeasureSpec.makeMeasureSpec(360, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED));
        assertTrue("word list height " + field.getMeasuredHeight() + " grew beyond viewport "
                + field.getResources().getDisplayMetrics().heightPixels + ", max " + field.getMaxHeight(), field.getMeasuredHeight()
                <= field.getResources().getDisplayMetrics().heightPixels / 4);
        assertEquals(draft, field.getText().toString());
        assertTrue(field.isVerticalScrollBarEnabled());
    }

    @Test
    public void aSuccessfulWordsSaveClearsTheRecreationDraft() {
        PatchFamily.inBuildForTests = java.util.EnumSet.allOf(PatchFamily.class);
        HushTumblrPreferenceFragment page = pageOf(show(controller.get()));
        click(page.findPreference(HushTumblrPreferenceFragment.HIDDEN_WORDS_ROW));
        AlertDialog editor = ShadowAlertDialog.getLatestAlertDialog();
        ((EditText) editor.findViewById(android.R.id.edit)).setText("saved words");
        editor.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
        assertFalse(editor.isShowing());
        controller.recreate();
        ShadowLooper.idleMainLooper();
        page = pageOf((SettingsDialog) controller.get().getFragmentManager().findFragmentByTag(TAG));
        assertFalse("a saved draft reopened", editor.isShowing());
        assertEquals("saved words", TextSettings.HIDDEN_WORDS.savedValue());
        click(page.findPreference(HushTumblrPreferenceFragment.HIDDEN_WORDS_ROW));
        assertEquals("saved words", ((EditText) ShadowAlertDialog.getLatestAlertDialog()
                .findViewById(android.R.id.edit)).getText().toString());
    }

    @Test
    public void theAllowedWordsEditorSharesTheTotalBudgetAndKeepsRefusedText() {
        PatchFamily.inBuildForTests = java.util.EnumSet.allOf(PatchFamily.class);
        TextSettings.HIDDEN_WORDS.save("猫".repeat(18000));
        HushTumblrPreferenceFragment page = pageOf(show(controller.get()));
        Preference row = page.findPreference(HushTumblrPreferenceFragment.ALLOWED_WORDS_ROW);
        click(row);
        AlertDialog editor = ShadowAlertDialog.getLatestAlertDialog();
        EditText field = editor.findViewById(android.R.id.edit);
        String draft = "猫".repeat(5000);
        field.setText(draft);
        editor.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
        assertTrue(editor.isShowing());
        assertEquals(draft, field.getText().toString());
        assertEquals("", TextSettings.ALLOWED_WORDS.savedValue());
        field.setText("allowed");
        editor.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
        assertFalse(editor.isShowing());
        assertEquals("allowed", TextSettings.ALLOWED_WORDS.savedValue());
    }

    @Test
    public void recreationKeepsTheUnsavedWordsAndSelectionAndCancelDiscardsThem() {
        PatchFamily.inBuildForTests = java.util.EnumSet.allOf(PatchFamily.class);
        TextSettings.HIDDEN_WORDS.save("saved");
        HushTumblrPreferenceFragment page = pageOf(show(controller.get()));
        click(page.findPreference(HushTumblrPreferenceFragment.HIDDEN_WORDS_ROW));
        AlertDialog old = ShadowAlertDialog.getLatestAlertDialog();
        EditText field = old.findViewById(android.R.id.edit);
        String draft = "caf\u00e9 " + "\u732b".repeat(12000);
        field.setText(draft);
        field.setSelection(2, 8);
        controller.recreate();
        ShadowLooper.idleMainLooper();
        AlertDialog restored = ShadowAlertDialog.getLatestAlertDialog();
        assertNotSame(old, restored);
        assertFalse(old.isShowing());
        EditText restoredField = restored.findViewById(android.R.id.edit);
        assertEquals(draft, restoredField.getText().toString());
        assertEquals(2, restoredField.getSelectionStart());
        assertEquals(8, restoredField.getSelectionEnd());
        assertEquals("saved", TextSettings.HIDDEN_WORDS.savedValue());
        restored.getButton(AlertDialog.BUTTON_NEGATIVE).performClick();
        page = pageOf((SettingsDialog) controller.get().getFragmentManager().findFragmentByTag(TAG));
        click(page.findPreference(HushTumblrPreferenceFragment.HIDDEN_WORDS_ROW));
        AlertDialog fresh = ShadowAlertDialog.getLatestAlertDialog();
        assertEquals("saved", ((EditText) fresh.findViewById(android.R.id.edit)).getText().toString());
        fresh.dismiss();
    }

    private static final String TRY_A_POST = "Type part of a post above to see what the word filter does with it.";
    private static final String STILL_OFF = " Hide posts with these words is off, so the word filter hides nothing yet.";
    private static final String NO_WORDS_YET = "There are no words to hide yet, so the word filter keeps every post.";

    /** The result line under a word editor's "Try it on a post". */
    static TextView previewResult(AlertDialog editor) {
        TextView result = editor.getWindow().getDecorView().findViewWithTag(WordPreviewSection.RESULT_TAG);
        assertNotNull("the word editor has no preview", result);
        return result;
    }

    /** [result]'s line without the isolate marks around each word from the lists. */
    private static String plain(TextView result) {
        return result.getText().toString().replace(String.valueOf((char) 0x2068), "").replace(String.valueOf((char) 0x2069), "");
    }

    /** The example's fields, in the order the feed reads them: post text, trail, tags, summary. */
    static List<EditText> previewInputs(AlertDialog editor) {
        ViewGroup section = (ViewGroup) previewResult(editor).getParent();
        List<EditText> inputs = new ArrayList<>();
        for (int i = 0; i < section.getChildCount(); i++) {
            if (section.getChildAt(i) instanceof EditText) inputs.add((EditText) section.getChildAt(i));
        }
        assertEquals(4, inputs.size());
        return inputs;
    }

    /** Fails if [sample] is in any value of the settings store, where backups and the export read. */
    private static void assertNotStored(String sample) {
        for (Object value : RuntimeEnvironment.getApplication()
                .getSharedPreferences(Setting.preferences.name, Context.MODE_PRIVATE).getAll().values()) {
            assertFalse("an example was saved: " + value, String.valueOf(value).contains(sample));
        }
    }

    @Test
    public void theWordPreviewSaysWhatTheDraftListDoesToATypedPostAndKeepsNoneOfIt() {
        PatchFamily.inBuildForTests = java.util.EnumSet.allOf(PatchFamily.class);
        Settings.HIDE_POSTS_WITH_WORDS.save(true);
        TextSettings.ALLOWED_WORDS.save("kitten");
        HushTumblrPreferenceFragment page = pageOf(show(controller.get()));
        click(page.findPreference(HushTumblrPreferenceFragment.HIDDEN_WORDS_ROW));
        AlertDialog editor = ShadowAlertDialog.getLatestAlertDialog();
        TextView result = previewResult(editor);
        ViewGroup section = (ViewGroup) result.getParent();
        TextView heading = (TextView) section.getChildAt(0);
        assertEquals("Try it on a post", heading.getText().toString());
        assertTrue(heading.isAccessibilityHeading());
        assertEquals("Nothing you type here is saved.", ((TextView) section.getChildAt(1)).getText().toString());
        assertEquals(NO_WORDS_YET, result.getText().toString());
        assertEquals(View.ACCESSIBILITY_LIVE_REGION_POLITE, result.getAccessibilityLiveRegion());
        List<EditText> inputs = previewInputs(editor);
        String[] labels = {"Post text", "Reblog trail text", "Tags", "Summary"};
        for (int i = 0; i < labels.length; i++) {
            EditText input = inputs.get(i);
            TextView label = (TextView) section.getChildAt(section.indexOfChild(input) - 1);
            assertEquals(labels[i], label.getText().toString());
            assertEquals(input.getId(), label.getLabelFor());
            assertTrue(labels[i], input.isEnabled());
            assertFalse(labels[i] + " keeps its text for a rebuild", input.isSaveEnabled());
            assertTrue(labels[i] + " lets the keyboard learn from it", (input.getImeOptions()
                    & android.view.inputmethod.EditorInfo.IME_FLAG_NO_PERSONALIZED_LEARNING) != 0);
        }
        assertEquals(View.IMPORTANT_FOR_AUTOFILL_NO_EXCLUDE_DESCENDANTS, section.getImportantForAutofill());
        assertEquals("Split tags with commas", inputs.get(2).getHint().toString());
        EditText list = editor.findViewById(android.R.id.edit);
        list.setText("Cat");
        assertEquals(TRY_A_POST, result.getText().toString());
        inputs.get(2).setText("#cat pics");
        assertEquals("The word filter would hide this post for “cat” in Tags.", plain(result));
        assertTrue("the word isn't isolated", result.getText().toString().contains(L10n.isolate("cat")));
        // A letter that doesn't change the answer leaves the line alone, so TalkBack says it once.
        CharSequence said = result.getText();
        inputs.get(2).setText("#cat pics!");
        assertSame(said, result.getText());
        inputs.get(0).setText("a kitten zebrafinch");
        assertEquals("The word filter would keep this post. “cat” in Tags would hide it, but the allowed word "
                + "“kitten” in Post text keeps it. Other filters can still hide it.", plain(result));
        inputs.get(2).setText("category nightjar");
        assertEquals("The word filter would keep this post. None of the words to hide are in the selected fields. "
                + "Other filters can still hide it.", plain(result));
        assertEquals("", TextSettings.HIDDEN_WORDS.savedValue());
        assertEquals("kitten", TextSettings.ALLOWED_WORDS.savedValue());

        Button clear = editor.getWindow().getDecorView().findViewWithTag(WordPreviewSection.CLEAR_TAG);
        assertEquals("Clear the example", clear.getText().toString());
        // Emptied one field at a time, this example would read hidden for a moment, then empty.
        // Clear changes the line once, so TalkBack hears only where it ends up.
        inputs.get(2).setText("#cat");
        int[] changes = {0};
        result.addTextChangedListener(new android.text.TextWatcher() {
            @Override public void beforeTextChanged(CharSequence text, int start, int count, int after) { }
            @Override public void onTextChanged(CharSequence text, int start, int before, int count) { }
            @Override public void afterTextChanged(android.text.Editable text) { changes[0]++; }
        });
        clear.performClick();
        for (EditText input : inputs) assertEquals("", input.getText().toString());
        assertEquals(TRY_A_POST, result.getText().toString());
        assertEquals("Clear changed the line more than once", 1, changes[0]);
        assertEquals("Clear leaves the list alone", "Cat", list.getText().toString());

        // A rebuild keeps the list's draft but not the example.
        inputs.get(1).setText("a zebrafinch trail");
        controller.recreate();
        ShadowLooper.idleMainLooper();
        AlertDialog restored = ShadowAlertDialog.getLatestAlertDialog();
        assertNotSame(editor, restored);
        assertEquals("Cat", ((EditText) restored.findViewById(android.R.id.edit)).getText().toString());
        for (EditText input : previewInputs(restored)) assertEquals("", input.getText().toString());
        assertEquals(TRY_A_POST, previewResult(restored).getText().toString());

        // Cancel drops both, and the editor opens again on the saved, empty list.
        previewInputs(restored).get(3).setText("nightjar");
        restored.getButton(AlertDialog.BUTTON_NEGATIVE).performClick();
        page = pageOf((SettingsDialog) controller.get().getFragmentManager().findFragmentByTag(TAG));
        click(page.findPreference(HushTumblrPreferenceFragment.HIDDEN_WORDS_ROW));
        AlertDialog fresh = ShadowAlertDialog.getLatestAlertDialog();
        for (EditText input : previewInputs(fresh)) assertEquals("", input.getText().toString());
        assertEquals(NO_WORDS_YET, previewResult(fresh).getText().toString());
        assertNotStored("zebrafinch");
        assertNotStored("nightjar");
        fresh.dismiss();
    }

    @Test
    public void aWordScopeThatIsOffLeavesItsExampleFieldOutAndNamesItsSwitch() {
        PatchFamily.inBuildForTests = java.util.EnumSet.allOf(PatchFamily.class);
        Settings.WORDS_TAGS.save(false);
        TextSettings.HIDDEN_WORDS.save("cat");
        HushTumblrPreferenceFragment page = pageOf(show(controller.get()));
        click(page.findPreference(HushTumblrPreferenceFragment.HIDDEN_WORDS_ROW));
        AlertDialog editor = ShadowAlertDialog.getLatestAlertDialog();
        List<EditText> inputs = previewInputs(editor);
        TextView result = previewResult(editor);
        assertFalse(inputs.get(2).isEnabled());
        assertNull(inputs.get(2).getHint());
        ViewGroup section = (ViewGroup) result.getParent();
        TextView off = (TextView) section.getChildAt(section.indexOfChild(inputs.get(2)) + 1);
        assertEquals("Not matched while Match current post tags is off", off.getText().toString());
        assertEquals(ScreenColors.DEFAULT.summary, off.getCurrentTextColor());
        assertTrue(inputs.get(3).isEnabled());
        // Text in a field that's off, the way a paste could put it there, still isn't read.
        inputs.get(2).setText("cat");
        // Nothing typed in a field it reads yet, and still it says the switch is off.
        assertEquals(TRY_A_POST + STILL_OFF, result.getText().toString());
        inputs.get(3).setText("a cat");
        assertEquals("The word filter would hide this post for “cat” in Summary." + STILL_OFF, plain(result));
        editor.getButton(AlertDialog.BUTTON_NEGATIVE).performClick();

        for (PostRules.WordField field : PostRules.WordField.values()) WordPreviewSection.switchFor(field).save(false);
        click(page.findPreference(HushTumblrPreferenceFragment.HIDDEN_WORDS_ROW));
        AlertDialog none = ShadowAlertDialog.getLatestAlertDialog();
        for (EditText input : previewInputs(none)) assertFalse(input.isEnabled());
        assertEquals("No fields are selected to match, so the word filter keeps every post." + STILL_OFF,
                previewResult(none).getText().toString());
        none.dismiss();
    }

    @Test
    public void theAllowedWordsEditorPreviewsItsDraftAgainstTheSavedWordsToHide() {
        PatchFamily.inBuildForTests = java.util.EnumSet.allOf(PatchFamily.class);
        Settings.HIDE_POSTS_WITH_WORDS.save(true);
        TextSettings.HIDDEN_WORDS.save("cat");
        HushTumblrPreferenceFragment page = pageOf(show(controller.get()));
        click(page.findPreference(HushTumblrPreferenceFragment.ALLOWED_WORDS_ROW));
        AlertDialog editor = ShadowAlertDialog.getLatestAlertDialog();
        TextView result = previewResult(editor);
        previewInputs(editor).get(0).setText("my cat and a kitten");
        assertEquals("The word filter would hide this post for “cat” in Post text.", plain(result));
        ((EditText) editor.findViewById(android.R.id.edit)).setText("Kitten");
        assertEquals("The word filter would keep this post. “cat” in Post text would hide it, but the allowed word "
                + "“kitten” in Post text keeps it. Other filters can still hide it.", plain(result));
        assertEquals("", TextSettings.ALLOWED_WORDS.savedValue());
        editor.getButton(AlertDialog.BUTTON_NEGATIVE).performClick();
    }

    @Test
    public void whilePausedTheWordPreviewSaysTheWordFilterHidesNothing() {
        PatchFamily.inBuildForTests = java.util.EnumSet.allOf(PatchFamily.class);
        Settings.HIDE_POSTS_WITH_WORDS.save(true);
        TextSettings.HIDDEN_WORDS.save("cat");
        PauseForTests.pause(HushTumblrPause.Reason.SWITCH);
        try {
            HushTumblrPreferenceFragment page = pageOf(show(controller.get()));
            click(page.findPreference(HushTumblrPreferenceFragment.HIDDEN_WORDS_ROW));
            AlertDialog editor = ShadowAlertDialog.getLatestAlertDialog();
            assertEquals(TRY_A_POST + " HushTumblr is paused, so the word filter hides nothing right now.",
                    previewResult(editor).getText().toString());
            previewInputs(editor).get(0).setText("my cat");
            assertEquals("The word filter would hide this post for “cat” in Post text. "
                    + "HushTumblr is paused, so the word filter hides nothing right now.", plain(previewResult(editor)));
            // While paused no other filter hides anything either, so a kept post doesn't hear they could.
            previewInputs(editor).get(0).setText("my kitten");
            assertEquals("The word filter would keep this post. None of the words to hide are in the selected fields. "
                    + "HushTumblr is paused, so the word filter hides nothing right now.", plain(previewResult(editor)));
            editor.dismiss();
        } finally {
            PauseForTests.resume();
        }
    }

    @Test
    public void failedTabMovesAndResetKeepTheSavedOrderAndSummary() {
        PatchFamily.inBuildForTests = java.util.EnumSet.allOf(PatchFamily.class);
        String saved = app.hushtumblr.extension.tumblr.ui.BottomBarTabs.join(
                app.hushtumblr.extension.tumblr.ui.BottomBarTabs.movedUp(
                        app.hushtumblr.extension.tumblr.ui.BottomBarTabs.choices(""), 2));
        TextSettings.TAB_ORDER.save(saved);
        HushTumblrPreferenceFragment page = pageOf(show(controller.get()));
        Preference row = page.findPreference(HushTumblrPreferenceFragment.TAB_ORDER_ROW);
        String summary = row.getSummary().toString();
        click(row);
        AlertDialog dialog = ShadowAlertDialog.getLatestAlertDialog();
        android.widget.ListAdapter labels = dialog.getListView().getAdapter();
        List<Object> earlier = new ArrayList<>();
        for (int i = 0; i < labels.getCount(); i++) earlier.add(labels.getItem(i));
        for (FailingStore.Fault fault : new FailingStore.Fault[]{FailingStore.Fault.COMMIT_FALSE,
                FailingStore.Fault.COMMIT_THROWS}) {
            try (FailingStore ignored = FailingStore.install(fault)) {
                dialog.getListView().performItemClick(null, 2, 2);
            }
            ShadowLooper.idleMainLooper();
            assertEquals(saved, TextSettings.TAB_ORDER.savedValue());
            assertEquals(summary, row.getSummary());
            for (int i = 0; i < labels.getCount(); i++) assertEquals(earlier.get(i), labels.getItem(i));
            try (FailingStore ignored = FailingStore.install(fault)) {
                dialog.getButton(AlertDialog.BUTTON_NEUTRAL).performClick();
            }
            ShadowLooper.idleMainLooper();
            assertTrue(dialog.isShowing());
            assertEquals(saved, TextSettings.TAB_ORDER.savedValue());
            assertEquals(summary, row.getSummary());
            for (int i = 0; i < labels.getCount(); i++) assertEquals(earlier.get(i), labels.getItem(i));
        }
        dialog.dismiss();
    }

    @Test
    public void aQueuedTabMoveKeepsTheConfirmedOrderAndBlocksRepeatedMovesAndReset() {
        PatchFamily.inBuildForTests = java.util.EnumSet.allOf(PatchFamily.class);
        TextSettings.TAB_ORDER.save("");
        HushTumblrPreferenceFragment page = pageOf(show(controller.get()));
        Preference row = page.findPreference(HushTumblrPreferenceFragment.TAB_ORDER_ROW);
        CharSequence summary = row.getSummary();
        click(row);
        AlertDialog dialog = ShadowAlertDialog.getLatestAlertDialog();
        android.widget.ListAdapter labels = dialog.getListView().getAdapter();
        List<Object> earlier = new ArrayList<>();
        for (int i = 0; i < labels.getCount(); i++) earlier.add(labels.getItem(i));
        String moved = app.hushtumblr.extension.tumblr.ui.BottomBarTabs.join(
                app.hushtumblr.extension.tumblr.ui.BottomBarTabs.movedUp(
                        app.hushtumblr.extension.tumblr.ui.BottomBarTabs.choices(""), 2));
        List<Runnable> queued = new ArrayList<>();
        HushTumblrPreferenceFragment.editWorkerForTests = queued::add;
        dialog.getListView().performItemClick(null, 2, 2);
        assertEquals(1, queued.size());
        assertFalse(dialog.getListView().isEnabled());
        assertFalse(dialog.getButton(AlertDialog.BUTTON_NEUTRAL).isEnabled());
        assertFalse(dialog.getButton(AlertDialog.BUTTON_POSITIVE).isEnabled());
        assertEquals("", TextSettings.TAB_ORDER.persistedValue());
        assertEquals(summary, row.getSummary());
        for (int i = 0; i < labels.getCount(); i++) assertEquals(earlier.get(i), labels.getItem(i));
        dialog.getListView().performItemClick(null, 3, 3);
        dialog.getButton(AlertDialog.BUTTON_NEUTRAL).performClick();
        assertEquals("a repeated tab action queued another write", 1, queued.size());
        // The save's own write asks for a refresh, which runs at once rather than staying queued.
        HushTumblrPreferenceFragment.editWorkerForTests = Runnable::run;
        queued.remove(0).run();
        ShadowLooper.idleMainLooper();
        assertTrue(dialog.isShowing());
        assertTrue(dialog.getListView().isEnabled());
        assertTrue(dialog.getButton(AlertDialog.BUTTON_NEUTRAL).isEnabled());
        assertTrue(dialog.getButton(AlertDialog.BUTTON_POSITIVE).isEnabled());
        assertEquals(moved, TextSettings.TAB_ORDER.persistedValue());
        assertEquals(HushTumblrPreferenceFragment.tabOrderSummary(moved), row.getSummary());
        assertFalse("the visible order was not updated", earlier.get(1).equals(labels.getItem(1)));
        dialog.dismiss();
    }

    /**
     * The list reads the saved order, so a Tab order tap while a save is in flight waits for it and
     * then opens the list. A save that never lands says so under the row instead of dropping the tap.
     */
    @Test
    public void aTabOrderTapDuringASaveOpensTheListOnceTheSaveLands() {
        PatchFamily.inBuildForTests = java.util.EnumSet.allOf(PatchFamily.class);
        TextSettings.HIDDEN_WORDS.save("earlier words");
        TextSettings.TAB_ORDER.save("");
        HushTumblrPreferenceFragment page = pageOf(show(controller.get()));
        Preference tabs = page.findPreference(HushTumblrPreferenceFragment.TAB_ORDER_ROW);
        CharSequence summary = tabs.getSummary();
        List<Runnable> queued = new ArrayList<>();
        try {
            for (boolean lands : new boolean[]{true, false}) {
                // Each row's own page, as a reader taps it.
                SettingsL10nTest.openPageOf(page, HushTumblrPreferenceFragment.HIDDEN_WORDS_ROW);
                click(page.findPreference(HushTumblrPreferenceFragment.HIDDEN_WORDS_ROW));
                AlertDialog editor = ShadowAlertDialog.getLatestAlertDialog();
                ((EditText) editor.findViewById(android.R.id.edit)).setText(lands ? "first words" : "second words");
                HushTumblrPreferenceFragment.editWorkerForTests = queued::add;
                editor.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
                assertEquals(1, queued.size());
                ShadowAlertDialog.reset();

                SettingsL10nTest.openPageOf(page, HushTumblrPreferenceFragment.TAB_ORDER_ROW);
                click(tabs);
                assertNull("the list opened over a save it reads", ShadowAlertDialog.getLatestAlertDialog());
                assertEquals("Saving changes", String.valueOf(tabs.getSummary()));
                if (lands) {
                    HushTumblrPreferenceFragment.editWorkerForTests = Runnable::run;
                    queued.remove(0).run();
                    ShadowLooper.idleMainLooper(HushTumblrPreferenceFragment.TAB_ORDER_WAIT_STEP, TimeUnit.MILLISECONDS);
                    AlertDialog list = ShadowAlertDialog.getLatestAlertDialog();
                    assertNotNull("the tap was dropped", list);
                    assertTrue(list.isShowing());
                    assertEquals(summary, tabs.getSummary());
                    list.dismiss();
                    ShadowLooper.idleMainLooper();
                } else {
                    ShadowLooper.idleMainLooper(HushTumblrPreferenceFragment.TAB_ORDER_WAIT_LIMIT
                            + HushTumblrPreferenceFragment.TAB_ORDER_WAIT_STEP, TimeUnit.MILLISECONDS);
                    assertNull(ShadowAlertDialog.getLatestAlertDialog());
                    assertEquals(summary, tabs.getSummary());
                    assertEquals("Couldn't start that. Try again in a moment.", SettingsFeedbackTest.message(tabs));
                    HushTumblrPreferenceFragment.editWorkerForTests = Runnable::run;
                    queued.remove(0).run();
                    ShadowLooper.idleMainLooper();
                    click(tabs);
                    AlertDialog list = ShadowAlertDialog.getLatestAlertDialog();
                    assertNotNull(list);
                    assertNull("the old failure stayed after the list opened", SettingsFeedbackTest.message(tabs));
                    list.dismiss();
                    ShadowLooper.idleMainLooper();
                }
            }
        } finally {
            HushTumblrPreferenceFragment.editWorkerForTests = Runnable::run;
            for (Runnable write : queued) write.run();
        }
    }

    @Test @Config(sdk = {26, 36})
    public void aFailedTabMoveCanBeRetriedAfterReopeningWithoutAnotherMove() {
        PatchFamily.inBuildForTests = java.util.EnumSet.allOf(PatchFamily.class);
        TextSettings.TAB_ORDER.save("");
        HushTumblrPreferenceFragment page = pageOf(show(controller.get()));
        Preference row = page.findPreference(HushTumblrPreferenceFragment.TAB_ORDER_ROW);
        String attempted = app.hushtumblr.extension.tumblr.ui.BottomBarTabs.join(
                app.hushtumblr.extension.tumblr.ui.BottomBarTabs.movedUp(
                        app.hushtumblr.extension.tumblr.ui.BottomBarTabs.choices(""), 2));
        click(row);
        AlertDialog dialog = ShadowAlertDialog.getLatestAlertDialog();
        try (FailingStore ignored = FailingStore.install(FailingStore.Fault.COMMIT_FALSE)) {
            dialog.getListView().performItemClick(null, 2, 2);
        }
        ShadowLooper.idleMainLooper();
        assertEquals("", TextSettings.TAB_ORDER.persistedValue());
        assertEquals(View.VISIBLE, dialog.getButton(AlertDialog.BUTTON_NEGATIVE).getVisibility());
        TextView failure = dialog.getWindow().getDecorView().findViewWithTag(SettingsFeedback.MESSAGE_TAG);
        assertTrue(failure.getText().toString().contains("Your earlier order is unchanged"));
        dialog.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
        click(row);
        AlertDialog reopened = ShadowAlertDialog.getLatestAlertDialog();
        assertEquals(View.VISIBLE, reopened.getButton(AlertDialog.BUTTON_NEGATIVE).getVisibility());
        reopened.getButton(AlertDialog.BUTTON_NEGATIVE).performClick();
        ShadowLooper.idleMainLooper();
        assertEquals(attempted, TextSettings.TAB_ORDER.persistedValue());
        assertEquals(View.GONE, reopened.getButton(AlertDialog.BUTTON_NEGATIVE).getVisibility());
        reopened.dismiss();
    }

    /** A failed move whose order was replaced since, as an import does, offers no Retry that would put it back. */
    @Test
    public void aFailedTabMoveIsDroppedOnceAnotherOrderIsSaved() {
        PatchFamily.inBuildForTests = java.util.EnumSet.allOf(PatchFamily.class);
        TextSettings.TAB_ORDER.save("");
        HushTumblrPreferenceFragment page = pageOf(show(controller.get()));
        Preference row = page.findPreference(HushTumblrPreferenceFragment.TAB_ORDER_ROW);
        click(row);
        AlertDialog dialog = ShadowAlertDialog.getLatestAlertDialog();
        try (FailingStore ignored = FailingStore.install(FailingStore.Fault.COMMIT_FALSE)) {
            dialog.getListView().performItemClick(null, 2, 2);
        }
        ShadowLooper.idleMainLooper();
        assertEquals(View.VISIBLE, dialog.getButton(AlertDialog.BUTTON_NEGATIVE).getVisibility());
        dialog.getButton(AlertDialog.BUTTON_POSITIVE).performClick();

        String imported = app.hushtumblr.extension.tumblr.ui.BottomBarTabs.join(
                app.hushtumblr.extension.tumblr.ui.BottomBarTabs.movedUp(
                        app.hushtumblr.extension.tumblr.ui.BottomBarTabs.choices(""), 1));
        TextSettings.TAB_ORDER.save(imported);
        ShadowLooper.idleMainLooper();
        click(row);
        AlertDialog reopened = ShadowAlertDialog.getLatestAlertDialog();
        assertNotSame(dialog, reopened);
        assertTrue("Retry would put the failed move back over the newer order",
                reopened.getButton(AlertDialog.BUTTON_NEGATIVE).getVisibility() != View.VISIBLE);
        assertEquals(imported, TextSettings.TAB_ORDER.persistedValue());
        reopened.dismiss();
    }

    /**
     * A saved move says where the tab went under the list, read once from there with no
     * announcement, which Android 16 deprecates. Focus stays on the moved tab, whose row gives its
     * place in the list. Putting Tumblr's order back says nothing about a move.
     */
    @Test @Config(sdk = {26, 36})
    public void onlyAMoveSaysWhereTheTabWent() {
        PatchFamily.inBuildForTests = java.util.EnumSet.allOf(PatchFamily.class);
        TextSettings.TAB_ORDER.save("");
        Activity host = controller.get();
        android.view.accessibility.AccessibilityManager a11y = screenReader(host);
        HushTumblrPreferenceFragment page = pageOf(show(host));
        click(page.findPreference(HushTumblrPreferenceFragment.TAB_ORDER_ROW));
        AlertDialog dialog = ShadowAlertDialog.getLatestAlertDialog();
        android.widget.ListView list = dialog.getListView();
        int count = list.getAdapter().getCount();
        String tab = String.valueOf(list.getAdapter().getItem(2));
        list.performItemClick(null, 2, 2);
        ShadowLooper.idleMainLooper(100, TimeUnit.MILLISECONDS);
        TextView said = underList(dialog);
        assertNotNull("nothing said where the tab went", said);
        assertTrue(said.getText().toString(), said.getText().toString().startsWith(
                tab + " moved to position 2 of " + count + "."));
        assertEquals(View.ACCESSIBILITY_LIVE_REGION_POLITE, said.getAccessibilityLiveRegion());
        assertEquals(tab, String.valueOf(list.getAdapter().getItem(1)));
        View moved = list.getChildAt(1 - list.getFirstVisiblePosition());
        assertEquals(1, moved.createAccessibilityNodeInfo().getCollectionItemInfo().getRowIndex());
        assertEquals("focus left the moved tab", tab, lastFocused(a11y));
        assertEquals(0, announcements(a11y));

        dialog.getButton(AlertDialog.BUTTON_NEUTRAL).performClick();
        ShadowLooper.idleMainLooper(100, TimeUnit.MILLISECONDS);
        assertEquals("", TextSettings.TAB_ORDER.persistedValue());
        said = underList(dialog);
        assertTrue("putting Tumblr's order back said a tab moved",
                said == null || !said.getText().toString().contains("moved to position"));
        assertEquals(0, announcements(a11y));
        dialog.dismiss();
    }

    /**
     * A save still running says so under the list, which takes no taps until it answers, and the
     * answer replaces it there. Nothing is announced.
     */
    @Test @Config(sdk = {26, 36})
    public void aTabMoveSaysItIsSavingUntilTheSaveAnswers() {
        PatchFamily.inBuildForTests = java.util.EnumSet.allOf(PatchFamily.class);
        TextSettings.TAB_ORDER.save("");
        Activity host = controller.get();
        android.view.accessibility.AccessibilityManager a11y = screenReader(host);
        HushTumblrPreferenceFragment page = pageOf(show(host));
        click(page.findPreference(HushTumblrPreferenceFragment.TAB_ORDER_ROW));
        AlertDialog dialog = ShadowAlertDialog.getLatestAlertDialog();
        List<Runnable> queued = new ArrayList<>();
        try {
            HushTumblrPreferenceFragment.editWorkerForTests = queued::add;
            dialog.getListView().performItemClick(null, 2, 2);
            ShadowLooper.idleMainLooper(100, TimeUnit.MILLISECONDS);
            assertEquals(1, queued.size());
            TextView said = underList(dialog);
            assertEquals("Saving changes", said.getText().toString());
            assertEquals(View.ACCESSIBILITY_LIVE_REGION_POLITE, said.getAccessibilityLiveRegion());
            assertFalse("the list took taps during the save", dialog.getListView().isEnabled());
            HushTumblrPreferenceFragment.editWorkerForTests = Runnable::run;
            queued.remove(0).run();
            ShadowLooper.idleMainLooper(100, TimeUnit.MILLISECONDS);
            said = underList(dialog);
            assertTrue(said.getText().toString(), said.getText().toString().contains(" moved to position 2 of "));
            assertTrue(dialog.getListView().isEnabled());
            assertEquals(0, announcements(a11y));
        } finally {
            HushTumblrPreferenceFragment.editWorkerForTests = Runnable::run;
            for (Runnable write : queued) write.run();
        }
        dialog.dismiss();
    }

    /**
     * The words under the list come and go as a move saves, and the dialog keeps its height through
     * them, so it doesn't re-center and slide the tabs out from under the next tap.
     */
    @Test @Config(sdk = {26, 36})
    public void theTabOrderDialogKeepsItsHeightAsAMoveSaves() {
        PatchFamily.inBuildForTests = java.util.EnumSet.allOf(PatchFamily.class);
        TextSettings.TAB_ORDER.save("");
        HushTumblrPreferenceFragment page = pageOf(show(controller.get()));
        click(page.findPreference(HushTumblrPreferenceFragment.TAB_ORDER_ROW));
        AlertDialog dialog = ShadowAlertDialog.getLatestAlertDialog();
        ShadowLooper.idleMainLooper();
        View window = dialog.getWindow().getDecorView();
        int opened = window.getHeight();
        assertTrue("the dialog was never laid out", opened > 0);
        assertNull(underList(dialog));
        List<Runnable> queued = new ArrayList<>();
        try {
            HushTumblrPreferenceFragment.editWorkerForTests = queued::add;
            dialog.getListView().performItemClick(null, 2, 2);
            ShadowLooper.idleMainLooper(100, TimeUnit.MILLISECONDS);
            assertEquals("Saving changes", underList(dialog).getText().toString());
            assertEquals("the dialog grew for the saving line", opened, window.getHeight());
            HushTumblrPreferenceFragment.editWorkerForTests = Runnable::run;
            queued.remove(0).run();
            ShadowLooper.idleMainLooper(100, TimeUnit.MILLISECONDS);
            String said = underList(dialog).getText().toString();
            assertTrue(said, said.contains(" moved to position 2 of ") && said.contains("\n"));
            assertEquals("the dialog grew for the result: " + said, opened, window.getHeight());
        } finally {
            HushTumblrPreferenceFragment.editWorkerForTests = Runnable::run;
            for (Runnable write : queued) write.run();
            app.hushtumblr.extension.shared.settings.preference.AbstractPreferenceFragment.restartPending.clear();
        }
        dialog.dismiss();
    }

    private static android.view.accessibility.AccessibilityManager screenReader(Activity host) {
        android.view.accessibility.AccessibilityManager a11y = host.getSystemService(android.view.accessibility.AccessibilityManager.class);
        org.robolectric.Shadows.shadowOf(a11y).setEnabled(true);
        org.robolectric.Shadows.shadowOf(a11y).setTouchExplorationEnabled(true);
        return a11y;
    }

    /** What the dialog says under its list, or null when it says nothing. */
    private static TextView underList(AlertDialog dialog) {
        return dialog.getWindow().getDecorView().findViewWithTag(SettingsFeedback.MESSAGE_TAG);
    }

    private static int announcements(android.view.accessibility.AccessibilityManager a11y) {
        int said = 0;
        for (android.view.accessibility.AccessibilityEvent event : org.robolectric.Shadows.shadowOf(a11y).getSentAccessibilityEvents()) {
            if (event.getEventType() == android.view.accessibility.AccessibilityEvent.TYPE_ANNOUNCEMENT) said++;
        }
        return said;
    }

    /** The first text of the last view that took accessibility focus, or null for none. */
    private static String lastFocused(android.view.accessibility.AccessibilityManager a11y) {
        String text = null;
        for (android.view.accessibility.AccessibilityEvent event : org.robolectric.Shadows.shadowOf(a11y).getSentAccessibilityEvents()) {
            if (event.getEventType() != android.view.accessibility.AccessibilityEvent.TYPE_VIEW_ACCESSIBILITY_FOCUSED) continue;
            text = event.getText().isEmpty() ? null : String.valueOf(event.getText().get(0));
        }
        return text;
    }

    /**
     * Moving the first tab up says so under the list, where a long translation at large text isn't
     * cut off as a toast's would be, and a failed save keeps its next step there too.
     */
    @Test @Config(sdk = {26, 36})
    public void theFirstTabSaysSoUnderTheListAndKeepsAFailedSavesNextStep() {
        PatchFamily.inBuildForTests = java.util.EnumSet.allOf(PatchFamily.class);
        TextSettings.TAB_ORDER.save("");
        HushTumblrPreferenceFragment page = pageOf(show(controller.get()));
        click(page.findPreference(HushTumblrPreferenceFragment.TAB_ORDER_ROW));
        AlertDialog dialog = ShadowAlertDialog.getLatestAlertDialog();
        dialog.getListView().performItemClick(null, 0, 0);
        ShadowLooper.idleMainLooper();
        assertEquals("", TextSettings.TAB_ORDER.persistedValue());
        TextView said = dialog.getWindow().getDecorView().findViewWithTag(SettingsFeedback.MESSAGE_TAG);
        assertTrue(said.getText().toString(), said.getText().toString().endsWith("is already first."));
        String toast = ShadowToast.getTextOfLatestToast();
        assertTrue("still said in a toast", toast == null || !toast.contains("already first"));

        try (FailingStore ignored = FailingStore.install(FailingStore.Fault.COMMIT_FALSE)) {
            dialog.getListView().performItemClick(null, 2, 2);
        }
        ShadowLooper.idleMainLooper();
        dialog.getListView().performItemClick(null, 0, 0);
        ShadowLooper.idleMainLooper();
        said = dialog.getWindow().getDecorView().findViewWithTag(SettingsFeedback.MESSAGE_TAG);
        String both = said.getText().toString();
        assertTrue(both, both.contains("is already first."));
        assertTrue("the failed save's next step was dropped: " + both, both.contains("Your earlier order is unchanged"));
        assertEquals(View.VISIBLE, dialog.getButton(AlertDialog.BUTTON_NEGATIVE).getVisibility());
        dialog.dismiss();
    }

    @Test
    public void overBudgetWordsStayEditableWithoutReplacingSavedWords() {
        PatchFamily.inBuildForTests = java.util.EnumSet.allOf(PatchFamily.class);
        TextSettings.HIDDEN_WORDS.save("saved words");
        HushTumblrPreferenceFragment page = pageOf(show(controller.get()));
        Preference row = page.findPreference(HushTumblrPreferenceFragment.HIDDEN_WORDS_ROW);
        String summary = row.getSummary().toString();
        click(row);
        AlertDialog editor = ShadowAlertDialog.getLatestAlertDialog();
        EditText field = editor.findViewById(android.R.id.edit);
        String draft = "\u732b".repeat(SettingsBackup.MAX_BYTES / 2);
        field.setText(draft);
        editor.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
        ShadowLooper.idleMainLooper();
        assertTrue(editor.isShowing());
        assertEquals(draft, field.getText().toString());
        assertEquals("saved words", TextSettings.HIDDEN_WORDS.savedValue());
        assertEquals(summary, row.getSummary());
        assertTrue(ShadowToast.getTextOfLatestToast().contains("too large"));
        field.setText("retry");
        editor.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
        ShadowLooper.idleMainLooper();
        assertFalse(editor.isShowing());
        assertEquals("retry", TextSettings.HIDDEN_WORDS.savedValue());
    }

    @Test
    public void retryRebuildsThePageInsideTheDialog() {
        HushTumblrPreferenceFragment.failNextInitialization = new IllegalStateException("injected");
        SettingsDialog dialog = show(controller.get());
        HushTumblrPreferenceFragment failed = pageOf(dialog);

        click(failed.findPreference(RETRY));
        dialog.getChildFragmentManager().executePendingTransactions();
        ShadowLooper.idleMainLooper();

        HushTumblrPreferenceFragment rebuilt = pageOf(dialog);
        assertNotSame("Retry left the failed page in place", failed, rebuilt);
        assertNull("the rebuilt page is still the recovery page", rebuilt.findPreference(ERROR));
        assertTrue("the rebuilt page is empty", rebuilt.getPreferenceScreen().getPreferenceCount() > 0);
        assertEquals(1, pages(dialog).size());
        assertFalse(controller.get().isFinishing());
    }

    /** A result waiting for its row outlasts the recovery page, which has no rows, and shows once Retry builds them. */
    @Test
    public void aWaitingResultOutlastsTheRecoveryPage() {
        PatchFamily.inBuildForTests = java.util.EnumSet.allOf(PatchFamily.class);
        String failed = "Couldn't save that change. Try again.";
        HushTumblrPreferenceFragment.unseenResult(Settings.HIDE_ADVERTISING_ID.key, failed);
        HushTumblrPreferenceFragment.failNextInitialization = new IllegalStateException("injected");
        SettingsDialog dialog = show(controller.get());
        click(pageOf(dialog).findPreference(RETRY));
        dialog.getChildFragmentManager().executePendingTransactions();
        ShadowLooper.idleMainLooper();
        HushTumblrPreferenceFragment rebuilt = pageOf(dialog);
        SettingsL10nTest.openPageOf(rebuilt, Settings.HIDE_ADVERTISING_ID.key);
        ShadowLooper.idleMainLooper();
        assertEquals(failed, SettingsFeedbackTest.message(rebuilt.findPreference(Settings.HIDE_ADVERTISING_ID.key)));
    }

    @Test
    public void theRecoveryPagesBackClosesOnlyTheSettings() {
        HushTumblrPreferenceFragment.failNextInitialization = new IllegalStateException("injected");
        Activity activity = controller.get();
        click(pageOf(show(activity)).findPreference(BACK));
        activity.getFragmentManager().executePendingTransactions();
        ShadowLooper.idleMainLooper();

        assertNull("the settings stayed open", activity.getFragmentManager().findFragmentByTag(TAG));
        assertFalse("Back finished the host activity", activity.isFinishing());
    }

    @Test
    public void theBackKeyClosesOnlyTheSettings() {
        Activity activity = controller.get();
        show(activity).getDialog().onBackPressed();
        activity.getFragmentManager().executePendingTransactions();
        ShadowLooper.idleMainLooper();

        assertNull("the settings stayed open", activity.getFragmentManager().findFragmentByTag(TAG));
        assertFalse("Back finished the host activity", activity.isFinishing());
    }

    /**
     * Recreation hands back the page the framework saved, with its state, rather than a fresh one
     * built over it. A marker in the saved page's arguments is how the test tells the two apart: a
     * dialog that built a new page on every view would pass the count and container checks alone,
     * and the list would jump back to the top on every rotation.
     */
    @Test
    public void recreationKeepsOnePageInItsContainer() {
        android.os.Bundle marker = new android.os.Bundle();
        marker.putString("marker", "the page the framework saved");
        pageOf(show(controller.get())).setArguments(marker);

        controller.recreate();
        ShadowLooper.idleMainLooper();

        SettingsDialog restored = (SettingsDialog) controller.get().getFragmentManager().findFragmentByTag(TAG);
        assertNotNull("the settings didn't come back after recreation", restored);
        assertEquals("pages after recreation", 1, pages(restored).size());
        HushTumblrPreferenceFragment page = pageOf(restored);
        assertNotNull("recreation replaced the saved page with a new one", page.getArguments());
        assertEquals("the page the framework saved", page.getArguments().getString("marker"));
        View view = page.getView();
        assertNotNull("the restored page has no view", view);
        assertEquals(SettingsDialog.CONTAINER_ID, ((View) view.getParent()).getId());
        assertNull(page.findPreference(ERROR));
        assertTrue(page.getPreferenceScreen().getPreferenceCount() > 0);
    }

    @Test
    @Config(sdk = {29, 30, 33, 36})
    public void aFailedMountOffersReadableFocusedActionsAndRetryCreatesOneChild() {
        SettingsDialog healthy = show(controller.get());
        int healthyListeners = preferenceListeners();
        healthy.dismiss();
        ShadowLooper.idleMainLooper();
        int listeners = preferenceListeners();
        SettingsDialog.failNextMount = new IllegalStateException("injected child mount failure");
        SettingsDialog dialog = show(controller.get());
        View recovery = recoveryOf(dialog);
        assertEquals(L10n.t(controller.get(), "HushTumblr settings couldn't open"),
                ((TextView) recovery.findViewById(android.R.id.title)).getText().toString());
        assertEquals(L10n.t(controller.get(), "Try again, or go back to Tumblr."),
                ((TextView) recovery.findViewById(android.R.id.summary)).getText().toString());
        assertTrue(pages(dialog).isEmpty());
        assertEquals(listeners, preferenceListeners());
        assertFalse("search took focus behind recovery", searchOf(dialog.getView()).hasFocus());
        assertEquals(View.GONE, ((View) searchOf(dialog.getView()).getParent()).getVisibility());
        Button retry = mountAction(dialog, SettingsDialog.MOUNT_RETRY);
        assertTrue("recovery left focus on the empty container", retry.hasFocus());
        for (String tag : new String[]{SettingsDialog.MOUNT_RETRY, SettingsDialog.MOUNT_BACK}) {
            Button action = mountAction(dialog, tag);
            AccessibilityNodeInfo node = action.createAccessibilityNodeInfo();
            assertEquals(Button.class.getName(), String.valueOf(node.getClassName()));
            assertTrue(node.isEnabled());
            assertTrue(node.getActionList().contains(AccessibilityNodeInfo.AccessibilityAction.ACTION_CLICK));
            int surface = tag.equals(SettingsDialog.MOUNT_RETRY) ? ScreenColors.DEFAULT.accent : ScreenColors.DEFAULT.background;
            double text = Color.luminance(action.getCurrentTextColor());
            double background = Color.luminance(surface);
            assertTrue("recovery text lacks contrast", (Math.max(text, background) + 0.05) / (Math.min(text, background) + 0.05) >= 4.5);
        }

        retry.performClick();
        retry.performClick();
        ShadowLooper.idleMainLooper();
        HushTumblrPreferenceFragment page = pageOf(dialog);
        assertNull(dialog.getView().findViewWithTag(SettingsDialog.MOUNT_ERROR));
        assertEquals(1, pages(dialog).size());
        assertEquals(healthyListeners, preferenceListeners());
        assertNotNull(page.navigation);
        assertTrue("successful Retry did not return focus to the settings list",
                page.getView().findViewById(android.R.id.list).hasFocus());
        assertFalse(controller.get().isFinishing());
        retry.performClick();
        ShadowLooper.idleMainLooper();
        assertSame("an obsolete Retry button remounted the healthy child", page, pageOf(dialog));
        assertEquals(healthyListeners, preferenceListeners());
    }

    @Test
    public void aFailedRetryKeepsItsActionsUsableUntilASuccessfulRetry() {
        SettingsDialog.failNextMount = new IllegalStateException("first failure");
        SettingsDialog dialog = show(controller.get());
        SettingsDialog.failNextMount = new IllegalStateException("retry failure");
        mountAction(dialog, SettingsDialog.MOUNT_RETRY).performClick();
        ShadowLooper.idleMainLooper();
        assertNotNull(recoveryOf(dialog));
        assertTrue(mountAction(dialog, SettingsDialog.MOUNT_RETRY).isEnabled());
        assertTrue(mountAction(dialog, SettingsDialog.MOUNT_BACK).isEnabled());
        assertTrue(pages(dialog).isEmpty());
        mountAction(dialog, SettingsDialog.MOUNT_RETRY).performClick();
        ShadowLooper.idleMainLooper();
        assertEquals(1, pages(dialog).size());
        assertNull(dialog.getView().findViewWithTag(SettingsDialog.MOUNT_ERROR));
    }

    @Test
    public void theMountRecoverySurvivesRotationUntilThePersonRetries() {
        SettingsDialog.failNextMount = new IllegalStateException("initial failure");
        show(controller.get());
        controller.recreate();
        ShadowLooper.idleMainLooper();
        SettingsDialog dialog = restored();
        assertNotNull(recoveryOf(dialog));
        assertTrue("rotation silently retried the failed operation", pages(dialog).isEmpty());
        assertTrue(mountAction(dialog, SettingsDialog.MOUNT_RETRY).hasFocus());
        controller.recreate();
        ShadowLooper.idleMainLooper();
        dialog = restored();
        mountAction(dialog, SettingsDialog.MOUNT_RETRY).performClick();
        ShadowLooper.idleMainLooper();
        assertEquals(1, pages(dialog).size());
        assertNull(dialog.getView().findViewWithTag(SettingsDialog.MOUNT_ERROR));
        controller.recreate();
        ShadowLooper.idleMainLooper();
        assertEquals(1, pages(restored()).size());
        assertNull(restored().getView().findViewWithTag(SettingsDialog.MOUNT_ERROR));
    }

    @Test
    public void everyMountRecoveryBackPathClosesSettingsAndKeepsTheHostUsable() {
        for (int path = 0; path < 3; path++) {
            SettingsDialog.failNextMount = new IllegalStateException("mount failure");
            SettingsDialog dialog = show(controller.get());
            if (path == 0) mountAction(dialog, SettingsDialog.MOUNT_BACK).performClick();
            else if (path == 1) SettingsL10nTest.backOf(dialog).performClick();
            else dialog.getDialog().onBackPressed();
            controller.get().getFragmentManager().executePendingTransactions();
            ShadowLooper.idleMainLooper();
            assertNull("Back path " + path + " left settings open", controller.get().getFragmentManager().findFragmentByTag(TAG));
            assertFalse("Back path " + path + " finished Tumblr", controller.get().isFinishing());
        }
    }

    @Test
    public void restoredCategoryAndSearchRecoveryKeepOneChildAndTheirExistingListeners() {
        SettingsDialog dialog = show(controller.get());
        for (boolean search : new boolean[]{false, true}) {
            HushTumblrPreferenceFragment page = pageOf(dialog);
            page.navigation.navigate(search ? "" : "Updates");
            if (search) searchOf(dialog.getView()).setText("release");
            Bundle before = navigationState(page);
            int listeners = preferenceListeners();
            int observers = navigationObservers(page);
            SettingsDialog.failNextMount = new IllegalStateException("restored mount failure");
            controller.recreate();
            ShadowLooper.idleMainLooper();
            dialog = restored();
            HushTumblrPreferenceFragment restoredPage = pageOf(dialog);
            assertNotNull(recoveryOf(dialog));
            assertEquals(View.INVISIBLE, restoredPage.getView().getVisibility());
            assertEquals(View.IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS, restoredPage.getView().getImportantForAccessibility());
            mountAction(dialog, SettingsDialog.MOUNT_RETRY).performClick();
            ShadowLooper.idleMainLooper();
            assertSame("Retry discarded a healthy restored page", restoredPage, pageOf(dialog));
            assertEquals(before.getString("route"), navigationState(restoredPage).getString("route"));
            assertEquals(before.getString("query"), navigationState(restoredPage).getString("query"));
            assertEquals(before.getString("query"), searchOf(dialog.getView()).getText().toString());
            assertEquals(1, pages(dialog).size());
            assertEquals(listeners, preferenceListeners());
            assertEquals(observers, navigationObservers(restoredPage));
            assertEquals(View.VISIBLE, restoredPage.getView().getVisibility());
            assertEquals(View.IMPORTANT_FOR_ACCESSIBILITY_AUTO, restoredPage.getView().getImportantForAccessibility());
            assertFalse(searchOf(dialog.getView()).hasFocus());
            Settings.CHECK_FOR_RELEASES.save(true);
            ShadowLooper.idleMainLooper();
            assertTrue("the preserved preference listener stopped updating rows",
                    ((SwitchPreference) restoredPage.findPreference(Settings.CHECK_FOR_RELEASES.key)).isChecked());
            Settings.CHECK_FOR_RELEASES.save(false);
            ShadowLooper.idleMainLooper();
        }
    }

    @Test
    public void retryReplacesAChildWithoutItsContainerAndPreservesItsNavigationState() {
        SettingsDialog dialog = show(controller.get());
        HushTumblrPreferenceFragment original = pageOf(dialog);
        original.navigation.navigate("Updates");
        Bundle marker = new Bundle();
        marker.putString("marker", "saved child arguments");
        original.setArguments(marker);
        int listeners = preferenceListeners();
        int observers = navigationObservers(original);
        ((FrameLayout) dialog.getView().findViewById(SettingsDialog.CONTAINER_ID)).removeView(original.getView());
        SettingsDialog.failNextMount = new IllegalStateException("view mount failure");
        dialog.onViewCreated(dialog.getView(), null);
        mountAction(dialog, SettingsDialog.MOUNT_RETRY).performClick();
        ShadowLooper.idleMainLooper();
        HushTumblrPreferenceFragment replacement = pageOf(dialog);
        assertNotSame(original, replacement);
        assertEquals("saved child arguments", replacement.getArguments().getString("marker"));
        assertEquals("Updates", navigationState(replacement).getString("route"));
        assertEquals(1, pages(dialog).size());
        assertEquals(listeners, preferenceListeners());
        assertEquals(observers, navigationObservers(replacement));
        assertFalse(controller.get().isFinishing());
    }

    private SettingsDialog restored() {
        SettingsDialog dialog = (SettingsDialog) controller.get().getFragmentManager().findFragmentByTag(TAG);
        assertNotNull("settings did not survive rotation", dialog);
        return dialog;
    }

    private static View recoveryOf(SettingsDialog dialog) {
        View recovery = dialog.getView().findViewWithTag(SettingsDialog.MOUNT_ERROR);
        assertNotNull("no child-mount recovery view", recovery);
        return recovery;
    }

    private static Button mountAction(SettingsDialog dialog, String tag) {
        Button action = dialog.getView().findViewWithTag(tag);
        assertNotNull(tag, action);
        return action;
    }

    private static Bundle navigationState(HushTumblrPreferenceFragment page) {
        Bundle saved = new Bundle();
        page.navigation.save(saved);
        return saved.getBundle("hushtumblr_navigation");
    }

    private static int preferenceListeners() {
        Map<?, ?> listeners = ReflectionHelpers.getField(Setting.preferences.preferences, "mListeners");
        return listeners.size();
    }

    private static int navigationObservers(HushTumblrPreferenceFragment page) {
        Object observable = ReflectionHelpers.getField(page.getPreferenceScreen().getRootAdapter(), "mDataSetObservable");
        Collection<?> observers = ReflectionHelpers.getField(observable, "mObservers");
        return observers.size();
    }

    private static EditText searchOf(View view) {
        if (view instanceof EditText) return (EditText) view;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                EditText found = searchOf(group.getChildAt(i));
                if (found != null) return found;
            }
        }
        return null;
    }

    private static SettingsDialog show(Activity activity) {
        SettingsDialog dialog = new SettingsDialog();
        dialog.show(activity.getFragmentManager(), TAG);
        activity.getFragmentManager().executePendingTransactions();
        ShadowLooper.idleMainLooper();
        return dialog;
    }

    private static HushTumblrPreferenceFragment pageOf(SettingsDialog dialog) {
        Fragment page = dialog.getChildFragmentManager().findFragmentById(SettingsDialog.CONTAINER_ID);
        assertTrue("no preference page in the dialog: " + page, page instanceof HushTumblrPreferenceFragment);
        return (HushTumblrPreferenceFragment) page;
    }

    private static List<Fragment> pages(SettingsDialog dialog) {
        List<Fragment> pages = new ArrayList<>();
        for (Fragment fragment : dialog.getChildFragmentManager().getFragments()) {
            if (fragment instanceof HushTumblrPreferenceFragment) pages.add(fragment);
        }
        return pages;
    }

    private static void click(Preference row) {
        assertNotNull("no such row", row);
        row.getOnPreferenceClickListener().onPreferenceClick(row);
    }

    private static void assertLightText(Preference row) {
        TypedArray styled = row.getContext().obtainStyledAttributes(new int[]{android.R.attr.textColorPrimary});
        try {
            ColorStateList primary = styled.getColorStateList(0);
            assertNotNull(primary);
            assertTrue("\"" + row.getTitle() + "\" is drawn dark on the black page",
                    Color.luminance(primary.getDefaultColor()) > 0.5f);
        } finally {
            styled.recycle();
        }
    }
}
