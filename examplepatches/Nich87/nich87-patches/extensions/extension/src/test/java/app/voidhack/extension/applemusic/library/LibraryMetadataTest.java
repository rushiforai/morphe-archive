package app.voidhack.extension.applemusic.library;

import org.junit.Test;

import java.io.IOException;
import java.util.Map;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertThrows;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

public class LibraryMetadataTest {
    @Test public void repairsRemainingRomanizedFieldsAfterTheTitleWasAlreadyFixed() {
        Map<String, String> stored = Map.of("minm", "星のダイアローグ", "asaa", "Starlight Kuku Gumi",
                "ascp", "Yuki Honda", "assn", "Hoshi no Dialogue", "ascm", "My own note");
        Map<String, String> catalog = Map.of("minm", "星のダイアローグ", "asaa", "スタァライト九九組",
                "ascp", "本多友紀", "assn", "ほしのだいあろーぐ");

        Map<String, String> changes = LibraryMetadata.differences(stored, catalog);

        assertEquals(Map.of("asaa", "スタァライト九九組", "ascp", "本多友紀", "assn", "ほしのだいあろーぐ"), changes);
    }

    @Test public void doesNotTreatAnOrdinaryForeignTitleDifferenceAsRomanization() {
        Map<String, String> changes = LibraryMetadata.differences(
                Map.of("minm", "My Song (Remastered)", "asar", "Example"),
                Map.of("minm", "My Song", "asar", "Example"));

        assertEquals(Map.of(), changes);
    }

    @Test public void romanizedFilterIgnoresGenreAndSortOnlyDifferences() {
        Map<String, String> stored = Map.of("minm", "星のダイアローグ", "asar", "スタァライト九九組", "asal", "星のダイアローグ - EP",
                "assn", "Hoshi no Dialogue", "asgn", "Anime");
        Map<String, String> catalog = Map.of("minm", "星のダイアローグ", "asar", "スタァライト九九組", "asal", "星のダイアローグ - EP",
                "assn", "ほしのだいあろーぐ", "asgn", "アニメ");

        assertFalse(LibraryMetadata.romanized(stored, catalog));
        assertTrue(LibraryMetadata.romanized(Map.of("minm", "Hoshi no Dialogue"), catalog));
        assertTrue(LibraryMetadata.romanized(Map.of("asar", "Starlight Kuku Gumi"), catalog));
    }

    @Test public void doesNotCreateChangesForEquivalentJapaneseUnicode() {
        Map<String, String> changes = LibraryMetadata.differences(
                Map.of("minm", "カ\u3099ラス", "asar", "歌手"), Map.of("minm", "ガラス", "asar", "歌手"));

        assertEquals(Map.of(), changes);
    }

    @Test public void omitsMissingCatalogDataAndPersonalLibraryProperties() {
        Map<String, String> changes = LibraryMetadata.differences(Map.of("minm", "Hoshi no Dialogue", "aspc", "50"),
                Map.of("minm", "星のダイアローグ", "asar", "", "aspc", "0", "asur", "100"));

        assertEquals(Map.of("minm", "星のダイアローグ"), changes);
    }

    @Test public void numericMetadataUsesUnsignedTwoByteValuesAndRejectsTruncation() throws Exception {
        assertArrayEquals(new byte[]{0x07, (byte) 0xe2}, MetadataField.YEAR.encode("2018"));
        for (String value : new String[]{"0", "-1", "65536", "one"}) {
            assertThrows(IOException.class, () -> MetadataField.TRACK_NUMBER.encode(value));
        }
        assertThrows(IOException.class, () -> MetadataField.forTag("aspc"));
    }

    @Test public void diagnosticFormatsSafeFailureDetailsAndRedactsExternalMessages() {
        LibraryDaap.Failure httpFailure = new LibraryDaap.Failure(LibraryDaap.Kind.HTTP, 403, "lookup_jp");
        assertEquals("stage=japanese (1200/1800) | HTTP (403) [lookup_jp]",
                LibraryMetadata.diagnostic("japanese", 1200, 1800, httpFailure));

        DaapCodec.FormatException codecError = new DaapCodec.FormatException("Too many DAAP fields (limit=200000, bytes=3000000)");
        assertEquals("stage=reading | Too many DAAP fields (limit=200000, bytes=3000000)",
                LibraryMetadata.diagnostic("reading", 0, 0, codecError));

        RuntimeException external = new RuntimeException("token=secret-value", new IOException("session-id=12345"));
        String summary = LibraryMetadata.diagnostic("connect", 0, 0, external);
        assertEquals("stage=connect | RuntimeException <- IOException", summary);
        assertFalse(summary.contains("secret-value"));
        assertFalse(summary.contains("12345"));

        String stack = LibraryMetadata.stackSummary(external);
        assertTrue(stack.contains("java.lang.RuntimeException"));
        assertTrue(stack.contains("java.io.IOException"));
        assertFalse(stack.contains("secret-value"));
        assertFalse(stack.contains("12345"));

        String report = LibraryMetadata.formatLogReport("2026-11-22T04:00:00Z", "7.0.2 (1624)", "Android 16 (API 36)",
                "en-ID", "scan", 2100, 1199, java.util.List.of("+0ms stage=connect start", "+1200ms stage=reading"),
                summary, external);
        assertTrue(report.contains("app=7.0.2 (1624)"));
        assertTrue(report.contains("tracks_raw=2100"));
        assertTrue(report.contains("tracks_library=1199"));
        assertTrue(report.contains("diagnostic=stage=connect | RuntimeException <- IOException"));
        assertTrue(report.contains("[timeline]"));
        assertTrue(report.contains("[stack]"));
        assertFalse(report.contains("secret-value"));
        assertFalse(report.contains("12345"));
    }
}
