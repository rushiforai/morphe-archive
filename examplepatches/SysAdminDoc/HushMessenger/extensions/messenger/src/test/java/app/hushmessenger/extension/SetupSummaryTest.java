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
        CrashGuard.resetForTests();
        RuntimeEnvironment.getApplication().getSystemService(ClipboardManager.class).clearPrimaryClip();
    }

    private void installedFeatures(String... keys) throws Exception {
        var app = RuntimeEnvironment.getApplication();
        var info = app.getPackageManager().getPackageInfo(app.getPackageName(), PackageManager.GET_META_DATA);
        info.versionName = "580.0.0.49.91";
        info.setLongVersionCode((7L << 32) | 346013387L);
        info.applicationInfo.metaData = new Bundle();
        for (String key : keys) info.applicationInfo.metaData.putBoolean("hush.feature." + key, true);
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
            assertTrue(text.contains("\nHost package: " + activity.getPackageName() + "\n"));
            assertTrue(text.contains("\nHost version: 580.0.0.49.91\n"));
            assertTrue(text.contains("\nHost version code: " + ((7L << 32) | 346013387L) + "\n"));
            assertTrue(text.contains("\nAndroid API: " + Build.VERSION.SDK_INT + "\nPaused: false\nSafe mode: false\n"));
            assertTrue(text.contains("people: installed=true, selected=true, active=true,"));
            assertTrue(text.contains("stories: installed=false, selected=true, active=false,"));
            assertTrue(text.matches("(?s).*\nFacebook caller checks: trusted=\\d+, signer_differs=\\d+, meta_signed_build=\\d+, not_family=\\d+, error=\\d+\n"));
            assertEquals(33, text.split("\n").length);
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
