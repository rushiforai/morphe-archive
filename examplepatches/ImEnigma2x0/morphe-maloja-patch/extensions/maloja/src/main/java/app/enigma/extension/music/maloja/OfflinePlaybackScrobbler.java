package app.enigma.extension.music.maloja;

import android.os.Handler;
import android.os.Looper;

import org.json.JSONObject;

import java.io.File;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;

import app.morphe.extension.shared.Logger;

/**
 * Scrobbles the downloads played by the offline player of the official "Downloads" patch.
 * That player runs its own media session, which the media session hooks of this patch never
 * see, but it reports its state to listeners twice a second while a track is loaded.
 * <p>
 * The played time is counted from the positions it reports instead of a timer, because the
 * player stops without telling its listeners: once the reports stop, nothing more is counted.
 * <p>
 * The official classes cannot be compiled against, so they are reached by reflection and this
 * does nothing when the downloads patch is not applied.
 */
final class OfflinePlaybackScrobbler {
    private static final String SERVICE_CLASS = "app.morphe.extension.music.patches.downloads.OfflinePlaybackService";
    private static final String TRACK_CLASS = "app.morphe.extension.music.patches.downloads.OfflineTrack";

    /** A position step longer than this is a seek, not playback. The player reports every 500 ms. */
    private static final long MAX_PLAYED_STEP_MILLIS = 3_000;
    /** Going back to the start of the same track, by repeat or by hand, is a new listen. */
    private static final long RESTART_POSITION_MILLIS = 3_000;

    private static OfflinePlaybackScrobbler instance;

    private static Method loadTrack;
    private static Method trackTitle;
    private static Method trackArtist;
    private static Method trackAlbum;
    private static Method trackDurationSeconds;

    private final Handler mainHandler = new Handler(Looper.getMainLooper());

    // Only accessed on the main thread.
    private String currentPath;
    private String title;
    private String artist;
    private String album;
    private int durationSeconds;
    private long listenedAtSeconds;
    private long lastPositionMillis;
    private long playedMillis;
    private boolean scrobbled;

    static void start() {
        if (instance != null) return;

        final Class<?> service;
        final Class<?> listenerInterface;
        try {
            service = Class.forName(SERVICE_CLASS);
            listenerInterface = Class.forName(SERVICE_CLASS + "$PlaybackListener");
        } catch (Throwable ex) {
            Logger.printDebug(() -> "Official offline player not available: " + ex);
            return;
        }

        try {
            Class<?> track = Class.forName(TRACK_CLASS);
            loadTrack = track.getMethod("load", File.class);
            trackTitle = track.getMethod("title");
            trackArtist = track.getMethod("artist");
            trackAlbum = track.getMethod("album");
            trackDurationSeconds = track.getMethod("durationSeconds");
        } catch (Throwable ex) {
            // The metadata file next to the download is read directly instead.
            Logger.printDebug(() -> "Official offline track class not available: " + ex);
            loadTrack = null;
        }

        instance = new OfflinePlaybackScrobbler();
        try {
            Object listener = Proxy.newProxyInstance(
                    listenerInterface.getClassLoader(),
                    new Class<?>[]{listenerInterface},
                    (proxy, method, args) -> {
                        switch (method.getName()) {
                            case "hashCode":
                                return System.identityHashCode(proxy);
                            case "equals":
                                return proxy == args[0];
                            case "toString":
                                return "MalojaOfflineScrobbleListener";
                            case "onPlaybackChanged":
                                instance.post((String) args[0], (Boolean) args[2],
                                        (Integer) args[3], (Integer) args[4]);
                                return null;
                            default:
                                return null;
                        }
                    });
            service.getMethod("addListener", listenerInterface).invoke(null, listener);
            Logger.printDebug(() -> "Listening to the official offline player");
        } catch (Throwable ex) {
            Logger.printException(() -> "Could not listen to the official offline player", ex);
        }
    }

    private void post(String path, boolean playing, int positionMillis, int durationMillis) {
        if (Looper.myLooper() == Looper.getMainLooper()) {
            onPlaybackChanged(path, playing, positionMillis, durationMillis);
        } else {
            mainHandler.post(() -> onPlaybackChanged(path, playing, positionMillis, durationMillis));
        }
    }

