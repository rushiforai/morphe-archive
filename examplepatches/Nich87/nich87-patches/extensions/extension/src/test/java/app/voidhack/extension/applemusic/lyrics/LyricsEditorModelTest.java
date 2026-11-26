package app.voidhack.extension.applemusic.lyrics;

import org.junit.After;
import org.junit.Test;

import java.util.Collections;
import java.util.List;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

public class LyricsEditorModelTest {
    private static final String TTML_NS = "http://www.w3.org/ns/ttml";
    private static final String APPLE_NS = "http://music.apple.com/lyric-ttml-internal";
    private static final String LINE_TTML =
            "<tt xmlns=\"" + TTML_NS + "\" xmlns:itunes=\"" + APPLE_NS + "\" itunes:timing=\"Line\" xml:lang=\"ja\">"
                    + "<head><metadata><iTunesMetadata xmlns=\"" + APPLE_NS + "\">"
                    + "<transliterations><transliteration xml:lang=\"und-Latn-x-lrclib\" automaticallyCreated=\"true\">"
                    + "<text for=\"L1\">hoshi no uta</text>"
                    + "<text for=\"L2\">yoru no kaze</text>"
                    + "<text for=\"L3\">asa ga kuru</text>"
                    + "</transliteration></transliterations></iTunesMetadata></metadata></head>"
                    + "<body dur=\"01:00.000\"><div begin=\"00:05.000\" end=\"00:45.000\">"
                    + "<p itunes:key=\"L1\" begin=\"00:05.000\" end=\"00:25.000\">星の歌</p>"
                    + "<p itunes:key=\"L2\" begin=\"00:25.000\" end=\"00:30.000\">夜の風</p>"
                    + "<p itunes:key=\"L3\" begin=\"00:30.000\" end=\"00:35.000\">朝が来る</p>"
                    + "</div></body></tt>";

    @After
    public void cleanup() {
        LyricsInterludes.clearForTest();
    }

    @Test
    public void detectsStuckLrclibLineAndInsertsInterludeWithoutShiftingNextLine() {
        LyricsEditorModel.Document doc = LyricsEditorModel.Document.fromTtml(
                LINE_TTML, LINE_TTML, null, null, false, 60_000L);
        assertEquals(3, doc.lines.size());
        assertTrue(doc.synced);
        assertTrue(doc.isInterludeCandidateAfter(0)); // 20s stuck line
        assertFalse(doc.isInterludeCandidateAfter(1)); // 5s normal line
        assertEquals(1, doc.interludeCandidateCount());

        // Insert interlude using live playback position at 00:09.00
        assertTrue(doc.insertInterludeAfter(0, 9_000L));
        assertEquals(9_000L, doc.lines.get(0).endMs);
        assertEquals(25_000L, doc.lines.get(1).startMs);
        assertTrue(doc.hasInterludeAfter(0));
        assertEquals(16_000L, doc.gapAfter(0));
        assertEquals(0, doc.interludeCandidateCount());
        assertEquals(0, doc.findPlayingInterludeAfter(15_000L));
        assertEquals(-1, doc.findPlayingLineIndex(15_000L));

        // Undo restores stuck line cleanly
        assertTrue(doc.undo());
        assertEquals(25_000L, doc.lines.get(0).endMs);
        assertFalse(doc.hasInterludeAfter(0));

        // Redo reapplies interlude
        assertTrue(doc.redo());
        assertEquals(9_000L, doc.lines.get(0).endMs);
        assertTrue(doc.hasInterludeAfter(0));
    }

    @Test
    public void autoInsertInterludesSplitsLongStuckLines() {
        LyricsEditorModel.Document doc = LyricsEditorModel.Document.fromTtml(
                LINE_TTML, LINE_TTML, null, null, false, 60_000L);
        int inserted = doc.autoInsertInterludes();
        assertEquals(1, inserted);
        assertTrue(doc.hasInterludeAfter(0));
        assertTrue(doc.gapAfter(0) >= 15_000L);
        assertEquals(25_000L, doc.lines.get(1).startMs);
    }

    @Test
    public void insertInterludeBetweenTightLinesCreatesRoomByShiftingFollowing() {
        LyricsEditorModel.Document doc = LyricsEditorModel.Document.fromTtml(
                LINE_TTML, LINE_TTML, null, null, false, 60_000L);
        // Line 1 is 25s..30s (5s), Line 2 is 30s..35s -> tight boundary.
        // Force a very short span line by shortening line 1 first.
        doc.setLineStart(1, 28_000L, false);
        // Now line 1 is 28s..30s (2s totalSpan < 3.5s)
        assertTrue(doc.insertInterludeAfter(1, -1L));
        assertEquals(30_000L, doc.lines.get(1).endMs);
        assertEquals(38_000L, doc.lines.get(2).startMs);
        assertTrue(doc.hasInterludeAfter(1));
        assertEquals(8_000L, doc.gapAfter(1));
    }

