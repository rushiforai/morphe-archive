package app.bitchord.telegram;

import android.media.MediaCodecInfo;
import android.media.MediaCodecList;

import org.json.JSONObject;

import java.util.List;
import java.util.Locale;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Which Dolby files this phone can play. BitChord adds its own FFmpeg decoder after the phone's,
 * which plays Dolby Digital, Dolby Digital Plus (Dolby Atmos as its 5.1 or 7.1 bed) and Dolby
 * TrueHD on any phone. Dolby AC-4 needs a decoder in the phone itself.
 */
final class DolbySupport {
    private DolbySupport() {}

    private static final ConcurrentHashMap<String, Boolean> decoders = new ConcurrentHashMap<>();

    /** The Dolby format of a row, from its header when read, else its type; "" when not Dolby. */
    static String codec(JSONObject row, JSONObject header) {
        String codec = header == null ? "" : header.optString("codec");
        if (DolbyHeader.dolby(codec)) return codec;
        String format = row.optString("format").toLowerCase(Locale.ROOT);
        String mime = row.optString("mime").toLowerCase(Locale.ROOT);
        if (format.equals("ac4") || mime.equals("audio/ac4")) return "ac4";
        return "";
    }

    static boolean playable(String codec) {
        if (!codec.equals("ac4")) return true;
        return decoders.computeIfAbsent("audio/ac4", DolbySupport::hasDecoder);
    }

    /** The rows without Dolby files this phone can't play. */
    static List<JSONObject> playable(
            List<JSONObject> rows, java.util.function.Function<String, JSONObject> headers) {
        List<JSONObject> kept = new java.util.ArrayList<>();
        for (JSONObject row : rows)
            if (playable(codec(row, headers.apply(row.optString("id"))))) kept.add(row);
        return kept;
    }

    /**
     * Whether BitChord takes a stream marked as Dolby Atmos: it refuses one when the phone has no
     * Dolby Atmos decoder, or when Dolby Atmos is off in its settings. A file that isn't marked
     * plays through BitChord's own decoder as Dolby Digital Plus, in 5.1 or 7.1.
     */
    static boolean atmosAccepted() {
        try {
            Object plays =
                    Class.forName("com.music.bitchord.data.sources.DeviceCodecs")
                            .getMethod("getPlaysDolbyAtmos")
                            .invoke(null);
            if (!Boolean.TRUE.equals(plays)) return false;
            java.lang.reflect.Field field =
                    Class.forName("com.music.bitchord.data.settings.AppSettings")
                            .getDeclaredField("dolbyAtmos");
            field.setAccessible(true);
            Object flow = field.get(null);
            Object on = flow.getClass().getMethod("getValue").invoke(flow);
            return Boolean.TRUE.equals(on);
        } catch (Throwable e) {
            return false;
        }
    }

    private static boolean hasDecoder(String mime) {
        try {
            for (MediaCodecInfo info :
                    new MediaCodecList(MediaCodecList.ALL_CODECS).getCodecInfos())
                if (!info.isEncoder())
                    for (String type : info.getSupportedTypes())
                        if (type.equalsIgnoreCase(mime)) return true;
        } catch (RuntimeException e) {
            // Unknown: don't hide anything.
            return true;
        }
        return false;
    }
}
