package dev.materialtidal.extension.tidal.linn;

import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserFactory;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/**
 * Resolves TIDAL track IDs to direct audio URLs (BTS single-file FLAC/MP4) or parsed MPEG-DASH
 * FLAC segment lists via TIDAL's OAuth credentials.
 */
public final class LinnTidalStreamResolver {

    public static final class ResolvedStream {
        public final String trackId;
        public final boolean isDash;
        public final String directUrl;
        public final String mimeType;
        public final String codec;
        public final int bitDepth;
        public final int sampleRate;
        public final String audioQuality;
        public final String dashInitUrl;
        public final List<String> dashSegmentUrls;
        public final List<Double> dashSegmentDurationsSec;
        public final double totalDurationSec;
        public final long resolvedAtMs;

        public ResolvedStream(
                String trackId,
                boolean isDash,
                String directUrl,
                String mimeType,
                String codec,
                int bitDepth,
                int sampleRate,
                String audioQuality,
                String dashInitUrl,
                List<String> dashSegmentUrls,
                List<Double> dashSegmentDurationsSec,
                double totalDurationSec
        ) {
            this.trackId = trackId;
            this.isDash = isDash;
            this.directUrl = directUrl;
            this.mimeType = mimeType;
            this.codec = codec;
            this.bitDepth = bitDepth;
            this.sampleRate = sampleRate;
            this.audioQuality = audioQuality;
            this.dashInitUrl = dashInitUrl;
            this.dashSegmentUrls = dashSegmentUrls != null ? dashSegmentUrls : Collections.emptyList();
            this.dashSegmentDurationsSec = dashSegmentDurationsSec != null ? dashSegmentDurationsSec : Collections.emptyList();
            this.totalDurationSec = totalDurationSec;
            this.resolvedAtMs = System.currentTimeMillis();
        }

        public boolean isExpired() {
            return System.currentTimeMillis() - resolvedAtMs > 5 * 60 * 1000L;
        }
    }

    private static final String TAG = "MaterialTidalLinn";
    private static final int CACHE_MAX = 16;
    private static final Map<String, ResolvedStream> CACHE = new LinkedHashMap<>(CACHE_MAX, 0.75f, true);

    private LinnTidalStreamResolver() {
    }

    public static ResolvedStream resolve(String trackId) throws IOException {
        if (trackId == null || trackId.trim().isEmpty()) {
            throw new IOException("Missing trackId");
        }
        String key = trackId.trim() + ":" + LinnConfig.getAudioQualityMode();
        synchronized (CACHE) {
            ResolvedStream cached = CACHE.get(key);
            if (cached != null && !cached.isExpired()) {
                return cached;
            }
        }

        String[] auth = LinnTidalBridge.nativeGetAuthTokens();
        String accessToken = auth != null && auth.length > 0 ? auth[0] : null;
        String clientToken = auth != null && auth.length > 1 ? auth[1] : null;
        String countryCode = null;
        try {
            countryCode = LinnTidalBridge.nativeGetCountryCode();
        } catch (Throwable ignored) {
        }
        if (countryCode == null || countryCode.isEmpty()) {
            countryCode = Locale.getDefault().getCountry();
        }
        if (countryCode == null || countryCode.isEmpty()) {
            countryCode = "US";
        }
        if (accessToken == null || accessToken.isEmpty()) {
            throw new IOException("No TIDAL OAuth access token available");
        }

        ResolvedStream resolved = tryResolveV1(trackId.trim(), accessToken, clientToken, countryCode);
        if (resolved == null) {
            resolved = tryResolveV2(trackId.trim(), accessToken);
        }
        if (resolved == null) {
            throw new IOException("Failed to resolve TIDAL stream for track " + trackId);
        }

        synchronized (CACHE) {
            CACHE.put(key, resolved);
            while (CACHE.size() > CACHE_MAX) {
                Iterator<String> it = CACHE.keySet().iterator();
                if (it.hasNext()) {
                    it.next();
                    it.remove();
                } else {
                    break;
                }
            }
        }
        return resolved;
    }

