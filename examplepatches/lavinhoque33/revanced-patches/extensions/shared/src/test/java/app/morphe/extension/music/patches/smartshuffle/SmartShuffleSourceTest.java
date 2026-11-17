/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-15.
 * Written by lavinhoque33, 2026-11-15.
 */
package app.morphe.extension.music.patches.smartshuffle;

import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Test;

import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.CancellationException;
import java.util.concurrent.atomic.AtomicBoolean;

import static org.junit.Assert.*;

public class SmartShuffleSourceTest {
    private static final String PLAYLIST = "PLsource";

    private static JSONObject row(String videoId) throws Exception {
        return new JSONObject().put("musicTwoColumnItemRenderer", new JSONObject()
                .put("navigationEndpoint", new JSONObject().put("watchEndpoint",
                        new JSONObject().put("videoId", videoId))));
    }

    private static JSONObject token(String type, String token) throws Exception {
        return new JSONObject().put(type, new JSONObject().put("continuation", token));
    }

    private static JSONObject tracks(int first, int end, String next) throws Exception {
        JSONArray rows = new JSONArray();
        for (int index = first; index < end; index++) rows.put(row("original-" + index));
        JSONObject shelf = new JSONObject().put("contents", rows);
        if (next != null) shelf.put("continuations", new JSONArray().put(token("nextContinuationData", next)));
        return shelf;
    }

    private static JSONObject initial(JSONObject tracks, boolean editable, String section) throws Exception {
        JSONObject sections = new JSONObject().put("contents", new JSONArray().put(new JSONObject()
                .put("musicPlaylistShelfRenderer", tracks)));
        if (section != null) sections.put("continuations", new JSONArray()
                .put(token("nextContinuationData", section)));
        JSONObject content = new JSONObject().put("sectionListRenderer", sections);
        JSONObject tab = new JSONObject().put("tabRenderer", new JSONObject().put("content", content));
        JSONObject browse = new JSONObject().put("tabs", new JSONArray().put(tab));
        JSONObject response = new JSONObject().put("contents",
                new JSONObject().put("singleColumnBrowseResultsRenderer", browse));
        if (editable) response.put("header", new JSONObject().put("musicEditablePlaylistDetailHeaderRenderer",
                new JSONObject().put("header", new JSONObject())));
        return response;
    }

    private static JSONObject continuation(String renderer, JSONObject contents) throws Exception {
        return new JSONObject().put("continuationContents", new JSONObject().put(renderer, contents));
    }

    private static JSONObject suggestion(String videoId) throws Exception {
        JSONObject item = row(videoId);
        JSONObject action = new JSONObject().put("action", "ACTION_ADD_VIDEO")
                .put("addedVideoId", videoId).put("dedupeOption", "DEDUPE_OPTION_CHECK");
        JSONObject suggestionCommand = new JSONObject().put("removeSuggestionCommand",
                new JSONObject().put("hideEnclosingAction", new JSONObject()));
        JSONObject endpoint = new JSONObject().put("playlistId", PLAYLIST).put("params", "opaque-edit%3D")
                .put("actions", new JSONArray().put(action))
                .put("clientActions", new JSONArray().put(new JSONObject()
                        .put("musicAddSuggestionToPlaylistCommand", suggestionCommand)));
        JSONObject command = new JSONObject().put("playlistEditEndpoint", endpoint);
        item.getJSONObject("musicTwoColumnItemRenderer").put("menu", new JSONObject().put("menuRenderer",
                new JSONObject().put("topLevelButtons", new JSONArray().put(new JSONObject().put("buttonRenderer",
                        new JSONObject().put("command", command))))));
        return item;
    }

    private static JSONObject suggestions(String reload, String... videoIds) throws Exception {
        JSONArray rows = new JSONArray();
        for (String videoId : videoIds) rows.put(suggestion(videoId));
        return new JSONObject().put("contents", rows).put("autoReloadWhenEmpty", true)
                .put("shelfDivider", new JSONObject().put("musicShelfDividerRenderer",
                        new JSONObject().put("hidden", true)))
                .put("continuations", new JSONArray().put(token("reloadContinuationData", reload)));
    }

