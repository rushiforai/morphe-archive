/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.media;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.content.Context;
import android.content.SharedPreferences;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.Utils;

/**
 * A saved point keeps a video's ID, so it must go once it's 30 days old whether or not Resume long
 * videos is still on. Points were only aged when one was read, and nothing is read with the switch
 * off, so turning it off left up to 200 video IDs stored for good.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ResumePointsAgeTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private SharedPreferences file;

    @Before
    public void start() {
        ResumePlayback.forget();
        file = RuntimeEnvironment.getApplication().getSharedPreferences(ResumePoints.FILE, Context.MODE_PRIVATE);
        file.edit().clear().commit();
    }

    @After
    public void restore() {
        Settings.RESUME_LONG_VIDEOS.resetToDefault();
        ResumePlayback.forget();
        file.edit().clear().commit();
    }

    @Test
    public void facebooksStartDropsPointsPastTheirAgeWithTheSwitchOff() throws Exception {
        Settings.RESUME_LONG_VIDEOS.save(false);
        long now = System.currentTimeMillis();
        file.edit()
                .putString("old", ResumePoints.encode(90_000, now - ResumePoints.KEEP_MS - 60_000))
                .putString("recent", ResumePoints.encode(90_000, now - 60_000))
                .commit();

        ResumePlayback.onFacebookStart();
        Utils.awaitBackgroundTasksForTests();

        assertFalse("a point past its age outlived the switch", file.contains("old"));
        assertTrue("a point still within its age went too", file.contains("recent"));
    }
}
