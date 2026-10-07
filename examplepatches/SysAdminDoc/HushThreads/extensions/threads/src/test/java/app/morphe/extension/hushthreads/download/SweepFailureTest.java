/*
 * Forked from https://github.com/SysAdminDoc/HushGram at 539b646 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 *
 * Modified for HushGram (Instagram), 2026.
 */
package app.morphe.extension.hushthreads.download;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.SharedPreferences;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

import app.morphe.extension.shared.SettingsContextRule;

/**
 * Every save runs the leftover sweep before it makes a file or a row. A sweep that throws, on a
 * storage or notification failure, used to throw out of the save that asked for it; the save goes
 * on and the failure is logged instead.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class SweepFailureTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @After
    public void restore() {
        SaveLeftovers.forgetSweepForTests();
    }

    @Test
    public void aSweepThatFailsDoesNotStopTheSaveThatAskedForIt() {
        SaveLeftovers.forgetSweepForTests();
        Context broken = new ContextWrapper(RuntimeEnvironment.getApplication()) {
            @Override
            public SharedPreferences getSharedPreferences(String name, int mode) {
                throw new IllegalStateException("storage unavailable");
            }
        };

        SaveLeftovers.sweepOnce(broken);
    }
}
