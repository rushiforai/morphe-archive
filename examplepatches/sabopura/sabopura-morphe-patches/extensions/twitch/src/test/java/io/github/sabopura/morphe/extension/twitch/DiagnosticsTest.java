package io.github.sabopura.morphe.extension.twitch;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

public class DiagnosticsTest {
    @Test
    public void notingNeverThrowsAndCountsEachPlaceOnce() {
        int before = Diagnostics.places();
        Diagnostics.note(null, new RuntimeException());
        Diagnostics.note("test.no-failure", null);
        Diagnostics.note("test.same-place", new RuntimeException("first"));
        Diagnostics.note("test.same-place", new RuntimeException("again"));

        assertEquals(before + 1, Diagnostics.places());
    }
}
