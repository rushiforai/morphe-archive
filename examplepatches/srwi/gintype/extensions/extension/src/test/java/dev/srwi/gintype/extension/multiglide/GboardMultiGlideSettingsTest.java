package dev.srwi.gintype.extension.multiglide;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import android.content.SharedPreferences;
import dev.srwi.gintype.extension.settings.GboardPatchesSettingsContract;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.junit.After;
import org.junit.Test;

/**
 * Pure-JVM tests for {@link GboardMultiGlideSettings} and {@link GboardMultiGlideSettingsFeature}
 * validation and preference persistence.
 */
public class GboardMultiGlideSettingsTest {

    @Test
    public void sanitizesAndPersistsAutoSpaceAndDelayPreferences() {
        InMemorySharedPreferences prefs = new InMemorySharedPreferences();

        assertEquals(GboardMultiGlideSettings.DEFAULT_ENABLED, GboardMultiGlideSettings.readEnabled(prefs));
        assertEquals(GboardMultiGlideSettings.DEFAULT_AUTO_SPACE, GboardMultiGlideSettings.readAutoSpaceEnabled(prefs));
        assertEquals(GboardMultiGlideSettings.DEFAULT_AUTO_SPACE_DELAY_MS,
                GboardMultiGlideSettings.readAutoSpaceDelayMs(prefs));

        GboardMultiGlideSettings.ensureDefaults(prefs);
        assertTrue(prefs.contains(GboardMultiGlideSettings.PREF_KEY_ENABLED));
        assertTrue(prefs.contains(GboardMultiGlideSettings.PREF_KEY_AUTO_SPACE));
        assertTrue(prefs.contains(GboardMultiGlideSettings.PREF_KEY_AUTO_SPACE_DELAY_MS));

        assertTrue(GboardMultiGlideSettings.writeAutoSpaceEnabled(prefs, false));
        assertFalse(GboardMultiGlideSettings.readAutoSpaceEnabled(prefs));

        assertTrue(GboardMultiGlideSettings.writeAutoSpaceDelayMs(prefs, 650));
        assertEquals(650, GboardMultiGlideSettings.readAutoSpaceDelayMs(prefs));

        assertTrue(GboardMultiGlideSettings.writeAutoSpaceDelayMs(prefs, -50));
        assertEquals(0, GboardMultiGlideSettings.readAutoSpaceDelayMs(prefs));

        assertTrue(GboardMultiGlideSettings.writeAutoSpaceDelayMs(prefs, 9999));
        assertEquals(GboardMultiGlideSettings.MAX_AUTO_SPACE_DELAY_MS,
                GboardMultiGlideSettings.readAutoSpaceDelayMs(prefs));

        assertEquals(GboardMultiGlideSettings.DEFAULT_SINGLE_TOUCH_COMBINE_DELAY_MS,
                GboardMultiGlideSettings.readSingleTouchCombineDelayMs(prefs));
        assertEquals(GboardMultiGlideSettings.DEFAULT_TAP_TO_MULTIGLIDE_DELAY_MS,
                GboardMultiGlideSettings.readTapToMultiGlideDelayMs(prefs));
        assertEquals(GboardMultiGlideSettings.DEFAULT_SPACEBAR_TIMER_INDICATOR,
                GboardMultiGlideSettings.readSpacebarTimerIndicatorEnabled(prefs));
        assertEquals(GboardMultiGlideSettings.DEFAULT_WORD_READY_VIBRATION,
                GboardMultiGlideSettings.readWordReadyVibrationEnabled(prefs));
        assertTrue(prefs.contains(GboardMultiGlideSettings.PREF_KEY_SINGLE_TOUCH_COMBINE_DELAY_MS));
        assertTrue(GboardMultiGlideSettings.writeSingleTouchCombineDelayMs(prefs, 0));
        assertEquals(GboardMultiGlideSettings.MIN_SINGLE_TOUCH_COMBINE_DELAY_MS,
                GboardMultiGlideSettings.readSingleTouchCombineDelayMs(prefs));
        assertTrue(GboardMultiGlideSettings.writeSingleTouchCombineDelayMs(prefs, 900));
        assertEquals(GboardMultiGlideSettings.MAX_SINGLE_TOUCH_COMBINE_DELAY_MS,
                GboardMultiGlideSettings.readSingleTouchCombineDelayMs(prefs));

        assertEquals(GboardMultiGlideSettings.DEFAULT_TAP_TO_MULTIGLIDE_DELAY_MS,
                GboardMultiGlideSettings.readTapToMultiGlideDelayMs(prefs));
        assertTrue(prefs.contains(GboardMultiGlideSettings.PREF_KEY_TAP_TO_MULTIGLIDE_DELAY_MS));
        assertTrue(GboardMultiGlideSettings.writeTapToMultiGlideDelayMs(prefs, 0));
        assertEquals(GboardMultiGlideSettings.MIN_TAP_TO_MULTIGLIDE_DELAY_MS,
                GboardMultiGlideSettings.readTapToMultiGlideDelayMs(prefs));
        assertTrue(GboardMultiGlideSettings.writeTapToMultiGlideDelayMs(prefs, 5000));
        assertEquals(GboardMultiGlideSettings.MAX_TAP_TO_MULTIGLIDE_DELAY_MS,
                GboardMultiGlideSettings.readTapToMultiGlideDelayMs(prefs));
    }

