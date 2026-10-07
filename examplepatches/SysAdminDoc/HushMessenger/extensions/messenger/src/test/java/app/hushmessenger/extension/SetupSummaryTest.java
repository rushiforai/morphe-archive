package app.hushmessenger.extension;

import android.content.ClipDescription;
import android.content.ClipboardManager;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.Bundle;
import android.view.View;
import java.util.Map;
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
@Config(sdk = {28, 36})
public class SetupSummaryTest {
    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.hookErrors.clear();
        Settings.activeAt.clear();
        CrashGuard.resetForTests();
        RuntimeEnvironment.getApplication().getSystemService(ClipboardManager.class).clearPrimaryClip();
    }

    private void installedFeatures(String... keys) throws Exception {
        var app = RuntimeEnvironment.getApplication();
        var info = app.getPackageManager().getPackageInfo(app.getPackageName(), PackageManager.GET_META_DATA | PackageManager.GET_PROVIDERS);
        info.versionName = "580.0.0.49.91";
        info.setLongVersionCode((7L << 32) | 346013387L);
        info.applicationInfo.metaData = new Bundle();
        for (String key : keys) info.applicationInfo.metaData.putBoolean("hush.feature." + key, true);
        // An installed bubbles fixture must also declare the host routes validated by the patch.
        for (String key : keys) if ("bubbles".equals(key)) info.applicationInfo.metaData.putBoolean("hush.native_bubble_routes", true);
        Shadows.shadowOf(app.getPackageManager()).installPackage(info);
    }

    @Test public void copiesOnlySetupFieldsAfterExplicitActionWithoutChangingPreferences() throws Exception {
        installedFeatures("people", "account-secret-metadata");
        Settings.preferences.edit().putBoolean("people", true).putBoolean("stories", true)
            .putString("account_id", "private-account-value").putString("token", "private-token-value")
            .putString("recovery_code", "private-recovery-value").putString("message", "private-message-value").commit();
        Map<String, ?> before = Settings.preferences.getAll();
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            SettingsActivity activity = screen.get();
            ClipboardManager clipboard = activity.getSystemService(ClipboardManager.class);
            View root = activity.getWindow().getDecorView();
            root.findViewWithTag("tab_app").performClick();
            assertFalse(clipboard.hasPrimaryClip());
            root.findViewWithTag("copy_setup").performClick();
            var clip = clipboard.getPrimaryClip();
            assertNotNull(clip);
            assertEquals(1, clip.getItemCount());
            assertTrue(clip.getDescription().hasMimeType(ClipDescription.MIMETYPE_TEXT_PLAIN));
            assertTrue(clip.getDescription().getExtras().getBoolean(ClipDescription.EXTRA_IS_SENSITIVE));
            String text = clip.getItemAt(0).getText().toString();
            assertTrue(text.startsWith("HushMessenger v" + BuildConfig.VERSION_NAME + "\n"));
            assertTrue(text.contains("\nHost package: " + activity.getPackageName() + "\nSettings provider: found\n"));
            assertTrue(text.contains("\nHost version: 580.0.0.49.91\n"));
            assertTrue(text.contains("\nHost version code: " + ((7L << 32) | 346013387L) + "\n"));
            assertTrue(text.contains("\nAndroid API: " + Build.VERSION.SDK_INT + "\nPaused: false\nSafe mode: false\n"));
            assertTrue(text.contains("people: installed=true, selected=true, active=true,"));
            assertTrue(text.contains("stories: installed=false, selected=true, active=false,"));
            assertTrue(text.matches("(?s).*\nFacebook caller checks: trusted=\\d+, signer_differs=\\d+, meta_signed_build=\\d+, not_family=\\d+, error=\\d+\n"));
            assertEquals(ExpectedTotals.SETUP_LINES, text.split("\n").length);
            assertFalse(text.contains("private-"));
            assertFalse(text.contains("account-secret"));
            assertFalse(text.contains("account_id"));
            assertFalse(text.contains("recovery_code"));
            assertEquals(before, Settings.preferences.getAll());
            assertNull(Shadows.shadowOf(activity).getNextStartedActivity());
            if (Build.VERSION.SDK_INT < 33) assertEquals("Setup copied", ShadowToast.getTextOfLatestToast());
            else assertNull(ShadowToast.getTextOfLatestToast());
        }
    }

    @Test public void emptyInstallationReportsSavedChoicesWithoutClaimingActiveControls() throws Exception {
        installedFeatures();
        Settings.preferences.edit().putBoolean("stories", true).commit();
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            assertNull(root.findViewWithTag("stories"));
            root.findViewWithTag("tab_app").performClick();
            root.findViewWithTag("copy_setup").performClick();
            String text = screen.get().getSystemService(ClipboardManager.class).getPrimaryClip().getItemAt(0).getText().toString();
            assertTrue(text.contains("stories: installed=false, selected=true, active=false,"));
            assertFalse(text.contains("installed=true"));
            assertFalse(text.contains("active=true"));
        }
    }

    @Test public void quickAccessNamesTheMenuTabOnlyWhenTheRowWasPatchedIn() throws Exception {
        for (boolean menuRow : new boolean[] {false, true}) {
            if (menuRow) installedFeatures("people", "menu_row"); else installedFeatures("people");
            try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
                View root = screen.get().getWindow().getDecorView();
                root.findViewWithTag("tab_app").performClick();
                String text = ((android.widget.TextView) root.findViewWithTag("access_help")).getText().toString();
                assertEquals(menuRow, text.contains("Menu tab"));
                assertTrue(text.contains("app drawer"));
                assertTrue(text.contains("Patch controls"));
            }
        }
    }

    @Test public void usageLabelShowsOnlyForSwitchesThatAreOnAndSaysWhetherTheyWereUsed() throws Exception {
        installedFeatures("people", "stories");
        Settings.preferences.edit().putBoolean("people", true).putBoolean("stories", false).commit();
        Settings.activeAt.clear();
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            android.widget.TextView people = root.findViewWithTag("active_people");
            android.widget.TextView stories = root.findViewWithTag("active_stories");
            assertEquals(View.VISIBLE, people.getVisibility());
            assertEquals("Nothing to change yet since restart", people.getText().toString());
            // An off switch has nothing to report, and turning it on shows its label.
            assertEquals(View.GONE, stories.getVisibility());
            ((android.widget.Switch) root.findViewWithTag("stories")).setChecked(true);
            assertEquals(View.VISIBLE, stories.getVisibility());
            ((android.widget.Switch) root.findViewWithTag("stories")).setChecked(false);
            assertEquals(View.GONE, stories.getVisibility());
        }
        assertTrue(Settings.enabled("people"));
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            android.widget.TextView people = screen.get().getWindow().getDecorView().findViewWithTag("active_people");
            assertEquals("Used just now", people.getText().toString());
        }
    }

    private String copiedSetup(View root) {
        root.findViewWithTag("tab_app").performClick();
        root.findViewWithTag("copy_setup").performClick();
        return RuntimeEnvironment.getApplication().getSystemService(ClipboardManager.class).getPrimaryClip().getItemAt(0).getText().toString();
    }

    @Test public void setupReusesControlScopesWithoutTreatingActivityAsVisibleProof() throws Exception {
        installedFeatures("hide_read_receipts", "keep_unsent", "allow_screenshot", "bubbles", "community_inbox");
        Settings.preferences.edit().putBoolean("hide_read_receipts", true).commit();
        Settings.activeAt.put("hide_read_receipts", System.currentTimeMillis());
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            String report = copiedSetup(screen.get().getWindow().getDecorView());
            assertTrue(report.contains("Activity records show a control ran. They don't verify its visible effect or privacy protection.\n"));
            for (String[] control : SettingsActivity.CONTROLS)
                assertTrue(control[0], report.contains(", scope=" + control[2] + "\n"));
            assertTrue(report.matches("(?s).*hide_read_receipts: installed=true, selected=true, active=true, last_active=\\d+s ago, scope=.*"));
            assertTrue(report.contains("Replying or switching this off may notify the sender."));
            assertTrue(report.contains("Activity records intercepted legacy unsends, not whether a chat is supported."));
            assertTrue(report.contains("This doesn't add replay or saving."));
            assertTrue(report.contains("Native Bubbles needs Android 11, account support and notification permissions."));
            assertTrue(report.contains("Search and community folders keep them. Delivery and unread counts stay unchanged."));
        }
    }

    @Test @Config(sdk = 36, qualifiers = "w411dp-h914dp-mdpi")
    @org.robolectric.annotation.GraphicsMode(org.robolectric.annotation.GraphicsMode.Mode.NATIVE)
    public void screenshotScopeRemainsVisibleAtLargeTextInBothThemes() throws Exception {
        installedFeatures("allow_screenshot");
        try {
            for (boolean light : new boolean[] {false, true}) for (float scale : new float[] {1f, 2f}) {
                RuntimeEnvironment.setFontScale(scale);
                Settings.preferences.edit().clear().putBoolean("light", light).commit();
                try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
                    View root = screen.get().getWindow().getDecorView();
                    ((android.widget.EditText) root.findViewWithTag("find_control")).setText("Allow screenshots");
                    View target = (View) root.findViewWithTag("allow_screenshot").getParent();
                    for (int pass = 0; pass < 3; pass++) {
                        root.measure(View.MeasureSpec.makeMeasureSpec(411, View.MeasureSpec.EXACTLY),
                            View.MeasureSpec.makeMeasureSpec(914, View.MeasureSpec.EXACTLY));
                        root.layout(0, 0, 411, 914);
                        if (pass == 1) target.requestRectangleOnScreen(new android.graphics.Rect(0, 0, target.getWidth(), target.getHeight()), true);
                        Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();
                    }
                    android.graphics.Rect visible = new android.graphics.Rect();
                    assertTrue(target.getGlobalVisibleRect(visible));
                    assertEquals(target.getHeight(), visible.height());
                    assertTrue(root.findViewWithTag("allow_screenshot").getContentDescription().toString().contains("This doesn't add replay or saving."));
                    String output = System.getenv("HUSH_SETTINGS_CAPTURES");
                    if (output != null) {
                        var directory = java.nio.file.Path.of(output);
                        java.nio.file.Files.createDirectories(directory);
                        var pixels = android.graphics.Bitmap.createBitmap(411, 914, android.graphics.Bitmap.Config.ARGB_8888);
                        root.draw(new android.graphics.Canvas(pixels));
                        try (var stream = java.nio.file.Files.newOutputStream(directory.resolve("scope-" + (light ? "light" : "dark") + "-" + (int) scale + ".png"))) {
                            assertTrue(pixels.compress(android.graphics.Bitmap.CompressFormat.PNG, 100, stream));
                        } finally { pixels.recycle(); }
                    }
                }
            }
        } finally { RuntimeEnvironment.setFontScale(1f); }
    }

    @Test public void aFailedHookShowsInCopySetupAndOnItsSwitchWithoutTheExceptionMessage() throws Exception {
        installedFeatures("avatar_stickers", "people");
        Settings.preferences.edit().putBoolean("avatar_stickers", true).putBoolean("people", true).commit();
        assertTrue(Settings.enabled("people"));
        // Messenger hands over a list that can't be changed, so removing the avatar tab throws.
        Settings.removeAvatarTabs(java.util.Collections.unmodifiableList(new java.util.ArrayList<>(java.util.List.of("tab"))));
        Settings.hookFailed("menu_row", "test", new IllegalStateException("private-chat-text"));
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            assertEquals("Stopped with an error just now", ((android.widget.TextView) root.findViewWithTag("active_avatar_stickers")).getText().toString());
            assertEquals("Used just now", ((android.widget.TextView) root.findViewWithTag("active_people")).getText().toString());
            String text = copiedSetup(root);
            String time = ", \\d{4}-\\d\\d-\\d\\dT\\d\\d:\\d\\d:\\d\\dZ\n";
            assertTrue(text, text.matches("(?s).*\nFacebook caller checks: [^\n]*\nHook errors:\n"
                + "avatar_stickers: java\\.lang\\.UnsupportedOperationException at Settings\\.removeAvatarTabs:\\d+" + time
                + "menu_row: java\\.lang\\.IllegalStateException at SetupSummaryTest\\.aFailedHookShowsInCopySetupAndOnItsSwitchWithoutTheExceptionMessage:\\d+" + time));
            assertEquals(ExpectedTotals.SETUP_LINES_WITH_ERRORS, text.split("\n").length);
            assertFalse(text.contains("private-"));
            assertFalse(Settings.preferences.getAll().toString().contains("private-"));
        }
        // A later use of the switch replaces the error on its usage line.
        Settings.activeAt.put("avatar_stickers", Settings.hookErrorAt("avatar_stickers") + 1);
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            assertEquals("Used just now", ((android.widget.TextView) root.findViewWithTag("active_avatar_stickers")).getText().toString());
        }
    }

    @Test public void aHookErrorOutlivesARestartAndARepeatDoesntRewriteIt() throws Exception {
        installedFeatures("avatar_stickers");
        Settings.preferences.edit().putBoolean("avatar_stickers", true).commit();
        java.util.List<Object> locked = java.util.Collections.unmodifiableList(new java.util.ArrayList<>(java.util.List.of("tab")));
        Settings.removeAvatarTabs(locked);
        String saved = Settings.preferences.getString("hook_error_avatar_stickers", null);
        assertNotNull(saved);
        Thread.sleep(5);
        Settings.removeAvatarTabs(locked);
        assertNotEquals(saved, Settings.hookErrors.get("avatar_stickers"));
        assertEquals(saved, Settings.preferences.getString("hook_error_avatar_stickers", null));
        // After a restart nothing has run yet, so the saved failure is what the switch reports.
        Settings.hookErrors.clear();
        Settings.activeAt.clear();
        Settings.initialize(RuntimeEnvironment.getApplication());
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            assertTrue(((android.widget.TextView) root.findViewWithTag("active_avatar_stickers")).getText().toString().startsWith("Stopped with an error"));
            assertTrue(copiedSetup(root).contains("\navatar_stickers: java.lang.UnsupportedOperationException at Settings.removeAvatarTabs:"));
        }
    }

    @Test public void continuousFailuresRefreshTheSavedTimestampAfterAMinute() {
        IllegalStateException failure = new IllegalStateException("private details");
        Settings.hookFailedPrivately("menu_row", "Failed", failure);
        String first = Settings.preferences.getString("hook_error_menu_row", "");
        // A minute has passed since the saved failure, but another draw just updated the in-memory copy.
        Settings.preferences.edit().putString("hook_error_menu_row", first.substring(0, first.lastIndexOf('|') + 1)
            + (Settings.hookErrorTime(first) - 60_001)).commit();
        Settings.hookFailedPrivately("menu_row", "Failed", failure);
        String refreshed = Settings.preferences.getString("hook_error_menu_row", "");
        assertEquals(Settings.hookErrors.get("menu_row"), refreshed);
        assertTrue(Settings.hookErrorTime(refreshed) >= Settings.hookErrorTime(first));
        Settings.hookErrors.clear();
        assertEquals(Settings.hookErrorTime(refreshed), Settings.hookErrorAt("menu_row"));
    }

    @Test public void hidingTheDrawerIconDisablesOnlyTheLauncherAlias() throws Exception {
        installedFeatures("people", "menu_row");
        var app = RuntimeEnvironment.getApplication();
        PackageManager packages = app.getPackageManager();
        var alias = new android.content.ComponentName(app.getPackageName(), SettingsActivity.DRAWER_ALIAS);
        var screenComponent = new android.content.ComponentName(app.getPackageName(), SettingsActivity.class.getName());
        Shadows.shadowOf(packages).addActivityIfNotPresent(alias);
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            root.findViewWithTag("tab_app").performClick();
            android.widget.Switch hide = root.findViewWithTag("hide_drawer_icon");
            assertFalse(hide.isChecked());
            assertNotEquals(PackageManager.COMPONENT_ENABLED_STATE_DISABLED, packages.getComponentEnabledSetting(alias));
            hide.setChecked(true);
            assertEquals(PackageManager.COMPONENT_ENABLED_STATE_DISABLED, packages.getComponentEnabledSetting(alias));
            assertNotEquals(PackageManager.COMPONENT_ENABLED_STATE_DISABLED, packages.getComponentEnabledSetting(screenComponent));
            assertTrue(Settings.preferences.getBoolean("hide_drawer_icon", false));
            hide.setChecked(false);
            assertNotEquals(PackageManager.COMPONENT_ENABLED_STATE_DISABLED, packages.getComponentEnabledSetting(alias));
        }
        // A saved choice is applied again when settings open or Messenger starts.
        Settings.preferences.edit().putBoolean("hide_drawer_icon", true).commit();
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            assertEquals(PackageManager.COMPONENT_ENABLED_STATE_DISABLED, packages.getComponentEnabledSetting(alias));
        }
        Settings.preferences.edit().putBoolean("hide_drawer_icon", false).commit();
        SettingsActivity.syncDrawerIcon(app);
        assertNotEquals(PackageManager.COMPONENT_ENABLED_STATE_DISABLED, packages.getComponentEnabledSetting(alias));
    }

    @Test public void drawerAliasExplainsThatUninstallingItRemovesMessenger() throws Exception {
        installedFeatures("people", "menu_row");
        var app = RuntimeEnvironment.getApplication();
        Shadows.shadowOf(app.getPackageManager()).addActivityIfNotPresent(
            new android.content.ComponentName(app.getPackageName(), SettingsActivity.DRAWER_ALIAS));
        for (boolean light : new boolean[] {false, true}) {
            Settings.preferences.edit().putBoolean("light", light).commit();
            try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
                android.widget.TextView help = screen.get().getWindow().getDecorView().findViewWithTag("shared_install_help");
                assertNotNull(help);
                assertTrue(help.getText().toString().contains("removes Messenger and its local data"));
                assertTrue(help.getText().toString().contains("Hide app drawer icon"));
                assertNotEquals(View.IMPORTANT_FOR_ACCESSIBILITY_NO, help.getImportantForAccessibility());
            }
        }
    }

    @Test public void aMissingAliasExplainsItsAbsenceAndSearchOpensTheAppPage() throws Exception {
        installedFeatures("people", "menu_row");
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            assertNull(root.findViewWithTag("hide_drawer_icon"));
            assertTrue(((android.widget.TextView) root.findViewWithTag("drawer_help")).getText().toString().contains("no settings launcher alias"));
            assertFalse(((android.widget.TextView) root.findViewWithTag("access_help")).getText().toString().contains("or from your app drawer"));
            android.widget.EditText search = root.findViewWithTag("find_control");
            search.setText("drawer icon");
            View link = root.findViewWithTag("find_drawer_icon");
            assertEquals(View.VISIBLE, link.getVisibility());
            link.performClick();
            assertEquals(View.VISIBLE, root.findViewWithTag("app_page").getVisibility());
            assertTrue(root.findViewWithTag("drawer_help").isShown());
            root.findViewWithTag("tab_controls").performClick();
            search.setText("stickers");
            assertEquals(View.GONE, link.getVisibility());
        }
    }

    @Test public void withoutTheMenuRowTheDrawerIconCantBeHiddenAndComesBack() throws Exception {
        installedFeatures("people");
        var app = RuntimeEnvironment.getApplication();
        PackageManager packages = app.getPackageManager();
        var alias = new android.content.ComponentName(app.getPackageName(), SettingsActivity.DRAWER_ALIAS);
        Shadows.shadowOf(packages).addActivityIfNotPresent(alias);
        packages.setComponentEnabledSetting(alias, PackageManager.COMPONENT_ENABLED_STATE_DISABLED, PackageManager.DONT_KILL_APP);
        Settings.initialize(app);
        Settings.preferences.edit().putBoolean("hide_drawer_icon", true).commit();
        try {
            SettingsActivity.syncDrawerIcon(app);
            assertNotEquals(PackageManager.COMPONENT_ENABLED_STATE_DISABLED, packages.getComponentEnabledSetting(alias));
            try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
                View root = screen.get().getWindow().getDecorView();
                root.findViewWithTag("tab_app").performClick();
                assertNull(root.findViewWithTag("hide_drawer_icon"));
                assertTrue(((android.widget.TextView) root.findViewWithTag("drawer_help")).getText().toString().contains("requires the HushMessenger row"));
            }
        } finally {
            Settings.preferences.edit().putBoolean("hide_drawer_icon", false).commit();
        }
    }

    @Test public void pauseAndAndroidEligibilityAreSeparateFromSavedChoices() throws Exception {
        installedFeatures("bubbles", "people");
        Settings.preferences.edit().putBoolean("bubbles", true).putBoolean("people", true).putBoolean("paused", true).commit();
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            ClipboardManager clipboard = screen.get().getSystemService(ClipboardManager.class);
            root.findViewWithTag("tab_app").performClick();
            root.findViewWithTag("copy_setup").performClick();
            String paused = clipboard.getPrimaryClip().getItemAt(0).getText().toString();
            assertTrue(paused.contains("\nPaused: true\nSafe mode: false\n"));
            assertTrue(paused.contains("bubbles: installed=true, selected=true, active=false,"));
            assertTrue(paused.contains("people: installed=true, selected=true, active=false,"));
            assertFalse(paused.contains("active=true"));
            Settings.preferences.edit().putBoolean("paused", false).commit();
            root.findViewWithTag("copy_setup").performClick();
            String resumed = clipboard.getPrimaryClip().getItemAt(0).getText().toString();
            assertTrue(resumed.contains("people: installed=true, selected=true, active=true,"));
            assertTrue(resumed.contains("bubbles: installed=true, selected=true, active=" + (Build.VERSION.SDK_INT >= 30) + ","));
        }
    }
}