    private static JSONObject radio(String continuation, String... videoIds) throws Exception {
        JSONArray rows = new JSONArray();
        for (String videoId : videoIds) rows.put(new JSONObject().put("playlistPanelVideoRenderer",
                new JSONObject().put("videoId", videoId)));
        JSONObject panel = new JSONObject().put("contents", rows);
        if (continuation != null) panel.put("continuations", new JSONArray()
                .put(token("nextRadioContinuationData", continuation)));
        return continuation("playlistPanelContinuation", panel);
    }

    private static JSONObject radioCommand(JSONObject response) throws Exception {
        JSONObject endpoint = new JSONObject().put("playlistId", "RDAMPL" + PLAYLIST)
                .put("params", "captured-opaque%3D")
                .put("watchPlaylistEndpointMusicConfig", new JSONObject()
                        .put("suggestedInitialPlayerMode", "MUSIC_WATCH_PLAYER_MODE_EXPANDED"));
        // Run 2: the radio is in the commandEntity menu envelope, not the visible header watch index.
        JSONObject navigation = new JSONObject().put("watchPlaylistEndpoint", endpoint);
        JSONObject item = new JSONObject().put("menuNavigationItemRenderer",
                new JSONObject().put("navigationEndpoint", navigation));
        JSONObject menu = new JSONObject().put("menuRenderer",
                new JSONObject().put("items", new JSONArray().put(item)));
        JSONObject command = new JSONObject().put("menuEndpoint", new JSONObject().put("menu", menu));
        JSONObject payload = new JSONObject().put("commandEntity", new JSONObject().put("command", command));
        JSONObject mutation = new JSONObject().put("payload", payload);
        response.put("frameworkUpdates", new JSONObject().put("entityBatchUpdate",
                new JSONObject().put("mutations", new JSONArray().put(mutation))));
        return endpoint;
    }

    private static final class Requests implements SmartShuffleSource.Requests {
        final Map<String, JSONObject> pages = new HashMap<>();
        final List<String> calls = new ArrayList<>();
        final List<JSONObject> nextFields = new ArrayList<>();
        final List<JSONObject> radioPages = new ArrayList<>();
        Runnable afterRequest = () -> {};

        @Override
        public JSONObject browse(String browseId, String continuation) throws Exception {
            assertEquals("VL" + PLAYLIST, browseId);
            String key = continuation == null ? "initial" : continuation;
            calls.add(key);
            JSONObject response = pages.get(key);
            if (response == null) throw new IOException("Unexpected browse: " + key);
            afterRequest.run();
            return response;
        }

        @Override
        public JSONObject next(JSONObject fields) {
            nextFields.add(fields);
            JSONObject response = radioPages.remove(0);
            afterRequest.run();
            return response;
        }
    }

    @Test
    public void capturedAddSongActionDoesNotAbortAndOverlayOriginalIsDeduped() throws Exception {
        JSONObject shelf;
        try (InputStream input = getClass().getResourceAsStream("/smartshuffle/captured-playlist-rows.json")) {
            assertNotNull(input);
            shelf = new JSONObject(new String(input.readAllBytes(), StandardCharsets.UTF_8));
        }
        Requests requests = new Requests();
        requests.pages.put("initial", initial(shelf, true, "sections"));
        requests.pages.put("sections", continuation("sectionListContinuation", new JSONObject().put("contents",
                new JSONArray().put(new JSONObject().put("musicShelfRenderer",
                        suggestions("reload", "overlay-original", "recommended"))))));
        requests.pages.put("reload", continuation("musicShelfContinuation",
                new JSONObject().put("contents", new JSONArray())));

        SmartShuffleSource.Result result = SmartShuffleSource.load(requests, PLAYLIST, () -> false);

        assertEquals(Set.of("overlay-original"), result.originals());
        assertEquals(List.of("recommended"), result.candidates().stream()
                .map(SmartShuffleSource.Candidate::videoId).toList());
        assertEquals(List.of("initial", "sections", "reload"), requests.calls);
        assertTrue(requests.nextFields.isEmpty());
    }

