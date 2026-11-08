package com.anderson.applemusic.one.media;

import android.app.Activity;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.util.Base64;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.security.KeyStore;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.GCMParameterSpec;

/**
 * Catalogue search against Apple Music's amp-api, ported from
 * {@code core/SearchClient.kt} to framework-only Java.
 *
 * <p>The developer token is read from the engine's DataStore file
 * ({@code files/datastore/encrypted_tokens.preferences_pb}) and decrypted with the
 * {@code music_token_store_key} key of the AndroidKeyStore. This code runs inside the
 * engine APK, so both the file and the key belong to the current UID.
 */
public final class CatalogSearch {

    public static final class Result {
        public final String id;
        public final String kind;
        public final String title;
        public final String artist;
        public final String artworkUrl;

        public Result(String id, String kind, String title, String artist, String artworkUrl) {
            this.id = id;
            this.kind = kind;
            this.title = title;
            this.artist = artist;
            this.artworkUrl = artworkUrl;
        }
    }

    /**
     * A collection resolved in the catalogue: the id used by {@code playFromMediaId}, its
     * title/artist and what sits under it (tracks of an album/playlist, albums of an artist).
     */
    public static final class Collection {
        public final String id;
        public final String title;
        public final String artist;
        public final List<Result> items;

        public Collection(String id, String title, String artist, List<Result> items) {
            this.id = id == null ? "" : id;
            this.title = title == null ? "" : title;
            this.artist = artist == null ? "" : artist;
            this.items = items == null ? Collections.<Result>emptyList() : items;
        }
    }

    /** One catalogue track, with the duration/track number the detail screens show. */
    public static final class Track {
        public final String id;
        public final String title;
        public final String artist;
        public final String albumName;
        public final long durationMs;
        public final int trackNumber;
        public final int discNumber;

        public Track(String id, String title, String artist, String albumName, long durationMs,
                     int trackNumber, int discNumber) {
            this.id = id == null ? "" : id;
            this.title = title == null ? "" : title;
            this.artist = artist == null ? "" : artist;
            this.albumName = albumName == null ? "" : albumName;
            this.durationMs = durationMs;
            this.trackNumber = trackNumber;
            this.discNumber = discNumber;
        }

        /** {@code m:ss} (or {@code h:mm:ss}), or an empty string when the API omits it. */
        public String durationText() {
            if (durationMs <= 0L) return "";
            long seconds = durationMs / 1000L;
            long hours = seconds / 3600L;
            long minutes = (seconds % 3600L) / 60L;
            long rest = seconds % 60L;
            return hours > 0
                    ? String.format(Locale.ROOT, "%d:%02d:%02d", hours, minutes, rest)
                    : String.format(Locale.ROOT, "%d:%02d", minutes, rest);
        }
    }

    /** Artist page: name/genres/artwork plus every album and the top songs view. */
    public static final class ArtistDetail {
        public final String id;
        public final String name;
        public final String artworkUrl;
        public final List<String> genres;
        public final List<Result> albums;
        public List<Track> topSongs;

        public ArtistDetail(String id, String name, String artworkUrl, List<String> genres,
                            List<Result> albums) {
            this.id = id == null ? "" : id;
            this.name = name == null ? "" : name;
            this.artworkUrl = artworkUrl;
            this.genres = genres == null ? Collections.<String>emptyList() : genres;
            this.albums = albums == null ? Collections.<Result>emptyList() : albums;
            this.topSongs = Collections.emptyList();
        }
    }

    /** Album page: header metadata, the artist id (clickable) and the tracks with duration. */
    public static final class AlbumDetail {
        public final String id;
        public final String title;
        public final String artist;
        public final String artistId;
        public final String artworkUrl;
        public final String copyright;
        public final String recordLabel;
        public final String releaseDate;
        public final int trackCount;
        public final List<String> genres;
        public final List<Track> tracks;

        public AlbumDetail(String id, String title, String artist, String artistId,
                           String artworkUrl, String copyright, String recordLabel,
                           String releaseDate, int trackCount, List<String> genres,
                           List<Track> tracks) {
            this.id = id == null ? "" : id;
            this.title = title == null ? "" : title;
            this.artist = artist == null ? "" : artist;
            this.artistId = artistId == null ? "" : artistId;
            this.artworkUrl = artworkUrl;
            this.copyright = copyright == null ? "" : copyright;
            this.recordLabel = recordLabel == null ? "" : recordLabel;
            this.releaseDate = releaseDate == null ? "" : releaseDate;
            this.trackCount = trackCount;
            this.genres = genres == null ? Collections.<String>emptyList() : genres;
            this.tracks = tracks == null ? Collections.<Track>emptyList() : tracks;
        }

        /** Release year, for the album header line. */
        public String year() {
            return releaseDate.length() >= 4 ? releaseDate.substring(0, 4) : "";
        }
    }

    /** Song page: title, artist/album links and duration. */
    public static final class SongDetail {
        public final String id;
        public final String title;
        public final String artist;
        public final String artistId;
        public final String albumName;
        public final String albumId;
        public final String artworkUrl;
        public final long durationMs;

