package app.ayham.extension.music.automix;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

/** The echo out's delay line (editor.md §5): one beat of delay, feedback 0.53, the send only over the beat before the catch. */
public class EchoLineTest {
    private static final int SR = Engine.SR, BLOCK = 512;

    /** Mix seconds [0, len) of the deck after its fader: a click at [clickSec], cut (dry) from [cutSec] on. */
    private static float[] run(double beat, double t0, double clickSec, double cutSec, double len) {
        Planner.Echo e = new Planner.Echo();
        e.beats = 8;
        e.delaySec = beat;
        e.feedback = 0.53;
        e.cutSec = 0.01;
        Engine.EchoLine line = new Engine.EchoLine(e, t0);
        int frames = (int) (len * SR) / BLOCK * BLOCK;
        float[] out = new float[frames];
        float[] buf = new float[BLOCK * 2];
        for (int f = 0; f < frames; f += BLOCK) {
            java.util.Arrays.fill(buf, 0f);
            int click = (int) Math.round(clickSec * SR) - f;
            if (click >= 0 && click < BLOCK && f + click < cutSec * SR) {
                buf[2 * click] = 1;
                buf[2 * click + 1] = 1;
            }
            line.run(buf, f);
            for (int i = 0; i < BLOCK; i++) out[f + i] = buf[2 * i];
        }
        return out;
    }

    @Test
    public void theBeatBeforeTheCatchRepeatsEveryBeatAtTheFeedback() {
        double beat = 0.5, t0 = 4;
        float[] out = run(beat, t0, 3.75, t0, 9);
        int c = (int) Math.round(3.75 * SR), d = (int) Math.round(beat * SR);
        assertEquals(1, out[c], 1e-6);                         // the dry click
        assertEquals(1, out[c + d], 1e-6);                     // the first repeat, at full level
        assertEquals(0.53, out[c + 2 * d], 1e-4);              // then x0.53 each beat
        assertEquals(0.53 * 0.53, out[c + 3 * d], 1e-4);
        assertEquals(0, out[c + d - 1], 1e-9);                 // nothing in between
    }

    @Test
    public void soundOutsideTheSendIsNotEchoed() {
        float[] early = run(0.5, 4, 3.0, 4, 9);                // before the beat before the catch
        float[] late = run(0.5, 4, 4.2, 99, 9);                // after the catch
        int d = (int) Math.round(0.5 * SR);
        assertEquals(0, early[(int) Math.round(3.0 * SR) + d], 1e-9);
        assertEquals(0, late[(int) Math.round(4.2 * SR) + d], 1e-9);
    }

    @Test
    public void theEchoIsGoneAfterEightBeats() {
        float[] out = run(0.5, 4, 3.75, 4, 10);
        double max = 0;
        for (int i = (int) Math.round(8.0 * SR) + 1; i < out.length; i++) max = Math.max(max, Math.abs(out[i]));
        assertEquals(0, max, 1e-9);
    }
}
