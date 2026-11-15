package app.spicetify.extension.spotify.extensions;

import java.io.IOException;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

/**
 * The esperanto messages the extensions send and receive over {@code sp://esperanto/<service>/
 * <method>}: request builders, response parsers and the player state value. The field numbers
 * were read from Spotify 9.1.80.2221's protobuf classes, and the extensions patch checks them
 * again against the APK it patches.
 */
final class Esperanto {
    static final String CONTEXT_PLAYER = "spotify.player.esperanto.proto.ContextPlayer";
    static final String PLAYLIST = "spotify.playlist_esperanto.proto.PlaylistDataService";
    static final String METADATA = "spotify.metadata_esperanto.proto.ClassicMetadataService";
    static final String LIKED_SONGS = "spotify:playlist:37i9dQZF1F5p3rmiWPIYgZ";
    /** {@link #parseResult}'s answer when the player takes a command. */
    static final int OK = 0;
    /** {@link #parseResult}'s answer when the player refuses a command. */
    static final int FORBIDDEN = 1;

    private static final String BASE62_ALPHABET = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";

    private Esperanto() {}

    /** A parsed {@code ContextPlayerState}: the fields the extensions read. */
    static final class PlayerState {
        /** The playlist, album or other list that's playing, or null when nothing is loaded. */
        String contextUri;
        String trackUri;
        String trackUid;
        long queueRevision;
        List<String> artistUris = new ArrayList<>();
        boolean advertisement;
        boolean episode;
    }

    /** {@code ContextPlayerState{2 context_uri, 7 track: ProvidedTrack{1 context_track}}}; everything else is skipped. */
    static PlayerState parseState(byte[] contextPlayerState) throws IOException {
        PlayerState state = new PlayerState();
        Wire.Reader reader = new Wire.Reader(contextPlayerState);
        while (reader.next()) {
            switch (reader.field()) {
                case 2:
                    state.contextUri = reader.string();
                    break;
                case 7:
                    readProvidedTrack(reader.message(), state);
                    break;
                case 25:
                    state.queueRevision = reader.varint();
                    break;
                default:
                    reader.skip();
            }
        }
        return state;
    }

    private static void readProvidedTrack(Wire.Reader providedTrack, PlayerState state) throws IOException {
        while (providedTrack.next()) {
            if (providedTrack.field() == 1) {
                readContextTrack(providedTrack.message(), state);
            } else {
                providedTrack.skip();
            }
        }
    }

    /** {@code ContextTrack{1 uri, 2 uid, 3 metadata: map<string, string>}}. */
    private static void readContextTrack(Wire.Reader contextTrack, PlayerState state) throws IOException {
        Map<String, String> metadata = new TreeMap<>();
        while (contextTrack.next()) {
            switch (contextTrack.field()) {
                case 1:
                    state.trackUri = contextTrack.string();
                    break;
                case 2:
                    state.trackUid = contextTrack.string();
                    break;
                case 3:
                    readMetadataEntry(contextTrack.message(), metadata);
                    break;
                default:
                    contextTrack.skip();
            }
        }
        // artist_uri, artist_uri:1, artist_uri:2 and so on, in that order.
        for (Map.Entry<String, String> entry : metadata.entrySet()) {
            if (entry.getKey().startsWith("artist_uri") && !entry.getValue().isEmpty()) {
                state.artistUris.add(entry.getValue());
            }
        }
        state.advertisement = "true".equals(metadata.get("is_advertisement"));
        state.episode = isEpisodeUri(state.trackUri);
    }

    private static void readMetadataEntry(Wire.Reader entry, Map<String, String> metadata) throws IOException {
        String key = null;
        String value = "";
        while (entry.next()) {
            switch (entry.field()) {
                case 1:
                    key = entry.string();
                    break;
                case 2:
                    value = entry.string();
                    break;
                default:
                    entry.skip();
            }
        }
        if (key != null) {
            metadata.put(key, value);
        }
    }

    private static boolean isEpisodeUri(String uri) {
        return uri != null
                && (uri.startsWith("spotify:episode:")
                        || uri.startsWith("spotify:podcast-chapter:")
                        || uri.startsWith("spotify:clip:"));
    }

    // ---- Request builders ----

    /**
     * {@code GetStateRequest{1 prev_tracks_cap{1 0}, 2 next_tracks_cap{1 0}}}, each cap an
     * {@code OptionalInt64}. The extensions read only the current track, so a state leaves out the
     * tracks before and after it and stays small on a big playlist.
     */
    static byte[] getState() {
        Wire.Writer none = new Wire.Writer();
        none.varint(1, 0);
        Wire.Writer request = new Wire.Writer();
        request.message(1, none);
        request.message(2, none);
        return request.toByteArray();
    }

