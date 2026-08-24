package app.noam.extension.spotify.localserver;

import android.content.Context;
import android.media.MediaMetadataRetriever;
import android.net.Uri;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import app.noam.extension.spotify.Utils;

public final class ServerIndex {
    private static final String FILE_NAME = "morphe_local_server_index.json";

    private static volatile List<RemoteTrack> cached;

    private ServerIndex() {}

    public static synchronized List<RemoteTrack> get() {
        if (cached != null) return cached;

        List<RemoteTrack> tracks = new ArrayList<>();
        try {
            File file = indexFile();
            if (file != null && file.exists()) {
                byte[] bytes = new byte[(int) file.length()];
                try (RandomAccessFile in = new RandomAccessFile(file, "r")) {
                    in.readFully(bytes);
                }
                JSONArray array = new JSONArray(new String(bytes, StandardCharsets.UTF_8));
                for (int i = 0; i < array.length(); i++) {
                    tracks.add(RemoteTrack.fromJson(array.getJSONObject(i)));
                }
            }
        } catch (Exception ex) {
            Utils.logError("Could not read the server index", ex);
        }
        cached = Collections.unmodifiableList(tracks);
        return cached;
    }

    public static synchronized void save(List<RemoteTrack> tracks) {
        try {
            JSONArray array = new JSONArray();
            for (RemoteTrack track : tracks) array.put(track.toJson());

            File file = indexFile();
            if (file == null) return;
            try (FileOutputStream out = new FileOutputStream(file)) {
                out.write(array.toString().getBytes(StandardCharsets.UTF_8));
            }
            cached = Collections.unmodifiableList(new ArrayList<>(tracks));
        } catch (Exception ex) {
            Utils.logError("Could not write the server index", ex);
        }
    }

    public static RemoteTrack byId(String id) {
        for (RemoteTrack track : get()) {
            if (track.id().equals(id)) return track;
        }
        return null;
    }

    public static List<RemoteTrack> refresh(Progress progress) throws IOException {
        WebDav webDav = WebDav.fromConfig();
        List<RemoteTrack> tracks = webDav.listFolder(
                ServerConfig.getString(ServerConfig.KEY_FOLDER, ""));

        List<RemoteTrack> previous = get();
        int index = 0;
        for (RemoteTrack track : tracks) {
            index++;
            RemoteTrack known = find(previous, track.url);
            if (known != null && known.durationSeconds > 0) {
                track.title = known.title;
                track.artist = known.artist;
                track.album = known.album;
                track.durationSeconds = known.durationSeconds;
            } else {
                readTags(track);
            }
            if (progress != null) progress.onProgress(index, tracks.size());
        }

        save(tracks);
        return tracks;
    }

    private static RemoteTrack find(List<RemoteTrack> tracks, String url) {
        for (RemoteTrack track : tracks) {
            if (track.url.equals(url)) return track;
        }
        return null;
    }

    private static void readTags(RemoteTrack track) {
        MediaMetadataRetriever retriever = new MediaMetadataRetriever();
        try {
            Context context = Utils.getContext();
            if (context == null) return;

            List<RemoteTrack> staging = new ArrayList<>(get());
            staging.add(track);
            cached = Collections.unmodifiableList(staging);

            Uri uri = ServerFileProvider.uriFor(track);
            retriever.setDataSource(context, uri);

            String title = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_TITLE);
            String artist = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_ARTIST);
            String album = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_ALBUM);
            String duration = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DURATION);

            if (title != null) track.title = title;
            if (artist != null) track.artist = artist;
            if (album != null) track.album = album;
            if (duration != null) {
                try {
                    track.durationSeconds = (int) (Long.parseLong(duration) / 1000L);
                } catch (NumberFormatException ignored) {
                }
            }
        } catch (Exception ex) {
            Utils.log("Could not read tags for " + track.name + ": " + ex);
        } finally {
            try {
                retriever.release();
            } catch (Exception ignored) {
            }
        }
    }

    private static File indexFile() {
        Context context = Utils.getContext();
        return context == null ? null : new File(context.getFilesDir(), FILE_NAME);
    }

    public interface Progress {
        void onProgress(int done, int total);
    }
}
