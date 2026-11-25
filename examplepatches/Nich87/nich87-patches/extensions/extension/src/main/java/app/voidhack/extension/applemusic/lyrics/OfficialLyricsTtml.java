package app.voidhack.extension.applemusic.lyrics;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

import java.io.IOException;
import java.io.StringReader;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.function.BiFunction;
import java.util.function.UnaryOperator;

import javax.xml.XMLConstants;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

final class OfficialLyricsTtml {
    private static final int MAX_TTML_LENGTH = 1_000_000;
    static final String APPLE_NS = "http://music.apple.com/lyric-ttml-internal";
    static final String TTM_NS = "http://www.w3.org/ns/ttml#metadata";
    static final String BACKGROUND_ROLE = "x-bg";

    private OfficialLyricsTtml() {}

    static String addGuide(
            String ttml,
            boolean wordTiming,
            BiFunction<String, String, UnaryOperator<String>> romanizerFactory)
            throws IOException, SAXException, ParserConfigurationException, TransformerException {
        Document document = parse(ttml);
        if (document == null) return null;
        Element root = document.getDocumentElement();
        Element body = child(root, "body");
        if (body == null) return null;

        Element head = child(root, "head");
        Element metadata = head == null ? null : child(head, "metadata");
        Element appleMetadata = metadata == null ? null : child(metadata, "iTunesMetadata");
        Element transliterations = appleMetadata == null ? null : child(appleMetadata, "transliterations");
        if (transliterations != null && child(transliterations, "transliteration") != null) return null;

        NodeList paragraphs = body.getElementsByTagNameNS(body.getNamespaceURI(), "p");
        List<Line> lines = new ArrayList<>(paragraphs.getLength());
        StringBuilder text = new StringBuilder();
        Set<String> keys = new HashSet<>();
        for (int i = 0; i < paragraphs.getLength(); i++) {
            Element paragraph = (Element) paragraphs.item(i);
            Line line = new Line(paragraph, wordTiming);
            lines.add(line);
            if (!line.key.isEmpty()) keys.add(line.key);
            text.append(line.lead).append('\n').append(line.background).append('\n');
        }
        String language = root.getAttributeNS(XMLConstants.XML_NS_URI, "lang");
        UnaryOperator<String> romanize = romanizerFactory.apply(language, text.toString());
        if (romanize == null) return null;

        String metadataNamespace = appleMetadata != null ? appleMetadata.getNamespaceURI() : APPLE_NS;
        Element transliteration = document.createElementNS(metadataNamespace, "transliteration");
        transliteration.setAttributeNS(XMLConstants.XML_NS_URI, "xml:lang", LrclibParser.PRONUNCIATION_LANGUAGE);
        transliteration.setAttribute("automaticallyCreated", "true");
        int nextKey = 1;
        boolean hasReading = false;
        for (Line line : lines) {
            boolean canTimeReading = !wordTiming || (!line.begin.isEmpty() && !line.end.isEmpty());
            TimedPronunciation.Reading lead = canTimeReading && !line.lead.trim().isEmpty()
                    ? TimedPronunciation.read(romanize, line.lead, line.leadSpans) : null;
            TimedPronunciation.Reading background = canTimeReading && !line.background.trim().isEmpty()
                    ? TimedPronunciation.read(romanize, line.background, line.backgroundSpans) : null;
            hasReading |= lead != null || background != null;
            if (line.key.isEmpty()) {
                String key;
                do {
                    key = "L" + nextKey++;
                } while (!keys.add(key));
                line.key = key;
                String keyNamespace = line.paragraph.lookupNamespaceURI("itunes");
                line.paragraph.setAttributeNS(keyNamespace == null ? APPLE_NS : keyNamespace, "itunes:key", key);
            }

            // Apple Music rejects a pronunciation track if any lyric line lacks a matching entry.
            Element reading = document.createElementNS(metadataNamespace, "text");
            reading.setAttribute("for", line.key);
            if (lead != null) {
                if (wordTiming) {
                    appendTimedText(reading, lead, line);
                } else {
                    reading.appendChild(document.createTextNode(lead.text));
                }
            } else if (wordTiming && canTimeReading && background == null) {
                appendTimedSpan(reading, "", line.begin, line.end);
            }
            if (background != null) {
                Element backing = appendElement(reading, metadataNamespace, "span");
                backing.setAttributeNS(TTM_NS, "ttm:role", BACKGROUND_ROLE);
                if (wordTiming) {
                    appendTimedText(backing, background, line);
                } else {
                    backing.appendChild(document.createTextNode(background.text));
                }
            }
            transliteration.appendChild(reading);
        }
        if (!hasReading) return null;

        if (head == null) {
            head = document.createElementNS(root.getNamespaceURI(), "head");
            root.insertBefore(head, body);
        }
        if (metadata == null) metadata = appendElement(head, root.getNamespaceURI(), "metadata");
        if (appleMetadata == null) appleMetadata = appendElement(metadata, APPLE_NS, "iTunesMetadata");
        if (transliterations == null) {
            transliterations = appendElement(appleMetadata, metadataNamespace, "transliterations");
        }
        transliterations.appendChild(transliteration);

        return serialize(document, ttml.length());
    }