    @Test
    public void unavailableAndNonSongRowsDoNotHideIdentifiableOriginals() throws Exception {
        JSONObject response = initial(new JSONObject("""
                {"contents":[
                  {"musicResponsiveListItemRenderer":{"playlistItemData":{"videoId":"playlist-data"}}},
                  {"musicResponsiveListItemRenderer":{"flexColumns":[
                    {"musicResponsiveListItemFlexColumnRenderer":{"text":{"runs":[
                      {"navigationEndpoint":{"browseEndpoint":{"browseId":"artist"}}},
                      {"navigationEndpoint":{"watchEndpoint":{"videoId":"flex-original"}}}
                    ]}}}
                  ]}},
                  {"musicMultiRowListItemRenderer":{"overlay":{"musicItemThumbnailOverlayRenderer":{"content":
                    {"musicPlayButtonRenderer":{"playNavigationEndpoint":{"watchEndpoint":{"videoId":"play-original"}}}}
                  }}}},
                  {"musicResponsiveListItemRenderer":{"musicItemRendererDisplayPolicy":
                    "MUSIC_ITEM_RENDERER_DISPLAY_POLICY_GREY_OUT","playlistItemData":{"videoId":"hidden-original"}}},
                  {"musicResponsiveListItemRenderer":{"musicItemRendererDisplayPolicy":
                    "MUSIC_ITEM_RENDERER_DISPLAY_POLICY_GREY_OUT"}},
                  {"musicTwoColumnItemRenderer":{"title":{"runs":[{"text":"Unavailable"}]},
                    "menu":{"watchEndpoint":{"videoId":"unrelated-menu-seed"}}}},
                  {"musicCarouselShelfRenderer":{"title":"Not a song"}},
                  {"musicTwoColumnItemRenderer":{"title":{"runs":[{"text":"Unknown future row"}]}}}
                ]}
                """), false, null);

        SmartShuffleResponse.BrowsePage page = SmartShuffleResponse.browse(response, PLAYLIST);

        assertEquals(Set.of("playlist-data", "flex-original", "play-original", "hidden-original"), page.originals);
        assertFalse(page.originals.contains("unrelated-menu-seed"));
        assertTrue(page.originalShelf);
    }

    @Test
    public void allOriginalPagesPrecedeSuggestionsAndExcludeOriginalBeyond100() throws Exception {
        Requests requests = new Requests();
        requests.pages.put("initial", initial(tracks(0, 20, "tracks-20"), true, "sections"));
        requests.pages.put("tracks-20", continuation("musicPlaylistShelfContinuation", tracks(20, 120, "tracks-120")));
        requests.pages.put("tracks-120", continuation("musicPlaylistShelfContinuation", tracks(120, 205, null)));
        requests.pages.put("sections", continuation("sectionListContinuation", new JSONObject().put("contents",
                new JSONArray().put(new JSONObject().put("musicShelfRenderer",
                        suggestions("refresh-1", "original-204", "suggested-1"))))));
        requests.pages.put("refresh-1", continuation("musicShelfContinuation",
                suggestions("refresh-2", "original-105", "suggested-1", "suggested-2")));

        SmartShuffleSource.Result result = SmartShuffleSource.load(requests, PLAYLIST, () -> false);

        assertEquals(List.of("initial", "tracks-20", "tracks-120", "sections", "refresh-1"), requests.calls);
        assertEquals(205, result.originals().size());
        assertEquals(List.of("suggested-1", "suggested-2"), result.candidates().stream()
                .map(SmartShuffleSource.Candidate::videoId).toList());
        assertTrue(result.editable());
        assertFalse(result.exhausted());
        assertNotNull(SmartShuffleResponse.editEndpoint(result.candidates().get(0).command(),
                PLAYLIST, "suggested-1"));
    }