    @Test
    public void parsesValidAndRejectsOutOfRangeDelayInputs() {
        assertEquals(0, GboardMultiGlideSettingsFeature.parseDelayMs("0", "err"));
        assertEquals(300, GboardMultiGlideSettingsFeature.parseDelayMs(" 300 ", "err"));
        assertEquals(2000, GboardMultiGlideSettingsFeature.parseDelayMs("2000", "err"));

        String[] invalid = {null, "", "   ", "-1", "2001", "abc", "12.5"};
        for (String s : invalid) {
            try {
                GboardMultiGlideSettingsFeature.parseDelayMs(s, "Invalid delay");
                fail("Expected IllegalArgumentException for input: " + s);
            } catch (IllegalArgumentException expected) {
                assertEquals("Invalid delay", expected.getMessage());
            }
        }
    }

    @After
    public void resetKineticaConstants() {
        KineticaConstants.applyRuntimeTuning(128, 0.25f, 3.75f, 0.50f);
    }

    @Test
    public void persistsAndSyncsDecoderTuningConstants() {
        InMemorySharedPreferences prefs = new InMemorySharedPreferences();

        assertEquals(GboardMultiGlideSettings.DEFAULT_BEAM_WIDTH,
                GboardMultiGlideSettings.readBeamWidth(prefs));
        assertEquals(GboardMultiGlideSettings.DEFAULT_FREQ_WEIGHT_FLOOR,
                GboardMultiGlideSettings.readFreqWeightFloor(prefs), 0.0001f);
        assertEquals(GboardMultiGlideSettings.DEFAULT_GEO_EXPONENT,
                GboardMultiGlideSettings.readGeoExponent(prefs), 0.0001f);
        assertEquals(GboardMultiGlideSettings.DEFAULT_BEAM_FREQ_WEIGHT,
                GboardMultiGlideSettings.readBeamFreqWeight(prefs), 0.0001f);

        GboardMultiGlideSettings.ensureDefaults(prefs);
        assertTrue(prefs.contains(GboardMultiGlideSettings.PREF_KEY_BEAM_WIDTH));
        assertTrue(prefs.contains(GboardMultiGlideSettings.PREF_KEY_FREQ_WEIGHT_FLOOR));
        assertTrue(prefs.contains(GboardMultiGlideSettings.PREF_KEY_GEO_EXPONENT));
        assertTrue(prefs.contains(GboardMultiGlideSettings.PREF_KEY_BEAM_FREQ_WEIGHT));

        assertTrue(GboardMultiGlideSettings.writeBeamWidth(prefs, 384));
        assertTrue(GboardMultiGlideSettings.writeFreqWeightFloor(prefs, 0.60f));
        assertTrue(GboardMultiGlideSettings.writeGeoExponent(prefs, 5.25f));
        assertTrue(GboardMultiGlideSettings.writeBeamFreqWeight(prefs, 0.20f));
        assertFalse(GboardMultiGlideSettings.writeGeoExponent(prefs, Float.NaN));

        assertEquals(384, GboardMultiGlideSettings.readBeamWidth(prefs));
        assertEquals(0.60f, GboardMultiGlideSettings.readFreqWeightFloor(prefs), 0.0001f);
        assertEquals(5.25f, GboardMultiGlideSettings.readGeoExponent(prefs), 0.0001f);
        assertEquals(0.20f, GboardMultiGlideSettings.readBeamFreqWeight(prefs), 0.0001f);

        GboardMultiGlideSettings.syncDecoderConstants(prefs);
        assertEquals(384, KineticaConstants.BEAM_WIDTH);
        assertEquals(900, KineticaConstants.BEAM_MAX_ATTEMPTS);
        assertEquals(0.60f, KineticaConstants.FREQ_WEIGHT_FLOOR, 0.0001f);
        assertEquals(5.25f, KineticaConstants.GEO_EXPONENT, 0.0001f);
        assertEquals(0.20f, KineticaConstants.BEAM_FREQ_WEIGHT, 0.0001f);
        assertEquals(1.0f, KineticaConstants.boostWeight(0.5f), 0.0001f);
        assertEquals(0.0f, KineticaConstants.boostWeight(1.5f), 0.0001f);

        assertEquals(300, KineticaConstants.beamMaxAttemptsForWidth(32));
        assertEquals(300, KineticaConstants.beamMaxAttemptsForWidth(64));
        assertEquals(300, KineticaConstants.beamMaxAttemptsForWidth(128));
        assertEquals(600, KineticaConstants.beamMaxAttemptsForWidth(256));
        assertEquals(900, KineticaConstants.beamMaxAttemptsForWidth(384));
        assertEquals(1200, KineticaConstants.beamMaxAttemptsForWidth(512));
    }

