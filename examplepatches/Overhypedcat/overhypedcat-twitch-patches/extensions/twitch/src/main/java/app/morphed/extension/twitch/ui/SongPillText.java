package app.morphed.extension.twitch.ui;

import app.morphed.extension.twitch.musicfilter.SongRemoval;
import app.morphed.extension.twitch.musicfilter.StatusWords;

/**
 * The song removal pill's words: what song removal is doing right now, in a few words (it sits among the
 * player's own pills), never the song's name; a problem's few words instead while there is one. A countdown is
 * shown as seconds after the words ("Resting 52 s"). The player's Options have the whole sentence.
 */
public final class SongPillText {
    public enum Tone { WORKING, REMOVING, PROBLEM }

    public final String text;
    public final Tone tone;
    /** When the words change by themselves (a countdown's next number), in ms from now; -1: they don't. */
    public final long nextTick;

    private SongPillText(String text, Tone tone, long nextTick) {
        this.text = text;
        this.tone = tone;
        this.nextTick = nextTick;
    }

    public static SongPillText of(SongRemoval.Status status, long nowMs) {
        return of(status.step, status.stepEndsAt, status.problem, status.problemEndsAt, nowMs);
    }

    /** From song removal's step and problem, with when their countdowns end (0: none). */
    static SongPillText of(String step, long stepEndsAt, String problem, long problemEndsAt, long nowMs) {
        if (problem != null) {
            return new SongPillText(StatusWords.counting(short60(StatusWords.words(problem)), problemEndsAt, nowMs),
                    Tone.PROBLEM, StatusWords.nextTick(problemEndsAt, nowMs));
        }
        String s = step == null || step.isEmpty() ? StatusWords.LISTENING : step;
        Tone tone = StatusWords.REMOVING.equals(s) ? Tone.REMOVING : Tone.WORKING;
        return new SongPillText(StatusWords.counting(s, stepEndsAt, nowMs), tone, StatusWords.nextTick(stepEndsAt, nowMs));
    }

    /** Never longer than the row of pills could take (a problem without few words is shown cut). */
    static String short60(String text) {
        return text.length() > 60 ? text.substring(0, 59) + "…" : text;
    }
}
