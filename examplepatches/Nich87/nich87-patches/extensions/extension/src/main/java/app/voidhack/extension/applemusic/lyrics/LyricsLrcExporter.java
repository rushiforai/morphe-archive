package app.voidhack.extension.applemusic.lyrics;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Locale;

import javax.xml.XMLConstants;

/**
 * Pure Java converter from Apple Music TTML XML (official, LRCLIB, local, or line-edited)
 * into standard line-synced, enhanced word-synced, or unsynced LRC text.
 */
final class LyricsLrcExporter {
    private static final long GAP_BOUNDARY_MS = 2000L;
    private static final int MAX_FILENAME_STEM_LENGTH = 120;

    private LyricsLrcExporter() {}

    enum Format {
        LINE_SYNCED,
        WORD_SYNCED,
        UNSYNCED
    }

    static final class Capabilities {
        final boolean hasLineTiming;
        final boolean hasWordTiming;
        final int lineCount;

        Capabilities(boolean hasLineTiming, boolean hasWordTiming, int lineCount) {
            this.hasLineTiming = hasLineTiming;
            this.hasWordTiming = hasWordTiming;
            this.lineCount = lineCount;
        }

        Format defaultFormat() {
            return hasLineTiming ? Format.LINE_SYNCED : Format.UNSYNCED;
        }
    }

    private static final class WordToken {
        final String text;
        final long startMs;
        final long endMs;
        final boolean spaceBefore;

        WordToken(String text, long startMs, long endMs, boolean spaceBefore) {
            this.text = text;
            this.startMs = startMs;
            this.endMs = endMs;
            this.spaceBefore = spaceBefore;
        }
    }

    private static final class ExtractedLine {
        final int order;
        final int section;
        final long startMs;
        final long endMs;
        final String text;
        final List<WordToken> words;

        ExtractedLine(int order, int section, long startMs, long endMs, String text, List<WordToken> words) {
            this.order = order;
            this.section = section;
            this.startMs = startMs;
            this.endMs = endMs;
            this.text = text == null ? "" : text;
            this.words = words == null ? Collections.emptyList() : words;
        }
    }

    private static final class ParsedDocument {
        final String language;
        final long durationMs;
        final boolean hasLineTiming;
        final boolean hasWordTiming;
        final List<ExtractedLine> lines;

        ParsedDocument(
                String language,
                long durationMs,
                boolean hasLineTiming,
                boolean hasWordTiming,
                List<ExtractedLine> lines) {
            this.language = language == null ? "" : language;
            this.durationMs = durationMs;
            this.hasLineTiming = hasLineTiming;
            this.hasWordTiming = hasWordTiming;
            this.lines = lines;
        }
    }

    static Capabilities inspect(String ttml) {
        ParsedDocument doc = parse(ttml);
        if (doc == null || doc.lines.isEmpty()) {
            return new Capabilities(false, false, 0);
        }
        return new Capabilities(doc.hasLineTiming, doc.hasWordTiming, doc.lines.size());
    }

    static String export(String ttml, LrclibModels.TrackQuery query, Format format) {
        ParsedDocument doc = parse(ttml);
        if (doc == null || doc.lines.isEmpty()) return "";

        Format effective = format == null ? Format.LINE_SYNCED : format;
        if (effective == Format.WORD_SYNCED && !doc.hasWordTiming) {
            effective = doc.hasLineTiming ? Format.LINE_SYNCED : Format.UNSYNCED;
        } else if (effective == Format.LINE_SYNCED && !doc.hasLineTiming) {
            effective = Format.UNSYNCED;
        }

        StringBuilder sb = new StringBuilder(Math.max(512, doc.lines.size() * 48));
        appendHeaders(sb, query, doc);

        if (effective == Format.UNSYNCED) {
            if (sb.length() > 0) sb.append('\n');
            int prevSection = -1;
            boolean anyLine = false;
            for (ExtractedLine line : doc.lines) {
                String clean = line.text.trim();
                if (clean.isEmpty()) continue;
                if (anyLine && line.section != prevSection) {
                    sb.append('\n');
                }
                sb.append(clean).append('\n');
                prevSection = line.section;
                anyLine = true;
            }
            return sb.toString().trim() + "\n";
        }

        List<ExtractedLine> timed = new ArrayList<>(doc.lines.size());
        for (ExtractedLine line : doc.lines) {
            if (line.startMs >= 0L && !line.text.trim().isEmpty()) {
                timed.add(line);
            }
        }
        if (timed.isEmpty()) {
            return export(ttml, query, Format.UNSYNCED);
        }

        Collections.sort(timed, new Comparator<ExtractedLine>() {
            @Override
            public int compare(ExtractedLine a, ExtractedLine b) {
                int cmp = Long.compare(a.startMs, b.startMs);
                return cmp != 0 ? cmp : Integer.compare(a.order, b.order);
            }
        });

        for (int i = 0; i < timed.size(); i++) {
            ExtractedLine line = timed.get(i);
            sb.append('[').append(formatLrcTime(line.startMs)).append(']');
            if (effective == Format.WORD_SYNCED && !line.words.isEmpty()) {
                appendWordTimedLine(sb, line);
            } else {
                sb.append(line.text.trim());
            }
            sb.append('\n');

            // Emit an empty end-boundary timestamp when a notable instrumental gap follows or on the final line.
            if (effective == Format.LINE_SYNCED && line.endMs > line.startMs) {
                long nextStart = (i + 1 < timed.size()) ? timed.get(i + 1).startMs : -1L;
                if (nextStart < 0L || (nextStart - line.endMs) >= GAP_BOUNDARY_MS) {
                    sb.append('[').append(formatLrcTime(line.endMs)).append("]\n");
                }
            }
        }

        return sb.toString();
    }

