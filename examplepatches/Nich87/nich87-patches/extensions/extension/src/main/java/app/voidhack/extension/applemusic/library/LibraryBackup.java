package app.voidhack.extension.applemusic.library;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import java.nio.charset.CodingErrorAction;
import java.nio.charset.CharacterCodingException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Objects;
import java.util.concurrent.CancellationException;
import java.util.concurrent.atomic.AtomicBoolean;

final class LibraryBackup {
    private static final String FORMAT = "app.voidhack.applemusic.library";
    private static final int MAX_BYTES = 32 * 1024 * 1024;
    final List<Track> library;
    final List<Playlist> playlists;

    LibraryBackup(List<Track> library, List<Playlist> playlists) {
        this.library = Collections.unmodifiableList(new ArrayList<>(library));
        this.playlists = Collections.unmodifiableList(new ArrayList<>(playlists));
    }

    static final class Track {
        final String catalogId;
        final String title;
        final String artist;
        final String album;
        final boolean musicVideo;

        Track(String catalogId, String title, String artist, String album, boolean musicVideo) {
            if (!catalogId.isEmpty() && !catalogId.matches("[1-9][0-9]{0,18}")) {
                throw new IllegalArgumentException("Invalid Apple Music catalog ID");
            }
            if (!catalogId.isEmpty()) Long.parseLong(catalogId);
            this.catalogId = catalogId;
            this.title = Objects.requireNonNull(title);
            this.artist = Objects.requireNonNull(artist);
            this.album = Objects.requireNonNull(album);
            this.musicVideo = musicVideo;
        }

        String key() {
            String identity = catalogId.isEmpty() ? "local:" + title.length() + ":" + title
                    + artist.length() + ":" + artist + album : "catalog:" + catalogId;
            return (musicVideo ? "video:" : "song:") + identity;
        }
    }

    static final class Playlist {
        final String name;
        final String description;
        final List<Track> tracks;

        Playlist(String name, String description, List<Track> tracks) {
            if (name.trim().isEmpty()) throw new IllegalArgumentException("A playlist needs a name");
            this.name = name;
            this.description = Objects.requireNonNull(description);
            this.tracks = Collections.unmodifiableList(new ArrayList<>(tracks));
        }

        boolean sameContents(Playlist other) {
            if (!name.equals(other.name) || !description.equals(other.description)
                    || tracks.size() != other.tracks.size()) return false;
            for (int i = 0; i < tracks.size(); i++) {
                if (!tracks.get(i).key().equals(other.tracks.get(i).key())) return false;
            }
            return true;
        }
    }

    static LibraryBackup read(InputStream input, AtomicBoolean cancelled) throws IOException {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        byte[] buffer = new byte[8192];
        int count;
        while ((count = input.read(buffer)) != -1) {
            checkCancelled(cancelled);
            if (bytes.size() > MAX_BYTES - count) throw new LibraryFailure("backup_too_large");
            bytes.write(buffer, 0, count);
        }
        checkCancelled(cancelled);
        try {
            String json = StandardCharsets.UTF_8.newDecoder().onMalformedInput(CodingErrorAction.REPORT)
                    .onUnmappableCharacter(CodingErrorAction.REPORT).decode(ByteBuffer.wrap(bytes.toByteArray())).toString();
            if (json.startsWith("\ufeff")) json = json.substring(1);
            JSONObject root = new JSONObject(json);
            if (!FORMAT.equals(string(root, "format")) || !Integer.valueOf(1).equals(root.get("version"))) {
                throw new LibraryFailure("backup_unsupported");
            }
            List<Track> library = readTracks(root.getJSONArray("library"));
            List<Playlist> playlists = new ArrayList<>();
            JSONArray lists = root.getJSONArray("playlists");
            for (int i = 0; i < lists.length(); i++) {
                JSONObject list = lists.getJSONObject(i);
                playlists.add(new Playlist(string(list, "name"), string(list, "description"),
                        readTracks(list.getJSONArray("tracks"))));
            }
            return new LibraryBackup(library, playlists);
        } catch (JSONException | IllegalArgumentException | CharacterCodingException exception) {
            LibraryFailure failure = new LibraryFailure("backup_invalid");
            failure.initCause(exception);
            throw failure;
        }
    }

    private static String string(JSONObject json, String name) throws JSONException {
        Object value = json.get(name);
        if (!(value instanceof String)) throw new JSONException(name + " must be a string");
        return (String) value;
    }

    private static List<Track> readTracks(JSONArray array) throws JSONException {
        List<Track> tracks = new ArrayList<>();
        for (int i = 0; i < array.length(); i++) {
            JSONObject track = array.getJSONObject(i);
            Object video = track.has("musicVideo") ? track.get("musicVideo") : false;
            if (!(video instanceof Boolean)) throw new JSONException("musicVideo must be a boolean");
            tracks.add(new Track(string(track, "catalogId"), string(track, "title"),
                    string(track, "artist"), string(track, "album"), (Boolean) video));
        }
        return tracks;
    }

    void write(OutputStream output, AtomicBoolean cancelled) throws IOException {
        try {
            JSONArray lists = new JSONArray();
            for (Playlist playlist : playlists) {
                checkCancelled(cancelled);
                lists.put(new JSONObject().put("name", playlist.name).put("description", playlist.description)
                        .put("tracks", writeTracks(playlist.tracks)));
            }
            JSONObject root = new JSONObject().put("format", FORMAT).put("version", 1)
                    .put("library", writeTracks(library)).put("playlists", lists);
            byte[] bytes = root.toString(2).getBytes(StandardCharsets.UTF_8);
            if (bytes.length > MAX_BYTES) throw new LibraryFailure("backup_too_large");
            for (int start = 0; start < bytes.length; start += 8192) {
                checkCancelled(cancelled);
                output.write(bytes, start, Math.min(8192, bytes.length - start));
            }
            output.flush();
        } catch (JSONException exception) {
            LibraryFailure failure = new LibraryFailure("backup_encode");
            failure.initCause(exception);
            throw failure;
        }
    }

    private static void checkCancelled(AtomicBoolean cancelled) {
        if (cancelled.get()) throw new CancellationException();
    }

    private static JSONArray writeTracks(List<Track> tracks) throws JSONException {
        JSONArray result = new JSONArray();
        for (Track track : tracks) {
            result.put(new JSONObject().put("catalogId", track.catalogId).put("title", track.title)
                    .put("artist", track.artist).put("album", track.album).put("musicVideo", track.musicVideo));
        }
        return result;
    }
}
