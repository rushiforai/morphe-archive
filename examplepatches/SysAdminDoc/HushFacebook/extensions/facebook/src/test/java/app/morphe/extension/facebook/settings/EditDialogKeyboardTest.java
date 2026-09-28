package app.morphe.extension.facebook.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import android.app.Activity;
import android.app.Fragment;
import android.preference.EditTextPreference;
import android.view.WindowManager;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowLooper;

import java.util.EnumSet;

import app.morphe.extension.shared.SettingsContextRule;

/**
 * Every edit dialog on the settings page resizes above the keyboard. At font scale 2 the video file
 * name's long message pushed Save and Cancel under the keyboard on a phone-sized screen.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
@SuppressWarnings("deprecation")
public class EditDialogKeyboardTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @After
    public void restore() {
        PatchFamily.inBuildForTests = null;
        ScreenColors.shown = null;
    }

    @Test
    public void theSaveFolderDialogResizesAboveTheKeyboard() {
        assertResizes(Settings.SAVE_FOLDER.key);
    }

    @Test
    public void theVideoFileNameDialogResizesAboveTheKeyboard() {
        assertResizes(Settings.FILENAME_TEMPLATE.key);
    }

    @Test
    public void bothWordListDialogsResizeAboveTheKeyboard() {
        assertResizes(Settings.HIDDEN_WORDS.key);
        assertResizes(Settings.KEPT_WORDS.key);
    }

    @Test
    public void aDialogWithNoWindowIsLeftAlone() {
        HushfacebookPreferenceFragment.fitAboveKeyboard(null);
    }

    private static void assertResizes(String key) {
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            SettingsDialog dialog = new SettingsDialog();
            dialog.show(controller.get().getFragmentManager(), "hushfacebook_settings");
            controller.get().getFragmentManager().executePendingTransactions();
            ShadowLooper.idleMainLooper();
            Fragment page = dialog.getChildFragmentManager().findFragmentById(SettingsDialog.CONTAINER_ID);
            assertTrue("no preference page", page instanceof HushfacebookPreferenceFragment);
            EditTextPreference row = (EditTextPreference) ((HushfacebookPreferenceFragment) page).findPreference(key);
            assertNotNull("no row for " + key, row);
            if (row instanceof HushfacebookPreferenceFragment.FolderRow) {
                ((HushfacebookPreferenceFragment.FolderRow) row).showDialog(null);
            } else if (row instanceof HushfacebookPreferenceFragment.FileNameRow) {
                ((HushfacebookPreferenceFragment.FileNameRow) row).showDialog(null);
            } else if (row instanceof HushfacebookPreferenceFragment.WordsRow) {
                ((HushfacebookPreferenceFragment.WordsRow) row).showDialog(null);
            } else {
                fail(key + " is a " + row.getClass().getName() + ", not one of the page's edit rows");
            }
            ShadowLooper.idleMainLooper();
            try {
                int mode = row.getDialog().getWindow().getAttributes().softInputMode;
                assertEquals(key + " doesn't resize above the keyboard", WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE,
                        mode & WindowManager.LayoutParams.SOFT_INPUT_MASK_ADJUST);
            } finally {
                row.getDialog().dismiss();
            }
        }
    }
}
