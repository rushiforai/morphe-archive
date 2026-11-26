package app.voidhack.extension.applemusic.lyrics;

import org.junit.Test;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import java.util.List;
import java.util.Map;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

public class LyricsEditTtmlTest {
    private static final String TTML_NS = "http://www.w3.org/ns/ttml";
    private static final String APPLE_NS = "http://music.apple.com/lyric-ttml-internal";
    private static final String WORD_HEADER = "<tt xmlns=\"" + TTML_NS + "\" xmlns:itunes=\"" + APPLE_NS
            + "\" itunes:timing=\"Word\" xml:lang=\"ja\">";
    private static final String WORD_LINES = "<p itunes:key=\"L1\" begin=\"00:01.000\" end=\"00:04.000\">"
            + "<span begin=\"00:01.000\" end=\"00:02.000\">星</span>"
            + "<span begin=\"00:02.000\" end=\"00:04.000\">の歌</span></p>"
            + "<p itunes:key=\"L2\" begin=\"00:05.000\" end=\"00:08.000\">"
            + "<span begin=\"00:05.000\" end=\"00:06.000\">星</span>"
            + "<span begin=\"00:06.000\" end=\"00:08.000\">の歌</span></p>";

    @Test
    public void replacesOnlyTheChosenOccurrenceAndKeepsItsLineTiming() throws Exception {
        String base = WORD_HEADER + "<body><div>" + WORD_LINES + "</div></body></tt>";

        String changed = LyricsEditTtml.applyText(base, Map.of(1, new LyricsEditTtml.Edit("空 & 海", null)));

        Document parsed = OfficialLyricsTtml.parse(changed);
        Element first = (Element) parsed.getElementsByTagNameNS(TTML_NS, "p").item(0);
        assertEquals("星の歌", first.getTextContent());
        assertEquals(2, first.getElementsByTagNameNS(TTML_NS, "span").getLength());
        Element second = (Element) parsed.getElementsByTagNameNS(TTML_NS, "p").item(1);
        NodeList words = second.getElementsByTagNameNS(TTML_NS, "span");
        assertEquals(1, words.getLength());
        Element span = (Element) words.item(0);
        assertEquals("空 & 海", span.getTextContent());
        assertEquals("00:05.000", span.getAttribute("begin"));
        assertEquals("00:08.000", span.getAttribute("end"));
    }

    @Test
    public void updatesOneReadingAndPreservesOtherOfficialReadingsAndTheTranslation() throws Exception {
        String base = WORD_HEADER + "<head><metadata><iTunesMetadata xmlns=\"" + APPLE_NS + "\">"
                + "<translations><translation xml:lang=\"en\"><text for=\"L2\">Song of the stars</text>"
                + "</translation></translations><transliterations>"
                + "<transliteration xml:lang=\"ja-Latn\"><text for=\"L1\">Official first</text>"
                + "<text for=\"L2\">Official second</text></transliteration>"
                + "</transliterations></iTunesMetadata></metadata></head>"
                + "<body><div>" + WORD_LINES + "</div></body></tt>";

        String changed = LyricsEditTtml.applyReadings(base, Map.of(1, new LyricsEditTtml.Edit(null, "hoshi no uta")));

        List<LyricsEditTtml.Row> rows = LyricsEditTtml.rows(changed);
        assertEquals("Official first", rows.get(0).reading);
        assertEquals("hoshi no uta", rows.get(1).reading);
        Document parsed = OfficialLyricsTtml.parse(changed);
        assertEquals(1, parsed.getElementsByTagNameNS(APPLE_NS, "transliteration").getLength());
        assertEquals("Song of the stars", parsed.getElementsByTagNameNS(APPLE_NS, "translation").item(0)
                .getTextContent());
    }

