/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-09.
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import org.json.JSONObject;
import org.junit.Test;

import java.util.List;

public class WatchQueueLogicTest {

    private static final String WRAPPED = """
            {"contents":{"singleColumnMusicWatchNextResultsRenderer":{"tabbedRenderer":{"watchNextTabbedResultsRenderer":
            {"tabs":[{"tabRenderer":{"content":{"musicQueueRenderer":{"content":{"playlistPanelRenderer":{
            "contents":[
              {"playlistPanelVideoWrapperRenderer":{
                "primaryRenderer":{"playlistPanelVideoRenderer":{"videoId":"omvOne00000","lengthText":{"runs":[{"text":"3:34"}]},
                  "title":{"runs":[{"text":"First (Official Video)"}]},
                  "shortBylineText":{"runs":[{"text":"Artist One"},{"text":" & "},{"text":"Other"}]},
                  "navigationEndpoint":{"watchEndpoint":{"watchEndpointMusicSupportedConfigs":{"watchEndpointMusicConfig":
                  {"musicVideoType":"MUSIC_VIDEO_TYPE_OMV"}}}}}},
                "counterpart":[{"counterpartRenderer":{"playlistPanelVideoRenderer":{"videoId":"atvOne00000",
                  "lengthText":{"runs":[{"text":"3:33"}]},
                  "navigationEndpoint":{"watchEndpoint":{"watchEndpointMusicSupportedConfigs":{"watchEndpointMusicConfig":
                  {"musicVideoType":"MUSIC_VIDEO_TYPE_ATV"}}}}}}}]}},
              {"playlistPanelVideoRenderer":{"videoId":"atvTwo00000","lengthText":{"runs":[{"text":"4:01"}]},
                "title":{"runs":[{"text":"Second"}]},"longBylineText":{"runs":[{"text":"Artist Two"}]}}},
              {"automixPreviewVideoRenderer":{}},
              {"somethingElse":{}}
            ],
            "continuations":[{"nextRadioContinuationData":{"continuation":"TOKEN"}}]}}}}}}]}}}}}
            """;

    @Test public void aWrappedItemNamesItsCounterpart() throws Exception {
        WatchQueueLogic.NextPage page = WatchQueueLogic.readNext(new JSONObject(WRAPPED), 0);

        WatchQueueLogic.NextItem first = page.items().get(0);
        assertEquals("wrapper", first.kind());
        assertEquals("omvOne00000", first.videoId());
        assertEquals("OMV", first.type());
        assertEquals("atvOne00000", first.counterpartId());
        assertEquals("ATV", first.counterpartType());
        assertEquals("3:33", first.counterpartLength());
        assertEquals("First (Official Video)", first.title());
        assertEquals("Artist One", first.artist());
        assertEquals("item 0 wrapper id=omvOne00000 type=OMV counterpart=atvOne00000 counterpartType=ATV len=3:34"
                        + " counterpartLen=3:33 title=\"First (Official Video)\" artist=\"Artist One\"",
                WatchQueueLogic.describe(first));
    }

    @Test public void aPlainItemHasNoCounterpart() throws Exception {
        WatchQueueLogic.NextPage page = WatchQueueLogic.readNext(new JSONObject(WRAPPED), 0);

        assertEquals("Artist Two", page.items().get(1).artist());
        assertEquals("item 1 plain id=atvTwo00000 type=- counterpart=none len=4:01 title=\"Second\""
                        + " artist=\"Artist Two\"",
                WatchQueueLogic.describe(page.items().get(1)));
    }

    @Test public void theTotalsCountTheKindsAndTheContinuation() throws Exception {
        WatchQueueLogic.NextPage page = WatchQueueLogic.readNext(new JSONObject(WRAPPED), 0);

        assertEquals("TOKEN", page.continuation());
        assertEquals(1, page.automix());
        assertEquals(List.of("somethingElse"), page.otherKinds());
        assertEquals("items=2 wrappers=1 withCounterpart=1 automix=1 otherKinds=[somethingElse] continuation=yes",
                WatchQueueLogic.describe(page));
    }

    @Test public void aContinuationResponseIsReadAndNumberedFromWhereTheFirstEnded() throws Exception {
        JSONObject response = new JSONObject("{\"continuationContents\":{\"playlistPanelContinuation\":{\"contents\":["
                + "{\"playlistPanelVideoRenderer\":{\"videoId\":\"atvThree0000\"}}]}}}");

        WatchQueueLogic.NextPage page = WatchQueueLogic.readNext(response, 25);

        assertEquals(25, page.items().get(0).index());
        assertEquals("", page.continuation());
    }

    @Test public void aResponseWithNoQueueHasNoItems() throws Exception {
        assertTrue(WatchQueueLogic.readNext(new JSONObject("{}"), 0).items().isEmpty());
    }
}
