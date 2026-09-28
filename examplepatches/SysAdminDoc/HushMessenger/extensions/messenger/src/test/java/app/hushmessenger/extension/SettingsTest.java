package app.hushmessenger.extension;

import android.net.Uri;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.ResolveInfo;
import android.widget.Switch;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.Shadows;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 35)
public class SettingsTest {
    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
    }

    @Test public void allControlsPreserveStockUntilEnabled() {
        assertFalse(Settings.hideStories());
        assertFalse(Settings.hideFacebook());
        assertFalse(Settings.hideMetaAi());
        assertFalse(Settings.suppressTyping());
        assertFalse(Settings.enableBubbles());
        assertTrue(Settings.showSubtabs(true));
        assertFalse(Settings.showSubtabs(false));
        assertTrue(Settings.preferExternalBrowser(true, Uri.parse("https://example.com")));
        assertFalse(Settings.preferExternalBrowser(false, Uri.parse("https://example.com")));
    }

    @Test public void switchesAreIndependentAndPausePreservesChoices() {
        Settings.preferences.edit().putBoolean("stories", true).putBoolean("typing", true).apply();
        assertTrue(Settings.hideStories());
        assertTrue(Settings.suppressTyping());
        assertFalse(Settings.hideFacebook());
        Settings.preferences.edit().putBoolean("paused", true).apply();
        assertFalse(Settings.hideStories());
        assertFalse(Settings.suppressTyping());
        assertTrue(Settings.preferences.getBoolean("stories", false));
        Settings.preferences.edit().putBoolean("paused", false).apply();
        assertTrue(Settings.hideStories());
    }

    @Test public void browserOverrideOnlyUsesStockPreferenceForWebSchemes() {
        Settings.preferences.edit().putBoolean("external_browser", true).apply();
        assertTrue(Settings.preferExternalBrowser(false, Uri.parse("HTTPS://example.com/a?signature=kept")));
        assertTrue(Settings.preferExternalBrowser(false, Uri.parse("http://example.com")));
        for (String url : new String[] {"fb-messenger://thread/1", "intent://example", "file:///a", "mailto:a@example.com", "relative/path"}) {
            assertFalse(Settings.preferExternalBrowser(false, Uri.parse(url)));
            assertTrue(Settings.preferExternalBrowser(true, Uri.parse(url)));
        }
        assertFalse(Settings.preferExternalBrowser(false, null));
    }

    @Test public void pauseRestoresBrowserAndSubtabsExactly() {
        Settings.preferences.edit().putBoolean("external_browser", true).putBoolean("subtabs", true).apply();
        assertFalse(Settings.showSubtabs(true));
        Settings.preferences.edit().putBoolean("paused", true).apply();
        assertTrue(Settings.showSubtabs(true));
        assertFalse(Settings.showSubtabs(false));
        assertFalse(Settings.preferExternalBrowser(false, Uri.parse("https://example.com")));
    }

    @Test @Config(sdk = 28) public void bubbleOverrideDoesNotPretendAndroidNineSupportsBubbles() {
        Settings.preferences.edit().putBoolean("bubbles", true).apply();
        assertFalse(Settings.enableBubbles());
    }

    @Test public void supportedAndroidCanOptInToBubbleEligibility() {
        Settings.preferences.edit().putBoolean("bubbles", true).apply();
        assertTrue(Settings.enableBubbles());
    }

    @Test public void anUninitializedSecondaryProcessKeepsStockBehavior() {
        Settings.preferences = null;
        assertFalse(Settings.hideStories());
        assertFalse(Settings.suppressTyping());
        assertTrue(Settings.showSubtabs(true));
    }

    @Test public void screenChangesPersistAndAreReadableByHooks() {
        try (var controller = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            Switch stories = controller.get().getWindow().getDecorView().findViewWithTag("stories");
            assertNotNull(stories);
            assertFalse(stories.isChecked());
            stories.performClick();
            assertTrue(Settings.hideStories());
            Switch pause = controller.get().getWindow().getDecorView().findViewWithTag("paused");
            pause.performClick();
            assertFalse(Settings.hideStories());
        }
        try (var controller = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            Switch stories = controller.get().getWindow().getDecorView().findViewWithTag("stories");
            assertTrue(stories.isChecked());
        }
    }

    @Test public void messengerButtonOpensItsLauncherTaskInsteadOfTheSettingsTask() {
        var application = RuntimeEnvironment.getApplication();
        Intent query = new Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_LAUNCHER)
            .setPackage(application.getPackageName());
        ResolveInfo settings = new ResolveInfo();
        settings.activityInfo = new ActivityInfo();
        settings.activityInfo.packageName = application.getPackageName();
        settings.activityInfo.name = SettingsActivity.class.getName();
        ResolveInfo messenger = new ResolveInfo();
        messenger.activityInfo = new ActivityInfo();
        messenger.activityInfo.packageName = application.getPackageName();
        messenger.activityInfo.name = "com.facebook.orca.auth.StartScreenActivity";
        Shadows.shadowOf(application.getPackageManager()).addResolveInfoForIntent(query,
            java.util.List.of(settings, messenger));
        try (var controller = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            controller.get().getWindow().getDecorView().findViewWithTag("open_messenger").performClick();
            Intent launched = Shadows.shadowOf(controller.get()).getNextStartedActivity();
            assertEquals(messenger.activityInfo.name, launched.getComponent().getClassName());
            assertEquals(application.getPackageName(), launched.getComponent().getPackageName());
            assertTrue((launched.getFlags() & Intent.FLAG_ACTIVITY_NEW_TASK) != 0);
            assertTrue((launched.getFlags() & Intent.FLAG_ACTIVITY_RESET_TASK_IF_NEEDED) != 0);
        }
    }
}
