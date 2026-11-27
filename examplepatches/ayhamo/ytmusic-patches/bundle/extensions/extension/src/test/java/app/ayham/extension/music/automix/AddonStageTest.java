package app.ayham.extension.music.automix;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

import app.ayham.extension.music.addons.AddonPrep;

import org.junit.Test;

/** editor.md §11 rule 6: the progress row's addon line for the playing song. */
public class AddonStageTest {
    @Test
    public void theStagesInOrder() {
        assertEquals("Asking your addons", Automix.addonStage(new String[]{AddonPrep.ASKING, ""}, false, false));
        assertEquals("Getting the lossless copy", Automix.addonStage(new String[]{AddonPrep.FETCHING, "lossless"}, false, false));
        assertEquals("Lining up the lossless copy with YouTube's", Automix.addonStage(new String[]{AddonPrep.FITTING, "lossless"}, false, false));
        assertEquals("Switching to the lossless copy", Automix.addonStage(null, true, true));
    }

    @Test
    public void aCopyThatIsNotLosslessIsTheAddonsCopy() {
        assertEquals("Getting the addon's copy", Automix.addonStage(new String[]{AddonPrep.FETCHING, ""}, false, false));
        assertEquals("Lining up the addon's copy with YouTube's", Automix.addonStage(new String[]{AddonPrep.FITTING, ""}, false, false));
        assertEquals("Switching to the addon's copy", Automix.addonStage(null, true, false));
    }

    @Test
    public void nothingOnceHeardRefusedOrFailed() {
        // no preparation running and our player heard (or none): no line
        assertNull(Automix.addonStage(null, false, true));
    }

    @Test
    public void preparingComesBeforeTheTakeOver() {
        // a second look (a lossless pass) while the lossy copy still switches: the pass is shown
        assertEquals("Asking your addons", Automix.addonStage(new String[]{AddonPrep.ASKING, ""}, true, false));
    }

    @Test
    public void pausedTheReadyCopyWaitsForPlay() {
        // rule 6 [all]: while paused the take-over isn't "Switching…" with a busy bar
        assertEquals("The lossless copy is ready: it takes over when the song plays", Automix.readyWhenPlays(true));
        assertEquals("The addon's copy is ready: it takes over when the song plays", Automix.readyWhenPlays(false));
    }
}