    @Test
    public void persistsAndResetsBackspaceModePreference() {
        InMemorySharedPreferences prefs = new InMemorySharedPreferences();

        assertEquals(GboardMultiGlideSettings.BACKSPACE_MODE_WHOLE_WORD,
                GboardMultiGlideSettings.readBackspaceMode(prefs));

        GboardMultiGlideSettings.ensureDefaults(prefs);
        assertTrue(prefs.contains(GboardMultiGlideSettings.PREF_KEY_BACKSPACE_MODE));
        assertEquals(GboardMultiGlideSettings.BACKSPACE_MODE_WHOLE_WORD,
                GboardMultiGlideSettings.readBackspaceMode(prefs));

        assertTrue(GboardMultiGlideSettings.writeBackspaceMode(
                prefs, GboardMultiGlideSettings.BACKSPACE_MODE_LAST_INPUT));
        assertEquals(GboardMultiGlideSettings.BACKSPACE_MODE_LAST_INPUT,
                GboardMultiGlideSettings.readBackspaceMode(prefs));

        assertTrue(GboardMultiGlideSettings.writeBackspaceMode(prefs, "invalid_mode"));
        assertEquals(GboardMultiGlideSettings.BACKSPACE_MODE_WHOLE_WORD,
                GboardMultiGlideSettings.readBackspaceMode(prefs));

        List<GboardPatchesSettingsContract.Row> gestureRows =
                GboardMultiGlideSettingsFeature.buildGestureRows(
                        "Enable MultiGlide", "Summary", true, v -> {},
                        "Combine single-finger strokes", "Summary", false, v -> {},
                        "Combine", "Summary", "150 ms", () -> {},
                        "Merge preceding taps", "Summary", true, v -> {},
                        "TapDelay", "Summary", "150 ms", () -> {},
                        "Keep short tapped words separate", "Summary", true, v -> {},
                        "Backspace behavior", "Summary", "Delete whole word (Default)", () -> {});
        assertEquals(7, gestureRows.size());
        assertFalse(gestureRows.get(2).isEnabled());
        assertTrue(gestureRows.get(4).isEnabled());
        assertTrue(gestureRows.get(5).isEnabled());
        assertEquals("Keep short tapped words separate", gestureRows.get(5).getTitle());
        assertEquals("Backspace behavior", gestureRows.get(6).getTitle());

        List<GboardPatchesSettingsContract.Row> tapMergeDisabledRows =
                GboardMultiGlideSettingsFeature.buildGestureRows(
                        "Enable MultiGlide", "Summary", true, v -> {},
                        "Combine single-finger strokes", "Summary", true, v -> {},
                        "Combine", "Summary", "150 ms", () -> {},
                        "Merge preceding taps", "Summary", false, v -> {},
                        "TapDelay", "Summary", "150 ms", () -> {},
                        "Keep short tapped words separate", "Summary", false, v -> {},
                        "Backspace behavior", "Summary", "Delete whole word (Default)", () -> {});
        assertFalse(tapMergeDisabledRows.get(4).isEnabled());
        assertFalse(tapMergeDisabledRows.get(5).isEnabled());

        assertTrue(GboardMultiGlideSettings.readSmartTapSwipeSplitEnabled(prefs));
        assertTrue(GboardMultiGlideSettings.writeSmartTapSwipeSplitEnabled(prefs, false));
        assertFalse(GboardMultiGlideSettings.readSmartTapSwipeSplitEnabled(prefs));

        assertTrue(GboardMultiGlideSettings.writeBackspaceMode(
                prefs, GboardMultiGlideSettings.BACKSPACE_MODE_LAST_INPUT));
        assertTrue(GboardMultiGlideSettings.resetToDefaults(prefs));
        assertTrue(GboardMultiGlideSettings.readSmartTapSwipeSplitEnabled(prefs));
        assertEquals(GboardMultiGlideSettings.BACKSPACE_MODE_WHOLE_WORD,
                GboardMultiGlideSettings.readBackspaceMode(prefs));
        assertEquals(2400, KineticaConstants.beamMaxAttemptsForWidth(1024));
        assertEquals(KineticaConstants.MAX_EMIT_ATTEMPTS,
                KineticaConstants.beamMaxAttemptsForWidth(4096));

        KineticaConstants.applyRuntimeTuning(1024, 0.25f, 3.75f, 0.50f);
        assertEquals(2400, KineticaConstants.BEAM_MAX_ATTEMPTS);
        KineticaConstants.applyRuntimeTuning(128, 0.25f, 3.75f, 0.50f);
        assertEquals(300, KineticaConstants.BEAM_MAX_ATTEMPTS);
    }

