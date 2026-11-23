package dev.materialtidal.extension.tidal.linn;

import java.util.Locale;

/**
 * Generates standard UPnP {@code DIDL-Lite} metadata XML for OpenHome {@code Playlist:1.Insert}.
 */
public final class LinnDidlMetadataBuilder {

    private LinnDidlMetadataBuilder() {
    }

    public static String buildDidlLite(
            String trackId,
            String title,
            String artist,
            String album,
            String coverUuid,
            int durationMs,
            String streamUri,
            String mimeType,
            int sampleRate,
            int bitDepth
    ) {
        String safeId = LinnRawHttpClient.escapeXml(trackId != null ? trackId : "0");
        String safeTitle = LinnRawHttpClient.escapeXml(nonEmpty(title, "TIDAL Track"));
        String safeArtist = LinnRawHttpClient.escapeXml(nonEmpty(artist, "TIDAL"));
        String safeAlbum = LinnRawHttpClient.escapeXml(album != null ? album : "");
        String safeUri = LinnRawHttpClient.escapeXml(streamUri != null ? streamUri : "");
        String safeMime = LinnRawHttpClient.escapeXml(nonEmpty(mimeType, "audio/flac"));

        StringBuilder sb = new StringBuilder(512);
        sb.append("<DIDL-Lite xmlns=\"urn:schemas-upnp-org:metadata-1-0/DIDL-Lite/\" ")
                .append("xmlns:dc=\"http://purl.org/dc/elements/1.1/\" ")
                .append("xmlns:upnp=\"urn:schemas-upnp-org:metadata-1-0/upnp/\">");
        sb.append("<item id=\"").append(safeId).append("\" parentID=\"0\" restricted=\"1\">");
        sb.append("<dc:title>").append(safeTitle).append("</dc:title>");
        sb.append("<dc:creator>").append(safeArtist).append("</dc:creator>");
        sb.append("<upnp:artist>").append(safeArtist).append("</upnp:artist>");
        if (!safeAlbum.isEmpty()) {
            sb.append("<upnp:album>").append(safeAlbum).append("</upnp:album>");
        }
        String artUrl = buildCoverUrl(coverUuid);
        if (artUrl != null) {
            sb.append("<upnp:albumArtURI>").append(LinnRawHttpClient.escapeXml(artUrl)).append("</upnp:albumArtURI>");
        }
        sb.append("<upnp:class>object.item.audioItem.musicTrack</upnp:class>");
        sb.append("<res protocolInfo=\"http-get:*:").append(safeMime)
                .append(":DLNA.ORG_OP=01;DLNA.ORG_CI=0\"");
        if (durationMs > 0) {
            sb.append(" duration=\"").append(formatDidlDuration(durationMs)).append("\"");
        }
        if (sampleRate > 0) {
            sb.append(" sampleFrequency=\"").append(sampleRate).append("\"");
        }
        if (bitDepth > 0) {
            sb.append(" bitsPerSample=\"").append(bitDepth).append("\"");
        }
        sb.append(" nrAudioChannels=\"2\">").append(safeUri).append("</res>");
        sb.append("</item></DIDL-Lite>");
        return sb.toString();
    }

    public static String buildCoverUrl(String coverUuid) {
        if (coverUuid == null) {
            return null;
        }
        String trimmed = coverUuid.trim();
        if (trimmed.isEmpty()) {
            return null;
        }
        if (trimmed.startsWith("http://") || trimmed.startsWith("https://")) {
            return trimmed;
        }
        String path = trimmed.replace('-', '/');
        return "https://resources.tidal.com/images/" + path + "/640x640.jpg";
    }

    static String formatDidlDuration(int durationMs) {
        int totalSec = Math.max(0, durationMs / 1000);
        int hours = totalSec / 3600;
        int minutes = (totalSec % 3600) / 60;
        int seconds = totalSec % 60;
        return String.format(Locale.ROOT, "%d:%02d:%02d", hours, minutes, seconds);
    }

    private static String nonEmpty(String value, String fallback) {
        return (value != null && !value.trim().isEmpty()) ? value.trim() : fallback;
    }
}