    private static ResolvedStream tryResolveV1(
            String trackId,
            String accessToken,
            String clientToken,
            String countryCode
    ) {
        String[] qualities = getV1QualityOrder(LinnConfig.getAudioQualityMode());
        for (String quality : qualities) {
            try {
                String url = "https://api.tidal.com/v1/tracks/" + URLEncoder.encode(trackId, "UTF-8")
                        + "/playbackinfopostpaywall?audioquality=" + quality
                        + "&playbackmode=STREAM&assetpresentation=FULL&countryCode="
                        + URLEncoder.encode(countryCode, "UTF-8");
                String body = httpGetJson(url, accessToken, clientToken, "application/json");
                if (body == null) {
                    continue;
                }
                JSONObject json = new JSONObject(body);
                String actualQuality = json.optString("audioQuality", quality);
                int bitDepth = json.optInt("bitDepth", 16);
                int sampleRate = json.optInt("sampleRate", 44100);
                String manifestMime = json.optString("manifestMimeType", "");
                String manifestB64 = json.optString("manifest", "");
                if (manifestB64.isEmpty()) {
                    continue;
                }
                byte[] decoded = Base64.getDecoder().decode(manifestB64);
                ResolvedStream parsed = parseDecodedManifest(
                        trackId, manifestMime, decoded, actualQuality, bitDepth, sampleRate);
                if (parsed != null) {
                    return parsed;
                }
            } catch (Exception ignored) {
            }
        }
        return null;
    }

    private static ResolvedStream tryResolveV2(
            String trackId,
            String accessToken
    ) {
        try {
            String formatsQuery = getV2FormatsQuery(LinnConfig.getAudioQualityMode());
            String url = "https://openapi.tidal.com/v2/trackManifests/" + URLEncoder.encode(trackId, "UTF-8")
                    + "?adaptive=false&" + formatsQuery
                    + "&manifestType=MPEG_DASH&uriScheme=DATA&usage=PLAYBACK";
            String body = httpGetJson(url, accessToken, null, "application/vnd.api+json");
            if (body == null) {
                return null;
            }
            JSONObject root = new JSONObject(body);
            JSONObject data = root.optJSONObject("data");
            JSONObject attrs = data != null ? data.optJSONObject("attributes") : null;
            if (attrs == null) {
                return null;
            }
            String uri = attrs.optString("uri", "");
            if (uri.isEmpty()) {
                return null;
            }

            String qualityLabel = "LOSSLESS";
            JSONArray formats = attrs.optJSONArray("formats");
            if (formats != null && formats.length() > 0) {
                String f0 = formats.optString(0, "");
                if ("FLAC_HIRES".equals(f0)) qualityLabel = "HI_RES_LOSSLESS";
                else if ("FLAC".equals(f0)) qualityLabel = "LOSSLESS";
                else qualityLabel = "HIGH";
            }

            if (uri.startsWith("data:")) {
                int comma = uri.indexOf(',');
                if (comma <= 0) {
                    return null;
                }
                String header = uri.substring(5, comma);
                int semi = header.indexOf(';');
                String mime = semi >= 0 ? header.substring(0, semi) : header;
                byte[] decoded = Base64.getDecoder().decode(uri.substring(comma + 1));
                int defaultDepth = "HI_RES_LOSSLESS".equals(qualityLabel) ? 24 : 16;
                int defaultRate = "HI_RES_LOSSLESS".equals(qualityLabel) ? 96000 : 44100;
                return parseDecodedManifest(trackId, mime, decoded, qualityLabel, defaultDepth, defaultRate);
            }
        } catch (Exception ignored) {
        }
        return null;
    }

    private static ResolvedStream parseDecodedManifest(
            String trackId,
            String manifestMime,
            byte[] decoded,
            String audioQuality,
            int bitDepth,
            int sampleRate
    ) throws Exception {
        String text = new String(decoded, StandardCharsets.UTF_8).trim();
        if (manifestMime.contains("vnd.tidal.bts") || text.startsWith("{")) {
            JSONObject bts = new JSONObject(text);
            JSONArray urls = bts.optJSONArray("urls");
            if (urls == null || urls.length() == 0) {
                return null;
            }
            String url = urls.optString(0, "");
            if (url.isEmpty()) {
                return null;
            }
            String rawMime = bts.optString("mimeType", "audio/flac");
            String codecs = bts.optString("codecs", rawMime.contains("flac") ? "flac" : "mp4a.40.2");
            String upnpMime = normalizeUpnpMime(rawMime, codecs);
            return new ResolvedStream(
                    trackId, false, url, upnpMime, codecs, bitDepth, sampleRate,
                    audioQuality, null, null, null, 0.0
            );
        }

        if (manifestMime.contains("dash") || text.startsWith("<MPD") || text.contains("<MPD")) {
            DashParseResult dash = parseDashMpd(text);
            if (dash == null || dash.segmentUrls.isEmpty()) {
                return null;
            }
            int finalDepth = bitDepth;
            int finalRate = sampleRate;
            if (dash.codecs != null && dash.codecs.toLowerCase(Locale.ROOT).contains("flac")
                    && dash.initUrl != null) {
                try {
                    byte[] initBytes = LinnDashFlacRemuxer.downloadUrlBytes(dash.initUrl, null);
                    LinnDashFlacRemuxer.FlacHeaderInfo info = LinnDashFlacRemuxer.parseAndBuildHeader(initBytes, 0);
                    if (info.sampleRate > 0) finalRate = info.sampleRate;
                    if (info.bitDepth > 0) finalDepth = info.bitDepth;
                    if (finalDepth > 16 || finalRate > 48000) {
                        audioQuality = "HI_RES_LOSSLESS";
                    } else {
                        audioQuality = "LOSSLESS";
                    }
                } catch (Exception ignored) {
                }
            }
            return new ResolvedStream(
                    trackId, true, null, "audio/flac",
                    dash.codecs != null ? dash.codecs : "flac",
                    finalDepth, finalRate, audioQuality,
                    dash.initUrl, dash.segmentUrls, dash.segmentDurationsSec, dash.totalDurationSec
            );
        }
        return null;
    }