        public SongDetail(String id, String title, String artist, String artistId,
                          String albumName, String albumId, String artworkUrl,
                          long durationMs) {
            this.id = id == null ? "" : id;
            this.title = title == null ? "" : title;
            this.artist = artist == null ? "" : artist;
            this.artistId = artistId == null ? "" : artistId;
            this.albumName = albumName == null ? "" : albumName;
            this.albumId = albumId == null ? "" : albumId;
            this.artworkUrl = artworkUrl;
            this.durationMs = durationMs;
        }

        public String durationText() {
            return new Track(id, title, artist, albumName, durationMs, 0, 0).durationText();
        }
    }

    /** Playlist page: curator, description and tracks with duration. */
    public static final class PlaylistDetail {
        public final String id;
        public final String title;
        public final String curator;
        public final String description;
        public final String artworkUrl;
        public final List<Track> tracks;

        public PlaylistDetail(String id, String title, String curator, String description,
                              String artworkUrl, List<Track> tracks) {
            this.id = id == null ? "" : id;
            this.title = title == null ? "" : title;
            this.curator = curator == null ? "" : curator;
            this.description = description == null ? "" : description;
            this.artworkUrl = artworkUrl;
            this.tracks = tracks == null ? Collections.<Track>emptyList() : tracks;
        }
    }

    public interface Callback {
        void onResults(List<Result> results);

        void onFailure(String message, boolean tokenMissing);
    }

    public interface CollectionCallback {
        void onCollection(Collection collection);

        void onFailure(String message);
    }

    /** One catalogue match (id + title + artist + artwork) resolved by name. */
    public interface MatchCallback {
        void onMatch(Result match);

        void onFailure(String message);
    }

    public interface ArtistCallback {
        void onArtist(ArtistDetail artist);

        void onFailure(String message);
    }

    public interface AlbumCallback {
        void onAlbum(AlbumDetail album);

        void onFailure(String message);
    }

    public interface SongCallback {
        void onSong(SongDetail song);

        void onFailure(String message);
    }

    public interface PlaylistCallback {
        void onPlaylist(PlaylistDetail playlist);

        void onFailure(String message);
    }

    private static final String TAG = "AppleMusicOne";
    private static final String ENDPOINT = "https://amp-api.music.apple.com/v1/catalog";
    private static final String FALLBACK_STOREFRONT = "us";
    private static final String FALLBACK_LANGUAGE = "en-US";
    private static final String USER_AGENT =
            "Mozilla/5.0 (Linux; Android 14) AppleWebKit/537.36 (KHTML, like Gecko) "
                    + "Chrome/120 Mobile Safari/537.36";

    private static final String TOKEN_PATH = "files/datastore/encrypted_tokens.preferences_pb";
    private static final String DEVELOPER_TOKEN_KEY = "key_api_token_musicAndroid";
    private static final String KEYSTORE_ALIAS = "music_token_store_key";
    private static final String ENGINE_SEARCH_URL = "https://music.apple.com/search";

    private static final String[][] KINDS = {
            {"songs", "Música", "artistName"},
            {"albums", "Álbum", "artistName"},
            {"artists", "Artista", ""},
            {"playlists", "Playlist", "curatorName"},
    };

    private final Activity activity;
    private final Handler main = new Handler(Looper.getMainLooper());
    private final java.util.concurrent.ExecutorService executor =
            java.util.concurrent.Executors.newSingleThreadExecutor();
    private volatile String cachedToken;

    public CatalogSearch(Activity activity) {
        this.activity = activity;
    }

    public void search(final String query, final Callback callback) {
        final String term = query == null ? "" : query.trim();
        if (term.length() == 0) {
            callback.onResults(Collections.<Result>emptyList());
            return;
        }
        executor.execute(new Runnable() {
            @Override
            public void run() {
                try {
                    String token = developerToken();
                    if (token == null) {
                        postFailure(callback, "Não foi possível ler o token do Apple Music", true);
                        return;
                    }
                    HttpResult response = request(searchPath(term), token);
                    if (response.unauthorized) {
                        // The engine refreshes the JWT in the file; read it again.
                        cachedToken = null;
                        token = developerToken();
                        if (token == null) {
                            postFailure(callback, "Token do Apple Music expirado", true);
                            return;
                        }
                        response = request(searchPath(term), token);
                    }
                    if (response.unauthorized) {
                        postFailure(callback,
                                "Token do Apple Music expirado. Abra o app original e entre na conta.",
                                false);
                        return;
                    }
                    if (response.error != null) {
                        postFailure(callback, response.error, false);
                        return;
                    }
                    final List<Result> results = parse(response.body);
                    main.post(new Runnable() {
                        @Override
                        public void run() {
                            callback.onResults(results);
                        }
                    });
                } catch (Throwable t) {
                    Log.e(TAG, "search failed", t);
                    postFailure(callback, "Sem conexão com o Apple Music", false);
                }
            }
        });
    }

