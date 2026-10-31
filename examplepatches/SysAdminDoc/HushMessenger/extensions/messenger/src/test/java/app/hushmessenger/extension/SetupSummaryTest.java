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
        info.versionName = "582.0.0.61.92";
        info.setLongVersionCode((7L << 32) | 346415686L);
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
            assertTrue(text.contains("\nHost version: 582.0.0.61.92\n"));
            assertTrue(text.contains("\nHost version code: " + ((7L << 32) | 346415686L) + "\n"));
            // The extension alone was patched from nothing, and says so rather than reading Android's version code.
            assertTrue(text.contains("\nPatched from: unknown\n"));
            assertTrue(text.contains("\nAndroid API: " + Build.VERSION.SDK_INT + "\nPaused: false\nSafe mode: false\n"));
            assertTrue(text.contains("people: installed=true, selected=true, active=true,"));
            assertTrue(text.contains("stories: installed=false, selected=true, active=false,"));
            assertTrue(text.matches("(?s).*\nLate start: (not needed|\\d+ ms on [^\n]+)\nAnalytics stores: none\nFacebook caller checks: trusted=\\d+, signer_differs=\\d+, meta_signed_build=\\d+, not_family=\\d+, error=\\d+\n"));
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

    @Test public void analyticsStoresListNamesAndSizesOnly() throws Exception {
        java.io.File data = java.nio.file.Files.createTempDirectory("hush-data").toFile();
        try {
            assertEquals("none", SetupSummary.analyticsStores(data));
            java.io.File batches = new java.io.File(data, "files/xanalytics/batches");
            assertTrue(batches.mkdirs());
            java.nio.file.Files.write(new java.io.File(batches, "1.batch").toPath(), new byte[] {1, 2, 3});
            assertTrue(new java.io.File(data, "app_analytics").mkdirs());
            assertTrue(new java.io.File(data, "app_light_prefs").mkdirs());
            // A file named like a store isn't one, and a store's own subfolders aren't listed again.
            java.nio.file.Files.write(new java.io.File(data, "analytics.txt").toPath(), new byte[] {4});
            assertTrue(new java.io.File(data, "app_analytics/analytics_old").mkdirs());
            assertEquals("app_analytics 0 files 0 bytes, files/xanalytics 1 files 3 bytes", SetupSummary.analyticsStores(data));
            assertEquals("unreadable", SetupSummary.analyticsStores(new java.io.File(data, "missing")));
            // Finding the stores opens three folders (the data dir, files and app_light_prefs), so none are left to count with.
            assertEquals("app_analytics 0+ files 0+ bytes, files/xanalytics 0+ files 0+ bytes", SetupSummary.analyticsStores(data, 100, 3));
        } finally {
            try (var walk = java.nio.file.Files.walk(data.toPath())) {
                walk.sorted(java.util.Comparator.reverseOrder()).forEach(path -> path.toFile().delete());
            }
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

    @Test public void quickAccessNamesTheMenuTabAndTheLogoOnlyWhereTheyWerePatchedIn() throws Exception {
        for (String[] features : new String[][] {{"people"}, {"people", "menu_row"}, {"people", "menu_row", Settings.LOGO_LONG_PRESS}}) {
            installedFeatures(features);
            boolean menuRow = features.length > 1, logo = features.length > 2;
            try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
                View root = screen.get().getWindow().getDecorView();
                root.findViewWithTag("tab_app").performClick();
                String text = ((android.widget.TextView) root.findViewWithTag("access_help")).getText().toString();
                assertEquals(menuRow, text.contains("Messenger's Menu"));
                // The logo's long press comes with the same patch, recorded only where its handler was found.
                assertEquals(logo, text.contains("Messenger logo at the top of Chats"));
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
            assertEquals("On. Waiting for Messenger to use it", people.getText().toString());
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
            assertTrue(report.contains("Activity notes only show that a control ran. They don't prove it had a visible effect or protected your privacy.\n"));
            for (String[] control : SettingsActivity.CONTROLS)
                assertTrue(control[0], report.contains(", scope=" + control[2] + "\n"));
            assertTrue(report.matches("(?s).*hide_read_receipts: installed=true, selected=true, active=true, last_active=\\d+s ago, scope=.*"));
            assertTrue(report.contains("Marking it read yourself or replying marks it read and shows Seen"));
            assertTrue(report.contains("Group chats aren't tested. Messenger's own Read receipts setting under Privacy & safety"));
            assertTrue(report.contains("In encrypted chats the message stays in its notification instead. Group chats aren't tested."));
            assertTrue(report.contains("It doesn't add replay or saving."));
            assertTrue(report.contains("Android bubbles need Android 11 or newer, a supported account and notification permission."));
            assertTrue(report.contains("Search and community folders still show them."));
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
                    assertTrue(root.findViewWithTag("allow_screenshot").getContentDescription().toString().contains("It doesn't add replay or saving."));
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
            assertEquals("Stopped with an error just now. Copy setup on the App tab has details.", ((android.widget.TextView) root.findViewWithTag("active_avatar_stickers")).getText().toString());
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

    @Test public void anOlderUseCountsInHoursThenDays() throws Exception {
        installedFeatures("people");
        Settings.preferences.edit().putBoolean("people", true).commit();
        long now = System.currentTimeMillis();
        Settings.activeAt.put("people", now - 30L * 60 * 60 * 1000);
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            assertEquals("Used 30h ago", ((android.widget.TextView) screen.get().getWindow().getDecorView().findViewWithTag("active_people")).getText().toString());
        }
        Settings.activeAt.put("people", now - 3L * 24 * 60 * 60 * 1000 - 60_000);
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            assertEquals("Used 3d ago", ((android.widget.TextView) screen.get().getWindow().getDecorView().findViewWithTag("active_people")).getText().toString());
        }
    }

    /** A row's label column hides its children from TalkBack, so the buttons under a row must sit outside it. */
    @Test public void theLogAndFontButtonsAreReachableAndADisabledButtonLooksOff() throws Exception {
        installedFeatures(MessageLog.KEY, OwnFont.KEY);
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            for (String tag : new String[] {"message_log_view", "message_log_clear", "font_file"}) {
                View button = root.findViewWithTag(tag);
                assertNotNull(tag, button);
                for (android.view.ViewParent parent = button.getParent(); parent instanceof View; parent = parent.getParent()) {
                    assertNotEquals(tag, View.IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS, ((View) parent).getImportantForAccessibility());
                }
            }
            android.widget.Button view = root.findViewWithTag("message_log_view");
            int enabled = view.getCurrentTextColor();
            view.setEnabled(false);
            assertNotEquals("a disabled button needs its own color", enabled, view.getCurrentTextColor());
            view.setEnabled(true);
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

    /** #22: Hide the Menu row stays off until settings have opened from the long-press shortcut on this install. */
    @Test public void hideTheMenuRowWaitsForTheLongPressShortcut() throws Exception {
        installedFeatures("people", "menu_row", Settings.LOGO_LONG_PRESS);
        try {
            HostScreensTest.answerControlsShortcut(true);
            try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
                View root = screen.get().getWindow().getDecorView();
                root.findViewWithTag("tab_app").performClick();
                android.widget.Switch hide = root.findViewWithTag("hide_menu_row");
                assertFalse(hide.isEnabled());
                String reason = new SettingsText(screen.get()).format("menu_row_needs_shortcut");
                assertTrue(hide.getContentDescription().toString().endsWith(reason));
                assertEquals(new SettingsText(screen.get()).get("access_help_missing_menu"),
                    ((android.widget.TextView) root.findViewWithTag("access_help")).getText().toString());
                // The shortcut brings this same screen back, so it has to unlock without a new one.
                screen.pause();
                Settings.noteShortcutUsed();
                screen.resume();
                hide = root.findViewWithTag("hide_menu_row");
                assertTrue(hide.isEnabled());
                assertFalse(hide.getContentDescription().toString().contains(reason));
            }
            try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
                View root = screen.get().getWindow().getDecorView();
                root.findViewWithTag("tab_app").performClick();
                android.widget.Switch hide = root.findViewWithTag("hide_menu_row");
                assertTrue(hide.isEnabled());
                hide.setChecked(true);
                assertTrue(Settings.menuRowHidden());
                // The same screen stops pointing at the row as soon as it's hidden, but the logo still opens settings.
                org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();
                String hidden = ((android.widget.TextView) root.findViewWithTag("access_help")).getText().toString();
                assertEquals(new SettingsText(screen.get()).get("access_help_missing_logo"), hidden);
                assertFalse(hidden.contains("Menu tab"));
                assertTrue(hidden.contains("Messenger logo"));
            }
            // With the row gone, the App tab stops pointing at it.
            try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
                View root = screen.get().getWindow().getDecorView();
                root.findViewWithTag("tab_app").performClick();
                assertEquals(new SettingsText(screen.get()).get("access_help_missing_logo"),
                    ((android.widget.TextView) root.findViewWithTag("access_help")).getText().toString());
            }
            // A build where the logo's handler wasn't found never points at the logo, with the row hidden or showing.
            installedFeatures("people", "menu_row");
            try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
                View root = screen.get().getWindow().getDecorView();
                root.findViewWithTag("tab_app").performClick();
                SettingsText words = new SettingsText(screen.get());
                android.widget.TextView help = root.findViewWithTag("access_help");
                assertEquals(words.get("access_help_missing"), help.getText().toString());
                android.widget.Switch hide = root.findViewWithTag("hide_menu_row");
                assertTrue(hide.getContentDescription().toString().contains(words.format("hide_menu_row_help_without_logo").toString()));
                hide.setChecked(false);
                org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();
                assertEquals(words.get("access_help_missing_menu_without_logo"), help.getText().toString());
                assertFalse(help.getText().toString().contains("Messenger logo"));
            }
        } finally {
            HostScreens.controlsShortcut = null;
        }
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
            assertTrue(((android.widget.TextView) root.findViewWithTag("drawer_help")).getText().toString().contains("no settings icon to hide"));
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
                assertTrue(((android.widget.TextView) root.findViewWithTag("drawer_help")).getText().toString().contains("patch in Open settings from menu first"));
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