    static String suggestFileName(LrclibModels.TrackQuery query) {
        if (query == null) return "lyrics.lrc";
        String title = sanitizeFilePart(query.title);
        String artist = sanitizeFilePart(query.artist);
        String stem;
        if (!artist.isEmpty() && !title.isEmpty()) {
            stem = artist + " - " + title;
        } else if (!title.isEmpty()) {
            stem = title;
        } else if (!artist.isEmpty()) {
            stem = artist;
        } else {
            stem = "lyrics";
        }
        if (stem.length() > MAX_FILENAME_STEM_LENGTH) {
            stem = stem.substring(0, MAX_FILENAME_STEM_LENGTH).trim();
        }
        if (stem.isEmpty()) stem = "lyrics";
        return stem + ".lrc";
    }

    private static void appendHeaders(StringBuilder sb, LrclibModels.TrackQuery query, ParsedDocument doc) {
        if (query != null) {
            if (!query.title.isEmpty()) {
                sb.append("[ti:").append(sanitizeHeaderValue(query.title)).append("]\n");
            }
            if (!query.artist.isEmpty()) {
                sb.append("[ar:").append(sanitizeHeaderValue(query.artist)).append("]\n");
            }
            if (!query.album.isEmpty()) {
                sb.append("[al:").append(sanitizeHeaderValue(query.album)).append("]\n");
            }
        }
        int durSec = (query != null && query.durationSec > 0)
                ? query.durationSec
                : (doc.durationMs > 0L ? (int) Math.round(doc.durationMs / 1000.0) : 0);
        if (durSec > 0) {
            int m = durSec / 60;
            int s = durSec % 60;
            sb.append(String.format(Locale.ROOT, "[length:%02d:%02d]\n", m, s));
        }
        if (!doc.language.isEmpty() && !"und".equalsIgnoreCase(doc.language)) {
            sb.append("[la:").append(sanitizeHeaderValue(doc.language)).append("]\n");
        }
    }

    private static void appendWordTimedLine(StringBuilder sb, ExtractedLine line) {
        long lastEndMs = -1L;
        for (int i = 0; i < line.words.size(); i++) {
            WordToken token = line.words.get(i);
            if (i > 0 && token.spaceBefore) {
                sb.append(' ');
            }
            sb.append('<').append(formatLrcTime(token.startMs)).append('>').append(token.text);
            if (token.endMs > lastEndMs) {
                lastEndMs = token.endMs;
            }
        }
        long closeMs = lastEndMs > line.startMs ? lastEndMs : line.endMs;
        if (closeMs > line.startMs) {
            sb.append('<').append(formatLrcTime(closeMs)).append('>');
        }
    }

    static String formatLrcTime(long totalMs) {
        long clamped = Math.max(0L, totalMs);
        long totalCentis = Math.round(clamped / 10.0);
        long minutes = totalCentis / 6000L;
        long rem = totalCentis % 6000L;
        long seconds = rem / 100L;
        long centis = rem % 100L;
        return String.format(Locale.ROOT, "%02d:%02d.%02d", minutes, seconds, centis);
    }

