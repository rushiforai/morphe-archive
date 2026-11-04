package app.hushmessenger.extension;

import android.content.SharedPreferences;
import android.graphics.drawable.LayerDrawable;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.TextView;
import java.util.Arrays;
import java.util.LinkedHashSet;
import java.util.Set;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

/** HushGram's list switch: every Controls section open on one page, or each folded under its heading. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 36, qualifiers = "w411dp-h914dp-mdpi")
public class SettingsListToggleTest {
    private static final int WIDTH = 411, HEIGHT = 914;
    private static final String AS_LIST = "Show all settings as a list", BY_CATEGORY = "Show settings by category";

    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        // Every section starts folded, which is the category view.
        OpenSections.only();
    }

    @Test public void theSwitchIsAFullBleedOverviewRowBetweenTheSearchAndThePauseCard() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = lay(screen.get().getWindow().getDecorView());
            ViewGroup toggle = root.findViewWithTag("view_toggle");
            ViewGroup content = (ViewGroup) toggle.getParent();
            View searchRow = (View) root.findViewWithTag("find_control").getParent();
            View setup = (View) root.findViewWithTag("enabled_count").getParent();
            assertSame("On the Controls page with the search", searchRow.getParent(), content);
            assertTrue(content.indexOfChild(toggle) > content.indexOfChild(searchRow));
            assertTrue(content.indexOfChild(toggle) < content.indexOfChild(setup));
            assertEquals("Edge to edge, like the other overview rows", 0, left(toggle));
            assertEquals(WIDTH, toggle.getWidth());
            assertTrue(toggle.getHeight() >= 48);
            assertEquals(48, toggle.getMinimumHeight());
            assertEquals("Its icon and no chevron: the tap acts here and opens nothing", 2,
                ((LayerDrawable) toggle.getBackground()).getNumberOfLayers());
            TextView title = (TextView) toggle.getChildAt(0);
            assertEquals(15f, title.getTextSize(), 0.01f);
            assertEquals(AS_LIST, title.getText().toString());
            assertEquals(AS_LIST, toggle.getContentDescription().toString());
            assertEquals(android.widget.Button.class.getName(), toggle.createAccessibilityNodeInfo().getClassName().toString());
        }
    }

    @Test public void aTapOpensEveryControlsSectionAndASecondFoldsThemAll() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            ViewGroup toggle = root.findViewWithTag("view_toggle");
            Set<String> controls = controlSections();
            for (String id : controls) assertFalse(id, shown(root, id));
            toggle.performClick();
            for (String id : controls) assertTrue(id, shown(root, id));
            assertEquals(BY_CATEGORY, label(toggle));
            assertEquals(BY_CATEGORY, toggle.getContentDescription().toString());
            Set<String> saved = saved();
            assertEquals("Saved, so the list view comes back next time", controls, saved);
            for (String id : OpenSections.APP) assertFalse("The App tab's own sections stay as they were: " + id, saved.contains(id));
            toggle.performClick();
            for (String id : controls) assertFalse(id, shown(root, id));
            assertEquals(AS_LIST, label(toggle));
            assertTrue(saved().isEmpty());
        }
    }

    @Test public void foldingOneSectionByHandTurnsTheListViewBackIntoCategories() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            ViewGroup toggle = root.findViewWithTag("view_toggle");
            toggle.performClick();
            String first = controlSections().iterator().next();
            root.findViewWithTag("section_" + first).performClick();
            assertFalse(shown(root, first));
            assertEquals(AS_LIST, label(toggle));
            root.findViewWithTag("section_" + first).performClick();
            assertEquals("Every section open again is the list view", BY_CATEGORY, label(toggle));
        }
    }

    @Test public void duringASearchTheSwitchStaysAndFoldsOnlyWhatTheSearchFound() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            ViewGroup toggle = root.findViewWithTag("view_toggle");
            ViewGroup content = (ViewGroup) toggle.getParent();
            int index = content.indexOfChild(toggle);
            EditText search = root.findViewWithTag("find_control");
            search.setText("Stickers");
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            assertEquals("Nothing above the field moves while a word is typed", View.VISIBLE, toggle.getVisibility());
            assertEquals(index, content.indexOfChild(toggle));
            assertEquals("A search opens what it found, which reads as the list", BY_CATEGORY, label(toggle));
            toggle.performClick();
            for (String id : controlSections()) assertFalse(id, shown(root, id));
            assertEquals(AS_LIST, label(toggle));
            assertTrue("A search's folding isn't saved", saved().isEmpty());
            search.setText("");
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            for (String id : controlSections()) assertFalse("Back to the saved view: " + id, shown(root, id));
            assertEquals(AS_LIST, label(toggle));
        }
    }

    @Test public void theSwappedIconKeepsTheRowsEnabledTint() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            ViewGroup toggle = screen.get().getWindow().getDecorView().findViewWithTag("view_toggle");
            for (int tap = 0; tap < 2; tap++) {
                toggle.performClick();
                int[] state = ((LayerDrawable) toggle.getBackground()).getDrawable(1).getState();
                assertTrue("tap " + tap + ": " + Arrays.toString(state),
                    Arrays.stream(state).anyMatch(value -> value == android.R.attr.state_enabled));
            }
        }
    }

    private static Set<String> controlSections() {
        Set<String> ids = new LinkedHashSet<>();
        for (String[] spec : SettingsActivity.CONTROLS) if (Settings.installed.contains(spec[0])) ids.add(spec[3]);
        assertFalse(ids.isEmpty());
        return ids;
    }

    private static boolean shown(View root, String id) {
        ViewGroup group = (ViewGroup) root.findViewWithTag("section_" + id).getParent();
        return group.getChildAt(1).getVisibility() == View.VISIBLE;
    }

    private static String label(ViewGroup toggle) { return ((TextView) toggle.getChildAt(0)).getText().toString(); }

    private static Set<String> saved() {
        SharedPreferences store = RuntimeEnvironment.getApplication().getSharedPreferences(SettingsActivity.SECTIONS_STORE, 0);
        String value = store.getString(SettingsActivity.OPEN_SECTIONS, "");
        Set<String> ids = new LinkedHashSet<>();
        for (String id : value.split(",")) if (!id.isEmpty()) ids.add(id);
        return ids;
    }

    private static int left(View view) {
        int[] spot = new int[2];
        view.getLocationInWindow(spot);
        return spot[0];
    }

    private static View lay(View root) {
        for (int pass = 0; pass < 2; pass++) {
            root.measure(View.MeasureSpec.makeMeasureSpec(WIDTH, View.MeasureSpec.EXACTLY), View.MeasureSpec.makeMeasureSpec(HEIGHT, View.MeasureSpec.EXACTLY));
            root.layout(0, 0, WIDTH, HEIGHT);
            Shadows.shadowOf(Looper.getMainLooper()).idle();
        }
        return root;
    }
}
