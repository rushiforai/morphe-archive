/*
 * Ported from ajstrick81's PlutoDashManifestProbe (GPL-3.0):
 * https://github.com/ajstrick81/morphe-androidtv-patches/tree/main/extensions/extension/src/main/java/ajstrick81/morphe/extension/pluto/ads
 * ALL CREDIT FOR THE AD-PERIOD DETECTION, RE-BASING AND RESUME-MAPPING DESIGN
 * GOES TO ajstrick81.
 */

package semicoloncolonel.mobilestream.extension.pluto.ads;

import android.util.Log;

import org.w3c.dom.Attr;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
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
 * Pluto TV phone: removes stitched VOD ad periods from the DASH manifest.
 *
 * The TV patch does this on the parsed media3 DashManifest. In the phone
 * build media3 is obfuscated, so this works one step earlier, on the raw MPD
 * XML that AviaDashParser.parse(Uri, InputStream) is about to hand to the
 * parser. The rules are the TV patch's:
 *
 *   - Content is identified by Pluto's period ids. Every period id is
 *     "<24-hex asset id>-<timestamp>". A content period's asset id is the
 *     title's own, and its URL points at "/clip/<asset id>_<title>". Ads and
 *     bumpers carry their creative's asset id instead. So the content ids are
 *     the ones that appear in their own period's "/clip/<id>_" URL, and every
 *     other period is an ad (mapped on 17.2.0: one ad creative in a pod had
 *     no "_ad/creative" path and slipped past the TV rule).
 *   - If no content id can be found, the TV patch's rule applies: an ad is
 *     detected by the ad-creative URL signature anywhere in its subtree,
 *     "_ad/creative" (or percent-encoded) on spots, "_ad_bumper" on bumpers.
 *   - Kept periods are re-based contiguous (each @start follows the previous
 *     one), and MPD@mediaPresentationDuration is shortened to match.
 *   - Live (dynamic) manifests are passed through untouched.
 *   - Fail-open: any surprise returns the original bytes, so ads remain and
 *     playback never breaks.
 *
 * The removed spans are kept so {@link #mapResumePosition(long)} can move a
 * "Continue Watching" bookmark from the original timeline into the shortened
 * one (TV project issue #147).
 */
@SuppressWarnings("unused")
public final class PlutoMpdFilter {
    private static final String TAG = "MSP-PLUTO-MPD";

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

    private PlutoMpdFilter() {
    }

    /** Called at the top of AviaDashParser.parse(Uri, InputStream). */
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
            return new ByteArrayInputStream(original);
        }
    }

    /** Returns the rewritten manifest, or null to keep the original. */
    private static byte[] strip(byte[] original) throws Exception {
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        factory.setNamespaceAware(true);
        Document document = factory.newDocumentBuilder().parse(new ByteArrayInputStream(original));
        Element mpd = document.getDocumentElement();
        if (mpd == null || !"MPD".equals(localName(mpd))) return null;
        if ("dynamic".equalsIgnoreCase(mpd.getAttribute("type"))) {
            clearResumeOffsets(); // live: nothing to remap
            return null;
        }

        List<Element> periods = new ArrayList<>();
        for (Node n = mpd.getFirstChild(); n != null; n = n.getNextSibling()) {
            if (n instanceof Element && "Period".equals(localName(n))) periods.add((Element) n);
        }
        if (periods.size() < 2) return null;

        long total = parseDurationMs(mpd.getAttribute("mediaPresentationDuration"));
        int count = periods.size();
        long[] starts = new long[count];
        long[] durs = new long[count];
        long cursor = 0;
        for (int i = 0; i < count; i++) {
            long start = parseDurationMs(periods.get(i).getAttribute("start"));
            starts[i] = start >= 0 ? start : cursor;
            cursor = starts[i];
            long dur = parseDurationMs(periods.get(i).getAttribute("duration"));
            if (dur < 0 && i + 1 < count) {
                long next = parseDurationMs(periods.get(i + 1).getAttribute("start"));
                if (next >= 0) dur = next - starts[i];
            }
            if (dur < 0 && i + 1 == count && total >= 0) dur = total - starts[i];
            if (dur < 0) return null; // cannot place this period safely
            durs[i] = dur;
            cursor = starts[i] + dur;
        }

        java.util.Set<String> contentIds = new java.util.HashSet<>();
        for (Element period : periods) {
            String asset = assetId(period);
            if (asset != null && containsText(period, "/clip/" + asset + "_")) contentIds.add(asset);
        }
        String rule = contentIds.isEmpty() ? "url-signature" : "content-id " + contentIds;
        Log.d(TAG, "ad rule: " + rule);

        List<long[]> removed = new ArrayList<>();
        long newCursor = 0;
        int kept = 0;
        for (int i = 0; i < count; i++) {
            Element period = periods.get(i);
            boolean ad = contentIds.isEmpty()
                    ? isAdPeriod(period)
                    : !contentIds.contains(assetId(period)) || isAdPeriod(period);
            Log.d(TAG, String.format(Locale.US, "period %d id=%s start=%dms dur=%dms %s url=%s",
                    i, period.getAttribute("id"), starts[i], durs[i], ad ? "AD" : "keep", firstUrl(period)));
            if (ad) {
                removed.add(new long[] { starts[i], durs[i] });
                mpd.removeChild(period);
            } else {
                period.setAttribute("start", formatDuration(newCursor));
                newCursor += durs[i];
                kept++;
            }
        }
        if (removed.isEmpty()) {
            clearResumeOffsets();
            return null;
        }
        if (kept == 0) return null; // never strip a title down to nothing

        mpd.setAttribute("mediaPresentationDuration", formatDuration(newCursor));

        long[] adStarts = new long[removed.size()];
        long[] adDurs = new long[removed.size()];
        for (int i = 0; i < removed.size(); i++) {
            adStarts[i] = removed.get(i)[0];
            adDurs[i] = removed.get(i)[1];
        }
        removedAdStartsMs = adStarts;
        removedAdDursMs = adDurs;
        strippedDurationMs = newCursor;
        strippedAtMs = android.os.SystemClock.elapsedRealtime();

        Transformer transformer = TransformerFactory.newInstance().newTransformer();
        transformer.setOutputProperty(OutputKeys.ENCODING, "UTF-8");
        ByteArrayOutputStream out = new ByteArrayOutputStream(original.length);
        transformer.transform(new DOMSource(document), new StreamResult(out));
        Log.i(TAG, "removed " + removed.size() + " ad period(s), kept " + kept);
        return out.toByteArray();
    }

    /** First BaseURL text or SegmentTemplate@media in a period, shortened for the log. */
    private static String firstUrl(Node node) {
        if (node instanceof Element) {
            Element e = (Element) node;
            String name = localName(e);
            String value = null;
            if ("BaseURL".equals(name)) value = e.getTextContent();
            else if ("SegmentTemplate".equals(name)) value = e.getAttribute("media");
            if (value != null && !value.isEmpty()) {
                value = value.trim();
                return value.length() > 160 ? value.substring(0, 160) + "…" : value;
            }
        }
        NodeList children = node.getChildNodes();
        for (int i = 0; i < children.getLength(); i++) {
            String found = firstUrl(children.item(i));
            if (found != null) return found;
        }
        return null;
    }

    /** The asset id before the first '-' of a Period@id, or null. */
    private static String assetId(Element period) {
        String id = period.getAttribute("id");
        if (id == null || id.isEmpty()) return null;
        int dash = id.indexOf('-');
        String asset = dash > 0 ? id.substring(0, dash) : id;
        return asset.isEmpty() ? null : asset;
    }

    private static boolean containsText(Node node, String needle) {
        if (node.getNodeType() == Node.TEXT_NODE || node.getNodeType() == Node.CDATA_SECTION_NODE) {
            String v = node.getNodeValue();
            return v != null && v.contains(needle);
        }
        NamedNodeMap attributes = node.getAttributes();
        if (attributes != null) {
            for (int i = 0; i < attributes.getLength(); i++) {
                String v = ((Attr) attributes.item(i)).getValue();
                if (v != null && v.contains(needle)) return true;
            }
        }
        NodeList children = node.getChildNodes();
        for (int i = 0; i < children.getLength(); i++) {
            if (containsText(children.item(i), needle)) return true;
        }
        return false;
    }

    private static boolean isAdPeriod(Element period) {
        return containsAdSignature(period);
    }

    private static boolean containsAdSignature(Node node) {
        if (node.getNodeType() == Node.TEXT_NODE || node.getNodeType() == Node.CDATA_SECTION_NODE) {
            return hasAdSignature(node.getNodeValue());
        }
        NamedNodeMap attributes = node.getAttributes();
        if (attributes != null) {
            for (int i = 0; i < attributes.getLength(); i++) {
                if (hasAdSignature(((Attr) attributes.item(i)).getValue())) return true;
            }
        }
        NodeList children = node.getChildNodes();
        for (int i = 0; i < children.getLength(); i++) {
            if (containsAdSignature(children.item(i))) return true;
        }
        return false;
    }

    private static boolean hasAdSignature(String value) {
        if (value == null) return false;
        return value.contains("_ad/creative")
                || value.contains("_ad%2Fcreative")
                || value.contains("_ad%2fcreative")
                || value.contains("_ad_bumper");
    }

    /**
     * Called with the start position just before AviaPlayer.startExoplayer
     * seeks to it. Moves an original-timeline bookmark into the stripped
     * timeline by subtracting the ad time removed before it. Fail-open.
     */
    public static long mapResumePosition(long originalPos) {
        try {
            long[] starts = removedAdStartsMs;
            long[] durs = removedAdDursMs;
            long age = android.os.SystemClock.elapsedRealtime() - strippedAtMs;
            if (originalPos <= 0 || starts.length == 0) return originalPos;
            if (age > RESUME_MAX_AGE_MS) {
                Log.i(TAG, "resume " + originalPos + "ms left as is: ad timeline is " + age + "ms old");
                return originalPos;
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
            return mapped;
        } catch (Throwable t) {
            return originalPos;
        }
    }

    private static void clearResumeOffsets() {
        removedAdStartsMs = new long[0];
        removedAdDursMs = new long[0];
        strippedDurationMs = 0;
        strippedAtMs = 0;
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
