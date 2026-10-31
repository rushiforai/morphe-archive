package app.bitchord.telegram;

import org.drinkless.tdlib.TdApi;
import org.json.JSONObject;

import java.nio.charset.StandardCharsets;
import java.util.*;

/**
 * Albums kept as one FLAC or WAV file with a cue sheet: each track becomes a song of its own in the
 * saved index, named from the sheet, which plays only its part of the file.
 *
 * <p>The sheet can be a .cue file posted beside the album, a .cue file in the same zip, or the FLAC
 * file's own (a CUESHEET block, or a CUESHEET tag).
 */
final class CueAlbums {
    private CueAlbums() {}

    /** Track songs have entries from here: 100000 + the album's entry in its zip × 100 + track. */
    static final int BASE = 100_000;

    /** A .cue file bigger than this isn't a cue sheet. */
    static final int MAX_SHEET = 1 << 20;

    /** Long FLAC files are looked into for a cue sheet of their own: 20 minutes and over. */
    static final int ALBUM_SECONDS = 20 * 60;

    /** A .cue post, as the index queues it, or null for anything else. */
    static JSONObject descriptor(TdApi.Message m) throws Exception {
        if (m == null || m.chatId == 0 || m.id <= 0 || !MediaPolicy.savable(m)) return null;
        if (!(m.content instanceof TdApi.MessageDocument)) return null;
        TdApi.Document d = ((TdApi.MessageDocument) m.content).document;
        if (d == null || d.document == null || d.fileName == null) return null;
        if (!d.fileName.toLowerCase(Locale.ROOT).endsWith(".cue")) return null;
        if (d.document.size <= 0 || d.document.size > MAX_SHEET) return null;
        return new JSONObject()
                .put("kind", "cue")
                .put("chat", m.chatId)
                .put("message", m.id)
                .put("file", d.document.id)
                .put("size", d.document.size)
                .put("fileName", d.fileName);
    }

    /** A long FLAC file to look into for a cue sheet of its own, or null. */
    static JSONObject embedded(JSONObject row) throws Exception {
        if (row.optInt("entry") != 0 || !row.optString("format").equalsIgnoreCase("flac"))
            return null;
        if (row.optInt("duration") < ALBUM_SECONDS) return null;
        return new JSONObject()
                .put("kind", "embedded")
                .put("chat", row.getLong("chat"))
                .put("message", row.getLong("message"))
                .put("file", row.getInt("file"))
                .put("size", row.getLong("size"))
                .put("fileName", row.optString("fileName"))
                .put("audio", row);
    }

    /** What a cue sheet needs of the album file: its format and where its samples are. */
    static final class Media {
        String source; // "flac" or "wav"
        int rate, channels, bits, minBlock, maxBlock, maxFrame;
        long samples, first, size;
        FlacDecoder.Info flac;
    }

    /** The album file's format, read from its first bytes; null when it isn't FLAC or PCM WAV. */
    static Media media(ZipDirectory.Range range, long size) throws Exception {
        byte[] head = range.read(0, 12);
        Media m = new Media();
        m.size = size;
        if (head.length >= 12
                && head[0] == 'R'
                && head[1] == 'I'
                && head[2] == 'F'
                && head[3] == 'F'
                && head[8] == 'W') {
            long at = 12;
            int format = 0;
            for (int n = 0; n < 64 && at + 8 <= size; n++) {
                byte[] chunk = range.read(at, 8);
                if (chunk.length < 8) return null;
                long length = ZipDirectory.u32(chunk, 4);
                String id = new String(chunk, 0, 4, StandardCharsets.US_ASCII);
                if (id.equals("fmt ")) {
                    byte[] fmt = range.read(at + 8, (int) Math.min(40, length));
                    if (fmt.length < 16) return null;
                    format = ZipDirectory.u16(fmt, 0);
                    m.channels = ZipDirectory.u16(fmt, 2);
                    m.rate = (int) ZipDirectory.u32(fmt, 4);
                    m.bits = ZipDirectory.u16(fmt, 14);
                    // Extensible: the sub-format's first two bytes are 1 for integer PCM.
                    if (format == 0xfffe && fmt.length >= 26) format = ZipDirectory.u16(fmt, 24);
                } else if (id.equals("data")) {
                    if (format != 1 || m.rate <= 0 || m.channels <= 0) return null;
                    if (CueAudio.container(m.bits) != m.bits) return null;
                    m.source = "wav";
                    m.first = at + 8;
                    long bytes = Math.min(length, size - m.first);
                    m.samples = bytes / (m.channels * m.bits / 8);
                    return m;
                }
                at += 8 + length + (length & 1);
            }
            return null;
        }
        FlacDecoder.Info info = FlacDecoder.info(range, size);
        m.source = "flac";
        m.flac = info;
        m.rate = info.rate;
        m.channels = info.channels;
        m.bits = info.bits;
        m.minBlock = info.minBlock;
        m.maxBlock = info.maxBlock;
        m.maxFrame = info.maxFrame;
        m.samples = info.samples;
        m.first = info.firstFrame;
        return m;
    }