    private static final class DashParseResult {
        String codecs;
        String initUrl;
        List<String> segmentUrls = new ArrayList<>();
        List<Double> segmentDurationsSec = new ArrayList<>();
        double totalDurationSec;
    }

    static DashParseResult parseDashMpd(String mpdXml) throws Exception {
        XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
        factory.setNamespaceAware(true);
        XmlPullParser parser = factory.newPullParser();
        parser.setInput(new StringReader(mpdXml));

        double mpdDurationSec = 0.0;
        String baseUrl = "";
        String bestRepId = "";
        String bestCodecs = "";
        long bestBandwidth = -1;
        String bestInitTemplate = null;
        String bestMediaTemplate = null;
        long bestTimescale = 1;
        long bestFixedDuration = 0;
        long bestStartNumber = 1;
        List<long[]> bestTimelineEntries = null;
        String bestDirectBaseUrl = null;

        String curRepId = "";
        String curCodecs = "";
        long curBandwidth = 0;
        String curInitTemplate = null;
        String curMediaTemplate = null;
        long curTimescale = 1;
        long curFixedDuration = 0;
        long curStartNumber = 1;
        List<long[]> curTimelineEntries = null;
        String curBaseUrl = null;
        boolean inRepresentation = false;
        boolean inAdaptationSet = false;
        String adaptInitTemplate = null;
        String adaptMediaTemplate = null;
        long adaptTimescale = 1;
        long adaptFixedDuration = 0;
        long adaptStartNumber = 1;
        List<long[]> adaptTimeline = null;

        int event = parser.getEventType();
        while (event != XmlPullParser.END_DOCUMENT) {
            if (event == XmlPullParser.START_TAG) {
                String tag = parser.getName();
                if ("MPD".equalsIgnoreCase(tag)) {
                    mpdDurationSec = parseIsoDuration(parser.getAttributeValue(null, "mediaPresentationDuration"));
                } else if ("BaseURL".equalsIgnoreCase(tag)) {
                    String txt = parser.nextText();
                    if (txt != null) {
                        if (inRepresentation) curBaseUrl = txt.trim();
                        else baseUrl = txt.trim();
                    }
                } else if ("AdaptationSet".equalsIgnoreCase(tag)) {
                    inAdaptationSet = true;
                    adaptInitTemplate = null;
                    adaptMediaTemplate = null;
                    adaptTimescale = 1;
                    adaptFixedDuration = 0;
                    adaptStartNumber = 1;
                    adaptTimeline = null;
                } else if ("Representation".equalsIgnoreCase(tag)) {
                    inRepresentation = true;
                    curRepId = nonNull(parser.getAttributeValue(null, "id"));
                    curCodecs = nonNull(parser.getAttributeValue(null, "codecs"));
                    curBandwidth = parseLongSafe(parser.getAttributeValue(null, "bandwidth"), 0);
                    curInitTemplate = adaptInitTemplate;
                    curMediaTemplate = adaptMediaTemplate;
                    curTimescale = adaptTimescale;
                    curFixedDuration = adaptFixedDuration;
                    curStartNumber = adaptStartNumber;
                    curTimelineEntries = adaptTimeline != null ? new ArrayList<>(adaptTimeline) : null;
                    curBaseUrl = null;
                } else if ("SegmentTemplate".equalsIgnoreCase(tag)) {
                    String init = parser.getAttributeValue(null, "initialization");
                    String media = parser.getAttributeValue(null, "media");
                    long ts = parseLongSafe(parser.getAttributeValue(null, "timescale"), 1);
                    long dur = parseLongSafe(parser.getAttributeValue(null, "duration"), 0);
                    long start = parseLongSafe(parser.getAttributeValue(null, "startNumber"), 1);
                    if (inRepresentation) {
                        curInitTemplate = init;
                        curMediaTemplate = media;
                        curTimescale = ts;
                        curFixedDuration = dur;
                        curStartNumber = start;
                        curTimelineEntries = new ArrayList<>();
                    } else if (inAdaptationSet) {
                        adaptInitTemplate = init;
                        adaptMediaTemplate = media;
                        adaptTimescale = ts;
                        adaptFixedDuration = dur;
                        adaptStartNumber = start;
                        adaptTimeline = new ArrayList<>();
                    }
                } else if ("S".equalsIgnoreCase(tag)) {
                    long t = parseLongSafe(parser.getAttributeValue(null, "t"), -1);
                    long d = parseLongSafe(parser.getAttributeValue(null, "d"), 0);
                    long r = parseLongSafe(parser.getAttributeValue(null, "r"), 0);
                    long[] entry = new long[]{t, d, r};
                    if (inRepresentation && curTimelineEntries != null) {
                        curTimelineEntries.add(entry);
                    } else if (inAdaptationSet && adaptTimeline != null) {
                        adaptTimeline.add(entry);
                    }
                }
            } else if (event == XmlPullParser.END_TAG) {
                String tag = parser.getName();
                if ("Representation".equalsIgnoreCase(tag) && inRepresentation) {
                    boolean curFlac = curCodecs.toLowerCase(Locale.ROOT).contains("flac");
                    boolean bestFlac = bestCodecs.toLowerCase(Locale.ROOT).contains("flac");
                    boolean choose = bestBandwidth < 0
                            || (curFlac && !bestFlac)
                            || (curFlac == bestFlac && curBandwidth > bestBandwidth);
                    if (choose) {
                        bestRepId = curRepId;
                        bestCodecs = curCodecs;
                        bestBandwidth = curBandwidth;
                        bestInitTemplate = curInitTemplate;
                        bestMediaTemplate = curMediaTemplate;
                        bestTimescale = curTimescale;
                        bestFixedDuration = curFixedDuration;
                        bestStartNumber = curStartNumber;
                        bestTimelineEntries = curTimelineEntries;
                        bestDirectBaseUrl = curBaseUrl;
                    }
                    inRepresentation = false;
                } else if ("AdaptationSet".equalsIgnoreCase(tag)) {
                    inAdaptationSet = false;
                }
            }
            event = parser.next();
        }

        DashParseResult res = new DashParseResult();
        res.codecs = bestCodecs;
        res.totalDurationSec = mpdDurationSec;

        if (bestInitTemplate != null && bestMediaTemplate != null) {
            res.initUrl = resolveDashUrl(baseUrl, bestInitTemplate.replace("$RepresentationID$", bestRepId));
            long number = bestStartNumber;
            long currentTime = 0;

            if (bestTimelineEntries != null && !bestTimelineEntries.isEmpty()) {
                for (long[] s : bestTimelineEntries) {
                    if (s[0] >= 0) {
                        currentTime = s[0];
                    }
                    long d = s[1];
                    long r = s[2];
                    if (r < 0 && mpdDurationSec > 0 && d > 0) {
                        double currentSec = (double) currentTime / Math.max(1, bestTimescale);
                        double remSec = Math.max(0.0, mpdDurationSec - currentSec);
                        double segSec = (double) d / Math.max(1, bestTimescale);
                        r = Math.max(0L, (long) Math.ceil(remSec / segSec) - 1L);
                    }
                    for (long k = 0; k <= r; k++) {
                        String segUrl = bestMediaTemplate
                                .replace("$RepresentationID$", bestRepId)
                                .replace("$Number$", String.valueOf(number))
                                .replace("$Time$", String.valueOf(currentTime));
                        res.segmentUrls.add(resolveDashUrl(baseUrl, segUrl));
                        res.segmentDurationsSec.add((double) d / Math.max(1, bestTimescale));
                        number++;
                        currentTime += d;
                    }
                }
            } else if (bestFixedDuration > 0 && mpdDurationSec > 0) {
                double segSec = (double) bestFixedDuration / Math.max(1, bestTimescale);
                int count = (int) Math.ceil(mpdDurationSec / segSec);
                for (int i = 0; i < count; i++) {
                    String segUrl = bestMediaTemplate
                            .replace("$RepresentationID$", bestRepId)
                            .replace("$Number$", String.valueOf(number));
                    res.segmentUrls.add(resolveDashUrl(baseUrl, segUrl));
                    res.segmentDurationsSec.add(segSec);
                    number++;
                }
            }
        } else if (bestDirectBaseUrl != null && !bestDirectBaseUrl.isEmpty()) {
            res.initUrl = resolveDashUrl(baseUrl, bestDirectBaseUrl);
            res.segmentUrls.add(res.initUrl);
            res.segmentDurationsSec.add(Math.max(1.0, mpdDurationSec));
        }

        return res;
    }

