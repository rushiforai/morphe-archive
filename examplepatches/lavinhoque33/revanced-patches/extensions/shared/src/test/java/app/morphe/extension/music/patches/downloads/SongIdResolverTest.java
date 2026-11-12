/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-10.
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Test;

import java.util.List;

public class SongIdResolverTest {
    private static final String OMV = "4NRXx6U8ABQ";
    private static final String ATV = "J7p4bzqLvCw";

    private static SongIdResolver.Video video(String title, String channel, long seconds) {
        return new SongIdResolver.Video(OMV, title, channel, seconds);
    }

    private static SongIdResolver.Row row(String id, String title, String artist, long seconds) {
        return new SongIdResolver.Row(id, title, artist, seconds);
    }

    private static WatchQueueLogic.NextItem item(String id, String counterpartId, String counterpartType) {
        return new WatchQueueLogic.NextItem(0, "wrapper", id, "OMV", "t", "a", "3:20", counterpartId,
                counterpartType, "3:22");
    }

    @Test public void onlyAMusicVideoTypeHasASongToFind() {
        assertTrue(SongIdResolver.isMusicVideo(true, SongIdResolver.TYPE_VIDEO));
        assertFalse(SongIdResolver.isMusicVideo(true, SongIdResolver.TYPE_SONG));
        assertFalse(SongIdResolver.isMusicVideo(false, 0));
        assertFalse(SongIdResolver.isMusicVideo(true, 3));
    }

    @Test public void theQueuesOwnTypeDecidesWhetherTheVideoIsAMusicVideo() {
        WatchQueueLogic.NextItem asVideo = new WatchQueueLogic.NextItem(0, "plain", OMV, "OMV", "t", "a", "3:20",
                "", "", "");
        WatchQueueLogic.NextItem asSong = new WatchQueueLogic.NextItem(0, "plain", OMV, "ATV", "t", "a", "3:20",
                "", "", "");
        assertTrue(SongIdResolver.isMusicVideo(OMV, List.of(asVideo), false));
        assertFalse(SongIdResolver.isMusicVideo(OMV, List.of(asSong), true));
        assertTrue(SongIdResolver.isMusicVideo(OMV, List.of(), true));
        assertTrue(SongIdResolver.isMusicVideo(OMV, null, true));
        assertFalse(SongIdResolver.isMusicVideo(OMV, null, false));
    }

    @Test public void theQueueNamesTheSongWhenItPairsTheVideoWithAnAudioCounterpart() {
        assertEquals(ATV, SongIdResolver.fromQueue(OMV, List.of(item(OMV, ATV, "ATV"))));
    }

    @Test public void aQueueWithoutAPairNamesNothing() {
        assertNull(SongIdResolver.fromQueue(OMV, List.of(item(OMV, "", ""))));
        assertNull(SongIdResolver.fromQueue(OMV, List.of(item("other123456", ATV, "ATV"))));
        assertNull(SongIdResolver.fromQueue(OMV, List.of(item(OMV, ATV, "OMV"))));
        assertNull(SongIdResolver.fromQueue(OMV, List.of(item(OMV, OMV, "ATV"))));
    }

    @Test public void theSearchTakesTheRowWithTheTitleTheLengthAndTheArtistOfTheVideo() {
        SongIdResolver.Video video = video("The Weeknd - Blinding Lights (Official Video)", "TheWeekndVEVO", 262);
        List<SongIdResolver.Row> rows = List.of(
                row("cover123456", "Blinding Lights", "Some Cover Band", 200),
                row(ATV, "Blinding Lights", "The Weeknd", 202));
        // The cover has another artist and the song has another length than this 4:22 cut: nothing is taken.
        assertNull(SongIdResolver.fromSearch(video, rows));
        assertEquals(ATV, SongIdResolver.fromSearch(video("The Weeknd - Blinding Lights (Official Video)",
                "TheWeekndVEVO", 215), rows));
    }

    @Test public void aTitleWithoutTheArtistNeedsTheChannelToAgree() {
        List<SongIdResolver.Row> rows = List.of(row(ATV, "Blinding Lights", "The Weeknd", 202));
        assertEquals(ATV, SongIdResolver.fromSearch(video("Blinding Lights", "The Weeknd", 200), rows));
        assertEquals(ATV, SongIdResolver.fromSearch(video("Blinding Lights (Official Music Video)",
                "TheWeekndVEVO", 200), rows));
        assertNull(SongIdResolver.fromSearch(video("Blinding Lights", "Some Label", 200), rows));
    }

    @Test public void theSearchNeverTakesTheVideoItselfOrAnotherTitleOrAnUnknownLength() {
        SongIdResolver.Video video = video("Blinding Lights", "The Weeknd", 200);
        assertNull(SongIdResolver.fromSearch(video, List.of(row(OMV, "Blinding Lights", "The Weeknd", 200))));
        assertNull(SongIdResolver.fromSearch(video, List.of(row(ATV, "After Hours", "The Weeknd", 200))));
        assertNull(SongIdResolver.fromSearch(video, List.of(row(ATV, "Blinding Lights", "The Weeknd", 0))));
        assertNull(SongIdResolver.fromSearch(video("Blinding Lights", "The Weeknd", 0),
                List.of(row(ATV, "Blinding Lights", "The Weeknd", 200))));
    }

    @Test public void theFirstMatchingRowWins() {
        SongIdResolver.Video video = video("Blinding Lights", "The Weeknd", 200);
        assertEquals(ATV, SongIdResolver.fromSearch(video, List.of(
                row(ATV, "Blinding Lights", "The Weeknd", 202),
                row("second12345", "Blinding Lights", "The Weeknd", 203))));
    }

    @Test public void theQueryIsTheTitleWithoutTheVideoMarks() {
        assertEquals("the weeknd blinding lights",
                SongIdResolver.query(video("The Weeknd - Blinding Lights (Official Video)", "x", 1)));
    }

    @Test public void searchRowsAreReadFromTheResponse() throws Exception {
        JSONObject response = new JSONObject().put("contents", new JSONArray().put(new JSONObject().put(
                "musicShelfRenderer", new JSONObject().put("contents", new JSONArray()
                        .put(rowJson(ATV, "Blinding Lights", "The Weeknd \u2022 After Hours \u2022 3:22"))
                        .put(rowJson("noduration12", "No Length", "Artist"))
                        .put(rowJson("", "No Id", "Artist \u2022 1:00"))))));
        List<SongIdResolver.Row> rows = SongIdResolver.readSearch(response);
        assertEquals(1, rows.size());
        assertEquals(new SongIdResolver.Row(ATV, "Blinding Lights", "The Weeknd", 202), rows.get(0));
    }

    private static JSONObject rowJson(String id, String title, String subtitle) throws Exception {
        JSONObject renderer = new JSONObject()
                .put("playlistItemData", id.isEmpty() ? new JSONObject() : new JSONObject().put("videoId", id))
                .put("flexColumns", new JSONArray().put(column(title)).put(column(subtitle)));
        return new JSONObject().put("musicResponsiveListItemRenderer", renderer);
    }

    private static JSONObject column(String text) throws Exception {
        return new JSONObject().put("musicResponsiveListItemFlexColumnRenderer", new JSONObject().put("text",
                new JSONObject().put("runs", new JSONArray().put(new JSONObject().put("text", text)))));
    }
}
