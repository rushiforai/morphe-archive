package io.github.sabopura.morphe.extension.twitch.app;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

public class AmoledBlackTest {
    @Test
    public void darkGreysTurnBlack() {
        assertEquals(0xFF000000, AmoledBlack.black(0xFF0E0E10));
        assertEquals(0xFF000000, AmoledBlack.black(0xFF18181B));
    }

    @Test
    public void raisedGreyStaysApartFromBlack() {
        assertEquals(0xFF0B0B0D, AmoledBlack.black(0xFF1F1F23));
    }

    @Test
    public void otherColoursAreUntouched() {
        assertEquals(0xFF9146FF, AmoledBlack.black(0xFF9146FF));
        assertEquals(0x00000000, AmoledBlack.black(0x00000000));
    }
}