    private void postFailure(final Callback callback, final String message,
                             final boolean tokenMissing) {
        main.post(new Runnable() {
            @Override
            public void run() {
                callback.onFailure(message, tokenMissing);
            }
        });
    }

    public void shutdown() {
        executor.shutdownNow();
    }

    // --- catalogue hierarchy ------------------------------------------------------

    /**
     * Track list of a catalogue album. The browse tree only carries the library
     * persistent id, so the album has to be resolved by name first
     * ({@link #findAlbum(String, String, CollectionCallback)}).
     */
    public void albumTracks(final String albumId, final CollectionCallback callback) {
        load("/" + storefront() + "/albums/" + encode(albumId)
                        + "?include=tracks&limit[tracks]=100&l=" + language(),
                new JsonParser<Collection>() {
                    @Override
                    public Collection parse(String body) throws Exception {
                        return collection(body, "tracks", albumId);
                    }
                }, collectionWaiter(callback));
    }

    // --- detail screens ----------------------------------------------------------

    /** Artist page: profile + every album ({@code include=albums}) and the top-songs view. */
    public void artist(final String artistId, final ArtistCallback callback) {
        load("/" + storefront() + "/artists/" + encode(artistId)
                        + "?include=albums&limit[albums]=50&l=" + language(),
                new JsonParser<ArtistDetail>() {
                    @Override
                    public ArtistDetail parse(String body) throws Exception {
                        return artistDetail(body, artistId);
                    }
                }, new Waiter<ArtistDetail>() {
                    @Override
                    public void deliver(final ArtistDetail artist) {
                        // The top-songs view is a second resource; a failure there only
                        // drops that section, it does not fail the artist page.
                        load("/" + storefront() + "/artists/" + encode(artist.id)
                                        + "/view/top-songs?limit=10&l=" + language(),
                                new JsonParser<List<Track>>() {
                                    @Override
                                    public List<Track> parse(String body) throws Exception {
                                        return tracks(new JSONObject(body).optJSONArray("data"),
                                                "", "");
                                    }
                                }, new Waiter<List<Track>>() {
                                    @Override
                                    public void deliver(List<Track> value) {
                                        artist.topSongs = value;
                                        callback.onArtist(artist);
                                    }

                                    @Override
                                    public void fail(String message) {
                                        Log.w(TAG, "top-songs unavailable for " + artist.id
                                                + ": " + message);
                                        callback.onArtist(artist);
                                    }
                                });
                    }

                    @Override
                    public void fail(String message) {
                        callback.onFailure(message);
                    }
                });
    }

    /** Album page: metadata, the artist relationship and the tracks with their durations. */
    public void album(final String albumId, final AlbumCallback callback) {
        load("/" + storefront() + "/albums/" + encode(albumId)
                        + "?include=tracks,artists&limit[tracks]=100&l=" + language(),
                new JsonParser<AlbumDetail>() {
                    @Override
                    public AlbumDetail parse(String body) throws Exception {
                        return albumDetail(body, albumId);
                    }
                }, new Waiter<AlbumDetail>() {
                    @Override
                    public void deliver(AlbumDetail value) {
                        callback.onAlbum(value);
                    }

                    @Override
                    public void fail(String message) {
                        callback.onFailure(message);
                    }
                });
    }

    /** Song page: title/artist/album links and the duration. */
    public void song(final String songId, final SongCallback callback) {
        load("/" + storefront() + "/songs/" + encode(songId)
                        + "?include=albums,artists&l=" + language(),
                new JsonParser<SongDetail>() {
                    @Override
                    public SongDetail parse(String body) throws Exception {
                        return songDetail(body, songId);
                    }
                }, new Waiter<SongDetail>() {
                    @Override
                    public void deliver(SongDetail value) {
                        callback.onSong(value);
                    }

                    @Override
                    public void fail(String message) {
                        callback.onFailure(message);
                    }
                });
    }

    /** Playlist page with its tracks (duration/track number) and curator. */
    public void playlist(final String playlistId, final PlaylistCallback callback) {
        load("/" + storefront() + "/playlists/" + encode(playlistId)
                        + "?include=tracks&limit[tracks]=100&l=" + language(),
                new JsonParser<PlaylistDetail>() {
                    @Override
                    public PlaylistDetail parse(String body) throws Exception {
                        return playlistDetail(body, playlistId);
                    }
                }, new Waiter<PlaylistDetail>() {
                    @Override
                    public void deliver(PlaylistDetail value) {
                        callback.onPlaylist(value);
                    }

                    @Override
                    public void fail(String message) {
                        callback.onFailure(message);
                    }
                });
    }

    // --- detail parsing ----------------------------------------------------------

    private static JSONObject firstData(String body) throws Exception {
        JSONArray data = new JSONObject(body).optJSONArray("data");
        return data == null || data.length() == 0 ? null : data.optJSONObject(0);
    }

