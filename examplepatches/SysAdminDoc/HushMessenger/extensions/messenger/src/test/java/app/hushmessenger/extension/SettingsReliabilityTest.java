package app.hushmessenger.extension;

import android.app.Activity;
import android.content.pm.ApplicationInfo;
import android.graphics.Insets;
import android.graphics.Rect;
import android.os.Bundle;
import android.os.Looper;
import android.view.DisplayCutout;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowInsets;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.EditText;
import android.widget.OverScroller;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;
import java.time.Duration;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowToast;
import org.robolectric.util.ReflectionHelpers;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 35)
public class SettingsReliabilityTest {
    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        OpenSections.all();
    }

    @Test @Config(sdk = {28, 36}) public void wholeControlRowIsOneAccessibleSwitchWithLiveState() {
        CrashGuard.resetForTests();
        for (boolean light : new boolean[] {false, true}) {
            Settings.preferences.edit().clear().putBoolean("light", light).commit();
            try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
                View root = layout(screen.get(), 411, 891);
                assertEquals(View.ACCESSIBILITY_LIVE_REGION_NONE,
                    root.findViewWithTag("enabled_count").getAccessibilityLiveRegion());
                Switch choice = root.findViewWithTag("people");
                View row = (View) choice.getParent();
                row.requestRectangleOnScreen(new Rect(0, 0, row.getWidth(), row.getHeight()), true);
                layout(screen.get(), 411, 891);
                AccessibilityNodeInfo before = row.createAccessibilityNodeInfo();
                assertEquals("android.widget.Switch", before.getClassName().toString());
                assertTrue(before.isCheckable());
                assertFalse(before.isChecked());
                assertEquals(choice.getContentDescription(), before.getContentDescription());
                assertEquals(0, before.getChildCount());
                assertEquals(View.IMPORTANT_FOR_ACCESSIBILITY_YES, row.getImportantForAccessibility());
                assertEquals(View.IMPORTANT_FOR_ACCESSIBILITY_NO, choice.getImportantForAccessibility());
                assertFalse(row.isFocusable());
                assertTrue(choice.isFocusable());
                Rect bounds = new Rect();
                before.getBoundsInScreen(bounds);
                assertEquals(row.getWidth(), bounds.width());
                assertEquals(row.getHeight(), bounds.height());
                assertTrue(row.performAccessibilityAction(AccessibilityNodeInfo.ACTION_CLICK, null));
                assertTrue(choice.isChecked());
                assertTrue(Settings.preferences.getBoolean("people", false));
                AccessibilityNodeInfo after = row.createAccessibilityNodeInfo();
                assertTrue(after.isChecked());
                assertEquals(choice.getContentDescription(), after.getContentDescription());
                AccessibilityEvent click = AccessibilityEvent.obtain(AccessibilityEvent.TYPE_VIEW_CLICKED);
                row.onInitializeAccessibilityEvent(click);
                assertEquals("android.widget.Switch", click.getClassName().toString());
                assertTrue(click.isChecked());
                assertEquals(choice.getContentDescription(), click.getContentDescription());
                click.recycle();
                assertTrue(row.performAccessibilityAction(AccessibilityNodeInfo.ACTION_CLICK, null));
                assertFalse(choice.isChecked());
                assertFalse(Settings.preferences.getBoolean("people", true));
            }
        }
    }

    @Test @Config(sdk = {28, 36}) public void appDescriptionsKeepOneAccessibleSwitchAtLargeTextAndInRtl() {
        for (String locale : new String[] {"en-rUS", "ar-rXB"}) {
            RuntimeEnvironment.setQualifiers(locale + "-w320dp-h360dp-mdpi");
            RuntimeEnvironment.setFontScale(2f);
            try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
                View root = layout(screen.get(), 320, 360);
                root.findViewWithTag("tab_app").performClick();
                layout(screen.get(), 320, 360);
                for (String key : new String[] {"light", "material_you_black", "check_updates"}) {
                    Switch choice = root.findViewWithTag(key);
                    assertReachable(screen.get(), choice, 320, 360);
                    ViewGroup row = (ViewGroup) choice.getParent();
                    AccessibilityNodeInfo node = row.createAccessibilityNodeInfo();
                    assertEquals("android.widget.Switch", node.getClassName().toString());
                    assertEquals(choice.getContentDescription(), node.getContentDescription());
                    assertEquals(0, node.getChildCount());
                    assertTrue(key + " fits horizontally", choice.getLeft() >= 0 && choice.getRight() <= row.getWidth());
                    ViewGroup labels = (ViewGroup) row.getChildAt(0);
                    TextView description = (TextView) labels.getChildAt(1);
                    assertEquals(0, description.getLayout().getEllipsisCount(description.getLineCount() - 1));
                    assertEquals(description.getLayout().getHeight(), description.getHeight());
                    node.recycle();
                }
            }
        }
    }

    /**
     * At normal size an App row's description runs the panel's full width under the switch's 48dp box. The box is
     * invisible, so the check is that no description line overlaps the drawn track, and a line level with it stays 4dp
     * clear sideways. Arabic checks the mirrored row. The pseudo-locales get the large-text layout, so they can't.
     */
    @Test @Config(sdk = {28, 36})
    @org.robolectric.annotation.GraphicsMode(org.robolectric.annotation.GraphicsMode.Mode.NATIVE)
    public void normalSizeAppDescriptionsStayClearOfTheSwitchTrack() {
        // English stays left to right, so the mirrored rows need an Arabic table.
        SettingsTranslations.LOCALES.put("ar", java.util.Map.of("tab_controls", "Controls in Arabic"));
        try {
            normalSizeAppDescriptionsStayClearOfTheSwitchTrackIn();
        } finally { SettingsTranslations.LOCALES.remove("ar"); }
    }

    private void normalSizeAppDescriptionsStayClearOfTheSwitchTrackIn() {
        for (String locale : new String[] {"en-rUS-ldltr", "ar-rEG-ldrtl"}) {
            RuntimeEnvironment.setQualifiers(locale + "-w390dp-h844dp-mdpi");
            RuntimeEnvironment.setFontScale(1f);
            try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
                View root = layout(screen.get(), 390, 844);
                root.findViewWithTag("tab_app").performClick();
                layout(screen.get(), 390, 844);
                int rows = 0;
                for (String key : new String[] {"hide_drawer_icon", "hide_menu_row", "light", "material_you_black", "check_updates"}) {
                    Switch choice = root.findViewWithTag(key);
                    if (choice == null) continue;
                    rows++;
                    ViewGroup row = (ViewGroup) choice.getParent();
                    ViewGroup labels = (ViewGroup) row.getChildAt(0);
                    TextView description = (TextView) labels.getChildAt(1);
                    assertEquals(key + " uses the normal-size overlay", -48, ((ViewGroup.MarginLayoutParams) choice.getLayoutParams()).getMarginStart());
                    assertEquals(locale + " row direction", locale.endsWith("ldrtl") ? View.LAYOUT_DIRECTION_RTL : View.LAYOUT_DIRECTION_LTR,
                        row.getLayoutDirection());
                    // Drawing is what gives the track its bounds inside the switch.
                    choice.draw(new android.graphics.Canvas(android.graphics.Bitmap.createBitmap(choice.getWidth(), choice.getHeight(),
                        android.graphics.Bitmap.Config.ARGB_8888)));
                    Rect track = new Rect(choice.getTrackDrawable().getBounds());
                    assertFalse(key + " track drawn", track.isEmpty());
                    track.offset(choice.getLeft(), choice.getTop());
                    android.text.Layout text = description.getLayout();
                    int x = labels.getLeft() + description.getLeft() + description.getTotalPaddingLeft();
                    int y = labels.getTop() + description.getTop() + description.getTotalPaddingTop();
                    for (int line = 0; line < text.getLineCount(); line++) {
                        Rect drawn = new Rect(x + (int) Math.floor(text.getLineLeft(line)) - 4, y + text.getLineTop(line),
                            x + (int) Math.ceil(text.getLineRight(line)) + 4, y + text.getLineBottom(line));
                        assertFalse(locale + " " + key + " line " + line + " " + drawn + " meets the track " + track,
                            Rect.intersects(drawn, track));
                    }
                }
                assertTrue(locale + " checked the App rows", rows >= 2);
            }
        }
    }

    @Test @Config(sdk = 28) public void unavailableRowIsAnnouncedButCannotToggle() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            Switch choice = screen.get().getWindow().getDecorView().findViewWithTag("bubbles");
            View row = (View) choice.getParent();
            AccessibilityNodeInfo node = row.createAccessibilityNodeInfo();
            assertEquals("android.widget.Switch", node.getClassName().toString());
            assertFalse(node.isEnabled());
            assertFalse(row.performAccessibilityAction(AccessibilityNodeInfo.ACTION_CLICK, null));
            assertFalse(choice.isChecked());
            assertEquals(choice.getContentDescription(), node.getContentDescription());
        }
    }

    @Test @Config(sdk = {28, 36}) public void statusRefreshesInPlaceAndSpeaksOnlyItsSafeLabel() {
        Settings.activeAt.clear();
        Settings.hookErrors.clear();
        CrashGuard.resetForTests();
        for (boolean light : new boolean[] {false, true}) {
            Settings.preferences.edit().clear().putBoolean("light", light).putBoolean("people", true).commit();
            Settings.activeAt.clear();
            Settings.hookErrors.clear();
            try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
                View root = layout(screen.get(), 411, 891);
                Switch choice = root.findViewWithTag("people");
                TextView label = root.findViewWithTag("active_people");
                EditText search = root.findViewWithTag("find_control");
                assertTrue(search.requestFocus());
                ScrollView list = scroll(root.findViewWithTag("controls_page"));
                list.scrollTo(0, 100);
                int position = list.getScrollY();
                assertTrue(position > 0);
                SettingsUi palette = new SettingsUi(screen.get(), light);
                long now = System.currentTimeMillis();
                for (String state : new String[] {"unused", "used", "failed", "paused"}) {
                    screen.pause();
                    if ("used".equals(state)) Settings.activeAt.put("people", now);
                    if ("failed".equals(state)) Settings.hookErrors.put("people", "java.lang.IllegalStateException at Settings.test|" + (now + 1));
                    if ("paused".equals(state)) Settings.preferences.edit().putBoolean("paused", true).commit();
                    screen.resume();
                    String expected = "paused".equals(state) ? "Changes paused" : "failed".equals(state) ? "Stopped with an error just now. Copy setup on the App tab has details."
                        : "used".equals(state) ? "Used just now" : "On. Waiting for Messenger to use it";
                    assertSame(choice, root.findViewWithTag("people"));
                    assertSame(label, root.findViewWithTag("active_people"));
                    assertEquals(expected, label.getText().toString());
                    assertTrue(choice.isChecked());
                    assertTrue(search.hasFocus());
                    assertEquals(position, list.getScrollY());
                    String spoken = choice.getContentDescription().toString();
                    assertTrue(spoken.contains(expected));
                    assertEquals(spoken.indexOf(expected), spoken.lastIndexOf(expected));
                    assertFalse(spoken.contains("IllegalStateException"));
                    assertFalse(spoken.contains("Settings.test"));
                    AccessibilityNodeInfo node = ((View) choice.getParent()).createAccessibilityNodeInfo();
                    assertEquals(spoken, node.getContentDescription().toString());
                    // The accessible row owns the safe status and current switch state.
                    assertFalse(node.getText() != null && node.getText().toString().contains(expected));
                    if (android.os.Build.VERSION.SDK_INT >= 30)
                        assertFalse(node.getStateDescription() != null && node.getStateDescription().toString().contains(expected));
                    assertEquals(0, node.getChildCount());
                    assertTrue(node.isCheckable());
                    assertTrue(node.isChecked());
                    assertEquals(View.IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS,
                        ((View) label.getParent()).getImportantForAccessibility());
                    assertEquals(1f, label.getAlpha(), 0f);
                    // WCAG relative luminance of the actual rendered label over its row background.
                    double[] luminance = new double[2];
                    int[] colors = {label.getCurrentTextColor(), palette.background};
                    double[] weights = {0.2126, 0.7152, 0.0722};
                    for (int color = 0; color < 2; color++) for (int channel = 0; channel < 3; channel++) {
                        double value = ((colors[color] >>> (16 - 8 * channel)) & 255) / 255.0;
                        luminance[color] += weights[channel] * (value <= 0.04045 ? value / 12.92 : Math.pow((value + 0.055) / 1.055, 2.4));
                    }
                    assertTrue(state + " contrast", (Math.max(luminance[0], luminance[1]) + 0.05) /
                        (Math.min(luminance[0], luminance[1]) + 0.05) >= 4.5);
                }
                choice.setChecked(false);
                assertEquals(View.GONE, label.getVisibility());
                assertFalse(choice.getContentDescription().toString().contains("Changes paused"));
            }
        }
    }

    @Test @Config(sdk = {28, 36}, qualifiers = "w411dp-h1200dp-mdpi")
    @org.robolectric.annotation.GraphicsMode(org.robolectric.annotation.GraphicsMode.Mode.NATIVE)
    public void statusContrastUsesPixelsRenderedByTheWholeViewHierarchy() {
        CrashGuard.resetForTests();
        for (boolean light : new boolean[] {false, true}) {
            Settings.preferences.edit().clear().putBoolean("light", light).putBoolean("people", true).commit();
            Settings.activeAt.clear();
            Settings.hookErrors.clear();
            try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
                for (String state : new String[] {"unused", "used", "failed", "paused"}) {
                    screen.pause();
                    long now = System.currentTimeMillis();
                    if ("used".equals(state)) Settings.activeAt.put("people", now);
                    if ("failed".equals(state)) Settings.hookErrors.put("people", "Error at Settings.test|" + (now + 1));
                    if ("paused".equals(state)) Settings.preferences.edit().putBoolean("paused", true).commit();
                    screen.resume();
                    View root = layout(screen.get(), 411, 1200);
                    TextView label = root.findViewWithTag("active_people");
                    Rect bounds = new Rect();
                    label.getDrawingRect(bounds);
                    ((ViewGroup) root).offsetDescendantRectToMyCoords(label, bounds);
                    assertTrue(bounds + " in " + root.getWidth() + "x" + root.getHeight(), bounds.top >= 0 && bounds.bottom <= root.getHeight());
                    android.graphics.Bitmap pixels = android.graphics.Bitmap.createBitmap(root.getWidth(), root.getHeight(), android.graphics.Bitmap.Config.ARGB_8888);
                    root.draw(new android.graphics.Canvas(pixels));
                    int background = pixels.getPixel(bounds.right - 1, bounds.bottom - 1);
                    int foreground = background, nearest = Integer.MAX_VALUE;
                    // Find the most fully covered glyph pixel; edge antialiasing is not the WCAG text color.
                    for (int y = bounds.top; y < bounds.bottom; y++) for (int x = bounds.left; x < bounds.right; x++) {
                        int color = pixels.getPixel(x, y), distance = 0;
                        for (int shift : new int[] {0, 8, 16}) {
                            int difference = ((color >>> shift) & 255) - ((label.getCurrentTextColor() >>> shift) & 255);
                            distance += difference * difference;
                        }
                        if (distance < nearest) { foreground = color; nearest = distance; }
                    }
                    double[] luminance = new double[2], weights = {0.2126, 0.7152, 0.0722};
                    int[] colors = {foreground, background};
                    for (int color = 0; color < 2; color++) for (int channel = 0; channel < 3; channel++) {
                        double value = ((colors[color] >>> (16 - 8 * channel)) & 255) / 255.0;
                        luminance[color] += weights[channel] * (value <= 0.04045 ? value / 12.92 : Math.pow((value + 0.055) / 1.055, 2.4));
                    }
                    assertTrue(state + " rendered contrast", (Math.max(luminance[0], luminance[1]) + 0.05) /
                        (Math.min(luminance[0], luminance[1]) + 0.05) >= 4.5);
                    pixels.recycle();
                }
            }
        }
    }

    @Test @Config(sdk = {28, 36}, qualifiers = "mdpi")
    @org.robolectric.annotation.GraphicsMode(org.robolectric.annotation.GraphicsMode.Mode.NATIVE)
    public void aFocusedAccentButtonsRingStandsOutFromTheButtonAndThePage() {
        for (boolean light : new boolean[] {false, true}) {
            SettingsUi ui = new SettingsUi(RuntimeEnvironment.getApplication(), light);
            // The primary buttons and the selected tab are both accent fills.
            for (android.graphics.drawable.Drawable background : new android.graphics.drawable.Drawable[] {
                    ui.primaryButton("Save").getBackground(), ui.interactive(ui.accentFill, 0, 10)}) {
                int[] focused = edge(ui, background, true), plain = edge(ui, background, false);
                String theme = light ? "light" : "dark";
                assertTrue(theme + " outer ring against the page", contrast(focused[0], ui.background) >= 3);
                assertTrue(theme + " inner ring against the fill", contrast(focused[1], focused[2]) >= 3);
                assertTrue(theme + " ring against the unfocused button", contrast(focused[1], plain[1]) >= 3);
            }
        }
    }

    /** The outer ring, inner ring and fill pixels on a background's left edge, drawn over the page at 1px per dp. */
    private static int[] edge(SettingsUi ui, android.graphics.drawable.Drawable background, boolean focused) {
        android.graphics.Bitmap pixels = android.graphics.Bitmap.createBitmap(120, 60, android.graphics.Bitmap.Config.ARGB_8888);
        android.graphics.Canvas canvas = new android.graphics.Canvas(pixels);
        canvas.drawColor(ui.background);
        background.setBounds(10, 10, 110, 50);
        background.setState(focused ? new int[] {android.R.attr.state_enabled, android.R.attr.state_focused}
            : new int[] {android.R.attr.state_enabled});
        background.jumpToCurrentState();
        background.draw(canvas);
        int[] edge = {pixels.getPixel(10, 30), pixels.getPixel(12, 30), pixels.getPixel(20, 30)};
        pixels.recycle();
        return edge;
    }

    private static double contrast(int first, int second) {
        double[] luminance = new double[2], weights = {0.2126, 0.7152, 0.0722};
        int[] colors = {first, second};
        for (int color = 0; color < 2; color++) for (int channel = 0; channel < 3; channel++) {
            double value = ((colors[color] >>> (16 - 8 * channel)) & 255) / 255.0;
            luminance[color] += weights[channel] * (value <= 0.04045 ? value / 12.92 : Math.pow((value + 0.055) / 1.055, 2.4));
        }
        return (Math.max(luminance[0], luminance[1]) + 0.05) / (Math.min(luminance[0], luminance[1]) + 0.05);
    }

    @Test @Config(sdk = {28, 29}) public void savedUnsupportedBubblesAreNotCountedAsEffective() {
        Settings.preferences.edit().putBoolean("bubbles", true).commit();
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            assertTrue(((Switch) root.findViewWithTag("bubbles")).isChecked());
            assertFalse(root.findViewWithTag("bubbles").isEnabled());
            Switch unavailable = root.findViewWithTag("bubbles");
            SettingsUi palette = new SettingsUi(screen.get(), false);
            assertEquals(1f, unavailable.getAlpha(), 0f);
            android.graphics.drawable.GradientDrawable track = (android.graphics.drawable.GradientDrawable) unavailable.getTrackDrawable().getCurrent();
            assertEquals(palette.track, track.getColor().getDefaultColor());
            assertTrue(Settings.preferences.getBoolean("bubbles", false));
            assertFalse(Settings.enableBubbles());
            assertEquals("0 controls enabled", ((TextView) root.findViewWithTag("enabled_count")).getText().toString());
        }
    }

    @Test @Config(sdk = {30, 36}) public void eligibleBubblesFollowSelectionAndPause() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            Switch bubbles = root.findViewWithTag("bubbles");
            assertTrue(bubbles.isEnabled());
            assertEquals(1f, bubbles.getAlpha(), 0f);
            assertFalse(Settings.enableBubbles());
            bubbles.performClick();
            Toast first = ShadowToast.getLatestToast();
            assertEquals("Allow chat bubbles is on", ShadowToast.getTextOfLatestToast());
            assertTrue(Settings.enableBubbles());
            assertEquals("1 control enabled", ((TextView) root.findViewWithTag("enabled_count")).getText().toString());
            root.findViewWithTag("paused").performClick();
            // A newer toast replaces the old one instead of queueing behind it.
            assertTrue(Shadows.shadowOf(first).isCancelled());
            assertEquals("Changes paused", ShadowToast.getTextOfLatestToast());
            assertTrue(bubbles.isChecked());
            assertFalse(Settings.enableBubbles());
            root.findViewWithTag("paused").performClick();
            assertEquals("Changes resumed", ShadowToast.getTextOfLatestToast());
            assertTrue(Settings.enableBubbles());
        }
    }

    @Test public void resumedActivityReadsChoicesChangedInAnotherInstance() {
        try (var first = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            first.pause().stop();
            try (var second = Robolectric.buildActivity(SettingsActivity.class).setup()) {
                View root = second.get().getWindow().getDecorView();
                root.findViewWithTag("people").performClick();
                root.findViewWithTag("paused").performClick();
            }
            first.restart().start().resume();
            View root = first.get().getWindow().getDecorView();
            assertTrue(((Switch) root.findViewWithTag("people")).isChecked());
            assertTrue(((Switch) root.findViewWithTag("paused")).isChecked());
            assertEquals("Changes paused", ((TextView) root.findViewWithTag("enabled_count")).getText().toString());
            assertFalse(Settings.enabled("people"));
            root.findViewWithTag("paused").performClick();
            assertTrue(Settings.enabled("people"));
        }
    }

    @Test public void recreationPreservesQuerySelectionAndVisibleFocus() {
        Bundle state = new Bundle();
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            EditText search = layout(screen.get(), 400, 800).findViewWithTag("find_control");
            search.setText("People You");
            assertTrue(search.requestFocus());
            assertTrue(search.hasFocus());
            // ShadowActivity stores this separately from the actual view focus hierarchy.
            Shadows.shadowOf(screen.get()).setCurrentFocus(search);
            assertSame(search, screen.get().getCurrentFocus());
            search.setSelection(1, 5);
            screen.get().onSaveInstanceState(state);
            assertEquals("find_control", state.getString("focused_control"));
        }
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).create(state).start().resume().visible()) {
            View root = layout(screen.get(), 400, 800);
            EditText search = root.findViewWithTag("find_control");
            assertEquals("People You", search.getText().toString());
            assertEquals(1, search.getSelectionStart());
            assertEquals(5, search.getSelectionEnd());
            assertTrue("Focus: " + screen.get().getCurrentFocus() + "; search shown: " + search.isShown(), search.hasFocus());
            root.findViewWithTag("tab_app").performClick();
            assertFalse(search.hasFocus());
        }
    }

    @Test public void recreationKeepsTheInactivePagesScrollPosition() {
        RuntimeEnvironment.setQualifiers("w400dp-h600dp-mdpi");
        Bundle state = new Bundle();
        int savedScroll;
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = layout(screen.get(), 400, 600);
            ScrollView controls = scroll(root.findViewWithTag("controls_page"));
            controls.scrollTo(0, 300);
            savedScroll = controls.getScrollY();
            assertTrue(savedScroll > 0);
            root.findViewWithTag("tab_app").performClick();
            layout(screen.get(), 400, 600);
            screen.get().onSaveInstanceState(state);
        }
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).create(state).start().resume().visible()) {
            View root = layout(screen.get(), 400, 600);
            root.findViewWithTag("tab_controls").performClick();
            layout(screen.get(), 400, 600);
            assertEquals(savedScroll, scroll(root.findViewWithTag("controls_page")).getScrollY());
        }
    }

    @Test @Config(sdk = {28, 36}) public void shortWindowsKeepControlsReachableInBothThemes() {
        for (int width : new int[] {320, 640}) for (float fontScale : new float[] {1f, 2f}) for (boolean light : new boolean[] {false, true}) {
            RuntimeEnvironment.setQualifiers("w" + width + "dp-h360dp-mdpi");
            RuntimeEnvironment.setFontScale(fontScale);
            Settings.preferences.edit().putBoolean("light", light).commit();
            try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
                View root = layout(screen.get(), width, 360);
                ScrollView controls = scroll(root.findViewWithTag("controls_page"));
                assertTrue("Controls viewport: " + controls.getHeight(), controls.getHeight() >= 48);
                assertReachable(screen.get(), root.findViewWithTag("bubbles"), width, 360);
                assertTrue("Scrolled to last control", controls.getScrollY() > 0);
                assertReachable(screen.get(), root.findViewWithTag("paused"), width, 360);
                root.findViewWithTag("tab_app").performClick();
                layout(screen.get(), width, 360);
                assertTrue("App viewport", scroll(root.findViewWithTag("app_page")).getHeight() >= 48);
                assertReachable(screen.get(), root.findViewWithTag("source_licenses"), width, 360);
                assertReachable(screen.get(), root.findViewWithTag("light"), width, 360);
            }
        }
    }

    @Test @Config(sdk = {28, 36}) public void quickAccessTextWithTheMenuRowStaysWholeAtLargeText() throws Exception {
        var app = RuntimeEnvironment.getApplication();
        var info = app.getPackageManager().getPackageInfo(app.getPackageName(), android.content.pm.PackageManager.GET_META_DATA);
        info.applicationInfo.metaData.putBoolean("hush.feature.menu_row", true);
        // The longest card text: the Menu row and the logo both.
        info.applicationInfo.metaData.putBoolean("hush.feature." + Settings.LOGO_LONG_PRESS, true);
        Shadows.shadowOf(app.getPackageManager()).installPackage(info);
        RuntimeEnvironment.setFontScale(2f);
        // A short window only has to keep every line; a phone-sized one shows the whole card text.
        for (int[] size : new int[][] {{320, 360}, {411, 891}}) for (boolean light : new boolean[] {false, true}) {
            RuntimeEnvironment.setQualifiers("w" + size[0] + "dp-h" + size[1] + "dp-mdpi");
            Settings.preferences.edit().putBoolean("light", light).commit();
            try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
                View root = layout(screen.get(), size[0], size[1]);
                root.findViewWithTag("tab_app").performClick();
                layout(screen.get(), size[0], size[1]);
                TextView help = root.findViewWithTag("access_help");
                assertTrue(help.getText().toString().contains("Messenger's Menu"));
                assertEquals(0, help.getLayout().getEllipsisCount(help.getLineCount() - 1));
                assertEquals(help.getLayout().getHeight(), help.getHeight() - help.getPaddingTop() - help.getPaddingBottom());
                if (size[1] > 360) {
                    Rect visible = new Rect();
                    assertTrue(help.getGlobalVisibleRect(visible));
                    assertEquals(help.getHeight(), visible.height());
                }
                assertReachable(screen.get(), root.findViewWithTag("restart_messenger"), size[0], size[1]);
            }
        }
    }

    /** Each section's chevron turns a quarter round as it opens, so its box holds the whole glyph either way up. */
    @org.robolectric.annotation.GraphicsMode(org.robolectric.annotation.GraphicsMode.Mode.NATIVE)
    @Test @Config(sdk = {28, 36}) public void sectionChevronsStayWholeAtLargeText() {
        RuntimeEnvironment.setQualifiers("w411dp-h891dp-mdpi");
        RuntimeEnvironment.setFontScale(2f);
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = layout(screen.get(), 411, 891);
            int checked = 0;
            for (String tab : new String[] {"tab_controls", "tab_app"}) {
                root.findViewWithTag(tab).performClick();
                layout(screen.get(), 411, 891);
                for (View header : sectionHeaders(root)) {
                    if (!header.isShown()) continue;
                    TextView chevron = (TextView) ((ViewGroup) header).getChildAt(2);
                    float glyph = Math.max(chevron.getPaint().getFontSpacing(),
                        chevron.getPaint().measureText(chevron.getText().toString()));
                    // Real text metrics, grown past the old fixed 24dp box (one px a dp here).
                    assertTrue("glyph " + glyph, glyph > 24f);
                    assertTrue(header.getTag() + " chevron " + chevron.getWidth() + "x" + chevron.getHeight() + " for " + glyph,
                        Math.min(chevron.getWidth(), chevron.getHeight()) >= glyph);
                    checked++;
                }
            }
            assertTrue(checked >= 2);
        }
    }

    private static java.util.List<View> sectionHeaders(View view) {
        java.util.List<View> found = new java.util.ArrayList<>();
        if (view.getTag() instanceof String && ((String) view.getTag()).startsWith("section_")) found.add(view);
        if (view instanceof ViewGroup)
            for (int child = 0; child < ((ViewGroup) view).getChildCount(); child++)
                found.addAll(sectionHeaders(((ViewGroup) view).getChildAt(child)));
        return found;
    }

    @Test @Config(sdk = {28, 36}) public void keyboardSizedWindowKeepsSearchReadableAndRestoresNavigation() {
        RuntimeEnvironment.setQualifiers("w320dp-h360dp-mdpi");
        RuntimeEnvironment.setFontScale(2f);
        for (boolean light : new boolean[] {false, true}) {
            Settings.preferences.edit().putBoolean("light", light).commit();
            try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
                View root = layout(screen.get(), 320, 360);
                EditText search = root.findViewWithTag("find_control");
                search.setText("People");
                assertTrue(search.requestFocus());
                assertReachable(screen.get(), search, 320, 360);
                layout(screen.get(), 320, 74);
                ScrollView controls = scroll(root.findViewWithTag("controls_page"));
                assertTrue("Keyboard viewport: " + controls.getHeight() + "; search: " + search.getHeight(),
                    controls.getHeight() >= search.getHeight());
                Rect visible = new Rect();
                assertTrue(search.getGlobalVisibleRect(visible));
                assertEquals("Entire focused search remains visible", search.getHeight(), visible.height());
                assertTrue(search.hasFocus());
                assertEquals("People", search.getText().toString());
                View app = root.findViewWithTag("tab_app");
                assertReachable(screen.get(), app, 320, 74);
                app.performClick();
                layout(screen.get(), 320, 74);
                assertEquals(View.VISIBLE, root.findViewWithTag("app_page").getVisibility());
                assertFalse(search.hasFocus());
                assertReachable(screen.get(), root.findViewWithTag("light"), 320, 74);
                layout(screen.get(), 320, 360);
                assertTrue(app.getGlobalVisibleRect(visible));
                assertEquals("Navigation restored after keyboard hides", app.getHeight(), visible.height());
                root.findViewWithTag("tab_controls").performClick();
                layout(screen.get(), 320, 360);
                assertEquals(View.VISIBLE, root.findViewWithTag("controls_page").getVisibility());
            }
        }
    }

    @Test @Config(sdk = 36) public void keyboardInsetsKeepSearchVisibleAfterHeaderMoves() {
        RuntimeEnvironment.setQualifiers("w320dp-h360dp-mdpi");
        RuntimeEnvironment.setFontScale(2f);
        for (boolean light : new boolean[] {false, true}) {
            Settings.preferences.edit().putBoolean("light", light).commit();
            try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
                View root = layout(screen.get(), 320, 360);
                View content = ((ViewGroup) root.findViewById(android.R.id.content)).getChildAt(0);
                content.dispatchApplyWindowInsets(new WindowInsets.Builder().setSystemWindowInsets(Insets.of(0, 24, 0, 24)).build());
                layout(screen.get(), 320, 360);
                EditText search = root.findViewWithTag("find_control");
                ScrollView controls = scroll(root.findViewWithTag("controls_page"));
                controls.scrollTo(0, search.getTop() - controls.getHeight() + search.getHeight());
                assertTrue(search.requestFocus());
                layout(screen.get(), 320, 360);
                Rect visible = new Rect();
                assertTrue(search.getGlobalVisibleRect(visible));
                assertEquals(search.getHeight(), visible.height());
                Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(500));
                OverScroller scroller = ReflectionHelpers.getField(controls, "mScroller");
                boolean[] pendingScroll = {false};
                controls.addOnLayoutChangeListener((view, left, top, right, bottom, oldLeft, oldTop, oldRight, oldBottom) ->
                    pendingScroll[0] |= !scroller.isFinished());
                // Edge-to-edge IME insets reduce the viewport while the root keeps its old size.
                content.dispatchApplyWindowInsets(new WindowInsets.Builder().setSystemWindowInsets(Insets.of(0, 24, 0, 254)).build());
                layout(screen.get(), 320, 360);
                assertTrue("Resize created a pending framework scroll before the parent reveal", pendingScroll[0]);
                assertEquals(360, content.getHeight());
                assertEquals(82, controls.getHeight());
                assertTrue("Focused search remains on screen after its position shifts", search.getGlobalVisibleRect(visible));
                assertEquals("Whole search visible above IME", search.getHeight(), visible.height());
                for (int frame = 0; frame < 20; frame++) {
                    Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(16));
                    controls.computeScroll();
                }
                assertTrue("Focused search stays visible after the pending scroller settles", search.getGlobalVisibleRect(visible));
                assertEquals(search.getHeight(), visible.height());
                for (int inset : new int[] {200, 160, 100, 24, 100, 160, 200, 254}) {
                    content.dispatchApplyWindowInsets(new WindowInsets.Builder().setSystemWindowInsets(Insets.of(0, 24, 0, inset)).build());
                    layout(screen.get(), 320, 360);
                    Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(32));
                    controls.computeScroll();
                }
                Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(300));
                controls.computeScroll();
                assertTrue("Search remains visible after inset animation settles", search.getGlobalVisibleRect(visible));
                assertEquals(search.getHeight(), visible.height());
                controls.scrollTo(0, 0);
                layout(screen.get(), 320, 360);
                assertEquals("Later manual scrolling is preserved", 0, controls.getScrollY());
            }
        }
    }

    @Test @Config(sdk = {28, 36}) public void phoneKeyboardLeavesTheFirstMatchVisibleUnderSearch() {
        // A phone-sized window that Samsung's keyboard resizes to a little over half its height.
        RuntimeEnvironment.setQualifiers("w360dp-h740dp-mdpi");
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = layout(screen.get(), 360, 740);
            EditText search = root.findViewWithTag("find_control");
            ScrollView controls = scroll(root.findViewWithTag("controls_page"));
            assertEquals(0, controls.getScrollY());
            search.setText("People You May");
            assertTrue(search.requestFocus());
            layout(screen.get(), 360, 426);
            for (int frame = 0; frame < 40; frame++) {
                Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(16));
                controls.computeScroll();
            }
            Rect visible = new Rect();
            assertTrue(search.getGlobalVisibleRect(visible));
            assertEquals("Whole search visible above the keyboard", search.getHeight(), visible.height());
            Rect page = new Rect();
            assertTrue(controls.getGlobalVisibleRect(page));
            assertTrue("Search moves up to make room: " + visible + " in " + page, visible.top - page.top < page.height() / 3);
            View match = root.findViewWithTag("people");
            assertTrue("The match shows under the search instead of behind the keyboard", match.getGlobalVisibleRect(visible));
            assertEquals("Whole match visible", match.getHeight(), visible.height());
            assertTrue(search.hasFocus());
        }
    }

    @Test @Config(sdk = {29, 36}) public void cutoutInsetsKeepTheScreenClearOnEitherSide() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View content = ((ViewGroup) screen.get().findViewById(android.R.id.content)).getChildAt(0);
            // System bars, cutout safe insets, then the padding the root should take.
            int[][] cases = {
                {0, 24, 0, 24, 0, 0, 0, 0, 0, 24, 0, 24},
                {0, 24, 0, 24, 80, 0, 0, 0, 80, 24, 0, 24},
                {0, 24, 0, 24, 0, 0, 80, 0, 0, 24, 80, 24},
                {0, 24, 0, 24, 0, 90, 0, 0, 0, 90, 0, 24},
                {0, 24, 0, 254, 0, 0, 80, 40, 0, 24, 80, 254},
            };
            for (int[] c : cases) {
                WindowInsets.Builder insets = new WindowInsets.Builder().setSystemWindowInsets(Insets.of(c[0], c[1], c[2], c[3]));
                if (c[4] + c[5] + c[6] + c[7] > 0)
                    insets.setDisplayCutout(new DisplayCutout(Insets.of(c[4], c[5], c[6], c[7]), null, null, null, null));
                WindowInsets left = content.dispatchApplyWindowInsets(insets.build());
                assertArrayEquals(java.util.Arrays.toString(c), new int[] {c[8], c[9], c[10], c[11]},
                    new int[] {content.getPaddingLeft(), content.getPaddingTop(), content.getPaddingRight(), content.getPaddingBottom()});
                assertNull("The cutout is handled here, not passed on", left.getDisplayCutout());
            }
        }
    }

    @Test public void rtlKeepsTheGapBetweenTheSwitchAndItsLabel() {
        RuntimeEnvironment.setQualifiers("ar-rEG-ldrtl-w400dp-h800dp-mdpi");
        RuntimeEnvironment.getApplication().getApplicationInfo().flags |= ApplicationInfo.FLAG_SUPPORTS_RTL;
        // English stays left to right, so the mirrored rows need an Arabic table.
        SettingsTranslations.LOCALES.put("ar", java.util.Map.of("tab_controls", "Controls in Arabic"));
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            root.setLayoutDirection(View.LAYOUT_DIRECTION_RTL);
            layout(screen.get(), 400, 800);
            Switch control = root.findViewWithTag("people");
            ViewGroup row = (ViewGroup) control.getParent();
            assertEquals(View.LAYOUT_DIRECTION_RTL, row.getLayoutDirection());
            // Descriptions span the row now; the title reserves the switch column.
            ViewGroup labels = (ViewGroup) row.getChildAt(0);
            ViewGroup titleLine = (ViewGroup) labels.getChildAt(0);
            Rect titleBounds = new Rect();
            titleLine.getChildAt(0).getDrawingRect(titleBounds);
            row.offsetDescendantRectToMyCoords(titleLine.getChildAt(0), titleBounds);
            assertTrue("The visible title stays clear of the switch", titleBounds.left - control.getRight() >= 12);
            // The space kept for the switch sits on its side, so the title starts at the mirrored edge like its description.
            assertEquals("The title starts at the right edge", labels.getRight() - labels.getPaddingRight(), titleBounds.right);
        } finally { SettingsTranslations.LOCALES.remove("ar"); }
    }

    @Test @Config(sdk = {28, 36}) public void accessiblePageActionsExposeTheActivePaneAndCheckedState() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            assertEquals("Controls", root.findViewWithTag("controls_page").createAccessibilityNodeInfo().getPaneTitle());
            View appTab = root.findViewWithTag("tab_app");
            assertTrue(appTab.performAccessibilityAction(AccessibilityNodeInfo.ACTION_CLICK, null));
            assertTrue(appTab.createAccessibilityNodeInfo().isSelected());
            assertEquals("App", root.findViewWithTag("app_page").createAccessibilityNodeInfo().getPaneTitle());
            root.findViewWithTag("tab_controls").performAccessibilityAction(AccessibilityNodeInfo.ACTION_CLICK, null);
            View people = root.findViewWithTag("people");
            assertTrue(people.performAccessibilityAction(AccessibilityNodeInfo.ACTION_CLICK, null));
            AccessibilityNodeInfo node = people.createAccessibilityNodeInfo();
            assertTrue(node.isCheckable());
            assertTrue(node.isChecked());
            assertTrue(node.isClickable());
            assertEquals("android.widget.Switch", node.getClassName().toString());
        }
    }

    private static void assertReachable(Activity activity, View target, int width, int height) {
        target.requestRectangleOnScreen(new Rect(0, 0, target.getWidth(), target.getHeight()), true);
        layout(activity, width, height);
        Rect visible = new Rect();
        assertTrue("Target visible: " + target.getTag(), target.getGlobalVisibleRect(visible));
        assertTrue("Visible target height: " + target.getTag() + " " + visible.height(), visible.height() >= 48);
    }

    private static View layout(Activity activity, int width, int height) {
        View root = activity.getWindow().getDecorView();
        for (int pass = 0; pass < 2; pass++) {
            root.measure(View.MeasureSpec.makeMeasureSpec(width, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(height, View.MeasureSpec.EXACTLY));
            root.layout(0, 0, width, height);
            Shadows.shadowOf(Looper.getMainLooper()).idle();
        }
        return root;
    }

    private static ScrollView scroll(View view) {
        if (view instanceof ScrollView) return (ScrollView) view;
        if (view instanceof ViewGroup) for (int i = 0; i < ((ViewGroup) view).getChildCount(); i++) {
            ScrollView found = scroll(((ViewGroup) view).getChildAt(i));
            if (found != null) return found;
        }
        return null;
    }
}
