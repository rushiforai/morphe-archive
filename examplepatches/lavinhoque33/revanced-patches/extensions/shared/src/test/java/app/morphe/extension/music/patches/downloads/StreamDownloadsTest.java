/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-09.
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

import java.util.Locale;

public class StreamDownloadsTest {
    private static final long MB = 1024 * 1024;

    @Test public void theSummaryCountsTheBytesOfTheAudioAndOfTheVideoCopies() {
        StreamDownloads.Summary summary = new StreamDownloads.Summary(22, 22 * 3 * MB, 7, 7 * 12 * MB);

        assertEquals(150 * MB, summary.totalBytes());
        assertEquals("150.0", StreamDownloads.megabytes(summary.totalBytes(), Locale.ROOT));
    }

    @Test public void theVideosAreNamedOnlyWhenThereAreSome() {
        assertEquals("morphe_music_stream_downloads_summary",
                StreamDownloads.summaryKey(new StreamDownloads.Summary(5, MB, 0, 0)));
        assertEquals("morphe_music_stream_downloads_summary_videos",
                StreamDownloads.summaryKey(new StreamDownloads.Summary(5, MB, 2, MB)));
        assertEquals("morphe_music_stream_downloads_delete_message",
                StreamDownloads.deleteMessageKey(new StreamDownloads.Summary(5, MB, 0, 0)));
        assertEquals("morphe_music_stream_downloads_delete_message_videos",
                StreamDownloads.deleteMessageKey(new StreamDownloads.Summary(5, MB, 2, MB)));
    }

    @Test public void noCopiesIsTheNoneText() {
        assertEquals("morphe_music_stream_downloads_none",
                StreamDownloads.summaryKey(new StreamDownloads.Summary(0, 0, 0, 0)));
    }

    @Test public void megabytesHaveOneDecimalInTheGivenLocale() {
        assertEquals("11.3", StreamDownloads.megabytes(11_829_048, Locale.ROOT));
        assertEquals("11,3", StreamDownloads.megabytes(11_829_048, Locale.GERMANY));
    }
}
