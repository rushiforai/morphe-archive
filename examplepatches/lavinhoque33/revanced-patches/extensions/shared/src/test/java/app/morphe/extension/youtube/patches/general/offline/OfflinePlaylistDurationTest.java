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

import org.json.JSONObject;
import org.junit.Test;
import static org.junit.Assert.*;

public class OfflinePlaylistDurationTest {
    @Test public void observedMwebBadgeHasDurationWithoutLengthSeconds() throws Exception {
        // Host MWEB browse, PLV7xfBoJKBNQ3yhYgQRqocSWs1MKF7j0n, iG9CE55wbtY, 2026-11-05.
        JSONObject lockup = new JSONObject("""
                {"contentImage":{"thumbnailViewModel":{"overlays":[
                  {"thumbnailBottomOverlayViewModel":{"badges":[
                    {"thumbnailBadgeViewModel":{"text":"20:04",
                      "badgeStyle":"THUMBNAIL_OVERLAY_BADGE_STYLE_DEFAULT"}}
                  ]}}
                ]}},"contentId":"iG9CE55wbtY","contentType":"LOCKUP_CONTENT_TYPE_VIDEO"}
                """);
        assertEquals(1_204_000, OfflinePlaylistDuration.from(lockup, true));
    }

    @Test public void legacyLengthSecondsAndLengthTextAreSupported() throws Exception {
        assertEquals(123_000, OfflinePlaylistDuration.from(new JSONObject().put("lengthSeconds", "123"), false));
        assertEquals(3_723_000, OfflinePlaylistDuration.from(new JSONObject(
                "{\"lengthText\":{\"simpleText\":\"1:02:03\"}}"), false));
        assertEquals(62_000, OfflinePlaylistDuration.from(new JSONObject(
                "{\"lengthText\":{\"runs\":[{\"text\":\"1:02\"}]}}"), false));
    }

    @Test public void missingLiveAndInvalidDurationsStayUnknown() throws Exception {
        assertEquals(0, OfflinePlaylistDuration.from(new JSONObject(), true));
        assertEquals(0, OfflinePlaylistDuration.from(new JSONObject(), false));
        for (String value : new String[]{"LIVE", "", "1:99", "1:02:99", "99999999999999999999999:00"}) {
            assertEquals(0, OfflinePlaylistDuration.parse(value));
        }
    }
}
