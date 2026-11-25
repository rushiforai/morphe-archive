package dev.materialtidal.extension.tidal.player.lyrics;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import java.io.StringReader;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import dev.materialtidal.extension.tidal.player.lyrics.SyllableLyricsModels.LyricLineData;
import dev.materialtidal.extension.tidal.player.lyrics.SyllableLyricsModels.SyllableLyricsDocument;
import dev.materialtidal.extension.tidal.player.lyrics.SyllableLyricsModels.SyllableSpan;
import dev.materialtidal.extension.tidal.player.lyrics.SyllableLyricsModels.WordGroup;

/**
 * Parses Apple Music / lrc.red / BetterLyrics W3C TTML documents into
 * syllable-grouped {@link SyllableLyricsDocument}s.
 *
 * <p>Adjacent timed spans without intervening whitespace (e.g.
 * {@code <span>et</span><span>was</span>}) are merged into one {@link WordGroup}
 * with multiple {@link SyllableSpan}s so word lift & syllable sweep work seamlessly.
 * Line-only TTML (no timed spans) returns {@code null} for clean fallback to TIDAL lyrics.
 */
public final class TtmlLyricsParser {

    private TtmlLyricsParser() {
    }

    public static SyllableLyricsDocument parse(String xml, String providerName) {
        if (xml == null || xml.trim().isEmpty()) {
            return null;
        }
        Document doc;
        try {
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            factory.setNamespaceAware(true);
            trySetFeature(factory, "http://apache.org/xml/features/disallow-doctype-decl", true);
            trySetFeature(factory, "http://xml.org/sax/features/external-general-entities", false);
            trySetFeature(factory, "http://xml.org/sax/features/external-parameter-entities", false);
            DocumentBuilder builder = factory.newDocumentBuilder();
            doc = builder.parse(new InputSource(new StringReader(xml)));
        } catch (Throwable t) {
            return null;
        }

        Element root = doc.getDocumentElement();
        if (root == null) {
            return null;
        }

        boolean byModel = "true".equalsIgnoreCase(getAttrByLocalName(root, "byModel"));
        String rootTiming = getAttrByLocalName(root, "timing");
        if ("Line".equalsIgnoreCase(rootTiming) || "None".equalsIgnoreCase(rootTiming)) {
            return null;
        }

        NodeList bodyList = root.getElementsByTagNameNS("*", "body");
        if (bodyList.getLength() == 0) {
            bodyList = root.getElementsByTagName("body");
        }
        if (bodyList.getLength() == 0) {
            return null;
        }
        Element body = (Element) bodyList.item(0);

        List<Element> pElements = new ArrayList<>();
        collectElementsByLocalName(body, "p", pElements);
        if (pElements.isEmpty()) {
            return null;
        }

        String primaryAgent = null;
        List<LyricLineData> parsedLines = new ArrayList<>(pElements.size());
        boolean anyTimedWord = false;

        for (Element p : pElements) {
            String agent = getAttrByLocalName(p, "agent");
            boolean isOppositeSide = false;
            if (!agent.isEmpty()) {
                if (primaryAgent == null) {
                    primaryAgent = agent;
                } else if (!primaryAgent.equals(agent) && !"v1000".equalsIgnoreCase(agent)) {
                    isOppositeSide = true;
                }
            }

            long pBeginMs = parseTimestampMs(getAttrByLocalName(p, "begin"));
            long pEndMs = parseTimestampMs(getAttrByLocalName(p, "end"));
            long pDurMs = parseTimestampMs(getAttrByLocalName(p, "dur"));
            if (pEndMs < 0 && pBeginMs >= 0 && pDurMs > 0) {
                pEndMs = pBeginMs + pDurMs;
            }

            List<WordGroup> leadWords = new ArrayList<>();
            List<WordGroup> bgWords = new ArrayList<>();
            extractWordsFromElement(p, false, pEndMs, leadWords, bgWords);

            if (leadWords.isEmpty() && bgWords.isEmpty()) {
                continue;
            }

            if (!leadWords.isEmpty() || !bgWords.isEmpty()) {
                anyTimedWord = true;
            }

            long lineStart = pBeginMs >= 0 ? pBeginMs : Long.MAX_VALUE;
            long lineEnd = pEndMs >= 0 ? pEndMs : 0L;
            for (WordGroup w : leadWords) {
                if (w.startMs < lineStart) lineStart = w.startMs;
                if (w.endMs > lineEnd) lineEnd = w.endMs;
            }
            for (WordGroup w : bgWords) {
                if (w.startMs < lineStart) lineStart = w.startMs;
                if (w.endMs > lineEnd) lineEnd = w.endMs;
            }
            if (lineStart == Long.MAX_VALUE) {
                lineStart = 0L;
            }
            if (lineEnd <= lineStart) {
                lineEnd = lineStart + 250L;
            }

            String fullText = SyllableLyricsModels.buildLineText(leadWords);
            if (fullText.isEmpty() && !bgWords.isEmpty()) {
                fullText = SyllableLyricsModels.buildLineText(bgWords);
            }

            parsedLines.add(new LyricLineData(
                    fullText,
                    lineStart,
                    lineEnd,
                    leadWords,
                    bgWords,
                    isOppositeSide,
                    false
            ));
        }

        if (!anyTimedWord || parsedLines.isEmpty()) {
            return null;
        }

        List<LyricLineData> withBreaks = SyllableLyricsModels.insertInstrumentalBreaks(parsedLines);
        return new SyllableLyricsDocument(providerName, true, byModel, withBreaks);
    }

