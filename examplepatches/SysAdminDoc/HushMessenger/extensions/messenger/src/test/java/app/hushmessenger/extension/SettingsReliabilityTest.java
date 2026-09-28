package app.hushmessenger.extension;

import android.app.Activity;
import android.content.pm.ApplicationInfo;
import android.graphics.Insets;
import android.graphics.Rect;
import android.os.Bundle;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowInsets;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.EditText;
import android.widget.OverScroller;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import java.time.Duration;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.util.ReflectionHelpers;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 35)
public class SettingsReliabilityTest {
    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
    }

    @Test @Config(sdk = {28, 29}) public void savedUnsupportedBubblesAreNotCountedAsEffective() {
        Settings.preferences.edit().putBoolean("bubbles", true).commit();
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            assertTrue(((Switch) root.findViewWithTag("bubbles")).isChecked());
            assertFalse(root.findViewWithTag("bubbles").isEnabled());
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
            assertFalse(Settings.enableBubbles());
            bubbles.performClick();
            assertTrue(Settings.enableBubbles());
            assertEquals("1 control enabled", ((TextView) root.findViewWithTag("enabled_count")).getText().toString());
            root.findViewWithTag("paused").performClick();
            assertTrue(bubbles.isChecked());
            assertFalse(Settings.enableBubbles());
            root.findViewWithTag("paused").performClick();
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

    @Test public void rtlKeepsTheGapBetweenTheSwitchAndItsLabel() {
        RuntimeEnvironment.setQualifiers("ar-rEG-ldrtl-w400dp-h800dp-mdpi");
        RuntimeEnvironment.getApplication().getApplicationInfo().flags |= ApplicationInfo.FLAG_SUPPORTS_RTL;
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            root.setLayoutDirection(View.LAYOUT_DIRECTION_RTL);
            layout(screen.get(), 400, 800);
            Switch control = root.findViewWithTag("people");
            ViewGroup row = (ViewGroup) control.getParent();
            assertEquals(View.LAYOUT_DIRECTION_RTL, row.getLayoutDirection());
            assertEquals(12, row.getChildAt(0).getLeft() - control.getRight());
        }
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
