package dev.srwi.gintype.extension.thicctopbar;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

/**
 * Pure-JVM tests for dictation detection heuristics in {@link ThiccTopBarGboardReflector}.
 */
public class ThiccTopBarDictationDetectorTest {

    @Test
    public void matchesActiveDictationHintTextWithoutFalsePositivesOnIdleMicButton() {
        assertTrue(ThiccTopBarGboardReflector.isDictationHintText("Speak now"));
        assertTrue(ThiccTopBarGboardReflector.isDictationHintText("Sprich jetzt"));
        assertTrue(ThiccTopBarGboardReflector.isDictationHintText("Listening…"));
        assertTrue(ThiccTopBarGboardReflector.isDictationHintText("Tap to stop voice typing"));
        assertTrue(ThiccTopBarGboardReflector.isDictationHintText("Spracheingabe beenden"));

        assertFalse(ThiccTopBarGboardReflector.isDictationHintText(null));
        assertFalse(ThiccTopBarGboardReflector.isDictationHintText(""));
        assertFalse(ThiccTopBarGboardReflector.isDictationHintText("Voice input"));
        assertFalse(ThiccTopBarGboardReflector.isDictationHintText("Spracheingabe"));
        assertFalse(ThiccTopBarGboardReflector.isDictationHintText("Microphone"));
    }

    @Test
    public void matchesDictationViewNamesWithoutFalsePositivesOnIdleVoiceKey() {
        assertTrue(ThiccTopBarGboardReflector.isDictationViewName("com.google.android.apps.inputmethod.libs.voiceime.DictationHeaderView"));
        assertTrue(ThiccTopBarGboardReflector.isDictationViewName("voice_ime_listening_indicator"));
        assertTrue(ThiccTopBarGboardReflector.isDictationViewName("dictation_waveform_view"));

        assertFalse(ThiccTopBarGboardReflector.isDictationViewName(null));
        assertFalse(ThiccTopBarGboardReflector.isDictationViewName("key_pos_header_voice"));
        assertFalse(ThiccTopBarGboardReflector.isDictationViewName("ThiccTopBarView"));
        assertFalse(ThiccTopBarGboardReflector.isDictationViewName("VoiceSettingsActivity"));
    }

    @Test
    public void matchesHeaderActionOverlayContainers() {
        assertTrue(ThiccTopBarGboardReflector.isHeaderActionOverlayName("key_pos_header_notice"));
        assertTrue(ThiccTopBarGboardReflector.isHeaderActionOverlayName("key_pos_header_action_overlay"));
        assertFalse(ThiccTopBarGboardReflector.isHeaderActionOverlayName("key_pos_header_voice"));
        assertFalse(ThiccTopBarGboardReflector.isHeaderActionOverlayName(null));
    }
}
