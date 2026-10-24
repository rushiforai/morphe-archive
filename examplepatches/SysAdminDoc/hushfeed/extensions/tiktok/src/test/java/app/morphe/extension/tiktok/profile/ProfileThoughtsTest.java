package app.morphe.extension.tiktok.profile;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.content.Context;
import android.view.View;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.EarlyApplication;
import app.morphe.extension.shared.settings.PausedProcess;
import app.morphe.extension.shared.settings.Setting;
import app.morphe.extension.tiktok.SettingsContextRule;
import app.morphe.extension.tiktok.settings.Settings;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

/** Hide Thoughts on profiles (#122): off by default, hides only with its switch, honours Pause. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
public class ProfileThoughtsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @After public void restore() {
        PausedProcess.set(false);
        HookStatus.clear();
        Settings.HIDE_PROFILE_THOUGHTS.resetToDefault();
    }

    @Test public void theBubbleIsLeftAloneUntilTheSwitchIsOn() {
        assertFalse(Settings.HIDE_PROFILE_THOUGHTS.defaultValue);
        View bubble = new View(RuntimeEnvironment.getApplication());
        assertFalse(ProfileThoughts.hideBubble(bubble));
        assertFalse(ProfileThoughts.hideOnProfiles());
        assertEquals(View.VISIBLE, bubble.getVisibility());
    }

    @Test public void withTheSwitchOnTheBubbleIsGoneAndTheSpaceStaysClosed() {
        Settings.HIDE_PROFILE_THOUGHTS.save(true);
        View bubble = new View(RuntimeEnvironment.getApplication());
        assertTrue(ProfileThoughts.hideBubble(bubble));
        assertEquals(View.GONE, bubble.getVisibility());
        assertTrue(ProfileThoughts.hideOnProfiles());
        // No bubble view on this profile: the answer still empties the field, and nothing throws.
        assertTrue(ProfileThoughts.hideBubble(null));
        assertTrue(ProfileThoughts.hideBubble(new Object()));
        String report = String.join(" ", HookStatus.report());
        assertTrue(report, report.contains("profile thoughts bubble") && report.contains("profile thoughts space"));
    }

    @Test public void pausedTheBubbleIsTikToks() {
        Settings.HIDE_PROFILE_THOUGHTS.save(true);
        PausedProcess.set(true);
        View bubble = new View(RuntimeEnvironment.getApplication());
        assertFalse(ProfileThoughts.hideBubble(bubble));
        assertFalse(ProfileThoughts.hideOnProfiles());
        assertEquals(View.VISIBLE, bubble.getVisibility());
    }

    /**
     * Turn on Thoughts (#186): TikTok can ask its Thoughts gates before Hushfeed's settings have a
     * context, and then the saved switch is read from the preferences file under the same key.
     */
    @Test public void theThoughtsSwitchIsReadBeforeTheSettingsContextToo() {
        Context application = RuntimeEnvironment.getApplication();
        assertEquals(ThoughtsGate.SWITCH_KEY, Settings.ENABLE_THOUGHTS.key);
        Settings.ENABLE_THOUGHTS.save(true);
        saveInTheFile(Settings.ENABLE_THOUGHTS.key, true);
        EarlyApplication.set(application);
        Utils.setContext(null);
        try {
            assertTrue(ThoughtsGate.isOn());
            EarlyApplication.set(null);
            assertFalse("no application yet answers off", ThoughtsGate.isOn());
        } finally {
            EarlyApplication.reset();
            Utils.setContext(application);
            Settings.ENABLE_THOUGHTS.save(false);
            saveInTheFile(Settings.ENABLE_THOUGHTS.key, false);
        }
    }

    /**
     * The early read opens the application's own preferences file, which a save through the
     * setting doesn't reach once another class has loaded Setting first, so write it as well.
     */
    private static void saveInTheFile(String key, boolean value) {
        RuntimeEnvironment.getApplication()
                .getSharedPreferences(Setting.PREFERENCES_NAME, Context.MODE_PRIVATE)
                .edit().putBoolean(key, value).commit();
    }
}
