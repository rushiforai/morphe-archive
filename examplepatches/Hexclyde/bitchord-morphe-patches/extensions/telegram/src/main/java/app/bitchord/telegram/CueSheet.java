package app.bitchord.telegram;

import java.nio.charset.CharacterCodingException;
import java.nio.charset.CodingErrorAction;
import java.nio.charset.StandardCharsets;
import java.util.*;

/**
 * A cue sheet: the track list of an album kept as one audio file, with where each track starts.
 * Read from a .cue file or from a FLAC file's own CUESHEET.
 */
final class CueSheet {
    /** One track: its number, names and start, in samples at the file's sample rate later. */
    static final class Track {
        int number;
        String title = "", performer = "";
        // In CD frames (75 a second) from the start of the file; -1 when missing.
        long index0 = -1, index1 = -1;
    }

    String title = "", performer = "", file = "";
    final List<Track> tracks = new ArrayList<>();

    /** Text as written: UTF-8 when it is, else Windows-1252, which older rippers use. */
    static String text(byte[] bytes) {
        int start =
                bytes.length >= 3
                                && (bytes[0] & 0xff) == 0xef
                                && (bytes[1] & 0xff) == 0xbb
                                && (bytes[2] & 0xff) == 0xbf
                        ? 3
                        : 0;
        try {
            return StandardCharsets.UTF_8
                    .newDecoder()
                    .onMalformedInput(CodingErrorAction.REPORT)
                    .onUnmappableCharacter(CodingErrorAction.REPORT)
                    .decode(java.nio.ByteBuffer.wrap(bytes, start, bytes.length - start))
                    .toString();
        } catch (CharacterCodingException e) {
            return new String(
                    bytes,
                    start,
                    bytes.length - start,
                    java.nio.charset.Charset.forName("windows-1252"));
        }
    }

    /**
     * The sheet, or null when it isn't one album in one file: a sheet with a file per track
     * describes files that are already tracks of their own.
     */
    static CueSheet parse(String text) {
        CueSheet sheet = new CueSheet();
        Track track = null;
        int files = 0;
        for (String raw : text.split("\\r?\\n|\\r")) {
            String line = raw.trim();
            if (line.isEmpty()) continue;
            String[] words = line.split("\\s+", 2);
            String key = words[0].toUpperCase(Locale.ROOT), rest = words.length > 1 ? words[1] : "";
            switch (key) {
                case "FILE":
                    files++;
                    if (files > 1) return null;
                    sheet.file = quoted(rest, true);
                    break;
                case "TRACK":
                    {
                        String[] parts = rest.split("\\s+");
                        if (parts.length < 2 || !parts[1].equalsIgnoreCase("AUDIO")) {
                            track = null;
                            break;
                        }
                        track = new Track();
                        try {
                            track.number = Integer.parseInt(parts[0]);
                        } catch (NumberFormatException e) {
                            return null;
                        }
                        sheet.tracks.add(track);
                        break;
                    }
                case "TITLE":
                    if (track == null) sheet.title = quoted(rest, false);
                    else track.title = quoted(rest, false);
                    break;
                case "PERFORMER":
                    if (track == null) sheet.performer = quoted(rest, false);
                    else track.performer = quoted(rest, false);
                    break;
                case "INDEX":
                    {
                        if (track == null) break;
                        String[] parts = rest.split("\\s+");
                        if (parts.length < 2) break;
                        long at = frames(parts[1]);
                        if (at < 0) return null;
                        if (parts[0].equals("00") || parts[0].equals("0")) track.index0 = at;
                        else if (parts[0].equals("01") || parts[0].equals("1")) track.index1 = at;
                        break;
                    }
                default:
                    break;
            }
        }
        if (sheet.file.isEmpty() || sheet.tracks.size() < 2) return null;
        long previous = -1;
        for (Track t : sheet.tracks) {
            if (t.index1 < 0 || t.index1 <= previous) return null;
            previous = t.index1;
        }
        return sheet;
    }

    /** "mm:ss:ff" in CD frames, or -1. */
    static long frames(String time) {
        String[] parts = time.split(":");
        if (parts.length != 3) return -1;
        try {
            long m = Long.parseLong(parts[0]),
                    s = Long.parseLong(parts[1]),
                    f = Long.parseLong(parts[2]);
            if (m < 0 || s < 0 || s > 59 || f < 0 || f > 74) return -1;
            return (m * 60 + s) * 75 + f;
        } catch (NumberFormatException e) {
            return -1;
        }
    }

    /** A value in quotes, or the first word; for FILE, without its type after the name. */
    static String quoted(String rest, boolean file) {
        rest = rest.trim();
        if (rest.startsWith("\"")) {
            int end = rest.indexOf('"', 1);
            return end > 0 ? rest.substring(1, end) : rest.substring(1);
        }
        if (file) {
            int space = rest.lastIndexOf(' ');
            return space > 0 ? rest.substring(0, space) : rest;
        }
        return rest;
    }

    /**
     * Each track's first and last sample (exclusive): from its INDEX 01 to the next track's start,
     * which is that track's INDEX 00 when it has one, so pregaps go with the track before. The last
     * track ends with the file.
     */
    long[][] ranges(int rate, long totalSamples) {
        long[][] out = new long[tracks.size()][2];
        for (int i = 0; i < tracks.size(); i++) {
            Track t = tracks.get(i);
            out[i][0] = t.index1 * rate / 75;
            if (i + 1 < tracks.size()) {
                Track next = tracks.get(i + 1);
                long cut = next.index0 >= 0 && next.index0 > t.index1 ? next.index0 : next.index1;
                out[i][1] = cut * rate / 75;
            } else out[i][1] = totalSamples;
        }
        return out;
    }

    /**
     * A FLAC CUESHEET block: tracks with their offsets in samples and index points. Turned into the
     * same form as a text sheet, with the offsets in samples kept exact.
     */
    static CueSheet fromFlacBlock(byte[] b, int rate) {
        try {
            int p = 128 + 8 + 1 + 258; // catalog, lead-in, CD flag, reserved
            int count = b[p++] & 0xff;
            CueSheet sheet = new CueSheet();
            sheet.file = "(embedded)";
            for (int i = 0; i < count; i++) {
                long offset = 0;
                for (int k = 0; k < 8; k++) offset = offset << 8 | (b[p + k] & 0xff);
                int number = b[p + 8] & 0xff;
                p += 8 + 1 + 12 + 1 + 13;
                int points = b[p++] & 0xff;
                Track t = new Track();
                t.number = number;
                for (int k = 0; k < points; k++) {
                    long pointOffset = 0;
                    for (int j = 0; j < 8; j++) pointOffset = pointOffset << 8 | (b[p + j] & 0xff);
                    int index = b[p + 8] & 0xff;
                    long at = (offset + pointOffset) * 75 / Math.max(1, rate);
                    if (index == 0) t.index0 = at;
                    if (index == 1) t.index1 = at;
                    p += 8 + 1 + 3;
                }
                // The lead-out (170, or 255 for non-CD sheets) isn't a track.
                if (number != 170 && number != 255 && t.index1 >= 0) sheet.tracks.add(t);
            }
            return sheet.tracks.size() >= 2 ? sheet : null;
        } catch (ArrayIndexOutOfBoundsException e) {
            return null;
        }
    }
}
