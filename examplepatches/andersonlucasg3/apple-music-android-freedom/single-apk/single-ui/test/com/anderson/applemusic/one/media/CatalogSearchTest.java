package com.anderson.applemusic.one.media;

import java.util.List;

/**
 * Plain-JVM test for the amp-api JSON parsers ({@link CatalogSearch}); no Android class is
 * instantiated, so it runs on the build runner. The fixtures are trimmed copies of the real
 * {@code /v1/catalog/<sf>/{search,albums,artists,playlists}} responses, including the
 * {@code {w}}/{@code {h}} artwork placeholders and the {@code relationships} blocks the
 * detail screens read.
 */
public final class CatalogSearchTest {

    private static int checks;

    public static void main(String[] args) throws Exception {
        search();
        album();
        artist();
        playlist();
        tracks();
        invalid();
        System.out.println("CatalogSearchTest: OK (" + checks + " checks)");
    }

    private static final String SEARCH = "{"
            + "\"results\":{"
            + "\"songs\":{\"data\":[{\"id\":\"1445027335\","
            + "\"attributes\":{\"name\":\"A Capella\",\"artistName\":\"Tim Halperin\","
            + "\"artwork\":{\"url\":\"https://is1.mzstatic.com/{w}x{h}.jpg\"}}}]},"
            + "\"albums\":{\"data\":[{\"id\":\"1440920100\","
            + "\"attributes\":{\"name\":\"Back In Black\",\"artistName\":\"AC/DC\","
            + "\"artwork\":{\"url\":\"https://is2.mzstatic.com/{w}x{h}.jpg\"}}}]},"
            + "\"artists\":{\"data\":[{\"id\":\"5040714\","
            + "\"attributes\":{\"name\":\"AC/DC\",\"genreNames\":[\"Hard Rock\",\"Rock\"],"
            + "\"artwork\":{\"url\":\"https://is3.mzstatic.com/{w}x{h}.jpg\"}}}]},"
            + "\"playlists\":{\"data\":[{\"id\":\"pl.331\","
            + "\"attributes\":{\"name\":\"Essenciais\",\"curatorName\":\"Apple Music\","
            + "\"artwork\":{\"url\":\"https://is4.mzstatic.com/{w}x{h}.jpg\"}}}]}"
            + "}}";

    private static void search() {
        List<CatalogSearch.Result> results = CatalogSearch.parse(SEARCH);
        check("search has one result per type", results.size() == 4);
        check("song id", "1445027335".equals(results.get(0).id));
        check("song kind", "Música".equals(results.get(0).kind));
        check("song title", "A Capella".equals(results.get(0).title));
        check("song artist", "Tim Halperin".equals(results.get(0).artist));
        check("album kind", "Álbum".equals(results.get(1).kind));
        check("artist kind", "Artista".equals(results.get(2).kind));
        check("playlist kind", "Playlist".equals(results.get(3).kind));
        check("artist genre fallback", "Hard Rock".equals(results.get(2).artist));
        check("playlist curator", "Apple Music".equals(results.get(3).artist));
        check("artwork size", "https://is1.mzstatic.com/300x300.jpg"
                .equals(results.get(0).artworkUrl));
    }

    private static final String ALBUM = "{\"data\":[{\"id\":\"1445027335\","
            + "\"attributes\":{\"name\":\"A Capella\",\"artistName\":\"Tim Halperin\","
            + "\"copyright\":\"\u2117 2012\",\"recordLabel\":\"Tim Halperin\","
            + "\"releaseDate\":\"2012-10-16\",\"trackCount\":1,"
            + "\"genreNames\":[\"Pop\"],"
            + "\"artwork\":{\"url\":\"https://is1.mzstatic.com/{w}x{h}.jpg\"}},"
            + "\"relationships\":{"
            + "\"artists\":{\"data\":[{\"id\":\"404\","
            + "\"attributes\":{\"name\":\"Tim Halperin\"}}]},"
            + "\"tracks\":{\"data\":[{\"id\":\"song-1\","
            + "\"attributes\":{\"name\":\"A Capella\",\"artistName\":\"Tim Halperin\","
            + "\"albumName\":\"A Capella - Single\",\"durationInMillis\":203000,"
            + "\"trackNumber\":1,\"discNumber\":1}}]}"
            + "}}]}";

    private static void album() throws Exception {
        CatalogSearch.AlbumDetail detail = CatalogSearch.albumDetail(ALBUM, "fallback");
        check("album parsed", detail != null);
        check("album title", "A Capella".equals(detail.title));
        check("album artist", "Tim Halperin".equals(detail.artist));
        check("album artist id", "404".equals(detail.artistId));
        check("album year", "2012".equals(detail.year()));
        check("album track count", detail.trackCount == 1);
        check("album artwork", "https://is1.mzstatic.com/600x600.jpg"
                .equals(detail.artworkUrl));
        check("album label", "Tim Halperin".equals(detail.recordLabel));
        check("album tracks", detail.tracks.size() == 1);
        CatalogSearch.Track track = detail.tracks.get(0);
        check("track id", "song-1".equals(track.id));
        check("track album fallback", "A Capella - Single".equals(track.albumName));
        check("track duration", "3:23".equals(track.durationText()));
        check("track number", track.trackNumber == 1);
    }

