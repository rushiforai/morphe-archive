package app.ayham.extension.music.addons;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.nio.charset.StandardCharsets;

import org.junit.Test;

/** protocol.md 8.1.6: an HLS playlist or a DASH manifest is never kept in the audio cache (as file-cache.js isManifest). */
public class StreamCacheManifestTest {
    private static byte[] b(String s) {
        return s.getBytes(StandardCharsets.UTF_8);
    }

    @Test
    public void aManifestIsKnownByItsTypeOrItsFirstBytes() {
        assertTrue(StreamCache.isManifest(null, "application/vnd.apple.mpegurl"));
        assertTrue(StreamCache.isManifest(null, "application/dash+xml; charset=utf-8"));
        assertTrue(StreamCache.isManifest(b("#EXTM3U\n#EXT-X-VERSION:3\n"), null));
        assertTrue(StreamCache.isManifest(b("﻿  #EXTM3U\n"), null));
        assertTrue(StreamCache.isManifest(b("<?xml version=\"1.0\"?>\n<MPD xmlns=\"urn:mpeg:dash:schema:mpd:2011\">"), null));
        assertTrue(StreamCache.isManifest(b("<MPD>"), null));
    }

    @Test
    public void audioIsNot() {
        assertFalse(StreamCache.isManifest(null, "audio/flac"));
        assertFalse(StreamCache.isManifest(b("fLaC\0\0\0\"\u0010\u0000"), "audio/flac"));
        assertFalse(StreamCache.isManifest(b("ID3\u0004\0\0\0\0\0#EXTM3U"), null));
        assertFalse(StreamCache.isManifest(b("<MPDX>"), null));
        assertFalse(StreamCache.isManifest(new byte[0], null));
    }

    @Test
    public void aLowercaseOrCommentedMpdAndEveryManifestTypeCount() {
        assertTrue(StreamCache.isManifest(b("<mpd xmlns=\"urn:mpeg:dash:schema:mpd:2011\">"), null));
        assertTrue(StreamCache.isManifest(b("<?xml version=\"1.0\"?>\n<!-- made by a packager -->\n<Mpd>"), null));
        assertTrue(StreamCache.isManifest(b("<!-- a\nmulti-line comment -->  <!-- two --><MPD/>"), null));
        assertTrue(StreamCache.isManifest(null, "application/x-mpegURL"));
        assertTrue(StreamCache.isManifest(null, "Application/Vnd.Apple.MpegUrl"));
        assertTrue(StreamCache.isManifest(null, "application/dash+xml"));
        assertFalse(StreamCache.isManifest(b("<!-- a comment --><html>"), null));
        assertFalse(StreamCache.isManifest(b("<mpdx>"), null));
    }

    @Test
    public void anMpdAfterADoctypeIsAManifest() {
        assertTrue(StreamCache.isManifest(b("<!DOCTYPE MPD>\n<MPD>"), null));
        assertTrue(StreamCache.isManifest(b("<?xml version=\"1.0\"?>\n<!doctype mpd SYSTEM \"x.dtd\"><!-- c --><mpd xmlns=\"urn:mpeg:dash:schema:mpd:2011\">"), null));
        assertFalse(StreamCache.isManifest(b("<!DOCTYPE html><html>"), null));
    }

    @Test
    public void aContentRangeIsReadWhole() {
        assertArrayEquals(new long[]{0, 5_000_000}, StreamCache.contentRange("bytes 0-1048575/5000000"));
        assertArrayEquals(new long[]{1_048_576, 5_000_000}, StreamCache.contentRange(" bytes 1048576-2097151/5000000 "));
        assertArrayEquals(new long[]{1_048_576, -1}, StreamCache.contentRange("bytes 1048576-2097151/*"));
        assertArrayEquals(new long[]{1_048_576, 1_048_600}, StreamCache.contentRange("bytes 1048576-1048599/1048600"));
    }

    @Test
    public void aContentRangeThatDoesntAddUpIsUnreadable() {
        assertNull(StreamCache.contentRange(null));
        assertNull(StreamCache.contentRange(""));
        assertNull(StreamCache.contentRange("bytes */100"));            // a 416's form
        assertNull(StreamCache.contentRange("bytes 0-100/100"));        // the end past the total
        assertNull(StreamCache.contentRange("bytes 200-100/1000"));     // the end before the start
        assertNull(StreamCache.contentRange("bytes 0-100"));
        assertNull(StreamCache.contentRange("bytes 0-1/99999999999999999999"));
        assertNull(StreamCache.contentRange("items 0-1/2"));
    }

    @Test
    public void aRowsKeptFileIsKeyedByTheQualityAsked() {
        String lossless = StreamCache.rowKey("addon.example", "row1", Pick.LOSSLESS, null, "flac");
        String hiRes = StreamCache.rowKey("addon.example", "row1", Pick.HIRES, null, "flac");
        String picked = StreamCache.rowKey("addon.example", "row1", Pick.HIRES, "HI_RES_LOSSLESS", "flac");
        assertFalse(lossless.equals(hiRes));
        assertFalse(hiRes.equals(picked));
        // "Upgrade quality" drops by the row's prefix: it still reaches every quality's copy
        String prefix = StreamCache.key("addon.example", "row1_");
        assertTrue(lossless.startsWith(prefix) && hiRes.startsWith(prefix) && picked.startsWith(prefix));
    }
}
