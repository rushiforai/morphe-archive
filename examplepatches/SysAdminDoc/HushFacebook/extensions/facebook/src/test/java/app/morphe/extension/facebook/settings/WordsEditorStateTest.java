/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.app.AlertDialog;

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
import org.robolectric.shadows.ShadowAlertDialog;
import org.robolectric.shadows.ShadowToast;

import java.util.EnumSet;

import app.morphe.extension.facebook.feed.PostWords;
import app.morphe.extension.facebook.feed.PostWordsTest;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.settings.preference.AbstractPreferenceFragment;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
@SuppressWarnings("deprecation")
public class WordsEditorStateTest {
    @Rule public final SettingsContextRule settings = new SettingsContextRule();

    @Before public void prepare() {
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        Settings.HIDDEN_WORDS.resetToDefault();
        Settings.KEPT_WORDS.resetToDefault();
        Settings.HIDE_POSTS_WITH_WORDS.save(true);
    }

    @After public void restore() {
        AbstractPreferenceFragment.settingImportInProgress = false;
        ShadowLooper.idleMainLooper();
        Settings.HIDDEN_WORDS.resetToDefault();
        Settings.KEPT_WORDS.resetToDefault();
        Settings.HIDE_POSTS_WITH_WORDS.resetToDefault();
        PatchFamily.inBuildForTests = null;
        ScreenColors.shown = null;
    }

    @Test
    public void anOpenDraftWaitsForImportThenUsesTheCurrentCompanionBudget() {
        String half = PostWordsTest.asciiOfBytes(PostWords.MAX_LIST_BYTES / 2);
        String more = PostWordsTest.asciiOfBytes(PostWords.MAX_LIST_BYTES / 2 + 1);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushfacebookPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(controller.get()));
            ValueRows.WordsRow row = (ValueRows.WordsRow) page.findPreference(Settings.HIDDEN_WORDS.key);
            row.showDialog(null);
            ShadowLooper.idleMainLooper();
            AlertDialog editor = (AlertDialog) row.getDialog();
            row.getEditText().setText(half);
            try {
                AbstractPreferenceFragment.settingImportInProgress = true;
                editor.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
                ShadowLooper.idleMainLooper();
                assertTrue("Import closed the open draft", editor.isShowing());
                assertEquals(half, row.getEditText().getText().toString());
                assertEquals("", Settings.HIDDEN_WORDS.savedValue());
                assertEquals("", Settings.KEPT_WORDS.savedValue());
                assertEquals("Importing settings", ShadowToast.getTextOfLatestToast());
                assertFalse("the final preference-change path wrote through the import",
                        row.getOnPreferenceChangeListener().onPreferenceChange(row, half));
                assertEquals("", Settings.HIDDEN_WORDS.savedValue());

                AbstractPreferenceFragment.settingImportInProgress = false;
                Settings.KEPT_WORDS.save(more);
                editor.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
                ShadowLooper.idleMainLooper();
                assertTrue("Save used the companion's old empty budget", editor.isShowing());
                assertEquals("", Settings.HIDDEN_WORDS.savedValue());
                assertEquals(more, Settings.KEPT_WORDS.savedValue());
                assertEquals(half, row.getEditText().getText().toString());

                AlertDialog refusal = ShadowAlertDialog.getLatestAlertDialog();
                assertTrue("the capacity refusal was not shown", refusal != editor && refusal.isShowing());
                refusal.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
                ShadowLooper.idleMainLooper();
                row.getEditText().setText("fits");
                editor.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
                ShadowLooper.idleMainLooper();
                assertFalse(editor.isShowing());
                assertEquals("fits", Settings.HIDDEN_WORDS.savedValue());
                assertEquals(more, Settings.KEPT_WORDS.savedValue());
                assertTrue(PostWords.fits(Settings.HIDDEN_WORDS.savedValue(), Settings.KEPT_WORDS.savedValue()));
            } finally {
                AbstractPreferenceFragment.settingImportInProgress = false;
                if (editor.isShowing()) editor.dismiss();
            }
        }
    }

    @Test
    public void saveRechecksTheOtherListAfterAnotherLiveEditorChangesIt() {
        String half = PostWordsTest.asciiOfBytes(PostWords.MAX_LIST_BYTES / 2);
        String more = PostWordsTest.asciiOfBytes(PostWords.MAX_LIST_BYTES / 2 + 1);
        try (ActivityController<Activity> first = Robolectric.buildActivity(Activity.class).setup();
             ActivityController<Activity> second = Robolectric.buildActivity(Activity.class).setup()) {
            HushfacebookPreferenceFragment firstPage = SettingsL10nTest.pageOf(SettingsL10nTest.show(first.get()));
            ValueRows.WordsRow hide = (ValueRows.WordsRow) firstPage.findPreference(Settings.HIDDEN_WORDS.key);
            assertNotNull(hide);
            assertTrue(hide.isEnabled());
            hide.showDialog(null);
            ShadowLooper.idleMainLooper();
            AlertDialog hideDialog = (AlertDialog) hide.getDialog();
            hide.getEditText().setText(half);

            HushfacebookPreferenceFragment secondPage = SettingsL10nTest.pageOf(SettingsL10nTest.show(second.get()));
            ValueRows.WordsRow keep = (ValueRows.WordsRow) secondPage.findPreference(Settings.KEPT_WORDS.key);
            assertNotNull(keep);
            keep.showDialog(null);
            ShadowLooper.idleMainLooper();
            AlertDialog keepDialog = (AlertDialog) keep.getDialog();
            try {
                keep.getEditText().setText(more);
                keepDialog.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
                ShadowLooper.idleMainLooper();
                assertFalse(keepDialog.isShowing());
                assertEquals(more, Settings.KEPT_WORDS.savedValue());

                hideDialog.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
                ShadowLooper.idleMainLooper();

                assertTrue("Save closed a draft that no longer fits beside the other list", hideDialog.isShowing());
                assertEquals("", Settings.HIDDEN_WORDS.savedValue());
                assertEquals(more, Settings.KEPT_WORDS.savedValue());
                assertEquals("the refused draft was discarded", half, hide.getEditText().getText().toString());
                assertTrue(PostWords.fits(Settings.HIDDEN_WORDS.savedValue(), Settings.KEPT_WORDS.savedValue()));
            } finally {
                if (hideDialog.isShowing()) hideDialog.dismiss();
                if (keepDialog.isShowing()) keepDialog.dismiss();
            }
        }
    }
}
