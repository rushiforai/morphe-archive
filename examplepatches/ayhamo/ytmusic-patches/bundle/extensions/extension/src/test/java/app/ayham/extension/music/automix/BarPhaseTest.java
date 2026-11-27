package app.ayham.extension.music.automix;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

/** analysis-cases.md "The bar [all]" (dedb2a2d): the beat model's downbeats vote for the bar's place. */
public class BarPhaseTest {
    @Test
    public void aPickupDownbeatIsOutvoted() {
        // grid from 6.00 s at 0.6 s a beat; a pickup at 6.00, the bars every 4 beats from 7.20
        double[] downs = {6.00, 7.20, 9.60, 12.00, 14.40};
        assertEquals(7.20, Analysis.votedDownbeat(0.6, 6.00, downs), 1e-9);
    }

    @Test
    public void aTieKeepsTheFirstDownbeat() {
        assertEquals(1.0, Analysis.votedDownbeat(0.5, 1.0, new double[]{1.0, 1.5}), 1e-9);
    }

    @Test
    public void downbeatsOffTheGridDontVote() {
        // 0.2 beat off votes, 0.3 beat off doesn't
        assertEquals(1.5, Analysis.votedDownbeat(0.5, 1.0, new double[]{1.0, 1.5 + 0.1, 3.5 + 0.1}), 1e-9);
        assertEquals(1.0, Analysis.votedDownbeat(0.5, 1.0, new double[]{1.0, 1.5 + 0.15, 3.5 + 0.15}), 1e-9);
    }

    @Test
    public void itChangesNothingASecondTime() {
        double[] downs = {6.00, 7.20, 9.60, 12.00, 14.40};
        double once = Analysis.votedDownbeat(0.6, 6.00, downs);
        assertEquals(once, Analysis.votedDownbeat(0.6, once, downs), 1e-12);
    }

    @Test
    public void bothGridsArePhasedOnLoad() {
        Analysis a = new Analysis();
        a.beatIntervalSec = 0.6;
        a.firstDownbeatSec = 6.0;
        a.headBeats = new Analysis.BeatSide();
        a.headBeats.downbeats = new double[]{6.00, 7.20, 9.60, 12.00};
        a.tailGrid = new Analysis.LocalGrid();
        a.tailGrid.beatIntervalSec = 0.5;
        a.tailGrid.firstDownbeatSec = 100;
        a.tailBeats = new Analysis.BeatSide();
        a.tailBeats.downbeats = new double[]{100.5, 102.5, 104.5};
        Analysis b = Analysis.fromJson((java.util.Map<String, Object>) Json.parse(Json.write(a.toJson())));
        assertEquals(7.2, b.firstDownbeatSec, 1e-9);
        assertEquals(100.5, b.tailGrid.firstDownbeatSec, 1e-9);
        // missing downbeats or grid: left as it is
        assertEquals(3.0, Analysis.votedDownbeat(Double.NaN, 3.0, new double[]{3.5}), 0);
        assertEquals(3.0, Analysis.votedDownbeat(0.5, 3.0, null), 0);
    }
}
