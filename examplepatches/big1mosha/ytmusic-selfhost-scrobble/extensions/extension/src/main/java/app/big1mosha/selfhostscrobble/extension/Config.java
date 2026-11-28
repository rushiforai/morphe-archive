/*
 * Personal use only. See the README for details.
 */

package app.big1mosha.selfhostscrobble.extension;

import android.app.Application;
import android.content.Context;
import android.util.Log;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.Locale;

/**
 * Configuration for the self-hosted scrobbler.
 *
 * <p>Values are read from, in order of priority:
 * <ol>
 *     <li>{@code <app external files dir>/scrobble.conf}, with {@code server=} and {@code token=} lines.</li>
 *     <li>The constants below.</li>
 * </ol>
 *
 * <p>The config file keeps the token out of this repository. Its path for YouTube Music is
 * {@code /sdcard/Android/data/com.google.android.apps.youtube.music/files/scrobble.conf}.
 */
public final class Config {
    private static final String TAG = "SelfHostScrobble";
    private static final String CONFIG_FILE_NAME = "scrobble.conf";

    /**
     * Base URL of the ListenBrainz-compatible server.
     *
     * <p>Examples:
     * <ul>
     *     <li>Koito: {@code http://192.168.1.5:4110/apis/listenbrainz}</li>
     *     <li>Maloja: {@code http://192.168.1.5:42010/apis/listenbrainz}</li>
     * </ul>
     */
    public static final String DEFAULT_SERVER_URL = "";

    /** API key/token of the server. */
    public static final String DEFAULT_TOKEN = "";

    /** Send a "now playing" update when a track starts. */
    public static final boolean NOW_PLAYING = true;

    /** Tracks shorter than this are never scrobbled. */
    public static final int MIN_SONG_DURATION_SECONDS = 30;

    /** Scrobble after listening to this percentage of the track. */
    public static final int DELAY_PERCENT = 50;

    /** Never wait longer than this before scrobbling. */
    public static final int DELAY_SECONDS = 180;

    /** Remove "Official Video", "Remaster", "Live" and similar clutter from metadata. */
    public static final boolean CLEAN_METADATA = true;

    /** Read "Artist - Track" from the video title. */
    public static final boolean PARSE_TITLE = false;

    /** Extra regex removed from titles, artists and albums. Empty to disable. */
    public static final String CUSTOM_REGEX = "";

    private static boolean loaded;
    private static String serverUrl = DEFAULT_SERVER_URL;
    private static String token = DEFAULT_TOKEN;

    private Config() {
    }

    public static String serverUrl() {
        load();
        return serverUrl;
    }

    public static String token() {
        load();
        return token;
    }

    public static boolean isConfigured() {
        return !serverUrl().trim().isEmpty() && !token().trim().isEmpty();
    }

    private static synchronized void load() {
        if (loaded) {
            return;
        }
        loaded = true;

        try {
            Context context = getContext();
            if (context == null) {
                return;
            }

            File directory = context.getExternalFilesDir(null);
            if (directory == null) {
                return;
            }

            File file = new File(directory, CONFIG_FILE_NAME);
            if (!file.isFile()) {
                return;
            }

            try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
                String line;
                while ((line = reader.readLine()) != null) {
                    line = line.trim();
                    if (line.isEmpty() || line.startsWith("#")) {
                        continue;
                    }

                    int separator = line.indexOf('=');
                    if (separator <= 0) {
                        continue;
                    }

                    String key = line.substring(0, separator).trim().toLowerCase(Locale.ROOT);
                    String value = line.substring(separator + 1).trim();

                    if (key.equals("server")) {
                        serverUrl = value;
                    } else if (key.equals("token")) {
                        token = value;
                    }
                }
            }

            Log.i(TAG, "Loaded config from " + file.getAbsolutePath());
        } catch (Throwable t) {
            Log.w(TAG, "Failed to read " + CONFIG_FILE_NAME, t);
        }
    }

    /**
     * The extension runs inside the YouTube Music process and has no context of its own.
     */
    private static Context getContext() {
        try {
            Class<?> activityThread = Class.forName("android.app.ActivityThread");
            Object application = activityThread.getMethod("currentApplication").invoke(null);
            return application instanceof Application ? (Application) application : null;
        } catch (Throwable t) {
            Log.w(TAG, "Could not get the app context", t);
            return null;
        }
    }
}
