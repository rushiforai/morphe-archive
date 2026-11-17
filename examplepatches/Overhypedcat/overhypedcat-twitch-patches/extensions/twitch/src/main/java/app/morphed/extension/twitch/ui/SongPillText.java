package app.morphed.extension.twitch.ui;

/**
 * The song removal pill's words: what song removal is doing right now, in a word or two (it sits among the
 * player's own pills), without the song's name. The player's Options have the whole line.
 */
public final class SongPillText {
    public enum Tone { WORKING, REMOVING, PROBLEM }

    public final String text;
    public final Tone tone;

    private SongPillText(String text, Tone tone) {
        this.text = text;
        this.tone = tone;
    }

    /** From song removal's step and problem (as its status gives them). */
    public static SongPillText of(String step, String problem) {
        if (problem != null) return new SongPillText(problem(problem), Tone.PROBLEM);
        String s = step == null ? "" : step;
        if (s.startsWith("Removing ")) return new SongPillText("Removing song", Tone.REMOVING);
        if (s.startsWith("Lost ")) return new SongPillText("Song lost", Tone.WORKING);
        if (s.startsWith("The song changed")) return new SongPillText("Song changed", Tone.WORKING);
        if (s.startsWith("Asking Shazam")) return new SongPillText("Asking Shazam", Tone.WORKING);
        if (s.startsWith("Finding ")) return new SongPillText("Finding song", Tone.WORKING);
        if (s.startsWith("Getting ")) return new SongPillText("Downloading", Tone.WORKING);
        if (s.startsWith("Lining up ")) return new SongPillText("Lining up", Tone.WORKING);
        if (s.startsWith("No music found")) return new SongPillText("No music", Tone.WORKING);
        if (s.startsWith("Retrying")) return new SongPillText("Retrying", Tone.WORKING);
        if (s.startsWith("Waiting")) return new SongPillText("Waiting", Tone.WORKING);
        if (s.isEmpty() || s.startsWith("Listening")) return new SongPillText("Listening", Tone.WORKING);
        // A step this doesn't know: shown as it is, up to where a song's name could follow.
        return new SongPillText(firstWords(s), Tone.WORKING);
    }

    /** A problem, short: its first part (what failed), the reason after it left to the Options line. */
    static String problem(String text) {
        int cut = text.indexOf(':');
        String shown = cut > 0 && cut < 60 ? text.substring(0, cut) : text;
        return shown.length() > 60 ? shown.substring(0, 59) + "…" : shown;
    }

    /** The first two words of a step (a song's name never starts before the third). */
    private static String firstWords(String step) {
        int first = step.indexOf(' ');
        int second = first < 0 ? -1 : step.indexOf(' ', first + 1);
        return second < 0 ? step : step.substring(0, second);
    }
}
