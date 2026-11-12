/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-08.
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.*;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.junit.Test;

import java.io.IOException;
import java.util.List;

/** The pages are synthetic but have the shape of the real responses (a private playlist with a deleted track). */
public class PlaylistPageTest {
    private static final String FIRST = "AAAAAAAAAAA";
    private static final String SECOND = "BBBBBBBBBBB";
    private static final String THIRD = "CCCCCCCCCCC";
    private static final String GHOST = PlaylistPage.UNAVAILABLE;

    private static JSONObject track(String videoId) throws JSONException {
        JSONObject data = new JSONObject().put("playlistSetVideoId", "set-" + videoId).put("videoId", videoId);
        JSONObject watch = new JSONObject().put("watchEndpoint", new JSONObject().put("videoId", videoId));
        return new JSONObject().put("musicTwoColumnItemRenderer", new JSONObject().put("playlistItemData", data)
                .put("navigationEndpoint", watch));
    }

    /** What the service sends for a deleted, private or blocked track: greyed out, no video id, a toast on tap. */
    private static JSONObject unavailable() throws JSONException {
        JSONObject toast = new JSONObject().put("addToToastAction", new JSONObject().put("item",
                new JSONObject().put("notificationActionRenderer", new JSONObject().put("responseText",
                        new JSONObject().put("runs", new JSONArray().put(new JSONObject()
                                .put("text", "Content is unavailable")))))));
        return new JSONObject().put("musicTwoColumnItemRenderer", new JSONObject()
                .put("playlistItemData", new JSONObject().put("playlistSetVideoId", "set-ghost"))
                .put("navigationEndpoint", toast)
                .put("musicItemRendererDisplayPolicy", "MUSIC_ITEM_RENDERER_DISPLAY_POLICY_GREY_OUT"));
    }

    private static JSONObject addASong() throws JSONException {
        return new JSONObject().put("musicTwoColumnItemRenderer", new JSONObject().put("navigationEndpoint",
                new JSONObject().put("searchEndpoint", new JSONObject().put("query", ""))));
    }

    private static JSONObject continuationItem(String token) throws JSONException {
        return new JSONObject().put("continuationItemRenderer", new JSONObject().put("continuationEndpoint",
                new JSONObject().put("continuationCommand", new JSONObject().put("token", token))));
    }

    private static JSONObject firstPage(JSONObject... rows) throws JSONException {
        JSONArray contents = new JSONArray();
        for (JSONObject row : rows) contents.put(row);
        return new JSONObject().put("contents", new JSONObject().put("twoColumnBrowseResultsRenderer",
                new JSONObject().put("secondaryContents", new JSONObject().put("sectionListRenderer",
                        new JSONObject().put("contents", new JSONArray().put(new JSONObject().put(
                                "musicPlaylistShelfRenderer", new JSONObject().put("contents", contents))))))));
    }

    private static JSONObject nextPage(JSONObject... rows) throws JSONException {
        JSONArray items = new JSONArray();
        for (JSONObject row : rows) items.put(row);
        return new JSONObject().put("onResponseReceivedActions", new JSONArray().put(new JSONObject().put(
                "appendContinuationItemsAction", new JSONObject().put("continuationItems", items))));
    }

    @Test public void anUnavailableRowBetweenTwoTracksKeepsItsPlace() throws Exception {
        PlaylistPage.Page page = PlaylistPage.read(firstPage(track(FIRST), unavailable(), track(SECOND)));
        assertEquals(List.of(FIRST, GHOST, SECOND), page.videoIds());
        assertNull(page.continuation());
    }

    @Test public void onlyTheAvailableTracksAreDownloaded() throws Exception {
        PlaylistPage.Page page = PlaylistPage.read(firstPage(track(FIRST), unavailable(), track(SECOND)));
        assertEquals(List.of(FIRST, SECOND), PlaylistPage.available(page.videoIds()));
    }

    @Test public void aContinuationPageKeepsUnavailableRowsAndPassesTheNextToken() throws Exception {
        PlaylistPage.Page first = PlaylistPage.read(firstPage(track(FIRST), continuationItem("page-2")));
        assertEquals(List.of(FIRST), first.videoIds());
        assertEquals("page-2", first.continuation());

        PlaylistPage.Page next = PlaylistPage.read(nextPage(unavailable(), track(SECOND), continuationItem("page-3")));
        assertEquals(List.of(GHOST, SECOND), next.videoIds());
        assertEquals("page-3", next.continuation());
    }

    @Test public void duplicateTracksStayAtTheirPositions() throws Exception {
        PlaylistPage.Page page = PlaylistPage.read(firstPage(track(FIRST), unavailable(), track(FIRST), track(FIRST)));
        assertEquals(List.of(FIRST, GHOST, FIRST, FIRST), page.videoIds());
    }

    @Test public void theAddASongRowIsNotATrackAndHasNoPosition() throws Exception {
        PlaylistPage.Page page = PlaylistPage.read(firstPage(addASong(), track(FIRST), unavailable(), track(THIRD)));
        assertEquals(List.of(FIRST, GHOST, THIRD), page.videoIds());
    }

    @Test public void aRowWithoutAVideoIdThatIsNotGreyedOutFailsThePage() throws Exception {
        JSONObject broken = new JSONObject().put("musicTwoColumnItemRenderer", new JSONObject()
                .put("playlistItemData", new JSONObject().put("playlistSetVideoId", "set-broken")));
        try {
            PlaylistPage.read(firstPage(track(FIRST), broken));
            fail("a malformed row must fail the page");
        } catch (IOException expected) {
            assertTrue(expected.getMessage().contains("no video id"));
        }
    }

    @Test public void aGreyedOutRowThatNamesAVideoIsStillATrack() throws Exception {
        JSONObject row = track(SECOND);
        row.getJSONObject("musicTwoColumnItemRenderer").put("musicItemRendererDisplayPolicy",
                "MUSIC_ITEM_RENDERER_DISPLAY_POLICY_GREY_OUT");
        assertEquals(List.of(FIRST, SECOND), PlaylistPage.read(firstPage(track(FIRST), row)).videoIds());
    }

    @Test public void aResponseWithoutAShelfFails() {
        try {
            PlaylistPage.read(new JSONObject());
            fail("a page without a shelf must fail");
        } catch (IOException expected) {
            assertTrue(expected.getMessage().contains("playlist shelf"));
        }
    }

    @Test public void aPlaylistOfOnlyUnavailableTracksHasNothingToDownload() throws Exception {
        PlaylistPage.Page page = PlaylistPage.read(firstPage(unavailable(), unavailable()));
        assertEquals(List.of(GHOST, GHOST), page.videoIds());
        assertTrue(PlaylistPage.available(page.videoIds()).isEmpty());
    }
}
