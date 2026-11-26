/*
 * Copyright (C) 2026 lavinhoque33
 *
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-25.
 */

package app.morphe.extension.youtube.patches.general.offline;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertThrows;
import static org.junit.Assert.assertTrue;

import java.io.IOException;
import java.util.List;

import org.junit.Test;

public class OfflineHlsIdentityTest {
    private static final String PLAYLIST = "https://manifest.googlevideo.com/fixture/index.m3u8";
    private static final String SLICES = "slices=0-219,2092442-3671657";

    @Test
    public void refreshedVodSignatureMayChangeButEncodeAndEachPieceMayNot() {
        String original = segment("rr1", "100", "3D312", SLICES, 1, "/file/seg.ts");
        String refresh = segment("rr2", "200", "3D312", SLICES, 1, "/file/seg.ts");
        assertTrue(OfflineHlsIdentity.same(original, refresh, false));
        assertTrue(OfflineHlsIdentity.same(original, refresh.replace("/sig/new", "/sig/a%2Fb"), false));
        assertFalse(OfflineHlsIdentity.same(original, refresh.replace("/itag/616/", "/itag/617/"), false));
        assertFalse(OfflineHlsIdentity.same(original, refresh.replace("/id/vod/", "/id/other/"), false));
        assertFalse(OfflineHlsIdentity.same(original, refresh.replace("lmt%3D312", "lmt%3D313"), false));
        assertFalse(OfflineHlsIdentity.same(original, refresh.replace("/gosq/1", "/gosq/2"), false));
        assertFalse(OfflineHlsIdentity.same(original, refresh.replace("219,", "220,"), false));
        String init = segment("rr2", "200", "3D312", SLICES, 1, "?is=1&file=seg.ts");
        assertFalse(OfflineHlsIdentity.same(original, init, false));
        assertTrue(OfflineHlsIdentity.same(init, init.replace("/expire/200/", "/expire/300/"), false));
    }

    @Test
    public void byteRangePlaylistKeepsLongOffsetsAndRequiresTheSameResourceForAnImplicitOffset() throws Exception {
        String playlist = """
                #EXTM3U
                #EXT-X-MAP:URI="init.mp4",BYTERANGE="24@0"
                #EXT-X-BYTERANGE:12@2147483650
                stream.mp4
                #EXT-X-BYTERANGE:24
                stream.mp4
                #EXTINF:2.0,
                whole.m4s
                #EXT-X-ENDLIST
                """;
        assertEquals(List.of(
                new OfflineHls.Segment("https://manifest.googlevideo.com/fixture/init.mp4", 0, 24),
                new OfflineHls.Segment("https://manifest.googlevideo.com/fixture/stream.mp4", 2147483650L, 12),
                new OfflineHls.Segment("https://manifest.googlevideo.com/fixture/stream.mp4", 2147483662L, 24),
                new OfflineHls.Segment("https://manifest.googlevideo.com/fixture/whole.m4s", 0, -1)),
                OfflineHls.parseMediaPlaylist(playlist, PLAYLIST).segments());
        assertThrows(IOException.class, () -> OfflineHls.parseMediaPlaylist(
                playlist.replace(":24\nstream.mp4", ":24\nother.mp4"), PLAYLIST));
        assertThrows(IOException.class, () -> OfflineHls.parseMediaPlaylist(
                playlist.replace("2147483650", "9223372036854775800"), PLAYLIST));
        assertThrows(IOException.class, () -> OfflineHls.parseMediaPlaylist(
                playlist.replace("#EXT-X-ENDLIST", ""), PLAYLIST));
    }

    private static String segment(String host, String expiry, String revision, String slice, int sequence,
                                  String suffix) {
        return "https://" + host + ".googlevideo.com/videoplayback/id/vod/itag/616/expire/" + expiry
                + "/sgovp/clen%3D152418061%3Bdur%3D281.489%3Bgir%3Dyes%3Bitag%3D356%3Blmt%" + revision
                + "/sig/new/playlist/index.m3u8/govp/" + slice + "/gosq/" + sequence + suffix;
    }
}