    @Test
    public void cascadeShiftMovesSelectedLineAndAllFollowingTogether() {
        LyricsEditorModel.Document doc = LyricsEditorModel.Document.fromTtml(
                LINE_TTML, LINE_TTML, null, null, false, 60_000L);
        assertTrue(doc.nudgeLineStart(1, 1500L, true));
        assertEquals(5_000L, doc.lines.get(0).startMs); // untouched
        assertEquals(26_500L, doc.lines.get(1).startMs);
        assertEquals(31_500L, doc.lines.get(1).endMs);
        assertEquals(31_500L, doc.lines.get(2).startMs);
        assertEquals(36_500L, doc.lines.get(2).endMs);
    }

    @Test
    public void findAndReplaceRespectsLyricsReadingAndBothScopes() {
        LyricsEditorModel.Document doc = LyricsEditorModel.Document.fromTtml(
                LINE_TTML, LINE_TTML, null, null, false, 60_000L);
        int readReplaced = doc.findAndReplace("no", "NO", LyricsEditorModel.EditTab.READING, false);
        assertEquals(2, readReplaced);
        assertEquals("hoshi NO uta", doc.lines.get(0).reading);
        assertEquals("yoru NO kaze", doc.lines.get(1).reading);
        assertEquals("星の歌", doc.lines.get(0).text);
        assertTrue(doc.lines.get(0).readingEdited);

        int lyricReplaced = doc.findAndReplace("星", "空", LyricsEditorModel.EditTab.LYRICS, false);
        assertEquals(1, lyricReplaced);
        assertEquals("空の歌", doc.lines.get(0).text);
    }

    @Test
    public void splitLineDividesTextAndTimingProportionally() {
        LyricsEditorModel.Document doc = LyricsEditorModel.Document.fromTtml(
                LINE_TTML, LINE_TTML, null, null, false, 60_000L);
        doc.setLineText(1, "夜の風 朝の光");
        assertTrue(doc.splitLine(1, 3));
        assertEquals(4, doc.lines.size());
        assertEquals("夜の風", doc.lines.get(1).text);
        assertEquals("朝の光", doc.lines.get(2).text);
        assertEquals(25_000L, doc.lines.get(1).startMs);
        assertEquals(doc.lines.get(1).endMs, doc.lines.get(2).startMs);
        assertEquals(30_000L, doc.lines.get(2).endMs);
    }

    @Test
    public void bulkLrcRoundTripPreservesInterludeBoundaryAndReadings() {
        LyricsEditorModel.Document doc = LyricsEditorModel.Document.fromTtml(
                LINE_TTML, LINE_TTML, null, null, false, 60_000L);
        doc.insertInterludeAfter(0, 9_000L);
        String lrc = doc.exportBulkLrc();
        assertTrue(lrc.contains("[00:05.00] 星の歌"));
        assertTrue(lrc.contains("[00:09.00]"));
        assertTrue(lrc.contains("[00:25.00] 夜の風"));

        // Edit the LRC text to move interlude start to 00:10.50 and change line 2 text
        String edited = "[00:05.00] 星の歌\n[00:10.50]\n[00:25.00] 月の風\n[00:30.00] 朝が来る\n";
        LyricsEditorModel.BulkApplyResult result = doc.applyBulkLrc(edited);
        assertTrue(result.applied);
        assertEquals(1, result.interludesDetected);
        assertEquals(10_500L, doc.lines.get(0).endMs);
        assertEquals(25_000L, doc.lines.get(1).startMs);
        assertEquals("月の風", doc.lines.get(1).text);
        assertEquals("hoshi no uta", doc.lines.get(0).reading);
    }

    @Test
    public void parsesAndFormatsTimestampsAccurately() {
        assertEquals(83_450L, LyricsEditorModel.parseTimestamp("01:23.45"));
        assertEquals(83_450L, LyricsEditorModel.parseTimestamp("[1:23.45]"));
        assertEquals(83_450L, LyricsEditorModel.parseTimestamp("83.45"));
        assertEquals(3_661_500L, LyricsEditorModel.parseTimestamp("1:01:01.5"));
        assertEquals("01:23.45", LyricsEditorModel.formatTimestamp(83_450L));
        assertEquals(-1L, LyricsEditorModel.parseTimestamp("not-a-time"));
    }