    private static ParsedDocument parse(String ttml) {
        if (ttml == null || ttml.trim().isEmpty()) return null;
        try {
            Document document = OfficialLyricsTtml.parse(ttml);
            if (document == null) return null;
            Element root = document.getDocumentElement();
            Element body = OfficialLyricsTtml.child(root, "body");
            if (body == null) return null;

            String lang = root.getAttributeNS(XMLConstants.XML_NS_URI, "lang");
            long durationMs = LyricsEditTtml.timeToMillis(body.getAttribute("dur"));
            String timingAttr = root.getAttributeNS(OfficialLyricsTtml.APPLE_NS, "timing");
            boolean explicitlyUnsynced = "None".equalsIgnoreCase(timingAttr);

            List<ExtractedLine> lines = new ArrayList<>();
            int[] order = new int[]{0};
            int[] section = new int[]{0};
            boolean[] anyLineTiming = new boolean[]{false};
            boolean[] anyWordTiming = new boolean[]{false};

            collectBodyNodes(body, explicitlyUnsynced, section, order, anyLineTiming, anyWordTiming, lines);
            return new ParsedDocument(lang, durationMs, anyLineTiming[0], anyWordTiming[0], lines);
        } catch (Exception e) {
            return null;
        }
    }

    private static void collectBodyNodes(
            Element container,
            boolean explicitlyUnsynced,
            int[] section,
            int[] order,
            boolean[] anyLineTiming,
            boolean[] anyWordTiming,
            List<ExtractedLine> out) {
        boolean sawDiv = false;
        for (Node node = container.getFirstChild(); node != null; node = node.getNextSibling()) {
            if (!(node instanceof Element)) continue;
            Element el = (Element) node;
            String local = el.getLocalName();
            if ("div".equals(local)) {
                if (sawDiv) section[0]++;
                sawDiv = true;
                collectParagraphs(el, explicitlyUnsynced, section[0], order, anyLineTiming, anyWordTiming, out);
            } else if ("p".equals(local)) {
                extractParagraph(el, explicitlyUnsynced, section[0], order, anyLineTiming, anyWordTiming, out);
            }
        }
    }

    private static void collectParagraphs(
            Element div,
            boolean explicitlyUnsynced,
            int sectionIndex,
            int[] order,
            boolean[] anyLineTiming,
            boolean[] anyWordTiming,
            List<ExtractedLine> out) {
        NodeList paragraphs = div.getElementsByTagNameNS(div.getNamespaceURI(), "p");
        for (int i = 0; i < paragraphs.getLength(); i++) {
            Element p = (Element) paragraphs.item(i);
            extractParagraph(p, explicitlyUnsynced, sectionIndex, order, anyLineTiming, anyWordTiming, out);
        }
    }

    private static void extractParagraph(
            Element p,
            boolean explicitlyUnsynced,
            int sectionIndex,
            int[] order,
            boolean[] anyLineTiming,
            boolean[] anyWordTiming,
            List<ExtractedLine> out) {
        long pBegin = explicitlyUnsynced ? -1L : LyricsEditTtml.timeToMillis(p.getAttribute("begin"));
        long pEnd = explicitlyUnsynced ? -1L : LyricsEditTtml.timeToMillis(p.getAttribute("end"));

        StringBuilder leadText = new StringBuilder();
        List<WordToken> leadWords = new ArrayList<>();
        List<Element> bgElements = new ArrayList<>();
        boolean[] pendingSpace = new boolean[]{false};

        collectLeadAndBackground(p, leadText, leadWords, bgElements, pendingSpace, explicitlyUnsynced);

        String cleanLead = normalizeLineText(leadText.toString());
        if (!cleanLead.isEmpty()) {
            long start = pBegin;
            long end = pEnd;
            if (start < 0L && !leadWords.isEmpty()) {
                start = leadWords.get(0).startMs;
            }
            if (end < 0L && !leadWords.isEmpty()) {
                end = leadWords.get(leadWords.size() - 1).endMs;
            }
            if (start >= 0L) anyLineTiming[0] = true;
            if (!leadWords.isEmpty() && start >= 0L) anyWordTiming[0] = true;
            out.add(new ExtractedLine(order[0]++, sectionIndex, start, end, cleanLead,
                    start >= 0L ? leadWords : Collections.emptyList()));
        }

        // Handle backing vocals (ttm:role="x-bg") as clean separate lines when present.
        for (Element bg : bgElements) {
            long bgBegin = explicitlyUnsynced ? -1L : LyricsEditTtml.timeToMillis(bg.getAttribute("begin"));
            long bgEnd = explicitlyUnsynced ? -1L : LyricsEditTtml.timeToMillis(bg.getAttribute("end"));
            StringBuilder bgText = new StringBuilder();
            List<WordToken> bgWords = new ArrayList<>();
            boolean[] bgPendingSpace = new boolean[]{false};
            collectLeadAndBackground(bg, bgText, bgWords, null, bgPendingSpace, explicitlyUnsynced);

            String cleanBg = normalizeLineText(bgText.toString());
            if (cleanBg.isEmpty()) continue;
            if (!cleanBg.startsWith("(") && !cleanBg.startsWith("（")) {
                cleanBg = "(" + cleanBg + ")";
            }
            long start = bgBegin >= 0L ? bgBegin : (!bgWords.isEmpty() ? bgWords.get(0).startMs : pBegin);
            long end = bgEnd >= 0L ? bgEnd : (!bgWords.isEmpty() ? bgWords.get(bgWords.size() - 1).endMs : pEnd);
            if (start >= 0L) anyLineTiming[0] = true;
            if (!bgWords.isEmpty() && start >= 0L) anyWordTiming[0] = true;
            out.add(new ExtractedLine(order[0]++, sectionIndex, start, end, cleanBg,
                    start >= 0L ? bgWords : Collections.emptyList()));
        }
    }