    private static JSONObject attributes(JSONObject item) {
        JSONObject attributes = item == null ? null : item.optJSONObject("attributes");
        return attributes == null ? new JSONObject() : attributes;
    }

    private static JSONArray relationship(JSONObject item, String name) {
        JSONObject relationships = item == null ? null : item.optJSONObject("relationships");
        JSONObject group = relationships == null ? null : relationships.optJSONObject(name);
        return group == null ? null : group.optJSONArray("data");
    }

    private static String relationshipId(JSONObject item, String name) {
        JSONArray data = relationship(item, name);
        if (data == null || data.length() == 0) return "";
        JSONObject entry = data.optJSONObject(0);
        return entry == null ? "" : entry.optString("id");
    }

    private ArtistDetail artistDetail(String body, String fallbackId) throws Exception {
        JSONObject item = firstData(body);
        if (item == null) return null;
        JSONObject attributes = attributes(item);
        String id = item.optString("id");
        if (id.length() == 0) id = fallbackId;
        List<String> genres = strings(attributes.optJSONArray("genreNames"));
        List<Result> albums = new ArrayList<Result>();
        JSONArray data = relationship(item, "albums");
        if (data != null) {
            for (int i = 0; i < data.length(); i++) {
                JSONObject entry = data.optJSONObject(i);
                if (entry == null) continue;
                String entryId = entry.optString("id");
                JSONObject albumAttributes = entry.optJSONObject("attributes");
                if (entryId.length() == 0 || albumAttributes == null) continue;
                String name = albumAttributes.optString("name");
                if (name.length() == 0) continue;
                albums.add(new Result(entryId, "Álbum", name,
                        albumAttributes.optString("artistName"), artwork(albumAttributes, 300)));
            }
        }
        return new ArtistDetail(id, attributes.optString("name"), artwork(attributes, 600),
                genres, albums);
    }

    private AlbumDetail albumDetail(String body, String fallbackId) throws Exception {
        JSONObject item = firstData(body);
        if (item == null) return null;
        JSONObject attributes = attributes(item);
        String id = item.optString("id");
        if (id.length() == 0) id = fallbackId;
        String artistId = relationshipId(item, "artists");
        String artist = attributes.optString("artistName");
        JSONArray artists = relationship(item, "artists");
        if (artist.length() == 0 && artists != null && artists.length() > 0) {
            artist = attributes(artists.optJSONObject(0)).optString("name");
        }
        List<Track> tracks = tracks(relationship(item, "tracks"),
                attributes.optString("name"), artist);
        int trackCount = attributes.optInt("trackCount");
        if (trackCount <= 0) trackCount = tracks.size();
        return new AlbumDetail(id, attributes.optString("name"), artist, artistId,
                artwork(attributes, 600), attributes.optString("copyright"),
                attributes.optString("recordLabel"), attributes.optString("releaseDate"),
                trackCount, strings(attributes.optJSONArray("genreNames")), tracks);
    }

    private SongDetail songDetail(String body, String fallbackId) throws Exception {
        JSONObject item = firstData(body);
        if (item == null) return null;
        JSONObject attributes = attributes(item);
        String id = item.optString("id");
        if (id.length() == 0) id = fallbackId;
        String albumName = attributes.optString("albumName");
        JSONArray albums = relationship(item, "albums");
        if (albumName.length() == 0 && albums != null && albums.length() > 0) {
            albumName = attributes(albums.optJSONObject(0)).optString("name");
        }
        return new SongDetail(id, attributes.optString("name"),
                attributes.optString("artistName"), relationshipId(item, "artists"),
                albumName, relationshipId(item, "albums"), artwork(attributes, 600),
                attributes.optLong("durationInMillis"));
    }

    private PlaylistDetail playlistDetail(String body, String fallbackId) throws Exception {
        JSONObject item = firstData(body);
        if (item == null) return null;
        JSONObject attributes = attributes(item);
        String id = item.optString("id");
        if (id.length() == 0) id = fallbackId;
        String description = "";
        JSONObject notes = attributes.optJSONObject("editorialNotes");
        if (notes != null) {
            description = notes.optString("short");
            if (description.length() == 0) description = notes.optString("standard");
        }
        if (description.length() == 0) {
            JSONObject plain = attributes.optJSONObject("description");
            if (plain != null) {
                description = plain.optString("short");
                if (description.length() == 0) description = plain.optString("standard");
            }
        }
        return new PlaylistDetail(id, attributes.optString("name"),
                attributes.optString("curatorName"), description, artwork(attributes, 600),
                tracks(relationship(item, "tracks"), attributes.optString("name"), ""));
    }

