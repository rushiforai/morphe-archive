package io.github.sabopura.morphe.extension.twitch.ui;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import java.util.Arrays;

import org.junit.Test;

public class MenuLayoutTest {
    @Test
    public void nothingStoredGivesTheDefaultOrder() {
        MenuLayout layout = MenuLayout.parse(null);
        assertEquals(Arrays.asList("ads", "danmaku", "speed", "sleep", "controls", "chat", "channel"), layout.order);
        assertTrue(layout.hidden.isEmpty());
    }

    @Test
    public void storedOrderAndHiddenRoundTrip() {
        MenuLayout layout = MenuLayout.parse("sleep,-ads,speed");
        assertEquals("sleep", layout.order.get(0));
        assertTrue(layout.hidden.contains("ads"));
        assertEquals(layout.serialize(), MenuLayout.parse(layout.serialize()).serialize());
    }

    @Test
    public void unknownSectionsAreDroppedAndNewOnesAppended() {
        MenuLayout layout = MenuLayout.parse("gone,chat");
        assertFalse(layout.order.contains("gone"));
        assertEquals("chat", layout.order.get(0));
        assertEquals(7, layout.order.size());
    }

    @Test
    public void repeatsAreIgnored() {
        assertEquals(7, MenuLayout.parse("chat,chat").order.size());
    }
}
