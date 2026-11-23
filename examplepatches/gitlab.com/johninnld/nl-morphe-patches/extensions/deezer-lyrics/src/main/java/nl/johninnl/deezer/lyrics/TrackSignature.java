package nl.johninnl.deezer.lyrics;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.Normalizer;
import java.math.BigDecimal;
import java.util.Locale;
import java.util.Objects;

/** Native identity is local only. Send track metadata, never account or session information. */
public final class TrackSignature {
    public final String nativeId, title, artist, album;
    public final double durationSeconds;

    public TrackSignature(String nativeId, String title, String artist, String album, double durationSeconds) {
        this.nativeId = required(nativeId);
        this.title = required(title);
        this.artist = required(artist);
        this.album = album == null ? "" : album.trim();
        if (this.album.length() > 512 || !Double.isFinite(durationSeconds) ||
                durationSeconds < 1 || durationSeconds > 3600) throw new IllegalArgumentException("Invalid track signature");
        this.durationSeconds = durationSeconds;
    }

    public static TrackSignature fromMillis(String nativeId, String title, String artist, String album, long durationMs) {
        try { return new TrackSignature(nativeId, title, artist, album, durationMs / 1000.0); }
        catch (IllegalArgumentException incomplete) {
            LyricsDiagnostics.event("signature_invalid durationMs=" + durationMs);
            return null;
        }
    }

    private static String required(String value) {
        if (value == null || value.trim().isEmpty() || value.length() > 512)
            throw new IllegalArgumentException("Incomplete track signature");
        return value.trim();
    }

    static String normalized(String value) {
        if (value == null) return "";
        return Normalizer.normalize(value, Normalizer.Form.NFKC).toLowerCase(Locale.ROOT)
                .replace('\u2019', '\'').replace('\u2018', '\'').replace("'", "")
                .replaceAll("[\\s\\p{Z}]+", " ").trim();
    }

    static boolean unspecifiedAlbum(String value) {
        String n = normalized(value);
        return n.isEmpty() || n.equals("-");
    }

    boolean matches(String recordTitle, String recordArtist, String recordAlbum, double seconds) {
        boolean titleMatches = normalized(title).equals(normalized(recordTitle));
        boolean artistMatches = normalized(artist).equals(normalized(recordArtist));
        boolean albumMatches = unspecifiedAlbum(album) || unspecifiedAlbum(recordAlbum) || normalized(album).equals(normalized(recordAlbum));
        boolean durationMatches = Double.isFinite(seconds) && Math.abs(seconds - durationSeconds) <= 2.0;
        LyricsDiagnostics.event("match title=" + titleMatches + " artist=" + artistMatches +
                " album=" + albumMatches + " duration=" + durationMatches);
        return titleMatches && artistMatches && albumMatches && durationMatches;
    }

    public String query() {
        String query = "track_name=" + encode(title) + "&artist_name=" + encode(artist);
        if (!unspecifiedAlbum(album)) query += "&album_name=" + encode(album);
        return query + "&duration=" + BigDecimal.valueOf(durationSeconds).stripTrailingZeros().toPlainString();
    }

    private static String encode(String value) {
        // The Android API supports this Charset overload from API 33 only; use its UTF-8 name.
        try { return URLEncoder.encode(value, StandardCharsets.UTF_8.name()); }
        catch (java.io.UnsupportedEncodingException impossible) { throw new AssertionError(impossible); }
    }

    @Override public boolean equals(Object other) {
        if (!(other instanceof TrackSignature)) return false;
        TrackSignature s = (TrackSignature) other;
        return nativeId.equals(s.nativeId) && title.equals(s.title) && artist.equals(s.artist) &&
                album.equals(s.album) && Double.compare(durationSeconds, s.durationSeconds) == 0;
    }
    @Override public int hashCode() { return Objects.hash(nativeId, title, artist, album, durationSeconds); }
}