    @Test
    public void parsesTuningIntAndFloatInputsAndRejectsInvalidValues() {
        assertEquals(256, GboardMultiGlideSettingsFeature.parseIntInRange("256", 32, 1024, "err"));
        assertEquals(3.75f, GboardMultiGlideSettingsFeature.parseFloatInRange("3,75", 1.0f, 8.0f, "err"), 0.0001f);
        assertEquals(0.50f, GboardMultiGlideSettingsFeature.parseFloatInRange(" 0.5 ", 0.0f, 2.0f, "err"), 0.0001f);

        String[] badFloats = {null, "", "  ", "NaN", "Infinity", "-0.1", "2.1", "abc"};
        for (String s : badFloats) {
            try {
                GboardMultiGlideSettingsFeature.parseFloatInRange(s, 0.0f, 2.0f, "Invalid");
                fail("Expected IllegalArgumentException for: " + s);
            } catch (IllegalArgumentException expected) {
                assertEquals("Invalid", expected.getMessage());
            }
        }
    }

    @Test
    public void detectsWhenLeadingSpaceIsNeededBeforeMultiGlideWord() {
        assertTrue(GboardMultiGlideRuntime.shouldPrependLeadingSpace("Hallo wie geht es", true));
        assertTrue(GboardMultiGlideRuntime.shouldPrependLeadingSpace("Mi r", true));
        assertTrue(GboardMultiGlideRuntime.shouldPrependLeadingSpace("Nummer 42", true));
        assertTrue(GboardMultiGlideRuntime.shouldPrependLeadingSpace("Hallo.", true));
        assertTrue(GboardMultiGlideRuntime.shouldPrependLeadingSpace("Hallo,", true));
        assertTrue(GboardMultiGlideRuntime.shouldPrependLeadingSpace("Hallo!", true));
        assertTrue(GboardMultiGlideRuntime.shouldPrependLeadingSpace("Hallo?", true));
        assertTrue(GboardMultiGlideRuntime.shouldPrependLeadingSpace("Hallo;", true));
        assertTrue(GboardMultiGlideRuntime.shouldPrependLeadingSpace("Hallo:", true));

        assertFalse(GboardMultiGlideRuntime.shouldPrependLeadingSpace("Hallo wie geht es ", true));
        assertFalse(GboardMultiGlideRuntime.shouldPrependLeadingSpace("Hallo\n", true));
        assertFalse(GboardMultiGlideRuntime.shouldPrependLeadingSpace("(", true));
        assertFalse(GboardMultiGlideRuntime.shouldPrependLeadingSpace("\"", true));
        assertFalse(GboardMultiGlideRuntime.shouldPrependLeadingSpace("E-", true));
        assertFalse(GboardMultiGlideRuntime.shouldPrependLeadingSpace("a/", true));
        assertFalse(GboardMultiGlideRuntime.shouldPrependLeadingSpace("", true));
        assertFalse(GboardMultiGlideRuntime.shouldPrependLeadingSpace(null, true));
        assertFalse(GboardMultiGlideRuntime.shouldPrependLeadingSpace("Hallo wie geht es", false));
    }

