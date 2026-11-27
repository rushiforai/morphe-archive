package app.ayham.extension.music.automix;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

import org.junit.Test;

public class NoLoopWhyTest {
    /** Phone, 2026-11-19: a pair with a saved window showed the previous pair's "audio not decoded yet". */
    @Test
    public void aSavedEditSaysSoNotAnotherPairsState() {
        assertEquals("your saved edit (pick Loop for a loop mix)", Automix.noLoopWhy(true, null));
        assertEquals("your saved edit (pick Loop for a loop mix)", Automix.noLoopWhy(true, "missing"));
    }

    @Test
    public void onlyThisPairsOwnCheckSaysTheAudioIsMissing() {
        assertEquals("audio not decoded yet", Automix.noLoopWhy(false, "missing"));
        assertNull(Automix.noLoopWhy(false, null));
        assertNull(Automix.noLoopWhy(false, "loading"));
        assertNull(Automix.noLoopWhy(false, "none"));
    }
}