    /**
     * {@code PlayRequest{1 prepare_play_request{1 context{1 pages{1 tracks*{1 uri}}, 3 uri}, 2 options{3
     * skip_to{5 track_index{1 0}}, 7 player_options_override{1 shuffling_context{1 false}}}}}}: plays
     * {@code trackUris} in exactly that order, as one explicit page of {@code contextUri}, from the
     * first, with Spotify's own shuffle off.
     */
    static byte[] playOrder(String contextUri, List<String> trackUris) {
        return playOrder(contextUri, trackUris, 0);
    }

    /**
     * Plays {@code trackUris} in that exact order, as one explicit page of {@code contextUri}, starting at
     * {@code firstTrackIndex}, with Spotify's own shuffle off.
     */
    static byte[] playOrder(String contextUri, List<String> trackUris, int firstTrackIndex) {
        Wire.Writer page = new Wire.Writer();
        for (String trackUri : trackUris) {
            Wire.Writer track = new Wire.Writer();
            track.string(1, trackUri);
            page.message(1, track);
        }
        // No url: with one, the core could load the context again and drop this page.
        Wire.Writer context = new Wire.Writer();
        context.message(1, page);
        context.string(3, contextUri);

        Wire.Writer trackIndex = new Wire.Writer();
        trackIndex.varint(1, Math.max(0, firstTrackIndex));
        Wire.Writer skipTo = new Wire.Writer();
        skipTo.message(5, trackIndex);
        Wire.Writer shufflingContext = new Wire.Writer();
        shufflingContext.bool(1, false);
        Wire.Writer overrides = new Wire.Writer();
        overrides.message(1, shufflingContext);
        Wire.Writer options = new Wire.Writer();
        options.message(3, skipTo);
        options.message(7, overrides);

        Wire.Writer prepare = new Wire.Writer();
        prepare.message(1, context);
        prepare.message(2, options);
        Wire.Writer request = new Wire.Writer();
        request.message(1, prepare);
        return request.toByteArray();
    }

    /**
     * {@code SetQueueRequest{1 next_tracks*{1 context_track{1 uri}}, 3 queue_revision}}: the songs that play
     * next, in this order, for the queue as of {@code queueRevision} (the state's). Unlike a play
     * command's explicit page, a queue is kept as sent when another Spotify Connect device is playing.
     */
    static byte[] setQueue(List<String> trackUris, long queueRevision) {
        Wire.Writer request = new Wire.Writer();
        for (String trackUri : trackUris) {
            Wire.Writer contextTrack = new Wire.Writer();
            contextTrack.string(1, trackUri);
            Wire.Writer providedTrack = new Wire.Writer();
            providedTrack.message(1, contextTrack);
            request.message(1, providedTrack);
        }
        request.varint(3, queueRevision);
        return request.toByteArray();
    }

    /**
     * {@code PlaylistGetRequest{1 uri, 2 query, 3 policy}}: {@code length} songs of {@code uri} from
     * {@code start}, and the list's length. The query leaves out banned songs, songs by banned artists,
     * recommendations, episodes and songs that can't play ({@code show_unavailable} false), and so does
     * that length.
     */
    static byte[] playlistGet(String uri, int start, int length) {
        Wire.Writer range = new Wire.Writer();
        range.varint(1, start);
        range.varint(2, length);
        Wire.Writer query = new Wire.Writer();
        query.bytes(1, packedVarints(4, 3, 7, 6)); // NOT_BANNED, ARTIST_NOT_BANNED, NOT_RECOMMENDATION, NOT_EPISODE
        query.bool(8, false);
        query.message(4, range);

        Wire.Writer playlist = new Wire.Writer();
        playlist.bool(49, true);
        Wire.Writer item = new Wire.Writer();
        item.bool(1, true);
        Wire.Writer policy = new Wire.Writer();
        policy.message(1, playlist);
        policy.message(4, item);

        Wire.Writer request = new Wire.Writer();
        request.string(1, uri);
        request.message(2, query);
        request.message(3, policy);
        return request.toByteArray();
    }

    private static byte[] packedVarints(int... values) {
        Wire.Writer packed = new Wire.Writer();
        for (int value : values) {
            packed.rawVarint(value);
        }
        return packed.toByteArray();
    }

    /** {@code GetEntityRequest{1 uri}}, for an album's track list. */
    static byte[] getEntity(String uri) {
        Wire.Writer request = new Wire.Writer();
        request.string(1, uri);
        return request.toByteArray();
    }

    /** The four uris the app treats as Liked Songs ({@code Lp/x46;->E} in 9.1.80.2221). */
    static boolean isLikedSongs(String uri) {
        return LIKED_SONGS.equals(uri)
                || "spotify:collection:tracks".equals(uri)
                || "spotify:internal:collection:tracks".equals(uri)
                || uri.startsWith("spotify:user:") && uri.endsWith(":collection");
    }

    // ---- Response parsers ----