    private static List<Track> tracks(JSONArray data, String albumFallback,
                                      String artistFallback) {
        List<Track> tracks = new ArrayList<Track>();
        if (data == null) return tracks;
        for (int i = 0; i < data.length(); i++) {
            JSONObject entry = data.optJSONObject(i);
            if (entry == null) continue;
            String id = entry.optString("id");
            JSONObject attributes = entry.optJSONObject("attributes");
            if (id.length() == 0 || attributes == null) continue;
            String title = attributes.optString("name");
            if (title.length() == 0) continue;
            String artist = attributes.optString("artistName");
            if (artist.length() == 0) artist = artistFallback;
            String album = attributes.optString("albumName");
            if (album.length() == 0) album = albumFallback;
            tracks.add(new Track(id, title, artist, album,
                    attributes.optLong("durationInMillis"),
                    attributes.optInt("trackNumber"), attributes.optInt("discNumber")));
        }
        return tracks;
    }

    private static List<String> strings(JSONArray data) {
        List<String> values = new ArrayList<String>();
        if (data == null) return values;
        for (int i = 0; i < data.length(); i++) {
            String value = data.optString(i);
            if (value != null && value.length() > 0) values.add(value);
        }
        return values;
    }

    /** Track list of a catalogue playlist id (Home shelves carry the catalogue id). */
    public void playlistTracks(final String playlistId, final CollectionCallback callback) {
        load("/" + storefront() + "/playlists/" + encode(playlistId)
                        + "?include=tracks&limit[tracks]=100&l=" + language(),
                new JsonParser<Collection>() {
                    @Override
                    public Collection parse(String body) throws Exception {
                        return collection(body, "tracks", playlistId);
                    }
                }, collectionWaiter(callback));
    }

    /**
     * Resolves an artist by name (the browse tree only carries the library
     * {@code 6-<persistentId>}): the best catalogue artist with that exact name.
     */
    public void findArtist(final String name, final MatchCallback callback) {
        match("artists", clean(name), name, "", "Artista não encontrado no catálogo",
                callback);
    }

    /** Resolves the catalogue album id for a library album title+artist. */
    public void findAlbumMatch(final String title, final String artist,
                               final MatchCallback callback) {
        match("albums", clean(title + " " + artist), title, artist,
                "Álbum não encontrado no catálogo", callback);
    }

    /** Resolves the catalogue playlist id for a library playlist title+curator. */
    public void findPlaylistMatch(final String title, final String curator,
                                  final MatchCallback callback) {
        match("playlists", clean(title + " " + curator), title, curator,
                "Playlist não encontrada no catálogo", callback);
    }

    /** Resolves an album by title+artist and returns its catalogue track list. */
    public void findAlbum(final String title, final String artist,
                          final CollectionCallback callback) {
        findAlbumMatch(title, artist, new MatchCallback() {
            @Override
            public void onMatch(Result match) {
                albumTracks(match.id, callback);
            }

            @Override
            public void onFailure(String message) {
                callback.onFailure(message);
            }
        });
    }

    /** Track list of a catalogue playlist, resolved by title+curator. */
    public void findPlaylist(final String title, final String curator,
                             final CollectionCallback callback) {
        findPlaylistMatch(title, curator, new MatchCallback() {
            @Override
            public void onMatch(Result match) {
                playlistTracks(match.id, callback);
            }

            @Override
            public void onFailure(String message) {
                callback.onFailure(message);
            }
        });
    }

    /** One typed amp-api search whose best match is picked by {title, artist}. */
    private void match(final String types, final String term, final String title,
                       final String artist, final String miss,
                       final MatchCallback callback) {
        load("/" + storefront() + "/search?term=" + encode(term)
                        + "&types=" + types + "&limit=8&l=" + language(),
                new JsonParser<List<Result>>() {
                    @Override
                    public List<Result> parse(String body) {
                        return CatalogSearch.this.parse(body);
                    }
                }, new Waiter<List<Result>>() {
                    @Override
                    public void deliver(List<Result> results) {
                        Result match = pick(results, title, artist);
                        if (match == null) {
                            callback.onFailure(miss);
                            return;
                        }
                        callback.onMatch(match);
                    }

                    @Override
                    public void fail(String message) {
                        callback.onFailure(message);
                    }
                });
    }

    // --- amp-api -----------------------------------------------------------------

    private static final class HttpResult {
        String body;
        boolean unauthorized;
        String error;
    }

    private HttpResult request(String relative, String token) {
        HttpResult result = new HttpResult();
        HttpURLConnection connection = null;
        String url = ENDPOINT + relative;
        try {
            connection = (HttpURLConnection) new URL(url).openConnection();
            connection.setConnectTimeout(15000);
            connection.setReadTimeout(20000);
            connection.setRequestProperty("Authorization", "Bearer " + token);
            connection.setRequestProperty("Origin", "https://music.apple.com");
            connection.setRequestProperty("User-Agent", USER_AGENT);
            int code = connection.getResponseCode();
            InputStream stream = code >= 400 ? connection.getErrorStream() : connection.getInputStream();
            result.body = stream != null ? text(stream) : "";
            Log.i(TAG, "amp-api HTTP " + code + " bytes=" + result.body.length()
                    + " path=" + relative);
            if (code == HttpURLConnection.HTTP_OK) {
                return result;
            }
            if (code == HttpURLConnection.HTTP_UNAUTHORIZED
                    || code == HttpURLConnection.HTTP_FORBIDDEN) {
                result.unauthorized = true;
            } else {
                result.error = "Apple Music falhou (HTTP " + code + ")";
            }
        } catch (Throwable t) {
            Log.e(TAG, "amp-api request failed", t);
            result.error = "Sem conexão com o Apple Music";
        } finally {
            if (connection != null) connection.disconnect();
        }
        return result;
    }

