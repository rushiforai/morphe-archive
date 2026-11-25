/*
 * Ported from https://github.com/SysAdminDoc/Hushfacebook at e332bd2b3 (GPL-3.0),
 * modified for HushTumblr (Tumblr), 2026.
 *
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.ui;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.app.Application;
import android.content.res.Configuration;
import android.content.res.Resources;

import java.util.EnumSet;
import java.util.Locale;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;

import app.hushtumblr.extension.shared.SettingsContextRule;
import app.hushtumblr.extension.shared.settings.HushTumblrPause;
import app.hushtumblr.extension.shared.settings.PauseForTests;
import app.hushtumblr.extension.tumblr.settings.PatchFamily;
import app.hushtumblr.extension.tumblr.settings.PatchFamilyForTests;
import app.hushtumblr.extension.tumblr.settings.Settings;
import app.hushtumblr.extension.tumblr.settings.SettingsEntryForTests;
import app.hushtumblr.extension.tumblr.settings.TextSettings;

/**
 * #23 Text size: the font scale Tumblr's resources report is the phone's times the size picked,
 * held at Android's largest scale above 100%. The switch off, a paused HushTumblr, a build without
 * the patch and a start before the settings are ready leave the resources as Tumblr has them. A size
 * applied and then taken back puts the phone's scale back, and only on resources this class changed.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class TextSizeTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before
    public void aBuildWithThePatch() {
        TextSize.forgetForTests();
        PatchFamilyForTests.inBuild(EnumSet.allOf(PatchFamily.class));
        PatchFamilyForTests.capabilities(EnumSet.allOf(PatchFamily.Capability.class));
    }

    @After
    public void restore() {
        TextSize.forgetForTests();
        PauseForTests.resume();
        PatchFamilyForTests.inBuild(null);
        PatchFamilyForTests.capabilities(null);
        Settings.TEXT_SIZE.resetToDefault();
        TextSettings.TEXT_SIZE_PERCENT.resetToDefault();
    }

    private static Resources fresh() {
        return Robolectric.buildActivity(Activity.class).create().get().getResources();
    }

    private static float scaleOf(Resources resources) {
        return resources.getConfiguration().fontScale;
    }

    /** A Tumblr activity starting: true when the font scale its resources report changed. */
    private static boolean aStartScales() {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).create()) {
            Activity activity = controller.get();
            float before = activity.getResources().getConfiguration().fontScale;
            TextSize.activity(activity);
            return Math.abs(activity.getResources().getConfiguration().fontScale - before) > 0.0005f;
        }
    }

    private static void pick(String size) {
        Settings.TEXT_SIZE.save(true);
        TextSettings.TEXT_SIZE_PERCENT.save(size);
    }

    @Test
    public void everySizeIsAShareOfThePhonesScaleAndNeverPastTheLargestOne() {
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
        // A phone already past 2.0 is never made smaller by a larger size.
        assertEquals(2.3f, TextSize.target(2.3f, TextSize.Scale.P130), 0.0001f);
        assertEquals(2.3f, TextSize.target(2.3f, TextSize.Scale.P100), 0.0001f);
    }

    /** The row offers every size but 100%, which is the switch off, and the saved values round-trip. */
    @Test
    public void theRowOffersEverySizeButStockAndTheSavedValuesRoundTrip() {
        assertFalse(Settings.TEXT_SIZE.defaultValue);
        assertTrue("every screen draws at one size", Settings.TEXT_SIZE.rebootApp);
        assertTrue(TextSettings.TEXT_SIZE_PERCENT.rebootApp);
        assertEquals("115", TextSettings.TEXT_SIZE_PERCENT.defaultValue);
        assertEquals(TextSize.Scale.values().length - 1, TextSettings.TEXT_SIZES.size());
        for (TextSize.Scale scale : TextSize.Scale.values()) {
            assertEquals(String.valueOf(scale.percent), scale.fileValue);
            assertSame(scale, TextSize.Scale.fromFile(scale.fileValue));
            assertEquals(scale.fileValue, scale != TextSize.Scale.P100, TextSettings.TEXT_SIZES.contains(scale.fileValue));
        }
        for (Object refused : new Object[]{"", "100%", "P100", "95", 100, null, true}) {
            assertNull(String.valueOf(refused), TextSize.Scale.fromFile(refused));
        }
    }

    @Test
    public void aSizeSetsTheScaleTheResourcesReportAndTheScaledDensity() {
        Resources resources = fresh();
        float density = resources.getDisplayMetrics().density;
        assertTrue(TextSize.apply(resources, 1f, TextSize.Scale.P130));
        assertEquals(1.3f, scaleOf(resources), 0.0001f);
        assertEquals("sp follows the scale", density * 1.3f, resources.getDisplayMetrics().scaledDensity, 0.001f);
        assertFalse("the same size again changes nothing", TextSize.apply(resources, 1f, TextSize.Scale.P130));
        assertTrue(TextSize.apply(resources, 1f, TextSize.Scale.P85));
        assertEquals(0.85f, scaleOf(resources), 0.0001f);
    }

    @Test
    public void oneHundredPercentTouchesNothingUntilASizeWasAppliedAndThenPutsTheScaleBack() {
        Resources own = fresh();
        Configuration configuration = new Configuration(own.getConfiguration());
        configuration.fontScale = 1.15f;
        own.updateConfiguration(configuration, own.getDisplayMetrics());
        assertFalse(TextSize.apply(own, 1f, TextSize.Scale.P100));
        assertEquals("nothing was scaled here, so 100% keeps what Tumblr had", 1.15f, scaleOf(own), 0.0001f);

        Resources scaled = fresh();
        assertTrue(TextSize.apply(scaled, 1f, TextSize.Scale.P120));
        assertEquals(1.2f, scaleOf(scaled), 0.0001f);
        assertTrue(TextSize.apply(scaled, 1f, TextSize.Scale.P100));
        assertEquals(1f, scaleOf(scaled), 0.0001f);
        assertFalse("and now it's stock again, so it's left alone", TextSize.apply(scaled, 1f, TextSize.Scale.P100));
    }

    @Test
    public void theActivityCallbackReadsTheSwitchAndTheSize() {
        TextSettings.TEXT_SIZE_PERCENT.save("130");
        assertFalse("the switch off is stock, whatever size is saved", aStartScales());

        pick("130");
        assertTrue("a picked size scales a starting activity", aStartScales());

        // A size the row never offers reads as the default, 115%.
        TextSize.forgetForTests();
        TextSettings.TEXT_SIZE_PERCENT.save("95");
        assertEquals(TextSize.Scale.P115, TextSize.chosen());
    }

    @Test
    public void aPausedHushTumblrAndABuildWithoutThePatchReadStock() {
        pick("130");
        // Pause takes effect from the next start, which is a new process with nothing scaled yet.
        PauseForTests.pause(HushTumblrPause.Reason.SWITCH);
        assertFalse("a paused HushTumblr reads the default", aStartScales());
        PauseForTests.resume();

        TextSize.forgetForTests();
        PatchFamilyForTests.capabilities(EnumSet.noneOf(PatchFamily.Capability.class));
        assertEquals(TextSize.Scale.P100, TextSize.chosen());
        assertFalse("a build without the patch leaves the text alone", aStartScales());
    }

    @Test
    public void theApplicationStartScalesItsResourcesAndAConfigurationChangeKeepsThem() {
        pick("115");
        Application app = RuntimeEnvironment.getApplication();
        float phone = Resources.getSystem().getConfiguration().fontScale;
        SettingsEntryForTests.applicationCreated(app);
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
     * size again, and its destroy takes that callback off.
     */
    @Test
    @Config(sdk = 34)
    public void aScreensOwnConfigurationChangeKeepsThePickedSizeUntilItsDestroyed() {
        pick("120");
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
            assertEquals("the screen's own change keeps the size", phone * 1.2f, scaleOf(resources), 0.0001f);

            TextSize.destroyed(activity);
            resources.updateConfiguration(rebuilt, resources.getDisplayMetrics());
            activity.onConfigurationChanged(rebuilt);
            assertEquals("a destroyed screen's callback is off", phone, scaleOf(resources), 0.0001f);
        }
    }

    @Test
    public void eachSizeReadsAsThePhoneWritesAPercentage() {
        Locale before = Locale.getDefault();
        try {
            Locale.setDefault(Locale.US);
            assertEquals("85%", TextSize.Scale.P85.label());
            assertEquals("130%", TextSize.Scale.P130.label());
            Locale.setDefault(Locale.GERMANY);
            // German puts a no-break space before the sign.
            assertEquals("85" + (char) 0xA0 + "%", TextSize.Scale.P85.label());
            Locale.setDefault(new Locale("tr", "TR"));
            assertEquals("%85", TextSize.Scale.P85.label());
        } finally {
            Locale.setDefault(before);
        }
    }
}
