/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 * Modified by lavinhoque33, 2026-11-10.
 */
package app.morphe.extension.music.patches.downloads;

import static app.morphe.extension.music.patches.downloads.DownloadMode.Work.LOCAL_FILE;
import static app.morphe.extension.music.patches.downloads.DownloadMode.Work.SKIP;
import static app.morphe.extension.music.patches.downloads.DownloadMode.Work.STREAM_COPY;
import static org.junit.Assert.assertEquals;

import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

public class DownloadModeTest {

    @Test public void offDownloadsNothing() {
        for (boolean nativeTrack : new boolean[]{false, true}) {
            for (boolean copy : new boolean[]{false, true}) {
                assertEquals(SKIP, DownloadMode.OFF.plan(() -> nativeTrack, () -> copy));
            }
        }
    }

    @Test public void localFilesIgnoreStreamCopiesAndSkipOnTheNativeTrack() {
        for (boolean copy : new boolean[]{false, true}) {
            assertEquals(LOCAL_FILE, DownloadMode.LOCAL_FILES.plan(() -> false, () -> copy));
            assertEquals(SKIP, DownloadMode.LOCAL_FILES.plan(() -> true, () -> copy));
        }
    }

    @Test public void streamCopyIgnoresLocalFilesAndSkipsOnAValidCopy() {
        for (boolean nativeTrack : new boolean[]{false, true}) {
            assertEquals(STREAM_COPY, DownloadMode.STREAM_COPY.plan(() -> nativeTrack, () -> false));
            assertEquals(SKIP, DownloadMode.STREAM_COPY.plan(() -> nativeTrack, () -> true));
        }
    }

    @Test public void onlyTheStoresTheModeCaresAboutAreAsked() {
        List<String> asked = new ArrayList<>();
        DownloadMode.LOCAL_FILES.plan(() -> {
            asked.add("native");
            return false;
        }, () -> {
            asked.add("stream");
            return false;
        });
        assertEquals(List.of("native"), asked);

        asked.clear();
        DownloadMode.STREAM_COPY.plan(() -> {
            asked.add("native");
            return false;
        }, () -> {
            asked.add("stream");
            return false;
        });
        assertEquals(List.of("stream"), asked);

        asked.clear();
        DownloadMode.OFF.plan(() -> {
            asked.add("native");
            return false;
        }, () -> {
            asked.add("stream");
            return false;
        });
        assertEquals(List.of(), asked);
    }
}
