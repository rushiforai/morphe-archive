package me.dyskal.ytmrpc;

import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import java.nio.charset.CodingErrorAction;
import java.util.ArrayList;
import java.util.List;

/** Reads the stable PlaylistPanelVideoRenderer wire schema, not obfuscated Java field names. */
public final class DiscordNativeMetadata {
    public final String videoId, title, artist, album, artistId, albumId, artworkUrl;
    private DiscordNativeMetadata(String videoId, String title, String artist, String album,
                                  String artistId, String albumId, String artworkUrl) {
        this.videoId = videoId; this.title = title; this.artist = artist; this.album = album;
        this.artistId = artistId; this.albumId = albumId; this.artworkUrl = artworkUrl;
    }
    public static DiscordNativeMetadata parse(byte[] renderer) throws Exception {
        if (renderer == null || renderer.length > 1_048_576) throw new IllegalArgumentException("Invalid native metadata size");
        List<Field> root = fields(renderer);
        String video = text(bytes(root, 10));
        if (DiscordTrack.videoId(video) == null) return null;
        String title = richText(bytes(root, 1));
        String artist = "", album = "", artistId = null, albumId = null;
        // Field 12 is longBylineText; field 2 is shortBylineText. Restrict endpoint scans to their runs.
        for (int field : new int[]{12, 2}) {
            byte[] byline = bytes(root, field);
            if (byline == null) continue;
            for (Field runField : fields(byline)) {
                if (runField.number != 1 || runField.data == null) continue;
                List<Field> run = fields(runField.data);
                String label = text(bytes(run, 1));
                List<String> ids = new ArrayList<>(); collectBrowseIds(bytes(run, 5), 0, ids);
                for (String id : ids) {
                    if (artistId == null && id.matches("UC[A-Za-z0-9_-]{22}")) { artistId = id; artist = label; }
                    if (albumId == null && id.startsWith("MPRE")) { albumId = id; album = label; }
                }
            }
        }
        // Android's byline can omit the album endpoint. The current renderer's own
        // "Go to album" menu item still has it; do not scan service items or other tracks.
        if (albumId == null) albumId = menuAlbumId(bytes(root, 19));
        String artwork = null; long width = -1;
        byte[] thumbnails = bytes(root, 3);
        if (thumbnails != null) for (Field entry : fields(thumbnails)) {
            if (entry.number != 1 || entry.data == null) continue;
            List<Field> image = fields(entry.data);
            String url = text(bytes(image, 1));
            long candidateWidth = scalar(image, 2);
            if (DiscordTrack.publicUrl(url) != null && candidateWidth >= width) { artwork = url; width = candidateWidth; }
        }
        return new DiscordNativeMetadata(video, title, artist, album, artistId, albumId, artwork);
    }
    private static String menuAlbumId(byte[] menuWrapper) throws Exception {
        if (menuWrapper == null) return null;
        byte[] menu = bytes(fields(menuWrapper), 66439850); // MenuRenderer.
        if (menu == null) return null;
        String albumId = null;
        for (Field item : fields(menu)) {
            if (item.number != 1 || item.data == null) continue;
            byte[] navigationItem = bytes(fields(item.data), 66441108); // MenuNavigationItemRenderer.
            if (navigationItem == null) continue;
            byte[] endpoint = bytes(fields(navigationItem), 3);
            if (endpoint == null) continue;
            byte[] browse = bytes(fields(endpoint), 48687626); // BrowseEndpoint.
            if (browse == null) continue;
            String id = text(bytes(fields(browse), 2));
            if (!id.matches("MPRE[A-Za-z0-9_-]{4,100}")) continue;
            if (albumId != null && !albumId.equals(id)) return null; // Ambiguous menu: do not guess.
            albumId = id;
        }
        return albumId;
    }
    private static String richText(byte[] data) throws Exception {
        if (data == null) return "";
        StringBuilder text = new StringBuilder();
        List<Field> message = fields(data);
        for (Field run : message) if (run.number == 1 && run.data != null) text.append(text(bytes(fields(run.data), 1)));
        return text.length() == 0 ? text(bytes(message, 4)) : text.toString();
    }
    private static void collectBrowseIds(byte[] data, int depth, List<String> result) {
        if (data == null || depth > 8) return;
        try {
            for (Field field : fields(data)) if (field.data != null) {
                String value = text(field.data);
                if (value.matches("UC[A-Za-z0-9_-]{22}") || value.matches("MPRE[A-Za-z0-9_-]{4,100}")) result.add(value);
                else collectBrowseIds(field.data, depth + 1, result);
            }
        } catch (Exception ignored) { /* Text leaves are not protobuf messages. */ }
    }
    private static final class Field {
        final int number; final byte[] data; final long value;
        Field(int number, byte[] data, long value) { this.number = number; this.data = data; this.value = value; }
    }
    private static List<Field> fields(byte[] data) throws Exception {
        List<Field> result = new ArrayList<>(); int[] cursor = {0};
        while (cursor[0] < data.length) {
            if (result.size() >= 4096) throw new IllegalArgumentException("Too many metadata fields");
            long tag = varint(data, cursor); int number = (int) (tag >>> 3), type = (int) (tag & 7);
            if (number <= 0) throw new IllegalArgumentException("Invalid metadata tag");
            if (type == 0) result.add(new Field(number, null, varint(data, cursor)));
            else if (type == 2) {
                long length = varint(data, cursor);
                if (length < 0 || length > data.length - cursor[0]) throw new IllegalArgumentException("Truncated metadata field");
                int end = cursor[0] + (int) length;
                result.add(new Field(number, java.util.Arrays.copyOfRange(data, cursor[0], end), 0)); cursor[0] = end;
            } else if (type == 1 || type == 5) {
                int length = type == 1 ? 8 : 4;
                if (length > data.length - cursor[0]) throw new IllegalArgumentException("Truncated scalar");
                cursor[0] += length;
            } else throw new IllegalArgumentException("Unsupported metadata wire type");
        }
        return result;
    }
    private static long varint(byte[] data, int[] cursor) {
        long value = 0;
        for (int shift = 0; shift < 64 && cursor[0] < data.length; shift += 7) {
            int next = data[cursor[0]++] & 255; value |= (long) (next & 127) << shift;
            if ((next & 128) == 0) return value;
        }
        throw new IllegalArgumentException("Invalid metadata varint");
    }
    private static byte[] bytes(List<Field> fields, int number) { for (Field field : fields) if (field.number == number && field.data != null) return field.data; return null; }
    private static long scalar(List<Field> fields, int number) { for (Field field : fields) if (field.number == number && field.data == null) return field.value; return 0; }
    private static String text(byte[] bytes) {
        if (bytes == null) return "";
        try { return StandardCharsets.UTF_8.newDecoder().onMalformedInput(CodingErrorAction.REPORT)
                .onUnmappableCharacter(CodingErrorAction.REPORT).decode(ByteBuffer.wrap(bytes)).toString(); }
        catch (Exception ignored) { return ""; }
    }
}