    private static void extractWordsFromElement(
            Element parent,
            boolean inBackground,
            long fallbackLineEndMs,
            List<WordGroup> leadOut,
            List<WordGroup> bgOut
    ) {
        WordAccumulator acc = new WordAccumulator(inBackground, inBackground ? bgOut : leadOut);
        boolean sawSpaceBeforeNext = false;

        NodeList children = parent.getChildNodes();
        for (int i = 0; i < children.getLength(); i++) {
            Node child = children.item(i);
            short type = child.getNodeType();
            if (type == Node.TEXT_NODE || type == Node.CDATA_SECTION_NODE) {
                String txt = child.getNodeValue();
                if (txt != null && containsWhitespace(txt)) {
                    sawSpaceBeforeNext = true;
                }
            } else if (type == Node.ELEMENT_NODE) {
                Element el = (Element) child;
                String localName = getLocalName(el);
                if (!"span".equalsIgnoreCase(localName)) {
                    continue;
                }

                String role = getAttrByLocalName(el, "role");
                boolean childIsBg = inBackground || "x-bg".equalsIgnoreCase(role);

                if (childIsBg && !inBackground) {
                    // Background vocal group nested inside lead <p>
                    acc.flush(true);
                    sawSpaceBeforeNext = false;
                    extractBackgroundGroup(el, fallbackLineEndMs, bgOut);
                    continue;
                }

                String beginAttr = getAttrByLocalName(el, "begin");
                if (beginAttr.isEmpty()) {
                    // Untimed wrapper span: recurse or collect text whitespace
                    if (hasTimedChildSpan(el)) {
                        acc.flush(sawSpaceBeforeNext);
                        sawSpaceBeforeNext = false;
                        extractWordsFromElement(el, childIsBg, fallbackLineEndMs, leadOut, bgOut);
                    } else {
                        String raw = el.getTextContent();
                        if (raw != null && containsWhitespace(raw)) {
                            sawSpaceBeforeNext = true;
                        }
                    }
                    continue;
                }

                long startMs = parseTimestampMs(beginAttr);
                if (startMs < 0) {
                    continue;
                }
                long endMs = parseTimestampMs(getAttrByLocalName(el, "end"));
                if (endMs < 0) {
                    long durMs = parseTimestampMs(getAttrByLocalName(el, "dur"));
                    if (durMs > 0) {
                        endMs = startMs + durMs;
                    } else if (fallbackLineEndMs > startMs) {
                        endMs = fallbackLineEndMs;
                    } else {
                        endMs = startMs + 200L;
                    }
                }
                if (endMs < startMs + 40L) {
                    endMs = startMs + 40L;
                }

                String rawText = el.getTextContent();
                if (rawText == null) {
                    rawText = "";
                }
                boolean leadingSpace = !rawText.isEmpty() && Character.isWhitespace(rawText.charAt(0));
                boolean trailingSpace = !rawText.isEmpty() && Character.isWhitespace(rawText.charAt(rawText.length() - 1));
                String trimmed = rawText.trim();
                if (trimmed.isEmpty()) {
                    if (!rawText.isEmpty()) {
                        sawSpaceBeforeNext = true;
                    }
                    continue;
                }

                if (leadingSpace) {
                    sawSpaceBeforeNext = true;
                }

                acc.addSyllable(trimmed, startMs, endMs, sawSpaceBeforeNext, trailingSpace);
                sawSpaceBeforeNext = trailingSpace;
            }
        }
        acc.flush(false);
    }

