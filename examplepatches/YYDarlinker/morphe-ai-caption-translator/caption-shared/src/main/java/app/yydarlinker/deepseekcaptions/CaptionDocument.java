package app.yydarlinker.deepseekcaptions;

import org.json.JSONArray;
import org.json.JSONObject;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import java.io.ByteArrayInputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

import javax.xml.parsers.DocumentBuilderFactory;

/** Parses common YouTube Timed Text formats and exposes a format-independent cue timeline. */
final class CaptionDocument {
    /** One parsed caption file: its cues and raw timing fragments. */
    static final class Parsed {
        private final List<Cue> cues;
        private final List<RawFragment> fragments;
        private final String format;
        private final WebVttSourceReader.Result vtt;

        private Parsed(
                List<Cue> cues,
                List<RawFragment> fragments,
                String format,
                WebVttSourceReader.Result vtt) {
            this.cues = Collections.unmodifiableList(cues);
            this.fragments = Collections.unmodifiableList(fragments);
            this.format = format;
            this.vtt = vtt;
        }

        List<Cue> cues() {
            return cues;
        }

        List<RawFragment> rawFragments() {
            return fragments;
        }

        WebVttSourceReader.Result vtt() {
            return vtt;
        }

        String timingCapabilities() {
            int offsets = 0, speakers = 0;
            for (RawFragment fragment : fragments) {
                if (fragment.nativeOffset) offsets++;
                speakers += fragment.speakerOffsets.size();
            }
            if (vtt != null)
                for (WebVttSourceReader.Range range : vtt.ranges) {
                    if (range.nativeStart) offsets++;
                    speakers += range.speakerMarkers.size();
                }
            return "detected_fmt="
                    + format
                    + ";raw_fragments="
                    + fragments.size()
                    + ";offset_segments="
                    + offsets
                    + ";speaker_markers="
                    + speakers;
        }
    }

    static final class RawFragment {
        final int id, cue;
        final String raw;
        final long startMs, endMs;
        final boolean nativeOffset;
        final List<Integer> speakerOffsets;

        RawFragment(
                int id,
                int cue,
                String raw,
                long start,
                long end,
                boolean nativeOffset,
                List<Integer> speakers) {
            this.id = id;
            this.cue = cue;
            this.raw = raw;
            startMs = start;
            endMs = end;
            this.nativeOffset = nativeOffset;
            speakerOffsets = Collections.unmodifiableList(new ArrayList<>(speakers));
        }
    }

    static final class Cue {
        final long startMs, endMs;
        final String text;

        Cue(long startMs, long endMs, String text) {
            this.startMs = Math.max(0L, startMs);
            this.endMs = Math.max(this.startMs + 1L, endMs);
            this.text = text;
        }
    }

    private static final long DEFAULT_CUE_MS = 2_000L;

    private CaptionDocument() {}

    static Parsed parse(byte[] data, String fallbackContentType) throws Exception {
        if (data == null || data.length == 0) throw new IllegalArgumentException("字幕为空");
        String body = new String(data, StandardCharsets.UTF_8);
        if (body.startsWith("\uFEFF")) body = body.substring(1);
        String trimmed = body.trim();

        if (trimmed.startsWith("{") && trimmed.contains("\"events\"")) return parseJson3(body);
        if (trimmed.startsWith("<?xml")
                || trimmed.startsWith("<transcript")
                || trimmed.startsWith("<timedtext")) return parseXml(data);
        if (trimmed.startsWith("WEBVTT")) return parseBlockFormat(body, true);
        if (looksLikeSrt(trimmed))
            return parseBlockFormat(body, false);
        throw new IllegalArgumentException(
                "暂不支持此字幕格式: "
                        + (fallbackContentType == null || fallbackContentType.isEmpty()
                                ? "unknown"
                                : fallbackContentType));
    }

