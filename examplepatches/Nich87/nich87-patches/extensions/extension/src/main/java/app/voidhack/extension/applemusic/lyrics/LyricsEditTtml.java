package app.voidhack.extension.applemusic.lyrics;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

import javax.xml.XMLConstants;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.TransformerException;

import static app.voidhack.extension.applemusic.lyrics.OfficialLyricsTtml.APPLE_NS;
import static app.voidhack.extension.applemusic.lyrics.OfficialLyricsTtml.TTM_NS;
import static app.voidhack.extension.applemusic.lyrics.OfficialLyricsTtml.appendElement;
import static app.voidhack.extension.applemusic.lyrics.OfficialLyricsTtml.child;
import static app.voidhack.extension.applemusic.lyrics.OfficialLyricsTtml.lineKey;

final class LyricsEditTtml {
    static final class Edit {
        final String text;
        final String reading;

        Edit(String text, String reading) {
            this.text = clean(text);
            this.reading = clean(reading);
        }

        private static String clean(String value) {
            if (value == null) return null;
            StringBuilder result = new StringBuilder(value.length());
            value.codePoints().filter(code -> code == 0x09 || code == 0x0A || code == 0x0D
                    || (code >= 0x20 && code <= 0xD7FF)
                    || (code >= 0xE000 && code <= 0xFFFD)
                    || (code >= 0x10000 && code <= 0x10FFFF))
                    .forEach(result::appendCodePoint);
            String trimmed = result.toString().trim();
            return trimmed.isEmpty() ? null : trimmed;
        }
    }

    static final class Row {
        final int index;
        final String text;
        final String reading;
        final long startMs;

        Row(int index, String text, String reading, long startMs) {
            this.index = index;
            this.text = text;
            this.reading = reading;
            this.startMs = startMs;
        }
    }

    static final class EditedLine {
        final int index;
        final long startMs;
        final String originalText;
        final String currentText;
        final String originalReading;
        final String currentReading;
        final boolean textChanged;
        final boolean readingChanged;

        EditedLine(
                int index,
                long startMs,
                String originalText,
                String currentText,
                String originalReading,
                String currentReading,
                boolean textChanged,
                boolean readingChanged) {
            this.index = index;
            this.startMs = startMs;
            this.originalText = originalText == null ? "" : originalText;
            this.currentText = currentText == null ? "" : currentText;
            this.originalReading = originalReading == null ? "" : originalReading;
            this.currentReading = currentReading == null ? "" : currentReading;
            this.textChanged = textChanged;
            this.readingChanged = readingChanged;
        }
    }

    private LyricsEditTtml() {}

    static List<EditedLine> editedLines(
            String originalTtml, String displayedTtml, Map<Integer, Edit> edits)
            throws IOException, SAXException, ParserConfigurationException {
        if (edits == null || edits.isEmpty()) return Collections.emptyList();
        Map<Integer, Row> origByIndex = new HashMap<>();
        if (originalTtml != null && !originalTtml.isEmpty()) {
            for (Row row : rows(originalTtml)) origByIndex.put(row.index, row);
        }
        Map<Integer, Row> dispByIndex = new HashMap<>();
        if (displayedTtml != null && !displayedTtml.isEmpty()) {
            for (Row row : rows(displayedTtml)) dispByIndex.put(row.index, row);
        }
        List<Integer> indices = new ArrayList<>(edits.keySet());
        Collections.sort(indices);
        List<EditedLine> result = new ArrayList<>(indices.size());
        for (int index : indices) {
            Edit edit = edits.get(index);
            if (edit == null || (edit.text == null && edit.reading == null)) continue;
            Row orig = origByIndex.get(index);
            Row disp = dispByIndex.get(index);
            String origText = orig != null ? orig.text : "";
            String currText = disp != null ? disp.text : (edit.text != null ? edit.text : origText);
            String origReading = orig != null ? orig.reading : "";
            String currReading = disp != null ? disp.reading : (edit.reading != null ? edit.reading : origReading);
            long startMs = orig != null ? orig.startMs : (disp != null ? disp.startMs : -1L);
            boolean textChanged = !currText.equals(origText) || (edit.text != null && !edit.text.equals(origText));
            boolean readingChanged = !currReading.equals(origReading)
                    || (edit.reading != null && !edit.reading.equals(origReading));
            if (!textChanged && !readingChanged) {
                textChanged = edit.text != null;
                readingChanged = edit.reading != null;
            }
            result.add(new EditedLine(
                    index, startMs, origText, currText, origReading, currReading, textChanged, readingChanged));
        }
        return result;
    }

