package io.github.sabopura.morphe.extension.twitch.chat;

import org.junit.Test;
import static org.junit.Assert.*;

public class RepeatFilterTest {
    @Test public void rebindingDoesNotChangeTheFirstMessageDecision() {
        RepeatFilter f = new RepeatFilter();
        assertFalse(f.isRepeat("1", "alice", "a", "hello", 1000));
        assertTrue(f.isRepeat("1", "alice", "b", "hello", 2000));
        assertFalse(f.isRepeat("1", "alice", "a", "hello", 1000));
        assertTrue(f.isRepeat("1", "alice", "b", "hello", 2000));
    }
    @Test public void roomsSendersAndTimeWindowsAreIndependent() {
        RepeatFilter f = new RepeatFilter();
        assertFalse(f.isRepeat("1", "alice", "a", "Kappa", 1000));
        assertFalse(f.isRepeat("1", "bob", "b", "Kappa", 2000));
        assertFalse(f.isRepeat("2", "alice", "c", "Kappa", 2000));
        assertFalse(f.isRepeat("1", "alice", "d", "Kappa", 10000));
        assertFalse(f.isRepeat("1", "alice", "e", "Kappa", 500));
    }
    @Test public void missingIdentityNeverHidesMessages() {
        RepeatFilter f = new RepeatFilter();
        for (int i = 0; i < 2; i++) {
            assertFalse(f.isRepeat("1", null, "a", "Kappa", 1000));
            assertFalse(f.isRepeat("1", "alice", null, "Kappa", 1000));
            assertFalse(f.isRepeat(null, "alice", "a", "Kappa", 1000));
        }
    }
}