    private void onPlaybackChanged(String path, boolean playing, int positionMillis, int durationMillis) {
        try {
            if (path == null || path.isEmpty()) {
                currentPath = null;
                return;
            }

            final boolean restarted = path.equals(currentPath)
                    && positionMillis < RESTART_POSITION_MILLIS
                    && lastPositionMillis - positionMillis > RESTART_POSITION_MILLIS;
            if (!path.equals(currentPath) || restarted) {
                onTrackStart(path, positionMillis, durationMillis);
                return;
            }

            if (durationSeconds <= 0 && durationMillis > 0) {
                // The player only knows the length once it is prepared.
                durationSeconds = durationMillis / 1000;
            }

            final long step = positionMillis - lastPositionMillis;
            lastPositionMillis = positionMillis;
            if (playing && step > 0 && step <= MAX_PLAYED_STEP_MILLIS) {
                playedMillis += step;
            }

            maybeScrobble();
        } catch (Exception ex) {
            Logger.printException(() -> "Offline playback scrobble failure", ex);
        }
    }

    private void onTrackStart(String path, int positionMillis, int durationMillis) {
        currentPath = path;
        lastPositionMillis = positionMillis;
        playedMillis = 0;
        scrobbled = false;
        listenedAtSeconds = (System.currentTimeMillis() - positionMillis) / 1000;
        title = artist = album = null;
        durationSeconds = durationMillis > 0 ? durationMillis / 1000 : 0;

        readTrackMetadata(new File(path));
        if (title != null && artist != null) {
            Logger.printDebug(() -> "Offline song detected: " + title + " - " + artist);
        } else {
            Logger.printDebug(() -> "Offline song without title or artist, not scrobbled: " + path);
        }
    }

    private void readTrackMetadata(File audioFile) {
        String rawTitle = null, rawArtist = null, rawAlbum = null;
        int storedDuration = 0;

        try {
            if (loadTrack != null) {
                Object track = loadTrack.invoke(null, audioFile);
                rawTitle = (String) trackTitle.invoke(track);
                rawArtist = (String) trackArtist.invoke(track);
                rawAlbum = (String) trackAlbum.invoke(track);
                storedDuration = (Integer) trackDurationSeconds.invoke(track);
            } else {
                // Same layout the official patch writes: <videoId>.json next to <videoId>.<ext>.
                String name = audioFile.getName();
                int dot = name.lastIndexOf('.');
                File metadata = new File(audioFile.getParentFile(), (dot > 0 ? name.substring(0, dot) : name) + ".json");
                if (metadata.isFile()) {
                    JSONObject json = new JSONObject(new String(Files.readAllBytes(metadata.toPath()), StandardCharsets.UTF_8));
                    rawTitle = json.optString("title");
                    rawArtist = json.optString("artist");
                    rawAlbum = json.optString("album");
                    storedDuration = json.optInt("durationSeconds");
                }
            }
        } catch (Throwable ex) {
            Logger.printException(() -> "Could not read offline track metadata: " + audioFile, ex);
        }

        // Without metadata the official track falls back to the video id, which is no title.
        final String videoId = audioFile.getName().replaceFirst("\\.[^.]*$", "");
        if (rawTitle != null && rawTitle.equals(videoId)) rawTitle = null;

        String[] resolved = MetadataCleaner.resolveTitleAndArtist(rawTitle, rawArtist);
        title = blankToNull(resolved[0]);
        artist = blankToNull(resolved[1]);
        album = blankToNull(MetadataCleaner.cleanAlbum(rawAlbum));
        if (durationSeconds <= 0) durationSeconds = storedDuration;
    }

    private void maybeScrobble() {
        if (scrobbled || title == null || artist == null || !MalojaSettings.ENABLED.get()) return;

        final long threshold = MalojaSettings.scrobbleThresholdMillis(durationSeconds);
        if (threshold < 0 || playedMillis < threshold) return;

        scrobbled = true;
        ScrobbleQueue.add(new ScrobbleQueue.Listen(artist, title, album, durationSeconds, listenedAtSeconds));
    }

    private static String blankToNull(String value) {
        return value == null || value.isBlank() ? null : value;
    }

    private OfflinePlaybackScrobbler() {
    }
}