    @Test
    public void defaultsTraceLoggingOffAndResetsAllSettingsToDefaults() {
        assertFalse(GboardMultiGlideSettings.DEFAULT_TRACE_LOGGING);
        assertTrue(GboardMultiGlideSettings.DEFAULT_SPACEBAR_TIMER_INDICATOR);

        InMemorySharedPreferences prefs = new InMemorySharedPreferences();
        GboardMultiGlideSettings.ensureDefaults(prefs);
        assertFalse(GboardMultiGlideSettings.readTraceLoggingEnabled(prefs));
        assertTrue(GboardMultiGlideSettings.readSpacebarTimerIndicatorEnabled(prefs));
        assertFalse(GboardMultiGlideSettings.readWordReadyVibrationEnabled(prefs));

        assertTrue(GboardMultiGlideSettings.writeEnabled(prefs, false));
        assertTrue(GboardMultiGlideSettings.writeAutoSpaceEnabled(prefs, false));
        assertTrue(GboardMultiGlideSettings.writeAutoSpaceDelayMs(prefs, 725));
        assertTrue(GboardMultiGlideSettings.writeSingleTouchCombineDelayMs(prefs, 260));
        assertTrue(GboardMultiGlideSettings.writeSpacebarTimerIndicatorEnabled(prefs, false));
        assertFalse(GboardMultiGlideSettings.readSpacebarTimerIndicatorEnabled(prefs));
        assertTrue(GboardMultiGlideSettings.writeWordReadyVibrationEnabled(prefs, true));
        assertTrue(GboardMultiGlideSettings.readWordReadyVibrationEnabled(prefs));
        assertTrue(GboardMultiGlideSettings.writeBeamWidth(prefs, 512));
        assertTrue(GboardMultiGlideSettings.writeFreqWeightFloor(prefs, 0.72f));
        assertTrue(GboardMultiGlideSettings.writeGeoExponent(prefs, 6.25f));
        assertTrue(GboardMultiGlideSettings.writeBeamFreqWeight(prefs, 1.35f));
        assertTrue(GboardMultiGlideSettings.writeTraceLoggingEnabled(prefs, true));
        assertTrue(GboardMultiGlideSettings.readTraceLoggingEnabled(prefs));

        assertTrue(GboardMultiGlideSettings.resetToDefaults(prefs));

        assertEquals(GboardMultiGlideSettings.DEFAULT_ENABLED, GboardMultiGlideSettings.readEnabled(prefs));
        assertEquals(GboardMultiGlideSettings.DEFAULT_AUTO_SPACE,
                GboardMultiGlideSettings.readAutoSpaceEnabled(prefs));
        assertEquals(GboardMultiGlideSettings.DEFAULT_AUTO_SPACE_DELAY_MS,
                GboardMultiGlideSettings.readAutoSpaceDelayMs(prefs));
        assertEquals(GboardMultiGlideSettings.DEFAULT_SINGLE_TOUCH_COMBINE_DELAY_MS,
                GboardMultiGlideSettings.readSingleTouchCombineDelayMs(prefs));
        assertEquals(GboardMultiGlideSettings.DEFAULT_TAP_TO_MULTIGLIDE_DELAY_MS,
                GboardMultiGlideSettings.readTapToMultiGlideDelayMs(prefs));
        assertEquals(GboardMultiGlideSettings.DEFAULT_SPACEBAR_TIMER_INDICATOR,
                GboardMultiGlideSettings.readSpacebarTimerIndicatorEnabled(prefs));
        assertEquals(GboardMultiGlideSettings.DEFAULT_WORD_READY_VIBRATION,
                GboardMultiGlideSettings.readWordReadyVibrationEnabled(prefs));
        assertEquals(GboardMultiGlideSettings.DEFAULT_BEAM_WIDTH,
                GboardMultiGlideSettings.readBeamWidth(prefs));
        assertEquals(GboardMultiGlideSettings.DEFAULT_FREQ_WEIGHT_FLOOR,
                GboardMultiGlideSettings.readFreqWeightFloor(prefs), 0.0001f);
        assertEquals(GboardMultiGlideSettings.DEFAULT_GEO_EXPONENT,
                GboardMultiGlideSettings.readGeoExponent(prefs), 0.0001f);
        assertEquals(GboardMultiGlideSettings.DEFAULT_BEAM_FREQ_WEIGHT,
                GboardMultiGlideSettings.readBeamFreqWeight(prefs), 0.0001f);
        assertEquals(GboardMultiGlideSettings.DEFAULT_TRACE_LOGGING,
                GboardMultiGlideSettings.readTraceLoggingEnabled(prefs));
        assertEquals(GboardMultiGlideSettings.DEFAULT_BEAM_WIDTH, KineticaConstants.BEAM_WIDTH);
    }

