package app.morphed.extension.twitch.musicfilter;

import java.io.IOException;
import java.util.Locale;
import java.util.TimeZone;
import java.util.UUID;

import app.morphed.extension.twitch.net.JsonParser;
import app.morphed.extension.twitch.net.Web;

/** Asks Shazam what song a few seconds of sound are (the request shazamio sends, from Shazam's iPhone app). */
public final class ShazamClient implements Tracker.Recognizer {
    static final int TIMEOUT_MS = 10_000; // one try at asking Shazam, at most this long
    private static final String URL = "https://amp.shazam.com/discovery/v5/en/GB/iphone/-/tag/%s/%s"
            + "?sync=true&webv3=true&sampling=true&connected=&shazamapiversion=v3&sharehub=true"
            + "&hubv5minorversion=v5.1&hidelb=true&video=v3";
    private static final String USER_AGENT = "Dalvik/2.1.0 (Linux; U; Android 5.0.2; VS980 4G Build/LRX22G)";
    private static final int DOWN = Canceller.RATE / ShazamSignature.RATE; // 48 kHz to 16 kHz
    private static final float[] KERNEL = lowpass();

    private final Web web;

    public ShazamClient(Web web) {
        this.web = web;
    }

    private static float[] lowpass() {
        int taps = 63;
        double[] kernel = new double[taps];
        double sum = 0;
        for (int i = 0; i < taps; i++) {
            double x = (i - (taps - 1) / 2.0) / DOWN;
            double sinc = x == 0 ? 1 : Math.sin(Math.PI * x) / (Math.PI * x);
            kernel[i] = sinc * (0.54 - 0.46 * Math.cos(2 * Math.PI * i / (taps - 1)));
            sum += kernel[i];
        }
        float[] out = new float[taps];
        for (int i = 0; i < taps; i++) out[i] = (float) (kernel[i] / sum);
        return out;
    }

    /** 48 kHz mono floats to 16 kHz 16-bit, low-passed so higher sounds don't fold down. */
    static short[] to16k(float[] sound) {
        int half = KERNEL.length / 2;
        short[] out = new short[sound.length / DOWN];
        for (int o = 0; o < out.length; o++) {
            double sum = 0;
            int center = o * DOWN;
            for (int t = 0; t < KERNEL.length; t++) {
                int i = center + t - half;
                if (i >= 0 && i < sound.length) sum += sound[i] * KERNEL[t];
            }
            out[o] = (short) Math.round(Math.max(-1, Math.min(1, sum)) * 32767);
        }
        return out;
    }

    @Override
    public Song recognize(float[] sound) throws SongProblem {
        short[] samples = to16k(sound);
        String uri = ShazamSignature.uri(samples);
        long now = System.currentTimeMillis();
        long sampleMs = samples.length * 1000L / ShazamSignature.RATE;
        String body = "{\"timezone\":" + JsonParser.quote(TimeZone.getDefault().getID())
                + ",\"signature\":{\"uri\":" + JsonParser.quote(uri) + ",\"samplems\":" + sampleMs + "}"
                + ",\"timestamp\":" + now + ",\"context\":{},\"geolocation\":{}}";
        String url = String.format(URL, UUID.randomUUID().toString().toUpperCase(Locale.ROOT),
                UUID.randomUUID().toString().toUpperCase(Locale.ROOT));
        Web.Response response;
        try {
            response = web.send(Web.Request.post(url, body, "application/json")
                    .header("X-Shazam-Platform", "IPHONE")
                    .header("X-Shazam-AppVersion", "14.1.0")
                    .header("Accept", "*/*")
                    .header("Accept-Language", "en")
                    .header("User-Agent", USER_AGENT)
                    .timeout(TIMEOUT_MS));
        } catch (IOException error) {
            throw new SongProblem("Shazam couldn't be asked what's playing: " + Reasons.of(error), error);
        }
        if (response.status == 429) throw new SongProblem.RateLimited("Shazam is getting too many requests from this connection");
        if (!response.ok()) {
            throw new SongProblem("Shazam couldn't be asked what's playing: " + Reasons.status(response.status));
        }
        try {
            return songOf(JsonParser.parse(response.text()));
        } catch (IllegalArgumentException error) {
            throw new SongProblem("Shazam couldn't be asked what's playing: its answer couldn't be read", error);
        }
    }

    /** The song in Shazam's answer, or null when it didn't know. */
    static Song songOf(Object answer) {
        String key = JsonParser.string(answer, "track", "key");
        String title = JsonParser.string(answer, "track", "title");
        if (key == null || key.isEmpty() || title == null || title.isEmpty()) return null;
        String artist = JsonParser.string(answer, "track", "subtitle");
        Object offset = JsonParser.at(answer, "matches", 0, "offset");
        double at = offset instanceof Double && (Double) offset >= 0 ? (Double) offset : Double.NaN;
        return new Song(key, title, artist == null ? "" : artist, at);
    }
}
