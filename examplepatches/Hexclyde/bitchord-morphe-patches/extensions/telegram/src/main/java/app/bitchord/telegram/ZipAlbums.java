package app.bitchord.telegram;

import org.drinkless.tdlib.TdApi;
import org.json.JSONObject;

import java.util.*;
import java.util.zip.Inflater;

/**
 * Albums shared as zip files: each song inside becomes a file of its own in the saved index, named
 * from its file name and with its length and format from its header, so it can be found, matched
 * and played like any other.
 */
final class ZipAlbums {
    private ZipAlbums() {}

    /** Bytes read from the start of each song: its local header and enough for any tag. */
    static final int HEAD = 64 * 1024;

    /** No album has more songs than this; anything beyond is left out. */
    static final int MAX_SONGS = 500;

    /** A zip post, as the index queues it, or null for anything else. */
    static JSONObject descriptor(TdApi.Message m) throws Exception {
        if (m == null || m.chatId == 0 || m.id <= 0 || !MediaPolicy.savable(m)) return null;
        if (!(m.content instanceof TdApi.MessageDocument)) return null;
        TdApi.Document d = ((TdApi.MessageDocument) m.content).document;
        if (d == null || d.document == null || d.fileName == null) return null;
        if (!d.fileName.toLowerCase(Locale.ROOT).endsWith(".zip")) return null;
        JSONObject zip =
                new JSONObject()
                        .put("chat", m.chatId)
                        .put("message", m.id)
                        .put("file", d.document.id)
                        .put("size", d.document.size)
                        .put("fileName", d.fileName);
        String unique = d.document.remote == null ? null : d.document.remote.uniqueId;
        if (unique != null && !unique.isEmpty()) zip.put("unique", unique);
        return zip;
    }

    /** The songs in a zip, read through {@code range}. */
    static List<JSONObject> songs(JSONObject zip, ZipDirectory.Range range) throws Exception {
        long chat = zip.getLong("chat"), message = zip.getLong("message");
        List<ZipDirectory.Entry> entries = ZipDirectory.read(range, zip.getLong("size"));
        String zipArtist = TrackDetails.fromFileName(zip.optString("fileName"), "")[1];
        List<JSONObject> rows = new ArrayList<>();
        for (ZipDirectory.Entry e : entries) {
            if (!e.playable()) continue;
            if (rows.size() >= MAX_SONGS) break;
            long length = Math.min(30 + 2048 + HEAD, zip.getLong("size") - e.localOffset);
            byte[] local = range.read(e.localOffset, (int) length);
            long data = ZipDirectory.dataOffset(local, e);
            int skip = (int) (data - e.localOffset);
            byte[] head = start(local, skip, e);
            JSONObject header = AudioHeader.parse(head, head.length);

            String[] name = TrackDetails.fromFileName(e.baseName(), "");
            String artist = name[1];
            if (artist.isEmpty()) {
                String folderArtist = TrackDetails.fromFileName(e.folder(), "")[1];
                artist = !folderArtist.isEmpty() ? folderArtist : zipArtist;
            }
            String ext = e.extension();
            JSONObject row =
                    new JSONObject()
                            .put("id", chat + "_" + message + "_" + e.index)
                            .put("chat", chat)
                            .put("message", message)
                            .put("entry", e.index)
                            .put("file", zip.getInt("file"))
                            .put("size", e.size)
                            .put("title", name[0])
                            .put("artist", artist)
                            .put("duration", header == null ? 0 : header.optInt("seconds"))
                            .put("format", ext)
                            .put("mime", mime(ext))
                            .put("fileName", e.baseName())
                            .put("tagged", false)
                            .put(
                                    "album",
                                    e.folder().isEmpty() ? zip.optString("fileName") : e.folder())
                            .put(
                                    "zip",
                                    new JSONObject()
                                            .put("data", data)
                                            .put("method", e.method)
                                            .put("compressed", e.compressedSize));
            if (header != null) row.put("header", header);
            if (zip.has("unique")) row.put("unique", zip.getString("unique") + "/" + e.index);
            rows.add(row);
        }
        rows.addAll(cueTracks(zip, range, entries, rows));
        return rows;
    }

