package app.spicetify.extension.spotify.localserver;

import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import io.reactivex.rxjava3.core.Single;
import java.io.UnsupportedEncodingException;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Consumer;

/**
 * Plays server tracks through Spotify's own player as an inline context of their Local Files URIs,
 * so Now Playing, the notification, and the queue behave as they do for any local file.
 */
public final class ServerPlayback {
    private static final String TAG = "SpicetifyPlayback";
    private static final String CONTEXT = "spotify:local-files";
    private static final List<WeakReference<Object>> players = new ArrayList<>();

    private ServerPlayback() {}

    /**
     * Called from the constructor of Spotify's play-command sender. Instances share one process-wide
     * player; senders owned by closed screens are left for the garbage collector.
     */
    public static synchronized void setPlayer(Object value) {
        players.removeIf(reference -> reference.get() == null);
        players.add(new WeakReference<>(value));
    }

    private static synchronized Object player() {
        for (int i = players.size() - 1; i >= 0; i--) {
            Object candidate = players.get(i).get();
            if (candidate != null) return candidate;
        }
        return null;
    }

    /** The URI Spotify gives a local file, built the way {@code OpenedAudioFiles} builds it. */
    static String localUri(MusicCatalog.Track track) {
        return "spotify:local:" + encode(track.artist) + ':' + encode(track.album) + ':' + encode(track.title) + ':' + track.durationSeconds;
    }

    private static String encode(String value) {
        try {
            return URLEncoder.encode(value, "utf-8").replace("*", "%2A");
        } catch (UnsupportedEncodingException impossible) {
            throw new IllegalStateException(impossible);
        }
    }

    /**
     * Starts {@code tracks} in order from {@code index}. Returns an error message, or null when the command
     * was sent; a later rejection by Spotify is passed to {@code onError} on the main thread.
     */
    public static String play(List<MusicCatalog.Track> tracks, int index, Consumer<String> onError) {
        Object target = player();
        if (target == null) return "Spotify's player is not ready yet. Try again in a moment.";
        if (index < 0 || index >= tracks.size()) return "This song is no longer in the album.";
        Handler main = new Handler(Looper.getMainLooper());
        try {
            send(target, tracks, index).subscribe(
                    outcome -> {
                        if (outcome == null || !outcome.toString().startsWith("Success")) {
                            Log.w(TAG, "Spotify did not play the album: " + outcome);
                            main.post(() -> onError.accept("Spotify could not play this album. Check that Local audio files is on in Spotify's Apps and devices settings."));
                        }
                    },
                    error -> {
                        Log.e(TAG, "Spotify rejected the play command", error);
                        main.post(() -> onError.accept("Spotify could not play this album."));
                    });
            return null;
        } catch (ReflectiveOperationException | RuntimeException | LinkageError error) {
            Log.e(TAG, "Could not build a Spotify play command", error);
            return "Spotify's player changed; server playback is unavailable.";
        }
    }

    /** The names Spotify shows for a track; its artwork comes from {@link ServerArtwork#bytes}. */
    static Map<String, String> metadata(MusicCatalog.Track track) {
        Map<String, String> metadata = new HashMap<>();
        metadata.put("title", track.title);
        metadata.put("artist_name", track.artist);
        metadata.put("album_title", track.album);
        return metadata;
    }

    private static Single<?> send(Object target, List<MusicCatalog.Track> tracks, int index) throws ReflectiveOperationException {
        ClassLoader loader = target.getClass().getClassLoader();
        Class<?> trackType = Class.forName("com.spotify.player.model.ContextTrack", true, loader);
        Method trackStart = trackType.getMethod("builder", String.class);
        Class<?> trackBuilder = trackStart.getReturnType();
        Method withMetadata = trackBuilder.getMethod("metadata", Map.class);
        Method buildTrack = trackBuilder.getMethod("build");
        List<Object> contextTracks = new ArrayList<>(tracks.size());
        for (MusicCatalog.Track track : tracks) {
            Object builder = trackStart.invoke(null, localUri(track));
            builder = withMetadata.invoke(builder, metadata(track));
            contextTracks.add(buildTrack.invoke(builder));
        }
        Class<?> pageType = Class.forName("com.spotify.player.model.ContextPage", true, loader);
        Method pageStart = pageType.getMethod("builder");
        Object page = pageStart.invoke(null);
        page = pageStart.getReturnType().getMethod("tracks", List.class).invoke(page, contextTracks);
        page = pageStart.getReturnType().getMethod("build").invoke(page);
        Class<?> contextType = Class.forName("com.spotify.player.model.Context", true, loader);
        Method contextStart = contextType.getMethod("builder", String.class);
        Object context = contextStart.invoke(null, CONTEXT);
        context = contextStart.getReturnType().getMethod("pages", List.class).invoke(context, Collections.singletonList(page));
        context = contextStart.getReturnType().getMethod("build").invoke(context);

        Class<?> originType = Class.forName("com.spotify.player.model.PlayOrigin", true, loader);
        Method originStart = originType.getMethod("builder", String.class);
        Class<?> originBuilder = originStart.getReturnType();
        Object origin = originStart.invoke(null, "localfiles");
        origin = originBuilder.getMethod("viewUri", String.class).invoke(origin, CONTEXT);
        origin = originBuilder.getMethod("build").invoke(origin);

        Class<?> skipType = Class.forName("com.spotify.player.model.command.options.SkipToTrack", true, loader);
        Object skip = skipType.getMethod("fromIndices", Long.class, Long.class).invoke(null, (long) index, 0L);
        Class<?> optionsType = Class.forName("com.spotify.player.model.command.options.PreparePlayOptions", true, loader);
        Method optionsStart = optionsType.getMethod("builder");
        Class<?> optionsBuilder = optionsStart.getReturnType();
        Object options = optionsStart.invoke(null);
        options = optionsBuilder.getMethod("skipTo", skipType).invoke(options, skip);
        options = optionsBuilder.getMethod("build").invoke(options);

        Class<?> commandType = Class.forName("com.spotify.player.model.command.PlayCommand", true, loader);
        Method commandStart = commandType.getMethod("builder", contextType, originType);
        Class<?> commandBuilder = commandStart.getReturnType();
        Object command = commandStart.invoke(null, context, origin);
        command = commandBuilder.getMethod("options", optionsType).invoke(command, options);
        command = commandBuilder.getMethod("build").invoke(command);

        for (Method method : target.getClass().getMethods()) {
            if (method.getParameterCount() == 1 && method.getParameterTypes()[0] == commandType
                    && Single.class.isAssignableFrom(method.getReturnType())) {
                return (Single<?>) method.invoke(target, command);
            }
        }
        throw new NoSuchMethodException("Spotify player has no play method");
    }
}
