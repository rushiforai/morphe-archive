/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 *
 * Modified for HushGram (Instagram), 2026.
 */
package app.hushgram.extension.instagram.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.os.Build;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowLog;
import org.robolectric.util.ReflectionHelpers;

import app.hushgram.extension.shared.SettingsContextRule;

/**
 * Which devices skip Instagram's code protection step: an x86 device running Instagram's arm64
 * code translated, as an x86 emulator does (ABIs x86_64,arm64-v8a), and no other.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class TranslatedStartTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private final String[] abis = Build.SUPPORTED_ABIS;

    @Before
    public void start() {
        TranslatedStart.forget();
        ShadowLog.reset();
    }

    @After
    public void restoreAbis() {
        ReflectionHelpers.setStaticField(Build.class, "SUPPORTED_ABIS", abis);
        TranslatedStart.forget();
    }

    @Test
    public void onlyAnX86DeviceWithAnArmTranslatorCountsAsTranslated() {
        assertTrue(TranslatedStart.translated(new String[] {"x86_64", "arm64-v8a"}));
        assertTrue(TranslatedStart.translated(new String[] {"x86_64", "x86", "arm64-v8a", "armeabi-v7a", "armeabi"}));
        assertTrue(TranslatedStart.translated(new String[] {"x86", "armeabi-v7a"}));
        assertFalse("an x86 device with no translator", TranslatedStart.translated(new String[] {"x86_64", "x86"}));
        assertFalse("an arm phone", TranslatedStart.translated(new String[] {"arm64-v8a", "armeabi-v7a", "armeabi"}));
        assertFalse(TranslatedStart.translated(new String[0]));
        assertFalse(TranslatedStart.translated(null));
    }

    /** A translated start skips the step, and says so once, even before HushGram's settings are ready. */
    @Test
    public void aTranslatedStartSkipsTheStep() {
        ReflectionHelpers.setStaticField(Build.class, "SUPPORTED_ABIS", new String[] {"x86_64", "arm64-v8a"});

        int[] answers = new int[2];
        SettingsContextRule.withoutContext(() -> {
            answers[0] = TranslatedStart.protectCode();
            answers[1] = TranslatedStart.protectCode();
        });

        assertEquals(0, answers[0]);
        assertEquals(0, answers[1]);
        int said = 0;
        for (ShadowLog.LogItem item : ShadowLog.getLogs()) {
            if (item.msg.contains("skipping the code protection step")) said++;
        }
        assertEquals("the skip is logged once", 1, said);
    }

    @Test
    public void anArmPhoneMakesTheCall() {
        ReflectionHelpers.setStaticField(Build.class, "SUPPORTED_ABIS", new String[] {"arm64-v8a", "armeabi-v7a"});

        assertEquals(1, TranslatedStart.protectCode());
    }
}
