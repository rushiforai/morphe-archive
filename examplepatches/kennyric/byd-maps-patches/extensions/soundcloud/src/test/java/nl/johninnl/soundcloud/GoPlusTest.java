package nl.johninnl.soundcloud;

import static org.junit.Assert.*;

import org.junit.Test;

/** The three /configuration switches our Go patch forces on; everything else passes through. */
public final class GoPlusTest {
    @Test
    public void forcesTheThreeGoSwitchesOn() {
        assertTrue(GoPlus.feature("offline_sync", false));
        assertTrue(GoPlus.feature("no_audio_ads", false));
        assertTrue(GoPlus.feature("hq_audio", false));
        assertTrue(GoPlus.feature("offline_sync", true));
    }

    @Test
    public void keepsEveryOtherFeatureUntouched() {
        assertFalse(GoPlus.feature("development_menu", false));
        assertTrue(GoPlus.feature("spotlight", true));
        assertFalse(GoPlus.feature("content_reporting_dsa", false));
        assertFalse(GoPlus.feature("force_ad_testing", false));
        assertFalse(GoPlus.feature("internal_qa", false));
        assertFalse(GoPlus.feature("system_playlist_in_library", false));
    }

    @Test
    public void toleratesNullNamesLikeTheParserCanProduce() {
        assertFalse(GoPlus.feature(null, false));
        assertTrue(GoPlus.feature(null, true));
    }
}
