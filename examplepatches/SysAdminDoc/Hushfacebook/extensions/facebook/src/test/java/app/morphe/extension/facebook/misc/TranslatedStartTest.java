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

import android.os.Build;

import org.junit.After;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.util.ReflectionHelpers;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

/**
 * Which devices skip Facebook's code protection at start: an x86 device running Facebook's arm64
 * code translated, as the emulator does (2026-09-30: ABIs x86_64,arm64-v8a), and no other.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class TranslatedStartTest {
    private final String[] abis = Build.SUPPORTED_ABIS;

    @After
    public void restoreAbis() {
        ReflectionHelpers.setStaticField(Build.class, "SUPPORTED_ABIS", abis);
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

    @Test
    public void aTranslatedStartAddsBothHalvesOfTheTaskAndKeepsFacebooksOwn() {
        ReflectionHelpers.setStaticField(Build.class, "SUPPORTED_ABIS", new String[] {"x86_64", "arm64-v8a"});

        Set<String> facebooks = Collections.singleton("SomeColdStartInit");
        Set<String> skipped = TranslatedStart.skipAppInits(facebooks);
        Set<String> expected = new HashSet<>(TranslatedStart.SKIPPED);
        expected.add("SomeColdStartInit");
        assertEquals(expected, skipped);
        assertEquals("Facebook's own set is left as it was", Collections.singleton("SomeColdStartInit"), facebooks);
        assertEquals(new HashSet<>(TranslatedStart.SKIPPED), TranslatedStart.skipAppInits(null));
    }

    @Test
    public void anyOtherStartGetsFacebooksSetBack() {
        ReflectionHelpers.setStaticField(Build.class, "SUPPORTED_ABIS", new String[] {"arm64-v8a", "armeabi-v7a"});

        Set<String> facebooks = Collections.emptySet();
        assertSame(facebooks, TranslatedStart.skipAppInits(facebooks));
        assertNull(TranslatedStart.skipAppInits(null));
    }
}
