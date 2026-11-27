package app.ayham.extension.music.features;

import android.util.Log;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

/**
 * Fetches a song's audio file for the automix analysis: the streams come from Morphe's
 * StreamingDataRequest (the same clients the downloads use), the best audio format is read from
 * the player response, and the file is fetched in 1 MB ranges.
 */
public final class AudioStream {
    private static final String TAG = "AudioStream";
    private static final long RANGE = 1 << 20;
    private static final String USER_AGENT = "com.google.android.youtube/19.47.53 (Linux; U; Android 14) gzip";
    static final String[] CLIENTS = {
            "VISIONOS_1_03", "VISIONOS_1_02", "ANDROID_VR_DASH", "TV_DASH", "ANDROID_CREATOR", "TV_SIMPLY"
    };

    private AudioStream() {
    }

    /** The audio format picked from a player response. */
    static final class Pick {
        final int itag;
        final String url, mime;
        final long length;
        double loudnessDb = Double.NaN;
        /** Its average bitrate in kbps (field 6 is bits per second). */
        double kbps = Double.NaN;

        Pick(int itag, String url, String mime, long length) {
            this.itag = itag;
            this.url = url;
            this.mime = mime;
            this.length = length;
        }
    }

    /** The player response of a song from Morphe's download clients, or null. */
    static byte[] playerResponse(String videoId) throws Exception {
        Class<?> clientType = Class.forName("app.morphe.extension.shared.spoof.ClientType");
        List<Object> clients = new ArrayList<>();
        for (String name : CLIENTS) {
            for (Object c : clientType.getEnumConstants()) {
                if (((Enum<?>) c).name().equals(name)) clients.add(c);
            }
        }
        if (clients.isEmpty()) throw new IOException("no download clients");
        Class<?> request = Class.forName("app.morphe.extension.shared.spoof.requests.StreamingDataRequest");
        Object req = request.getMethod("fetchRequestForDownload", String.class, List.class, clientType)
                .invoke(null, videoId, clients, clients.get(0));
        Object stream = request.getMethod("getStream").invoke(req);
        if (stream == null) return null;
        return (byte[]) stream.getClass().getMethod("streamingData").invoke(stream);
    }

    /**
     * YouTube's loudnessDb for the song (its audio format's field 47, a float: Poker Face 6.69; field
     * 53 is the perceptual one, 14 dB under it), as YouTube's player normalises with it: a cut of
     * that many dB when it is positive (offset-map.md, Level). Kept beside YouTube's copy when it
     * is fetched; asked for when that copy came from an earlier run. NaN when not known.
     */
    public static double loudnessDb(android.content.Context c, String videoId) {
        return known(c, videoId)[0];
    }

    /** YouTube's audio bitrate for the song (kbps, its best audio format, as kept with loudnessDb); 0 when not known. */
    public static double kbps(android.content.Context c, String videoId) {
        double k = known(c, videoId)[1];
        return Double.isNaN(k) ? 0 : k;
    }

    /** {loudnessDb, kbps} kept beside YouTube's copy, or asked for; NaN when not known. */
    private static double[] known(android.content.Context c, String videoId) {
        double[] out = {Double.NaN, Double.NaN};
        if (!plainId(videoId)) return out;
        File f = new File(c.getCacheDir(), "automix/loudness/" + videoId);
        try {
            if (f.exists()) {
                String[] t = new String(java.nio.file.Files.readAllBytes(f.toPath()), java.nio.charset.StandardCharsets.UTF_8).trim().split(" ");
                out[0] = Double.parseDouble(t[0]);
                if (t.length > 1) out[1] = Double.parseDouble(t[1]);
                if (t.length > 1) return out;
            }
            byte[] r = playerResponse(videoId);
            Pick p = r == null ? null : best(r);
            if (p == null) return out;
            saveLoudness(new File(c.getCacheDir(), "automix/dl"), videoId, p);
            out[0] = p.loudnessDb;
            out[1] = p.kbps;
        } catch (Throwable t) {
            Log.w(TAG, videoId + ": loudnessDb not read: " + t);
        }
        return out;
    }

    private static void saveLoudness(File dlDir, String videoId, Pick p) {
        double db = p.loudnessDb;
        if (Double.isNaN(db)) return;
        File d = new File(dlDir.getParentFile(), "loudness");
        //noinspection ResultOfMethodCallIgnored
        d.mkdirs();
        try (FileOutputStream os = new FileOutputStream(new File(d, videoId))) {
            os.write((db + " " + p.kbps).getBytes(java.nio.charset.StandardCharsets.UTF_8));
        } catch (IOException e) {
            Log.w(TAG, videoId + ": loudnessDb not kept: " + e);
        }
    }

