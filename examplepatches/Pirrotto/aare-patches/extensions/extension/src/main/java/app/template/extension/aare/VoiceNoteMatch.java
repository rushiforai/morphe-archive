package app.template.extension.aare;

import java.util.ArrayList;
import java.util.List;

/**
 * Which voice note file is a received voice message, decided inside the helper (VoiceNotesShell)
 * so AARE never sees the other files: their names, times or count. No Android here, so it is
 * unit-tested (VoiceNoteMatchTest).
 *
 * WhatsApp keeps sent and received voice notes in the same folders, so a file must be saved from
 * a little before to an hour after the message, and last what the notification says ("(0:05)").
 */
final class VoiceNoteMatch {
    /** How far a recording's file time may be from the message time. */
    static final long BEFORE_MS = 2 * 60_000L;
    static final long AFTER_MS = 60 * 60_000L;
    /** A recording's length may differ this much from the stated one (it is rounded to seconds). */
    static final long DURATION_SLACK_MS = 1500;
    /** At most this many of the best time matches are opened to check their length. */
    static final int MAX_CHECKED = 3;

    /** "(0:05)": the duration a notification gives for a voice message. */
    private static final java.util.regex.Pattern STATED = java.util.regex.Pattern.compile("\\((\\d{1,3}):(\\d{2})\\)");

    private VoiceNoteMatch() {
    }

    /** The duration a notification text states, in ms (the last one), or -1 if none. */
    static long statedMs(String text) {
        if (text == null) return -1;
        java.util.regex.Matcher m = STATED.matcher(text);
        long found = -1;
        while (m.find()) found = (Long.parseLong(m.group(1)) * 60 + Long.parseLong(m.group(2))) * 1000;
        return found;
    }

    /**
     * The indices of the files that may be the message, best first: in the time window, saved
     * after the message first, closest first, at most [MAX_CHECKED]. Empty files never match.
     */
    static List<Integer> candidates(long[] modifiedMs, long[] sizes, long messageTimeMs) {
        List<Integer> out = new ArrayList<>();
        if (messageTimeMs <= 0) return out;
        for (int i = 0; i < modifiedMs.length; i++) {
            if (sizes[i] <= 0) continue;
            long delta = modifiedMs[i] - messageTimeMs;
            if (delta < -BEFORE_MS || delta > AFTER_MS) continue;
            out.add(i);
        }
        out.sort((a, b) -> Long.compare(score(modifiedMs[a], messageTimeMs), score(modifiedMs[b], messageTimeMs)));
        return out.size() > MAX_CHECKED ? new ArrayList<>(out.subList(0, MAX_CHECKED)) : out;
    }

    /** A file saved before the message time is a weaker match than one after it. */
    private static long score(long modifiedMs, long messageTimeMs) {
        long delta = modifiedMs - messageTimeMs;
        return delta >= 0 ? delta : -delta * 10;
    }

    /**
     * Whether a recording of [fileMs] is the voice message of [statedMs] (-1: the notification gave
     * no duration, the time window has to do). An unreadable length (-1) never matches a stated one.
     */
    static boolean lengthMatches(long fileMs, long statedMs) {
        if (statedMs < 0) return true;
        return fileMs >= 0 && Math.abs(fileMs - statedMs) <= DURATION_SLACK_MS;
    }

    /**
     * The length of an Ogg Opus file (WhatsApp's voice notes), from its first bytes [head] (the
     * OpusHead pre-skip) and last bytes [tail] (the last page's granule position, in 48 kHz
     * samples), or -1 if they aren't Ogg Opus.
     */
    static long oggOpusDurationMs(byte[] head, byte[] tail) {
        int h = indexOf(head, "OpusHead".getBytes(java.nio.charset.StandardCharsets.US_ASCII), 0);
        if (h < 0 || h + 12 > head.length) return -1;
        int preSkip = (head[h + 10] & 0xff) | (head[h + 11] & 0xff) << 8;
        byte[] oggs = "OggS".getBytes(java.nio.charset.StandardCharsets.US_ASCII);
        int last = -1;
        for (int i = indexOf(tail, oggs, 0); i >= 0; i = indexOf(tail, oggs, i + 1)) last = i;
        if (last < 0 || last + 14 > tail.length) return -1;
        long granule = 0;
        for (int k = 7; k >= 0; k--) granule = granule << 8 | (tail[last + 6 + k] & 0xff);
        if (granule <= 0 || granule < preSkip) return -1;
        return (granule - preSkip) * 1000 / 48000;
    }

    private static int indexOf(byte[] data, byte[] what, int from) {
        outer:
        for (int i = Math.max(0, from); i <= data.length - what.length; i++) {
            for (int j = 0; j < what.length; j++) if (data[i + j] != what[j]) continue outer;
            return i;
        }
        return -1;
    }
}