    @Test
    public void likedSongsFilterReloadIsNotAnInvisibleSuggestionShelf() throws Exception {
        JSONObject response = initial(tracks(0, 3, null), false, null);
        JSONObject sections = response.getJSONObject("contents").getJSONObject("singleColumnBrowseResultsRenderer")
                .getJSONArray("tabs").getJSONObject(0).getJSONObject("tabRenderer").getJSONObject("content")
                .getJSONObject("sectionListRenderer");
        sections.put("header", new JSONObject().put("elementRenderer", new JSONObject()
                .put("browseSectionListReloadEndpoint", new JSONObject().put("continuation",
                        token("reloadContinuationData", "sort-filter-not-suggestions")))));
        SmartShuffleResponse.BrowsePage page = SmartShuffleResponse.browse(response, PLAYLIST);

        assertEquals(3, page.originals.size());
        assertTrue(page.reload.isEmpty());
        assertTrue(page.suggestions.isEmpty());
        assertTrue(page.sectionTokens.isEmpty());
    }

    @Test
    public void hiddenShelfDividerDoesNotHideOwnedSuggestions() throws Exception {
        JSONObject response = continuation("sectionListContinuation", new JSONObject().put("contents",
                new JSONArray().put(new JSONObject().put("musicShelfRenderer", suggestions("reload", "new")))));
        SmartShuffleResponse.BrowsePage page = SmartShuffleResponse.browse(response, PLAYLIST);

        assertEquals("reload", page.reload);
        assertEquals("new", page.suggestions.get(0).videoId());
        assertFalse(page.originalShelf);
    }

    @Test
    public void radioPreservesEntireReturnedWatchPlaylistEndpointAndOwnContinuation() throws Exception {
        Requests requests = new Requests();
        JSONObject initial = initial(tracks(0, 1, null), false, null);
        JSONObject endpoint = radioCommand(initial);
        requests.pages.put("initial", initial);
        requests.radioPages.add(radio("radio-next", "original-0", "new-1"));
        requests.radioPages.add(radio(null, "new-1", "new-2"));

        SmartShuffleSource.Result result = SmartShuffleSource.load(requests, PLAYLIST, () -> false);

        assertEquals(endpoint.toString(), requests.nextFields.get(0).toString());
        assertEquals(1, requests.nextFields.get(1).length());
        assertTrue(requests.nextFields.get(1).has("continuation"));
        assertEquals("radio-next", requests.nextFields.get(1).getString("continuation"));
        assertEquals(List.of("new-1", "new-2"), result.candidates().stream()
                .map(SmartShuffleSource.Candidate::videoId).toList());
        assertTrue(result.exhausted());
        assertFalse(result.editable());
    }

    @Test
    public void loadMoreRetainsSeenAndCursorWithoutRefetchingOriginals() throws Exception {
        Requests requests = new Requests();
        requests.pages.put("initial", initial(tracks(0, 1, null), true, "sections"));
        requests.pages.put("sections", continuation("sectionListContinuation", new JSONObject().put("contents",
                new JSONArray().put(new JSONObject().put("musicShelfRenderer", suggestions("reload-1", "new-1"))))));
        requests.pages.put("reload-1", continuation("musicShelfContinuation", suggestions("reload-2", "new-2")));
        requests.pages.put("reload-2", continuation("musicShelfContinuation",
                suggestions("reload-3", "new-1", "new-2", "original-0", "new-3")));
        SmartShuffleSource.Result first = SmartShuffleSource.load(requests, PLAYLIST, () -> false);
        SmartShuffleSource.Result second = SmartShuffleSource.loadMore(requests, first, () -> false);

        assertEquals(List.of("new-3"), second.candidates().stream()
                .map(SmartShuffleSource.Candidate::videoId).toList());
        assertSame(first.originals(), second.originals());
        assertEquals(List.of("initial", "sections", "reload-1", "reload-2"), requests.calls);
    }

