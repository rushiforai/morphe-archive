package app.spicetify.extension.spotify.localserver;

import android.content.Context;
import android.util.Log;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URI;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.zip.GZIPInputStream;
import java.util.zip.GZIPOutputStream;

/** Saves the last completed scan so server tracks are available as soon as Spotify starts. */
final class IndexCache {
    private static final String TAG = "SpicetifyServerIndex";
    private static final int VERSION = 2;
    private static final int MAX_TRACKS = 200_000;

    private IndexCache() {}

    /** Identifies the server, account, and library a scan belongs to. */
    static String key(ServerConfig.Snapshot snapshot) {
        JellyfinConnection jellyfin = snapshot.jellyfinConnection();
        if (jellyfin != null) return jellyfin.identity();
        ServerConnection dav = snapshot.connection();
        return dav == null ? null : "webdav\n" + dav.root + "\n" + dav.username;
    }

    static File file(Context context) {
        return new File(context.getNoBackupFilesDir(), "spicetify-server-index.bin");
    }

    static File temporary(File file) {
        return new File(file.getPath() + ".tmp");
    }

    /** Writes {@code tracks} next to {@code file}; returns the written temporary file, or null when writing failed. */
    static File write(File file, String key, List<RemoteTrack> tracks) {
        File temporary = temporary(file);
        try (DataOutputStream out = new DataOutputStream(new BufferedOutputStream(new GZIPOutputStream(new FileOutputStream(temporary))))) {
            out.writeInt(VERSION);
            out.writeUTF(key);
            out.writeInt(tracks.size());
            for (RemoteTrack track : tracks) {
                out.writeUTF(track.url.toASCIIString());
                out.writeUTF(track.name);
                out.writeLong(track.size);
                optional(out, track.etag);
                out.writeUTF(track.title);
                out.writeUTF(track.album);
                out.writeUTF(track.artist);
                out.writeInt(track.durationSeconds);
                out.writeUTF(track.id);
                optional(out, track.providerIdentity);
                BrowseMetadata browse = track.browse;
                out.writeUTF(browse.albumId);
                out.writeUTF(browse.parentId);
                out.writeUTF(browse.albumArtist);
                out.writeUTF(browse.albumImageTag == null ? "" : browse.albumImageTag);
                credits(out, browse.artists);
                credits(out, browse.albumArtists);
                out.writeInt(browse.discNumber);
                out.writeInt(browse.trackNumber);
                out.writeInt(browse.year);
            }
        } catch (IOException | RuntimeException error) {
            Log.w(TAG, "Could not save the server index", error);
            delete(temporary);
            return null;
        }
        return temporary;
    }

    /** Replaces the saved index with a file from {@link #write}. */
    static void commit(File temporary, File file) {
        if (!temporary.renameTo(file)) {
            Log.w(TAG, "Could not replace " + file);
            delete(temporary);
        }
    }

    /** Removes the saved index and any unfinished write. */
    static void delete(Context context) {
        File file = file(context);
        delete(file);
        delete(temporary(file));
    }

    private static void delete(File file) {
        if (file.exists() && !file.delete()) Log.w(TAG, "Could not delete " + file);
    }

    /** The saved tracks for {@code key}, or an empty list when the file is missing, stale, or unreadable. */
    static List<RemoteTrack> read(File file, String key) {
        if (key == null || !file.isFile()) return Collections.emptyList();
        try (DataInputStream in = new DataInputStream(new BufferedInputStream(new GZIPInputStream(new FileInputStream(file))))) {
            if (in.readInt() != VERSION || !in.readUTF().equals(key)) return Collections.emptyList();
            int count = in.readInt();
            if (count < 0 || count > MAX_TRACKS) return Collections.emptyList();
            List<RemoteTrack> tracks = new ArrayList<>(count);
            for (int i = 0; i < count; i++) {
                URI url = URI.create(in.readUTF());
                String name = in.readUTF();
                long size = in.readLong();
                String etag = optional(in);
                String title = in.readUTF(), album = in.readUTF(), artist = in.readUTF();
                int duration = in.readInt();
                String id = in.readUTF();
                String identity = optional(in);
                String albumId = in.readUTF(), parentId = in.readUTF(), albumArtist = in.readUTF(), imageTag = in.readUTF();
                List<BrowseMetadata.ArtistCredit> artists = credits(in), albumArtists = credits(in);
                int disc = in.readInt(), number = in.readInt(), year = in.readInt();
                BrowseMetadata browse = new BrowseMetadata(albumId, parentId, albumArtist, imageTag, artists, albumArtists, disc, number, year);
                tracks.add(RemoteTrack.restore(url, name, size, etag, title, album, artist, duration, id, identity, browse));
            }
            return tracks;
        } catch (IOException | RuntimeException error) {
            Log.w(TAG, "Deleting an unreadable server index", error);
            delete(file);
            return Collections.emptyList();
        }
    }

    private static void optional(DataOutputStream out, String value) throws IOException {
        out.writeBoolean(value != null);
        if (value != null) out.writeUTF(value);
    }

    private static String optional(DataInputStream in) throws IOException {
        return in.readBoolean() ? in.readUTF() : null;
    }

    private static void credits(DataOutputStream out, List<BrowseMetadata.ArtistCredit> credits) throws IOException {
        out.writeInt(credits.size());
        for (BrowseMetadata.ArtistCredit credit : credits) {
            out.writeUTF(credit.id);
            out.writeUTF(credit.name);
        }
    }

    private static List<BrowseMetadata.ArtistCredit> credits(DataInputStream in) throws IOException {
        int count = in.readInt();
        if (count < 0 || count > 1024) throw new IOException("Invalid artist credits");
        List<BrowseMetadata.ArtistCredit> credits = new ArrayList<>(count);
        for (int i = 0; i < count; i++) credits.add(new BrowseMetadata.ArtistCredit(in.readUTF(), in.readUTF()));
        return credits;
    }
}
