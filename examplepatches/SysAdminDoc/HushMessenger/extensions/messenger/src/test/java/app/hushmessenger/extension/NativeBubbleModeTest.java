package app.hushmessenger.extension;

import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.ResolveInfo;
import android.graphics.Rect;
import android.os.Build;
import android.os.Looper;
import android.view.View;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.Switch;
import java.util.Map;
import java.util.Set;
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
@Config(sdk = {28, 30, 36})
public class NativeBubbleModeTest {
    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        CrashGuard.resetForTests();
        HostScreens.started = true;
        HostScreens.failed = false;
    }

    @Test public void legacyChoiceDefaultsToStockAndKeepsSelectionAcrossInitialization() {
        assertEquals("stock", Settings.selectedBubbleMode());
        assertFalse(Settings.enableBubbles());
        assertFalse(Settings.forceChatHeads());
        Settings.preferences.edit().putBoolean("bubbles", true).commit();
        Settings.initialize(RuntimeEnvironment.getApplication());
        assertEquals("native", Settings.selectedBubbleMode());
        assertEquals(Build.VERSION.SDK_INT >= 30, Settings.enableBubbles());
        assertFalse(Settings.forceChatHeads());
    }

    @Test @Config(sdk = {30, 36}) public void modesAreExclusiveAndPauseSafeModeAndOffPreserveStockAnswers() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            root.findViewWithTag("bubble_native").performClick();
            assertTrue(Settings.enableBubbles());
            assertFalse(Settings.forceChatHeads());
            assertTrue(Settings.nativeBubbleRollout(false));
            root.findViewWithTag("bubble_chat_heads").performClick();
            assertFalse(Settings.enableBubbles());
            assertTrue(Settings.forceChatHeads());
            assertFalse(Settings.nativeBubbleRollout(false));
            assertTrue(((RadioButton) root.findViewWithTag("bubble_chat_heads")).isChecked());
            assertFalse(((RadioButton) root.findViewWithTag("bubble_native")).isChecked());
            for (String guard : new String[] {"paused", "safe_mode"}) {
                Settings.preferences.edit().putBoolean(guard, true).commit();
                if ("safe_mode".equals(guard)) {
                    CrashGuard.resetForTests();
                    CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
                    HostScreens.started = true;
                }
                assertFalse(Settings.enableBubbles());
                assertFalse(Settings.forceChatHeads());
                assertFalse(Settings.nativeBubbleRollout(false));
                assertTrue(Settings.nativeBubbleRollout(true));
                assertEquals("chat_heads", Settings.selectedBubbleMode());
                Settings.preferences.edit().putBoolean(guard, false).commit();
                if ("safe_mode".equals(guard)) CrashGuard.clearSafeMode();
            }
            ((Switch) root.findViewWithTag("bubbles")).performClick();
            assertEquals("stock", Settings.selectedBubbleMode());
            assertFalse(Settings.forceChatHeads());
            assertFalse(Settings.nativeBubbleRollout(false));
            assertTrue(Settings.nativeBubbleRollout(true));
            ((Switch) root.findViewWithTag("bubbles")).performClick();
            assertEquals("chat_heads", Settings.selectedBubbleMode());
            root.findViewWithTag("bubble_stock").performClick();
            assertFalse(Settings.preferences.getBoolean("bubbles", true));
            assertTrue(((RadioButton) root.findViewWithTag("bubble_stock")).isChecked());
        }
    }

    @Test public void unsupportedHostKeepsSavedChoiceButCannotOverrideEligibility() throws Exception {
        Settings.preferences.edit().putBoolean("bubbles", true).commit();
        var app = RuntimeEnvironment.getApplication();
        var info = app.getPackageManager().getPackageInfo(app.getPackageName(), android.content.pm.PackageManager.GET_META_DATA);
        info.applicationInfo.metaData.remove("hush.preview");
        info.applicationInfo.metaData.putBoolean("hush.native_bubble_routes", false);
        Shadows.shadowOf(app.getPackageManager()).installPackage(info);
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            assertFalse(Settings.available("bubbles"));
            assertFalse(Settings.enableBubbles());
            assertFalse(Settings.nativeBubbleRollout(false));
            assertTrue(Settings.nativeBubbleRollout(true));
            assertEquals("native", Settings.selectedBubbleMode());
            assertTrue(((RadioButton) root.findViewWithTag("bubble_native")).isChecked());
            assertFalse(root.findViewWithTag("bubble_native").isEnabled());
            assertFalse(root.findViewWithTag("bubble_chat_heads").isEnabled());
            assertTrue(root.findViewWithTag("bubble_stock").isEnabled());
            assertTrue(root.findViewWithTag("bubble_notifications").isEnabled());
            root.findViewWithTag("bubble_stock").performClick();
            assertEquals("stock", Settings.selectedBubbleMode());
        }
    }

    @Test public void androidNineLeavesSavedNativeChoiceDisabled() {
        if (Build.VERSION.SDK_INT != 28) return;
        Settings.preferences.edit().putBoolean("bubbles", true).commit();
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            assertFalse(root.findViewWithTag("bubbles").isEnabled());
            assertFalse(root.findViewWithTag("bubble_native").isEnabled());
            assertTrue(((RadioButton) root.findViewWithTag("bubble_native")).isChecked());
            assertNull(root.findViewWithTag("bubble_conversations"));
            assertFalse(Settings.enableBubbles());
        }
    }

    @Test public void backupRoundTripsModesAndLegacyOmissionKeepsTheSavedAuxiliaryChoice() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            for (boolean heads : new boolean[] {false, true}) {
                Settings.preferences.edit().putBoolean("bubbles", true).putBoolean(Settings.BUBBLE_CHAT_HEADS, heads).commit();
                String backup = ChoiceCodec.encode(Settings.preferences, Set.of("bubbles"));
                assertEquals(Map.of("paused", false, "bubbles", true, "bubble_chat_heads", heads), ChoiceCodec.parse(backup));
                Settings.preferences.edit().putBoolean("bubbles", false).putBoolean(Settings.BUBBLE_CHAT_HEADS, !heads).commit();
                importChoices(root, backup);
                assertEquals(heads ? "chat_heads" : "native", Settings.selectedBubbleMode());
            }
            importChoices(root, ChoiceCodec.LEGACY_HEADER + "\nbubbles=false\n");
            assertEquals("stock", Settings.selectedBubbleMode());
            assertTrue(Settings.preferences.getBoolean(Settings.BUBBLE_CHAT_HEADS, false));
            importChoices(root, ChoiceCodec.LEGACY_HEADER + "\nbubbles=true\n");
            assertEquals("chat_heads", Settings.selectedBubbleMode());
            Map<String, ?> before = Settings.preferences.getAll();
            importChoices(root, ChoiceCodec.HEADER + "\nbubbles=false\nbubble_chat_heads=maybe\n");
            assertEquals(before, Settings.preferences.getAll());
        }
    }

    @Test public void absentPatchDoesNotExportOrImportModePreferences() {
        Settings.preferences.edit().putBoolean(Settings.BUBBLE_CHAT_HEADS, true).commit();
        assertFalse(ChoiceCodec.encode(Settings.preferences, Set.of("stories")).contains("bubble_chat_heads"));
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            Settings.installed = Set.of("stories");
            importChoices(screen.get().getWindow().getDecorView(), ChoiceCodec.HEADER + "\nbubble_chat_heads=false\n");
            assertTrue(Settings.preferences.getBoolean(Settings.BUBBLE_CHAT_HEADS, false));
            assertTrue(ShadowToast.getTextOfLatestToast().contains("absent from this bundle"));
        }
    }

    @Test public void systemLinksAreGuardedAndNeverWriteNotificationPreferences() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            Map<String, ?> before = Settings.preferences.getAll();
            root.findViewWithTag("bubble_notifications").performClick();
            assertNull(Shadows.shadowOf(screen.get()).getNextStartedActivity());
            assertTrue(ShadowToast.getTextOfLatestToast().contains("app info"));
            for (String tag : new String[] {"bubble_notifications", "bubble_conversations"}) {
                if (root.findViewWithTag(tag) == null) continue;
                String action = "bubble_notifications".equals(tag) ? android.provider.Settings.ACTION_APP_NOTIFICATION_SETTINGS
                    : "android.settings.CONVERSATION_SETTINGS";
                Intent query = new Intent(action);
                ResolveInfo route = new ResolveInfo();
                route.activityInfo = new ActivityInfo();
                route.activityInfo.name = "Settings";
                route.activityInfo.packageName = "com.android.settings";
                Shadows.shadowOf(screen.get().getPackageManager()).addResolveInfoForIntent(query, java.util.List.of(route));
                root.findViewWithTag(tag).performClick();
                Intent started = Shadows.shadowOf(screen.get()).getNextStartedActivity();
                assertNotNull(started);
                assertEquals(action, started.getAction());
                assertEquals(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK, started.getFlags());
                if ("bubble_notifications".equals(tag)) assertEquals(screen.get().getPackageName(),
                    started.getStringExtra(android.provider.Settings.EXTRA_APP_PACKAGE));
            }
            assertEquals(before, Settings.preferences.getAll());
        }
    }

    @Test public void largeTextModesAndSettingsLinksStayReachableInBothThemes() {
        RuntimeEnvironment.setQualifiers("w320dp-h600dp-mdpi");
        RuntimeEnvironment.setFontScale(2f);
        for (boolean light : new boolean[] {false, true}) {
            Settings.preferences.edit().putBoolean("light", light).commit();
            try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
                View root = layout(screen.get().getWindow().getDecorView());
                ((EditText) root.findViewWithTag("find_control")).setText("bubble");
                layout(root);
                for (String tag : new String[] {"bubble_stock", "bubble_chat_heads", "bubble_native", "bubble_notifications", "bubble_conversations"}) {
                    View target = root.findViewWithTag(tag);
                    if (target == null) continue;
                    target.requestRectangleOnScreen(new Rect(0, 0, target.getWidth(), target.getHeight()), true);
                    layout(root);
                    Rect visible = new Rect();
                    assertTrue(tag, target.getGlobalVisibleRect(visible));
                    assertTrue(tag + " " + visible + " height=" + target.getHeight(), visible.height() >= 48);
                    assertTrue(tag, visible.left >= 0 && visible.right <= 320);
                    if (target instanceof RadioButton) {
                        AccessibilityNodeInfo node = target.createAccessibilityNodeInfo();
                        assertTrue(node.isCheckable());
                        assertTrue(node.isClickable());
                        assertEquals("android.widget.RadioButton", node.getClassName().toString());
                    }
                }
            }
        }
    }

    @Test public void bubblePermissionLinkTargetsThisAppAndContainsMissingRoutes() {
        for (boolean light : new boolean[] {false, true}) {
            Settings.preferences.edit().putBoolean("light", light).commit();
            try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
                View link = screen.get().getWindow().getDecorView().findViewWithTag("bubble_permissions");
                if (Build.VERSION.SDK_INT < 30) {
                    assertNull(link);
                    continue;
                }
                assertNotNull(link);
                Map<String, ?> before = Settings.preferences.getAll();
                String action = android.provider.Settings.ACTION_APP_NOTIFICATION_BUBBLE_SETTINGS;
                Intent query = new Intent(action);
                var manager = Shadows.shadowOf(screen.get().getPackageManager());
                manager.removeResolveInfosForIntent(query, "com.android.settings");
                link.performClick();
                assertNull(Shadows.shadowOf(screen.get()).getNextStartedActivity());
                assertTrue(ShadowToast.getTextOfLatestToast().contains("app info"));
                ResolveInfo route = new ResolveInfo();
                route.activityInfo = new ActivityInfo();
                route.activityInfo.name = "BubbleSettings";
                route.activityInfo.packageName = "com.android.settings";
                manager.addResolveInfoForIntent(query, java.util.List.of(route));
                link.performClick();
                Intent started = Shadows.shadowOf(screen.get()).getNextStartedActivity();
                assertNotNull(started);
                assertEquals(action, started.getAction());
                assertEquals(screen.get().getPackageName(),
                    started.getStringExtra(android.provider.Settings.EXTRA_APP_PACKAGE));
                assertEquals(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK, started.getFlags());
                assertEquals(before, Settings.preferences.getAll());
            }
        }
    }

    private static void importChoices(View root, String raw) {
        RuntimeEnvironment.getApplication().getSystemService(ClipboardManager.class).setPrimaryClip(ClipData.newPlainText("choices", raw));
        root.findViewWithTag("import_choices").performClick();
    }

    private static View layout(View root) {
        for (int pass = 0; pass < 2; pass++) {
            root.measure(View.MeasureSpec.makeMeasureSpec(320, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(600, View.MeasureSpec.EXACTLY));
            root.layout(0, 0, 320, 600);
            Shadows.shadowOf(Looper.getMainLooper()).idle();
        }
        return root;
    }
}