    @Test
    public void ownedSuggestionsAndRadioShareWholePlaylistAndSessionDedupe() throws Exception {
        Requests requests = new Requests();
        JSONObject firstPage = initial(tracks(0, 1, null), true, "sections");
        radioCommand(firstPage);
        requests.pages.put("initial", firstPage);
        requests.pages.put("sections", continuation("sectionListContinuation", new JSONObject().put("contents",
                new JSONArray().put(new JSONObject().put("musicShelfRenderer",
                        suggestions("", "original-0", "shared", "shared"))))));
        requests.radioPages.add(radio(null, "original-0", "shared", "radio-only", "radio-only"));

        SmartShuffleSource.Result result = SmartShuffleSource.load(requests, PLAYLIST, () -> false);

        assertEquals(List.of("shared", "radio-only"), result.candidates().stream()
                .map(SmartShuffleSource.Candidate::videoId).toList());
        assertEquals(Set.of("original-0"), result.originals());
        assertEquals(1, requests.nextFields.size());
        assertTrue(result.exhausted());
    }

    @Test
    public void cancellationPreventsEverySubsequentRequest() throws Exception {
        Requests requests = new Requests();
        requests.pages.put("initial", initial(tracks(0, 1, "next"), true, "sections"));
        AtomicBoolean cancelled = new AtomicBoolean();
        requests.afterRequest = () -> cancelled.set(true);

        assertThrows(CancellationException.class,
                () -> SmartShuffleSource.load(requests, PLAYLIST, cancelled::get));
        assertEquals(List.of("initial"), requests.calls);
        assertTrue(requests.nextFields.isEmpty());
        assertThrows(CancellationException.class,
                () -> SmartShuffleSource.load(requests, PLAYLIST, () -> true));
        assertEquals(1, requests.calls.size());
    }

    @Test
    public void repeatedOriginalContinuationFailsInsteadOfReturningPartialDedupe() throws Exception {
        Requests requests = new Requests();
        requests.pages.put("initial", initial(tracks(0, 1, "same"), false, null));
        requests.pages.put("same", continuation("musicPlaylistShelfContinuation", tracks(1, 2, "same")));
        assertThrows(IOException.class, () -> SmartShuffleSource.load(requests, PLAYLIST, () -> false));
        assertTrue(requests.nextFields.isEmpty());
    }

    @Test
    public void keepUsesExactSourceEditAndRequiresActualAddedResult() throws Exception {
        JSONObject row = suggestion("new").getJSONObject("musicTwoColumnItemRenderer");
        SmartShuffleSource.Candidate candidate = new SmartShuffleSource.Candidate("new", row);
        JSONObject request = SmartShuffleResponse.editRequest(PLAYLIST, candidate);
        assertEquals(PLAYLIST, request.getString("playlistId"));
        assertEquals("opaque-edit%3D", request.getString("params"));
        assertFalse(request.has("clientActions"));
        assertNotNull(SmartShuffleResponse.editEndpoint(row, PLAYLIST, "new").optJSONArray("clientActions"));

        JSONObject response = new JSONObject().put("status", "STATUS_SUCCEEDED");
        assertFalse(SmartShuffleResponse.confirmedEdit(response, "new"));
        response.put("playlistEditResults", new JSONArray().put(new JSONObject().put("playlistEditVideoAddedResultData",
                new JSONObject().put("videoId", "new").put("setVideoId", "actual-entry"))));
        assertTrue(SmartShuffleResponse.confirmedEdit(response, "new"));
        assertFalse(SmartShuffleResponse.confirmedEdit(response, "different"));
        response.put("status", "STATUS_FAILED");
        assertFalse(SmartShuffleResponse.confirmedEdit(response, "new"));
    }