    private List<Result> parse(String body) {
        List<Result> found = new ArrayList<Result>();
        JSONObject results;
        try {
            results = new JSONObject(body).optJSONObject("results");
        } catch (org.json.JSONException t) {
            throw new IllegalArgumentException("resposta inesperada do Apple Music", t);
        }
        if (results == null) return found;
        for (String[] kind : KINDS) {
            JSONObject group = results.optJSONObject(kind[0]);
            if (group == null) continue;
            JSONArray data = group.optJSONArray("data");
            if (data == null) continue;
            for (int i = 0; i < data.length(); i++) {
                JSONObject item = data.optJSONObject(i);
                if (item == null) continue;
                String id = item.optString("id");
                if (id.length() == 0) continue;
                JSONObject attributes = item.optJSONObject("attributes");
                if (attributes == null) attributes = new JSONObject();
                String title = attributes.optString("name");
                if (title.length() == 0) continue;
                String artist = attributes.optString(kind[2]);
                if (artist.length() == 0) {
                    JSONArray genres = attributes.optJSONArray("genreNames");
                    if (genres != null) artist = genres.optString(0);
                }
                found.add(new Result(id, kind[1], title, artist, artwork(attributes)));
            }
        }
        return found;
    }

    private static String artwork(JSONObject attributes) {
        return artwork(attributes, 300);
    }

    private static String artwork(JSONObject attributes, int size) {
        JSONObject artwork = attributes.optJSONObject("artwork");
        if (artwork == null) return null;
        String url = artwork.optString("url");
        if (url.length() == 0) return null;
        return url.replace("{w}", String.valueOf(size)).replace("{h}", String.valueOf(size));
    }

    private static String searchPath(String term) {
        return "/" + storefront() + "/search?term=" + encode(term)
                + "&types=songs,albums,artists,playlists&limit=8&l=" + language();
    }

    // --- hierarchy lookups -------------------------------------------------------

    private interface JsonParser<T> {
        T parse(String body) throws Exception;
    }

    private interface Waiter<T> {
        void deliver(T value);

        void fail(String message);
    }

    /** Runs one amp-api GET off the UI thread, reviving the token once on 401. */
    private <T> void load(final String relative, final JsonParser<T> parser,
                          final Waiter<T> waiter) {
        executor.execute(new Runnable() {
            @Override
            public void run() {
                try {
                    String token = developerToken();
                    if (token == null) {
                        failWaiter(waiter, "Não foi possível ler o token do Apple Music");
                        return;
                    }
                    HttpResult response = request(relative, token);
                    if (response.unauthorized) {
                        cachedToken = null;
                        token = developerToken();
                        if (token == null) {
                            failWaiter(waiter, "Token do Apple Music expirado");
                            return;
                        }
                        response = request(relative, token);
                    }
                    if (response.unauthorized) {
                        failWaiter(waiter,
                                "Token do Apple Music expirado. Abra o app original e entre na conta.");
                        return;
                    }
                    if (response.error != null) {
                        failWaiter(waiter, response.error);
                        return;
                    }
                    final T value = parser.parse(response.body);
                    if (value == null) {
                        failWaiter(waiter, "O Apple Music não retornou este item");
                        return;
                    }
                    main.post(new Runnable() {
                        @Override
                        public void run() {
                            waiter.deliver(value);
                        }
                    });
                } catch (Throwable t) {
                    Log.e(TAG, "amp-api lookup failed", t);
                    failWaiter(waiter, t instanceof IllegalArgumentException
                            ? "Resposta inesperada do Apple Music"
                            : "Sem conexão com o Apple Music");
                }
            }
        });
    }

    private <T> void failWaiter(final Waiter<T> waiter, final String message) {
        main.post(new Runnable() {
            @Override
            public void run() {
                waiter.fail(message);
            }
        });
    }

    private Waiter<Collection> collectionWaiter(final CollectionCallback callback) {
        return new Waiter<Collection>() {
            @Override
            public void deliver(Collection collection) {
                callback.onCollection(collection);
            }

            @Override
            public void fail(String message) {
                callback.onFailure(message);
            }
        };
    }