    @Test
    public void createsACompleteReadingTrackIncludingAWordTimedGap() throws Exception {
        String base = WORD_HEADER + "<body><div>"
                + "<p begin=\"00:00.000\" end=\"00:01.000\"></p>" + WORD_LINES + "</div></body></tt>";

        String changed = LyricsEditTtml.applyReadings(base, Map.of(2, new LyricsEditTtml.Edit(null, "hoshi no uta")));

        Document parsed = OfficialLyricsTtml.parse(changed);
        NodeList lines = parsed.getElementsByTagNameNS(TTML_NS, "p");
        NodeList guide = parsed.getElementsByTagNameNS(APPLE_NS, "text");
        assertEquals(3, guide.getLength());
        for (int i = 0; i < guide.getLength(); i++) {
            Element line = (Element) lines.item(i);
            Element reading = (Element) guide.item(i);
            assertEquals(line.getAttributeNS(APPLE_NS, "key"), reading.getAttribute("for"));
            Element span = (Element) reading.getFirstChild();
            assertEquals(line.getAttribute("begin"), span.getAttribute("begin"));
            assertEquals(line.getAttribute("end"), span.getAttribute("end"));
            assertEquals(i == 2 ? "hoshi no uta" : "", span.getTextContent());
        }
    }

    @Test
    public void listsEditedLinesWithOriginalAndUpdatedValuesInOrder() throws Exception {
        String base = WORD_HEADER + "<head><metadata><iTunesMetadata xmlns=\"" + APPLE_NS + "\">"
                + "<transliterations><transliteration xml:lang=\"ja-Latn\">"
                + "<text for=\"L1\">hoshi no uta</text>"
                + "<text for=\"L2\">hoshi no uta</text>"
                + "</transliteration></transliterations></iTunesMetadata></metadata></head>"
                + "<body><div>" + WORD_LINES + "</div></body></tt>";

        Map<Integer, LyricsEditTtml.Edit> edits = Map.of(
                1, new LyricsEditTtml.Edit("空と海", null),
                0, new LyricsEditTtml.Edit(null, "hoshi no uta (edited)")
        );
        String displayed = LyricsEditTtml.applyReadings(LyricsEditTtml.applyText(base, edits), edits);

        List<LyricsEditTtml.EditedLine> summary = LyricsEditTtml.editedLines(base, displayed, edits);
        assertEquals(2, summary.size());

        LyricsEditTtml.EditedLine first = summary.get(0);
        assertEquals(0, first.index);
        assertEquals(1000L, first.startMs);
        assertFalse(first.textChanged);
        assertTrue(first.readingChanged);
        assertEquals("星の歌", first.originalText);
        assertEquals("hoshi no uta", first.originalReading);
        assertEquals("hoshi no uta (edited)", first.currentReading);

        LyricsEditTtml.EditedLine second = summary.get(1);
        assertEquals(1, second.index);
        assertEquals(5000L, second.startMs);
        assertTrue(second.textChanged);
        assertFalse(second.readingChanged);
        assertEquals("星の歌", second.originalText);
        assertEquals("空と海", second.currentText);
        assertEquals("hoshi no uta", second.originalReading);
        assertEquals("hoshi no uta", second.currentReading);
    }

