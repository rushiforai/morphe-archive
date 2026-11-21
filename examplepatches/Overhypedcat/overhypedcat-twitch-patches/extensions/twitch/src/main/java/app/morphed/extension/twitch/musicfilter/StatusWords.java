package app.morphed.extension.twitch.musicfilter;

/**
 * What song removal says it's doing, in a few words that never name the song (the pill and the Options show them
 * as they are). A problem is "few words | the whole sentence": the words are shown, the sentence (the song's name
 * allowed) goes under them in the Options and on screen. A step or problem may count down to when it's over.
 */
public final class StatusWords {
    public static final String SEPARATOR = " | ";

    public static final String WAITING = "Waiting for sound"; // no sound heard yet
    public static final String LISTENING = "Listening"; // collecting sound, or waiting between tries
    public static final String CHECKING = "Checking known songs"; // the songs heard before, looked through
    public static final String ASKING = "Asking Shazam";
    public static final String FINDING = "Finding a copy"; // YouTube searched
    public static final String DOWNLOADING = "Downloading"; // only when the copy isn't kept already
    public static final String DECODING = "Decoding";
    public static final String LINING_UP = "Lining up"; // a copy lined up with the stream
    public static final String REMOVING = "Removing song";
    public static final String LOST_SYNC = "Lost sync, searching"; // the song isn't where it should be
    public static final String RESTING = "Resting"; // (counting down) no music heard twice in a row
    public static final String RETRYING = "Retrying"; // (counting down) a copy didn't line up or didn't download
    public static final String RESTARTING = "Restarting"; // the retry button

    private StatusWords() {
    }

    /** A problem as its few words and its whole sentence. */
    public static String problem(String words, String detail) {
        return words + SEPARATOR + detail;
    }

    /** A problem's few words (all of it, when it has no sentence). */
    public static String words(String problem) {
        int cut = problem.indexOf(SEPARATOR);
        return cut < 0 ? problem : problem.substring(0, cut);
    }

    /** A problem's whole sentence (all of it, when it has no few words). */
    public static String detail(String problem) {
        int cut = problem.indexOf(SEPARATOR);
        return cut < 0 ? problem : problem.substring(cut + SEPARATOR.length());
    }

    /** The words with the seconds left until endsAtMs (0: no countdown), "Resting 52 s"; once over, the words. */
    public static String counting(String words, long endsAtMs, long nowMs) {
        int left = secondsLeft(endsAtMs, nowMs);
        return left > 0 ? words + " " + left + " s" : words;
    }

    static int secondsLeft(long endsAtMs, long nowMs) {
        if (endsAtMs <= 0 || endsAtMs <= nowMs) return 0;
        return (int) ((endsAtMs - nowMs + 999) / 1000);
    }

    /** When the countdown shows the next number (ms from now), or -1 when nothing counts down. */
    public static long nextTick(long endsAtMs, long nowMs) {
        if (secondsLeft(endsAtMs, nowMs) <= 0) return -1;
        long into = (endsAtMs - nowMs) % 1000;
        return (into == 0 ? 1000 : into) + 5;
    }
}
