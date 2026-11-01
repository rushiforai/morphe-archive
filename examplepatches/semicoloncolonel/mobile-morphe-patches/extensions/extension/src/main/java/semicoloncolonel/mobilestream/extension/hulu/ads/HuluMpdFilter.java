/*
 * The period removal, re-basing and resume mapping follow ajstrick81's
 * PlutoDashManifestProbe (GPL-3.0), as ported in PlutoMpdFilter:
 * https://github.com/ajstrick81/morphe-androidtv-patches/tree/main/extensions/extension/src/main/java/ajstrick81/morphe/extension/pluto/ads
 * ALL CREDIT FOR THAT DESIGN GOES TO ajstrick81.
 */

package semicoloncolonel.mobilestream.extension.hulu.ads;

import android.os.SystemClock;
import android.util.Log;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

/**
 * Hulu phone: removes stitched ad and bumper periods from the DASH manifest.
 *
 * Hulu 6.34.0 plays through its own player (com.hulu.physicalplayer), and
 * its ads are periods of the VOD manifest. {@link #filter} is called with the
 * raw MPD at the top of DashManifestParser.parse(String, InputStream), before
 * the player sees it. A period is an ad by Hulu's own rules
 * (PeriodTypeHandlerImpl), checked in the same order:
 *
 *   1. a descriptor with schemeIdUri "urn:com:hulu:content:manifest:period-type:2018"
 *      whose value is "ad" or "bumper" (any other value keeps the period);
 *   2. an AssetIdentifier whose schemeIdUri is "urn:com:hulu:content:ad-id:2018"
 *      or "urn:com:hulu:content:bumper-id:2018" ("...asset-id:2018" is content);
 *   3. a Period@id that starts with "ad-" ("content-" is content).
 *
 * Kept periods are re-based contiguous and MPD@mediaPresentationDuration is
 * shortened to match. Hulu converts between content time and manifest time
 * through its ad pods, which are built from these periods, so with no ad
 * periods both times agree and a content-time resume needs no change. A
 * stream-time resume does: {@link #mapStreamSeconds} moves it into the
 * shortened timeline.
 *
 * Live (dynamic) manifests are passed through. Any surprise returns the
 * original bytes, so ads remain and playback never breaks.
 */
@SuppressWarnings("unused")
public final class HuluMpdFilter {
    private static final String TAG = "MSP-HULU-MPD";

    private static final String PERIOD_TYPE_SCHEME = "urn:com:hulu:content:manifest:period-type:2018";
    private static final String AD_ID_SCHEME = "urn:com:hulu:content:ad-id:2018";
    private static final String BUMPER_ID_SCHEME = "urn:com:hulu:content:bumper-id:2018";
    private static final String ASSET_ID_SCHEME = "urn:com:hulu:content:asset-id:2018";

    private static final Pattern DURATION = Pattern.compile(
            "^P(?:(\\d+(?:\\.\\d+)?)D)?(?:T(?:(\\d+(?:\\.\\d+)?)H)?(?:(\\d+(?:\\.\\d+)?)M)?(?:(\\d+(?:\\.\\d+)?)S)?)?$");

    private static final long RESUME_END_MARGIN_MS = 5_000L;
    // The remap only trusts a timeline recorded this recently, so a resume can
    // never be shifted by a previous title's ads.
    private static final long RESUME_MAX_AGE_MS = 20_000L;

    private static volatile long[] removedAdStartsMs = new long[0];
    private static volatile long[] removedAdDursMs = new long[0];
    private static volatile long strippedDurationMs = 0;
    private static volatile long strippedAtMs = 0;
    private static volatile boolean lastManifestStripped;

    private HuluMpdFilter() {
    }

    /** Called at the top of DashManifestParser.parse(String, InputStream). */
    public static InputStream filter(InputStream in) {
        if (in == null) return null;
        byte[] original;
        try {
            original = readAll(in);
        } catch (IOException e) {
            // The stream is consumed and unusable; let the parser fail as it
            // would have on the same read error.
            return new ByteArrayInputStream(new byte[0]);
        }
        try {
            byte[] stripped = strip(original);
            return new ByteArrayInputStream(stripped != null ? stripped : original);
        } catch (Throwable t) {
            Log.w(TAG, "manifest left unchanged", t);
            clearRemoved();
            return new ByteArrayInputStream(original);
        }
    }

