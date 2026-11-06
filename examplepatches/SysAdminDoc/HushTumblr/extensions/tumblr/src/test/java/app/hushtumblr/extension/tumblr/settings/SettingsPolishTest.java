/*
 * Forked from https://github.com/SysAdminDoc/HushPinterest at debdac4 (GPL-3.0),
 * modified for HushTumblr (Tumblr), 2026.
 */
package app.hushtumblr.extension.tumblr.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;
import static org.robolectric.Shadows.shadowOf;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.pm.ApplicationInfo;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Rect;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.os.Bundle;
import android.os.SystemClock;
import android.preference.Preference;
import android.preference.PreferenceGroup;
import android.text.Layout;
import android.util.TypedValue;
import android.view.InputDevice;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputMethodManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.ImageButton;
import android.widget.ListView;
import android.widget.ScrollView;
import android.widget.TextView;

import org.json.JSONObject;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.rules.TestName;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import org.robolectric.shadows.ShadowAlertDialog;
import org.robolectric.shadows.ShadowLooper;
import org.robolectric.shadows.ShadowToast;
import org.robolectric.util.ReflectionHelpers;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.EnumSet;
import java.util.List;
import java.util.Locale;

import app.hushtumblr.extension.shared.L10n;
import app.hushtumblr.extension.shared.L10nTablesForTests;
import app.hushtumblr.extension.shared.SettingsContextRule;
import app.hushtumblr.extension.shared.settings.FailingStore;
import app.hushtumblr.extension.shared.settings.PauseForTests;

