package app.spicetify.extension.spotify.localserver;

import java.io.ByteArrayOutputStream;
import java.lang.ref.WeakReference;

public final class LocalServerHook {
    private static WeakReference<Object> reader = new WeakReference<>(null);
    private static long handle;
    private LocalServerHook() {}

    public static byte[] appendServerFiles(byte[] original) {
        if (!ServerConfig.snapshot().enabled || ServerIndex.tracks().isEmpty()) return original;
        try {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            if (original != null) out.write(original);
            for (RemoteTrack track : ServerIndex.tracks()) out.write(ProtoWriter.encodeFileEntry(
                    ServerFileProvider.uriFor(track).toString(), track.displayTitle(), track.album, track.artist, track.durationSeconds,
                    track.providerIdentity != null && !track.browse.albumImageTag.isEmpty()));
            return out.toByteArray();
        } catch (java.io.IOException | RuntimeException ex) { return original; }
    }

    public static synchronized void onStartListening(Object value, long nativeHandle) {
        reader = new WeakReference<>(value); handle = nativeHandle;
    }
    public static synchronized void onStopListening(Object value) {
        if (reader.get() == value) { reader.clear(); handle = 0; }
    }
    static synchronized void requestRescan() {
        Object value = reader.get();
        if (value == null) return;
        try {
            java.lang.reflect.Method change = value.getClass().getDeclaredMethod("onChange", long.class);
            change.setAccessible(true); change.invoke(value, handle);
        } catch (ReflectiveOperationException | RuntimeException ignored) { }
    }
}
