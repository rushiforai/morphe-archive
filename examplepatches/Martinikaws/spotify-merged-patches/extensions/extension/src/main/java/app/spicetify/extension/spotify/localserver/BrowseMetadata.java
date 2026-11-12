package app.spicetify.extension.spotify.localserver;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/** Provider facts used for browsing; stream identity stays in RemoteTrack. */
final class BrowseMetadata {
    static final class ArtistCredit {
        final String id;
        final String name;

        ArtistCredit(String id, String name) {
            this.id = id;
            this.name = name;
        }
    }

    final String albumId;
    final String parentId;
    final String albumArtist;
    final String albumImageTag;
    final List<ArtistCredit> artists;
    final List<ArtistCredit> albumArtists;
    final int discNumber;
    final int trackNumber;
    /** The release year, or 0 when the server does not know it. */
    final int year;

    BrowseMetadata(String albumId, String parentId, String albumArtist, String albumImageTag,
            List<ArtistCredit> artists, List<ArtistCredit> albumArtists, int discNumber, int trackNumber) {
        this(albumId, parentId, albumArtist, albumImageTag, artists, albumArtists, discNumber, trackNumber, 0);
    }

    BrowseMetadata(String albumId, String parentId, String albumArtist, String albumImageTag,
            List<ArtistCredit> artists, List<ArtistCredit> albumArtists, int discNumber, int trackNumber, int year) {
        this.albumId = albumId;
        this.parentId = parentId;
        this.albumArtist = albumArtist;
        this.albumImageTag = albumImageTag;
        this.artists = Collections.unmodifiableList(new ArrayList<>(artists));
        this.albumArtists = Collections.unmodifiableList(new ArrayList<>(albumArtists));
        this.discNumber = discNumber;
        this.trackNumber = trackNumber;
        this.year = year;
    }

    static BrowseMetadata empty() {
        return new BrowseMetadata("", "", "", "", Collections.emptyList(), Collections.emptyList(), 0, 0);
    }

    static BrowseMetadata webDav(String artist, String albumArtist, int discNumber, int trackNumber) {
        List<ArtistCredit> artists = artist == null || artist.isEmpty() ? Collections.emptyList()
                : Collections.singletonList(new ArtistCredit("", artist));
        String albumName = albumArtist == null ? "" : albumArtist;
        List<ArtistCredit> albumArtists = albumName.isEmpty() ? Collections.emptyList()
                : Collections.singletonList(new ArtistCredit("", albumName));
        return new BrowseMetadata("", "", albumName, "", artists, albumArtists, discNumber, trackNumber);
    }
}