    private static void extractBackgroundGroup(
            Element bgSpan,
            long fallbackLineEndMs,
            List<WordGroup> bgOut
    ) {
        List<WordGroup> tempBg = new ArrayList<>();
        extractWordsFromElement(bgSpan, true, fallbackLineEndMs, tempBg, tempBg);
        if (tempBg.isEmpty()) {
            String beginAttr = getAttrByLocalName(bgSpan, "begin");
            long startMs = parseTimestampMs(beginAttr);
            if (startMs >= 0) {
                long endMs = parseTimestampMs(getAttrByLocalName(bgSpan, "end"));
                if (endMs < 0) {
                    endMs = fallbackLineEndMs > startMs ? fallbackLineEndMs : startMs + 300L;
                }
                String txt = bgSpan.getTextContent();
                if (txt != null) {
                    txt = stripOuterParens(txt.trim());
                    if (!txt.isEmpty()) {
                        List<SyllableSpan> spans = new ArrayList<>(1);
                        spans.add(new SyllableSpan(txt, startMs, Math.max(startMs + 40L, endMs)));
                        tempBg.add(new WordGroup(txt, false, spans, startMs, Math.max(startMs + 40L, endMs), true));
                    }
                }
            }
        }
        if (tempBg.isEmpty()) {
            return;
        }
        // Strip outer wrapping parentheses if the first word starts with '(' and last ends with ')'
        WordGroup first = tempBg.get(0);
        WordGroup last = tempBg.get(tempBg.size() - 1);
        if (first.text.startsWith("(") && last.text.endsWith(")")) {
            if (tempBg.size() == 1) {
                String stripped = stripOuterParens(first.text);
                if (!stripped.isEmpty()) {
                    tempBg.set(0, rebuildWordText(first, stripped));
                }
            } else {
                String fStripped = first.text.substring(1).trim();
                String lStripped = last.text.substring(0, last.text.length() - 1).trim();
                if (!fStripped.isEmpty()) {
                    tempBg.set(0, rebuildWordText(first, fStripped));
                }
                if (!lStripped.isEmpty()) {
                    tempBg.set(tempBg.size() - 1, rebuildWordText(last, lStripped));
                }
            }
        }
        bgOut.addAll(tempBg);
    }

    private static WordGroup rebuildWordText(WordGroup orig, String newText) {
        if (orig.syllables.size() == 1) {
            List<SyllableSpan> one = new ArrayList<>(1);
            one.add(new SyllableSpan(newText, orig.startMs, orig.endMs));
            return new WordGroup(newText, orig.trailingSpace, one, orig.startMs, orig.endMs, orig.isBackground);
        }
        return new WordGroup(newText, orig.trailingSpace, orig.syllables, orig.startMs, orig.endMs, orig.isBackground);
    }

    private static String stripOuterParens(String s) {
        if (s.length() >= 2 && s.startsWith("(") && s.endsWith(")")) {
            return s.substring(1, s.length() - 1).trim();
        }
        return s;
    }

    private static boolean hasTimedChildSpan(Element el) {
        NodeList children = el.getChildNodes();
        for (int i = 0; i < children.getLength(); i++) {
            Node child = children.item(i);
            if (child.getNodeType() == Node.ELEMENT_NODE) {
                Element c = (Element) child;
                if ("span".equalsIgnoreCase(getLocalName(c)) && !getAttrByLocalName(c, "begin").isEmpty()) {
                    return true;
                }
                if (hasTimedChildSpan(c)) {
                    return true;
                }
            }
        }
        return false;
    }

    private static final class WordAccumulator {
        private final boolean isBackground;
        private final List<WordGroup> out;
        private final StringBuilder textBuf = new StringBuilder();
        private final List<SyllableSpan> sylBuf = new ArrayList<>();
        private long wordStartMs = Long.MAX_VALUE;
        private long wordEndMs = 0L;
        private boolean openNonCjkWord = false;

        WordAccumulator(boolean isBackground, List<WordGroup> out) {
            this.isBackground = isBackground;
            this.out = out;
        }

        void addSyllable(String text, long startMs, long endMs, boolean spaceBefore, boolean spaceAfter) {
            boolean cjk = SyllableLyricsModels.containsCjk(text);
            if (cjk) {
                flush(true);
                List<SyllableSpan> one = new ArrayList<>(1);
                one.add(new SyllableSpan(text, startMs, endMs));
                out.add(new WordGroup(text, spaceAfter, one, startMs, endMs, isBackground));
                return;
            }

            if (spaceBefore || !openNonCjkWord) {
                flush(spaceBefore || openNonCjkWord);
            }

            textBuf.append(text);
            sylBuf.add(new SyllableSpan(text, startMs, endMs));
            if (startMs < wordStartMs) wordStartMs = startMs;
            if (endMs > wordEndMs) wordEndMs = endMs;
            openNonCjkWord = true;

            if (spaceAfter) {
                flush(true);
            }
        }