    private static Parsed parseJson3(String body) throws Exception {
        JSONObject root = new JSONObject(body);
        JSONArray events = root.optJSONArray("events");
        if (events == null) throw new IllegalArgumentException("JSON3 缺少 events");

        List<Cue> cues = new ArrayList<>();
        List<RawFragment> fragments = new ArrayList<>();
        for (int i = 0; i < events.length(); i++) {
            JSONObject event = events.optJSONObject(i);
            if (event == null) continue;
            JSONArray segments = event.optJSONArray("segs");
            if (segments == null || segments.length() == 0) continue;
            long startMs = event.optLong("tStartMs", -1L);
            if (startMs < 0L) continue;
            long durationMs = event.optLong("dDurationMs", -1L);

            StringBuilder text = new StringBuilder();
            for (int j = 0; j < segments.length(); j++) {
                JSONObject segment = segments.optJSONObject(j);
                if (segment == null) continue;
                String exact = segment.optString("utf8", "");
                text.append(exact);
                long offset = segment.optLong("tOffsetMs", 0);
                long until = durationMs > 0 ? durationMs : DEFAULT_CUE_MS;
                for (int k = j + 1; k < segments.length(); k++) {
                    JSONObject next = segments.optJSONObject(k);
                    if (next != null && next.has("tOffsetMs")) {
                        until = next.optLong("tOffsetMs", until);
                        break;
                    }
                }
                fragments.add(
                        new RawFragment(
                                fragments.size(),
                                i,
                                exact,
                                startMs + offset,
                                startMs + until,
                                segment.has("tOffsetMs"),
                                Collections.emptyList()));
            }
            String value = text.toString();
            if (value.trim().isEmpty()) continue;
            cues.add(
                    new Cue(
                            startMs,
                            startMs + (durationMs > 0L ? durationMs : DEFAULT_CUE_MS),
                            value));
        }
        return new Parsed(cues, fragments, "json3", null);
    }

    private static Parsed parseXml(byte[] data) throws Exception {
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        factory.setNamespaceAware(false);
        for (String feature :
                new String[] {
                    "http://apache.org/xml/features/disallow-doctype-decl",
                    "http://xml.org/sax/features/external-general-entities",
                    "http://xml.org/sax/features/external-parameter-entities"
                }) {
            try {
                factory.setFeature(feature, feature.endsWith("decl"));
            } catch (Throwable unsupported) {
                // A parser without the feature has no such entity expansion to refuse.
            }
        }
        Document document = factory.newDocumentBuilder().parse(new ByteArrayInputStream(data));
        NodeList nodes = document.getElementsByTagName("text");
        // <p> elements carry Timed Text 2 (milliseconds in t/d); <text> carries seconds.
        boolean timedTextP = nodes.getLength() == 0;
        if (timedTextP) nodes = document.getElementsByTagName("p");

        List<RawFragment> fragments = new ArrayList<>();
        List<Cue> cues = new ArrayList<>();
        for (int i = 0; i < nodes.getLength(); i++) {
            Node node = nodes.item(i);
            if (!(node instanceof Element)) continue;
            String value = node.getTextContent();
            if (value.trim().isEmpty()) continue;

            Element element = (Element) node;
            long startMs =
                    timedTextP
                            ? firstTime(element, true, "t", "begin", "start")
                            : firstTime(element, false, "start", "begin", "t");
            if (startMs < 0L) continue;
            long durationMs =
                    timedTextP
                            ? firstTime(element, true, "d", "dur")
                            : firstTime(element, false, "dur", "d");
            long explicitEnd = firstTime(element, timedTextP, "end");
            long endMs =
                    explicitEnd >= 0L
                            ? explicitEnd
                            : startMs + (durationMs > 0L ? durationMs : DEFAULT_CUE_MS);

            // Only explicit <s t="milliseconds"> onsets are read. Text-only XML stays CUE.
            NodeList segments = element.getElementsByTagName("s");
            if (timedTextP && segments.getLength() > 0) {
                for (int j = 0; j < segments.getLength(); j++) {
                    Element segment = (Element) segments.item(j);
                    long offset = firstTime(segment, true, "t");
                    long until = endMs;
                    if (j + 1 < segments.getLength()) {
                        long next = firstTime((Element) segments.item(j + 1), true, "t");
                        if (next >= 0) until = Math.min(until, startMs + next);
                    }
                    fragments.add(
                            new RawFragment(
                                    fragments.size(),
                                    i,
                                    segment.getTextContent(),
                                    offset >= 0 ? startMs + offset : startMs,
                                    until,
                                    offset >= 0,
                                    Collections.emptyList()));
                }
            } else {
                fragments.add(
                        new RawFragment(
                                fragments.size(),
                                i,
                                value,
                                startMs,
                                endMs,
                                false,
                                Collections.emptyList()));
            }
            cues.add(new Cue(startMs, endMs, value));
        }
        return new Parsed(cues, fragments, "xml", null);
    }

