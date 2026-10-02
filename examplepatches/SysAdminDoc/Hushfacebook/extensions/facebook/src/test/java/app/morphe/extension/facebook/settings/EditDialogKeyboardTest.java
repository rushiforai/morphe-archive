package app.morphe.extension.facebook.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Fragment;
import android.preference.EditTextPreference;
import android.view.View;
import android.view.ViewParent;
import android.view.WindowManager;
import android.view.inputmethod.EditorInfo;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ScrollView;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import org.robolectric.shadows.ShadowLooper;

import java.util.EnumSet;
import java.util.ArrayList;
import java.util.concurrent.TimeUnit;

import app.morphe.extension.facebook.feed.PostWords;
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
        Settings.HIDDEN_WORDS.resetToDefault();
        RuntimeEnvironment.setFontScale(1f);
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

    /**
     * #58: with the longest list on a phone-sized screen, a word list's dialog is one scroll that
     * holds its explanation and the whole list. The list doesn't scroll inside itself, the scroll
     * follows the caret to the list's last line and back to its first, and Save and Cancel sit
     * below it, on the screen. Cancel keeps the saved list.
     */
    @Test
    @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(qualifiers = "w360dp-h640dp")
    public void aLongWordListScrollsAsOneAboveItsButtons() {
        assertLongListReachable();
    }

    @Test
    @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(qualifiers = "w640dp-h360dp-land")
    public void aLongWordListScrollsAsOneInLandscape() {
        assertLongListReachable();
    }

    @Test
    @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(qualifiers = "ar-rXB-ldrtl-w360dp-h640dp-night")
    public void aLongWordListScrollsAsOneRightToLeftInTheDarkAtTwiceTheTextSize() {
        RuntimeEnvironment.setFontScale(2f);
        assertLongListReachable();
    }

    private static void assertLongListReachable() {
        StringBuilder longest = new StringBuilder();
        for (int phrase = 0; phrase < PostWords.MAX_PHRASES; phrase++) {
            if (phrase > 0) longest.append('\n');
            longest.append("phrase ").append(phrase).append(" that runs on");
        }
        String list = longest.toString();
        assertTrue(PostWords.isClean(list));
        Settings.HIDDEN_WORDS.save(list);
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushfacebookPreferenceFragment.WordsRow row =
                    (HushfacebookPreferenceFragment.WordsRow) shown(controller, Settings.HIDDEN_WORDS.key);
            AlertDialog dialog = (AlertDialog) row.getDialog();
            try {
                EditText field = row.getEditText();
                ScrollView scroll = scrollAround(field);
                assertNotNull("the list isn't in a scroll", scroll);
                // AlertDialog also keeps a hidden stock message with this ID. Check the displayed
                // explanation, rather than whichever duplicate findViewById finds first.
                ArrayList<View> explanations = new ArrayList<>();
                dialog.getWindow().getDecorView().findViewsWithText(explanations,
                        row.getDialogMessage(), View.FIND_VIEWS_WITH_TEXT);
                int visible = 0;
                for (View explanation : explanations) {
                    if (!explanation.isShown()) continue;
                    visible++;
                    assertSame("the explanation scrolls with the list", scroll, scrollAround(explanation));
                }
                assertEquals("one displayed explanation", 1, visible);
                assertEquals("the list scrolls inside itself", Integer.MAX_VALUE, field.getMaxLines());
                assertEquals(list, field.getText().toString());
                assertTrue("the whole list fits, so this shows nothing", scroll.canScrollVertically(1));

                View window = dialog.getWindow().getDecorView();
                for (int which : new int[]{AlertDialog.BUTTON_POSITIVE, AlertDialog.BUTTON_NEGATIVE}) {
                    Button button = dialog.getButton(which);
                    assertFalse(button.getText() + " is inside the scroll", scrollAround(button) == scroll);
                    int[] at = new int[2];
                    button.getLocationInWindow(at);
                    assertTrue(button.getText() + " is off the screen", button.isShown()
                            && at[1] >= 0 && at[1] + button.getHeight() <= window.getHeight());
                }

                field.requestFocus();
                field.setSelection(list.length());
                ShadowLooper.idleMainLooper();
                dialog.getWindow().getDecorView().getViewTreeObserver().dispatchOnPreDraw();
                // ScrollView animates the rectangle request TextView sends before drawing. A
                // looper drain alone neither advances animation time nor draws the next frame.
                for (int frame = 0; frame < 32; frame++) {
                    ShadowLooper.idleMainLooper(16, TimeUnit.MILLISECONDS);
                    scroll.computeScroll();
                }
                int lastLine = field.getTop() + field.getLayout().getLineTop(field.getLineCount() - 1) + field.getTotalPaddingTop();
                assertTrue("the caret on the last line is out of sight: line=" + lastLine
                        + ", scroll=" + scroll.getScrollY() + ", height=" + scroll.getHeight(), lastLine >= scroll.getScrollY()
                        && lastLine < scroll.getScrollY() + scroll.getHeight());
                field.setSelection(0);
                ShadowLooper.idleMainLooper();
                dialog.getWindow().getDecorView().getViewTreeObserver().dispatchOnPreDraw();
                for (int frame = 0; frame < 32; frame++) {
                    ShadowLooper.idleMainLooper(16, TimeUnit.MILLISECONDS);
                    scroll.computeScroll();
                }
                int firstLine = field.getTop() + field.getTotalPaddingTop();
                assertTrue("the caret on the first line is out of sight", firstLine >= scroll.getScrollY()
                        && firstLine < scroll.getScrollY() + scroll.getHeight());

                field.setText("changed");
                dialog.getButton(AlertDialog.BUTTON_NEGATIVE).performClick();
                ShadowLooper.idleMainLooper();
                assertEquals("Cancel saved the list", list, Settings.HIDDEN_WORDS.savedValue());
            } finally {
                if (dialog.isShowing()) dialog.dismiss();
            }
        }
    }

    /** The scroll [view] sits in, or null. */
    private static ScrollView scrollAround(View view) {
        for (ViewParent parent = view.getParent(); parent != null; parent = parent.getParent()) {
            if (parent instanceof ScrollView) return (ScrollView) parent;
        }
        return null;
    }

    @Test
    public void aDialogWithNoWindowIsLeftAlone() {
        HushfacebookPreferenceFragment.fitAboveKeyboard(null);
    }

    private static void assertResizes(String key) {
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            EditTextPreference row = shown(controller, key);
            try {
                int mode = row.getDialog().getWindow().getAttributes().softInputMode;
                assertEquals(key + " doesn't resize above the keyboard", WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE,
                        mode & WindowManager.LayoutParams.SOFT_INPUT_MASK_ADJUST);
                if (row instanceof HushfacebookPreferenceFragment.WordsRow) {
                    int flags = EditorInfo.IME_FLAG_NO_FULLSCREEN | EditorInfo.IME_FLAG_NO_EXTRACT_UI;
                    assertEquals("the landscape keyboard can replace the word dialog", flags,
                            row.getEditText().getImeOptions() & flags);
                }
            } finally {
                row.getDialog().dismiss();
            }
        }
    }

    /** The settings page's edit row for [key], with its dialog showing. */
    private static EditTextPreference shown(ActivityController<Activity> controller, String key) {
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
        return row;
    }
}
