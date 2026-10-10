package dev.twitchpatches.extension.emotes;

import org.junit.Test;
import static org.junit.Assert.*;

public final class EmotePolicyTest {
    @Test public void migrationPreservesDisabledPreferenceAndDefaultsAllProvidersOn() {
        assertEquals(7, EmotePolicy.restore(true, -1));
        assertEquals(0, EmotePolicy.restore(false, -1));
        assertEquals(2, EmotePolicy.restore(false, 2));
        assertEquals(7, EmotePolicy.restore(true, 15));
    }

    @Test public void providerChangesPreserveEveryOtherSelection() {
        for (int mask = 0; mask <= 7; mask++) {
            for (int provider = 0; provider < 3; provider++) {
                assertEquals((mask & (1 << provider)) != 0, EmotePolicy.includes(mask, provider));
                assertEquals(mask | (1 << provider), EmotePolicy.select(mask, provider, true));
                assertEquals(mask & ~(1 << provider), EmotePolicy.select(mask, provider, false));
            }
        }
        assertThrows(IllegalArgumentException.class, () -> EmotePolicy.select(7, 3, false));
    }
}
