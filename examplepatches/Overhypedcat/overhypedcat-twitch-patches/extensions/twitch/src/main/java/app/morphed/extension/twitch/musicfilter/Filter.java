package app.morphed.extension.twitch.musicfilter;

import static app.morphed.extension.twitch.musicfilter.Canceller.DELAY;
import static app.morphed.extension.twitch.musicfilter.Canceller.HOP;

/**
 * The stream's sound in, the same with the song taken out; DELAY samples behind. {@link #wanted} is the song the
 * tracker says plays now (or null); every sample taken in also goes to the heard listener (mono), for the tracker.
 * A port of Mor Assistant's Filter: once anything in it fails, the sound goes through unfiltered from then on, still DELAY
 * behind so it stays in step with the picture, and the failure is told once.
 */
public final class Filter {
    /** Where the filtered sound goes, a HOP at a time. */
    public interface Output {
        void block(float[] left, float[] right);
    }

    public interface HeardListener {
        void heard(float[] mono, int length);
    }

    public interface ProblemListener {
        void problem(String text);
    }

    static final int JUMP = HOP; // the song's place moving by more than this: the cancellers start over there

    private final HeardListener onHeard;
    private final ProblemListener onProblem;
    Canceller[] cancellers = {new Canceller(), new Canceller()};
    private final float[][] pending = {new float[HOP], new float[HOP]}; // sound not yet a whole HOP
    private int pendingLength;
    private long fed;
    private Playing current;
    /** The latest Playing from the tracker; read once per HOP. */
    public volatile Playing wanted;
    /** While false the sound only goes through the delay (the switch is off): same timing, nothing taken out. */
    public volatile boolean enabled = true;
    private boolean broken;
    private final float[][] held = {new float[DELAY], new float[DELAY]};
    private final float[] songLeft = new float[HOP], songRight = new float[HOP];
    /** The delayed block, reused: the output takes it before the next. */
    private final float[][] delayed = {new float[HOP], new float[HOP]};
    private float[] mono = new float[0];

    public Filter(HeardListener onHeard, ProblemListener onProblem) {
        this.onHeard = onHeard;
        this.onProblem = onProblem;
    }

    /** The stream sample the next one taken in is: lines this filter up with the tracker's count of what it heard. */
    public void continueAt(long sample) {
        fed = sample - pendingLength;
    }

    /** {@code count} stereo samples in; finished HOPs out through {@code output}. */
    public void push(float[] left, float[] right, int count, Output output) {
        if (mono.length < count) mono = new float[count];
        for (int i = 0; i < count; i++) mono[i] = (left[i] + right[i]) / 2;
        onHeard.heard(mono, count);
        int at = 0;
        while (at < count) {
            int take = Math.min(count - at, HOP - pendingLength);
            System.arraycopy(left, at, pending[0], pendingLength, take);
            System.arraycopy(right, at, pending[1], pendingLength, take);
            pendingLength += take;
            at += take;
            if (pendingLength < HOP) break;
            pendingLength = 0;
            // The plain delayed sound is always kept up to date, so switching the cancellers off (or them breaking)
            // carries on seamlessly, in step with the picture.
            passThrough(0, delayed[0]);
            passThrough(1, delayed[1]);
            float[][] result = null;
            if (!broken && enabled) {
                boolean hasSong = song(fed);
                try {
                    result = new float[][]{
                            cancellers[0].process(pending[0], hasSong ? songLeft : null),
                            cancellers[1].process(pending[1], hasSong ? songRight : null)};
                } catch (Throwable error) { // the filter must never stop the sound: from now on it goes through
                    broken = true;
                    onProblem.problem("Filter broke | Song removal broke, the sound plays unfiltered: "
                            + app.morphed.extension.twitch.Messages.of(error));
                }
            }
            if (result == null) result = delayed; // still DELAY behind
            output.block(result[0], result[1]);
            fed += HOP;
        }
    }

    /** The block DELAY samples back into out: the sound unfiltered, in step with what the cancellers give. */
    private void passThrough(int channel, float[] out) {
        float[] keep = held[channel];
        System.arraycopy(keep, 0, out, 0, HOP);
        System.arraycopy(keep, HOP, keep, 0, DELAY - HOP);
        System.arraycopy(pending[channel], 0, keep, DELAY - HOP, HOP);
    }

    /**
     * Follows what the tracker says plays: the cancellers restart for another song or a jump, start from nothing
     * for a retry. Fills songLeft/songRight; false when there's nothing to take out under these samples.
     */
    private boolean song(long start) {
        Playing playing = wanted;
        Playing before = current;
        if (playing != before) {
            if (playing != null && before != null && playing.round != before.round) {
                // a retry: from nothing, what they learned of the stream's EQ and delay too (it may be what failed)
                cancellers = new Canceller[]{new Canceller(), new Canceller()};
            } else if (playing == null || before == null || !playing.sameSong(before)
                    || Math.abs(playing.offset - before.offset) > JUMP) {
                for (Canceller c : cancellers) c.restart(); // the streamer's EQ and delay they learned stay
            }
            current = playing;
        }
        return playing != null && playing.slice(start, HOP, songLeft, songRight);
    }
}