    @Test
    public void radioWrapperUsesPrimaryOnlyAndNeverFollowsAutomixPreview() throws Exception {
        JSONObject panel = new JSONObject().put("contents", new JSONArray()
                .put(new JSONObject().put("playlistPanelVideoWrapperRenderer", new JSONObject()
                        .put("primaryRenderer", new JSONObject().put("playlistPanelVideoRenderer",
                                new JSONObject().put("videoId", "primary")))
                        .put("counterpart", new JSONObject().put("playlistPanelVideoRenderer",
                                new JSONObject().put("videoId", "counterpart")))))
                .put(new JSONObject().put("automixPreviewVideoRenderer", new JSONObject()
                        .put("watchEndpoint", new JSONObject().put("videoId", "live-autoplay")))))
                .put("continuations", new JSONArray().put(token("nextRadioContinuationData", "independent")));
        JSONObject response = continuation("playlistPanelContinuation", panel);
        SmartShuffleResponse.RadioPage result = SmartShuffleResponse.radio(response);
        assertEquals(List.of("primary"), result.candidates().stream()
                .map(SmartShuffleSource.Candidate::videoId).toList());
        assertEquals("independent", result.continuation());
    }

    @Test
    public void missingServerRadioNeverFabricatesProductionRadioRequest() throws Exception {
        Requests requests = new Requests();
        requests.pages.put("initial", initial(tracks(0, 1, null), false, null));

        SmartShuffleSource.Result result = SmartShuffleSource.load(requests, PLAYLIST, () -> false);

        assertTrue(result.exhausted());
        assertTrue(result.candidates().isEmpty());
        assertTrue(requests.nextFields.isEmpty());
    }

    @Test
    public void radioLoadMoreContinuesWithoutReplayingInitialEndpoint() throws Exception {
        Requests requests = new Requests();
        JSONObject firstPage = initial(tracks(0, 1, null), false, null);
        radioCommand(firstPage);
        requests.pages.put("initial", firstPage);
        String[] firstBatch = new String[12];
        for (int index = 0; index < firstBatch.length; index++) firstBatch[index] = "radio-" + index;
        requests.radioPages.add(radio("resume-radio", firstBatch));
        requests.radioPages.add(radio(null, "radio-0", "original-0", "fresh"));

        SmartShuffleSource.Result first = SmartShuffleSource.load(requests, PLAYLIST, () -> false);
        assertFalse(first.exhausted());
        SmartShuffleSource.Result next = SmartShuffleSource.loadMore(requests, first, () -> false);

        assertEquals(List.of("initial"), requests.calls);
        assertEquals(2, requests.nextFields.size());
        assertEquals(1, requests.nextFields.get(1).length());
        assertTrue(requests.nextFields.get(1).has("continuation"));
        assertEquals("resume-radio", requests.nextFields.get(1).getString("continuation"));
        assertEquals(List.of("fresh"), next.candidates().stream()
                .map(SmartShuffleSource.Candidate::videoId).toList());
        assertTrue(next.exhausted());
    }

    @Test
    public void cancellationAfterOriginalPagePreventsSuggestionsAndRadio() throws Exception {
        Requests requests = new Requests();
        requests.pages.put("initial", initial(tracks(0, 1, "last-tracks"), true, "sections"));
        requests.pages.put("last-tracks", continuation("musicPlaylistShelfContinuation", tracks(1, 120, null)));
        AtomicBoolean cancelled = new AtomicBoolean();
        requests.afterRequest = () -> cancelled.set(requests.calls.size() == 2);

        assertThrows(CancellationException.class,
                () -> SmartShuffleSource.load(requests, PLAYLIST, cancelled::get));
        assertEquals(List.of("initial", "last-tracks"), requests.calls);
        assertTrue(requests.nextFields.isEmpty());
    }
}
