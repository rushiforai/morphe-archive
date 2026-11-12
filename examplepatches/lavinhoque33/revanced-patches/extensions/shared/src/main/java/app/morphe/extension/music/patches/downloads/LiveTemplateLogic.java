/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-09.
 */
package app.morphe.extension.music.patches.downloads;

import java.util.Set;

import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.PlayerResponse;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.Status;

/** What {@link LiveTemplate} decides. Pure rules, so they can be tested without Android. */
final class LiveTemplateLogic {
    /** The kept response is looked at again when it is older than this: what the app's player asks rarely changes. */
    static final long REFRESH_MILLIS = 6L * 60 * 60 * 1000;

    /**
     * The top-level player response fields that belong to one video or to its streams, and so are not kept: 4 the
     * streaming data, 7 the ad placements, 9 the playback tracking, 10 the captions, 11 the video details and 14
     * the offline marker. Everything else (the response context, the playability status, the player configuration
     * and the fields the app reads that are not declared in the extension's proto) is the app's own and the same for
     * every video.
     */
    static final Set<Integer> PER_VIDEO_FIELDS = Set.of(4, 7, 9, 10, 11, 14);

    private LiveTemplateLogic() {}

    /**
     * Whether an online response is the app's own and playable: its player configuration enables the ExoPlayer
     * engine (a response fetched by another client has none of it) and its status is OK.
     */
    static boolean isAppResponse(PlayerResponse response) {
        return response.getPlayerConfig().getExoPlayerConfig().getUseExoPlayer()
                && response.getPlayabilityStatus().getStatus() == Status.OK;
    }

    /** Whether the kept response is to be looked at again; true when none was looked at in this run. */
    static boolean due(long lastCheckedMillis, long nowMillis) {
        return lastCheckedMillis <= 0 || nowMillis - lastCheckedMillis >= REFRESH_MILLIS;
    }
}
