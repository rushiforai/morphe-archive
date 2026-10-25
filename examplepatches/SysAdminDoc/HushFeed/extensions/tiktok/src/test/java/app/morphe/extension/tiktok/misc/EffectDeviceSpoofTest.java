/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;

import android.preference.PreferenceActivity;
import android.preference.PreferenceScreen;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.settings.PausedProcess;
import app.morphe.extension.tiktok.SettingsContextRule;
import app.morphe.extension.tiktok.settings.Settings;
import app.morphe.extension.tiktok.settings.SettingsStatus;
import app.morphe.extension.tiktok.settings.preference.categories.ExtensionPreferenceCategory;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

/** The model the effect platform sends, with the switch off, on and paused (issue #176). */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
public class EffectDeviceSpoofTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    public static final class TestActivity extends PreferenceActivity {
        @Override public void onCreate(android.os.Bundle state) {
            setTheme(android.R.style.Theme_Material_NoActionBar);
            super.onCreate(state);
        }
    }

    @After public void tearDown() {
        PausedProcess.set(false);
        Settings.REPORT_NEWER_PHONE_TO_EFFECTS.resetToDefault();
    }

    @Test public void offTheRealModelGoesOut() {
        assertEquals(Boolean.FALSE, Settings.REPORT_NEWER_PHONE_TO_EFFECTS.defaultValue);
        assertEquals("Redmi A3", EffectDeviceSpoof.deviceType("Redmi A3"));
    }

    @Test public void onTheNewerModelGoesOut() {
        Settings.REPORT_NEWER_PHONE_TO_EFFECTS.save(true);
        assertEquals("SM-S928B", EffectDeviceSpoof.deviceType("Redmi A3"));
        Settings.REPORT_NEWER_PHONE_TO_EFFECTS.save(false);
        assertEquals("Redmi A3", EffectDeviceSpoof.deviceType("Redmi A3"));
    }

    @Test public void pausedTheRealModelGoesOutWithTheSwitchOn() {
        Settings.REPORT_NEWER_PHONE_TO_EFFECTS.save(true);
        PausedProcess.set(true);
        assertEquals("Redmi A3", EffectDeviceSpoof.deviceType("Redmi A3"));
    }

    @Test public void aMissingModelStaysMissingWhenOff() {
        assertNull(EffectDeviceSpoof.deviceType(null));
    }

    @Test public void theSwitchIsReachable() {
        try (var controller = Robolectric.buildActivity(TestActivity.class).setup()) {
            var activity = controller.get();
            Utils.setContext(activity);
            SettingsStatus.effectDeviceSpoofEnabled = true;
            PreferenceScreen screen = activity.getPreferenceManager().createPreferenceScreen(activity);
            new ExtensionPreferenceCategory(activity, screen);
            assertNotNull(screen.findPreference("report_newer_phone_to_effects"));
        } finally {
            SettingsStatus.effectDeviceSpoofEnabled = false;
        }
    }
}
