/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.font;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNotSame;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;
import static org.robolectric.Shadows.shadowOf;

import android.graphics.Typeface;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.Arrays;
import java.util.List;

import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;

/**
 * The font swap: which families it touches, what it answers, and what the variation string of a
 * builder tells it. Whether it takes Facebook's own path while paused or before the context is
 * PausedHooksTest's and ColdStartHooksTest's to say.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class SystemFontTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** Every constant of Facebook 580's font family enum, as the fixture test reads them. */
    enum Family {
        AVENY_T_REGULAR, FACEBOOK_NARROW, FACEBOOK_SANS_HEAVY_ITALIC, OPTIMISTIC_DISPLAY_APP,
        OPTIMISTIC_DISPLAY_APP_MEDIUM, OPTIMISTIC_TEXT_APP_REGULAR, OPTIMISTIC_TEXT_APP_MEDIUM,
        OPTIMISTIC_TEXT_APP_BOLD, OPTIMISTIC_VARIABLE_APP_LITE, OPTIMISTIC_AI, OPTIMISTIC_AI_1_BETA,
        OPTIMISTIC_AI_2_BETA, OPTIMISTIC_AI_3_BETA, OPTIMISTIC_VF_APP_LITE, FACEBOOK_SANS_VARIABLE,
        OLD_STANDARD_TT_REGULAR, SF_UI_TEXT_REGULAR, AVENIR_NEXT_BOLD_ITALIC, MONTSERRAT_EXTRA_BOLD,
        MONTSERRAT_EXTRA_BOLD_ITALIC, OLD_STANDARD_TT_BOLD, OLD_STANDARD_TT_ITALIC, ROBOTO_LIGHT,
        ROBOTO_LIGHT_ITALIC, SFUI_TEXT_REGULAR, SFUI_TEXT_REGULAR_ITALIC, BARLOW_SEMI_BOLD,
        COURIER_PRIME_BOLD, MONTSERRAT_REGULAR, ROBOTO_MONO_REGULAR, ARAPEY_ITALIC, BUBBLE_REGULAR,
        SERIF_REGULAR
    }

    /** The families Meta draws its interface in. SystemFontFixtureTest pins the same twelve on both builds. */
    private static final List<Family> META = Arrays.asList(
            Family.OPTIMISTIC_DISPLAY_APP, Family.OPTIMISTIC_DISPLAY_APP_MEDIUM, Family.OPTIMISTIC_TEXT_APP_REGULAR,
            Family.OPTIMISTIC_TEXT_APP_MEDIUM, Family.OPTIMISTIC_TEXT_APP_BOLD, Family.OPTIMISTIC_VARIABLE_APP_LITE,
            Family.OPTIMISTIC_AI, Family.OPTIMISTIC_AI_1_BETA, Family.OPTIMISTIC_AI_2_BETA, Family.OPTIMISTIC_AI_3_BETA,
            Family.OPTIMISTIC_VF_APP_LITE, Family.FACEBOOK_SANS_VARIABLE);

    @After
    public void restore() {
        Settings.USE_SYSTEM_FONT.resetToDefault();
    }

    @Test
    public void onlyMetasInterfaceFamiliesAreSwapped() {
        for (Family family : Family.values()) {
            assertEquals(family.name(), META.contains(family), SystemFont.isInterfaceFamily(family.name()));
        }
        assertFalse(SystemFont.isInterfaceFamily(null));
        assertEquals(12, META.size());
    }

    @Test
    public void theRepositorysAnswerBecomesThePhonesFont() {
        Typeface swapped = SystemFont.systemize(Typeface.SERIF, Family.OPTIMISTIC_TEXT_APP_BOLD, 700);
        assertNotNull(swapped);
        assertNotSame(Typeface.SERIF, swapped);
        assertEquals("built from the phone's default family",
                shadowOf(Typeface.DEFAULT).getFontDescription().getFamilyName(),
                shadowOf(swapped).getFontDescription().getFamilyName());
        // A weight the caller left out is fine too: the built typeface's own is used.
        assertNotSame(Typeface.SERIF, SystemFont.systemize(Typeface.SERIF, Family.OPTIMISTIC_DISPLAY_APP, -1));
    }

    @Test
    public void aCreativeFamilyPassesThrough() {
        assertSame(Typeface.SERIF, SystemFont.systemize(Typeface.SERIF, Family.MONTSERRAT_REGULAR, 700));
        assertSame(Typeface.SERIF, SystemFont.systemize(Typeface.SERIF, Family.FACEBOOK_NARROW, -1));
        assertSame(Typeface.SERIF, SystemFont.systemize(Typeface.SERIF, Family.BUBBLE_REGULAR, -1));
    }

    @Test
    public void offTheSwitchLeavesMetasFont() {
        Settings.USE_SYSTEM_FONT.save(false);
        assertSame(Typeface.SERIF, SystemFont.systemize(Typeface.SERIF, Family.OPTIMISTIC_TEXT_APP_BOLD, 700));
        Object builder = new Object();
        SystemFont.rememberVariation(builder, "'wght' 700");
        assertSame(Typeface.SERIF, SystemFont.systemizeBuilt(Typeface.SERIF, builder));
    }

    @Test
    public void nothingIsMadeOfNothing() {
        assertNull(SystemFont.systemize(null, Family.OPTIMISTIC_TEXT_APP_BOLD, -1));
        assertSame(Typeface.SERIF, SystemFont.systemize(Typeface.SERIF, null, -1));
        assertNull(SystemFont.systemizeBuilt(null, new Object()));
        // A builder nobody told anything, or none at all, still gets the phone's font.
        assertNotSame(Typeface.SERIF, SystemFont.systemizeBuilt(Typeface.SERIF, new Object()));
        assertNotSame(Typeface.SERIF, SystemFont.systemizeBuilt(Typeface.SERIF, null));
        SystemFont.rememberVariation(null, "'wght' 700");
    }

    @Test
    public void variationSettingsGiveTheWeightAndSlant() {
        assertEquals(700, SystemFont.weightOf("'wght' 700", 400));
        assertEquals(650, SystemFont.weightOf("'wdth' 90, 'wght' 650.4", 400));
        assertEquals(700, SystemFont.weightOf("\"wght\" 700", 400));
        assertEquals(400, SystemFont.weightOf("'wdth' 90", 400));
        assertEquals(500, SystemFont.weightOf(null, 500));
        assertEquals(400, SystemFont.weightOf("'wght' 5000", 400));
        assertEquals(400, SystemFont.weightOf("'wght' 0", 400));
        assertTrue(SystemFont.italicOf("'ital' 1", false));
        assertTrue(SystemFont.italicOf("'slnt' -10", false));
        assertFalse(SystemFont.italicOf("'ital' 0", true));
        assertTrue(SystemFont.italicOf("'wght' 700", true));
        assertFalse(SystemFont.italicOf(null, false));
    }

    @Test
    public void aBuilderIsAnsweredWithWhatItWasTold() {
        Object builder = new Object();
        SystemFont.rememberVariation(builder, "'wght' 700");
        Typeface swapped = SystemFont.systemizeBuilt(Typeface.SERIF, builder);
        assertNotSame(Typeface.SERIF, swapped);
        assertEquals(shadowOf(Typeface.DEFAULT).getFontDescription().getFamilyName(),
                shadowOf(swapped).getFontDescription().getFamilyName());
        // An empty string forgets the builder's settings, as Facebook's setter ignores one.
        SystemFont.rememberVariation(builder, "");
        assertNotSame(Typeface.SERIF, SystemFont.systemizeBuilt(Typeface.SERIF, builder));
    }

    @Test
    public void outOfRangeWeightsFallBackToRegular() {
        assertNotNull(SystemFont.systemTypeface(0, false));
        assertNotNull(SystemFont.systemTypeface(1001, true));
        assertNotNull(SystemFont.systemTypeface(400, false));
    }
}
