package io.github.ilikeadofai.vocacolle.extension.settings;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

public class DisplayLanguageTest {
    @Test
    public void usesStablePersistedValues() {
        assertEquals("system", DisplayLanguage.SYSTEM.persistedValue());
        assertEquals("ja", DisplayLanguage.JAPANESE.persistedValue());
        assertEquals("en", DisplayLanguage.ENGLISH.persistedValue());
        assertEquals("ko", DisplayLanguage.KOREAN.persistedValue());
    }

    @Test
    public void unknownOrMissingPersistedValuesFallBackToSystem() {
        assertEquals(DisplayLanguage.SYSTEM, DisplayLanguage.fromPersistedValue(null));
        assertEquals(DisplayLanguage.SYSTEM, DisplayLanguage.fromPersistedValue(""));
        assertEquals(DisplayLanguage.SYSTEM, DisplayLanguage.fromPersistedValue("fr"));
    }
}