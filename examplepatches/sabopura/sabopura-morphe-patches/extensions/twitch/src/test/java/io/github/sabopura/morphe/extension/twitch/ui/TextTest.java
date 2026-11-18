package io.github.sabopura.morphe.extension.twitch.ui;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class TextTest {
    @Test
    public void automaticFollowsTheAppsLanguage() {
        assertTrue(Text.japanese(Text.AUTO, "ja"));
        assertFalse(Text.japanese(Text.AUTO, "en"));
        assertFalse(Text.japanese(Text.AUTO, "ko"));
    }

    @Test
    public void aChosenLanguageWinsOverTheAppsLanguage() {
        assertTrue(Text.japanese(Text.JAPANESE, "en"));
        assertFalse(Text.japanese(Text.ENGLISH, "ja"));
    }

    @Test
    public void anUnknownStoredValueIsAutomatic() {
        assertTrue(Text.japanese("fr", "ja"));
        assertFalse(Text.japanese(null, "en"));
    }
}
