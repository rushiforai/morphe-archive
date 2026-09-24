package app.yydarlinker.deepseekcaptions;

import org.json.JSONArray;
import org.json.JSONObject;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

/** Parses common YouTube Timed Text formats and exposes a format-independent cue timeline. */
final class CaptionDocument {
    interface Parsed {
        List<String> texts();
        List<Cue> cues();
        byte[] render(List<String> translated) throws Exception;
        String contentType();
    }

    static final class Cue {
        final long startMs;
        final long endMs;
        final String text;

        Cue(long startMs, long endMs, String text) {
            this.startMs = Math.max(0L, startMs);
            this.endMs = Math.max(this.startMs + 1L, endMs);
            this.text = text;
        }
    }

    private CaptionDocument() {}

    static Parsed parse(byte[] data, String fallbackContentType) throws Exception {
        if (data == null || data.length == 0) throw new IllegalArgumentException("字幕为空");
        String body = new String(data, StandardCharsets.UTF_8);
        String trimmed = body.trim();

        if (trimmed.startsWith("{") && trimmed.contains("\"events\"")) {
            return parseJson3(body);
        }
        if (trimmed.startsWith("<?xml") || trimmed.startsWith("<transcript") ||
                trimmed.startsWith("<timedtext")) {
            return parseXml(data);
        }
        if (trimmed.startsWith("WEBVTT")) return parseBlockFormat(body, "text/vtt; charset=utf-8");
        if (looksLikeSrt(trimmed)) {
            return parseBlockFormat(body, "application/x-subrip; charset=utf-8");
        }

        throw new IllegalArgumentException("暂不支持此字幕格式: " + safeType(fallbackContentType));
    }

    private static Parsed parseJson3(String body) throws Exception {
        JSONObject root = new JSONObject(body);
        JSONArray events = root.optJSONArray("events");
        if (events == null) throw new IllegalArgumentException("JSON3 缺少 events");

        List<JSONObject> cueEvents = new ArrayList<>();
        List<String> texts = new ArrayList<>();
        List<Cue> rawCues = new ArrayList<>();
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
                if (segment != null) text.append(segment.optString("utf8", ""));
            }
            String value = normalizeCueText(text.toString());
            if (value.isEmpty()) continue;