    /** Reads {@code data[0].relationships.<relationship>.data} into a {@link Collection}. */
    private Collection collection(String body, String relationship, String fallbackId)
            throws Exception {
        JSONObject root = new JSONObject(body);
        JSONArray data = root.optJSONArray("data");
        if (data == null || data.length() == 0) return null;
        JSONObject item = data.optJSONObject(0);
        if (item == null) return null;
        JSONObject attributes = item.optJSONObject("attributes");
        if (attributes == null) attributes = new JSONObject();
        String id = item.optString("id");
        if (id.length() == 0) id = fallbackId;
        JSONObject relationships = item.optJSONObject("relationships");
        JSONObject group = relationships == null ? null : relationships.optJSONObject(relationship);
        JSONArray entries = group == null ? null : group.optJSONArray("data");
        List<Result> items = new ArrayList<Result>();
        if (entries != null) {
            for (int i = 0; i < entries.length(); i++) {
                JSONObject entry = entries.optJSONObject(i);
                if (entry == null) continue;
                String entryId = entry.optString("id");
                if (entryId.length() == 0) continue;
                JSONObject entryAttributes = entry.optJSONObject("attributes");
                if (entryAttributes == null) continue;
                String name = entryAttributes.optString("name");
                if (name.length() == 0) continue;
                String artist = entryAttributes.optString("artistName");
                if (artist.length() == 0) artist = attributes.optString("artistName");
                items.add(new Result(entryId, "Música", name, artist,
                        artwork(entryAttributes)));
            }
        }
        return new Collection(id, attributes.optString("name"),
                attributes.optString("artistName"), items);
    }

    /**
     * Best catalogue match for a browse item: same title (case/spacing insensitive) and,
     * when the browse item carries an artist, the same artist. Library titles often add a
     * " - Single"/" - EP" suffix or a "(Deluxe Version)"/"(Remastered)" qualifier the
     * catalogue name does not carry, so those are compared base-to-base before giving up.
     * Returns null instead of guessing, so the UI degrades to "play the whole collection"
     * rather than showing the tracks of a different album.
     */
    private static Result pick(List<Result> items, String title, String artist) {
        String want = normalize(title);
        String wantBase = stripQualifiers(want);
        String who = clean(artist).toLowerCase(Locale.ROOT);
        Result base = null;
        for (Result item : items) {
            String itemTitle = normalize(item.title);
            boolean sameArtist = who.length() == 0
                    || clean(item.artist).toLowerCase(Locale.ROOT).equals(who);
            if (itemTitle.equals(want) && sameArtist) return item;
            if (base == null && sameArtist
                    && stripQualifiers(itemTitle).equals(wantBase)) {
                base = item;
            }
        }
        if (base != null) return base;
        for (Result item : items) {
            if (normalize(item.title).equals(want)) return item;
        }
        for (Result item : items) {
            if (stripQualifiers(normalize(item.title)).equals(wantBase)) return item;
        }
        Log.w(TAG, "no catalogue match for \"" + title + "\" / \"" + artist + "\" among "
                + items.size() + " result(s)");
        for (int i = 0; i < Math.min(5, items.size()); i++) {
            Log.w(TAG, "  candidate \"" + items.get(i).title + "\" / \"" + items.get(i).artist
                    + "\"");
        }
        return null;
    }

    private static String clean(String value) {
        return value == null ? "" : value.replaceAll("\\s+", " ").trim();
    }

    /**
     * The library titles singles/EPs with a " - Single"/" - EP" suffix the catalogue name
     * does not carry; strip it before comparing so "A Capella - Single" matches "A Capella".
     */
    private static String normalize(String value) {
        String text = clean(value).toLowerCase(Locale.ROOT);
        if (text.endsWith(" - single")) {
            text = text.substring(0, text.length() - " - single".length()).trim();
        } else if (text.endsWith(" - ep")) {
            text = text.substring(0, text.length() - " - ep".length()).trim();
        }
        return text;
    }

    /** Drops trailing "(Deluxe Version)"/"[Remastered]"-style qualifiers. */
    private static String stripQualifiers(String value) {
        String text = value == null ? "" : value.trim();
        while (true) {
            int end = -1;
            if (text.endsWith(")")) end = text.lastIndexOf('(');
            else if (text.endsWith("]")) end = text.lastIndexOf('[');
            if (end <= 0) return text;
            text = text.substring(0, end).trim();
        }
    }

    // --- engine token ------------------------------------------------------------

    private String developerToken() {
        String token = cachedToken;
        if (token != null) return token;
        try {
            byte[] pb = bytes(tokenFile());
            String cipher = prefValue(pb, DEVELOPER_TOKEN_KEY + "__cipher");
            String iv = prefValue(pb, DEVELOPER_TOKEN_KEY + "__iv");
            if (cipher == null || iv == null) {
                Log.w(TAG, "engine token keys not found in the DataStore file");
                return null;
            }
            KeyStore keyStore = KeyStore.getInstance("AndroidKeyStore");
            keyStore.load(null);
            KeyStore.Entry entry = keyStore.getEntry(KEYSTORE_ALIAS, null);
            if (!(entry instanceof KeyStore.SecretKeyEntry)) {
                Log.w(TAG, "AndroidKeyStore has no " + KEYSTORE_ALIAS);
                return null;
            }
            SecretKey key = ((KeyStore.SecretKeyEntry) entry).getSecretKey();
            Cipher decipher = Cipher.getInstance("AES/GCM/NoPadding");
            decipher.init(Cipher.DECRYPT_MODE, key,
                    new GCMParameterSpec(128, Base64.decode(iv, Base64.DEFAULT)));
            token = new String(decipher.doFinal(Base64.decode(cipher, Base64.DEFAULT)), "UTF-8");
        } catch (Throwable t) {
            Log.w(TAG, "cannot read the engine developer token: " + t);
            return null;
        }
        if (token.length() == 0) return null;
        cachedToken = token;
        return token;
    }

