/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.shared.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.content.Context;
import android.content.SharedPreferences;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

import java.util.regex.Pattern;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.settings.preference.LogBufferManager;

/**
 * A stored value of the wrong type under one of BaseSettings' own switches. Reading it reports the
 * conflict from inside BaseSettings' class setup, and Logger asked two switches that weren't
 * assigned yet, before its guard: the NullPointerException left the setup, and setContext threw
 * out of Facebook's start. Nothing writes such a value today; a hand-edited or restored
 * preferences file could.
 *
 * <p>This is the only class at sdk 32, so it runs in a sandbox of its own where nothing has loaded
 * BaseSettings yet, and it declares no SettingsContextRule, which would load it. Give another
 * class sdk 32 and this stops proving anything.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 32)
public class StoredSettingOfTheWrongTypeTest {

    @Test
    public void aWrongTypeUnderADebugSwitchIsClearedAndLoggedWhileTheSettingsLoad() {
        Context app = RuntimeEnvironment.getApplication();
        assertFalse("something set the context before this test", Utils.settingsReady());
        SharedPreferences stored = app.getSharedPreferences(Setting.PREFERENCES_NAME, Context.MODE_PRIVATE);
        // Debug logging is BaseSettings' first switch, so nothing after it is assigned yet when its
        // value is read. The log filter is its second, a string, stored here as a number.
        assertTrue(stored.edit()
                .putString(BaseSettingsKeys.DEBUG, "yes")
                .putInt(BaseSettingsKeys.DEBUG_LOG_FILTERS, 5)
                .commit());

        Utils.setContext(app);

        assertTrue("the start never got as far as deciding the pause", Utils.settingsReady());
        assertFalse(BaseSettings.DEBUG.get());
        assertEquals("all", BaseSettings.DEBUG_LOG_FILTERS.get());
        assertFalse("the conflicting debug value is still stored", stored.contains(BaseSettingsKeys.DEBUG));
        assertFalse("the conflicting filter is still stored", stored.contains(BaseSettingsKeys.DEBUG_LOG_FILTERS));
        // Each conflict is reported as an error line of its own, which is what the fix keeps: the
        // line is logged, only the stack and the toast that the unassigned switches decide are left off.
        String logged = LogBufferManager.snapshotForCrash(100_000);
        for (String key : new String[]{BaseSettingsKeys.DEBUG, BaseSettingsKeys.DEBUG_LOG_FILTERS}) {
            assertTrue(key + " wasn't reported:\n" + logged, Pattern.compile(
                    "(?m)\\| ERROR \\| Found conflicting preference: " + key + "$").matcher(logged).find());
        }
    }

    /**
     * The keys as literals: reading {@code BaseSettings.DEBUG.key} would load the class this test
     * needs to load itself, after the bad values are stored.
     */
    private static final class BaseSettingsKeys {
        static final String DEBUG = "morphe_debug";
        static final String DEBUG_LOG_FILTERS = "morphe_debug_log_filters";
    }
}