    private static void collectLeadAndBackground(
            Node parent,
            StringBuilder textOut,
            List<WordToken> wordsOut,
            List<Element> bgElements,
            boolean[] pendingSpace,
            boolean explicitlyUnsynced) {
        for (Node child = parent.getFirstChild(); child != null; child = child.getNextSibling()) {
            short type = child.getNodeType();
            if (type == Node.TEXT_NODE || type == Node.CDATA_SECTION_NODE) {
                String val = child.getNodeValue();
                if (val == null || val.isEmpty()) continue;
                textOut.append(val);
                if (val.trim().isEmpty()) {
                    if (!wordsOut.isEmpty()) pendingSpace[0] = true;
                } else {
                    if (Character.isWhitespace(val.charAt(0)) && !wordsOut.isEmpty()) {
                        pendingSpace[0] = true;
                    }
                    if (Character.isWhitespace(val.charAt(val.length() - 1))) {
                        pendingSpace[0] = true;
                    }
                }
                continue;
            }
            if (!(child instanceof Element)) continue;
            Element el = (Element) child;
            if (bgElements != null
                    && OfficialLyricsTtml.BACKGROUND_ROLE.equals(el.getAttributeNS(OfficialLyricsTtml.TTM_NS, "role"))) {
                bgElements.add(el);
                continue;
            }
            if ("br".equals(el.getLocalName())) {
                textOut.append(' ');
                if (!wordsOut.isEmpty()) pendingSpace[0] = true;
                continue;
            }
            if (!explicitlyUnsynced
                    && "span".equals(el.getLocalName())
                    && el.hasAttribute("begin")
                    && el.hasAttribute("end")
                    && !hasNestedTimedSpans(el)) {
                long ws = LyricsEditTtml.timeToMillis(el.getAttribute("begin"));
                long we = LyricsEditTtml.timeToMillis(el.getAttribute("end"));
                String spanRaw = el.getTextContent();
                if (spanRaw != null) {
                    textOut.append(spanRaw);
                    String core = spanRaw.trim();
                    if (!core.isEmpty() && ws >= 0L) {
                        boolean leadingWs = !spanRaw.isEmpty() && Character.isWhitespace(spanRaw.charAt(0));
                        boolean spaceBefore = !wordsOut.isEmpty() && (pendingSpace[0] || leadingWs);
                        wordsOut.add(new WordToken(core, ws, we >= ws ? we : ws, spaceBefore));
                        pendingSpace[0] = !spanRaw.isEmpty()
                                && Character.isWhitespace(spanRaw.charAt(spanRaw.length() - 1));
                    } else if (!spanRaw.isEmpty() && !wordsOut.isEmpty()) {
                        pendingSpace[0] = true;
                    }
                }
                continue;
            }
            collectLeadAndBackground(el, textOut, wordsOut, bgElements, pendingSpace, explicitlyUnsynced);
        }
    }

    private static boolean hasNestedTimedSpans(Element element) {
        NodeList nested = element.getElementsByTagNameNS(element.getNamespaceURI(), "span");
        for (int i = 0; i < nested.getLength(); i++) {
            Element s = (Element) nested.item(i);
            if (s.hasAttribute("begin") && s.hasAttribute("end")) return true;
        }
        return false;
    }

    private static String normalizeLineText(String raw) {
        if (raw == null) return "";
        return raw.replace('\r', ' ').replace('\n', ' ').replaceAll("\\s{2,}", " ").trim();
    }

    private static String sanitizeHeaderValue(String value) {
        if (value == null) return "";
        return value.replace('\r', ' ').replace('\n', ' ').replace(']', ')').trim();
    }

    private static String sanitizeFilePart(String value) {
        if (value == null) return "";
        String cleaned = value.replaceAll("[\\\\/:*?\"<>|\\p{Cntrl}]+", "_")
                .replaceAll("\\s+", " ")
                .trim();
        while (cleaned.endsWith(".") || cleaned.endsWith(" ")) {
            cleaned = cleaned.substring(0, cleaned.length() - 1).trim();
        }
        return cleaned;
    }
}