    @Test
    public void applyDocumentPreservesWordSyncWhenShiftingAndInsertingInterlude() throws Exception {
        String base = WORD_HEADER + "<head><metadata><iTunesMetadata xmlns=\"" + APPLE_NS + "\">"
                + "<translations><translation xml:lang=\"en\">"
                + "<text for=\"L1\">Song of stars</text>"
                + "<text for=\"L2\">Second verse</text>"
                + "</translation></translations>"
                + "<transliterations><transliteration xml:lang=\"ja-Latn\">"
                + "<text for=\"L1\"><span begin=\"00:01.000\" end=\"00:02.000\">hoshi</span> "
                + "<span begin=\"00:02.000\" end=\"00:04.000\">no uta</span></text>"
                + "<text for=\"L2\"><span begin=\"00:05.000\" end=\"00:08.000\">hoshi no uta</span></text>"
                + "</transliteration></transliterations></iTunesMetadata></metadata></head>"
                + "<body dur=\"00:25.000\"><div begin=\"00:01.000\" end=\"00:20.000\">"
                + "<p itunes:key=\"L1\" begin=\"00:01.000\" end=\"00:15.000\">"
                + "<span begin=\"00:01.000\" end=\"00:02.000\">星</span>"
                + "<span begin=\"00:02.000\" end=\"00:15.000\">の歌</span></p>"
                + "<p itunes:key=\"L2\" begin=\"00:15.000\" end=\"00:20.000\">"
                + "<span begin=\"00:15.000\" end=\"00:17.000\">星</span>"
                + "<span begin=\"00:17.000\" end=\"00:20.000\">の歌</span></p>"
                + "</div></body></tt>";

        LyricsEditorModel.Document doc = LyricsEditorModel.Document.fromTtml(base, base, null, null, true, 25_000L);
        // Shift line 1 start +500ms, trim line 1 end to 00:05.00 to insert a 10s interlude, and edit line 2 reading.
        doc.setLineStart(0, 1_500L, false);
        doc.insertInterludeAfter(0, 5_000L);
        doc.setLineReading(1, "hoshi no uta custom");
        // Insert a brand-new line at index 2
        doc.insertLineAt(2, "新しい行", "atarashii gyou");

        LyricsEditTtml.DocumentEdit edit = doc.toDocumentEdit();
        // Verify JSON serialization round-trip
        LyricsEditTtml.DocumentEdit restored = LyricsEditTtml.DocumentEdit.fromJson(edit.toJson());
        assertEquals(3, restored.lines.size());
        assertEquals(1, restored.explicitInterludes.size());
        assertEquals(5_000L, restored.explicitInterludes.get(0).startMs);
        assertEquals(15_000L, restored.explicitInterludes.get(0).endMs);

        String rebuilt = LyricsEditTtml.applyDocument(base, base, restored, true, false, null);
        Document parsed = OfficialLyricsTtml.parse(rebuilt);
        NodeList ps = parsed.getElementsByTagNameNS(TTML_NS, "p");
        assertEquals(3, ps.getLength());

        // Line 0 kept its 2 word spans shifted +500ms and clamped to new end 00:05.000!
        Element p0 = (Element) ps.item(0);
        assertEquals("00:01.500", p0.getAttribute("begin"));
        assertEquals("00:05.000", p0.getAttribute("end"));
        NodeList p0Spans = p0.getElementsByTagNameNS(TTML_NS, "span");
        assertEquals(2, p0Spans.getLength());
        assertEquals("00:01.500", ((Element) p0Spans.item(0)).getAttribute("begin"));
        assertEquals("00:02.500", ((Element) p0Spans.item(0)).getAttribute("end"));
        assertEquals("00:02.500", ((Element) p0Spans.item(1)).getAttribute("begin"));
        assertEquals("00:05.000", ((Element) p0Spans.item(1)).getAttribute("end"));

        // Translations preserved for L1 & L2 and aligned with added L3
        NodeList transTexts = parsed.getElementsByTagNameNS(APPLE_NS, "translation").item(0).getChildNodes();
        assertEquals(3, transTexts.getLength());
        assertEquals("Song of stars", transTexts.item(0).getTextContent());
        assertEquals("Second verse", transTexts.item(1).getTextContent());

        // Readings aligned for all 3 lines including custom reading and newly added line
        List<LyricsEditTtml.Row> rows = LyricsEditTtml.rows(rebuilt);
        assertEquals(3, rows.size());
        assertEquals("hoshi no uta", rows.get(0).reading);
        assertEquals("hoshi no uta custom", rows.get(1).reading);
        assertEquals("atarashii gyou", rows.get(2).reading);

        // Export to LRC includes the 10-second interlude boundary [00:05.00]
        String lrc = LyricsLrcExporter.export(rebuilt, null, LyricsLrcExporter.Format.LINE_SYNCED);
        assertTrue(lrc.contains("[00:01.50]星の歌\n[00:05.00]\n[00:15.00]星の歌"));
    }

    @Test
    public void applyDocumentUpgradesUnsyncedPlainTtmlToLineSynced() throws Exception {
        String plain = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
                + "<tt xmlns=\"http://www.w3.org/ns/ttml\" xmlns:ttm=\"http://www.w3.org/ns/ttml#metadata\" "
                + "xmlns:itunes=\"http://music.apple.com/lyric-ttml-internal\" itunes:timing=\"None\" xml:lang=\"ja\">"
                + "<head><metadata><ttm:agent type=\"person\" xml:id=\"v1\"/></metadata></head>"
                + "<body dur=\"01:00.000\"><div>"
                + "<p itunes:key=\"L1\">最初の行</p>"
                + "<p itunes:key=\"L2\">次の行</p>"
                + "</div></body></tt>";

        LyricsEditorModel.Document doc = LyricsEditorModel.Document.fromTtml(plain, plain, null, null, false, 60_000L);
        assertTrue(doc.convertToSynced());
        doc.setLineStart(0, 5_000L, false);
        doc.setLineEnd(0, 9_000L);
        doc.setLineStart(1, 18_000L, false);
        doc.setLineEnd(1, 22_000L);

        String syncedTtml = LyricsEditTtml.applyDocument(plain, plain, doc.toDocumentEdit(), false, false, null);
        assertTrue(syncedTtml.contains("itunes:timing=\"Line\""));
        assertTrue(syncedTtml.contains("begin=\"00:05.000\""));
        assertTrue(syncedTtml.contains("end=\"00:09.000\""));
        assertTrue(syncedTtml.contains("begin=\"00:18.000\""));
        assertTrue(syncedTtml.contains("ttm:agent=\"v1\""));
    }

