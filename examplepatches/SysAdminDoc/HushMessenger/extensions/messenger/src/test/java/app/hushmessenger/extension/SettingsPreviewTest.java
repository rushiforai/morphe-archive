package app.hushmessenger.extension;

import android.content.ClipboardManager;
import android.content.Intent;
import android.view.View;
import android.widget.TextView;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class SettingsPreviewTest {
    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        CrashGuard.resetForTests();
    }

    @Test public void previewDisclosesItsLimitsOnBothPagesAndNeverReportsActiveHostControls() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            assertEquals("HushMessenger UI preview", screen.get().getTitle().toString());
            TextView notice = root.findViewWithTag("preview_notice");
            assertNotNull(notice);
            assertEquals("UI preview. These switches don't change Messenger.", notice.getText().toString());
            root.findViewWithTag("people").performClick();
            assertTrue(Settings.preferences.getBoolean("people", false));
            root.findViewWithTag("tab_app").performClick();
            assertEquals(View.VISIBLE, notice.getVisibility());
            root.findViewWithTag("copy_setup").performClick();
            String summary = screen.get().getSystemService(ClipboardManager.class)
                .getPrimaryClip().getItemAt(0).getText().toString();
            assertTrue(summary.contains("Mode: UI preview. Does not change Messenger.\n"));
            // The mode belongs to the header, not the list of controls below it.
            assertTrue(summary.contains("\nPaused: false\nSafe mode: false\nMode: UI preview. Does not change Messenger.\n"
                + "Activity records show a control ran. They don't verify its visible effect or privacy protection.\nControls:\n"));
            assertTrue(summary.contains("people: installed=true, selected=true, active=false,"));
            assertFalse(summary.contains("active=true"));
        }
    }

    @Test public void standalonePreviewHasNoAppDrawerEntryThatCouldBeMistakenForEmbeddedSettings() {
        var application = RuntimeEnvironment.getApplication();
        assertEquals("HushMessenger UI preview", application.getApplicationInfo()
            .loadLabel(application.getPackageManager()).toString());
        Intent launch = new Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_LAUNCHER)
            .setPackage(application.getPackageName());
        assertTrue(application.getPackageManager().queryIntentActivities(launch, 0).isEmpty());
    }
}
