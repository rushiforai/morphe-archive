package dev.twitchpatches.extension.ui;

import java.util.List;
import org.junit.Test;
import static org.junit.Assert.*;

public class UiHypeTrainStateTest {
    @Test public void retainsOnlyCurrentPresentationAndDoesNotReviveEndedTrains() {
        UiHypeTrainState state = new UiHypeTrainState();
        state.accept("approaching", 1);
        state.accept("old pill", 3);
        state.accept("active", 2);
        assertEquals(List.of("active"), state.restore());
        for (int i = 0; i < 500; i++) state.accept(i, 3);
        state.accept("expanded", 4);
        assertEquals(List.of("active", 499, "expanded"), state.restore());
        state.accept("collapsed", 4);
        assertEquals(List.of("active", 499, "collapsed"), state.restore());
        state.accept("ended", 0);
        assertTrue(state.restore().isEmpty());
        state.accept("late pill", 3);
        assertTrue(state.restore().isEmpty());
        state.accept("next train", 1);
        assertEquals(List.of("next train"), state.restore());
    }
}
