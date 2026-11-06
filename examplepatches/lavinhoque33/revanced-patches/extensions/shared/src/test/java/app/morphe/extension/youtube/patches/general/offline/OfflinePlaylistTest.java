/*
 * Copyright (C) 2026 lavinhoque33
 *
 * This file is part of the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-05.
 */
package app.morphe.extension.youtube.patches.general.offline;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.json.JSONObject;
import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

public class OfflinePlaylistTest {
    @Test public void observedTedPlaylistIsAcceptedAsAnIdAndAsALink() {
        String playlistId = "PLV7xfBoJKBNQ3yhYgQRqocSWs1MKF7j0n";
        assertTrue(OfflinePlaylist.isValidId(playlistId));
        assertEquals(playlistId, OfflinePlaylist.parseId("  " + playlistId + "  "));
        assertEquals(playlistId, OfflinePlaylist.parseId("https://www.youtube.com/playlist?list=" + playlistId));
    }

    @Test public void unavailableAndEmptyResultsCannotReachFirstVideoAccess() {
        assertFalse(OfflinePlaylist.hasVideos(null));
        assertFalse(OfflinePlaylist.hasVideos(new OfflinePlaylist.Result("TED", List.of())));
    }

    @Test public void populatedResultWithUnknownDurationCanBeDisplayed() {
        var playlist = new OfflinePlaylist.Result("TED", List.of(
                new OfflinePlaylist.Entry("iG9CE55wbtY", "First talk", 0)));
        assertTrue(OfflinePlaylist.hasVideos(playlist));
        var items = OfflinePlaylistSelection.from(playlist.entries(), key -> false);
        assertEquals(1, items.size());
        assertEquals("iG9CE55wbtY", items.get(0).videoId());
        assertTrue(items.get(0).selected());
    }

    /** The shape of the mobile web browse response for the TED playlist, reduced to the fields that are read. */
    private static final String MWEB_PAGE = """
            {"header": {"pageHeaderRenderer": {"pageTitle": "TED: The most popular talks of all time"}},
             "contents": {"singleColumnBrowseResultsRenderer": {"tabs": [{"tabRenderer": {"content":
               {"sectionListRenderer": {"contents": [{"itemSectionRenderer": {"contents": [
                {"lockupViewModel": {"contentId": "iG9CE55wbtY", "contentType": "LOCKUP_CONTENT_TYPE_VIDEO",
                 "contentImage": {"thumbnailViewModel": {"overlays": [{"thumbnailBottomOverlayViewModel":
                   {"badges": [{"thumbnailBadgeViewModel": {"text": "20:04"}}]}}]}},
                 "metadata": {"lockupMetadataViewModel": {"title":
                   {"content": "Do schools kill creativity? | Sir Ken Robinson | TED"}}}}},
                {"lockupViewModel": {"contentId": "Ks-_Mh1QhMc", "contentType": "LOCKUP_CONTENT_TYPE_VIDEO",
                 "metadata": {"lockupMetadataViewModel": {"title": {"content": "Your Body Language"}}}}},
                {"lockupViewModel": {"contentId": "PLV7xfBoJKBNQ3yhYgQRqocSWs1MKF7j0n",
                 "contentType": "LOCKUP_CONTENT_TYPE_PLAYLIST"}},
                {"continuationItemViewModel": {"continuationCommand": {"innertubeCommand":
                  {"continuationCommand": {"token": "TOKEN_BROWSE"}}}}}
               ]}}]}}}}]}}}
            """;

    @Test public void mobileWebPageListsOnlyTheVideosWithTheirDurations() throws Exception {
        List<OfflinePlaylist.Entry> entries = new ArrayList<>();
        List<String> tokens = new ArrayList<>();
        JSONObject page = new JSONObject(MWEB_PAGE);

        OfflinePlaylist.collect(page, entries, tokens);

        assertEquals("TED: The most popular talks of all time", OfflinePlaylist.parseTitle(page));
        assertEquals(List.of("iG9CE55wbtY", "Ks-_Mh1QhMc"),
                entries.stream().map(OfflinePlaylist.Entry::videoId).toList());
        assertEquals(1_204_000L, entries.get(0).lengthMs());
        assertEquals(0L, entries.get(1).lengthMs());
        assertEquals(List.of("TOKEN_BROWSE"), tokens);
    }

    @Test public void legacyRendererAndPageWithoutVideosAreBothHandled() throws Exception {
        List<OfflinePlaylist.Entry> entries = new ArrayList<>();
        List<String> tokens = new ArrayList<>();

        OfflinePlaylist.collect(new JSONObject("{\"contents\": [{\"playlistVideoRenderer\": {\"videoId\": "
                + "\"iG9CE55wbtY\", \"title\": {\"runs\": [{\"text\": \"First\"}]}, "
                + "\"lengthText\": {\"simpleText\": \"1:02:03\"}}}]}"), entries, tokens);
        assertEquals(1, entries.size());
        assertEquals(3_723_000L, entries.get(0).lengthMs());

        entries.clear();
        OfflinePlaylist.collect(new JSONObject("{\"contents\": {}}"), entries, tokens);
        assertTrue(entries.isEmpty());
        assertTrue(tokens.isEmpty());
    }
}