    private static final String ARTIST = "{\"data\":[{\"id\":\"5040714\","
            + "\"attributes\":{\"name\":\"AC/DC\",\"genreNames\":[\"Hard Rock\",\"Rock\"],"
            + "\"artwork\":{\"url\":\"https://is3.mzstatic.com/{w}x{h}.jpg\"}},"
            + "\"relationships\":{\"albums\":{\"data\":["
            + "{\"id\":\"574050396\",\"attributes\":{\"name\":\"Back In Black\","
            + "\"artistName\":\"AC/DC\","
            + "\"artwork\":{\"url\":\"https://is5.mzstatic.com/{w}x{h}.jpg\"}}},"
            + "{\"id\":\"1440920100\",\"attributes\":{\"name\":\"Rock or Bust\","
            + "\"artistName\":\"AC/DC\"}}"
            + "]}}}]}";

    private static void artist() throws Exception {
        CatalogSearch.ArtistDetail detail = CatalogSearch.artistDetail(ARTIST, "fallback");
        check("artist parsed", detail != null);
        check("artist name", "AC/DC".equals(detail.name));
        check("artist genres", detail.genres.size() == 2
                && "Hard Rock".equals(detail.genres.get(0)));
        check("artist artwork", "https://is3.mzstatic.com/600x600.jpg"
                .equals(detail.artworkUrl));
        check("artist albums", detail.albums.size() == 2);
        check("artist album id", "574050396".equals(detail.albums.get(0).id));
        check("artist album title", "Back In Black".equals(detail.albums.get(0).title));
        check("artist album artwork", "https://is5.mzstatic.com/300x300.jpg"
                .equals(detail.albums.get(0).artworkUrl));
    }

    private static final String PLAYLIST = "{\"data\":[{\"id\":\"pl.331\","
            + "\"attributes\":{\"name\":\"Backstreet Boys: essenciais\","
            + "\"curatorName\":\"Apple Music\","
            + "\"editorialNotes\":{\"short\":\"As maiores da banda.\"},"
            + "\"artwork\":{\"url\":\"https://is6.mzstatic.com/{w}x{h}.jpg\"}},"
            + "\"relationships\":{\"tracks\":{\"data\":["
            + "{\"id\":\"t1\",\"attributes\":{\"name\":\"Everybody\","
            + "\"artistName\":\"Backstreet Boys\",\"durationInMillis\":181000,"
            + "\"trackNumber\":1,\"discNumber\":1}},"
            + "{\"id\":\"t2\",\"attributes\":{\"name\":\"I Want It That Way\","
            + "\"artistName\":\"Backstreet Boys\",\"durationInMillis\":213000,"
            + "\"trackNumber\":2,\"discNumber\":1}}"
            + "]}}}]}";

    private static void playlist() throws Exception {
        CatalogSearch.PlaylistDetail detail =
                CatalogSearch.playlistDetail(PLAYLIST, "fallback");
        check("playlist parsed", detail != null);
        check("playlist title", "Backstreet Boys: essenciais".equals(detail.title));
        check("playlist curator", "Apple Music".equals(detail.curator));
        check("playlist description", "As maiores da banda.".equals(detail.description));
        check("playlist tracks", detail.tracks.size() == 2);
        check("playlist track 2", "I Want It That Way".equals(detail.tracks.get(1).title));
        check("playlist track 2 duration", "3:33".equals(detail.tracks.get(1).durationText()));
    }

    private static void tracks() throws Exception {
        CatalogSearch.Collection collection =
                CatalogSearch.collection(PLAYLIST, "tracks", "fallback");
        check("collection parsed", collection != null);
        check("collection id", "pl.331".equals(collection.id));
        check("collection title", "Backstreet Boys: essenciais".equals(collection.title));
        check("collection items", collection.items.size() == 2);
        check("collection item kind", "Música".equals(collection.items.get(0).kind));
        check("collection item artist", "Backstreet Boys"
                .equals(collection.items.get(1).artist));
    }

    private static void invalid() {
        try {
            CatalogSearch.parse("<html>not json</html>");
            check("invalid JSON rejected", false);
        } catch (IllegalArgumentException expected) {
            check("invalid JSON rejected", true);
        }
    }

    private static void check(String label, boolean ok) {
        checks++;
        if (!ok) throw new AssertionError("FAILED: " + label);
    }
}
