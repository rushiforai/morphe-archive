package app.ayham.extension.music.addons;

import android.media.MediaCodecInfo;
import android.media.MediaCodecList;
import android.util.Log;

import java.util.Locale;

/**
 * Dolby Atmos from the addons (the "Dolby Atmos" switch): which Atmos codecs this phone decodes.
 * An Atmos row is taken only when a decoder for its codec is listed (the S21 FE: c2.dolby.eac3.decoder
 * for audio/eac3-joc, c2.dolby.ac4.decoder for audio/ac4). Samsung's decoder hands out its Atmos
 * render as 2-channel 48 kHz PCM, so the fit, the gain and the mix decks read it like any file.
 */
public final class Atmos {
    private static final String TAG = AddonPrep.TAG;
    public static final String EAC3_JOC = "audio/eac3-joc", AC4 = "audio/ac4";
    private static volatile Boolean eac3, ac4;

    private Atmos() {
    }

    /** The decoder MIME an addon's codec text stands for: eac3_joc, ec-3, eac3 → E-AC-3 JOC; ac4 → AC-4; else null. */
    public static String mimeOf(String codec) {
        if (codec == null) return null;
        String c = codec.toLowerCase(Locale.ROOT).replace('_', '-');
        if (c.contains("ac-4") || c.contains("ac4")) return AC4;
        if (c.contains("eac3") || c.contains("ec-3") || c.contains("e-ac-3") || c.contains("joc") || c.contains("ec3")) return EAC3_JOC;
        return null;
    }

    /** This phone decodes the Atmos codec named (unknown text: any Atmos decoder will do; the fit tells). */
    public static boolean decodes(String codec) {
        String m = mimeOf(codec);
        if (AC4.equals(m)) return has(AC4);
        if (EAC3_JOC.equals(m)) return has(EAC3_JOC);
        return has(EAC3_JOC) || has(AC4);
    }

    /** Any Atmos decoder: the switch does something on this phone. */
    public static boolean available() {
        return has(EAC3_JOC) || has(AC4);
    }

    private static boolean has(String mime) {
        Boolean b = EAC3_JOC.equals(mime) ? eac3 : ac4;
        if (b != null) return b;
        boolean found = false;
        String name = null;
        try {
            for (MediaCodecInfo i : new MediaCodecList(MediaCodecList.REGULAR_CODECS).getCodecInfos()) {
                if (i.isEncoder()) continue;
                for (String t : i.getSupportedTypes()) {
                    if (t.equalsIgnoreCase(mime)) {
                        found = true;
                        name = i.getName();
                        break;
                    }
                }
                if (found) break;
            }
        } catch (Throwable t) {
            Log.w(TAG, "codec list unreadable", t);
        }
        Log.i(TAG, "Dolby Atmos: " + mime + (found ? " decoded by " + name : ": no decoder"));
        if (EAC3_JOC.equals(mime)) eac3 = found;
        else ac4 = found;
        return found;
    }

    /** The renderer's input is Atmos (the badge): E-AC-3 JOC or AC-4. */
    public static boolean isAtmosMime(String sampleMime) {
        if (sampleMime == null) return false;
        String m = sampleMime.toLowerCase(Locale.ROOT);
        return m.equals(EAC3_JOC) || m.equals(AC4);
    }
}
