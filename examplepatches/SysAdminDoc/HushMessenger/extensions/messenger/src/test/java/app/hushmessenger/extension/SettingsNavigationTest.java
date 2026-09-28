package app.hushmessenger.extension;

import android.os.Bundle;
import android.os.Looper;
import android.view.View;
import android.widget.EditText;
import android.widget.Switch;
import android.widget.TextView;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 35)
public class SettingsNavigationTest {
    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
    }

    @Test public void categoriesCombineWithSearchAndClearFiltersRecovers() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            TextView count = root.findViewWithTag("search_status");
            root.findViewWithTag("category_chats").performClick();
            assertEquals("7 of 20 installed controls", count.getText().toString());
            assertEquals(View.GONE, ((View) root.findViewWithTag("people").getParent()).getVisibility());
            ((EditText) root.findViewWithTag("find_control")).setText("People You");
            assertEquals(View.VISIBLE, root.findViewWithTag("empty_state").getVisibility());
            root.findViewWithTag("clear_filters").performClick();
            assertEquals("20 of 20 installed controls", count.getText().toString());
            assertEquals(View.GONE, root.findViewWithTag("empty_state").getVisibility());
            assertTrue(root.findViewWithTag("category_all").isSelected());
            root.findViewWithTag("category_more").performClick();
            assertEquals("6 of 20 installed controls", count.getText().toString());
            assertEquals(View.VISIBLE, ((View) root.findViewWithTag("facebook").getParent()).getVisibility());
        }
    }

    @Test public void pageAndFilterSurviveThemeRecreationWithoutChangingControls() {
        Bundle state = new Bundle();
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            ((Switch) root.findViewWithTag("people")).performClick();
            root.findViewWithTag("category_inbox").performClick();
            ((EditText) root.findViewWithTag("find_control")).setText("People You");
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
            assertEquals("People You", ((EditText) root.findViewWithTag("find_control")).getText().toString());
            assertTrue(root.findViewWithTag("category_inbox").isSelected());
            assertEquals("1 of 20 installed controls", ((TextView) root.findViewWithTag("search_status")).getText().toString());
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
            assertTrue(root.findViewWithTag("ads").getContentDescription().toString().contains("Experimental"));
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
