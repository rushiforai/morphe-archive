package io.github.sabopura.morphe.extension.twitch.app;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.junit.Test;

public class RecapsTest {
    private static final String SWITCH = "Android-Stream-Recaps-Native-Feed-Shelf";

    private static List<Object> shelf() {
        return new ArrayList<>(Arrays.asList(new Object()));
    }

    @Test
    public void withoutThePatchEveryHookGivesBackWhatTwitchPassed() {
        Object entry = new Object();
        List<Object> shelf = shelf();
        assertSame(entry, Recaps.feedEntry(entry));
        assertSame(shelf, Recaps.channelShelf(shelf));
        assertSame(SWITCH, Recaps.feedShelfSwitch(SWITCH));
    }

    @Test
    public void anEntryThatIsNotARecapNeedsNoAnswer() {
        assertNull(Recaps.feedEntry(null));
    }

    @Test
    public void aShownRecapEntryIsTwitchsOwn() {
        Object entry = new Object();
        assertSame(entry, Recaps.feedEntry(entry, false));
    }

    @Test
    public void aHiddenRecapEntryLooksAbsentToTheParser() {
        assertNull(Recaps.feedEntry(new Object(), true));
    }

    @Test
    public void aShownChannelShelfIsTwitchsOwn() {
        List<Object> shelf = shelf();
        assertSame(shelf, Recaps.channelShelf(shelf, false));
    }

    @Test
    public void aHiddenChannelShelfIsASectionWithoutItems() {
        List<Object> shelf = shelf();
        List<?> hidden = Recaps.channelShelf(shelf, true);
        assertTrue(hidden.isEmpty());
        assertEquals("Twitch's list is left as it was", 1, shelf.size());
    }

    @Test
    public void theHiddenSwitchIsAskedForUnderAnotherName() {
        assertNotEquals(SWITCH, Recaps.unknownSwitch(SWITCH));
    }
}
