package app.morphed.extension.twitch.patches;

import java.util.Collections;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import app.morphed.extension.twitch.hls.UrlKey;

/**
 * The stream being watched: the one opened to watch (not a preview on the home or Following page), while its
 * player keeps asking for it. Song removal works only for it, as the ad label does.
 * <p>
 * Its playlist list names the playlists its player asks for (a live stream's every two seconds; a past
 * broadcast's video pieces sit beside its playlists): while those requests come, it is being watched.
 */
public final class Watching {
    static final long ACTIVE_MS = 8_000;
    private static final Pattern URL = Pattern.compile("https?://[^\\s\"]+");
    private static final Set<String> PLAYLISTS = Collections.newSetFromMap(new ConcurrentHashMap<>());
    private static final Set<String> FOLDERS = Collections.newSetFromMap(new ConcurrentHashMap<>());
    private static volatile long lastAskedAt = Long.MIN_VALUE / 2;
    private static volatile long now = -1; // tests only

    private Watching() {
    }

    private static long now() {
        return now >= 0 ? now : System.currentTimeMillis();
    }

    /** A stream was opened to watch: its playlist list (the one handed to the player). Previews never come here. */
    public static void opened(String usherUrl, String playlistList) {
        PLAYLISTS.clear();
        FOLDERS.clear();
        boolean pastBroadcast = usherUrl != null && usherUrl.contains("/vod/");
        Matcher url = URL.matcher(playlistList);
        while (url.find()) {
            String key = UrlKey.of(url.group());
            PLAYLISTS.add(key);
            // a past broadcast's video pieces are next to its playlist: their requests say it's watched too
            if (pastBroadcast && key.lastIndexOf('/') > 8) FOLDERS.add(key.substring(0, key.lastIndexOf('/') + 1));
        }
        lastAskedAt = now();
    }

    /** Every player request: one for the watched stream says it's still being watched. */
    public static void request(String url) {
        if (PLAYLISTS.isEmpty() || url == null) return;
        String key = UrlKey.of(url);
        if (PLAYLISTS.contains(key)) {
            lastAskedAt = now();
            return;
        }
        if (!FOLDERS.isEmpty()) {
            for (String folder : FOLDERS) {
                if (key.startsWith(folder)) {
                    lastAskedAt = now();
                    return;
                }
            }
        }
    }

    /** Whether the stream opened to watch is being watched right now. */
    public static boolean active() {
        return !PLAYLISTS.isEmpty() && now() - lastAskedAt < ACTIVE_MS;
    }

    static void setNowForTest(long value) {
        now = value;
    }
}