/** Actual settings controls in a light host, including the smaller viewport left by a keyboard. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {26, 30, 36, 37}, qualifiers = "en-rUS-w390dp-h600dp-notnight-xhdpi")
@GraphicsMode(GraphicsMode.Mode.NATIVE)
@SuppressWarnings("deprecation")
public class SettingsPolishTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();
    @Rule public final TestName testName = new TestName();
    private ActivityController<LightHost> controller;
    private SettingsDialog settings;
    private HushTumblrPreferenceFragment page;
    private int geometryCapture;

    public static class LightHost extends Activity {
        @Override public void onCreate(Bundle state) {
            setTheme(android.R.style.Theme_Material_Light_NoActionBar);
            super.onCreate(state);
        }
    }

    @Before public void prepare() {
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        PauseForTests.resume();
        TextSettings.HIDDEN_WORDS.resetToDefault();
        TextSettings.ALLOWED_WORDS.resetToDefault();
        TextSettings.TAB_ORDER.resetToDefault();
    }

    @After public void close() {
        if (controller != null) controller.close();
        RuntimeEnvironment.setFontScale(1f);
        PatchFamily.inBuildForTests = null;
        PatchFamily.capabilitiesForTests = null;
        TextSettings.HIDDEN_WORDS.resetToDefault();
        TextSettings.ALLOWED_WORDS.resetToDefault();
        TextSettings.TAB_ORDER.resetToDefault();
        Settings.WORDS_TAGS.resetToDefault();
        PauseForTests.resume();
    }

    @Test public void openingTypingClearSubmitAndBackKeepSearchFocusAndKeyboardInStep() throws Exception {
        open();
        EditText search = search();
        InputMethodManager keyboard = controller.get().getSystemService(InputMethodManager.class);
        assertFalse(search.hasFocus());
        assertFalse(shadowOf(keyboard).isSoftInputVisible());
        assertEquals(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE,
                settings.getDialog().getWindow().getAttributes().softInputMode
                        & WindowManager.LayoutParams.SOFT_INPUT_MASK_ADJUST);
        assertEquals(View.INVISIBLE, clear().getVisibility());

        focusSearch("links");
        assertTrue(clear().isShown());
        assertTrue(shadowOf(keyboard).isSoftInputVisible());
        render("search-focused", settings.getView());
        clear().performClick();
        settle();
        assertEquals("", search.getText().toString());
        assertTrue("Clear should leave search ready for replacement text", search.hasFocus());
        assertTrue(shadowOf(keyboard).isSoftInputVisible());
        assertEquals(View.INVISIBLE, clear().getVisibility());
        assertNotNull(homeRowShown(L10n.t("Feed")));

        focusSearch("privacy");
        search.onEditorAction(EditorInfo.IME_ACTION_SEARCH);
        assertEquals("privacy", search.getText().toString());
        assertFalse(shadowOf(keyboard).isSoftInputVisible());
        keyboard.showSoftInput(search, 0);
        SettingsL10nTest.backOf(settings).performClick();
        settle();
        assertTrue(settings.getDialog().isShowing());
        assertEquals("", search.getText().toString());
        assertFalse(search.hasFocus());
        assertFalse(shadowOf(keyboard).isSoftInputVisible());
        page.navigation.navigate("Feed");
        settle();
        assertFalse(search.isShown());
        assertFalse(search.hasFocus());
    }

    @Test public void recreationKeepsTheQueryWithoutSummoningTheKeyboardAgain() {
        open();
        focusSearch("new releases");
        InputMethodManager keyboard = controller.get().getSystemService(InputMethodManager.class);
        assertTrue(shadowOf(keyboard).isSoftInputVisible());
        search().onEditorAction(EditorInfo.IME_ACTION_SEARCH);
        assertFalse(shadowOf(keyboard).isSoftInputVisible());
        controller.recreate();
        settle();
        settings = (SettingsDialog) controller.get().getFragmentManager().findFragmentByTag("hushtumblr_settings");
        assertNotNull(settings);
        page = SettingsL10nTest.pageOf(settings);
        layout(settings.getView());
        assertEquals("new releases", search().getText().toString());
        assertNotNull(page.findPreference(Settings.CHECK_FOR_RELEASES.key));
        assertFalse("restoring a query stole input focus", search().hasFocus());
        assertFalse("a restored query reopened the keyboard", shadowOf(keyboard).isSoftInputVisible());
        SettingsL10nTest.backOf(settings).performClick();
        settle();
        assertEquals("", search().getText().toString());
        assertNotNull(homeRowShown(L10n.t("Feed")));
    }

    @Test public void theLightHostKeepsItsThemeWhileSettingsAndItsEditorUseTheirOwnColors() {
        open();
        Resources.Theme hostTheme = controller.get().getTheme();
        int hostAccent = themeColor(hostTheme, android.R.attr.colorAccent);
        int hostText = new EditText(controller.get()).getCurrentTextColor();
        assertFalse("the control host already uses our dark text", hostText == ScreenColors.DEFAULT.title);
        assertFalse("the control host already uses our accent", hostAccent == ScreenColors.DEFAULT.accent);
        assertEquals(ScreenColors.DEFAULT.title, search().getCurrentTextColor());
        assertEquals(ScreenColors.DEFAULT.summary, search().getCurrentHintTextColor());
        assertEquals(ScreenColors.DEFAULT.accent & 0xFFFFFF, search().getHighlightColor() & 0xFFFFFF);
        if (Build.VERSION.SDK_INT >= 29) {
            assertAccent(search().getTextCursorDrawable());
            assertAccent(search().getTextSelectHandle());
            assertAccent(search().getTextSelectHandleLeft());
            assertAccent(search().getTextSelectHandleRight());
        }
        page.navigation.navigate("Feed");
        settle();
        layout(settings.getView());
        ListView rows = page.getView().findViewById(android.R.id.list);
        TextView title = rows.getChildAt(0).findViewById(android.R.id.title);
        assertEquals(ScreenColors.DEFAULT.title, title.getCurrentTextColor());
        AlertDialog editor = click(page.findPreference(HushTumblrPreferenceFragment.HIDDEN_WORDS_ROW));
        EditText field = editor.findViewById(android.R.id.edit);
        assertEquals(ScreenColors.DEFAULT.title, field.getCurrentTextColor());
        assertEquals(ScreenColors.DEFAULT.onAccent,
                editor.getButton(AlertDialog.BUTTON_POSITIVE).getCurrentTextColor());
        editor.getButton(AlertDialog.BUTTON_NEGATIVE).performClick();
        assertSame(hostTheme, controller.get().getTheme());
        assertEquals(hostAccent, themeColor(hostTheme, android.R.attr.colorAccent));
        assertEquals(hostText, new EditText(controller.get()).getCurrentTextColor());
    }

    @Test public void actualActionSurfacesDistinguishDisabledFocusSelectionAndHover() throws Exception {
        open();
        focusSearch("links");
        View searchBox = (View) search().getParent();
        int[] focused = pixels(searchBox.getBackground());
        search().clearFocus();
        settings.getView().requestFocus();
        settle();
        assertFalse("search could not release focus", search().hasFocus());
        int[] resting = pixels(searchBox.getBackground());
        assertFalse("search focus has no visible boundary", Arrays.equals(focused, resting));
        assertTrue("search's resting boundary lost its control contrast",
                Arrays.stream(resting).anyMatch(color -> color == ScreenColors.DEFAULT.switchOff));
        assertTrue(ScreenColorsTest.contrast(ScreenColors.DEFAULT.switchOff, ScreenColors.DEFAULT.card) >= 3);
        assertActionStates(clear());
        assertActionStates(SettingsL10nTest.backOf(settings));
        clear().setEnabled(false);
        render("search-clear-disabled", settings.getView());
        clear().setEnabled(true);
        AlertDialog editor = click(page.findPreference(HushTumblrPreferenceFragment.HIDDEN_WORDS_ROW));
        bounded(editor);
        assertActionStates(editor.getButton(AlertDialog.BUTTON_POSITIVE));
        assertActionStates(editor.getButton(AlertDialog.BUTTON_NEGATIVE));
        editor.getButton(AlertDialog.BUTTON_POSITIVE).setEnabled(false);
        render("editor-save-disabled", editor.getWindow().getDecorView());
        editor.getButton(AlertDialog.BUTTON_NEGATIVE).performClick();
    }

    @Test public void bothWordEditorsKeepTheirButtonsAndLastDraftLineReachableAtTwiceTheTextSize() {
        RuntimeEnvironment.setFontScale(2f);
        open();
        for (String key : new String[]{HushTumblrPreferenceFragment.HIDDEN_WORDS_ROW,
                HushTumblrPreferenceFragment.ALLOWED_WORDS_ROW}) {
            AlertDialog editor = click(page.findPreference(key));
            // Resized for the keyboard rather than panned, which left the buttons under it on a
            // Samsung phone at this text size.
            assertEquals(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE,
                    editor.getWindow().getAttributes().softInputMode & WindowManager.LayoutParams.SOFT_INPUT_MASK_ADJUST);
            EditText field = editor.findViewById(android.R.id.edit);
            String draft = phrases(60);
            field.setText(draft);
            View decor = bounded(editor);
            assertButtons(editor);
            TextView label = visibleText(decor, L10n.t("One word or phrase a line"));
            assertNotNull("the label vanished once the draft was nonempty", label);
            assertEquals(android.R.id.edit, label.getLabelFor());
            field.setSelection(field.length());
            field.bringPointIntoView(field.length());
            settle();
            assertTrue("the long draft never scrolled", field.getScrollY() > 0);
            Layout text = field.getLayout();
            assertNotNull(text);
            assertEquals(draft.length(), text.getLineEnd(text.getLineCount() - 1));
            assertTrue("the last draft line is below the field", text.getLineBottom(text.getLineCount() - 1)
                    - field.getScrollY() <= field.getHeight() - field.getCompoundPaddingTop() - field.getCompoundPaddingBottom());
            assertButtons(editor);
            editor.getButton(AlertDialog.BUTTON_NEGATIVE).performClick();
            settle();
            assertFalse(editor.isShowing());
            assertEquals("", TextSettings.HIDDEN_WORDS.savedValue());
            assertEquals("", TextSettings.ALLOWED_WORDS.savedValue());
        }
    }

    @Test public void theWordPreviewWrapsAndScrollsIntoReachAtTwiceTheTextSize() {
        RuntimeEnvironment.setFontScale(2f);
        TextSettings.HIDDEN_WORDS.save("cat");
        Settings.WORDS_TAGS.save(false);
        open();
        for (String key : new String[]{HushTumblrPreferenceFragment.HIDDEN_WORDS_ROW,
                HushTumblrPreferenceFragment.ALLOWED_WORDS_ROW}) {
            AlertDialog editor = click(page.findPreference(key));
            List<EditText> inputs = SettingsDialogTest.previewInputs(editor);
            inputs.get(0).setText("my cat");
            settle();
            assertScrollableEndAndButtons(editor);
            View decor = editor.getWindow().getDecorView();
            TextView result = SettingsDialogTest.previewResult(editor);
            assertWholeText(result);
            assertTrue("the result never wrapped at this size", result.getLineCount() > 1);
            // The line under the Tags field that's off wraps whole, where its hint was cut to one line.
            ViewGroup section = (ViewGroup) result.getParent();
            TextView off = (TextView) section.getChildAt(section.indexOfChild(inputs.get(2)) + 1);
            assertEquals(L10n.f("Not matched while %1$s is off", L10n.t("Match current post tags")), off.getText().toString());
            assertWholeText(off);
            assertTrue("the off line never wrapped at this size", off.getLineCount() > 1);
            Button clear = decor.findViewWithTag(WordPreviewSection.CLEAR_TAG);
            assertVisible(clear, decor);
            assertWholeText(clear);
            assertTrue("Clear is below 48dp", clear.getHeight()
                    >= Math.round(48 * clear.getResources().getDisplayMetrics().density));
            editor.getButton(AlertDialog.BUTTON_NEGATIVE).performClick();
            settle();
            assertFalse(editor.isShowing());
        }
    }

    @Test public void aSwipeScrollsTheDraftAndReleasesTheOuterBodyAfterUpOrCancel() {
        RuntimeEnvironment.setFontScale(2f);
        open();
        for (int finish : new int[]{MotionEvent.ACTION_UP, MotionEvent.ACTION_CANCEL}) {
            AlertDialog editor = click(page.findPreference(HushTumblrPreferenceFragment.HIDDEN_WORDS_ROW));
            EditText field = editor.findViewById(android.R.id.edit);
            field.setText(phrases(60));
            field.setSelection(0);
            assertTrue(field.requestFocus());
            int availableHeight = Math.round(320 * field.getResources().getDisplayMetrics().density);
            editor.getWindow().setLayout(editor.getWindow().getAttributes().width, availableHeight);
            View decor = bounded(editor, availableHeight);
            ScrollView body = first(decor, ScrollView.class);
            assertNotNull(body);
            assertButtons(editor);
            body.setSmoothScrollingEnabled(false);
            android.widget.OverScroller focusScroll = org.robolectric.util.ReflectionHelpers.getField(body, "mScroller");
            focusScroll.abortAnimation();
            field.scrollTo(0, 0);
            body.scrollTo(0, field.getTop());
            Rect inside = visibleIn(field, body);
            assertEquals("the draft is not exposed in the body", field.getHeight(), inside.height());
            assertTrue("bringing the draft into view left no outer recovery scroll", body.canScrollVertically(1));
            assertTrue("the draft did not exercise internal scrolling", field.canScrollVertically(1));
            int inset = Math.round(8 * field.getResources().getDisplayMetrics().density);
            assertTrue("the exposed draft does not allow a drag past touch slop", inside.height() - inset * 2
                    > ViewConfiguration.get(field.getContext()).getScaledTouchSlop());
            int bodyBefore = body.getScrollY();
            // Dispatch through the real parent so its interception and the child's movement
            // method both run, independently of a paused window's focus-reveal animation.
            swipe(body, inside.exactCenterX(), inside.bottom - inset, inside.top + inset, finish);
            assertTrue("the parent stole the draft's swipe", field.getScrollY() > 0);
            assertEquals("swiping the draft moved its surrounding help", bodyBefore, body.getScrollY());
            int draftBefore = field.getScrollY();
            Rect outside = visibleIn(body, body);
            float edge = outside.left + inset;
            assertTrue("the second gesture would hit the field too", edge < inside.left);
            swipe(body, edge, outside.bottom - inset, outside.top + inset, MotionEvent.ACTION_CANCEL);
            assertTrue("the body stayed locked after the draft gesture ended", body.getScrollY() > bodyBefore);
            assertEquals("swiping beside the draft also scrolled its text", draftBefore, field.getScrollY());
            assertButtons(editor);
            editor.getButton(AlertDialog.BUTTON_NEGATIVE).performClick();
            settle();
            assertFalse(editor.isShowing());
        }
    }

    @Test public void stylingKeepsEachNativeButtonsDpadFocusAndCallback() throws Exception {
        RuntimeEnvironment.setFontScale(2f);
        open();
        for (int which : new int[]{AlertDialog.BUTTON_NEUTRAL, AlertDialog.BUTTON_NEGATIVE, AlertDialog.BUTTON_POSITIVE}) {
            int[] called = {0, 0};
            android.content.DialogInterface.OnClickListener callback = (dialog, clicked) -> {
                called[0]++;
                called[1] = clicked;
            };
            AlertDialog dialog = new AlertDialog.Builder(HushTumblrPreferenceFragment.themed(controller.get()))
                    .setTitle(page.findPreference(HushTumblrPreferenceFragment.TAB_ORDER_ROW).getTitle())
                    .setNeutralButton(L10n.t("Tumblr's order"), callback)
                    .setNegativeButton(L10n.t("Cancel"), callback)
                    .setPositiveButton(L10n.t("Done"), callback).show();
            try {
                settle();
                Button original = dialog.getButton(which);
                int id = original.getId();
                assertTrue("the native action could not take D-pad focus", original.requestFocusFromTouch());
                assertTrue(original.hasFocus());
                ScreenColors.dialog(dialog);
                View decor = bounded(dialog);
                assertSame("styling replaced the controller's native button", original, dialog.getButton(which));
                assertEquals(id, original.getId());
                assertTrue("styling moved D-pad focus away from the chosen action", original.hasFocus());
                assertButtons(dialog);
                render("native-action-" + which + "-focused", decor);
                assertTrue(dialog.dispatchKeyEvent(new KeyEvent(KeyEvent.ACTION_DOWN, KeyEvent.KEYCODE_DPAD_CENTER)));
                assertTrue(dialog.dispatchKeyEvent(new KeyEvent(KeyEvent.ACTION_UP, KeyEvent.KEYCODE_DPAD_CENTER)));
                settle();
                assertEquals("the native callback did not run exactly once", 1, called[0]);
                assertEquals(which, called[1]);
                assertFalse("the native button no longer dismisses its dialog", dialog.isShowing());
            } finally { dialog.dismiss(); }
        }
    }

    @Test public void tabOrderKeepsResetAndTheLastTabReachableAtTwiceTheTextSize() {
        RuntimeEnvironment.setFontScale(2f);
        open();
        AlertDialog tabs = click(page.findPreference(HushTumblrPreferenceFragment.TAB_ORDER_ROW));
        bounded(tabs);
        assertButtons(tabs);
        ListView list = tabs.getListView();
        int last = list.getCount() - 1;
        list.setSelection(last);
        bounded(tabs);
        TextView row = (TextView) list.getChildAt(last - list.getFirstVisiblePosition());
        assertNotNull("the final tab cannot be reached", row);
        assertWholeText(row);
        assertVisible(row, tabs.getWindow().getDecorView());
        tabs.getButton(AlertDialog.BUTTON_NEUTRAL).performClick();
        settle();
        assertEquals("", TextSettings.TAB_ORDER.savedValue());
        assertTrue(tabs.isShowing());
        assertButtons(tabs);
        tabs.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
        settle();
        assertFalse(tabs.isShowing());
    }

    @Test public void importAndLicensesKeepControlsAndTheirLastLineReachableAtTwiceTheTextSize() throws Exception {
        RuntimeEnvironment.setFontScale(2f);
        open();
        boolean saved = Settings.HIDE_ADVERTISING_ID.savedValue();
        String file = new JSONObject().put("format", SettingsBackup.FORMAT).put("schema", SettingsBackup.SCHEMA)
                .put("settings", new JSONObject().put(Settings.HIDE_ADVERTISING_ID.key, !saved))
                .put("text", new JSONObject().put(TextSettings.HIDDEN_WORDS.key, phrases(60))).toString();
        page.pendingImport = SettingsBackup.parse(file).toBundle();
        SettingsBackupPreference.onPageResumed(page);
        AlertDialog preview = page.importPreview;
        assertNotNull(preview);
        assertScrollableEndAndButtons(preview);
        preview.getButton(AlertDialog.BUTTON_NEGATIVE).performClick();
        settle();
        assertEquals(saved, Settings.HIDE_ADVERTISING_ID.savedValue());
        assertEquals("", TextSettings.HIDDEN_WORDS.savedValue());
        assertNull(page.pendingImport);
        AlertDialog licenses = click(titled(page.getPreferenceScreen(), L10n.t("Licenses")));
        assertScrollableEndAndButtons(licenses);
        licenses.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
        settle();
        assertFalse(licenses.isShowing());
    }

    @Test
    @Config(sdk = {31, 36})
    public void recoveryMessagesAndCopyLinksWrapAtDoubleSizeInEveryLanguage() throws Exception {
        controller = Robolectric.buildActivity(LightHost.class).setup().visible();
        // L10n reads the application's language, so each pass sets it there. The shipped tables,
        // then the mirrored pseudo-locale for right-to-left.
        String[][] languages = {{"en-rUS", null}, {"de", "de"}, {"es", "es"}, {"in-rID", "in"}, {"pt-rBR", "pt-rbr"},
                {"tr", "tr"}, {"ar-rXB-ldrtl", null}};
        java.util.List<String> overTwoLines = new java.util.ArrayList<>();
        for (String[] pass : languages) {
            String language = pass[0];
            RuntimeEnvironment.setQualifiers("+" + language);
            Locale locale = RuntimeEnvironment.getApplication().getResources().getConfiguration().getLocales().get(0);
            android.content.res.Configuration config = new android.content.res.Configuration(controller.get().getResources().getConfiguration());
            config.setLocale(locale);
            config.setLayoutDirection(locale);
            config.fontScale = 2f;
            android.content.Context context = HushTumblrPreferenceFragment.themed(controller.get().createConfigurationContext(config));
            ScrollView scroll = new ScrollView(context);
            // As a window does, take the direction from the configuration, not Locale.getDefault().
            scroll.setLayoutDirection(config.getLayoutDirection());
            FrameLayout frame = new FrameLayout(context);
            scroll.addView(frame);
            controller.get().setContentView(scroll);
            HushTumblrPreferenceFragment.Row action = new HushTumblrPreferenceFragment.Row(context);
            action.setTitle(L10n.t(context, "Release notes"));
            action.setSummary(L10n.t(context, "Read HushTumblr releases on GitHub. Nothing is downloaded here."));
            String address = HushTumblrPreferenceFragment.RELEASE_NOTES_URL;
            action.feedback.show(L10n.f(context, "No app on this phone can open the link. The address is %1$s.",
                    L10n.isolate(address)), address);
            View row = action.getView(null, frame);
            frame.addView(row);
            layout(scroll);
            assertTextTree(row);
            Button copy = row.findViewWithTag(SettingsFeedback.COPY_TAG);
            assertNotNull(language, copy);
            java.util.Map<String, String> table = pass[1] == null ? null : L10nTablesForTests.of(pass[1]);
            String recovery = "No app on this phone can open the link. The address is %1$s.";
            String label = copy.getText().toString();
            String line = SettingsFeedbackTest.message(action);
            if (language.startsWith("ar")) {
                // The pseudo-locale mirrors English word by word, so the words match once the bidi controls go.
                assertNotEquals("the mirrored pass shows plain English", "Copy link", label);
                assertEquals("Copy link", label.replaceAll("\\p{Cf}", ""));
                assertEquals(recovery.replace("%1$s", address), line.replaceAll("\\p{Cf}", ""));
            } else {
                assertEquals(language + " copy label", table == null ? "Copy link" : table.get("Copy link"), label);
                assertEquals(language + " recovery line",
                        (table == null ? recovery : table.get(recovery)).replace("%1$s", L10n.isolate(address)), line);
            }
            assertEquals(language + " direction", language.startsWith("ar") ? View.LAYOUT_DIRECTION_RTL : View.LAYOUT_DIRECTION_LTR,
                    row.getLayoutDirection());
            scroll.setSmoothScrollingEnabled(false);
            scroll.fullScroll(View.FOCUS_DOWN);
            settle();
            assertVisible(copy, scroll);
            render("retained-recovery-" + language, scroll);
            ShadowToast.reset();
            copy.performClick();
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
                assertNull(language + " toast repeats Android's own copy confirmation", ShadowToast.getTextOfLatestToast());
            } else {
                assertEquals(L10n.t(context, "Link copied"), ShadowToast.getTextOfLatestToast());
            }
            // Every toast that is still the only place its words appear. Android 12 and later cut a
            // text toast at two lines, so each is measured as drawn, never by counting characters.
            // Anything with a next step stays under its row instead.
            String[] toasts = {
                    L10n.t(context, "Link copied"),
                    L10n.t(context, "Words saved"),
                    L10n.quantity(context, 12, "Changed %1$d setting", "Changed %1$d settings", 12),
                    // Save video's, shown over a post's video, where there's no row to hold them.
                    L10n.t(context, "Saving to Downloads"),
                    L10n.t(context, "Video saved to Downloads"),
                    L10n.t(context, "Couldn't save the video"),
            };
            // The width the framework's transient_notification_with_icon leaves the words: a 300dp
            // toast_width, less 16dp padding each side and the 24dp app icon with its 10dp margin.
            int textWidth = Math.round(234 * context.getResources().getDisplayMetrics().density);
            for (String said : toasts) {
                TextView toast = new TextView(context);
                toast.setTextSize(14);
                toast.setText(said);
                layout(toast, textWidth, 1200);
                if (toast.getLineCount() > 2) overTwoLines.add(language + ": " + said);
                else assertWholeText(toast);
            }
        }
        assertTrue("toasts over two rendered lines at double size: " + overTwoLines, overTwoLines.isEmpty());
    }

    @Test
    @Config(sdk = {26, 36}, qualifiers = "ar-rXB-ldrtl-w390dp-h600dp-notnight-xhdpi")
    public void tabFailureAndRetryStayReachableAtDoubleRtlSize() throws Exception {
        RuntimeEnvironment.setFontScale(2f);
        open();
        AlertDialog tabs = click(page.findPreference(HushTumblrPreferenceFragment.TAB_ORDER_ROW));
        try (FailingStore ignored = FailingStore.install(FailingStore.Fault.COMMIT_FALSE)) {
            tabs.getListView().performItemClick(null, 2, 2);
            app.hushtumblr.extension.shared.Utils.awaitBackgroundTasksForTests();
            settle();
        }
        View decor = bounded(tabs);
        TextView failure = decor.findViewWithTag(SettingsFeedback.MESSAGE_TAG);
        assertNotNull(failure);
        assertWholeText(failure);
        assertVisible(failure, decor);
        assertButtons(tabs);
        render("tab-order-retained-failure-rtl", decor);
        tabs.getButton(AlertDialog.BUTTON_NEGATIVE).performClick();
        app.hushtumblr.extension.shared.Utils.awaitBackgroundTasksForTests();
        settle();
        assertFalse(TextSettings.TAB_ORDER.savedValue().isEmpty());
        // The saved move says where the tab went in the same place, whole, with the buttons in reach.
        decor = bounded(tabs);
        TextView moved = decor.findViewWithTag(SettingsFeedback.MESSAGE_TAG);
        assertNotNull("the saved move said nothing under the list", moved);
        // ar-XB mirrors each word and draws the digits its own way, so the line is read through it.
        String said = moved.getText().toString();
        assertTrue(said, said.contains(app.hushtumblr.extension.shared.L10n.t("moved")));
        assertTrue("the tab order waits for a restart: " + said,
                said.endsWith("\n" + app.hushtumblr.extension.shared.L10n.t("Restart Tumblr to apply this change.")));
        assertWholeText(moved);
        assertVisible(moved, decor);
        assertButtons(tabs);
        render("tab-order-moved-rtl", decor);
    }

    @Test public void inlineWordRefusalKeepsTheDraftAndEditingRecoversToASavedList() throws Exception {
        RuntimeEnvironment.setFontScale(2f);
        TextSettings.HIDDEN_WORDS.save("earlier words");
        open();
        Preference words = page.findPreference(HushTumblrPreferenceFragment.HIDDEN_WORDS_ROW);
        String summary = words.getSummary().toString();
        AlertDialog editor = click(words);
        View decor = bounded(editor);
        assertNotNull(visibleText(decor, L10n.t("Changes are saved only when you tap Save.")));
        EditText field = editor.findViewById(android.R.id.edit);
        String draft = "x".repeat(SettingsBackup.MAX_BYTES);
        field.setText(draft);
        editor.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
        bounded(editor);
        String said = L10n.t("This list is too large for a settings backup. Shorten it before saving. Your draft is still here.");
        TextView error = visibleText(decor, said);
        assertNotNull("the refusal exists only in a temporary toast or popup", error);
        assertEquals(View.ACCESSIBILITY_LIVE_REGION_POLITE, error.getAccessibilityLiveRegion());
        assertWholeText(error);
        assertNotNull(field.getError());
        assertEquals(draft, field.getText().toString());
        assertEquals("earlier words", TextSettings.HIDDEN_WORDS.savedValue());
        assertEquals(summary, words.getSummary());
        assertButtons(editor);
        render("editor-inline-refusal", decor);
        field.setText("recovered words");
        settle();
        assertNull("editing kept the obsolete inline refusal", visibleText(decor, said));
        assertNull("editing kept the obsolete field error", field.getError());
        ShadowToast.reset();
        editor.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
        settle();
        assertFalse(editor.isShowing());
        assertEquals("recovered words", TextSettings.HIDDEN_WORDS.savedValue());
        assertTrue(words.getSummary().toString().contains("recovered words"));
        assertEquals(L10n.t("Words saved"), ShadowToast.getTextOfLatestToast());
    }

    @Test public void dismissingTheSettingsWindowSynchronouslyClosesItsGuideAndDisarmsRetainedActions() {
        open();
        AlertDialog old = openGuide();
        Button oldHelp = (Button) visibleText(old.getWindow().getDecorView(), L10n.t("Tumblr password help"));
        assertNotNull(oldHelp);
        View.OnClickListener callback = listener(oldHelp);
        assertNotNull(callback);
        ScrollView oldScroll = old.findViewById(android.R.id.list);
        settings.getDialog().dismiss();
        assertFalse("the guide outlived its parent window", old.isShowing());
        assertNull("the dismissed guide retained an actionable listener", listener(oldHelp));
        callback.onClick(oldHelp);
        oldHelp.performClick();
        oldScroll.onWindowFocusChanged(true);
        settle();
        assertNull(shadowOf(controller.get()).getNextStartedActivity());

        controller.get().getFragmentManager().executePendingTransactions();
        settings = SettingsL10nTest.show(controller.get());
        page = SettingsL10nTest.pageOf(settings);
        AlertDialog current = openGuide();
        callback.onClick(oldHelp);
        assertTrue(current.isShowing());
        assertNull(shadowOf(controller.get()).getNextStartedActivity());
        Button currentHelp = (Button) visibleText(current.getWindow().getDecorView(), L10n.t("Tumblr password help"));
        assertNotNull(currentHelp);
        currentHelp.performClick();
        assertNotNull("the fresh guide stopped working too", shadowOf(controller.get()).getNextStartedActivity());
    }

    @Test
    @Config(qualifiers = "ar-rXB-ldrtl-w390dp-h600dp-notnight-xhdpi")
    public void everySettingsPageAndTheGuideKeepAllTheirTextAndLastRowsReachableAtDoubleRtlSize() throws Exception {
        RuntimeEnvironment.setFontScale(2f);
        ApplicationInfo host = RuntimeEnvironment.getApplication().getApplicationInfo();
        int flags = host.flags;
        host.flags &= ~ApplicationInfo.FLAG_SUPPORTS_RTL;
        try {
            open();
            assertEquals(View.LAYOUT_DIRECTION_RTL, settings.getView().getLayoutDirection());
            reviewPage("overview");
            for (Preference section : new ArrayList<>(page.sections())) {
                assertTrue(page.navigation.open(section));
                reviewPage(section.getTitle().toString().toLowerCase(Locale.ROOT).replaceAll("[^a-z]+", "-"));
            }
            AlertDialog guide = openGuide();
            View decor = bounded(guide);
            assertEquals(View.LAYOUT_DIRECTION_RTL, decor.getLayoutDirection());
            ScrollView body = guide.findViewById(android.R.id.list);
            assertTextTree(body.getChildAt(0));
            render("large-rtl-setup-guide-top", decor);
            assertScrollableEndAndButtons(guide);
            render("large-rtl-setup-guide-bottom", decor);
            guide.getButton(AlertDialog.BUTTON_NEGATIVE).performClick();
            settle();
            assertFalse(guide.isShowing());
            assertEquals("settings changed the host's RTL compatibility flag", flags & ~ApplicationInfo.FLAG_SUPPORTS_RTL, host.flags);
        } finally {
            host.flags = flags;
        }
    }

    /**
     * Android sides a full-width line of text by its first letter. With Tumblr's language set to
     * Arabic, the English header, section headings, search field and dialog labels sat at the left
     * while the rows sat at the right (seen on the API 36 emulator). Short lines follow the
     * screen's side now. A button, a switch and a line centred on purpose keep theirs.
     */
    @Test
    @Config(qualifiers = "ar-rXB-ldrtl-w390dp-h600dp-notnight-xhdpi")
    public void shortLinesFollowTheScreensSideInARightToLeftLanguage() {
        open();
        TextView heading = first(settings.getView(), TextView.class);
        assertNotNull("the header shows no text", heading);
        assertFalse(heading instanceof Button);
        assertEquals("the header's first line", View.TEXT_ALIGNMENT_VIEW_START, heading.getTextAlignment());
        assertEquals("the search field", View.TEXT_ALIGNMENT_VIEW_START, search().getTextAlignment());

        android.content.Context context = controller.get();
        android.widget.LinearLayout group = new android.widget.LinearLayout(context);
        TextView line = new TextView(context);
        TextView centred = new TextView(context);
        centred.setGravity(android.view.Gravity.CENTER_HORIZONTAL);
        TextView ended = new TextView(context);
        ended.setGravity(android.view.Gravity.END);
        Button button = new Button(context);
        android.widget.Switch toggle = new android.widget.Switch(context);
        EditText field = new EditText(context);
        android.widget.LinearLayout inner = new android.widget.LinearLayout(context);
        TextView nested = new TextView(context);
        inner.addView(nested);
        for (View child : new View[]{line, centred, ended, button, toggle, field, inner}) group.addView(child);
        int untouched = centred.getTextAlignment();

        ScreenColors.startSide(group);

        assertEquals(View.TEXT_ALIGNMENT_VIEW_START, line.getTextAlignment());
        assertEquals(View.TEXT_ALIGNMENT_VIEW_START, field.getTextAlignment());
        assertEquals("a line inside a nested group", View.TEXT_ALIGNMENT_VIEW_START, nested.getTextAlignment());
        assertEquals("a centred line moved", untouched, centred.getTextAlignment());
        assertEquals("a line sided on purpose moved", untouched, ended.getTextAlignment());
        assertEquals("a button's label moved", untouched, button.getTextAlignment());
        assertEquals("a switch's label moved", untouched, toggle.getTextAlignment());
    }

    private void reviewPage(String name) throws Exception {
        layout(settings.getView());
        ImageButton back = SettingsL10nTest.backOf(settings);
        View bar = (View) back.getParent();
        assertEquals(View.LAYOUT_DIRECTION_RTL, back.getLayoutDirection());
        assertTrue("Back did not reach the RTL edge on " + name, back.getLeft() > bar.getWidth() / 2);
        ListView list = page.getView().findViewById(android.R.id.list);
        assertEquals(View.LAYOUT_DIRECTION_RTL, list.getLayoutDirection());
        assertTrue(name + " has no rows to review", list.getCount() > 0);
        list.setSelectionFromTop(0, 0);
        layout(settings.getView());
        boolean scrolls = list.canScrollVertically(1);
        render("large-rtl-" + name + "-top", settings.getView());
        for (int i = 0; i < list.getCount(); i++) {
            FrameLayout measurement = new FrameLayout(list.getContext());
            measurement.setLayoutDirection(View.LAYOUT_DIRECTION_LOCALE);
            View row = list.getAdapter().getView(i, null, list);
            measurement.addView(row, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT));
            measurement.measure(View.MeasureSpec.makeMeasureSpec(list.getWidth(), View.MeasureSpec.EXACTLY),
                    View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED));
            measurement.layout(0, 0, measurement.getMeasuredWidth(), measurement.getMeasuredHeight());
            assertTextTree(row);
        }
        list.setSelectionFromTop(list.getCount() - 1, 0);
        layout(settings.getView());
        for (int tries = 0; list.canScrollVertically(1) && tries < 20; tries++) {
            list.scrollListBy(Math.max(1, list.getHeight() / 2));
            settle();
        }
        assertFalse(name + " never reached its end", list.canScrollVertically(1));
        assertEquals(name + " omitted its final row", list.getCount() - 1, list.getLastVisiblePosition());
        View last = list.getChildAt(list.getChildCount() - 1);
        assertNotNull(last);
        assertTrue(name + " cuts off the bottom of its final row", last.getBottom() <= list.getHeight() - list.getPaddingBottom());
        if (scrolls) render("large-rtl-" + name + "-bottom", settings.getView());
    }

    private void assertTextTree(View view) {
        if (view.getVisibility() != View.VISIBLE) return;
        if (view instanceof TextView && ((TextView) view).length() > 0) assertWholeText((TextView) view);
        if (view instanceof ViewGroup) for (int i = 0; i < ((ViewGroup) view).getChildCount(); i++) {
            assertTextTree(((ViewGroup) view).getChildAt(i));
        }
    }

    private void open() {
        controller = Robolectric.buildActivity(LightHost.class).setup().visible();
        settings = SettingsL10nTest.show(controller.get());
        page = SettingsL10nTest.pageOf(settings);
        layout(settings.getView());
    }

    /**
     * The home page's row titled [title], brought into view first. Home is taller than the 600dp
     * test screen since Quick setups gained its press-and-hold line, and a list lays out only the
     * rows on screen, so a row low on it is looked up among the list's items, scrolled to and
     * then found among the views shown.
     */
    private TextView homeRowShown(String title) {
        ListView list = page.getView().findViewById(android.R.id.list);
        int position = -1;
        for (int i = 0; i < list.getCount(); i++) {
            Object item = list.getItemAtPosition(i);
            // A heading of the same name is a search result's, not home's row.
            if (item instanceof Preference && !(item instanceof PreferenceGroup)
                    && title.contentEquals(((Preference) item).getTitle())) position = i;
        }
        if (position < 0) return null;
        list.setSelection(position);
        layout(settings.getView());
        return visibleText(settings.getView(), title);
    }

    private EditText search() {
        return (EditText) described(settings.getView(), L10n.t("Search settings"));
    }

    private ImageButton clear() {
        return (ImageButton) described(settings.getView(), L10n.t("Clear search"));
    }

    private AlertDialog openGuide() {
        page.navigation.navigate("About");
        ListView list = page.getView().findViewById(android.R.id.list);
        SetupGuidancePreference row = (SetupGuidancePreference) page.findPreference(SetupGuidancePreference.KEY);
        assertNotNull(row);
        int position = -1;
        for (int i = 0; i < list.getCount(); i++) if (list.getItemAtPosition(i) == row) position = i;
        assertTrue(position >= 0);
        list.setSelection(position);
        layout(settings.getView());
        assertTrue(list.performItemClick(list.getChildAt(position - list.getFirstVisiblePosition()),
                position, list.getAdapter().getItemId(position)));
        settle();
        AlertDialog dialog = (AlertDialog) row.getDialog();
        assertNotNull(dialog);
        assertTrue(dialog.isShowing());
        return dialog;
    }

    private static View.OnClickListener listener(View view) {
        Object info = ReflectionHelpers.callInstanceMethod(view, "getListenerInfo");
        return ReflectionHelpers.getField(info, "mOnClickListener");
    }

    private void focusSearch(String query) {
        assertTrue(search().requestFocus());
        search().setText(query);
        controller.get().getSystemService(InputMethodManager.class).showSoftInput(search(), 0);
        settle();
        layout(settings.getView());
        assertTrue(search().hasFocus());
    }

    private static AlertDialog click(Preference row) {
        assertNotNull(row);
        assertTrue(row.getOnPreferenceClickListener().onPreferenceClick(row));
        settle();
        AlertDialog dialog = ShadowAlertDialog.getLatestAlertDialog();
        assertNotNull(dialog);
        assertTrue(dialog.isShowing());
        return dialog;
    }

    private static void layout(View view) {
        layout(view, 780, 1200);
    }

    private static void layout(View view, int width, int height) {
        view.measure(View.MeasureSpec.makeMeasureSpec(width, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(height, View.MeasureSpec.AT_MOST));
        view.layout(0, 0, view.getMeasuredWidth(), view.getMeasuredHeight());
        settle();
    }

    private View bounded(AlertDialog dialog) {
        return bounded(dialog, 1200);
    }

    private View bounded(AlertDialog dialog, int height) {
        View decor = dialog.getWindow().getDecorView();
        int width = dialog.getWindow().getAttributes().width;
        assertTrue("the owned dialog has no bounded window width", width > 0);
        layout(decor, width, height);
        captureGeometry("bounded-window", decor);
        assertEquals("measurement changed the owned window's width", width, decor.getWidth());
        assertTrue("dialog exceeds the available height", decor.getHeight() <= height);
        return decor;
    }

    private static Rect visibleIn(View view, View root) {
        Rect visible = new Rect();
        Rect origin = new Rect();
        assertTrue("gesture target is not visible", view.getGlobalVisibleRect(visible));
        assertTrue("gesture root is not visible", root.getGlobalVisibleRect(origin));
        // A scrolling view's local visible rectangle includes its own content scroll offset.
        // Global rectangles share the decor's viewport coordinates instead.
        visible.offset(-origin.left, -origin.top);
        return visible;
    }

    private static void swipe(View root, float x, float from, float to, int finish) {
        long down = SystemClock.uptimeMillis();
        touch(root, down, down, MotionEvent.ACTION_DOWN, x, from);
        for (int step = 1; step <= 6; step++) {
            touch(root, down, down + step * 16, MotionEvent.ACTION_MOVE, x, from + (to - from) * step / 6);
        }
        touch(root, down, down + 112, finish, x, to);
        settle();
    }

    private static void touch(View root, long down, long now, int action, float x, float y) {
        MotionEvent event = MotionEvent.obtain(down, now, action, x, y, 0);
        event.setSource(InputDevice.SOURCE_TOUCHSCREEN);
        try {
            boolean handled = root.dispatchTouchEvent(event);
            if (action == MotionEvent.ACTION_DOWN) assertTrue("the dialog rejected touch down", handled);
        }
        finally { event.recycle(); }
    }

    private void assertButtons(AlertDialog dialog) {
        View decor = dialog.getWindow().getDecorView();
        captureGeometry("buttons", decor);
        int count = 0;
        for (int which : new int[]{AlertDialog.BUTTON_POSITIVE, AlertDialog.BUTTON_NEGATIVE, AlertDialog.BUTTON_NEUTRAL}) {
            Button button = dialog.getButton(which);
            if (button == null || button.getVisibility() != View.VISIBLE) continue;
            assertVisible(button, decor);
            assertWholeText(button);
            assertTrue(button.getText() + " is below 48dp", button.getHeight()
                    >= Math.round(48 * button.getResources().getDisplayMetrics().density));
            count++;
        }
        assertTrue("no usable dialog buttons", count > 0);
    }

    private void assertVisible(View view, View decor) {
        Rect visible = new Rect();
        boolean shown = view.getGlobalVisibleRect(visible);
        if (!shown || view.getWidth() != visible.width() || view.getHeight() != visible.height()) {
            captureGeometry("clipped-" + view.getClass().getSimpleName(), decor);
        }
        assertTrue("control is not visible", shown);
        assertEquals("control is horizontally clipped", view.getWidth(), visible.width());
        assertEquals("control is vertically clipped", view.getHeight(), visible.height());
        int[] at = new int[2];
        int[] window = new int[2];
        view.getLocationInWindow(at);
        decor.getLocationInWindow(window);
        assertTrue("control extends past the window", at[0] >= window[0] && at[1] >= window[1]
                && at[0] + view.getWidth() <= window[0] + decor.getWidth()
                && at[1] + view.getHeight() <= window[1] + decor.getHeight());
    }

    private void assertWholeText(TextView view) {
        Layout text = view.getLayout();
        assertNotNull("no text layout for " + view.getText(), text);
        for (int line = 0; line < text.getLineCount(); line++) assertEquals("ellipsized " + view.getText(), 0, text.getEllipsisCount(line));
        assertEquals(view.getText().length(), text.getLineEnd(text.getLineCount() - 1));
        assertTrue("text exceeds its control's height: " + view.getText(), text.getHeight()
                <= view.getHeight() - view.getCompoundPaddingTop() - view.getCompoundPaddingBottom());
    }

    private void assertScrollableEndAndButtons(AlertDialog dialog) {
        View decor = bounded(dialog);
        assertButtons(dialog);
        ScrollView scroll = first(decor, ScrollView.class);
        assertNotNull("long dialog has no scrolling body", scroll);
        assertTrue("the long-content fixture did not exercise scrolling", scroll.canScrollVertically(1));
        scroll.setSmoothScrollingEnabled(false);
        scroll.fullScroll(View.FOCUS_DOWN);
        settle();
        assertTrue(scroll.getScrollY() > 0);
        assertFalse("the end of the dialog body cannot be reached", scroll.canScrollVertically(1));
        assertButtons(dialog);
    }

    private static void assertActionStates(View action) {
        Drawable background = action.getBackground();
        assertNotNull("action has no surface", background);
        int[] original = background.getState();
        int[] normal = new int[]{android.R.attr.state_enabled};
        try {
            background.setState(normal);
            int[] idle = pixels(background);
            for (int state : new int[]{android.R.attr.state_focused, android.R.attr.state_selected,
                    android.R.attr.state_hovered, -android.R.attr.state_enabled}) {
                background.setState(state < 0 ? new int[0] : new int[]{android.R.attr.state_enabled, state});
                assertFalse("action state has no visible surface change: " + state, Arrays.equals(idle, pixels(background)));
            }
        } finally {
            background.setState(original);
        }
    }

    private static int[] pixels(Drawable drawable) {
        Bitmap image = Bitmap.createBitmap(96, 96, Bitmap.Config.ARGB_8888);
        Rect bounds = drawable.copyBounds();
        try {
            drawable.setBounds(0, 0, 96, 96);
            drawable.jumpToCurrentState();
            drawable.draw(new Canvas(image));
            int[] pixels = new int[96 * 96];
            image.getPixels(pixels, 0, 96, 0, 0, 96, 96);
            return pixels;
        } finally {
            drawable.setBounds(bounds);
            image.recycle();
        }
    }

    private static void assertAccent(Drawable drawable) {
        assertNotNull("the themed editor lost a cursor or handle", drawable);
        int strongest = strongest(pixels(drawable));
        assertTrue("cursor or handle is invisible", Color.alpha(strongest) > 0);
        // Bitmap texture filtering and shape filling can round channels differently in Skia.
        Drawable control;
        if (drawable instanceof BitmapDrawable) {
            control = new BitmapDrawable(RuntimeEnvironment.getApplication().getResources(),
                    ((BitmapDrawable) drawable).getBitmap());
        } else {
            GradientDrawable shape = new GradientDrawable();
            shape.setColor(Color.WHITE);
            control = shape;
        }
        control.setTint(ScreenColors.DEFAULT.accent);
        int expected = strongest(pixels(control));
        assertEquals("cursor/handle tint differs from an accent-tinted native control (alpha "
                + Color.alpha(strongest) + ")", expected & 0xFFFFFF, strongest & 0xFFFFFF);
    }

    private static int strongest(int[] pixels) {
        int strongest = 0;
        for (int color : pixels) if (Color.alpha(color) > Color.alpha(strongest)) strongest = color;
        return strongest;
    }

    /** Keep the exact failing layout, without measuring or settling it a second time. */
    private void captureGeometry(String state, View decor) {
        File folder = new File("build/reports/settings-design/geometry");
        assertTrue(folder.isDirectory() || folder.mkdirs());
        String stem = testName.getMethodName().replaceAll("[^a-zA-Z0-9-]+", "-") + "-"
                + (++geometryCapture) + "-" + state + "-api" + Build.VERSION.SDK_INT;
        StringBuilder geometry = new StringBuilder();
        appendGeometry(decor, "0", geometry);
        try (FileOutputStream output = new FileOutputStream(new File(folder, stem + ".txt"))) {
            output.write(geometry.toString().getBytes(StandardCharsets.UTF_8));
        } catch (IOException failure) {
            throw new AssertionError("could not preserve layout geometry", failure);
        }
        if (decor.getWidth() <= 0 || decor.getHeight() <= 0) return;
        Bitmap image = Bitmap.createBitmap(decor.getWidth(), decor.getHeight(), Bitmap.Config.ARGB_8888);
        try (FileOutputStream output = new FileOutputStream(new File(folder, stem + ".png"))) {
            decor.draw(new Canvas(image));
            assertTrue(image.compress(Bitmap.CompressFormat.PNG, 100, output));
        } catch (IOException failure) {
            throw new AssertionError("could not preserve layout image", failure);
        } finally { image.recycle(); }
    }

    private static void appendGeometry(View view, String path, StringBuilder geometry) {
        Rect visible = new Rect();
        boolean shown = view.getGlobalVisibleRect(visible);
        geometry.append(path).append(' ').append(view.getClass().getSimpleName())
                .append(" id=").append(Integer.toHexString(view.getId()))
                .append(" bounds=").append(view.getLeft()).append(',').append(view.getTop()).append(',')
                .append(view.getRight()).append(',').append(view.getBottom())
                .append(" visible=").append(shown ? visible.toShortString() : "none")
                .append(" scrollY=").append(view.getScrollY()).append(" focus=").append(view.hasFocus())
                .append(" enabled=").append(view.isEnabled());
        if (view instanceof TextView) {
            TextView text = (TextView) view;
            String label = text.getText().toString().replace('\n', ' ');
            geometry.append(" text=").append(label.substring(0, Math.min(96, label.length())))
                    .append(" length=").append(label.length());
            if (text.getLayout() != null) geometry.append(" lines=").append(text.getLayout().getLineCount())
                    .append(" textHeight=").append(text.getLayout().getHeight());
        }
        geometry.append('\n');
        if (view instanceof ViewGroup) for (int i = 0; i < ((ViewGroup) view).getChildCount(); i++) {
            appendGeometry(((ViewGroup) view).getChildAt(i), path + "." + i, geometry);
        }
    }

    private static int themeColor(Resources.Theme theme, int attribute) {
        TypedValue value = new TypedValue();
        assertTrue(theme.resolveAttribute(attribute, value, true));
        return value.data;
    }

    private static View described(View view, String description) {
        if (description.contentEquals(String.valueOf(view.getContentDescription()))) return view;
        if (view instanceof ViewGroup) for (int i = 0; i < ((ViewGroup) view).getChildCount(); i++) {
            View found = described(((ViewGroup) view).getChildAt(i), description);
            if (found != null) return found;
        }
        return null;
    }

    private static TextView visibleText(View view, String text) {
        if (!view.isShown()) return null;
        if (view instanceof TextView && text.contentEquals(((TextView) view).getText())) return (TextView) view;
        if (view instanceof ViewGroup) for (int i = 0; i < ((ViewGroup) view).getChildCount(); i++) {
            TextView found = visibleText(((ViewGroup) view).getChildAt(i), text);
            if (found != null) return found;
        }
        return null;
    }

    private static <T extends View> T first(View view, Class<T> type) {
        if (!view.isShown()) return null;
        if (type.isInstance(view)) return type.cast(view);
        if (view instanceof ViewGroup) for (int i = 0; i < ((ViewGroup) view).getChildCount(); i++) {
            T found = first(((ViewGroup) view).getChildAt(i), type);
            if (found != null) return found;
        }
        return null;
    }

    private static Preference titled(PreferenceGroup group, String title) {
        for (int i = 0; i < group.getPreferenceCount(); i++) {
            Preference row = group.getPreference(i);
            if (row.getTitle() != null && title.contentEquals(row.getTitle())) return row;
            if (row instanceof PreferenceGroup) {
                Preference found = titled((PreferenceGroup) row, title);
                if (found != null) return found;
            }
        }
        return null;
    }

    private static String phrases(int count) {
        StringBuilder words = new StringBuilder();
        for (int i = 0; i < count; i++) {
            if (i > 0) words.append('\n');
            words.append("private test phrase ").append(i);
        }
        return words.toString();
    }

    private static void settle() {
        ShadowLooper.idleMainLooper();
    }

    private static void render(String name, View view) throws Exception {
        assertTrue("render target was not measured", view.getWidth() > 0 && view.getHeight() > 0);
        Bitmap image = Bitmap.createBitmap(view.getWidth(), view.getHeight(), Bitmap.Config.ARGB_8888);
        File folder = new File("build/reports/settings-design");
        assertTrue(folder.isDirectory() || folder.mkdirs());
        try (FileOutputStream output = new FileOutputStream(new File(folder,
                "polish-" + name + "-api" + Build.VERSION.SDK_INT + ".png"))) {
            view.draw(new Canvas(image));
            assertTrue(image.compress(Bitmap.CompressFormat.PNG, 100, output));
        } finally { image.recycle(); }
    }
}
