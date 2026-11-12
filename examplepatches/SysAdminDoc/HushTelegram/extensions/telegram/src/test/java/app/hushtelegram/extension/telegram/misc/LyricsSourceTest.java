/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import java.util.Arrays;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class LyricsSourceTest {
    @Test public void anUntaggedFileNameGivesTheArtistAndLosesTheVideoWords() {
        assertArrayEquals(new String[] {"One More Time", "Daft Punk"},
                LyricsSource.terms("Daft Punk - One More Time (Official Video).mp3", ""));
        assertArrayEquals(new String[] {"Hurt", "Johnny Cash"},
                LyricsSource.terms("Hurt [Lyric Video]", " Johnny Cash "));
        // A title's own brackets stay, and a dash in a tagged title isn't an artist.
        assertArrayEquals(new String[] {"Blue (Da Ba Dee)", "Eiffel 65"},
                LyricsSource.terms("Blue (Da Ba Dee)", "Eiffel 65"));
        assertArrayEquals(new String[] {"Side A - Side B", "Band"},
                LyricsSource.terms("Side A - Side B", "Band"));
    }

    @Test public void theSearchNamesTheTitleAndArtistOrAsksLooselyWithoutOne() {
        assertEquals("https://lrclib.net/api/search?track_name=One+More+Time&artist_name=Daft+Punk",
                LyricsSource.address("One More Time", "Daft Punk"));
        assertEquals("https://lrclib.net/api/search?q=One+More+Time",
                LyricsSource.address("One More Time", ""));
        assertEquals("https://lrclib.net/api/search?q=One+More+Time+Daft+Punk",
                LyricsSource.looseAddress("One More Time", "Daft Punk"));
    }

    @Test public void timedLinesComeOutInOrderWithRepeatsWordTimesAndTheOffsetApplied() {
        List<LyricsSource.Line> lines = LyricsSource.parse("[ar:Someone]\r\n"
                + "[offset:+500]\r\n"
                + "[00:12.30][01:02.5]Chorus line\r\n"
                + "[00:05.00]<00:05.10>First <00:05.60>words\n"
                + "not timed\n"
                + "[00:00.20]Too early");
        assertEquals(Arrays.asList(0L, 4500L, 11800L, 62000L), times(lines));
        assertEquals("Too early", lines.get(0).text);
        assertEquals("First words", lines.get(1).text);
        assertEquals("Chorus line", lines.get(2).text);
        assertEquals("Chorus line", lines.get(3).text);
        assertTrue(LyricsSource.parse("Just words\nNo times").isEmpty());
    }

    @Test public void theLineBeingSungIsTheLastOneThatStarted() {
        List<LyricsSource.Line> lines = LyricsSource.parse("[00:01]a\n[00:02]b\n[00:03]c");
        assertEquals(-1, LyricsSource.at(lines, 500));
        assertEquals(0, LyricsSource.at(lines, 1000));
        assertEquals(1, LyricsSource.at(lines, 2500));
        assertEquals(2, LyricsSource.at(lines, 99_000));
        assertEquals(-1, LyricsSource.at(LyricsSource.parse(""), 1000));
    }

    @Test public void timedLyricsAsLongAsTheSongWinOverPlainOnes() throws Exception {
        JSONArray results = new JSONArray()
                .put(new JSONObject().put("duration", 200).put("syncedLyrics", "[00:01.00]Wrong length"))
                .put(new JSONObject().put("duration", 241).put("plainLyrics", " Plain words ")
                        .put("syncedLyrics", JSONObject.NULL))
                .put(new JSONObject().put("duration", 239).put("syncedLyrics", "[00:01.00]Right"));
        LyricsSource.Found found = LyricsSource.choose(results, 240);
        assertNull(found.plain);
        assertEquals("Right", found.lines.get(0).text);

        found = LyricsSource.choose(new JSONArray().put(results.get(1)), 240);
        assertNull(found.lines);
        assertEquals("Plain words", found.plain);

        // An unknown song length takes the first one, and only wrong lengths find nothing.
        assertEquals("Wrong length", LyricsSource.choose(results, 0).lines.get(0).text);
        assertNull(LyricsSource.choose(new JSONArray().put(results.get(0)), 240));
        assertNull(LyricsSource.choose(new JSONArray(), 240));
    }

    @Test public void anInstrumentalWithNoWordsSaysSo() throws Exception {
        JSONArray results = new JSONArray().put(new JSONObject().put("duration", 180).put("instrumental", true)
                .put("plainLyrics", "").put("syncedLyrics", JSONObject.NULL));
        LyricsSource.Found found = LyricsSource.choose(results, 181);
        assertTrue(found.instrumental);
        assertNull(found.lines);
        assertNull(found.plain);
    }

    private static List<Long> times(List<LyricsSource.Line> lines) {
        Long[] times = new Long[lines.size()];
        for (int i = 0; i < times.length; i++) times[i] = lines.get(i).ms;
        return Arrays.asList(times);
    }
}