    @Test
    public void lyricsInterludesLowersThresholdForAllDetectedInterludesIncludingLeadOffset() {
        Object editedSong = new Object();
        Object introSong = new Object();
        Object untouchedSong = new Object();
        LyricsInterludes.remember(editedSong,
                Collections.singletonList(new LyricsEditTtml.InterludeRange(10_000L, 12_800L)));
        LyricsInterludes.remember(introSong,
                Collections.singletonList(new LyricsEditTtml.InterludeRange(0L, 4_500L)));

        // Unregistered track always uses stock 7000ms threshold
        assertEquals(7000L, LyricsInterludes.thresholdFor(untouchedSong, 11_000L));

        // Covers Apple Music's -500ms (line-synced) and -750ms (word-synced) suggestedLineOffset
        assertEquals(LyricsInterludes.EXPLICIT_THRESHOLD_MS, LyricsInterludes.thresholdFor(editedSong, 9_250L));
        assertEquals(LyricsInterludes.EXPLICIT_THRESHOLD_MS, LyricsInterludes.thresholdFor(editedSong, 9_500L));
        assertEquals(LyricsInterludes.EXPLICIT_THRESHOLD_MS, LyricsInterludes.thresholdFor(editedSong, 10_000L));
        // Short 2.8s interlude remains eligible throughout the gap (Apple Music checks remaining deadline)
        assertEquals(LyricsInterludes.EXPLICIT_THRESHOLD_MS, LyricsInterludes.thresholdFor(editedSong, 12_300L));
        assertEquals(7000L, LyricsInterludes.thresholdFor(editedSong, 5_000L));
        assertEquals(7000L, LyricsInterludes.thresholdFor(editedSong, 12_800L));

        // Intro interlude is also active before the first tick (positionMs == -1)
        assertEquals(LyricsInterludes.EXPLICIT_THRESHOLD_MS, LyricsInterludes.thresholdFor(introSong, -1L));
        assertEquals(7000L, LyricsInterludes.thresholdFor(editedSong, -1L));

        // Tick tracking flows into zero-arg hook entrypoints
        LyricsInterludes.onTick(editedSong, 9_250L);
        assertEquals(LyricsInterludes.EXPLICIT_THRESHOLD_MS, LyricsInterludes.currentThresholdLong());
        assertEquals((int) LyricsInterludes.EXPLICIT_THRESHOLD_MS, LyricsInterludes.currentThresholdInt());

        // Redundant setActiveSong for the same SongInfoPtr keeps activePositionMs intact
        LyricsInterludes.setActiveSong(editedSong);
        assertEquals(LyricsInterludes.EXPLICIT_THRESHOLD_MS, LyricsInterludes.currentThresholdLong());

        // Switching to a different SongInfoPtr clears stale position from previous track
        LyricsInterludes.setActiveSong(introSong);
        assertEquals(LyricsInterludes.EXPLICIT_THRESHOLD_MS, LyricsInterludes.currentThresholdLong());

        LyricsInterludes.onTick(untouchedSong, 11_000L);
        assertEquals(7000L, LyricsInterludes.currentThresholdLong());
        assertEquals(7000, LyricsInterludes.currentThresholdInt());
    }

    @Test
    public void toDocumentEditIncludesAllQualifyingGapsEvenWithoutExplicitInterludeButton() {
        LyricsEditorModel.Document doc = LyricsEditorModel.Document.fromTtml(
                LINE_TTML, LINE_TTML, null, null, false, 60_000L);
        // Original LINE_TTML already has a 5s intro (0..5s). Manually trim line 0 end to create a 4s gap (21s..25s).
        assertTrue(doc.hasIntroInterlude());
        assertTrue(doc.setLineEnd(0, 21_000L));
        assertTrue(doc.hasInterludeAfter(0));

        LyricsEditTtml.DocumentEdit edit = doc.toDocumentEdit();
        assertEquals(2, edit.explicitInterludes.size());
        assertEquals(0L, edit.explicitInterludes.get(0).startMs);
        assertEquals(5_000L, edit.explicitInterludes.get(0).endMs);
        assertEquals(21_000L, edit.explicitInterludes.get(1).startMs);
        assertEquals(25_000L, edit.explicitInterludes.get(1).endMs);
    }

    @Test
    public void insertInterludeOnTight3500MsSpanStillGuaranteesMinimumDotGap() {
        LyricsEditorModel.Document doc = LyricsEditorModel.Document.fromTtml(
                LINE_TTML, LINE_TTML, null, null, false, 60_000L);
        // Make line 1 span exactly 3500ms (26500..30000)
        assertTrue(doc.setLineStart(1, 26_500L, false));
        assertTrue(doc.insertInterludeAfter(1, -1L));
        assertTrue(doc.hasInterludeAfter(1));
        assertTrue(doc.gapAfter(1) >= LyricsEditorModel.INTERLUDE_VISIBLE_MIN_MS);
    }

    @Test
    public void convertsUnsyncedPastedLyricsToSyncedWithUndoRedo() {
        String plainTtml = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
                + "<tt xmlns=\"http://www.w3.org/ns/ttml\" xmlns:ttm=\"http://www.w3.org/ns/ttml#metadata\" "
                + "xmlns:itunes=\"http://music.apple.com/lyric-ttml-internal\" itunes:timing=\"None\" xml:lang=\"ja\">"
                + "<head><metadata><ttm:agent type=\"person\" xml:id=\"v1\"/></metadata></head>"
                + "<body dur=\"00:30.000\"><div>"
                + "<p itunes:key=\"L1\">最初の行</p>"
                + "<p itunes:key=\"L2\">次の行</p>"
                + "</div></body></tt>";

        LyricsEditorModel.Document doc = LyricsEditorModel.Document.fromTtml(
                plainTtml, plainTtml, null, null, false, 30_000L);
        assertFalse(doc.synced);
        assertTrue(doc.convertToSynced());
        assertTrue(doc.synced);
        assertEquals(0L, doc.lines.get(0).startMs);
        assertTrue(doc.lines.get(1).startMs > 0L);

        assertTrue(doc.undo());
        assertFalse(doc.synced);
        assertTrue(doc.redo());
        assertTrue(doc.synced);
    }
}
