package dev.jason.gboardpatches.extension.rambler;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.concurrent.atomic.AtomicInteger;

import org.junit.Test;

public class GboardRamblerDictionaryRuntimeTest {
    @Test
    public void unlocksTheVoiceCorrectionListAndSendsItsWords() {
        for (String flag : Arrays.asList(
                "enable_rambler_voice_correction_list_setting",
                "enable_rambler_voice_correction_list_import_export",
                "show_rambler_dict_settings",
                "show_clear_all_corrected_words_settings",
                "enable_user_contact_biasing",
                "enable_user_feature_cache")) {
            assertEquals(flag, Boolean.TRUE, GboardRamblerDictionaryRuntime.applyFlagValue(flag, Boolean.FALSE));
        }
    }

    @Test
    public void leavesTheIneffectiveOverrideToggleAndOtherFlagsAlone() {
        Object stock = Boolean.FALSE;
        assertSame(stock, GboardRamblerDictionaryRuntime.applyFlagValue("show_personal_dict_biasing_settings_toggle", stock));
        assertSame(stock, GboardRamblerDictionaryRuntime.applyFlagValue("enable_experimental_instructions_for_biasing", stock));
        Object text = "true";
        assertSame(text, GboardRamblerDictionaryRuntime.applyFlagValue("show_rambler_dict_settings", text));
    }

    @Test
    public void picksCleanNewContactNamesOnce() {
        LinkedHashSet<String> picked = GboardRamblerContactsRuntime.selectNewNames(Arrays.asList(
                "  Jan   de Vries ", "jan de vries", "Anouk", "anna@example.com", "+31 6 1234 5678", "", null,
                "Ömer Kaya", "Anouk"), new HashSet<>(Collections.singletonList("ANOUK")), 10);
        assertEquals(Arrays.asList("Jan de Vries", "Ömer Kaya"), Arrays.asList(picked.toArray(new String[0])));
    }

    @Test
    public void respectsTheLengthAndCountLimits() {
        StringBuilder longName = new StringBuilder();
        for (int i = 0; i <= GboardRamblerContactsRuntime.MAX_NAME_LENGTH; i++) {
            longName.append('a');
        }
        assertEquals(0, GboardRamblerContactsRuntime.selectNewNames(
                Collections.singletonList(longName.toString()), new HashSet<>(), 10).size());
        assertEquals(1, GboardRamblerContactsRuntime.selectNewNames(
                Arrays.asList("Bo", "Cas", "Daan"), new HashSet<>(), 1).size());
        assertEquals(0, GboardRamblerContactsRuntime.selectNewNames(
                Arrays.asList("Bo", "Cas"), new HashSet<>(), 0).size());
    }

    @Test
    public void keepsTryingUntilTheListIsReady() throws InterruptedException {
        AtomicInteger tries = new AtomicInteger();
        assertTrue(GboardRamblerContactsRuntime.addWhenReady(() -> tries.incrementAndGet() == 3, 5, 0));
        assertEquals(3, tries.get());
    }

    @Test
    public void reportsAListThatNeverBecomesReady() throws InterruptedException {
        AtomicInteger tries = new AtomicInteger();
        assertFalse(GboardRamblerContactsRuntime.addWhenReady(() -> {
            tries.incrementAndGet();
            return false;
        }, 4, 0));
        assertEquals(4, tries.get());
    }
}
