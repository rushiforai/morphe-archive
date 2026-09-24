package app.enigma.extension.music.maloja;

import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

import app.morphe.extension.shared.Logger;

/**
 * Bridge to the official "Play album songs" patch, which replaces a music video with the album
 * track while the media session keeps describing the video. This add-on cannot compile against
 * the official music extension, but the classes share the dex of the patched app, so they are
 * reached by reflection and everything degrades to the plain media session metadata when the
 * official patches are absent or change.
 */
final class AlbumSongBridge {

    static final class Song {
        final String title;
        final int durationSeconds;

        Song(String title, int durationSeconds) {
            this.title = title;
            this.durationSeconds = durationSeconds;
        }
    }

    private static final String PLAY_ALBUM_SONGS_CLASS = "app.morphe.extension.music.patches.album.PlayAlbumSongsPatch";
    private static final String VIDEO_INFORMATION_CLASS = "app.morphe.extension.music.shared.VideoInformation";

    private static final Method getVideoId;
    private static final Method getSong;
    private static final Method songTitle;
    private static final Method songDurationSeconds;
    private static final Method addSubstitutionListener;
    private static final Method addVideoIdListener;

    static {
        Method videoId = null, song = null, title = null, duration = null, substitution = null, videoIdListener = null;
        try {
            Class<?> videoInformation = Class.forName(VIDEO_INFORMATION_CLASS);
            Class<?> playAlbumSongs = Class.forName(PLAY_ALBUM_SONGS_CLASS);

            videoId = videoInformation.getMethod("getVideoId");
            song = playAlbumSongs.getMethod("getSong", String.class);
            title = song.getReturnType().getMethod("title");
            duration = song.getReturnType().getMethod("durationSeconds");
            substitution = playAlbumSongs.getMethod("addSubstitutionListener",
                    Class.forName(PLAY_ALBUM_SONGS_CLASS + "$SubstitutionListener"));
            videoIdListener = videoInformation.getMethod("addVideoIdListener",
                    Class.forName(VIDEO_INFORMATION_CLASS + "$VideoIdListener"));
        } catch (Throwable ex) {
            Logger.printDebug(() -> "Official album song substitution not available: " + ex);
            videoId = song = title = duration = substitution = videoIdListener = null;
        }
        getVideoId = videoId;
        getSong = song;
        songTitle = title;
        songDurationSeconds = duration;
        addSubstitutionListener = substitution;
        addVideoIdListener = videoIdListener;
    }

    static boolean isAvailable() {
        return getSong != null;
    }

    /**
     * @return The album track playing under the current video, or null if none is substituted.
     */
    static Song currentSong() {
        if (!isAvailable()) return null;
        try {
            Object song = getSong.invoke(null, getVideoId.invoke(null));
            if (song == null) return null;
            return new Song((String) songTitle.invoke(song), (Integer) songDurationSeconds.invoke(song));
        } catch (Throwable ex) {
            Logger.printDebug(() -> "Could not read the substituted album song: " + ex);
            return null;
        }
    }

    /**
     * Runs the listener, on the calling thread of the official hooks, whenever the substituted
     * song or the video id changes. Both can land after the metadata of the track.
     */
    static void addChangeListener(Runnable listener) {
        if (!isAvailable()) return;
        try {
            addSubstitutionListener.invoke(null, proxyOf(addSubstitutionListener.getParameterTypes()[0], listener));
            addVideoIdListener.invoke(null, proxyOf(addVideoIdListener.getParameterTypes()[0], listener));
        } catch (Throwable ex) {
            Logger.printDebug(() -> "Could not listen to the official album song substitution: " + ex);
        }
    }

    private static Object proxyOf(Class<?> listenerInterface, Runnable listener) {
        return Proxy.newProxyInstance(
                listenerInterface.getClassLoader(),
                new Class<?>[]{listenerInterface},
                (proxy, method, args) -> {
                    switch (method.getName()) {
                        case "hashCode":
                            return System.identityHashCode(proxy);
                        case "equals":
                            return proxy == args[0];
                        case "toString":
                            return "MalojaScrobbleListener";
                        default:
                            listener.run();
                            return null;
                    }
                });
    }

    private AlbumSongBridge() {
    }
}
