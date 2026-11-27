package app.ayham.extension.music.automix;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

/** Mix.play: a preset's curves drawn over its window D, played over the seconds the mix has (Dplay). */
public class MixPlayFitTest {
    private static final double[][] RAMP = {{0, 0}, {5, 0.5}, {10, 1}};

    @Test
    public void curveTimesStretchToTheMixsLength() {
        Mix.Lane lane = new Mix.Lane(0);
        Mix.play(lane, RAMP, 100, 10, 20, false, null);
        // fit 2: the point at 5 s lands at t0 + 10, the end at t0 + 20
        assertEquals(0, lane.at(100), 1e-9);
        assertEquals(0.5, lane.at(110), 1e-9);
        assertEquals(1, lane.at(120), 1e-9);
        assertEquals(0.25, lane.at(105), 1e-9);
    }

    @Test
    public void curveTimesShrinkToAShorterMix() {
        Mix.Lane lane = new Mix.Lane(0);
        Mix.play(lane, RAMP, 0, 10, 5, false, null);
        assertEquals(0.5, lane.at(2.5), 1e-9);
        assertEquals(1, lane.at(5), 1e-9);
    }

    @Test
    public void noLengthKeepsTheCurvesOwnTimes() {
        Mix.Lane lane = new Mix.Lane(0);
        Mix.play(lane, RAMP, 0, 10, 0, false, null);
        assertEquals(0.5, lane.at(5), 1e-9);
        assertEquals(1, lane.at(10), 1e-9);
    }
}
