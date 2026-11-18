/*
 * From ajstrick81's HBO Max Android TV patch (GPL-3.0):
 * https://github.com/ajstrick81/morphe-androidtv-patches/tree/main/extensions/extension/src/main/java/ajstrick81/morphe/extension/hbomax/ads
 * ALL CREDIT FOR THIS FILTER GOES TO ajstrick81. Only the package name and
 * the log tag have changed.
 */

package semicoloncolonel.mobilestream.extension.hbomax.ads;

import android.net.Uri;
import android.util.Log;

import java.io.IOException;
import java.lang.reflect.Field;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

/**
 * Fails media3 data-source opens for HBO's server-side ad origins, the way a
 * DNS ad blocker would. HBO's player then falls back to its clean stream, so
 * the stitched ad video does not play.
 *
 * The request URL is read from the DataSpec by field type (its one public
 * android.net.Uri field), so media3's renaming does not matter.
 */
@SuppressWarnings("unused")
public final class HboAdOriginFilter {
    private static final String TAG = "MSP-HBO-ADS";

    private static final String[] BLOCKED_HOST_SUBSTRINGS = {
        "-free.prd.media.max.com", // amer-free / emea-free / any <region>-free SSAI segment origin
        "gmss.",                   // gmss.*.prd.api.discomax.com: SSAI ad-break timeline
        "fwmrm.net",               // FreeWheel: ad decision server
        "dnitv.com",               // DNI TV ad host
    };

    private static final Set<String> logged = Collections.synchronizedSet(new HashSet<>());
    private static volatile Field cachedUriField;

    private HboAdOriginFilter() {
    }

    /** Called at the top of every media3 data source's open(DataSpec). */
    public static void guard(Object dataSpec) throws IOException {
        if (dataSpec == null) return;
        Uri uri = extractUri(dataSpec);
        if (uri == null) return;
        String host = uri.getHost();
        if (host == null) return;
        String lower = host.toLowerCase();
        for (String needle : BLOCKED_HOST_SUBSTRINGS) {
            if (lower.contains(needle)) {
                if (logged.add(lower)) Log.i(TAG, "blocked ad origin " + lower);
                throw new IOException("HBO Max ad origin blocked: " + host);
            }
        }
    }

    private static Uri extractUri(Object dataSpec) {
        Field field = cachedUriField;
        if (field != null && field.getDeclaringClass().isInstance(dataSpec)) {
            try {
                return (Uri) field.get(dataSpec);
            } catch (Exception ignored) {
            }
        }
        for (Field candidate : dataSpec.getClass().getFields()) {
            if (Uri.class.isAssignableFrom(candidate.getType())) {
                try {
                    candidate.setAccessible(true);
                    Uri value = (Uri) candidate.get(dataSpec);
                    cachedUriField = candidate;
                    return value;
                } catch (Exception ignored) {
                }
            }
        }
        return null;
    }
}