    /**
     * Tracks of albums in the zip kept as one FLAC or WAV file: from a .cue file beside it in the
     * zip, or the FLAC file's own cue sheet. A sheet that can't be read is passed over.
     */
    static List<JSONObject> cueTracks(
            JSONObject zip,
            ZipDirectory.Range range,
            List<ZipDirectory.Entry> entries,
            List<JSONObject> songs) {
        List<JSONObject> tracks = new ArrayList<>();
        Map<String, JSONObject> albums = new HashMap<>();
        for (JSONObject song : songs)
            if (CueAlbums.albumFile(song.optString("fileName")))
                albums.put(CueAlbums.base(song.optString("fileName")), song);
        Set<Integer> done = new HashSet<>();
        for (ZipDirectory.Entry e : entries) {
            if (!e.extension().equals("cue") || e.size <= 0 || e.size > CueAlbums.MAX_SHEET)
                continue;
            try {
                byte[] local =
                        range.read(e.localOffset, (int) Math.min(30 + 2048, zip.getLong("size")));
                long data = ZipDirectory.dataOffset(local, e);
                ZipDirectory.Range text =
                        entryRange(range, data, e.method, e.compressedSize, e.size);
                CueSheet sheet = CueSheet.parse(CueSheet.text(text.read(0, (int) e.size)));
                if (sheet == null) continue;
                JSONObject album = albums.get(CueAlbums.base(sheet.file));
                if (album == null) album = albums.get(CueAlbums.base(e.baseName()));
                if (album == null || done.contains(album.getInt("entry"))) continue;
                tracks.addAll(tracks(range, sheet, album));
                done.add(album.getInt("entry"));
            } catch (Exception ex) {
                // A sheet that can't be read leaves the album as one file.
            }
        }
        for (JSONObject album : albums.values()) {
            if (done.contains(album.optInt("entry"))
                    || !album.optString("format").equals("flac")
                    || album.optInt("duration") < CueAlbums.ALBUM_SECONDS) continue;
            try {
                JSONObject part = album.getJSONObject("zip");
                CueAlbums.Media media =
                        CueAlbums.media(
                                entryRange(
                                        range,
                                        part.getLong("data"),
                                        part.getInt("method"),
                                        part.getLong("compressed"),
                                        album.getLong("size")),
                                album.getLong("size"));
                CueSheet sheet = media == null ? null : CueAlbums.embeddedSheet(media.flac);
                if (sheet != null)
                    tracks.addAll(
                            CueAlbums.tracks(
                                    sheet,
                                    media,
                                    album,
                                    album.getInt("entry"),
                                    album.optString("album")));
            } catch (Exception ex) {
                // No sheet of its own.
            }
        }
        return tracks;
    }

    private static List<JSONObject> tracks(
            ZipDirectory.Range range, CueSheet sheet, JSONObject album) throws Exception {
        JSONObject part = album.getJSONObject("zip");
        CueAlbums.Media media =
                CueAlbums.media(
                        entryRange(
                                range,
                                part.getLong("data"),
                                part.getInt("method"),
                                part.getLong("compressed"),
                                album.getLong("size")),
                        album.getLong("size"));
        if (media == null) return new ArrayList<>();
        return CueAlbums.tracks(
                sheet, media, album, album.getInt("entry"), album.optString("album"));
    }

    /** A file in a zip read as a range of its own bytes, decompressing as needed. */
    static ZipDirectory.Range entryRange(
            ZipDirectory.Range zip, long data, int method, long compressed, long size) {
        ZipDirectory.EntryReader reader =
                new ZipDirectory.EntryReader(zip, data, method, compressed, size);
        return (offset, length) -> {
            byte[] out = new byte[(int) Math.max(0, Math.min(length, size - offset))];
            int n = 0;
            while (n < out.length) {
                int got = reader.read(offset + n, out, n, out.length - n);
                if (got <= 0) break;
                n += got;
            }
            return n == out.length ? out : Arrays.copyOf(out, n);
        };
    }

    /** The first bytes of a song, decompressed if it was deflated. */
    static byte[] start(byte[] local, int skip, ZipDirectory.Entry e) {
        if (skip >= local.length) return new byte[0];
        if (e.method == ZipDirectory.STORED)
            return Arrays.copyOfRange(
                    local, skip, (int) Math.min(local.length, skip + Math.min(HEAD, e.size)));
        Inflater inflater = new Inflater(true);
        try {
            inflater.setInput(local, skip, local.length - skip);
            byte[] out = new byte[HEAD];
            int n = 0;
            while (n < out.length && !inflater.finished() && !inflater.needsInput()) {
                int got = inflater.inflate(out, n, out.length - n);
                if (got == 0) break;
                n += got;
            }
            return Arrays.copyOf(out, n);
        } catch (Exception ex) {
            return new byte[0];
        } finally {
            inflater.end();
        }
    }

    static String mime(String ext) {
        switch (ext) {
            case "flac":
                return "audio/flac";
            case "wav":
                return "audio/wav";
            case "aif":
            case "aiff":
                return "audio/aiff";
            case "m4a":
            case "alac":
                return "audio/mp4";
            case "mp3":
                return "audio/mpeg";
            case "ogg":
                return "audio/ogg";
            case "opus":
                return "audio/opus";
            default:
                return "audio/aac";
        }
    }

    /** "-100_42_3" for the third file in the zip posted as message 42. */
    static boolean validId(String id) {
        return id != null
                && id.length() <= 48
                && id.matches("-?[1-9][0-9]*_[1-9][0-9]*_[1-9][0-9]{0,8}");
    }

    /** {chat, message, entry} of a zip song's id. */
    static long[] parse(String id) {
        String[] parts = id.split("_");
        return new long[] {
            Long.parseLong(parts[0]), Long.parseLong(parts[1]), Long.parseLong(parts[2])
        };
    }
}