    @Test
    public void convertsSliderStepsRoundTripOnIntAndFloatDefaults() {
        int delayStep = GboardMultiGlideSettingsFeature.sliderStepForInt(
                GboardMultiGlideSettings.DEFAULT_AUTO_SPACE_DELAY_MS, 0, 2000, 25);
        assertEquals(300, GboardMultiGlideSettingsFeature.intValueForSliderStep(delayStep, 0, 2000, 25));

        int beamStep = GboardMultiGlideSettingsFeature.sliderStepForInt(
                GboardMultiGlideSettings.DEFAULT_BEAM_WIDTH, 32, 1024, 16);
        assertEquals(256, GboardMultiGlideSettingsFeature.intValueForSliderStep(beamStep, 32, 1024, 16));

        int floorStep = GboardMultiGlideSettingsFeature.sliderStepForFloat(
                GboardMultiGlideSettings.DEFAULT_FREQ_WEIGHT_FLOOR, 0.05f, 1.00f, 0.01f);
        assertEquals(0.25f, GboardMultiGlideSettingsFeature.floatValueForSliderStep(
                floorStep, 0.05f, 1.00f, 0.01f), 0.0001f);

        int geoStep = GboardMultiGlideSettingsFeature.sliderStepForFloat(
                GboardMultiGlideSettings.DEFAULT_GEO_EXPONENT, 1.00f, 8.00f, 0.05f);
        assertEquals(3.75f, GboardMultiGlideSettingsFeature.floatValueForSliderStep(
                geoStep, 1.00f, 8.00f, 0.05f), 0.0001f);

        int freqStep = GboardMultiGlideSettingsFeature.sliderStepForFloat(
                GboardMultiGlideSettings.DEFAULT_BEAM_FREQ_WEIGHT, 0.00f, 2.00f, 0.05f);
        assertEquals(0.50f, GboardMultiGlideSettingsFeature.floatValueForSliderStep(
                freqStep, 0.00f, 2.00f, 0.05f), 0.0001f);
    }

    @Test
    public void filtersTraceExportByPastMinutesAndIncludesReferencedGeometry() {
        long nowMs = 1_000_000_000L;
        String oldGeom = "{\"type\":\"geom\",\"ts\":" + (nowMs - 40 * 60_000L) + ",\"geom\":-42}";
        String oldWord = "{\"type\":\"word\",\"ts\":" + (nowMs - 30 * 60_000L) + ",\"geom\":-42,\"best\":\"alt\"}";
        String recentWord = "{\"type\":\"word\",\"ts\":" + (nowMs - 5 * 60_000L) + ",\"geom\":-42,\"best\":\"neu\"}";
        String recentCommit = "{\"type\":\"commit\",\"ts\":" + (nowMs - 4 * 60_000L) + ",\"word\":\"neu\"}";
        List<String> all = Arrays.asList(oldGeom, oldWord, recentWord, recentCommit);

        GboardMultiGlideTraceLogger.TraceExportResult last10 =
                GboardMultiGlideTraceLogger.buildTraceExport(all, 10, nowMs);
        assertEquals(3, last10.lineCount);
        assertEquals(oldGeom + "\n" + recentWord + "\n" + recentCommit, last10.content);

        GboardMultiGlideTraceLogger.TraceExportResult last1 =
                GboardMultiGlideTraceLogger.buildTraceExport(all, 1, nowMs);
        assertEquals(0, last1.lineCount);
        assertEquals("", last1.content);

        GboardMultiGlideTraceLogger.TraceExportResult exportAll =
                GboardMultiGlideTraceLogger.buildTraceExport(all, 0, nowMs);
        assertEquals(4, exportAll.lineCount);
    }

    @Test
    public void selectsDistinctMaterialDynamicAccentForMultiGlideTrail() {
        // Material You Tertiary color distinct from stock Primary blue -> pick Tertiary directly
        assertEquals(0xF2B8B5,
                GboardMultiGlideRuntime.chooseMultiGlideTrailColor(0xA8C7FA, 0xF2B8B5, 0xCCC2DC, true));

        // When Tertiary matches stock too closely, fall back to distinct Secondary
        assertEquals(0x80CBC4,
                GboardMultiGlideRuntime.chooseMultiGlideTrailColor(0xA8C7FA, 0xA8C7FA, 0x80CBC4, true));

        // When both Tertiary and Secondary are too close to stock, rotate accent hue
        int tooCloseFallback =
                GboardMultiGlideRuntime.chooseMultiGlideTrailColor(0xA8C7FA, 0xA8C7FA, 0xCCC2DC, true);
        assertTrue(tooCloseFallback != 0xA8C7FA && tooCloseFallback != 0xCCC2DC);

        // On Android <12 (no dynamic system_accent* resources), returns a distinct fallback accent
        int rotated = GboardMultiGlideRuntime.chooseMultiGlideTrailColor(0x4285F4, -1, -1, false);
        assertTrue(rotated != 0x4285F4);
        assertEquals(0xEFB8C8, GboardMultiGlideRuntime.chooseMultiGlideTrailColor(0xEEEEEE, -1, -1, true));
    }