    private static double floatField(ProtoWire w, int number) {
        ProtoWire.Field f = w.first(number);
        if (f == null || f.wireType != 5 || f.data == null || f.data.length != 4) return Double.NaN;
        return java.nio.ByteBuffer.wrap(f.data).order(java.nio.ByteOrder.LITTLE_ENDIAN).getFloat();
    }

    /** The audio format with the highest bitrate that has a plain url and a length, or null. */
    static Pick best(byte[] playerResponse) {
        Pick best = null;
        long bestRate = -1;
        for (ProtoWire.Field f : new ProtoWire(playerResponse).message(4).all(3)) {
            ProtoWire format = new ProtoWire(f.data);
            String mime = format.string(5);
            String url = format.string(2);
            long length = format.varint(12, 0);
            if (!mime.startsWith("audio/") || url.isEmpty() || length <= 0) continue;
            long rate = format.varint(6, 0);
            if (rate > bestRate) {
                bestRate = rate;
                best = new Pick((int) format.varint(1, 0), url, mime, length);
                best.loudnessDb = floatField(format, 47);
                best.kbps = rate / 1000.0;
            }
        }
        return best;
    }

    /** YouTube's ids are letters, digits, - and _: anything else is not put in a file path. */
    private static boolean plainId(String videoId) {
        return videoId != null && videoId.matches("[A-Za-z0-9_-]+");
    }

    /** Fetches the song's best audio into {@code dir}; throws when no stream is found or a range fails. */
    public static File download(File dir, String videoId) throws Exception {
        if (!plainId(videoId)) throw new IOException("not a video id: " + videoId);
        byte[] response = playerResponse(videoId);
        if (response == null) throw new IOException("no stream for " + videoId);
        Pick pick = best(response);
        if (pick == null) throw new IOException("no audio format for " + videoId);
        Log.i(TAG, videoId + ": itag=" + pick.itag + " " + pick.mime + " length=" + pick.length);
        saveLoudness(dir, videoId, pick);
        //noinspection ResultOfMethodCallIgnored
        dir.mkdirs();
        File out = new File(dir, videoId + (pick.mime.contains("mp4") ? ".m4a" : ".webm"));
        byte[] buffer = new byte[64 * 1024];
        try (FileOutputStream os = new FileOutputStream(out)) {
            String url = pick.url;
            for (long start = 0; start < pick.length; start += RANGE) {
                long end = Math.min(pick.length, start + RANGE) - 1;
                HttpURLConnection conn = null;
                int code = -1;
                // googlevideo sometimes answers 302 to another server; the connection in YT's process
                // doesn't follow it (phone, 2026-11-18: every analysis of a song failed on it). Followed
                // here, and the new address kept for the remaining ranges.
                for (int hop = 0; hop <= 5; hop++) {
                    conn = (HttpURLConnection) new URL(url).openConnection();
                    conn.setInstanceFollowRedirects(false);
                    conn.setConnectTimeout(15_000);
                    conn.setReadTimeout(30_000);
                    conn.setRequestProperty("User-Agent", USER_AGENT);
                    conn.setRequestProperty("Referer", "https://music.youtube.com/");
                    conn.setRequestProperty("Range", "bytes=" + start + "-" + end);
                    try {
                        code = conn.getResponseCode();
                    } catch (IOException e) {
                        conn.disconnect();
                        throw e;
                    }
                    String to = code / 100 == 3 ? conn.getHeaderField("Location") : null;
                    if (to == null || hop == 5) break;
                    conn.disconnect();
                    url = new URL(new URL(url), to).toString();
                    // the host only: the address carries the stream's signature
                    Log.i(TAG, videoId + ": HTTP " + code + " at byte " + start + ", followed to " + new URL(url).getHost());
                }
                try {
                    // a 200 is the whole file: the same bytes only when this one range is all of it
                    boolean whole = code == HttpURLConnection.HTTP_OK && start == 0 && pick.length <= RANGE;
                    if (code != HttpURLConnection.HTTP_PARTIAL && !whole) {
                        throw new IOException("range " + start + "-" + end + ": HTTP " + code);
                    }
                    try (InputStream in = conn.getInputStream()) {
                        int n;
                        while ((n = in.read(buffer)) > 0) os.write(buffer, 0, n);
                    }
                } finally {
                    conn.disconnect();
                }
            }
        } catch (Exception e) {
            //noinspection ResultOfMethodCallIgnored
            out.delete();
            throw e;
        }
        return out;
    }
}
