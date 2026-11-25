package app.voidhack.extension.applemusic.lyrics;

import org.junit.Test;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.xml.sax.InputSource;

import java.io.StringReader;
import java.util.List;
import java.util.function.UnaryOperator;

import javax.xml.parsers.DocumentBuilderFactory;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

public class OfficialLyricsTtmlTest {
    private static final String TTML_NS = "http://www.w3.org/ns/ttml";
    private static final String APPLE_NS = "http://music.apple.com/lyric-ttml-internal";
    private static final String HEADER = "<tt xmlns=\"" + TTML_NS + "\" xmlns:itunes=\"" + APPLE_NS
            + "\" xml:lang=\"ja\">";

    @Test
    public void addsWordTimedGuideWhileKeepingOriginalWordAndTranslation() throws Exception {
        String ttml = HEADER
                + "<head><metadata><iTunesMetadata xmlns=\"" + APPLE_NS + "\"><translations>"
                + "<translation xml:lang=\"en\" type=\"subtitle\">"
                + "<text for=\"L1\">Original translation</text></translation>"
                + "</translations></iTunesMetadata></metadata></head>"
                + "<body><div><p itunes:key=\"L1\" begin=\"1.000\" end=\"4.000\">"
                + "<span begin=\"1.000\" end=\"2.000\">星</span><span begin=\"2.000\" end=\"4.000\">の歌</span>"
                + "</p></div></body></tt>";

        String updated = OfficialLyricsTtml.addGuide(ttml, true, (language, source) -> {
            assertEquals("ja", language);
            return line -> "星の歌".equals(line) ? "hoshi no uta" : null;
        });

        Document parsed = parse(updated);
        Element original = element(parsed, TTML_NS, "p");
        Element lyricWord = (Element) original.getElementsByTagNameNS(TTML_NS, "span").item(0);
        assertEquals("星の歌", original.getTextContent());
        assertEquals("2.000", lyricWord.getAttribute("end"));
        assertEquals("Original translation", element(parsed, APPLE_NS, "translation").getTextContent());

        Element reading = (Element) element(parsed, APPLE_NS, "transliteration").getFirstChild();
        Element readingSpan = (Element) reading.getFirstChild();
        assertEquals("L1", reading.getAttribute("for"));
        assertEquals("hoshi no uta", readingSpan.getTextContent());
        assertEquals("1.000", readingSpan.getAttribute("begin"));
        assertEquals("4.000", readingSpan.getAttribute("end"));
    }

    @Test
    public void generatedReadingSpansFollowSungGroups() throws Exception {
        String ttml = HEADER + "<body><div><p itunes:key=\"L1\" begin=\"1.000\" end=\"5.000\">"
                + "<span begin=\"1.000\" end=\"2.000\">教</span>"
                + "<span begin=\"2.000\" end=\"3.000\">えて！</span>"
                + "<span begin=\"3.000\" end=\"4.000\">もっと</span>"
                + "<span begin=\"4.000\" end=\"5.000\">あなたの事</span>"
                + "</p></div></body></tt>";
        String text = "oshiete! motto anata no koto";
        TimedPronunciation.Romanizer romanize = (line, spans) -> {
            List<TimedPronunciation.Part> sounds = List.of(
                    new TimedPronunciation.Part(0, 3, "oshiete"),
                    new TimedPronunciation.Part(3, 4, "!"),
                    new TimedPronunciation.Part(4, 7, " motto"),
                    new TimedPronunciation.Part(7, 10, " anata"),
                    new TimedPronunciation.Part(10, 11, " no"),
                    new TimedPronunciation.Part(11, 12, " koto"));
            return new TimedPronunciation.Reading(
                    text, TimedPronunciation.align(line, sounds, spans, UnaryOperator.identity(), text));
        };

        Document parsed = parse(OfficialLyricsTtml.addGuide(ttml, true, (language, source) -> romanize));
        Element reading = element(parsed, APPLE_NS, "text");
        assertEquals(text, reading.getTextContent());
        org.w3c.dom.NodeList spans = reading.getElementsByTagNameNS(APPLE_NS, "span");
        assertEquals(3, spans.getLength());
        String[] fragments = {"oshiete!", "motto", "anata no koto"};
        for (int i = 0; i < fragments.length; i++) {
            Element span = (Element) spans.item(i);
            assertEquals(fragments[i], span.getTextContent());
            assertEquals((i == 0 ? 1 : i + 2) + ".000", span.getAttribute("begin"));
            assertEquals((i + 3) + ".000", span.getAttribute("end"));
        }
    }

    @Test
    public void addsReadingsForStaticLyricsWithAnUntranslatedLineInAnotherSection() throws Exception {
        String ttml = HEADER + "<body><div><p itunes:key=\"L1\">星 &amp; 空</p></div>"
                + "<div><p>Hello</p></div></body></tt>";

        String updated = OfficialLyricsTtml.addGuide(ttml, false,
                (language, source) -> line -> "星 & 空".equals(line) ? "hoshi & sora" : null);

        Document parsed = parse(updated);
        Element firstLine = element(parsed, TTML_NS, "p");
        Element secondLine = (Element) parsed.getElementsByTagNameNS(TTML_NS, "p").item(1);
        Element reading = element(parsed, APPLE_NS, "text");
        assertEquals("L1", firstLine.getAttributeNS(APPLE_NS, "key"));
        assertEquals("星 & 空", firstLine.getTextContent());
        assertEquals("hoshi & sora", reading.getTextContent());
        assertEquals(firstLine.getAttributeNS(APPLE_NS, "key"), reading.getAttribute("for"));
        assertEquals("Hello", secondLine.getTextContent());
        assertEquals("L2", secondLine.getAttributeNS(APPLE_NS, "key"));
        Element emptyReading = (Element) parsed.getElementsByTagNameNS(APPLE_NS, "text").item(1);
        assertEquals(secondLine.getAttributeNS(APPLE_NS, "key"), emptyReading.getAttribute("for"));
        assertEquals("", emptyReading.getTextContent());
    }

    @Test
    public void keepsExistingGuideBySkippingAugmentation() throws Exception {
        String ttml = HEADER + "<head><metadata><iTunesMetadata xmlns=\"" + APPLE_NS + "\">"
                + "<transliterations><transliteration xml:lang=\"ja-Latn\">"
                + "<text for=\"L1\">Official guide</text></transliteration></transliterations>"
                + "</iTunesMetadata></metadata></head><body><div><p itunes:key=\"L1\">星</p></div></body></tt>";

        assertNull(OfficialLyricsTtml.addGuide(ttml, false, (language, source) -> line -> "hoshi"));
    }

    @Test
    public void doesNotResolveDtdFromUntrustedLyrics() throws Exception {
        String ttml = "<!DOCTYPE tt SYSTEM \"file:///does-not-exist.dtd\">"
                + HEADER + "<body><div><p>星</p></div></body></tt>";

        assertNull(OfficialLyricsTtml.addGuide(ttml, false, (language, source) -> line -> "hoshi"));
    }

    private static Document parse(String source) throws Exception {
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        factory.setNamespaceAware(true);
        return factory.newDocumentBuilder().parse(new InputSource(new StringReader(source)));
    }

    private static Element element(Document document, String namespace, String name) {
        return (Element) document.getElementsByTagNameNS(namespace, name).item(0);
    }
}