    @Test
    public void disablesDependentAutoSpaceRowsWhenAutoSpaceIsOff() {
        List<dev.srwi.gintype.extension.settings.GboardPatchesSettingsContract.Row> withAutoSpace =
                GboardMultiGlideSettingsFeature.buildAutoSpaceRows(
                        true,
                        "Auto-space", "", true, v -> {},
                        "Space placement", "", "Before next word (Gboard style)", () -> {},
                        "Auto-space delay", "", "300 ms", () -> {},
                        "Spacebar timer indicator", "", false, v -> {},
                        "Word-ready vibration", "", false, v -> {});
        assertEquals(5, withAutoSpace.size());
        for (dev.srwi.gintype.extension.settings.GboardPatchesSettingsContract.Row row : withAutoSpace) {
            assertTrue(row.isEnabled());
        }

        List<dev.srwi.gintype.extension.settings.GboardPatchesSettingsContract.Row> withoutAutoSpace =
                GboardMultiGlideSettingsFeature.buildAutoSpaceRows(
                        true,
                        "Auto-space", "", false, v -> {},
                        "Space placement", "", "Before next word (Gboard style)", () -> {},
                        "Auto-space delay", "", "300 ms", () -> {},
                        "Spacebar timer indicator", "", false, v -> {},
                        "Word-ready vibration", "", false, v -> {});
        assertEquals(5, withoutAutoSpace.size());
        assertTrue(withoutAutoSpace.get(0).isEnabled());
        assertFalse(withoutAutoSpace.get(1).isEnabled());
        assertFalse(withoutAutoSpace.get(2).isEnabled());
        assertFalse(withoutAutoSpace.get(3).isEnabled());
        assertFalse(withoutAutoSpace.get(4).isEnabled());
    }

    @Test
    public void resetDecoderToDefaultsResetsOnlyKineticaParameters() {
        InMemorySharedPreferences prefs = new InMemorySharedPreferences();
        GboardMultiGlideSettings.ensureDefaults(prefs);

        assertTrue(GboardMultiGlideSettings.writeAutoSpaceEnabled(prefs, false));
        assertTrue(GboardMultiGlideSettings.writeAutoSpaceDelayMs(prefs, 500));
        assertTrue(GboardMultiGlideSettings.writeBackspaceMode(
                prefs, GboardMultiGlideSettings.BACKSPACE_MODE_LAST_INPUT));
        assertTrue(GboardMultiGlideSettings.writeBeamWidth(prefs, 512));
        assertTrue(GboardMultiGlideSettings.writeFreqWeightFloor(prefs, 0.50f));
        assertTrue(GboardMultiGlideSettings.writeGeoExponent(prefs, 5.00f));
        assertTrue(GboardMultiGlideSettings.writeBeamFreqWeight(prefs, 1.00f));

        assertTrue(GboardMultiGlideSettings.resetDecoderToDefaults(prefs));

        assertEquals(GboardMultiGlideSettings.DEFAULT_BEAM_WIDTH,
                GboardMultiGlideSettings.readBeamWidth(prefs));
        assertEquals(GboardMultiGlideSettings.DEFAULT_FREQ_WEIGHT_FLOOR,
                GboardMultiGlideSettings.readFreqWeightFloor(prefs), 0.0001f);
        assertEquals(GboardMultiGlideSettings.DEFAULT_GEO_EXPONENT,
                GboardMultiGlideSettings.readGeoExponent(prefs), 0.0001f);
        assertEquals(GboardMultiGlideSettings.DEFAULT_BEAM_FREQ_WEIGHT,
                GboardMultiGlideSettings.readBeamFreqWeight(prefs), 0.0001f);
        assertFalse(GboardMultiGlideSettings.readAutoSpaceEnabled(prefs));
        assertEquals(500, GboardMultiGlideSettings.readAutoSpaceDelayMs(prefs));
        assertEquals(GboardMultiGlideSettings.BACKSPACE_MODE_LAST_INPUT,
                GboardMultiGlideSettings.readBackspaceMode(prefs));
    }

