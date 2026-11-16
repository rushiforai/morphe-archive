package app.morphed.extension.twitch.musicfilter;

/**
 * A song being taken out: its clean copy (16-bit, left and right), and the song sample at stream sample 0
 * (offset); which copy that is (videoId), and which retry it came from (round: the cancellers start afresh for a
 * new one).
 */
public final class Playing {
    public final Song song;
    public final SongCopy copy;
    public final long offset;
    public final int round;

    public Playing(Song song, SongCopy copy, long offset, int round) {
        this.song = song;
        this.copy = copy;
        this.offset = offset;
        this.round = round;
    }

    /** The same song from the same copy, at another place. */
    public Playing movedTo(long newOffset) {
        return new Playing(song, copy, newOffset, round);
    }

    /** Whether it is the same song (by Shazam's key, title and artist), wherever it is. */
    boolean sameSong(Playing other) {
        return song.equals(other.song);
    }

    /** The song's sound under these stream samples into left/right; false once it's over or before it starts. */
    boolean slice(long start, int length, float[] left, float[] right) {
        long at = start + offset;
        int n = copy.length();
        if (at + length <= 0 || at >= n) return false;
        java.util.Arrays.fill(left, 0, length, 0f);
        java.util.Arrays.fill(right, 0, length, 0f);
        int lo = (int) Math.max(at, 0), hi = (int) Math.min(at + length, n);
        for (int i = lo; i < hi; i++) {
            left[(int) (i - at)] = copy.left[i] / 32768.0f;
            right[(int) (i - at)] = copy.right[i] / 32768.0f;
        }
        return true;
    }
}