    /**
     * Called with the playlist's ad metadata, one entry per ad period. Once
     * this title's ad periods are gone it reports none, so Hulu's check that
     * the manifest and the playlist list the same ads still passes.
     */
    public static List<?> adMetadata(List<?> list) {
        return lastManifestStripped && list != null && !list.isEmpty() ? Collections.emptyList() : list;
    }

    /** Returns the rewritten manifest, or null to keep the original. */
    private static byte[] strip(byte[] original) throws Exception {
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        factory.setNamespaceAware(true);
        Document document = factory.newDocumentBuilder().parse(new ByteArrayInputStream(original));
        Element mpd = document.getDocumentElement();
        if (mpd == null || !"MPD".equals(localName(mpd))) return null;
        if ("dynamic".equalsIgnoreCase(mpd.getAttribute("type"))) {
            clearRemoved(); // live: ads are part of the broadcast
            return null;
        }

        List<Element> periods = new ArrayList<>();
        for (Node n = mpd.getFirstChild(); n != null; n = n.getNextSibling()) {
            if (n instanceof Element && "Period".equals(localName(n))) periods.add((Element) n);
        }
        if (periods.size() < 2) {
            clearRemoved();
            return null;
        }

        long total = parseDurationMs(mpd.getAttribute("mediaPresentationDuration"));
        int count = periods.size();
        long[] starts = new long[count];
        long[] durs = new long[count];
        long cursor = 0;
        for (int i = 0; i < count; i++) {
            long start = parseDurationMs(periods.get(i).getAttribute("start"));
            starts[i] = start >= 0 ? start : cursor;
            long dur = parseDurationMs(periods.get(i).getAttribute("duration"));
            if (dur < 0 && i + 1 < count) {
                long next = parseDurationMs(periods.get(i + 1).getAttribute("start"));
                if (next >= 0) dur = next - starts[i];
            }
            if (dur < 0 && i + 1 == count && total >= 0) dur = total - starts[i];
            if (dur < 0) { // cannot place this period safely
                clearRemoved();
                return null;
            }
            durs[i] = dur;
            cursor = starts[i] + dur;
        }

        List<long[]> removed = new ArrayList<>();
        long newCursor = 0;
        int kept = 0;
        for (int i = 0; i < count; i++) {
            Element period = periods.get(i);
            String type = periodType(period);
            boolean ad = "ad".equals(type) || "bumper".equals(type);
            Log.d(TAG, String.format(Locale.US, "period %d id=%s start=%dms dur=%dms type=%s %s",
                    i, period.getAttribute("id"), starts[i], durs[i], type, ad ? "REMOVE" : "keep"));
            if (ad) {
                removed.add(new long[]{starts[i], durs[i]});
                mpd.removeChild(period);
            } else {
                period.setAttribute("start", formatDuration(newCursor));
                newCursor += durs[i];
                kept++;
            }
        }
        if (removed.isEmpty() || kept == 0) { // never strip a title down to nothing
            clearRemoved();
            return null;
        }

        mpd.setAttribute("mediaPresentationDuration", formatDuration(newCursor));

        long[] adStarts = new long[removed.size()];
        long[] adDurs = new long[removed.size()];
        for (int i = 0; i < removed.size(); i++) {
            adStarts[i] = removed.get(i)[0];
            adDurs[i] = removed.get(i)[1];
        }

        Transformer transformer = TransformerFactory.newInstance().newTransformer();
        transformer.setOutputProperty(OutputKeys.ENCODING, "UTF-8");
        ByteArrayOutputStream out = new ByteArrayOutputStream(original.length);
        transformer.transform(new DOMSource(document), new StreamResult(out));

        removedAdStartsMs = adStarts;
        removedAdDursMs = adDurs;
        strippedDurationMs = newCursor;
        strippedAtMs = SystemClock.elapsedRealtime();
        lastManifestStripped = true;
        Log.i(TAG, "removed " + removed.size() + " ad/bumper period(s), kept " + kept);
        return out.toByteArray();
    }