            cueEvents.add(event);
            texts.add(value);
            rawCues.add(new Cue(startMs, durationMs > 0L ? startMs + durationMs : startMs + 2_000L, value));
        }
        List<Cue> cues = normalizeEnds(rawCues);

        return new Parsed() {
            @Override public List<String> texts() { return texts; }
            @Override public List<Cue> cues() { return cues; }
            @Override public String contentType() { return "application/json; charset=utf-8"; }

            @Override
            public byte[] render(List<String> translated) throws Exception {
                requireSameSize(texts, translated);
                for (int i = 0; i < cueEvents.size(); i++) {
                    JSONArray segments = cueEvents.get(i).getJSONArray("segs");
                    JSONObject first = segments.optJSONObject(0);
                    if (first == null) {
                        first = new JSONObject();
                        segments.put(0, first);
                    }
                    first.put("utf8", translated.get(i));
                    for (int j = 1; j < segments.length(); j++) {
                        JSONObject segment = segments.optJSONObject(j);
                        if (segment != null) segment.put("utf8", "");
                    }
                }
                return root.toString().getBytes(StandardCharsets.UTF_8);
            }
        };
    }

    private static Parsed parseXml(byte[] data) throws Exception {
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        factory.setNamespaceAware(false);
        try { factory.setFeature("http://apache.org/xml/features/disallow-doctype-decl", true); }
        catch (Throwable ignored) {}
        try { factory.setFeature("http://xml.org/sax/features/external-general-entities", false); }
        catch (Throwable ignored) {}
        try { factory.setFeature("http://xml.org/sax/features/external-parameter-entities", false); }
        catch (Throwable ignored) {}

        Document document = factory.newDocumentBuilder().parse(new ByteArrayInputStream(data));
        NodeList nodes = document.getElementsByTagName("text");
        boolean timedTextP = nodes.getLength() == 0;
        if (timedTextP) nodes = document.getElementsByTagName("p");

        List<Node> cueNodes = new ArrayList<>();
        List<String> texts = new ArrayList<>();
        List<Cue> rawCues = new ArrayList<>();
        for (int i = 0; i < nodes.getLength(); i++) {
            Node node = nodes.item(i);
            if (!(node instanceof Element)) continue;
            String value = normalizeCueText(node.getTextContent());
            if (value.isEmpty()) continue;

            Element element = (Element) node;
            long startMs;
            long endMs;
            if (timedTextP) {
                startMs = firstTime(element, true, "t", "begin", "start");
                long durationMs = firstTime(element, true, "d", "dur");
                long explicitEnd = firstTime(element, true, "end");
                endMs = explicitEnd >= 0L
                        ? explicitEnd
                        : startMs + (durationMs > 0L ? durationMs : 2_000L);
            } else {
                startMs = firstTime(element, false, "start", "begin", "t");
                long durationMs = firstTime(element, false, "dur", "d");
                long explicitEnd = firstTime(element, false, "end");
                endMs = explicitEnd >= 0L
                        ? explicitEnd
                        : startMs + (durationMs > 0L ? durationMs : 2_000L);
            }
            if (startMs < 0L) continue;

            cueNodes.add(node);
            texts.add(value);
            rawCues.add(new Cue(startMs, endMs, value));
        }
        List<Cue> cues = normalizeEnds(rawCues);

        return new Parsed() {
            @Override public List<String> texts() { return texts; }
            @Override public List<Cue> cues() { return cues; }
            @Override public String contentType() { return "application/xml; charset=utf-8"; }

            @Override
            public byte[] render(List<String> translated) throws Exception {
                requireSameSize(texts, translated);
                for (int i = 0; i < cueNodes.size(); i++) {
                    cueNodes.get(i).setTextContent(translated.get(i));
                }

                TransformerFactory transformerFactory = TransformerFactory.newInstance();
                Transformer transformer = transformerFactory.newTransformer();
                transformer.setOutputProperty(OutputKeys.ENCODING, "UTF-8");
                transformer.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "no");
                ByteArrayOutputStream output = new ByteArrayOutputStream();
                transformer.transform(new DOMSource(document), new StreamResult(output));
                return output.toByteArray();
            }
        };
    }

    private static Parsed parseBlockFormat(String body, String contentType) {
        String newline = body.contains("\r\n") ? "\r\n" : "\n";
        List<String> blocks = new ArrayList<>(Arrays.asList(body.split("\\r?\\n\\r?\\n", -1)));
        List<Integer> cueIndexes = new ArrayList<>();
        List<String> texts = new ArrayList<>();
        List<Cue> rawCues = new ArrayList<>();

        for (int i = 0; i < blocks.size(); i++) {
            String[] lines = blocks.get(i).split("\\r?\\n", -1);
            int timeline = -1;
            for (int j = 0; j < lines.length; j++) {
                if (lines[j].contains(" --> ")) {
                    timeline = j;
                    break;
                }
            }
            if (timeline < 0 || timeline + 1 >= lines.length) continue;

            String[] times = lines[timeline].split("\\s+-->\\s+", 2);
            if (times.length != 2) continue;
            long startMs = parseTime(times[0], false);
            String endToken = times[1].trim().split("\\s+", 2)[0];
            long endMs = parseTime(endToken, false);
            if (startMs < 0L || endMs <= startMs) continue;

            String text = normalizeCueText(String.join(
                    "\n",
                    Arrays.copyOfRange(lines, timeline + 1, lines.length)
            ));
            if (text.isEmpty()) continue;
            cueIndexes.add(i);
            texts.add(text);
            rawCues.add(new Cue(startMs, endMs, text));
        }
        List<Cue> cues = normalizeEnds(rawCues);

        return new Parsed() {
            @Override public List<String> texts() { return texts; }
            @Override public List<Cue> cues() { return cues; }
            @Override public String contentType() { return contentType; }

            @Override
            public byte[] render(List<String> translated) {
                requireSameSize(texts, translated);
                for (int i = 0; i < cueIndexes.size(); i++) {
                    int blockIndex = cueIndexes.get(i);
                    String[] lines = blocks.get(blockIndex).split("\\r?\\n", -1);
                    int timeline = -1;
                    for (int j = 0; j < lines.length; j++) {
                        if (lines[j].contains(" --> ")) {
                            timeline = j;
                            break;
                        }
                    }
                    if (timeline < 0) continue;
                    List<String> output = new ArrayList<>();
                    Collections.addAll(output, Arrays.copyOfRange(lines, 0, timeline + 1));
                    output.add(translated.get(i));
                    blocks.set(blockIndex, String.join(newline, output));
                }
                return String.join(newline + newline, blocks).getBytes(StandardCharsets.UTF_8);
            }
        };
    }

    private static List<Cue> normalizeEnds(List<Cue> raw) {
        if (raw.isEmpty()) return Collections.emptyList();
        List<Cue> result = new ArrayList<>(raw.size());
        for (int i = 0; i < raw.size(); i++) {
            Cue current = raw.get(i);
            long end = current.endMs;
            if (i + 1 < raw.size()) {
                long nextStart = raw.get(i + 1).startMs;
                // ASR display windows often overlap heavily. Keep a cue visible until at least its
                // next start, but cap extreme overlaps so the newest line wins promptly.
                if (end <= current.startMs) end = nextStart;
                if (end > nextStart + 4_000L) end = nextStart + 4_000L;
            }
            if (end <= current.startMs) end = current.startMs + 2_000L;
            result.add(new Cue(current.startMs, end, current.text));
        }
        return Collections.unmodifiableList(result);
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
            if (value.endsWith("ms")) {
                return Math.round(Double.parseDouble(value.substring(0, value.length() - 2)));
            }
            if (value.endsWith("s")) {
                return Math.round(Double.parseDouble(value.substring(0, value.length() - 1)) * 1_000d);
            }
            if (value.endsWith("m")) {
                return Math.round(Double.parseDouble(value.substring(0, value.length() - 1)) * 60_000d);
            }
            if (value.endsWith("h")) {
                return Math.round(Double.parseDouble(value.substring(0, value.length() - 1)) * 3_600_000d);
            }
            if (value.contains(":")) {
                String[] parts = value.split(":");
                double seconds = 0d;
                for (String part : parts) seconds = seconds * 60d + Double.parseDouble(part);
                return Math.round(seconds * 1_000d);
            }
            double numeric = Double.parseDouble(value);
            return Math.round(numeric * (numericIsMilliseconds ? 1d : 1_000d));
        } catch (Throwable ignored) {
            return -1L;
        }
    }

    private static boolean looksLikeSrt(String trimmed) {
        return trimmed.matches("(?s)^\\d+\\s*\\R\\d{1,2}:\\d{2}:\\d{2}[,.]\\d{3}\\s+-->.*");
    }

    private static String normalizeCueText(String text) {
        if (text == null) return "";
        return text.replace('\u00A0', ' ').replace("\r", "").trim();
    }

    private static void requireSameSize(List<String> source, List<String> translated) {
        if (source.size() != translated.size()) {
            throw new IllegalArgumentException("翻译条数与原字幕不一致");
        }
    }

    private static String safeType(String value) {
        return value == null || value.isEmpty() ? "unknown" : value;
    }
}