    @Test
    public void migratesLegacyZeroTimeoutToDisabledToggle() {
        InMemorySharedPreferences prefs = new InMemorySharedPreferences();
        prefs.edit()
                .putInt(GboardMultiGlideSettings.PREF_KEY_SINGLE_TOUCH_COMBINE_DELAY_MS, 0)
                .putInt(GboardMultiGlideSettings.PREF_KEY_TAP_TO_MULTIGLIDE_DELAY_MS, 0)
                .commit();

        assertFalse(GboardMultiGlideSettings.readSingleTouchCombineEnabled(prefs));
        assertFalse(GboardMultiGlideSettings.readTapToMultiGlideEnabled(prefs));

        GboardMultiGlideSettings.ensureDefaults(prefs);
        assertFalse(GboardMultiGlideSettings.readSingleTouchCombineEnabled(prefs));
        assertEquals(GboardMultiGlideSettings.DEFAULT_SINGLE_TOUCH_COMBINE_DELAY_MS,
                GboardMultiGlideSettings.readSingleTouchCombineDelayMs(prefs));
        assertFalse(GboardMultiGlideSettings.readTapToMultiGlideEnabled(prefs));
        assertEquals(GboardMultiGlideSettings.DEFAULT_TAP_TO_MULTIGLIDE_DELAY_MS,
                GboardMultiGlideSettings.readTapToMultiGlideDelayMs(prefs));
    }

    @Test
    public void sanitizesAndResetsAutoSpaceBeforeWordPreference() {
        InMemorySharedPreferences prefs = new InMemorySharedPreferences();
        GboardMultiGlideSettings.ensureDefaults(prefs);
        assertTrue(GboardMultiGlideSettings.readAutoSpaceBeforeWord(prefs));

        assertTrue(GboardMultiGlideSettings.writeAutoSpaceBeforeWord(prefs, false));
        assertFalse(GboardMultiGlideSettings.readAutoSpaceBeforeWord(prefs));

        assertTrue(GboardMultiGlideSettings.resetToDefaults(prefs));
        assertTrue(GboardMultiGlideSettings.readAutoSpaceBeforeWord(prefs));
    }

    private static final class InMemorySharedPreferences implements SharedPreferences {
        private final Map<String, Object> data = new HashMap<>();

        @Override public Map<String, ?> getAll() { return new HashMap<>(data); }
        @Override public String getString(String key, String defValue) {
            Object v = data.get(key);
            return v == null ? defValue : (String) v;
        }
        @Override @SuppressWarnings("unchecked")
        public Set<String> getStringSet(String key, Set<String> defValues) {
            Object v = data.get(key);
            return v == null ? defValues : (Set<String>) v;
        }
        @Override public int getInt(String key, int defValue) {
            Object v = data.get(key);
            return v == null ? defValue : (Integer) v;
        }
        @Override public long getLong(String key, long defValue) {
            Object v = data.get(key);
            return v == null ? defValue : (Long) v;
        }
        @Override public float getFloat(String key, float defValue) {
            Object v = data.get(key);
            return v == null ? defValue : (Float) v;
        }
        @Override public boolean getBoolean(String key, boolean defValue) {
            Object v = data.get(key);
            return v == null ? defValue : (Boolean) v;
        }
        @Override public boolean contains(String key) { return data.containsKey(key); }
        @Override public Editor edit() { return new InMemoryEditor(); }
        @Override public void registerOnSharedPreferenceChangeListener(OnSharedPreferenceChangeListener listener) {}
        @Override public void unregisterOnSharedPreferenceChangeListener(OnSharedPreferenceChangeListener listener) {}

        private final class InMemoryEditor implements Editor {
            private final Map<String, Object> staged = new HashMap<>();
            private final Set<String> removals = new HashSet<>();
            private boolean clear;

            @Override public Editor putString(String key, String value) { staged.put(key, value); return this; }
            @Override public Editor putStringSet(String key, Set<String> values) { staged.put(key, values); return this; }
            @Override public Editor putInt(String key, int value) { staged.put(key, value); return this; }
            @Override public Editor putLong(String key, long value) { staged.put(key, value); return this; }
            @Override public Editor putFloat(String key, float value) { staged.put(key, value); return this; }
            @Override public Editor putBoolean(String key, boolean value) { staged.put(key, value); return this; }
            @Override public Editor remove(String key) { removals.add(key); return this; }
            @Override public Editor clear() { clear = true; return this; }

            @Override
            public boolean commit() {
                if (clear) data.clear();
                for (String k : removals) data.remove(k);
                data.putAll(staged);
                return true;
            }

            @Override
            public void apply() {
                commit();
            }
        }
    }
}
