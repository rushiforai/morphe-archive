/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.extension.hushthreads.settings;

import static org.junit.Assert.assertEquals;

import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.settings.BaseSettings;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ThreadsSettingsRowTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @After public void forget() {
        ThreadsSettingsRow.icon = -1;
    }

    /**
     * A draw that comes before the context is set leaves the row out that once. It used to settle
     * the icon as missing for good and log that Threads had none of its icons.
     */
    @Test public void aDrawWithoutAContextLooksAgainNextTime() {
        SettingsContextRule.withoutContext(() -> ThreadsSettingsRow.add(new Object()));
        assertEquals("nothing settled without a context", -1, ThreadsSettingsRow.icon);

        ThreadsSettingsRow.add(new Object());
        assertEquals("with a context it's looked up, and this app has none of Threads' icons", 0, ThreadsSettingsRow.icon);
    }

    /** With its switch off the row isn't drawn: the draw stops before it looks for an icon (HushFacebook#146). */
    @Test public void theRowsSwitchOffLeavesItOutOfThreadsSettings() {
        BaseSettings.SETTINGS_ROW.save(false);
        ThreadsSettingsRow.add(new Object());
        assertEquals("the row was drawn with its switch off", -1, ThreadsSettingsRow.icon);

        BaseSettings.SETTINGS_ROW.save(true);
        ThreadsSettingsRow.add(new Object());
        assertEquals("on, the row is drawn again", 0, ThreadsSettingsRow.icon);
    }
}