    static List<Row> rows(String ttml) throws IOException, SAXException, ParserConfigurationException {
        Layout layout = Layout.parse(ttml);
        if (layout == null) return Collections.emptyList();
        Map<String, Element> readings = readingEntries(layout.preferredReading());
        List<Row> result = new ArrayList<>();
        for (int i = 0; i < layout.paragraphs.getLength(); i++) {
            Element paragraph = layout.paragraph(i);
            String text = leadText(paragraph);
            if (text.isEmpty()) continue;
            Element reading = readings.get(lineKey(paragraph));
            result.add(new Row(i, text, leadText(reading), timeToMillis(paragraph.getAttribute("begin"))));
        }
        return result;
    }

    static String applyText(String ttml, Map<Integer, Edit> edits)
            throws IOException, SAXException, ParserConfigurationException, TransformerException {
        if (edits.values().stream().noneMatch(edit -> edit.text != null)) return ttml;
        Layout layout = Layout.parse(ttml);
        if (layout == null) return ttml;
        boolean changed = false;
        for (Map.Entry<Integer, Edit> entry : edits.entrySet()) {
            Element paragraph = layout.paragraph(entry.getKey());
            String text = entry.getValue().text;
            if (paragraph == null || text == null || text.equals(leadText(paragraph))) continue;
            replaceLeadText(paragraph, paragraph, text, layout.wordTiming);
            changed = true;
        }
        return changed ? OfficialLyricsTtml.serialize(layout.document, ttml.length()) : ttml;
    }

    static String applyReadings(String ttml, Map<Integer, Edit> edits)
            throws IOException, SAXException, ParserConfigurationException, TransformerException {
        if (edits.values().stream().noneMatch(edit -> edit.reading != null)) return ttml;
        Layout layout = Layout.parse(ttml);
        if (layout == null) return ttml;

        Element track = layout.preferredReading();
        Map<String, Element> entries = readingEntries(track);
        Map<Integer, String> replacements = new HashMap<>();
        for (Map.Entry<Integer, Edit> entry : edits.entrySet()) {
            Element paragraph = layout.paragraph(entry.getKey());
            String reading = entry.getValue().reading;
            if (paragraph != null && reading != null && !reading.equals(leadText(entries.get(lineKey(paragraph))))) {
                replacements.put(entry.getKey(), reading);
            }
        }
        if (replacements.isEmpty()) return ttml;

        boolean newTrack = track == null;
        if (newTrack) track = layout.createReading();
        Set<String> usedKeys = new HashSet<>();
        for (int i = 0; i < layout.paragraphs.getLength(); i++) {
            usedKeys.add(lineKey(layout.paragraph(i)));
        }
        for (int i = 0; i < layout.paragraphs.getLength(); i++) {
            String replacement = replacements.get(i);
            if (!newTrack && replacement == null) continue;
            Element paragraph = layout.paragraph(i);
            String key = lineKey(paragraph);
            if (key.isEmpty()) {
                int keyIndex = i + 1;
                do {
                    key = "L" + keyIndex++;
                } while (!usedKeys.add(key));
                paragraph.setAttributeNS(APPLE_NS, "itunes:key", key);
            }
            Element reading = entries.get(key);
            if (reading == null) {
                reading = appendElement(track, track.getNamespaceURI(), "text");
                reading.setAttribute("for", key);
            }
            replaceLeadText(reading, paragraph, replacement == null ? "" : replacement, layout.wordTiming);
        }
        return OfficialLyricsTtml.serialize(layout.document, ttml.length());
    }

    private static Map<String, Element> readingEntries(Element track) {
        Map<String, Element> result = new HashMap<>();
        if (track == null) return result;
        for (Node node = track.getFirstChild(); node != null; node = node.getNextSibling()) {
            if (node instanceof Element && "text".equals(node.getLocalName())) {
                Element element = (Element) node;
                result.put(element.getAttribute("for"), element);
            }
        }
        return result;
    }

    private static String leadText(Element element) {
        if (element == null) return "";
        StringBuilder lead = new StringBuilder();
        OfficialLyricsTtml.collectLyrics(element, lead, new StringBuilder());
        return lead.toString().trim();
    }

    private static void replaceLeadText(Element parent, Element paragraph, String text, boolean wordTiming) {
        List<Element> backingVocals = new ArrayList<>();
        collectBackingVocals(parent, backingVocals);
        parent.setTextContent("");
        String begin = paragraph.getAttribute("begin");
        String end = paragraph.getAttribute("end");
        if (wordTiming && !begin.isEmpty() && !end.isEmpty()) {
            // Retain the line's interval when the replacement has no per-word timing.
            Element span = appendElement(parent, parent.getNamespaceURI(), "span");
            span.setAttribute("begin", begin);
            span.setAttribute("end", end);
            span.setTextContent(text);
        } else if (!text.isEmpty()) {
            parent.appendChild(parent.getOwnerDocument().createTextNode(text));
        }
        for (Element backing : backingVocals) parent.appendChild(backing);
    }

