/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-13.
 */
package app.morphe.extension.music.patches.lyrics.requests;

import static org.junit.Assert.*;

import java.lang.reflect.Method;
import org.junit.Test;
import app.morphe.extension.music.patches.lyrics.Lyrics;

public class LocalLyricsSyncedTest {
    private static Lyrics parse(String raw) throws Exception {
        Method parse = LocalLyricsFetcher.class.getDeclaredMethod("parse", String.class);
        parse.setAccessible(true);
        return (Lyrics) parse.invoke(null, raw);
    }

    @Test public void ordinaryLineTimestampsAreSyncedWithoutKaraoke() throws Exception {
        Lyrics lyrics = parse("[ti:Title]\n[00:12.34]First line\n[00:15.67]Second line");
        assertNotNull(lyrics);
        assertTrue(lyrics.synced());
        assertEquals(2, lyrics.lines().size());
        assertFalse(lyrics.lines().get(0).hasWords());
        assertEquals(12340, lyrics.lines().get(0).startTimeMs());
    }

    @Test public void enhancedLrcStaysSynced() throws Exception {
        Lyrics lyrics = parse("[00:12.34]<00:12.34>Hello<00:12.80> world<00:13.50>\n[00:15.67]Next");
        assertNotNull(lyrics);
        assertTrue(lyrics.synced());
        assertTrue(lyrics.lines().get(0).hasWords());
    }

    @Test public void plainAndEmptyInputAreNotSynced() throws Exception {
        assertFalse(parse("First line\nSecond line").synced());
        assertNull(parse(""));
        assertNull(parse(null));
        // Metadata without content lines has no lyrics, rather than an unsynchronized lyric object.
        assertNull(parse("[ti:Title]\n[ar:Artist]"));
    }
}
