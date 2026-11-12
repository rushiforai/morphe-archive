/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 * Modified by lavinhoque33, 2026-11-09.
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.*;

import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;

import java.io.IOException;

public class StreamSwapSourcesTest {
    @Rule public TemporaryFolder temporary = new TemporaryFolder();

    private RawAudioFiles.Entry raw() throws Exception {
        return new RawAudioFiles.Entry(temporary.newFile(), 251, "audio/webm; codecs=\"opus\"",
                1000, 123, "content://media/external/audio/media/42", "digest");
    }

    @Test public void nullOnlineUrlStillIssuesAndReusesALocalToken() throws Exception {
        RawAudioFiles.Entry raw = raw();
        StreamSwapSources.Source source = StreamSwapSources.issue("no_url", raw, null);
        assertNull(source.online);
        assertTrue(source.token.startsWith("http://127.0.0.1:1/rvx?v=no_url&i=251&m=raw&t="));
        assertSame(source, StreamSwapSources.issue("no_url", raw, null));
    }

    @Test public void emptySabrUrlIsNormalizedToAnAbsentFallback() throws Exception {
        StreamSwapSources.Source source = StreamSwapSources.issue("empty_url", raw(), "");
        assertNull(source.online);
        assertThrows(IOException.class, source::fallback);
    }

    @Test public void unavailableSourceWithoutOnlineUrlFailsOpenWithIOException() throws Exception {
        StreamSwapSources.Source source = StreamSwapSources.issue("missing_url", raw(), null);
        source.available = false;
        IOException error = assertThrows(IOException.class, source::fallback);
        assertTrue(error.getMessage().contains("reload player response: missing_url"));
    }

    @Test public void httpsFormatStillProvidesItsOriginalOnlineFallback() throws Exception {
        String online = "https://example.invalid/videoplayback?id=track";
        StreamSwapSources.Source source = StreamSwapSources.issue("https_url", raw(), online);
        source.available = false;
        assertEquals(online, source.fallback());
    }

    @Test public void onlyTheLatestTokensOfATrackStayIssuedAndTheLatestStillResolves() throws Exception {
        RawAudioFiles.Entry raw = raw();
        StreamSwapSources.Source other = StreamSwapSources.issue("other_track", raw, null);
        StreamSwapSources.Source[] issued = new StreamSwapSources.Source[StreamSwapSources.TOKENS_PER_VIDEO + 2];
        for (int index = 0; index < issued.length; index++) {
            issued[index] = StreamSwapSources.issue("busy", raw, "https://example.invalid/" + index);
        }

        for (int index = 0; index < issued.length; index++) {
            boolean kept = index >= issued.length - StreamSwapSources.TOKENS_PER_VIDEO;
            assertEquals("token " + index, kept, StreamSwapSources.lookup(issued[index].key) == issued[index]);
        }
        assertSame(other, StreamSwapSources.lookup(other.key));
        assertSame(issued[issued.length - 1], StreamSwapSources.issue("busy", raw,
                "https://example.invalid/" + (issued.length - 1)));
    }

    private VideoCopyFiles.Entry copy() throws Exception {
        return new VideoCopyFiles.Entry(
                new VideoCopyFiles.Part(temporary.newFile(), 134, "video/mp4; codecs=\"avc1.4D401E\"", 1000, 123, "d1"),
                new VideoCopyFiles.Part(temporary.newFile(), 251, "audio/webm; codecs=\"opus\"", 400, 456, "d2"),
                temporary.newFile(), "clip00000000", "song0000000", null, 213_000);
    }

    @Test public void aVideoCopyIssuesOneTokenPerStreamAndEachResolvesToItsOwnFile() throws Exception {
        VideoCopyFiles.Entry copy = copy();
        StreamSwapSources.Source video = StreamSwapSources.issueVideo("clip00000000", copy, null);
        StreamSwapSources.Source audio = StreamSwapSources.issueVideoAudio("clip00000000", copy, null);

        assertTrue(video.token.startsWith("http://127.0.0.1:1/rvx?v=clip00000000&i=134&m=video&t="));
        assertTrue(audio.token.startsWith("http://127.0.0.1:1/rvx?v=clip00000000&i=251&m=vaudio&t="));
        assertNotSame(video, audio);
        assertSame(video, StreamSwapSources.lookup(video.key));
        assertSame(audio, StreamSwapSources.lookup(audio.key));
        assertSame(video, StreamSwapSources.issueVideo("clip00000000", copy, null));
        assertSame(audio, StreamSwapSources.issueVideoAudio("clip00000000", copy, null));
        assertEquals(StreamSwapSources.KIND_VIDEO, video.served.kind());
        assertEquals(copy.video().file(), video.served.file());
        assertEquals(1000, video.served.length());
        assertEquals(StreamSwapSources.KIND_VIDEO_AUDIO, audio.served.kind());
        assertEquals(copy.audio().file(), audio.served.file());
        assertEquals(400, audio.served.length());
    }

    @Test public void invalidatingAVideoDropsBothStreamsOfItsCopy() throws Exception {
        VideoCopyFiles.Entry copy = copy();
        StreamSwapSources.Source video = StreamSwapSources.issueVideo("gone00000000", copy, null);
        StreamSwapSources.Source audio = StreamSwapSources.issueVideoAudio("gone00000000", copy, null);

        StreamSwapSources.invalidate("gone00000000");

        assertFalse(video.available);
        assertFalse(audio.available);
        assertNotSame(video, StreamSwapSources.issueVideo("gone00000000", copy, null));
    }
}