    static Document parse(String ttml) throws IOException, SAXException, ParserConfigurationException {
        if (ttml == null || ttml.length() > MAX_TTML_LENGTH || ttml.contains("<!DOCTYPE")) return null;
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        factory.setNamespaceAware(true);
        factory.setExpandEntityReferences(false);
        DocumentBuilder builder = factory.newDocumentBuilder();
        builder.setEntityResolver((publicId, systemId) -> new InputSource(new StringReader("")));
        Document document = builder.parse(new InputSource(new StringReader(ttml)));
        return "tt".equals(document.getDocumentElement().getLocalName()) ? document : null;
    }

    static String serialize(Document document, int capacity) throws TransformerException {
        StringWriter result = new StringWriter(capacity);
        TransformerFactory.newInstance().newTransformer().transform(new DOMSource(document), new StreamResult(result));
        return result.toString();
    }

    private static void appendTimedText(Element parent, TimedPronunciation.Reading reading, Line line) {
        if (reading.words.isEmpty()) {
            appendTimedSpan(parent, reading.text, line.begin, line.end);
            return;
        }
        for (int i = 0; i < reading.words.size(); i++) {
            if (i > 0) parent.appendChild(parent.getOwnerDocument().createTextNode(" "));
            TimedPronunciation.Word word = reading.words.get(i);
            appendTimedSpan(parent, word.text, word.beginTime, word.endTime);
        }
    }

    private static void appendTimedSpan(Element parent, String text, String begin, String end) {
        Element span = appendElement(parent, parent.getNamespaceURI(), "span");
        span.setAttribute("begin", begin);
        span.setAttribute("end", end);
        span.setTextContent(text);
    }

    static Element appendElement(Element parent, String namespace, String name) {
        Element element = parent.getOwnerDocument().createElementNS(namespace, name);
        parent.appendChild(element);
        return element;
    }

    static Element child(Element parent, String name) {
        if (parent == null) return null;
        for (Node node = parent.getFirstChild(); node != null; node = node.getNextSibling()) {
            if (node instanceof Element && name.equals(node.getLocalName())) return (Element) node;
        }
        return null;
    }

    static String lineKey(Element paragraph) {
        String key = paragraph.getAttributeNS(APPLE_NS, "key");
        if (!key.isEmpty()) return key;
        NamedNodeMap attributes = paragraph.getAttributes();
        for (int i = 0; i < attributes.getLength(); i++) {
            Node attribute = attributes.item(i);
            if ("key".equals(attribute.getLocalName())) return attribute.getNodeValue();
        }
        return "";
    }

    static void collectLyrics(Node node, StringBuilder lead, StringBuilder background) {
        collectLyrics(node, lead, background, null, null);
    }

    private static void collectLyrics(
            Node node, StringBuilder lead, StringBuilder background,
            List<TimedPronunciation.SourceSpan> leadSpans, List<TimedPronunciation.SourceSpan> backgroundSpans) {
        if (node.getNodeType() == Node.TEXT_NODE || node.getNodeType() == Node.CDATA_SECTION_NODE) {
            lead.append(node.getNodeValue());
            return;
        }
        if (!(node instanceof Element)) return;
        Element element = (Element) node;
        if (BACKGROUND_ROLE.equals(element.getAttributeNS(TTM_NS, "role"))) {
            if (background != null) {
                if (background.length() != 0) background.append(' ');
                if (backgroundSpans == null) {
                    background.append(element.getTextContent());
                } else {
                    collectSpan(element, background, null, backgroundSpans, null);
                }
            }
            return;
        }
        if ("br".equals(element.getLocalName())) {
            lead.append('\n');
            return;
        }
        collectSpan(element, lead, background, leadSpans, backgroundSpans);
    }

    private static void collectSpan(
            Element element, StringBuilder lead, StringBuilder background,
            List<TimedPronunciation.SourceSpan> leadSpans, List<TimedPronunciation.SourceSpan> backgroundSpans) {
        int start = lead.length();
        int previousSpans = leadSpans == null ? 0 : leadSpans.size();
        for (Node child = element.getFirstChild(); child != null; child = child.getNextSibling()) {
            collectLyrics(child, lead, background, leadSpans, backgroundSpans);
        }
        if (leadSpans != null && previousSpans == leadSpans.size() && start < lead.length()
                && "span".equals(element.getLocalName())
                && element.hasAttribute("begin") && element.hasAttribute("end")) {
            leadSpans.add(new TimedPronunciation.SourceSpan(
                    start, lead.length(), element.getAttribute("begin"), element.getAttribute("end")));
        }
    }

    private static final class Line {
        final Element paragraph;
        final String begin;
        final String end;
        final String lead;
        final String background;
        final List<TimedPronunciation.SourceSpan> leadSpans;
        final List<TimedPronunciation.SourceSpan> backgroundSpans;
        String key;

        Line(Element paragraph, boolean wordTiming) {
            this.paragraph = paragraph;
            key = lineKey(paragraph);
            begin = paragraph.getAttribute("begin");
            end = paragraph.getAttribute("end");
            StringBuilder mainText = new StringBuilder();
            StringBuilder backingText = new StringBuilder();
            leadSpans = wordTiming ? new ArrayList<>() : Collections.emptyList();
            backgroundSpans = wordTiming ? new ArrayList<>() : Collections.emptyList();
            collectLyrics(paragraph, mainText, backingText,
                    wordTiming ? leadSpans : null, wordTiming ? backgroundSpans : null);
            lead = mainText.toString();
            background = backingText.toString();
        }
    }
}
