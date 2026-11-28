package app.morphed.extension.twitch.ui;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

import org.junit.Test;

public class ReadableTest {
    @Test
    public void routineRequestsThatWentFineAreLeftOut() {
        assertNull(Readable.of("16:19:01.123 Player https://video-edge-1.abs.hls.ttvnw.net/v1/segment/CqwFabc.ts -> 200 in 120ms"));
        assertNull(Readable.of("16:19:01.123 Playlist https://euc11.playlist.ttvnw.net/v1/playlist/Cr4FAAAAAAAAAA.m3u8 -> 200, "
                + "answered in 100ms, body in 6ms, waited 7ms, processing 44ms, 16993 -> 16993 bytes"));
    }

    @Test
    public void failuresAndChangesAreToldInWords() {
        assertEquals("16:19:01  a video segment (video-edge-1) failed: error 403",
                Readable.of("16:19:01.123 Player https://video-edge-1.abs.hls.ttvnw.net/v1/segment/x.ts -> 403 in 120ms"));
        assertEquals("16:19:01  a playlist (euc11) through the VPN failed: no answer",
                Readable.of("16:19:01.123 VPN https://euc11.playlist.ttvnw.net/v1/playlist/a.m3u8 -> failed: no answer in 3000ms"));
        assertNull(Readable.of("16:19:01.123 Playlist https://euc11.playlist.ttvnw.net/v1/playlist/a.m3u8 -> 200, answered in 100ms, body in 6ms, "
                + "waited 7ms, processing 44ms, 16993 -> 15579 bytes (rewritten)"));
        assertNull(Readable.of("16:29:58.001 Playlist caedrel 1920x1080: sequence 11571, 14 segments, 0 ads, ad markers"));
        assertEquals("16:29:58  Playlist caedrel 1920x1080: sequence 11571, 14 segments, 3 ads",
                Readable.of("16:29:58.001 Playlist caedrel 1920x1080: sequence 11571, 14 segments, 3 ads"));
    }

    @Test
    public void addressesAndCodesAreShortened() {
        assertEquals("16:20:00  Song removal: Removing Artist - Title",
                Readable.of("16:20:00.001 Song removal: Removing Artist - Title"));
        assertEquals("Quality unlock: connected to usher.ttvnw.net token Cr4FAAAAAAAA…",
                Readable.message("Quality unlock: tunnel up through https://usher.ttvnw.net/api/x.m3u8?sig=1 token "
                        + "Cr4FAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"));
        assertNull("routine: in the file only",
                Readable.message("Status: app CPU 12%, java heap 80/512 MB, phone RAM free 2100/8000 MB, heat none, threads 80"));
        assertEquals("Phone strained: app CPU 40%, phone RAM free 90/8000 MB (LOW), heat SEVERE (slowed down)",
                Readable.message("Status: app CPU 40%, phone RAM free 90/8000 MB (LOW), heat SEVERE (slowed down)"));
        assertNull(Readable.message("Video: PLAYING 1080p60, buffer ahead 2.1 s, latency 4.0 s, 60 fps shown, 0 dropped"));
        assertEquals("Screen: blocked, busy in: a.B.c:1 < d.E.f:2 < g.H.i:3 < …",
                Readable.message("Screen: blocked, busy in: a.B.c:1 < d.E.f:2 < g.H.i:3 < j.K.l:4 < m.N.o:5"));
        assertEquals("Video: BUFFERING after 12.0 s PLAYING, 1080p60, buffer ahead 0.0 s",
                Readable.message("Video: BUFFERING after 12.0 s PLAYING, 1080p60, buffer ahead 0.0 s"));
    }

    @Test
    public void whatIsntAnAddressIsShownAsItIs() {
        assertEquals("not an address", Readable.what("not an address"));
        assertEquals("the stream's quality list", Readable.what("https://usher.ttvnw.net/api/channel/hls/x.m3u8"));
        assertEquals("a video segment (edge-1)", Readable.what("https://edge-1.abs.hls.ttvnw.net/v1/segment/S9.ts"));
    }

    @Test
    public void thePatchesTechnicalLinesArePlainWords() {
        assertNull(Readable.message("Player HTTP client created: okhttp"));
        assertNull(Readable.message("Player 3 created, 1 alive"));
        assertEquals("Song removal: the song's copy is ready (1.5 s to get it, 0.3 s to prepare it)",
                Readable.message("Song removal: Copy abc123 ready: got it in 1500 ms, prepared in 300 ms"));
        assertEquals("Quality unlock: a request went without the VPN (the VPN isn't connected)",
                Readable.message("Quality unlock: edge/x.ts goes direct (the VPN isn't connected)"));
        assertEquals("Watching somebody", Readable.message("Watching somebody as stream: https://usher.ttvnw.net/x"));
        assertEquals("Song removal: watching somebody", Readable.message("Song removal: stream is channel:somebody"));
        assertEquals("Song removal: watching a past broadcast", Readable.message("Song removal: stream is vod:123"));
    }
}
