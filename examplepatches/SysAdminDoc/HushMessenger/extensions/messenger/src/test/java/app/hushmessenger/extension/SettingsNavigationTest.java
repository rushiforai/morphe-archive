package app.hushmessenger.extension;

import android.os.Bundle;
import android.os.Looper;
import android.view.View;
import android.widget.EditText;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowToast;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 35)
public class SettingsNavigationTest {
    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        OpenSections.all();
    }

    /** HushFacebook's accordion: closed on a fresh install, one tap opens a section, and it stays open next time. */
    @Test public void sectionsStartClosedOpenOnTapAndStayOpen() {
        OpenSections.only();
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            assertFalse(root.findViewWithTag("people").isShown());
            View header = root.findViewWithTag("section_inbox");
            assertTrue(header.isShown());
            android.view.accessibility.AccessibilityNodeInfo info = header.createAccessibilityNodeInfo();
            assertTrue(info.isHeading());
            assertEquals(android.widget.Button.class.getName(), info.getClassName().toString());
            assertTrue(info.getActionList().contains(android.view.accessibility.AccessibilityNodeInfo.AccessibilityAction.ACTION_EXPAND));
            assertFalse(info.getActionList().contains(android.view.accessibility.AccessibilityNodeInfo.AccessibilityAction.ACTION_COLLAPSE));
            // TalkBack speaks the state from these actions, so a state description of our own would say it twice.
            assertNull(info.getStateDescription());
            header.performClick();
            assertTrue(root.findViewWithTag("people").isShown());
            info = header.createAccessibilityNodeInfo();
            assertTrue(info.getActionList().contains(android.view.accessibility.AccessibilityNodeInfo.AccessibilityAction.ACTION_COLLAPSE));
            assertFalse(info.getActionList().contains(android.view.accessibility.AccessibilityNodeInfo.AccessibilityAction.ACTION_EXPAND));
            assertNull(info.getStateDescription());
            // Opening a section is a view choice, not a setting: nothing reaches the saved choices.
            assertEquals(java.util.Map.of(), Settings.preferences.getAll());
            // A screen reader's collapse action closes it again.
            assertTrue(header.performAccessibilityAction(android.view.accessibility.AccessibilityNodeInfo.ACTION_COLLAPSE, null));
            assertFalse(root.findViewWithTag("people").isShown());
            header.performClick();
        }
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            assertTrue(root.findViewWithTag("people").isShown());
            assertFalse(root.findViewWithTag("typing").isShown());
            root.findViewWithTag("tab_app").performClick();
            assertFalse(root.findViewWithTag("light").isShown());
            root.findViewWithTag("section_appearance").performClick();
            assertTrue(root.findViewWithTag("light").isShown());
            // Restart stays outside the sections, one tap away.
            assertTrue(root.findViewWithTag("restart_messenger").isShown());
        }
    }

    /** A search shows every match whatever is closed, and clearing it puts the closed sections back. */
    @Test public void searchOpensMatchingSectionsAndClearFiltersRecovers() {
        OpenSections.only();
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            TextView count = root.findViewWithTag("search_status");
            EditText search = root.findViewWithTag("find_control");
            search.setText("People You May");
            assertTrue(root.findViewWithTag("people").isShown());
            assertEquals(ExpectedTotals.shown(1), count.getText().toString());
            // A section closed during the search stays closed until the search changes.
            root.findViewWithTag("section_inbox").performClick();
            assertFalse(root.findViewWithTag("people").isShown());
            search.setText("People You May Know");
            assertTrue(root.findViewWithTag("people").isShown());
            search.setText("no matching control");
            assertEquals(View.VISIBLE, root.findViewWithTag("empty_state").getVisibility());
            root.findViewWithTag("clear_filters").performClick();
            assertEquals(ExpectedTotals.shown(ExpectedTotals.CONTROLS), count.getText().toString());
            assertEquals(View.GONE, root.findViewWithTag("empty_state").getVisibility());
            assertFalse(root.findViewWithTag("people").isShown());
            assertTrue(root.findViewWithTag("section_inbox").isShown());
        }
    }

    /** A link or a release walk can ask for a section, so a row inside it is one tap away. */
    @Test public void theOpenExtraOpensItsSection() {
        OpenSections.only();
        android.content.Intent intent = new android.content.Intent(RuntimeEnvironment.getApplication(), SettingsActivity.class)
            .putExtra(SettingsActivity.OPEN_EXTRA, "inbox");
        try (var screen = Robolectric.buildActivity(SettingsActivity.class, intent).setup()) {
            View root = screen.get().getWindow().getDecorView();
            assertTrue(root.findViewWithTag("people").isShown());
            assertFalse(root.findViewWithTag("typing").isShown());
        }
    }

    @Test public void photoAndVideoControlsHaveTheirOwnSection() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            android.widget.LinearLayout group = root.findViewWithTag("photos_videos");
            android.widget.LinearLayout heading = (android.widget.LinearLayout) group.getChildAt(0);
            assertEquals("PHOTOS AND VIDEOS", ((TextView) heading.getChildAt(0)).getText().toString());
            for (String key : new String[] {"original_photo", "original_video", "xhe_audio", "recent_media", "save_voice", "share_story", "system_camera", "external_gallery", "gallery_to_chat"})
                assertTrue(key + " should sit in Photos and videos", inside(root.findViewWithTag(key), group));
            assertFalse(inside(root.findViewWithTag("typing"), group));
            assertEquals(View.VISIBLE, group.getVisibility());
            assertEquals("9",((TextView) heading.getChildAt(1)).getText().toString());
        }
    }

    /** The headings are English on every phone, so a Turkish phone's own capitals (a dotted İ) never reach them. */
    @Test @org.robolectric.annotation.Config(qualifiers = "tr-rTR") public void headingsUseEnglishCapitalsOnATurkishPhone() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            android.widget.LinearLayout group = screen.get().getWindow().getDecorView().findViewWithTag("links_bubbles");
            android.widget.LinearLayout heading = (android.widget.LinearLayout) group.getChildAt(0);
            assertEquals("LINKS AND BUBBLES", ((TextView) heading.getChildAt(0)).getText().toString());
        }
    }

    private static boolean inside(View view, View group) {
        for (android.view.ViewParent parent = view.getParent(); parent != null; parent = parent.getParent())
            if (parent == group) return true;
        return false;
    }

    @Test public void selectedTabIsMessengerBlueInBothThemesAndTheWordmarkStaysOnOneLine() {
        for (boolean light : new boolean[] {false, true}) {
            Settings.preferences.edit().putBoolean("light", light).commit();
            try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
                View root = screen.get().getWindow().getDecorView();
                SettingsUi ui = new SettingsUi(screen.get(), light);
                // Messenger's own button blue, with white text, in both themes.
                assertEquals(0xff0866ff, ui.accentFill);
                assertEquals(ui.accentFill, ui.selected);
                assertEquals(0xffffffff, ((TextView) root.findViewWithTag("tab_controls")).getCurrentTextColor());
                assertEquals(ui.muted, ((TextView) root.findViewWithTag("tab_app")).getCurrentTextColor());
                // The banner and its "Make Messenger yours" line are gone: the toolbar is the name and the tabs.
                assertFalse(SettingsText.ENGLISH.containsKey("tagline"));
                TextView wordmark = root.findViewWithTag("wordmark");
                assertEquals(1, wordmark.getMaxLines());
                assertEquals(TextView.AUTO_SIZE_TEXT_TYPE_UNIFORM, wordmark.getAutoSizeTextType());
            }
        }
    }

    @Test public void clearingTheQueryReturnsFocusToSearch() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            EditText search = root.findViewWithTag("find_control");
            View clear = root.findViewWithTag("clear_query");
            assertEquals(View.GONE, clear.getVisibility());
            search.setText("no matching control");
            assertEquals(View.VISIBLE, clear.getVisibility());
            clear.performClick();
            assertEquals("", search.getText().toString());
            assertEquals(ExpectedTotals.shown(ExpectedTotals.CONTROLS), ((TextView) root.findViewWithTag("search_status")).getText().toString());
            assertTrue(search.hasFocus());
            assertEquals(View.GONE, clear.getVisibility());
        }
    }

    @Test public void theRecreatedPageReplacesTheThemeSwitchToast() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            ((Switch) screen.get().getWindow().getDecorView().findViewWithTag("light")).performClick();
            Toast themeToast = ShadowToast.getLatestToast();
            assertEquals("Light theme is on", ShadowToast.getTextOfLatestToast());
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            ((Switch) screen.get().getWindow().getDecorView().findViewWithTag("people")).performClick();
            assertTrue(Shadows.shadowOf(themeToast).isCancelled());
            assertEquals("Hide People You May Know is on", ShadowToast.getTextOfLatestToast());
        }
    }

    @Test public void pageAndFilterSurviveThemeRecreationWithoutChangingControls() {
        Bundle state = new Bundle();
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            ((Switch) root.findViewWithTag("people")).performClick();
            // Each word on its own: "People You" alone also finds Hide growth prompts ("people", "your").
            ((EditText) root.findViewWithTag("find_control")).setText("People You May");
            root.findViewWithTag("tab_app").performClick();
            assertEquals(View.GONE, root.findViewWithTag("controls_page").getVisibility());
            assertEquals(View.VISIBLE, root.findViewWithTag("app_page").getVisibility());
            ((Switch) root.findViewWithTag("light")).performClick();
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            assertTrue(Settings.preferences.getBoolean("light", false));
            assertEquals(View.VISIBLE, screen.get().getWindow().getDecorView().findViewWithTag("app_page").getVisibility());
            screen.get().onSaveInstanceState(state);
        }
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).create(state).start().resume().visible()) {
            View root = screen.get().getWindow().getDecorView();
            assertEquals(View.VISIBLE, root.findViewWithTag("app_page").getVisibility());
            root.findViewWithTag("tab_controls").performClick();
            assertEquals("People You May", ((EditText) root.findViewWithTag("find_control")).getText().toString());
            assertEquals(ExpectedTotals.shown(1), ((TextView) root.findViewWithTag("search_status")).getText().toString());
            assertTrue(((Switch) root.findViewWithTag("people")).isChecked());
            assertTrue(Settings.enabled("people"));
        }
    }

    @Test public void enabledSummaryTracksChoicesAndPauseWithoutDiscardingThem() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            TextView count = root.findViewWithTag("enabled_count");
            assertEquals("0 controls enabled", count.getText().toString());
            ((Switch) root.findViewWithTag("people")).performClick();
            assertEquals("1 control enabled", count.getText().toString());
            ((Switch) root.findViewWithTag("stories")).performClick();
            assertEquals("2 controls enabled", count.getText().toString());
            ((Switch) root.findViewWithTag("paused")).performClick();
            assertEquals("Changes paused", count.getText().toString());
            assertFalse(Settings.hideStories());
            ((Switch) root.findViewWithTag("paused")).performClick();
            assertEquals("2 controls enabled", count.getText().toString());
            assertTrue(Settings.hideStories());
        }
    }

    @Test public void everySwitchHasAnAccessibleNameAndUsableTapTarget() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            float density = screen.get().getResources().getDisplayMetrics().density;
            for (String[] spec : SettingsActivity.CONTROLS) {
                Switch control = root.findViewWithTag(spec[0]);
                assertTrue(control.getContentDescription().toString().startsWith(spec[1]));
                assertTrue(control.getMinimumHeight() >= 48 * density);
                assertTrue(control.getMinimumWidth() >= 48 * density);
                assertTrue(((View) control.getParent()).getPaddingTop() > 0);
            }
            for (String key : SettingsActivity.EXPERIMENTAL) {
                assertTrue(key, root.findViewWithTag(key).getContentDescription().toString().contains("Experimental"));
            }
        }
    }

    @Test public void largeTextOnANarrowScreenKeepsSwitchesWithinTheirRows() {
        RuntimeEnvironment.setQualifiers("w320dp-h800dp-mdpi");
        RuntimeEnvironment.setFontScale(2f);
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            root.measure(View.MeasureSpec.makeMeasureSpec(320, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(800, View.MeasureSpec.EXACTLY));
            root.layout(0, 0, 320, 800);
            for (String[] spec : SettingsActivity.CONTROLS) {
                Switch control = root.findViewWithTag(spec[0]);
                View row = (View) control.getParent();
                assertTrue(row.getWidth() > 0);
                assertTrue(control.getLeft() >= 0);
                assertTrue(control.getRight() <= row.getWidth());
                assertTrue(control.getHeight() >= 48);
            }
            assertTrue(root.findViewWithTag("open_messenger").getWidth() > 0);
            root.findViewWithTag("tab_app").performClick();
            assertEquals(View.VISIBLE, root.findViewWithTag("app_page").getVisibility());
        }
    }
}