        void flush(boolean trailingSpace) {
            if (!openNonCjkWord || sylBuf.isEmpty()) {
                if (trailingSpace && !out.isEmpty()) {
                    int lastIdx = out.size() - 1;
                    WordGroup prev = out.get(lastIdx);
                    if (!prev.trailingSpace) {
                        out.set(lastIdx, new WordGroup(
                                prev.text,
                                true,
                                prev.syllables,
                                prev.startMs,
                                prev.endMs,
                                prev.isBackground
                        ));
                    }
                }
                openNonCjkWord = false;
                return;
            }
            String wordText = textBuf.toString();
            out.add(new WordGroup(
                    wordText,
                    trailingSpace,
                    sylBuf,
                    wordStartMs,
                    Math.max(wordStartMs + 40L, wordEndMs),
                    isBackground
            ));
            textBuf.setLength(0);
            sylBuf.clear();
            wordStartMs = Long.MAX_VALUE;
            wordEndMs = 0L;
            openNonCjkWord = false;
        }
    }

    /**
     * Parses TTML timestamps:
     * "27.395", "0:03.836", "03:21.570", "1:02:03.450", "27395ms", "27.395s", "27".
     */
    public static long parseTimestampMs(String raw) {
        if (raw == null) {
            return -1L;
        }
        String s = raw.trim();
        if (s.isEmpty()) {
            return -1L;
        }
        try {
            if (s.endsWith("ms")) {
                return Math.round(Double.parseDouble(s.substring(0, s.length() - 2).trim()));
            }
            if (s.endsWith("s")) {
                return Math.round(Double.parseDouble(s.substring(0, s.length() - 1).trim()) * 1000.0);
            }
            String[] parts = s.split(":");
            if (parts.length == 1) {
                return Math.round(Double.parseDouble(parts[0]) * 1000.0);
            } else if (parts.length == 2) {
                long mins = Long.parseLong(parts[0].trim());
                double secs = Double.parseDouble(parts[1].trim());
                return mins * 60_000L + Math.round(secs * 1000.0);
            } else if (parts.length == 3) {
                long hrs = Long.parseLong(parts[0].trim());
                long mins = Long.parseLong(parts[1].trim());
                double secs = Double.parseDouble(parts[2].trim());
                return hrs * 3_600_000L + mins * 60_000L + Math.round(secs * 1000.0);
            }
        } catch (NumberFormatException ignored) {
        }
        return -1L;
    }

    private static void collectElementsByLocalName(Element root, String targetLocalName, List<Element> out) {
        NodeList children = root.getChildNodes();
        for (int i = 0; i < children.getLength(); i++) {
            Node child = children.item(i);
            if (child.getNodeType() == Node.ELEMENT_NODE) {
                Element el = (Element) child;
                if (targetLocalName.equalsIgnoreCase(getLocalName(el))) {
                    out.add(el);
                } else {
                    collectElementsByLocalName(el, targetLocalName, out);
                }
            }
        }
    }

    private static String getLocalName(Node node) {
        String local = node.getLocalName();
        if (local != null) {
            return local;
        }
        String name = node.getNodeName();
        if (name == null) {
            return "";
        }
        int colon = name.indexOf(':');
        return colon >= 0 ? name.substring(colon + 1) : name;
    }

    private static String getAttrByLocalName(Element el, String localName) {
        NamedNodeMap attrs = el.getAttributes();
        if (attrs == null) {
            return "";
        }
        for (int i = 0; i < attrs.getLength(); i++) {
            Node attr = attrs.item(i);
            String attrLocal = getLocalName(attr);
            if (localName.equalsIgnoreCase(attrLocal)) {
                String v = attr.getNodeValue();
                return v != null ? v.trim() : "";
            }
        }
        return "";
    }

    private static boolean containsWhitespace(String s) {
        for (int i = 0; i < s.length(); i++) {
            if (Character.isWhitespace(s.charAt(i))) {
                return true;
            }
        }
        return false;
    }

    private static void trySetFeature(DocumentBuilderFactory factory, String feature, boolean value) {
        try {
            factory.setFeature(feature, value);
        } catch (Throwable ignored) {
        }
    }
}