    /** The cue sheet a FLAC file carries itself, or null. */
    static CueSheet embeddedSheet(FlacDecoder.Info info) {
        if (info == null) return null;
        if (info.comments != null) {
            String text = comment(info.comments, "CUESHEET");
            CueSheet sheet = text == null ? null : CueSheet.parse(text);
            if (sheet != null) return sheet;
        }
        return info.cuesheet == null ? null : CueSheet.fromFlacBlock(info.cuesheet, info.rate);
    }

    /** One Vorbis comment's value, or null. */
    static String comment(byte[] b, String key) {
        try {
            int p = 0;
            int vendor = (int) ZipDirectory.u32(b, p);
            p += 4 + vendor;
            long count = ZipDirectory.u32(b, p);
            p += 4;
            for (long i = 0; i < count && p + 4 <= b.length; i++) {
                int length = (int) ZipDirectory.u32(b, p);
                p += 4;
                if (length < 0 || p + length > b.length) return null;
                String entry = new String(b, p, length, StandardCharsets.UTF_8);
                p += length;
                int eq = entry.indexOf('=');
                if (eq > 0 && entry.substring(0, eq).equalsIgnoreCase(key))
                    return entry.substring(eq + 1);
            }
        } catch (RuntimeException e) {
            // Damaged comments: no sheet.
        }
        return null;
    }

    /**
     * The tracks of an album as index rows. {@code audio} is the album file's own row: a post's
     * file, or a file in a zip ({@code zipEntry} from 1, with its place in the zip in "zip").
     */
    static List<JSONObject> tracks(
            CueSheet sheet, Media media, JSONObject audio, int zipEntry, String album)
            throws Exception {
        List<JSONObject> rows = new ArrayList<>();
        long chat = audio.getLong("chat"), message = audio.getLong("message");
        long[][] ranges = sheet.ranges(media.rate, media.samples);
        String albumArtist =
                sheet.performer.isEmpty() ? audio.optString("artist") : sheet.performer;
        String albumTitle = !sheet.title.isEmpty() ? sheet.title : album;
        for (int i = 0; i < sheet.tracks.size(); i++) {
            CueSheet.Track t = sheet.tracks.get(i);
            long start = ranges[i][0], end = Math.min(ranges[i][1], media.samples);
            if (t.number < 1 || t.number > 99 || end <= start) continue;
            int entry = BASE + zipEntry * 100 + t.number;
            int seconds = (int) Math.round((end - start) / (double) media.rate);
            JSONObject cue =
                    new JSONObject()
                            .put("source", media.source)
                            .put("start", start)
                            .put("end", end)
                            .put("rate", media.rate)
                            .put("channels", media.channels)
                            .put("bits", media.bits)
                            .put("first", media.first)
                            .put("total", media.size)
                            .put("samples", media.samples)
                            .put("minBlock", media.minBlock)
                            .put("maxBlock", media.maxBlock)
                            .put("maxFrame", media.maxFrame);
            JSONObject header =
                    new JSONObject()
                            .put("codec", media.source)
                            .put("bits", media.bits)
                            .put("rate", media.rate)
                            .put("channels", media.channels)
                            .put("seconds", seconds);
            JSONObject row =
                    new JSONObject()
                            .put("id", chat + "_" + message + "_" + entry)
                            .put("chat", chat)
                            .put("message", message)
                            .put("entry", entry)
                            .put("file", audio.getInt("file"))
                            .put("size", CueAudio.size(end - start, media.channels, media.bits))
                            .put("title", t.title.isEmpty() ? "Track " + t.number : t.title)
                            .put("artist", t.performer.isEmpty() ? albumArtist : t.performer)
                            .put("duration", seconds)
                            .put("format", "wav")
                            .put("mime", "audio/wav")
                            .put("fileName", audio.optString("fileName"))
                            .put("tagged", true)
                            .put("album", albumTitle)
                            .put("track", t.number)
                            .put("header", header)
                            .put("cue", cue);
            if (audio.has("zip")) row.put("zip", audio.getJSONObject("zip"));
            if (audio.has("unique")) row.put("unique", audio.getString("unique") + "#" + t.number);
            rows.add(row);
        }
        return rows;
    }

    /** Whether an id is a track of a cue sheet, rather than a song in a zip. */
    static boolean isTrack(long entry) {
        return entry >= BASE;
    }

    /** The album file's entry in its zip (0 for a post's own file) for a track's entry. */
    static int albumEntry(long entry) {
        return (int) ((entry - BASE) / 100);
    }

    /** "Album.flac" and "album.wav" name the same album: names compare without their type. */
    static String base(String name) {
        String n = name == null ? "" : name.trim();
        int slash = Math.max(n.lastIndexOf('/'), n.lastIndexOf('\\'));
        if (slash >= 0) n = n.substring(slash + 1);
        int dot = n.lastIndexOf('.');
        if (dot > 0) n = n.substring(0, dot);
        return n.toLowerCase(Locale.ROOT);
    }

    /** Whether a file name is an album file a sheet can point at. */
    static boolean albumFile(String name) {
        String n = name == null ? "" : name.toLowerCase(Locale.ROOT);
        return n.endsWith(".flac") || n.endsWith(".wav");
    }
}
