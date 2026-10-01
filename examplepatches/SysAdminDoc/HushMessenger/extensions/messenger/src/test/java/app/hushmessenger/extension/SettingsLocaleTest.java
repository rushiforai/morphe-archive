package app.hushmessenger.extension;

import android.graphics.Rect;
import android.os.Bundle;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.Switch;
import android.widget.TextView;
import java.util.Locale;
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
@Config(sdk = {28, 36})
public class SettingsLocaleTest {
    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
    }

    @Test public void englishFallbackUsesWholeSingularAndPluralMessages() {
        RuntimeEnvironment.setQualifiers("ja-rJP-w400dp-h800dp-mdpi");
        SettingsText words = new SettingsText(Locale.JAPAN);
        assertEquals("1 saved choice. Turn pause off to resume.", words.count("saved", 1));
        assertEquals("0 saved choices. Turn pause off to resume.", words.count("saved", 0));
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            assertEquals("Controls", ((TextView) root.findViewWithTag("tab_controls")).getText().toString());
            root.findViewWithTag("people").performClick();
            assertEquals("1 control enabled", ((TextView) root.findViewWithTag("enabled_count")).getText().toString());
            root.findViewWithTag("stories").performClick();
            assertEquals("2 controls enabled", ((TextView) root.findViewWithTag("enabled_count")).getText().toString());
        }
    }

    @Test public void mirroredTextPreservesTheVisualOrderOfNumbersAndVersions() {
        SettingsText words = new SettingsText(Locale.forLanguageTag("ar-XB"));
        String[][] examples = {
            {words.count("enabled", 12), words.number(12)},
            {words.get("results_many", 12, 20), words.number(12), words.number(20)},
            {words.display("Version 0.4.12"), "0.4.12"},
            {words.display("Count ١٬٢٣٤"), "١٬٢٣٤"},
            {words.display("Value ١٢٫٣٤"), "١٢٫٣٤"},
        };
        for (String[] example : examples) {
            String visual = new android.icu.text.Bidi(example[0], android.icu.text.Bidi.DIRECTION_RIGHT_TO_LEFT)
                .writeReordered(android.icu.text.Bidi.REMOVE_BIDI_CONTROLS);
            for (int index = 1; index < example.length; index++) assertTrue(visual, visual.contains(example[index]));
        }
    }

    @Test @Config(sdk = 36) public void requestedAppLocaleWinsWhenResourceSelectionFallsBackToEnglish() {
        RuntimeEnvironment.setQualifiers("en-rUS-w400dp-h800dp-mdpi");
        android.app.LocaleManager manager = RuntimeEnvironment.getApplication().getSystemService(android.app.LocaleManager.class);
        try {
            for (String locale : new String[] {"en-XA", "ar-XB"}) {
                manager.setApplicationLocales(android.os.LocaleList.forLanguageTags(locale));
                try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
                    View root = layout(screen.get(), 400, 800);
                    String title = ((TextView) root.findViewWithTag("tab_controls")).getText().toString();
                    assertNotEquals("Controls", title);
                    assertTrue(title.startsWith(locale.equals("en-XA") ? "[" : "\u202e"));
                    assertEquals(locale.equals("ar-XB") ? View.LAYOUT_DIRECTION_RTL : View.LAYOUT_DIRECTION_LTR,
                        root.findViewWithTag("controls_page").getLayoutDirection());
                }
            }
        } finally { manager.setApplicationLocales(android.os.LocaleList.getEmptyLocaleList()); }
    }

    @Test public void legacyAndStableStateSurviveLocaleChangesWithoutChangingPreferenceKeys() {
        Bundle state = new Bundle();
        state.putString("page", "App");
        state.putString("category", "Inbox");
        state.putString("query", "People You");
        Settings.preferences.edit().putBoolean("people", true).commit();
        for (String locale : new String[] {"en-rXA", "ar-rXB", "fr-rFR"}) {
            RuntimeEnvironment.setQualifiers(locale + "-w400dp-h800dp-mdpi");
            try (var screen = Robolectric.buildActivity(SettingsActivity.class).create(state).start().resume().visible()) {
                View root = screen.get().getWindow().getDecorView();
                assertEquals(View.VISIBLE, root.findViewWithTag("app_page").getVisibility());
                assertTrue(root.findViewWithTag("tab_app").isSelected());
                // Rendered labels must never be used as navigation identifiers.
                ((TextView) root.findViewWithTag("tab_controls")).setText("Different visible label");
                root.findViewWithTag("tab_controls").performClick();
                assertTrue(root.findViewWithTag("tab_controls").isSelected());
                assertTrue(root.findViewWithTag("category_inbox").isSelected());
                assertEquals("People You", ((EditText) root.findViewWithTag("find_control")).getText().toString());
                assertEquals(1, visibleControls(root));
                assertTrue(((Switch) root.findViewWithTag("people")).isChecked());
                assertTrue(Settings.enabled("people"));
                root.findViewWithTag("tab_app").performClick();
                screen.get().onSaveInstanceState(state);
                assertEquals("app", state.getString("page"));
                assertEquals("inbox", state.getString("category"));
            }
        }
        assertEquals(1, Settings.preferences.getAll().size());
    }

    @Test public void pseudoTextIsTransformedAndSearchAcceptsVisibleLabelsAndEnglish() {
        for (String locale : new String[] {"en-rXA", "ar-rXB"}) {
            RuntimeEnvironment.setQualifiers(locale + "-w400dp-h800dp-mdpi");
            try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
                View root = layout(screen.get(), 400, 800);
                String pane = root.findViewWithTag("controls_page").getAccessibilityPaneTitle().toString();
                assertNotEquals("Controls", pane);
                if (locale.equals("en-rXA")) {
                    assertTrue(pane.startsWith("["));
                    assertTrue(pane.length() > "Controls".length());
                    assertTrue(pane.contains("ó"));
                } else {
                    assertTrue(pane.startsWith("\u202e"));
                    assertTrue(pane.endsWith("\u202c"));
                    Switch control = root.findViewWithTag("people");
                    ViewGroup row = (ViewGroup) control.getParent();
                    assertEquals(View.LAYOUT_DIRECTION_RTL, row.getLayoutDirection());
                    assertEquals(12, row.getChildAt(0).getLeft() - control.getRight());
                    // Full-width text aligns to the mirrored start instead of guessing LTR from English letters.
                    assertEquals(View.TEXT_DIRECTION_RTL, ((TextView) root.findViewWithTag("search_status")).getTextDirection());
                    assertEquals(View.TEXT_DIRECTION_RTL, ((TextView) root.findViewWithTag("wordmark")).getTextDirection());
                }
                String spoken = root.findViewWithTag("people").getContentDescription().toString();
                String visibleTitle = spoken.substring(0, spoken.indexOf(". "));
                assertNotEquals("Hide People You May Know", visibleTitle);
                EditText search = root.findViewWithTag("find_control");
                search.setText(visibleTitle);
                assertEquals(1, visibleControls(root));
                search.setText("People You");
                assertEquals(1, visibleControls(root));
                root.findViewWithTag("category_chats").performClick();
                assertEquals(0, visibleControls(root));
                root.findViewWithTag("clear_filters").performClick();
                assertEquals(28, visibleControls(root));
                assertTrue(root.findViewWithTag("category_all").isSelected());
                assertNotEquals("28 of 28 installed controls", ((TextView) root.findViewWithTag("search_status")).getText().toString());
            }
        }
    }

    @Test public void pseudoTextKeepsShortWindowsAndKeyboardNavigationReachable() {
        for (String locale : new String[] {"en-rXA", "ar-rXB"}) for (int width : new int[] {320, 640})
                for (boolean light : new boolean[] {false, true}) {
            RuntimeEnvironment.setQualifiers(locale + "-w" + width + "dp-h360dp-mdpi");
            RuntimeEnvironment.setFontScale(2f);
            Settings.preferences.edit().putBoolean("light", light).commit();
            try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
                View root = layout(screen.get(), width, 360);
                reachable(screen.get(), root.findViewWithTag("bubbles"), width, 360);
                EditText search = root.findViewWithTag("find_control");
                search.setText("People");
                search.requestFocus();
                layout(screen.get(), width, 74);
                reachable(screen.get(), search, width, 74);
                assertTrue(search.hasFocus());
                reachable(screen.get(), root.findViewWithTag("tab_app"), width, 74);
                root.findViewWithTag("tab_app").performClick();
                layout(screen.get(), width, 74);
                reachable(screen.get(), root.findViewWithTag("light"), width, 74);
                layout(screen.get(), width, 360);
                reachable(screen.get(), root.findViewWithTag("copy_setup"), width, 360);
                assertTrue(root.findViewWithTag("tab_app").isSelected());
                for (String[] spec : SettingsActivity.CONTROLS) {
                    View control = root.findViewWithTag(spec[0]);
                    assertTrue(control.getLeft() >= 0);
                    assertTrue(control.getRight() <= ((View) control.getParent()).getWidth());
                }
            }
        }
    }

    private static int visibleControls(View root) {
        int count = 0;
        for (String[] spec : SettingsActivity.CONTROLS)
            if (((View) root.findViewWithTag(spec[0]).getParent()).getVisibility() == View.VISIBLE) count++;
        return count;
    }

    private static View layout(SettingsActivity activity, int width, int height) {
        View root = activity.getWindow().getDecorView();
        for (int pass = 0; pass < 2; pass++) {
            root.measure(View.MeasureSpec.makeMeasureSpec(width, View.MeasureSpec.EXACTLY), View.MeasureSpec.makeMeasureSpec(height, View.MeasureSpec.EXACTLY));
            root.layout(0, 0, width, height);
            Shadows.shadowOf(Looper.getMainLooper()).idle();
        }
        return root;
    }

    private static void reachable(SettingsActivity activity, View target, int width, int height) {
        target.requestRectangleOnScreen(new Rect(0, 0, target.getWidth(), target.getHeight()), true);
        layout(activity, width, height);
        Rect rect = new Rect();
        assertTrue("Visible: " + target.getTag(), target.getGlobalVisibleRect(rect));
        assertTrue("Usable height: " + target.getTag(), rect.height() >= 48);
    }
}
