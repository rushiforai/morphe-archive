/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.app.Application;
import android.content.res.Configuration;
import android.content.res.Resources;

import java.util.Locale;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;

import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.facebook.settings.SettingsEntry;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/**
 * Text size: the font scale Facebook's resources report is the phone's times the choice, held at
 * Android's largest scale above 100%, and 100%, a paused Facebook and a start before the settings
 * are ready leave the resources as Facebook has them. A choice made and then taken back puts the
 * phone's scale back, and only on resources this class changed.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class TextSizeTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @After
    public void restore() {
        TextSize.forgetForTests();
        PauseForTests.resume();
        Settings.TEXT_SIZE.resetToDefault();
    }

    private static Resources fresh() {
        return Robolectric.buildActivity(Activity.class).create().get().getResources();
    }

    private static float scaleOf(Resources resources) {
        return resources.getConfiguration().fontScale;
    }

    @Test
    public void everyChoiceIsAShareOfThePhonesScaleAndNeverPastTheLargestOne() {
        assertEquals(0.85f, TextSize.target(1f, TextSize.Scale.P85), 0.0001f);
        assertEquals(0.9f, TextSize.target(1f, TextSize.Scale.P90), 0.0001f);
        assertEquals(1f, TextSize.target(1f, TextSize.Scale.P100), 0.0001f);
        assertEquals(1.1f, TextSize.target(1f, TextSize.Scale.P110), 0.0001f);
        assertEquals(1.15f, TextSize.target(1f, TextSize.Scale.P115), 0.0001f);
        assertEquals(1.2f, TextSize.target(1f, TextSize.Scale.P120), 0.0001f);
        assertEquals(1.3f, TextSize.target(1f, TextSize.Scale.P130), 0.0001f);
        // A large phone setting: the product stops at 2.0 above 100%, and is the share below.
        assertEquals(2.0f, TextSize.target(1.7f, TextSize.Scale.P130), 0.0001f);
        assertEquals(1.7f * 0.85f, TextSize.target(1.7f, TextSize.Scale.P85), 0.0001f);
        // A phone already past 2.0 is never made smaller by a larger choice.
        assertEquals(2.3f, TextSize.target(2.3f, TextSize.Scale.P130), 0.0001f);
        assertEquals(2.3f, TextSize.target(2.3f, TextSize.Scale.P100), 0.0001f);
    }

    @Test
    public void theListHasTheSevenChoicesAndTheFileValuesRoundTrip() {
        assertEquals(7, TextSize.Scale.values().length);
        assertEquals(TextSize.Scale.P100, Settings.TEXT_SIZE.defaultValue);
        for (TextSize.Scale scale : TextSize.Scale.values()) {
            assertEquals(String.valueOf(scale.percent), scale.fileValue);
            assertSame(scale, TextSize.Scale.fromFile(scale.fileValue));
        }
        for (Object refused : new Object[]{"", "100%", "PERCENT_100", "95", 100, null, true}) {
            assertNull(String.valueOf(refused), TextSize.Scale.fromFile(refused));
        }
    }

    @Test
    public void aChoiceSetsTheScaleTheResourcesReportAndTheScaledDensity() {
        Resources resources = fresh();
        float density = resources.getDisplayMetrics().density;
        assertTrue(TextSize.apply(resources, 1f, TextSize.Scale.P130));
        assertEquals(1.3f, scaleOf(resources), 0.0001f);
        assertEquals("sp follows the scale: Facebook's Litho text reads scaledDensity",
                density * 1.3f, resources.getDisplayMetrics().scaledDensity, 0.001f);
        assertFalse("the same choice again changes nothing", TextSize.apply(resources, 1f, TextSize.Scale.P130));
        assertTrue(TextSize.apply(resources, 1f, TextSize.Scale.P85));
        assertEquals(0.85f, scaleOf(resources), 0.0001f);
    }

    @Test
    public void oneHundredPercentTouchesNothingUntilAChoiceWasAppliedAndThenPutsTheScaleBack() {
        TextSize.forgetForTests();
        Resources own = fresh();
        Configuration configuration = new Configuration(own.getConfiguration());
        configuration.fontScale = 1.15f;
        own.updateConfiguration(configuration, own.getDisplayMetrics());
        assertFalse(TextSize.apply(own, 1f, TextSize.Scale.P100));
        assertEquals("nothing was scaled here, so 100% keeps what Facebook had", 1.15f, scaleOf(own), 0.0001f);

        Resources scaled = fresh();
        assertTrue(TextSize.apply(scaled, 1f, TextSize.Scale.P120));
        assertEquals(1.2f, scaleOf(scaled), 0.0001f);
        assertTrue(TextSize.apply(scaled, 1f, TextSize.Scale.P100));
        assertEquals(1f, scaleOf(scaled), 0.0001f);
        assertFalse("and now it's stock again, so it's left alone", TextSize.apply(scaled, 1f, TextSize.Scale.P100));
    }

    @Test
    public void theActivityCallbackReadsTheSettingAndAPausedFacebookReadsStock() {
        assertFalse("100% is stock", TextSizeForTests.aStartScales());

        Settings.TEXT_SIZE.save(TextSize.Scale.P130);
        assertTrue("a chosen size scales a starting activity", TextSizeForTests.aStartScales());

        // Pause takes effect from the next start, which is a new process with nothing scaled yet.
        TextSize.forgetForTests();
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        assertFalse("a paused Facebook reads the default", TextSizeForTests.aStartScales());
    }

    @Test
    public void theApplicationStartScalesItsResourcesAndAConfigurationChangeKeepsThem() {
        Settings.TEXT_SIZE.save(TextSize.Scale.P115);
        Application app = RuntimeEnvironment.getApplication();
        float phone = Resources.getSystem().getConfiguration().fontScale;
        SettingsEntry.onApplicationCreate(app);
        assertEquals(phone * 1.15f, scaleOf(app.getResources()), 0.0001f);

        // The framework puts the phone's scale back on a configuration change, and the callback sets it again.
        Configuration reset = new Configuration(app.getResources().getConfiguration());
        reset.fontScale = phone;
        app.getResources().updateConfiguration(reset, app.getResources().getDisplayMetrics());
        app.onConfigurationChanged(reset);
        assertEquals(phone * 1.15f, scaleOf(app.getResources()), 0.0001f);
    }

    /**
     * A screen that handles its own configuration change gets its resources rebuilt at the phone's
     * scale on Android 12 and later, after the application's callback ran. Its own callback sets the
     * choice again, and its destroy takes that callback off.
     */
    @Test
    @Config(sdk = 34)
    public void aScreensOwnConfigurationChangeKeepsTheChosenSizeUntilItsDestroyed() {
        Settings.TEXT_SIZE.save(TextSize.Scale.P120);
        float phone = Resources.getSystem().getConfiguration().fontScale;
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).create()) {
            Activity activity = controller.get();
            Resources resources = activity.getResources();
            TextSize.activity(activity);
            TextSize.activity(activity);
            assertEquals(phone * 1.2f, scaleOf(resources), 0.0001f);

            Configuration rebuilt = new Configuration(resources.getConfiguration());
            rebuilt.fontScale = phone;
            resources.updateConfiguration(rebuilt, resources.getDisplayMetrics());
            activity.onConfigurationChanged(rebuilt);
            assertEquals("the screen's own change keeps the choice", phone * 1.2f, scaleOf(resources), 0.0001f);

            TextSize.destroyed(activity);
            resources.updateConfiguration(rebuilt, resources.getDisplayMetrics());
            activity.onConfigurationChanged(rebuilt);
            assertEquals("a destroyed screen's callback is off", phone, scaleOf(resources), 0.0001f);
        }
    }

    @Test
    public void eachChoiceReadsAsThePhoneWritesAPercentage() {
        Locale before = Locale.getDefault();
        try {
            Locale.setDefault(Locale.US);
            assertEquals("85%", TextSize.Scale.P85.label());
            assertEquals("130%", TextSize.Scale.P130.label());
            Locale.setDefault(Locale.GERMANY);
            assertEquals("85 %", TextSize.Scale.P85.label());
            Locale.setDefault(new Locale("tr", "TR"));
            assertEquals("%85", TextSize.Scale.P85.label());
        } finally {
            Locale.setDefault(before);
        }
    }
}
