package app.noam.extension.spotify.localserver;

import java.io.ByteArrayOutputStream;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.util.List;

import app.noam.extension.spotify.Utils;

public final class LocalServerHook {
    private static WeakReference<Object> readerReference;
    private static long readerHandle;

    private LocalServerHook() {}

    public static byte[] appendServerFiles(byte[] queryResult) {
        try {
            if (!ServerConfig.isEnabled()) return queryResult;

            List<RemoteTrack> tracks = ServerIndex.get();
            if (tracks.isEmpty()) return queryResult;

            ByteArrayOutputStream out = new ByteArrayOutputStream(
                    (queryResult == null ? 0 : queryResult.length) + tracks.size() * 128);
            if (queryResult != null) out.write(queryResult);

            for (RemoteTrack track : tracks) {
                out.write(ProtoWriter.encodeFileEntry(
                        ServerFileProvider.uriFor(track).toString(),
                        track.displayTitle(),
                        track.album,
                        track.artist,
                        track.durationSeconds));
            }

            Utils.log("Added " + tracks.size() + " server tracks to the local file scan");
            return out.toByteArray();
        } catch (Throwable ex) {
            Utils.logError("Could not add server tracks to the local file scan", ex);
            return queryResult;
        }
    }

    public static void onStartListening(Object reader, long handle) {
        readerReference = new WeakReference<>(reader);
        readerHandle = handle;
    }

    public static void requestRescan() {
        try {
            Object reader = readerReference == null ? null : readerReference.get();
            if (reader == null) return;

            Method onChange = reader.getClass().getDeclaredMethod("onChange", long.class);
            onChange.setAccessible(true);
            onChange.invoke(reader, readerHandle);
        } catch (Throwable ex) {
            Utils.log("Could not request a rescan: " + ex);
        }
    }
}