    private File tokenFile() {
        ApplicationInfo info = activity.getApplicationInfo();
        return new File(info.dataDir, TOKEN_PATH);
    }

    /**
     * The engine's DataStore protobuf is androidx.datastore Preferences:
     * {@code entry = { 1: key, 2: { 5: value } }}, so right after the key bytes come
     * {@code [0x12][varint len][0x2A][varint len][len bytes of value]}.
     */
    static String prefValue(byte[] pb, String key) {
        byte[] needle = key.getBytes(java.nio.charset.Charset.forName("UTF-8"));
        int at = indexOf(pb, needle);
        if (at < 0) return null;
        int position = at + needle.length;
        if (position + 1 >= pb.length || (pb[position] & 0xFF) != 0x12) return null;
        int[] next = readVarint(pb, position + 1);
        if (next == null) return null;
        position = next[1];
        if (position >= pb.length || (pb[position] & 0xFF) != 0x2A) return null;
        int[] length = readVarint(pb, position + 1);
        if (length == null) return null;
        int start = length[1];
        int size = length[0];
        if (size < 0 || start + size > pb.length) return null;
        return new String(pb, start, size, java.nio.charset.Charset.forName("UTF-8"));
    }

    /** Boolean DataStore value: {@code [0x12][len][0x08][varint 0/1]}. */
    static Boolean prefBoolean(byte[] pb, String key) {
        byte[] needle = key.getBytes(java.nio.charset.Charset.forName("UTF-8"));
        int at = indexOf(pb, needle);
        if (at < 0) return null;
        int position = at + needle.length;
        if (position + 1 >= pb.length || (pb[position] & 0xFF) != 0x12) return null;
        int[] next = readVarint(pb, position + 1);
        if (next == null) return null;
        position = next[1];
        if (position >= pb.length || (pb[position] & 0xFF) != 0x08) return null;
        int[] value = readVarint(pb, position + 1);
        return value == null ? null : Boolean.valueOf(value[0] != 0);
    }

    private static int indexOf(byte[] haystack, byte[] needle) {
        outer:
        for (int i = 0; i <= haystack.length - needle.length; i++) {
            for (int j = 0; j < needle.length; j++) {
                if (haystack[i + j] != needle[j]) continue outer;
            }
            return i;
        }
        return -1;
    }

    /** @return {value, nextOffset} */
    private static int[] readVarint(byte[] bytes, int start) {
        int value = 0;
        int shift = 0;
        int position = start;
        while (position < bytes.length && shift < 32) {
            int b = bytes[position++] & 0xFF;
            value |= (b & 0x7F) << shift;
            if ((b & 0x80) == 0) return new int[]{value, position};
            shift += 7;
        }
        return null;
    }

    private static byte[] bytes(File file) throws Exception {
        FileInputStream input = new FileInputStream(file);
        try {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buffer = new byte[8192];
            int read;
            while ((read = input.read(buffer)) > 0) out.write(buffer, 0, read);
            return out.toByteArray();
        } finally {
            input.close();
        }
    }

    private static String text(InputStream input) throws Exception {
        try {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buffer = new byte[8192];
            int read;
            while ((read = input.read(buffer)) > 0) out.write(buffer, 0, read);
            return out.toString("UTF-8");
        } finally {
            input.close();
        }
    }

    // --- device ------------------------------------------------------------------

    private static String storefront() {
        String country = Locale.getDefault().getCountry();
        return country.length() == 2 ? country.toLowerCase(Locale.ROOT) : FALLBACK_STOREFRONT;
    }

    private static String language() {
        Locale locale = Locale.getDefault();
        if (locale.getLanguage().length() == 2 && locale.getCountry().length() == 2) {
            return locale.getLanguage().toLowerCase(Locale.ROOT) + "-"
                    + locale.getCountry().toUpperCase(Locale.ROOT);
        }
        return FALLBACK_LANGUAGE;
    }

    private static String encode(String value) {
        try {
            return URLEncoder.encode(value, "UTF-8");
        } catch (Throwable t) {
            return value;
        }
    }

    /** Fallback when the token cannot be read: opens the engine's own search screen. */
    public static void openEngineSearch(Activity activity) {
        try {
            Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(ENGINE_SEARCH_URL));
            intent.setClassName(MediaClient.PACKAGE, MediaClient.ACCOUNT_ACTIVITY);
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            activity.startActivity(intent);
        } catch (Throwable t) {
            Log.e(TAG, "cannot open the engine search", t);
        }
    }
}
