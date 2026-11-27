package dev.srwi.gintype.extension.thicctopbar;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

/**
 * Pure-JVM tests for right-side voice-button slot validation in {@link ThiccTopBarGboardReflector}.
 * Prevents the Jump-to-End arrow from hijacking the full-width center candidates container when
 * Gboard's Voice Typing button is disabled or absent.
 */
public class ThiccTopBarVoiceSlotTest {

    @Test
    public void acceptsNarrowRightSideActionButton() {
        // Standard 1080px header with a 132px (~44dp @ 3x) mic button docked at the right edge
        assertTrue(ThiccTopBarGboardReflector.isValidRightSideVoiceSlot(948, 1080, 1080));
        // Narrower 720px header with a 110px mic button on the right
        assertTrue(ThiccTopBarGboardReflector.isValidRightSideVoiceSlot(610, 720, 720));
        // Right-side button with small right margin
        assertTrue(ThiccTopBarGboardReflector.isValidRightSideVoiceSlot(900, 1040, 1080));
    }

    @Test
    public void rejectsCenterCandidatesContainerAndFullWidthViews() {
        // Center candidates container spanning between left toolbar (132px) and right edge (1080px)
        assertFalse(ThiccTopBarGboardReflector.isValidRightSideVoiceSlot(132, 1080, 1080));
        // Center candidates container spanning between left (132px) and right button (948px)
        assertFalse(ThiccTopBarGboardReflector.isValidRightSideVoiceSlot(132, 948, 1080));
        // Full-width container
        assertFalse(ThiccTopBarGboardReflector.isValidRightSideVoiceSlot(0, 1080, 1080));
        // Wide right-half container (> 1/3 of header width)
        assertFalse(ThiccTopBarGboardReflector.isValidRightSideVoiceSlot(600, 1080, 1080));
    }

    @Test
    public void rejectsLeftSideToolbarButtonAndInvalidBounds() {
        // Left-side Gboard toolbar/back button
        assertFalse(ThiccTopBarGboardReflector.isValidRightSideVoiceSlot(0, 132, 1080));
        // Button straddling the center midline
        assertFalse(ThiccTopBarGboardReflector.isValidRightSideVoiceSlot(480, 600, 1080));
        // Unlaid-out / zero-width / invalid bounds
        assertFalse(ThiccTopBarGboardReflector.isValidRightSideVoiceSlot(0, 0, 1080));
        assertFalse(ThiccTopBarGboardReflector.isValidRightSideVoiceSlot(948, 1080, 0));
        assertFalse(ThiccTopBarGboardReflector.isValidRightSideVoiceSlot(1000, 950, 1080));
    }

    @Test
    public void excludesCandidatesAndTopBarClassNames() {
        assertTrue(ThiccTopBarGboardReflector.isExcludedVoiceSlotClassName(
                "com.google.android.apps.inputmethod.libs.latin5.LatinFixedCountCandidatesHolderView"));
        assertTrue(ThiccTopBarGboardReflector.isExcludedVoiceSlotClassName(
                "dev.srwi.gintype.extension.thicctopbar.ThiccTopBarView"));
        assertTrue(ThiccTopBarGboardReflector.isExcludedVoiceSlotClassName(
                "dev.srwi.gintype.extension.thicctopbar.JumpToEndArrowView"));

        assertFalse(ThiccTopBarGboardReflector.isExcludedVoiceSlotClassName(
                "android.widget.FrameLayout"));
        assertFalse(ThiccTopBarGboardReflector.isExcludedVoiceSlotClassName(null));
    }
}
