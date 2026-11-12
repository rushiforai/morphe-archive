/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-09.
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.ExoPlayerConfig;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.PlayabilityStatus;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.PlayerConfig;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.PlayerResponse;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.Status;

public class LiveTemplateLogicTest {
    private static PlayerResponse response(Status status, boolean exo) {
        return PlayerResponse.newBuilder().setPlayabilityStatus(PlayabilityStatus.newBuilder().setStatus(status))
                .setPlayerConfig(PlayerConfig.newBuilder()
                        .setExoPlayerConfig(ExoPlayerConfig.newBuilder().setUseExoPlayer(exo))).build();
    }

    @Test public void onlyAPlayableResponseOfTheAppsOwnPlayerIsKept() {
        assertTrue(LiveTemplateLogic.isAppResponse(response(Status.OK, true)));
        assertFalse(LiveTemplateLogic.isAppResponse(response(Status.OK, false)));
        assertFalse(LiveTemplateLogic.isAppResponse(response(Status.LOGIN_REQUIRED, true)));
        assertFalse(LiveTemplateLogic.isAppResponse(PlayerResponse.getDefaultInstance()));
    }

    @Test public void theKeptResponseIsLookedAtAgainOnlyAfterSixHours() {
        long hour = 60L * 60 * 1000;
        assertTrue(LiveTemplateLogic.due(0, 5));
        assertFalse(LiveTemplateLogic.due(1000, 1000 + 6 * hour - 1));
        assertTrue(LiveTemplateLogic.due(1000, 1000 + 6 * hour));
    }

    @Test public void thePerVideoFieldsAreNotTheAppGenericOnes() {
        for (int perVideo : new int[]{4, 7, 9, 10, 11, 14}) {
            assertTrue(LiveTemplateLogic.PER_VIDEO_FIELDS.contains(perVideo));
        }
        for (int generic : new int[]{1, 2, 15, 16, 21, 22, 69, 71}) {
            assertFalse(LiveTemplateLogic.PER_VIDEO_FIELDS.contains(generic));
        }
    }
}