    /** "ad", "bumper", "content" or null, by Hulu's rules in Hulu's order. */
    private static String periodType(Element period) {
        String descriptorType = null;
        String assetType = null;
        for (Node n = period.getFirstChild(); n != null; n = n.getNextSibling()) {
            if (!(n instanceof Element)) continue;
            Element child = (Element) n;
            String scheme = child.getAttribute("schemeIdUri");
            if (descriptorType == null && PERIOD_TYPE_SCHEME.equals(scheme)) {
                String value = child.getAttribute("value");
                descriptorType = "ad".equals(value) || "bumper".equals(value) || "content".equals(value)
                        ? value : "unknown";
            } else if (assetType == null && "AssetIdentifier".equals(localName(child))) {
                if (AD_ID_SCHEME.equals(scheme)) assetType = "ad";
                else if (BUMPER_ID_SCHEME.equals(scheme)) assetType = "bumper";
                else if (ASSET_ID_SCHEME.equals(scheme)) assetType = "content";
            }
        }
        if (descriptorType != null) return descriptorType;
        if (assetType != null) return assetType;
        String id = period.getAttribute("id").toLowerCase(Locale.US);
        if (id.startsWith("ad-")) return "ad";
        if (id.startsWith("content-")) return "content";
        return null;
    }

    /**
     * Called with a stream-time resume position (seconds) just before the VOD
     * player seeks to it. Moves it from the original timeline into the
     * stripped one by subtracting the ad time removed before it. Fail-open.
     */
    public static double mapStreamSeconds(double originalSeconds) {
        try {
            long[] starts = removedAdStartsMs;
            long[] durs = removedAdDursMs;
            long originalPos = Math.round(originalSeconds * 1000);
            long age = SystemClock.elapsedRealtime() - strippedAtMs;
            if (originalPos <= 0 || starts.length == 0) return originalSeconds;
            if (age > RESUME_MAX_AGE_MS) {
                Log.i(TAG, "resume " + originalPos + "ms left as is: ad timeline is " + age + "ms old");
                return originalSeconds;
            }
            long shift = 0;
            for (int i = 0; i < starts.length; i++) {
                if (starts[i] >= originalPos) break;
                // A bookmark inside an ad lands at the content right after it.
                shift += Math.min(durs[i], originalPos - starts[i]);
            }
            long mapped = originalPos - shift;
            long limit = strippedDurationMs - RESUME_END_MARGIN_MS;
            if (limit > 0 && mapped > limit) mapped = limit;
            mapped = Math.max(0, mapped);
            Log.i(TAG, "resume " + originalPos + "ms -> " + mapped + "ms (ad timeline " + age + "ms old)");
            return mapped / 1000.0;
        } catch (Throwable t) {
            return originalSeconds;
        }
    }

    private static void clearRemoved() {
        removedAdStartsMs = new long[0];
        removedAdDursMs = new long[0];
        strippedDurationMs = 0;
        strippedAtMs = 0;
        lastManifestStripped = false;
    }

    private static String localName(Node node) {
        String name = node.getLocalName();
        return name != null ? name : node.getNodeName();
    }

    /** xs:duration (PnDTnHnMnS) to milliseconds, or -1 if absent or unparseable. */
    static long parseDurationMs(String value) {
        if (value == null || value.isEmpty()) return -1;
        Matcher m = DURATION.matcher(value.trim());
        if (!m.matches()) return -1;
        double seconds = 0;
        if (m.group(1) != null) seconds += Double.parseDouble(m.group(1)) * 86_400;
        if (m.group(2) != null) seconds += Double.parseDouble(m.group(2)) * 3_600;
        if (m.group(3) != null) seconds += Double.parseDouble(m.group(3)) * 60;
        if (m.group(4) != null) seconds += Double.parseDouble(m.group(4));
        return Math.round(seconds * 1000);
    }

    static String formatDuration(long ms) {
        return String.format(Locale.US, "PT%d.%03dS", ms / 1000, ms % 1000);
    }

    private static byte[] readAll(InputStream in) throws IOException {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        byte[] buffer = new byte[16 * 1024];
        int n;
        while ((n = in.read(buffer)) != -1) out.write(buffer, 0, n);
        return out.toByteArray();
    }
}