    /** The error code of a command's {@code ResponseWithReasons{1 error}}: 0 when it worked. */
    static int parseResult(byte[] responseWithReasons) throws IOException {
        Wire.Reader reader = new Wire.Reader(responseWithReasons);
        int error = 0;
        while (reader.next()) {
            if (reader.field() == 1) {
                error = (int) reader.varint();
            } else {
                reader.skip();
            }
        }
        return error;
    }

    /**
     * A page of a playlist or Liked Songs: its playable {@code length}, the uris read, and whether the
     * core is still loading the list, which makes the page incomplete.
     */
    static final class PlaylistPage {
        int length;
        List<String> uris = new ArrayList<>();
        boolean loading;
    }

    /**
     * Reads a {@code PlaylistGetResponse{1 status{1 status_code}, 2 data{1 item*{18 uri}, 4
     * unranged_length, 6 loading_contents}}}. A list that's forbidden, gone or blocked in the user's country (403, 404,
     * 451) reads as an empty page; any other status outside 2xx throws.
     */
    static PlaylistPage parsePlaylistGet(byte[] playlistGetResponse) throws IOException {
        PlaylistPage page = new PlaylistPage();
        Wire.Reader response = new Wire.Reader(playlistGetResponse);
        int statusCode = 0;
        Wire.Reader data = null;
        while (response.next()) {
            switch (response.field()) {
                case 1:
                    statusCode = readStatusCode(response.message());
                    break;
                case 2:
                    data = response.message();
                    break;
                default:
                    response.skip();
            }
        }
        if (statusCode == 403 || statusCode == 404 || statusCode == 451) {
            return page;
        }
        if (statusCode < 200 || statusCode > 299) {
            throw new IOException("status " + statusCode);
        }
        if (data != null) {
            readPlaylistData(data, page);
        }
        return page;
    }

    private static int readStatusCode(Wire.Reader status) throws IOException {
        int statusCode = 0;
        while (status.next()) {
            if (status.field() == 1) {
                statusCode = (int) status.varint();
            } else {
                status.skip();
            }
        }
        return statusCode;
    }

    private static void readPlaylistData(Wire.Reader data, PlaylistPage page) throws IOException {
        while (data.next()) {
            switch (data.field()) {
                case 1:
                    readPlaylistItem(data.message(), page);
                    break;
                case 4:
                    page.length = (int) data.varint();
                    break;
                case 6:
                    page.loading = data.varint() != 0;
                    break;
                default:
                    data.skip();
            }
        }
    }

    private static void readPlaylistItem(Wire.Reader item, PlaylistPage page) throws IOException {
        while (item.next()) {
            if (item.field() == 18) {
                page.uris.add(item.string());
            } else {
                item.skip();
            }
        }
    }

    /**
     * An album's tracks from a {@code GetEntityResponse{1 item{3 album{11 disc*{3 track*{1 gid}}}}}},
     * as {@code spotify:track:} uris in disc order.
     */
    static List<String> parseAlbumTracks(byte[] getEntityResponse) throws IOException {
        List<String> uris = new ArrayList<>();
        Wire.Reader response = new Wire.Reader(getEntityResponse);
        while (response.next()) {
            if (response.field() == 1) {
                readMetadataItem(response.message(), uris);
            } else {
                response.skip();
            }
        }
        return uris;
    }

    private static void readMetadataItem(Wire.Reader item, List<String> uris) throws IOException {
        while (item.next()) {
            if (item.field() == 3) { // oneof case 3: the album
                readAlbum(item.message(), uris);
            } else {
                item.skip();
            }
        }
    }

    private static void readAlbum(Wire.Reader album, List<String> uris) throws IOException {
        while (album.next()) {
            if (album.field() == 11) {
                readDisc(album.message(), uris);
            } else {
                album.skip();
            }
        }
    }

    private static void readDisc(Wire.Reader disc, List<String> uris) throws IOException {
        while (disc.next()) {
            if (disc.field() == 3) {
                readTrack(disc.message(), uris);
            } else {
                disc.skip();
            }
        }
    }

    private static void readTrack(Wire.Reader track, List<String> uris) throws IOException {
        while (track.next()) {
            if (track.field() == 1) {
                uris.add("spotify:track:" + base62(track.bytes()));
            } else {
                track.skip();
            }
        }
    }

    /** Encodes a 16 byte gid as 22 zero padded base62 characters, big endian. */
    static String base62(byte[] gid) {
        BigInteger value = new BigInteger(1, gid);
        BigInteger base = BigInteger.valueOf(62);
        StringBuilder encoded = new StringBuilder();
        while (value.signum() > 0) {
            BigInteger[] divRem = value.divideAndRemainder(base);
            encoded.append(BASE62_ALPHABET.charAt(divRem[1].intValue()));
            value = divRem[0];
        }
        while (encoded.length() < 22) {
            encoded.append('0');
        }
        return encoded.reverse().toString();
    }
}
