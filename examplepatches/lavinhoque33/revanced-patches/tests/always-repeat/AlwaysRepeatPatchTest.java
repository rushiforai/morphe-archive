/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Written by lavinhoque33, 2026-11-13.
 */

import java.util.List;

import app.morphe.extension.youtube.patches.utils.AlwaysRepeatPatch;
import app.morphe.extension.youtube.settings.Settings;
import app.morphe.extension.youtube.shared.VideoInformation;

public class AlwaysRepeatPatchTest {
    private enum Status { ENDED, VIDEO_PLAYING, PAUSED, PLAYBACK_PENDING }

    private static int checks;

    private static void reset(boolean repeat, boolean pause) {
        Settings.ALWAYS_REPEAT.value = repeat;
        Settings.ALWAYS_REPEAT_PAUSE.value = pause;
        VideoInformation.calls.clear();
        VideoInformation.supported = true;
        VideoInformation.seekSucceeds = true;
        VideoInformation.playing = true;
        VideoInformation.controllerPlaying = true;
        VideoInformation.position = 12345;
    }

    private static void check(boolean condition) {
        checks++;
        if (!condition) throw new AssertionError("Check " + checks + ": " + VideoInformation.calls);
    }

    public static void main(String[] args) {
        // Model the device failure: bypassing the controller leaves its cache true, so native Play no-ops.
        reset(true, true);
        VideoInformation.setPlayerPlaying(false);
        VideoInformation.userPlay();
        check(!VideoInformation.playing);
        check(VideoInformation.controllerPlaying);

        // Legacy end hook and the ENDED-only hook on 21.13 and newer.
        for (boolean modern : new boolean[]{false, true}) {
            for (boolean pause : new boolean[]{false, true}) {
                reset(false, pause);
                check(!ended(modern));
                check(VideoInformation.calls.isEmpty());
                check(VideoInformation.playing);

                reset(true, pause);
                check(ended(modern));
                check(VideoInformation.position == 0);
                check(VideoInformation.playing != pause);
                check(VideoInformation.controllerPlaying != pause);
                check(VideoInformation.calls.equals(pause
                        ? List.of("seek:0", "controllerPause") : List.of("seek:0")));

                // UI and media-session Play share the native cached-intent transition.
                VideoInformation.userPlay();
                check(VideoInformation.playing);
                check(VideoInformation.controllerPlaying);
                VideoInformation.position = 19063;
                VideoInformation.calls.clear();
                check(ended(modern));
                check(VideoInformation.position == 0);
                check(VideoInformation.playing != pause);
            }
        }

        for (Status status : new Status[]{null, Status.VIDEO_PLAYING, Status.PAUSED, Status.PLAYBACK_PENDING}) {
            reset(true, true);
            check(!AlwaysRepeatPatch.alwaysRepeat(status));
            check(VideoInformation.calls.isEmpty());
        }

        // Never pause before the rewind, or when it failed.
        for (boolean modern : new boolean[]{false, true}) {
            reset(true, true);
            VideoInformation.seekSucceeds = false;
            check(!ended(modern));
            check(VideoInformation.playing);
            check(VideoInformation.controllerPlaying);
            check(VideoInformation.position == 12345);
            check(VideoInformation.calls.equals(List.of("seek:0")));
        }

        // The end-clamped seek caller now reads settings without pausing before it seeks.
        reset(true, true);
        check(AlwaysRepeatPatch.alwaysRepeatEnabled());
        check(VideoInformation.calls.isEmpty());
        check(VideoInformation.overrideVideoTime(0));
        AlwaysRepeatPatch.pauseAfterRepeat();
        check(VideoInformation.calls.equals(List.of("seek:0", "controllerPause")));
        VideoInformation.userPlay();
        check(VideoInformation.playing);

        reset(false, true);
        AlwaysRepeatPatch.pauseAfterRepeat();
        check(VideoInformation.calls.isEmpty());

        // Missing native controller resolution gates yellow; it must never fall back to raw Exo pause.
        for (boolean modern : new boolean[]{false, true}) {
            reset(true, true);
            VideoInformation.supported = false;
            check(!ended(modern));
            check(VideoInformation.calls.isEmpty());
            check(VideoInformation.playing);

            reset(true, false);
            VideoInformation.supported = false;
            check(ended(modern));
            check(VideoInformation.calls.equals(List.of("seek:0")));
            check(VideoInformation.playing);
        }

        System.out.println("AlwaysRepeatPatch: " + checks + " checks passed");
    }

    private static boolean ended(boolean modern) {
        return modern ? AlwaysRepeatPatch.alwaysRepeat(Status.ENDED) : AlwaysRepeatPatch.alwaysRepeat();
    }
}