    private static String resolveDashUrl(String baseUrl, String candidate) {
        if (candidate == null) {
            return "";
        }
        if (candidate.startsWith("http://") || candidate.startsWith("https://")) {
            return candidate;
        }
        if (baseUrl != null && !baseUrl.isEmpty()) {
            if (baseUrl.endsWith("/") || candidate.startsWith("/")) {
                return baseUrl + candidate;
            }
            return baseUrl + "/" + candidate;
        }
        return candidate;
    }

    private static double parseIsoDuration(String iso) {
        if (iso == null || !iso.startsWith("PT")) {
            return 0.0;
        }
        String rest = iso.substring(2);
        double total = 0.0;
        StringBuilder num = new StringBuilder();
        for (int i = 0; i < rest.length(); i++) {
            char c = rest.charAt(i);
            if ((c >= '0' && c <= '9') || c == '.') {
                num.append(c);
            } else {
                double val = num.length() > 0 ? Double.parseDouble(num.toString()) : 0.0;
                num.setLength(0);
                if (c == 'H') total += val * 3600.0;
                else if (c == 'M') total += val * 60.0;
                else if (c == 'S') total += val;
            }
        }
        return total;
    }

    private static String httpGetJson(
            String urlStr,
            String accessToken,
            String clientToken,
            String accept
    ) throws IOException {
        HttpURLConnection conn = (HttpURLConnection) new URL(urlStr).openConnection();
        conn.setConnectTimeout(6000);
        conn.setReadTimeout(8000);
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Authorization", "Bearer " + accessToken);
        if (clientToken != null && !clientToken.isEmpty()) {
            conn.setRequestProperty("X-Tidal-Token", clientToken);
        }
        conn.setRequestProperty("Accept", accept);
        try {
            int code = conn.getResponseCode();
            if (code < 200 || code >= 300) {
                Log.w(TAG, "Stream resolver HTTP " + code + " for " + urlStr);
                return null;
            }
            try (InputStream in = conn.getInputStream()) {
                ByteArrayOutputStream out = new ByteArrayOutputStream(4096);
                byte[] buf = new byte[4096];
                int n;
                while ((n = in.read(buf)) != -1) {
                    out.write(buf, 0, n);
                }
                return out.toString(StandardCharsets.UTF_8.name());
            }
        } finally {
            conn.disconnect();
        }
    }