    @Test
    public void extractTtmlAndDocumentInterludeRangesMatchEditorVisibilityThresholds() {
        String ttml = "<tt xmlns=\"" + TTML_NS + "\" xmlns:itunes=\"" + APPLE_NS + "\" itunes:timing=\"Line\" xml:lang=\"ja\">"
                + "<body dur=\"00:40.000\"><div begin=\"00:04.000\" end=\"00:35.000\">"
                + "<p itunes:key=\"L1\" begin=\"00:04.000\" end=\"00:08.000\">一行目</p>"
                + "<p itunes:key=\"L2\" begin=\"00:09.500\" end=\"00:12.000\">二行目</p>"
                + "<p itunes:key=\"L3\" begin=\"00:16.000\" end=\"00:20.000\">三行目</p>"
                + "</div></body></tt>";

        List<LyricsEditTtml.InterludeRange> fromTtml = LyricsEditTtml.extractTtmlInterludeRanges(ttml);
        assertEquals(2, fromTtml.size());
        // 4.0s intro (>= 3.0s)
        assertEquals(0L, fromTtml.get(0).startMs);
        assertEquals(4_000L, fromTtml.get(0).endMs);
        // 1.5s gap between L1 and L2 is ignored; 4.0s gap between L2 and L3 is included
        assertEquals(12_000L, fromTtml.get(1).startMs);
        assertEquals(16_000L, fromTtml.get(1).endMs);

        // Even a legacy DocumentEdit saved with explicitInterludeAfter=false derives all qualifying gaps
        LyricsEditTtml.DocumentEdit legacySaved = new LyricsEditTtml.DocumentEdit(
                true,
                false,
                List.of(
                        new LyricsEditTtml.LinePatch(0, "一行目", null, false, 4_000L, 8_000L, false),
                        new LyricsEditTtml.LinePatch(1, "二行目", null, false, 9_500L, 12_000L, false),
                        new LyricsEditTtml.LinePatch(2, "三行目", null, false, 16_000L, 20_000L, false)),
                List.of());
        List<LyricsEditTtml.InterludeRange> fromDoc = LyricsEditTtml.extractInterludeRanges(legacySaved);
        assertEquals(2, fromDoc.size());
        assertEquals(0L, fromDoc.get(0).startMs);
        assertEquals(4_000L, fromDoc.get(0).endMs);
        assertEquals(12_000L, fromDoc.get(1).startMs);
        assertEquals(16_000L, fromDoc.get(1).endMs);
    }

    @Test
    public void applyDocumentSkipsCreatingCustomReadingTrackWhenPronunciationPatchDisabled() throws Exception {
        String base = WORD_HEADER + "<body dur=\"00:20.000\"><div begin=\"00:01.000\" end=\"00:08.000\">"
                + WORD_LINES + "</div></body></tt>";
        LyricsEditTtml.DocumentEdit edit = new LyricsEditTtml.DocumentEdit(
                true,
                false,
                List.of(
                        new LyricsEditTtml.LinePatch(0, "編集した一行目", "henshu shita", true, 1_000L, 4_000L, false),
                        new LyricsEditTtml.LinePatch(1, "星の歌", null, false, 8_000L, 11_000L, false)),
                List.of(new LyricsEditTtml.InterludeRange(4_000L, 8_000L)));

        String rebuilt = LyricsEditTtml.applyDocument(base, base, edit, true, false, null, false);
        Document parsed = OfficialLyricsTtml.parse(rebuilt);
        assertEquals(0, parsed.getElementsByTagNameNS(APPLE_NS, "transliteration").getLength());
        List<LyricsEditTtml.Row> rows = LyricsEditTtml.rows(rebuilt);
        assertEquals(2, rows.size());
        assertEquals("編集した一行目", rows.get(0).text);
        assertEquals(8_000L, rows.get(1).startMs);
    }

}
