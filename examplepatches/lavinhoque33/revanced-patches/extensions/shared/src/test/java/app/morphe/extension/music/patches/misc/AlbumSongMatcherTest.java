/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-12.
 */
package app.morphe.extension.music.patches.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Test;

import app.morphe.extension.music.patches.album.PlaylistRequest.Song;

public class AlbumSongMatcherTest {
    private static final Song FIRST = new Song("lYBUbBu4W08", "Never Gonna Give You Up", "Rick Astley", 213);
    private static final Song SECOND = new Song("raBobo3GZYA", "Whenever You Need Somebody", "Rick Astley", 232);
    private static final Song THIRD = new Song("i_Q88T1HI_w", "Together Forever", "Rick Astley", 204);

    private static JSONObject source(String id, String title, String artist, String length) throws Exception {
        return new JSONObject().put("videoId", id).put("title", text(title))
                .put("longBylineText", text(artist)).put("lengthText", text(length));
    }

    private static JSONObject text(String value) throws Exception {
        return new JSONObject().put("runs", new JSONArray().put(new JSONObject().put("text", value)));
    }

    @Test public void repeatedPlayerResponseIndicesCannotSelectTrackOne() throws Exception {
        Song[] album = {FIRST, SECOND, THIRD};
        // Both requests used the first track's position on Moto; an index is deliberately not an input.
        assertEquals(SECOND, AlbumSongMatcher.match("BeyEGebJ1l4", source("BeyEGebJ1l4",
                "Rick Astley - Whenever You Need Somebody (Official Video)", "Rick Astley", "3:52"), album));
        assertEquals(THIRD, AlbumSongMatcher.match("yPYZpwSpKmA", source("yPYZpwSpKmA",
                "Rick Astley - Together Forever (Official Video)", "Rick Astley", "3:24"), album));
    }

    @Test public void responseRowOrderDoesNotChangeTheAssociationOrItsMetadata() throws Exception {
        Song matched = AlbumSongMatcher.match("yPYZpwSpKmA", source("yPYZpwSpKmA",
                "Together Forever", "Rick Astley", "3:24"), new Song[]{THIRD, FIRST, SECOND});
        assertEquals(THIRD, matched);
        assertEquals("Together Forever", matched.title());
        assertEquals("Rick Astley", matched.artist());
        assertEquals(204, matched.durationSeconds());
    }

    @Test public void metadataOfAnotherVideoNeverNamesTheRequestedVideosSong() throws Exception {
        assertNull(AlbumSongMatcher.match("yPYZpwSpKmA", source("BeyEGebJ1l4",
                SECOND.title(), SECOND.artist(), "3:52"), new Song[]{FIRST, SECOND, THIRD}));
    }

    @Test public void missingSourceOrArtistDoesNotFallBackToTheFirstAlbumRow() throws Exception {
        assertNull(AlbumSongMatcher.match("yPYZpwSpKmA", null, new Song[]{FIRST}));
        assertNull(AlbumSongMatcher.match("yPYZpwSpKmA", source("yPYZpwSpKmA",
                FIRST.title(), "", "3:33"), new Song[]{FIRST}));
    }

    @Test public void differentRecordingVariantsStayUnmatched() throws Exception {
        assertNull(AlbumSongMatcher.match("yPYZpwSpKmA", source("yPYZpwSpKmA",
                "Together Forever (Live)", "Rick Astley", "3:24"), new Song[]{THIRD}));
    }

    @Test public void differentArtistOrDurationCannotResolve() throws Exception {
        assertNull(AlbumSongMatcher.match("yPYZpwSpKmA", source("yPYZpwSpKmA",
                "Together Forever", "Someone Else", "3:24"), new Song[]{THIRD}));
        assertNull(AlbumSongMatcher.match("yPYZpwSpKmA", source("yPYZpwSpKmA",
                "Together Forever", "Rick Astley", "7:00"), new Song[]{THIRD}));
    }

    @Test public void ambiguousRecordingsHaveNoAssociation() throws Exception {
        Song other = new Song("otherSong00", THIRD.title(), THIRD.artist(), THIRD.durationSeconds());
        assertNull(AlbumSongMatcher.match("yPYZpwSpKmA", source("yPYZpwSpKmA",
                THIRD.title(), THIRD.artist(), "3:24"), new Song[]{THIRD, other}));
    }

    @Test public void anAlbumEntryAlreadyUsingThisIdIsNotItsOwnCounterpart() throws Exception {
        assertNull(AlbumSongMatcher.match(THIRD.videoId(), source(THIRD.videoId(),
                THIRD.title(), THIRD.artist(), "3:24"), new Song[]{THIRD}));
    }

    @Test public void unicodeTitlesRemainDistinctAndMatchTheirRecording() throws Exception {
        Song song = new Song("unicode0000", "Песня", "Артист", 200);
        assertEquals(song, AlbumSongMatcher.match("unicodeOMV0", source("unicodeOMV0",
                "Артист - Песня", "Артист", "3:20"), new Song[]{FIRST, song}));
    }
}