    private static String[] getV1QualityOrder(int mode) {
        if (mode == LinnConfig.QUALITY_HIGH) {
            return new String[]{"HIGH", "LOW"};
        }
        if (mode == LinnConfig.QUALITY_LOSSLESS) {
            return new String[]{"LOSSLESS", "HIGH"};
        }
        return new String[]{"HI_RES_LOSSLESS", "LOSSLESS", "HIGH"};
    }

    private static String getV2FormatsQuery(int mode) {
        if (mode == LinnConfig.QUALITY_HIGH) {
            return "formats=AACLC&formats=HEAACV1";
        }
        if (mode == LinnConfig.QUALITY_LOSSLESS) {
            return "formats=FLAC&formats=AACLC";
        }
        return "formats=FLAC_HIRES&formats=FLAC&formats=AACLC";
    }

    private static String normalizeUpnpMime(String rawMime, String codecs) {
        if (rawMime != null) {
            String lower = rawMime.toLowerCase(Locale.ROOT);
            if (lower.contains("flac") || (codecs != null && codecs.toLowerCase(Locale.ROOT).contains("flac"))) {
                return "audio/flac";
            }
            if (lower.contains("mp4") || lower.contains("aac")) {
                return "audio/mp4";
            }
            return rawMime;
        }
        return "audio/flac";
    }

    private static String nonNull(String s) {
        return s != null ? s : "";
    }

    private static long parseLongSafe(String s, long fallback) {
        if (s == null || s.isEmpty()) {
            return fallback;
        }
        try {
            return Long.parseLong(s.trim());
        } catch (NumberFormatException e) {
            return fallback;
        }
    }
}