    private static void collectBackingVocals(Element parent, List<Element> result) {
        for (Node node = parent.getFirstChild(); node != null; node = node.getNextSibling()) {
            if (!(node instanceof Element)) continue;
            Element element = (Element) node;
            if (OfficialLyricsTtml.BACKGROUND_ROLE.equals(element.getAttributeNS(TTM_NS, "role"))) {
                result.add(element);
            } else {
                collectBackingVocals(element, result);
            }
        }
    }

    static long timeToMillis(String value) {
        try {
            String[] parts = value.split(":");
            if (parts.length > 3) return -1;
            double time;
            if (parts.length == 1 && value.endsWith("ms")) {
                time = Double.parseDouble(value.substring(0, value.length() - 2)) / 1000;
            } else {
                time = 0;
                for (String part : parts) {
                    String seconds = part.endsWith("s") ? part.substring(0, part.length() - 1) : part;
                    time = time * 60 + Double.parseDouble(seconds);
                }
            }
            return time >= 0 && time <= Long.MAX_VALUE / 1000.0 ? Math.round(time * 1000) : -1;
        } catch (NumberFormatException e) {
            return -1;
        }
    }

    private static final class Layout {
        final Document document;
        final Element root;
        final Element body;
        final NodeList paragraphs;
        final boolean wordTiming;

        static Layout parse(String ttml) throws IOException, SAXException, ParserConfigurationException {
            Document document = OfficialLyricsTtml.parse(ttml);
            if (document == null) return null;
            Element body = child(document.getDocumentElement(), "body");
            return body == null ? null : new Layout(document, body);
        }

        Layout(Document document, Element body) {
            this.document = document;
            this.root = document.getDocumentElement();
            this.body = body;
            this.paragraphs = body.getElementsByTagNameNS(body.getNamespaceURI(), "p");
            String timing = root.getAttributeNS(APPLE_NS, "timing");
            this.wordTiming = timing.isEmpty() ? hasTimedSpans(body) : "Word".equalsIgnoreCase(timing);
        }

        private static boolean hasTimedSpans(Element body) {
            NodeList spans = body.getElementsByTagNameNS(body.getNamespaceURI(), "span");
            for (int i = 0; i < spans.getLength(); i++) {
                Element span = (Element) spans.item(i);
                if (span.hasAttribute("begin") && span.hasAttribute("end")) return true;
            }
            return false;
        }

        Element paragraph(int index) {
            return index < 0 || index >= paragraphs.getLength() ? null : (Element) paragraphs.item(index);
        }

        Element preferredReading() {
            Element translations = child(child(child(child(root, "head"), "metadata"), "iTunesMetadata"),
                    "transliterations");
            if (translations == null) return null;
            Element first = null;
            Element generated = null;
            for (Node node = translations.getFirstChild(); node != null; node = node.getNextSibling()) {
                if (!(node instanceof Element) || !"transliteration".equals(node.getLocalName())) continue;
                Element track = (Element) node;
                String language = track.getAttributeNS(XMLConstants.XML_NS_URI, "lang");
                if (LrclibParser.PRONUNCIATION_LANGUAGE.equals(language)) {
                    generated = track;
                } else {
                    if ("Latn".equals(Locale.forLanguageTag(language).getScript())) return track;
                    if (first == null) first = track;
                }
            }
            return first == null ? generated : first;
        }

        Element createReading() {
            Element head = child(root, "head");
            if (head == null) {
                head = document.createElementNS(root.getNamespaceURI(), "head");
                root.insertBefore(head, body);
            }
            Element metadata = child(head, "metadata");
            if (metadata == null) metadata = appendElement(head, root.getNamespaceURI(), "metadata");
            Element appleMetadata = child(metadata, "iTunesMetadata");
            if (appleMetadata == null) appleMetadata = appendElement(metadata, APPLE_NS, "iTunesMetadata");
            String namespace = appleMetadata.getNamespaceURI();
            Element translations = child(appleMetadata, "transliterations");
            if (translations == null) translations = appendElement(appleMetadata, namespace, "transliterations");
            Element track = appendElement(translations, namespace, "transliteration");
            track.setAttributeNS(XMLConstants.XML_NS_URI, "xml:lang", LrclibParser.PRONUNCIATION_LANGUAGE);
            return track;
        }
    }
}
