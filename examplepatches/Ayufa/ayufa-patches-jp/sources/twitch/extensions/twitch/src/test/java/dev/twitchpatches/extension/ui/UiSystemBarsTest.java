package dev.twitchpatches.extension.ui;

import org.junit.Test;
import static org.junit.Assert.*;

public class UiSystemBarsTest {
    @Test public void disabledPolicyPreservesHostFlags() {
        UiSystemBars policy = new UiSystemBars();
        assertEquals(0x127, policy.apply(0x127, 0));
        assertEquals(0x80, policy.apply(0x80, 0));
    }

    @Test public void togglesRestoreOwnedBitsAndPreserveOtherChanges() {
        UiSystemBars policy = new UiSystemBars();
        assertEquals(0x17, policy.apply(0x11, 0x6));
        assertEquals(0x11, policy.hostFlags(0x17));
        assertEquals(0x97, policy.apply(0x97, 0x6));
        assertEquals(0x99, policy.apply(0x97, 0x8));
        assertEquals(0x91, policy.apply(0x99, 0));
    }

    @Test public void leavingFullscreenDoesNotRestoreFlagsTheHostAlreadyCleared() {
        UiSystemBars policy = new UiSystemBars();
        assertEquals(0x7, policy.apply(0x3, 0x6));
        assertEquals(0x3, policy.hostFlags(0x7));
        assertEquals(0x1, policy.hostFlags(0x1));
        assertEquals(0x1, policy.apply(0x1, 0));
    }
}