    /** WebVTT and SRT: blocks separated by blank lines, a timing line, then the payload. */
    private static Parsed parseBlockFormat(String body, boolean vtt) {
        WebVttSourceReader.Result timing = vtt ? WebVttSourceReader.read(body) : null;
        List<String> blocks = Arrays.asList(body.split("\\r?\\n\\r?\\n", -1));
        List<RawFragment> fragments = new ArrayList<>();
        List<Cue> cues = new ArrayList<>();

        int sourceCue = 0;
        for (int i = 0; i < blocks.size(); i++) {
            if (vtt && WebVttSourceReader.metadata(blocks.get(i))) continue;
            String[] lines = blocks.get(i).split("\\r?\\n", -1);
            int timeline = timingLine(lines);
            if (timeline < 0 || timeline + 1 >= lines.length) continue;

            String[] times = lines[timeline].split("\\s+-->\\s+", 2);
            if (times.length != 2) continue;
            long startMs = parseTime(times[0], false);
            long endMs = parseTime(times[1].trim().split("\\s+", 2)[0], false);
            if (startMs < 0L || endMs <= startMs) continue;

            String payload =
                    String.join("\n", Arrays.copyOfRange(lines, timeline + 1, lines.length));
            String text = vtt ? WebVttSourceReader.decode(payload) : payload;
            fragments.add(
                    new RawFragment(
                            fragments.size(),
                            sourceCue++,
                            text,
                            startMs,
                            endMs,
                            false,
                            Collections.emptyList()));
            if (text.trim().isEmpty()) continue;
            cues.add(new Cue(startMs, endMs, text));
        }
        return new Parsed(cues, fragments, vtt ? "vtt" : "srt", timing);
    }

    private static int timingLine(String[] lines) {
        for (int i = 0; i < lines.length; i++) if (lines[i].contains(" --> ")) return i;
        return -1;
    }

    private static long firstTime(Element element, boolean numericIsMilliseconds, String... names) {
        for (String name : names) {
            String value = element.getAttribute(name);
            if (value == null || value.trim().isEmpty()) continue;
            long parsed = parseTime(value, numericIsMilliseconds);
            if (parsed >= 0L) return parsed;
        }
        return -1L;
    }

    private static long parseTime(String raw, boolean numericIsMilliseconds) {
        if (raw == null) return -1L;
        String value = raw.trim().toLowerCase(Locale.ROOT).replace(',', '.');
        if (value.isEmpty()) return -1L;
        try {
            if (value.endsWith("ms"))
                return Math.round(Double.parseDouble(value.substring(0, value.length() - 2)));
            if (value.endsWith("s")) return scaled(value, 1_000d);
            if (value.endsWith("m")) return scaled(value, 60_000d);
            if (value.endsWith("h")) return scaled(value, 3_600_000d);
            if (value.contains(":")) {
                double seconds = 0d;
                for (String part : value.split(":"))
                    seconds = seconds * 60d + Double.parseDouble(part);
                return Math.round(seconds * 1_000d);
            }
            return Math.round(Double.parseDouble(value) * (numericIsMilliseconds ? 1d : 1_000d));
        } catch (Throwable ignored) {
            return -1L;
        }
    }

    /** [value] without its one-letter unit, times [unitMs]. */
    private static long scaled(String value, double unitMs) {
        return Math.round(Double.parseDouble(value.substring(0, value.length() - 1)) * unitMs);
    }

    private static boolean looksLikeSrt(String trimmed) {
        return trimmed.matches("(?s)^\\d+\\s*\\R\\d{1,2}:\\d{2}:\\d{2}[,.]\\d{3}\\s+-->.*");
    }
}
