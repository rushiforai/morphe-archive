package me.dyskal.ytmrpc;

import android.media.MediaMetadata;

import java.net.URI;
import java.net.URLDecoder;

/** Immutable metadata snapshot shared by text, hyperlinks, and asynchronous artwork lookup. */
public final class DiscordTrack {
    public final String title, artist, album, videoId, artworkUrl, songUrl, artistUrl, albumUrl;

    public DiscordTrack(String title, String artist, String album, String mediaId, String imageUrl) {
        this(title, artist, album, mediaId, imageUrl, null, null);
    }

    public DiscordTrack(String title, String artist, String album, String mediaId, String imageUrl,
                        String artistId, String albumId) {
        this.title = clean(title); this.artist = clean(artist); this.album = clean(album);
        videoId = videoId(mediaId);
        songUrl = videoId == null ? null : "https://music.youtube.com/watch?v=" + videoId;
        artistUrl = artistId != null && artistId.matches("UC[A-Za-z0-9_-]{22}")
                ? "https://music.youtube.com/channel/" + artistId : null;
        albumUrl = albumId != null && albumId.matches("MPRE[A-Za-z0-9_-]{4,100}")
                ? "https://music.youtube.com/browse/" + albumId : null;
        artworkUrl = publicUrl(imageUrl) != null ? imageUrl
                : fallbackArtwork(videoId);
    }

    public DiscordTrack enrich(DiscordNativeMetadata nativeData, String currentVideoId) {
        String id = videoId(currentVideoId) != null ? currentVideoId : videoId;
        String image = videoId != null && !videoId.equals(id) && artworkUrl.equals(fallbackArtwork(videoId)) ? null : artworkUrl;
        if (nativeData == null || (id != null && !id.equals(nativeData.videoId))) {
            return new DiscordTrack(title, artist, album, id, image);
        }
        return new DiscordTrack(nativeData.title.isEmpty() ? title : nativeData.title,
                nativeData.artist.isEmpty() ? artist : nativeData.artist,
                nativeData.album.isEmpty() ? album : nativeData.album, nativeData.videoId,
                nativeData.artworkUrl == null ? image : nativeData.artworkUrl,
                nativeData.artistId, nativeData.albumId);
    }

    private static String fallbackArtwork(String id) { return id == null ? null : "https://i.ytimg.com/vi/" + id + "/hqdefault.jpg"; }

    public static DiscordTrack from(MediaMetadata metadata) {
        String id = metadata.getString(MediaMetadata.METADATA_KEY_MEDIA_ID);
        if (videoId(id) == null) id = metadata.getString(MediaMetadata.METADATA_KEY_MEDIA_URI);
        String image = null;
        for (String key : new String[]{MediaMetadata.METADATA_KEY_ALBUM_ART_URI,
                MediaMetadata.METADATA_KEY_ART_URI, MediaMetadata.METADATA_KEY_DISPLAY_ICON_URI}) {
            String candidate = metadata.getString(key);
            if (publicUrl(candidate) != null) { image = candidate; break; }
        }
        String artist = metadata.getString(MediaMetadata.METADATA_KEY_ARTIST);
        if (clean(artist).isEmpty()) artist = metadata.getString(MediaMetadata.METADATA_KEY_ALBUM_ARTIST);
        return new DiscordTrack(metadata.getString(MediaMetadata.METADATA_KEY_TITLE), artist,
                metadata.getString(MediaMetadata.METADATA_KEY_ALBUM), id, image);
    }

    public String key() { return title + '\n' + artist + '\n' + album + '\n' + videoId + '\n' + artworkUrl + '\n' + artistUrl + '\n' + albumUrl; }
    public static String publicUrl(String value) {
        if (value == null || value.isEmpty()) return null;
        try {
            URI uri = new URI(value);
            return ("https".equalsIgnoreCase(uri.getScheme()) || "http".equalsIgnoreCase(uri.getScheme()))
                    && uri.getHost() != null && uri.getUserInfo() == null ? value : null;
        } catch (Exception ignored) { return null; }
    }
    public static String videoId(String value) {
        if (value == null) return null;
        if (value.matches("[A-Za-z0-9_-]{11}")) return value;
        try {
            URI uri = new URI(value);
            String host = uri.getHost();
            if (host == null || publicUrl(value) == null) return null;
            if ("youtu.be".equalsIgnoreCase(host)) {
                String path = uri.getPath();
                String id = path != null && path.startsWith("/") ? path.substring(1) : "";
                return id.matches("[A-Za-z0-9_-]{11}") ? id : null;
            }
            host = host.toLowerCase(java.util.Locale.ROOT);
            if (!(host.equals("youtube.com") || host.endsWith(".youtube.com")) || uri.getRawQuery() == null) return null;
            for (String parameter : uri.getRawQuery().split("&")) {
                if (parameter.startsWith("v=")) {
                    String id = URLDecoder.decode(parameter.substring(2), "UTF-8");
                    return id.matches("[A-Za-z0-9_-]{11}") ? id : null;
                }
            }
        } catch (Exception ignored) { }
        return null;
    }
    private static String clean(String value) { return value == null ? "" : value.trim(); }
}
