package app.originisland.extension;

import android.content.Context;
import android.net.Uri;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.function.BooleanSupplier;
import java.util.regex.Pattern;

/**
 * Synced lyrics for the music card, looked up on LRCLIB.
 */
final class AppleMusicLyrics {

    private static final String TAG = "OriginIslandAppleMusic";

    /**
     * What Apple Music adds to a title that LRCLIB often does not have.
     */
    private static final Pattern TITLE_ADDITION = Pattern.compile(
            "\\s*[(\\[][^)\\]]*(remaster|feat\\.|ft\\.|with |version|edit|mono|stereo|deluxe)[^)\\]]*[)\\]]",
            Pattern.CASE_INSENSITIVE);

    /**
     * LRCLIB answers with its tag for an instrumental song, and such short texts are no lyrics.
     */
    private static final int MIN_LYRICS_LENGTH = 50;

    /**
     * A recording this much longer or shorter than the song would be out of time with it.
     */
    private static final long MAX_DURATION_DIFFERENCE_S = 5;

    /**
     * LRCLIB is often too busy to answer, which says nothing about the song.
     */
    private static final long[] BUSY_RETRY_DELAYS_MS = {1_000, 3_000, 5_000, 10_000, 20_000, 30_000, 45_000};

    private AppleMusicLyrics() {
    }

    /**
     * @param isStale Tells that the song has changed, and the lyrics are no longer needed.
     * @return The lyrics as LRC, or an empty text if there are none.
     */
    static String load(Context context, String title, String artist, String album, long durationMs,
                       BooleanSupplier isStale) {
        File cached = new File(context.getCacheDir(),
                "lyrics-" + Integer.toHexString((title + "\n" + artist + "\n" + durationMs / 1000).hashCode()));
        try {
            if (cached.exists()) {
                return new String(Files.readAllBytes(cached.toPath()), StandardCharsets.UTF_8);
            }

            String lrc = find(title, artist, album, durationMs / 1000, isStale);
            // Only a song that was really looked up is kept. A busy LRCLIB is asked again next time.
            Files.write(cached.toPath(), lrc.getBytes(StandardCharsets.UTF_8));
            return lrc;
        } catch (BusyException | IOException ex) {
            Log.w(TAG, "Could not load the lyrics: " + ex);
        } catch (Exception ex) {
            Log.e(TAG, "Could not load the lyrics", ex);
        }
        return "";
    }

    /**
     * LRCLIB often fails one question and answers another at the same moment, so each way of asking
     * is tried in turn, and those it failed are asked again after a while.
     */
    private static String find(String title, String artist, String album, long durationS, BooleanSupplier isStale)
            throws Exception {
        String shortTitle = TITLE_ADDITION.matcher(title).replaceAll("").trim();

        List<Lookup> lookups = new ArrayList<>();
        if (album != null && durationS > 0) {
            lookups.add(() -> get(title, artist, album, durationS));
        }
        lookups.add(() -> get(title, artist, null, durationS));
        if (!shortTitle.equals(title)) {
            lookups.add(() -> get(shortTitle, artist, null, durationS));
        }
        lookups.add(() -> search(shortTitle, artist, durationS));

        for (int round = 0; ; round++) {
            String failure = null;
            for (Iterator<Lookup> iterator = lookups.iterator(); iterator.hasNext(); ) {
                if (isStale.getAsBoolean()) {
                    throw new BusyException("the song has changed");
                }
                try {
                    String lrc = iterator.next().find();
                    if (!lrc.isEmpty()) {
                        return lrc;
                    }
                    iterator.remove();
                } catch (BusyException | IOException ex) {
                    failure = ex.getMessage();
                }
            }
            if (failure == null) {
                return "";
            }
            if (round >= BUSY_RETRY_DELAYS_MS.length) {
                throw new BusyException(failure);
            }

            Log.i(TAG, "LRCLIB is busy (" + failure + "), trying again");
            // The next song should not have to wait for this one.
            long end = System.currentTimeMillis() + BUSY_RETRY_DELAYS_MS[round];
            while (System.currentTimeMillis() < end && !isStale.getAsBoolean()) {
                Thread.sleep(250);
            }
        }
    }

    private static String get(String title, String artist, String album, long durationS)
            throws Exception {
        Uri.Builder address = Uri.parse("https://lrclib.net/api/get").buildUpon()
                .appendQueryParameter("track_name", title)
                .appendQueryParameter("artist_name", artist);
        if (album != null) {
            address.appendQueryParameter("album_name", album);
        }
        if (durationS > 0) {
            address.appendQueryParameter("duration", String.valueOf(durationS));
        }

        String body = request(address.toString());
        return body == null ? "" : lyricsOf(new JSONObject(body));
    }

    /**
     * @return The lyrics of the recording closest to the song in length.
     */
    private static String search(String title, String artist, long durationS)
            throws Exception {
        String body = request(Uri.parse("https://lrclib.net/api/search").buildUpon()
                .appendQueryParameter("track_name", title)
                .appendQueryParameter("artist_name", artist)
                .toString());
        if (body == null) {
            return "";
        }

        String best = "";
        long bestDifference = Long.MAX_VALUE;
        JSONArray results = new JSONArray(body);
        for (int i = 0; i < results.length(); i++) {
            JSONObject result = results.getJSONObject(i);
            String lrc = lyricsOf(result);
            long difference = Math.abs(Math.round(result.optDouble("duration", 0)) - durationS);
            if (!lrc.isEmpty() && difference < bestDifference
                    && (durationS <= 0 || difference <= MAX_DURATION_DIFFERENCE_S)) {
                best = lrc;
                bestDifference = difference;
            }
        }
        return best;
    }

    private static String lyricsOf(JSONObject result) {
        // A missing value is a JSON null, which optString turns into the text "null".
        String lrc = result.isNull("syncedLyrics") ? "" : result.optString("syncedLyrics", "");
        return lrc.length() < MIN_LYRICS_LENGTH ? "" : lrc;
    }

    /**
     * @return The answer, or null if LRCLIB does not have it.
     * @throws BusyException If LRCLIB did not answer.
     */
    private static String request(String address) throws Exception {
        HttpURLConnection connection = (HttpURLConnection) new URL(address).openConnection();
        connection.setConnectTimeout(10_000);
        connection.setReadTimeout(10_000);
        connection.setRequestProperty("User-Agent", "OriginIslandPatches/1.0");
        try {
            int code = connection.getResponseCode();
            if (code == 404) {
                return null;
            }
            if (code != 200) {
                throw new BusyException("code " + code);
            }
            try (InputStream stream = connection.getInputStream()) {
                ByteArrayOutputStream body = new ByteArrayOutputStream();
                stream.transferTo(body);
                return body.toString("UTF-8");
            }
        } finally {
            connection.disconnect();
        }
    }

    private interface Lookup {
        String find() throws Exception;
    }

    private static final class BusyException extends Exception {
        BusyException(String message) {
            super(message);
        }
    }
}
