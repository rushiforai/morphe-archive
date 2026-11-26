package app.voidhack.extension.applemusic.lyrics;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
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
import java.util.function.BiFunction;
import java.util.function.UnaryOperator;

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
            String trimmed = sanitizeXml(value).trim();
            return trimmed.isEmpty() ? null : trimmed;
        }
    }

    static final class LinePatch {
        final int sourceIndex;
        final String text;
        final String reading;
        final boolean readingEdited;
        final long startMs;
        final long endMs;
        final boolean explicitInterludeAfter;

        LinePatch(
                int sourceIndex,
                String text,
                String reading,
                boolean readingEdited,
                long startMs,
                long endMs,
                boolean explicitInterludeAfter) {
            this.sourceIndex = sourceIndex;
            this.text = text == null ? "" : sanitizeXml(text).trim();
            this.reading = reading == null ? null : sanitizeXml(reading).trim();
            this.readingEdited = readingEdited;
            this.startMs = startMs;
            this.endMs = endMs;
            this.explicitInterludeAfter = explicitInterludeAfter;
        }

        JSONObject toJson() throws JSONException {
            JSONObject obj = new JSONObject();
            obj.put("src", sourceIndex);
            obj.put("text", text);
            if (readingEdited) {
                obj.put("readingEdited", true);
                obj.put("reading", reading == null ? "" : reading);
            }
            if (startMs >= 0L) obj.put("startMs", startMs);
            if (endMs >= 0L) obj.put("endMs", endMs);
            if (explicitInterludeAfter) obj.put("interludeAfter", true);
            return obj;
        }

        static LinePatch fromJson(JSONObject obj) {
            if (obj == null) return null;
            String text = obj.optString("text", "");
            boolean readingEdited = obj.optBoolean("readingEdited", false);
            String reading = readingEdited ? obj.optString("reading", "") : null;
            return new LinePatch(
                    obj.optInt("src", -1),
                    text,
                    reading,
                    readingEdited,
                    obj.optLong("startMs", -1L),
                    obj.optLong("endMs", -1L),
                    obj.optBoolean("interludeAfter", false));
        }
    }

    static final class InterludeRange {
        final long startMs;
        final long endMs;

        InterludeRange(long startMs, long endMs) {
            this.startMs = Math.max(0L, startMs);
            this.endMs = Math.max(this.startMs, endMs);
        }

        long durationMs() {
            return Math.max(0L, endMs - startMs);
        }

        JSONObject toJson() throws JSONException {
            JSONObject obj = new JSONObject();
            obj.put("startMs", startMs);
            obj.put("endMs", endMs);
            return obj;
        }

        static InterludeRange fromJson(JSONObject obj) {
            if (obj == null) return null;
            long s = obj.optLong("startMs", -1L);
            long e = obj.optLong("endMs", -1L);
            if (s < 0L || e <= s) return null;
            return new InterludeRange(s, e);
        }
    }

    static final class DocumentEdit {
        static final int VERSION = 2;

        final boolean synced;
        final boolean explicitIntro;
        final List<LinePatch> lines;
        final List<InterludeRange> explicitInterludes;

        DocumentEdit(
                boolean synced,
                boolean explicitIntro,
                List<LinePatch> lines,
                List<InterludeRange> explicitInterludes) {
            this.synced = synced;
            this.explicitIntro = explicitIntro;
            this.lines = lines == null ? Collections.emptyList() : Collections.unmodifiableList(new ArrayList<>(lines));
            this.explicitInterludes = explicitInterludes == null
                    ? Collections.emptyList()
                    : Collections.unmodifiableList(new ArrayList<>(explicitInterludes));
        }

        JSONObject toJson() throws JSONException {
            JSONObject root = new JSONObject();
            root.put("v", VERSION);
            root.put("synced", synced);
            if (explicitIntro) root.put("explicitIntro", true);
            JSONArray linesArr = new JSONArray();
            for (LinePatch lp : lines) {
                linesArr.put(lp.toJson());
            }
            root.put("lines", linesArr);
            if (!explicitInterludes.isEmpty()) {
                JSONArray intArr = new JSONArray();
                for (InterludeRange r : explicitInterludes) {
                    intArr.put(r.toJson());
                }
                root.put("interludes", intArr);
            }
            return root;
        }

        static DocumentEdit fromJson(JSONObject root) {
            if (root == null || root.optInt("v", 1) != VERSION) return null;
            JSONArray linesArr = root.optJSONArray("lines");
            if (linesArr == null || linesArr.length() == 0) return null;
            List<LinePatch> parsedLines = new ArrayList<>(linesArr.length());
            for (int i = 0; i < linesArr.length(); i++) {
                LinePatch lp = LinePatch.fromJson(linesArr.optJSONObject(i));
                if (lp != null && !lp.text.isEmpty()) {
                    parsedLines.add(lp);
                }
            }
            if (parsedLines.isEmpty()) return null;
            List<InterludeRange> parsedInterludes = new ArrayList<>();
            JSONArray intArr = root.optJSONArray("interludes");
            if (intArr != null) {
                for (int i = 0; i < intArr.length(); i++) {
                    InterludeRange r = InterludeRange.fromJson(intArr.optJSONObject(i));
                    if (r != null) parsedInterludes.add(r);
                }
            }
            return new DocumentEdit(
                    root.optBoolean("synced", false),
                    root.optBoolean("explicitIntro", false),
                    parsedLines,
                    parsedInterludes);
        }
    }

    static final class Row {
        final int index;
        final String text;
        final String reading;
        final long startMs;
        final long endMs;
        final boolean hasWordSpans;

        Row(int index, String text, String reading, long startMs) {
            this(index, text, reading, startMs, -1L, false);
        }

        Row(int index, String text, String reading, long startMs, long endMs, boolean hasWordSpans) {
            this.index = index;
            this.text = text;
            this.reading = reading;
            this.startMs = startMs;
            this.endMs = endMs;
            this.hasWordSpans = hasWordSpans;
        }
    }

    static final class EditedLine {
        final int index;
        final long startMs;
        final long originalStartMs;
        final long endMs;
        final long originalEndMs;
        final String originalText;
        final String currentText;
        final String originalReading;
        final String currentReading;
        final boolean textChanged;
        final boolean readingChanged;
        final boolean timingChanged;
        final boolean addedLine;

        EditedLine(
                int index,
                long startMs,
                String originalText,
                String currentText,
                String originalReading,
                String currentReading,
                boolean textChanged,
                boolean readingChanged) {
            this(index, startMs, startMs, -1L, -1L, originalText, currentText,
                    originalReading, currentReading, textChanged, readingChanged, false, false);
        }

        EditedLine(
                int index,
                long startMs,
                long originalStartMs,
                long endMs,
                long originalEndMs,
                String originalText,
                String currentText,
                String originalReading,
                String currentReading,
                boolean textChanged,
                boolean readingChanged,
                boolean timingChanged,
                boolean addedLine) {
            this.index = index;
            this.startMs = startMs;
            this.originalStartMs = originalStartMs;
            this.endMs = endMs;
            this.originalEndMs = originalEndMs;
            this.originalText = originalText == null ? "" : originalText;
            this.currentText = currentText == null ? "" : currentText;
            this.originalReading = originalReading == null ? "" : originalReading;
            this.currentReading = currentReading == null ? "" : currentReading;
            this.textChanged = textChanged;
            this.readingChanged = readingChanged;
            this.timingChanged = timingChanged;
            this.addedLine = addedLine;
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

    static List<EditedLine> editedLinesForDocument(String baselineTtml, String displayedTtml, DocumentEdit edit)
            throws IOException, SAXException, ParserConfigurationException {
        if (edit == null || edit.lines.isEmpty()) return Collections.emptyList();
        Map<Integer, Row> origByIndex = new HashMap<>();
        if (baselineTtml != null && !baselineTtml.isEmpty()) {
            for (Row row : rows(baselineTtml)) origByIndex.put(row.index, row);
        }
        List<Row> dispRows = (displayedTtml != null && !displayedTtml.isEmpty())
                ? rows(displayedTtml) : Collections.emptyList();
        List<EditedLine> result = new ArrayList<>();
        for (int i = 0; i < edit.lines.size(); i++) {
            LinePatch lp = edit.lines.get(i);
            Row orig = lp.sourceIndex >= 0 ? origByIndex.get(lp.sourceIndex) : null;
            Row disp = i < dispRows.size() ? dispRows.get(i) : null;
            String origText = orig != null ? orig.text : "";
            String origReading = orig != null ? orig.reading : "";
            String currReading = disp != null ? disp.reading
                    : (lp.readingEdited && lp.reading != null ? lp.reading : origReading);
            long origStart = orig != null ? orig.startMs : -1L;
            long origEnd = orig != null ? orig.endMs : -1L;
            boolean added = orig == null;
            boolean textChanged = added || !lp.text.equals(origText);
            boolean readingChanged = lp.readingEdited && !currReading.equals(origReading);
            boolean timingChanged = edit.synced && (added
                    || lp.startMs != origStart
                    || (origEnd >= 0L && lp.endMs != origEnd)
                    || lp.explicitInterludeAfter);
            if (textChanged || readingChanged || timingChanged) {
                result.add(new EditedLine(
                        i,
                        lp.startMs,
                        origStart,
                        lp.endMs,
                        origEnd,
                        origText,
                        lp.text,
                        origReading,
                        currReading,
                        textChanged,
                        readingChanged,
                        timingChanged,
                        added));
            }
        }
        return result;
    }

    static List<InterludeRange> extractInterludeRanges(DocumentEdit edit) {
        if (edit == null || !edit.synced || edit.lines.isEmpty()) return Collections.emptyList();
        List<InterludeRange> out = new ArrayList<>();
        LinePatch first = edit.lines.get(0);
        if (first.startMs >= LyricsEditorModel.INTERLUDE_INTRO_MIN_MS) {
            out.add(new InterludeRange(0L, first.startMs));
        }
        for (int i = 0; i < edit.lines.size() - 1; i++) {
            LinePatch cur = edit.lines.get(i);
            LinePatch next = edit.lines.get(i + 1);
            if (cur.endMs >= 0L
                    && next.startMs > cur.endMs
                    && (next.startMs - cur.endMs) >= LyricsEditorModel.INTERLUDE_VISIBLE_MIN_MS) {
                out.add(new InterludeRange(cur.endMs, next.startMs));
            }
        }
        return out;
    }

    static List<InterludeRange> extractTtmlInterludeRanges(String ttml) {
        if (ttml == null || ttml.isEmpty()) return Collections.emptyList();
        try {
            List<Row> parsed = rows(ttml);
            if (parsed.isEmpty()) return Collections.emptyList();
            boolean anyTimed = false;
            for (Row row : parsed) {
                if (row.startMs >= 0L) {
                    anyTimed = true;
                    break;
                }
            }
            if (!anyTimed) return Collections.emptyList();
            List<InterludeRange> out = new ArrayList<>();
            Row first = parsed.get(0);
            if (first.startMs >= LyricsEditorModel.INTERLUDE_INTRO_MIN_MS) {
                out.add(new InterludeRange(0L, first.startMs));
            }
            for (int i = 0; i < parsed.size() - 1; i++) {
                Row cur = parsed.get(i);
                Row next = parsed.get(i + 1);
                if (cur.startMs >= 0L
                        && cur.endMs > cur.startMs
                        && next.startMs > cur.endMs
                        && (next.startMs - cur.endMs) >= LyricsEditorModel.INTERLUDE_VISIBLE_MIN_MS) {
                    out.add(new InterludeRange(cur.endMs, next.startMs));
                }
            }
            return out;
        } catch (Exception ignored) {
            return Collections.emptyList();
        }
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
            long start = timeToMillis(paragraph.getAttribute("begin"));
            long end = timeToMillis(paragraph.getAttribute("end"));
            boolean hasWordSpans = hasTimedLeafSpans(paragraph);
            result.add(new Row(i, text, leadText(reading), start, end, hasWordSpans));
        }
        return result;
    }

    static String applyDocument(
            String originalTtml,
            String baselineTtml,
            DocumentEdit edit,
            boolean wordTiming,
            boolean generateMissingReadings,
            BiFunction<String, String, UnaryOperator<String>> romanizerFactory)
            throws IOException, SAXException, ParserConfigurationException, TransformerException {
        return applyDocument(
                originalTtml, baselineTtml, edit, wordTiming, generateMissingReadings, romanizerFactory, true);
    }

    static String applyDocument(
            String originalTtml,
            String baselineTtml,
            DocumentEdit edit,
            boolean wordTiming,
            boolean generateMissingReadings,
            BiFunction<String, String, UnaryOperator<String>> romanizerFactory,
            boolean allowCustomReadingTrack)
            throws IOException, SAXException, ParserConfigurationException, TransformerException {
        if (originalTtml == null || edit == null || edit.lines.isEmpty()) return originalTtml;
        Layout layout = Layout.parse(originalTtml);
        if (layout == null) return originalTtml;

        String timingAttr = layout.root.getAttributeNS(APPLE_NS, "timing");
        boolean wasUnsynced = "None".equalsIgnoreCase(timingAttr);
        boolean effectiveSynced = edit.synced;
        boolean effectiveWord = (wordTiming || layout.wordTiming) && !wasUnsynced && effectiveSynced;
        if (effectiveSynced && wasUnsynced) {
            String timingNs = layout.root.lookupNamespaceURI("itunes");
            if (timingNs == null) timingNs = APPLE_NS;
            layout.root.setAttributeNS(timingNs, "itunes:timing", "Line");
        }

        // Snapshot original paragraphs and reading/translation entries before mutating body.
        int origCount = layout.paragraphs.getLength();
        List<Element> origParagraphs = new ArrayList<>(origCount);
        String defaultAgent = "";
        for (int i = 0; i < origCount; i++) {
            Element p = layout.paragraph(i);
            origParagraphs.add(p);
            if (defaultAgent.isEmpty()) {
                String agent = p.getAttributeNS(TTM_NS, "agent");
                if (!agent.isEmpty()) defaultAgent = agent;
            }
        }
        if (defaultAgent.isEmpty() && effectiveSynced && wasUnsynced) {
            defaultAgent = "v1";
        }

        Element origReadingTrack = layout.preferredReading();
        Map<String, Element> origReadingEntries = readingEntries(origReadingTrack);
        Map<Integer, String> baselineReadingsByIndex = new HashMap<>();
        if (baselineTtml != null && !baselineTtml.isEmpty() && !baselineTtml.equals(originalTtml)) {
            try {
                for (Row r : rows(baselineTtml)) {
                    if (!r.reading.isEmpty()) baselineReadingsByIndex.put(r.index, r.reading);
                }
            } catch (Exception ignored) {
            }
        }

        // Snapshot translation tracks so we preserve official translations for matching keys.
        List<Element> translationTracks = layout.translationTracks();
        List<Map<String, Element>> origTranslationMaps = new ArrayList<>(translationTracks.size());
        for (Element track : translationTracks) {
            origTranslationMaps.add(readingEntries(track));
        }

        String ttmlNs = layout.body.getNamespaceURI();
        String keyNs = layout.root.lookupNamespaceURI("itunes");
        if (keyNs == null) keyNs = APPLE_NS;

        // Clear body children and create a single clean <div> holding all lines in order.
        while (layout.body.getFirstChild() != null) {
            layout.body.removeChild(layout.body.getFirstChild());
        }
        Element div = appendElement(layout.body, ttmlNs, "div");

        Set<String> usedKeys = new HashSet<>();
        List<Element> emittedParagraphs = new ArrayList<>(edit.lines.size());
        List<String> emittedKeys = new ArrayList<>(edit.lines.size());
        List<LinePatch> emittedPatches = new ArrayList<>(edit.lines.size());
        List<String> origKeysForEmitted = new ArrayList<>(edit.lines.size());
        List<Long> timingDeltasForEmitted = new ArrayList<>(edit.lines.size());
        List<Boolean> textUnchangedForEmitted = new ArrayList<>(edit.lines.size());

        long minStart = Long.MAX_VALUE;
        long maxEnd = 0L;
        int nextKeyCounter = 1;
        StringBuilder allTextsForRomanizer = new StringBuilder();

        for (LinePatch lp : edit.lines) {
            if (lp.text.isEmpty()) continue;
            Element origP = (lp.sourceIndex >= 0 && lp.sourceIndex < origParagraphs.size())
                    ? origParagraphs.get(lp.sourceIndex) : null;
            String origKey = origP != null ? lineKey(origP) : "";
            String key = (!origKey.isEmpty() && usedKeys.add(origKey)) ? origKey : null;
            if (key == null) {
                do {
                    key = "L" + nextKeyCounter++;
                } while (!usedKeys.add(key));
            }

            long startMs = effectiveSynced ? Math.max(0L, lp.startMs) : -1L;
            long endMs = effectiveSynced ? Math.max(startMs + 100L, lp.endMs) : -1L;
            String beginAttr = effectiveSynced ? formatTtmlTime(startMs) : "";
            String endAttr = effectiveSynced ? formatTtmlTime(endMs) : "";

            Element newP;
            boolean textUnchanged = false;
            long deltaMs = 0L;

            if (origP != null) {
                newP = (Element) origP.cloneNode(true);
                String origText = leadText(origP);
                long origStart = timeToMillis(origP.getAttribute("begin"));
                long origEnd = timeToMillis(origP.getAttribute("end"));
                textUnchanged = lp.text.equals(origText);
                if (effectiveSynced && origStart >= 0L) {
                    deltaMs = startMs - origStart;
                }
                if (effectiveSynced) {
                    newP.setAttribute("begin", beginAttr);
                    newP.setAttribute("end", endAttr);
                    if (!defaultAgent.isEmpty() && newP.getAttributeNS(TTM_NS, "agent").isEmpty()) {
                        newP.setAttributeNS(TTM_NS, "ttm:agent", defaultAgent);
                    }
                } else {
                    newP.removeAttribute("begin");
                    newP.removeAttribute("end");
                }
                if (textUnchanged) {
                    if (effectiveWord && effectiveSynced && (startMs != origStart || endMs != origEnd)) {
                        shiftAndClampTimedSpans(newP, origStart, origEnd, startMs, endMs);
                    }
                } else {
                    replaceLeadText(newP, newP, lp.text, effectiveWord && effectiveSynced);
                }
            } else {
                newP = layout.document.createElementNS(ttmlNs, "p");
                if (!defaultAgent.isEmpty()) {
                    newP.setAttributeNS(TTM_NS, "ttm:agent", defaultAgent);
                }
                if (effectiveSynced) {
                    newP.setAttribute("begin", beginAttr);
                    newP.setAttribute("end", endAttr);
                }
                replaceLeadText(newP, newP, lp.text, effectiveWord && effectiveSynced);
            }
            newP.setAttributeNS(keyNs, "itunes:key", key);
            div.appendChild(newP);

            if (effectiveSynced) {
                if (startMs < minStart) minStart = startMs;
                if (endMs > maxEnd) maxEnd = endMs;
            }
            emittedParagraphs.add(newP);
            emittedKeys.add(key);
            emittedPatches.add(lp);
            origKeysForEmitted.add(origKey);
            timingDeltasForEmitted.add(deltaMs);
            textUnchangedForEmitted.add(textUnchanged);
            allTextsForRomanizer.append(lp.text).append('\n');
        }

        if (emittedParagraphs.isEmpty()) return originalTtml;

        if (effectiveSynced && minStart != Long.MAX_VALUE) {
            long divEnd = Math.max(minStart + 1000L, maxEnd);
            div.setAttribute("begin", formatTtmlTime(minStart));
            div.setAttribute("end", formatTtmlTime(divEnd));
            long existingDur = timeToMillis(layout.body.getAttribute("dur"));
            long bodyDur = Math.max(existingDur, divEnd);
            layout.body.setAttribute("dur", formatTtmlTime(bodyDur));
        }

        // Rebuild translations so every emitted key stays aligned.
        for (int t = 0; t < translationTracks.size(); t++) {
            Element track = translationTracks.get(t);
            Map<String, Element> origMap = origTranslationMaps.get(t);
            while (track.getFirstChild() != null) {
                track.removeChild(track.getFirstChild());
            }
            for (int i = 0; i < emittedParagraphs.size(); i++) {
                String key = emittedKeys.get(i);
                String origKey = origKeysForEmitted.get(i);
                Element origEntry = !origKey.isEmpty() ? origMap.get(origKey) : null;
                if (origEntry != null) {
                    Element cloned = (Element) origEntry.cloneNode(true);
                    cloned.setAttribute("for", key);
                    track.appendChild(cloned);
                } else {
                    Element empty = appendElement(track, track.getNamespaceURI(), "text");
                    empty.setAttribute("for", key);
                    if (effectiveWord && effectiveSynced) {
                        Element p = emittedParagraphs.get(i);
                        replaceLeadText(empty, p, "", true);
                    }
                }
            }
        }

        // Determine pronunciation / transliteration track contents.
        boolean anyManualReading = false;
        boolean anyNonEmptyReading = false;
        for (LinePatch lp : emittedPatches) {
            if (lp.readingEdited) {
                anyManualReading = true;
                if (lp.reading != null && !lp.reading.isEmpty()) {
                    anyNonEmptyReading = true;
                }
            }
        }
        boolean hasExistingReadingTrack = origReadingTrack != null;
        UnaryOperator<String> romanizer = null;
        if (generateMissingReadings && romanizerFactory != null) {
            String lang = layout.root.getAttributeNS(XMLConstants.XML_NS_URI, "lang");
            romanizer = romanizerFactory.apply(lang, allTextsForRomanizer.toString());
        }

        boolean shouldWriteReadingTrack = hasExistingReadingTrack
                || (allowCustomReadingTrack && (anyNonEmptyReading || romanizer != null));
        if (shouldWriteReadingTrack) {
            Element track = origReadingTrack;
            boolean createdNew = false;
            if (track == null) {
                track = layout.createReading();
                createdNew = true;
            }
            if (anyManualReading && LrclibParser.PRONUNCIATION_LANGUAGE.equals(
                    track.getAttributeNS(XMLConstants.XML_NS_URI, "lang"))) {
                track.removeAttribute("automaticallyCreated");
            } else if (createdNew && !anyManualReading) {
                track.setAttribute("automaticallyCreated", "true");
            }

            List<Element> builtEntries = new ArrayList<>(emittedParagraphs.size());
            boolean trackHasAnyContent = false;
            for (int i = 0; i < emittedParagraphs.size(); i++) {
                Element p = emittedParagraphs.get(i);
                String key = emittedKeys.get(i);
                LinePatch lp = emittedPatches.get(i);
                String origKey = origKeysForEmitted.get(i);
                boolean textUnchanged = textUnchangedForEmitted.get(i);

                Element entry = null;
                if (lp.readingEdited) {
                    entry = layout.document.createElementNS(track.getNamespaceURI(), "text");
                    entry.setAttribute("for", key);
                    String val = lp.reading == null ? "" : lp.reading;
                    if (!val.isEmpty()) trackHasAnyContent = true;
                    replaceLeadText(entry, p, val, effectiveWord && effectiveSynced);
                } else if (textUnchanged && !origKey.isEmpty() && origReadingEntries.containsKey(origKey)) {
                    Element origEntry = origReadingEntries.get(origKey);
                    entry = (Element) origEntry.cloneNode(true);
                    entry.setAttribute("for", key);
                    if (effectiveWord && effectiveSynced) {
                        Element origP = origParagraphs.get(lp.sourceIndex);
                        long origStart = timeToMillis(origP.getAttribute("begin"));
                        long origEnd = timeToMillis(origP.getAttribute("end"));
                        if (lp.startMs != origStart || lp.endMs != origEnd) {
                            shiftAndClampTimedSpans(entry, origStart, origEnd, lp.startMs, lp.endMs);
                        }
                    }
                    if (!leadText(entry).isEmpty()) trackHasAnyContent = true;
                } else if (romanizer != null) {
                    entry = layout.document.createElementNS(track.getNamespaceURI(), "text");
                    entry.setAttribute("for", key);
                    String generated = romanizer.apply(lp.text);
                    String cleanGen = generated == null ? "" : sanitizeXml(generated).trim();
                    if (cleanGen.equals(lp.text)) cleanGen = "";
                    if (!cleanGen.isEmpty()) trackHasAnyContent = true;
                    replaceLeadText(entry, p, cleanGen, effectiveWord && effectiveSynced);
                } else if (textUnchanged && lp.sourceIndex >= 0 && baselineReadingsByIndex.containsKey(lp.sourceIndex)) {
                    entry = layout.document.createElementNS(track.getNamespaceURI(), "text");
                    entry.setAttribute("for", key);
                    String baseR = baselineReadingsByIndex.get(lp.sourceIndex);
                    if (baseR != null && !baseR.isEmpty()) trackHasAnyContent = true;
                    replaceLeadText(entry, p, baseR == null ? "" : baseR, effectiveWord && effectiveSynced);
                } else {
                    entry = layout.document.createElementNS(track.getNamespaceURI(), "text");
                    entry.setAttribute("for", key);
                    replaceLeadText(entry, p, "", effectiveWord && effectiveSynced);
                }
                builtEntries.add(entry);
            }

            if (trackHasAnyContent || hasExistingReadingTrack) {
                while (track.getFirstChild() != null) {
                    track.removeChild(track.getFirstChild());
                }
                for (Element entry : builtEntries) {
                    track.appendChild(entry);
                }
            } else if (createdNew && track.getParentNode() != null) {
                track.getParentNode().removeChild(track);
            }
        }

        return OfficialLyricsTtml.serialize(layout.document, Math.max(originalTtml.length(), 1024));
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

    private static void shiftAndClampTimedSpans(
            Element container, long origStart, long origEnd, long newStart, long newEnd) {
        List<Element> spans = new ArrayList<>();
        collectTimedLeafSpans(container, spans);
        if (spans.isEmpty()) return;

        long safeNewStart = Math.max(0L, newStart);
        long safeNewEnd = Math.max(safeNewStart + 100L, newEnd);
        long delta = origStart >= 0L ? (safeNewStart - origStart) : 0L;

        // First test simple shift + clamp; if any span collapses (line shortened sharply), rescale proportionally.
        boolean needsRescale = false;
        long[] shiftedStarts = new long[spans.size()];
        long[] shiftedEnds = new long[spans.size()];
        for (int i = 0; i < spans.size(); i++) {
            Element s = spans.get(i);
            long b = timeToMillis(s.getAttribute("begin"));
            long e = timeToMillis(s.getAttribute("end"));
            if (b < 0L) b = origStart >= 0L ? origStart : safeNewStart;
            if (e <= b) e = b + 50L;
            long sb = b + delta;
            long se = e + delta;
            if (sb < safeNewStart) sb = safeNewStart;
            if (se > safeNewEnd) se = safeNewEnd;
            if (se <= sb + 20L) {
                needsRescale = true;
                break;
            }
            shiftedStarts[i] = sb;
            shiftedEnds[i] = se;
        }

        if (needsRescale && origStart >= 0L && origEnd > origStart) {
            double oldDur = (double) (origEnd - origStart);
            double newDur = (double) (safeNewEnd - safeNewStart);
            for (int i = 0; i < spans.size(); i++) {
                Element s = spans.get(i);
                long b = timeToMillis(s.getAttribute("begin"));
                long e = timeToMillis(s.getAttribute("end"));
                if (b < origStart) b = origStart;
                if (e <= b) e = b + 50L;
                long sb = safeNewStart + Math.round(((b - origStart) / oldDur) * newDur);
                long se = safeNewStart + Math.round(((e - origStart) / oldDur) * newDur);
                sb = Math.max(safeNewStart, Math.min(safeNewEnd - 20L, sb));
                se = Math.max(sb + 20L, Math.min(safeNewEnd, se));
                shiftedStarts[i] = sb;
                shiftedEnds[i] = se;
            }
        }

        for (int i = 0; i < spans.size(); i++) {
            Element s = spans.get(i);
            s.setAttribute("begin", formatTtmlTime(shiftedStarts[i]));
            s.setAttribute("end", formatTtmlTime(shiftedEnds[i]));
        }
    }

    private static void collectTimedLeafSpans(Element parent, List<Element> out) {
        for (Node node = parent.getFirstChild(); node != null; node = node.getNextSibling()) {
            if (!(node instanceof Element)) continue;
            Element el = (Element) node;
            if ("span".equals(el.getLocalName()) && el.hasAttribute("begin") && el.hasAttribute("end")) {
                int before = out.size();
                collectTimedLeafSpans(el, out);
                if (out.size() == before) {
                    out.add(el);
                }
            } else {
                collectTimedLeafSpans(el, out);
            }
        }
    }

    private static boolean hasTimedLeafSpans(Element parent) {
        List<Element> spans = new ArrayList<>();
        collectTimedLeafSpans(parent, spans);
        return !spans.isEmpty();
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

    static String formatTtmlTime(long totalMs) {
        long clamped = Math.max(0L, totalMs);
        long hours = clamped / 3600000L;
        long rem = clamped % 3600000L;
        long minutes = rem / 60000L;
        rem %= 60000L;
        long seconds = rem / 1000L;
        long millis = rem % 1000L;
        if (hours > 0L) {
            return String.format(Locale.ROOT, "%d:%02d:%02d.%03d", hours, minutes, seconds, millis);
        }
        return String.format(Locale.ROOT, "%02d:%02d.%03d", minutes, seconds, millis);
    }

    static long timeToMillis(String value) {
        if (value == null || value.isEmpty()) return -1L;
        try {
            String[] parts = value.split(":");
            if (parts.length > 3) return -1L;
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
            return time >= 0 && time <= Long.MAX_VALUE / 1000.0 ? Math.round(time * 1000) : -1L;
        } catch (NumberFormatException e) {
            return -1L;
        }
    }

    private static String sanitizeXml(String value) {
        if (value == null) return "";
        StringBuilder result = new StringBuilder(value.length());
        value.codePoints().filter(code -> code == 0x09 || code == 0x0A || code == 0x0D
                || (code >= 0x20 && code <= 0xD7FF)
                || (code >= 0xE000 && code <= 0xFFFD)
                || (code >= 0x10000 && code <= 0x10FFFF))
                .forEach(result::appendCodePoint);
        return result.toString();
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

        List<Element> translationTracks() {
            Element translations = child(child(child(child(root, "head"), "metadata"), "iTunesMetadata"),
                    "translations");
            if (translations == null) return Collections.emptyList();
            List<Element> result = new ArrayList<>();
            for (Node node = translations.getFirstChild(); node != null; node = node.getNextSibling()) {
                if (node instanceof Element && "translation".equals(node.getLocalName())) {
                    result.add((Element) node);
                }
            }
            return result;
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
