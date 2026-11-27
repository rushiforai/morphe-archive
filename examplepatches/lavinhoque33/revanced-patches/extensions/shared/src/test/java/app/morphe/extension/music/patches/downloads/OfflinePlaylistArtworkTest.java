/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-26.
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;

import java.io.File;
import java.nio.file.Files;
import java.util.Map;
import java.util.Set;

public class OfflinePlaylistArtworkTest {
    private static final String SONG = "AAAAAAAAAAA";
    private static final String VIDEO = "BBBBBBBBBBB";
    private static final String OTHER = "CCCCCCCCCCC";
    private static final String SOURCE = "PLsynthetic";
    private static final String ALIAS = "MPREb_synthetic";
    private static final String SONG_URI = "file:///tracks/song.thumb";
    private static final String VIDEO_URI = "file:///tracks/video.thumb";
    private static final byte[] ARTWORK = {1, 2, 3};

    @Rule public TemporaryFolder temporary = new TemporaryFolder();

    @Test
    public void usesExactTrackFirstAndKnownAliasOnlyWhenNeeded() {
        OfflinePlaylistArtwork.TrackCovers tracks = new OfflinePlaylistArtwork.TrackCovers(
                Map.of(SONG, SONG_URI)::get, Map.of(VIDEO, SONG)::get);
        assertEquals(SONG_URI, tracks.uri(SONG));
        assertEquals(SONG_URI, tracks.uri(VIDEO));
        assertNull(tracks.uri(OTHER));
    }

    @Test
    public void resolvesAStoredVideoPartnerWithoutSwitchingAnExactSongCover() {
        OfflinePlaylistArtwork.TrackCovers tracks = new OfflinePlaylistArtwork.TrackCovers(
                Map.of(VIDEO, VIDEO_URI)::get, Map.of(SONG, VIDEO)::get);
        assertEquals(VIDEO_URI, tracks.uri(SONG));

        OfflinePlaylistArtwork.TrackCovers own = new OfflinePlaylistArtwork.TrackCovers(
                Map.of(VIDEO, VIDEO_URI, SONG, SONG_URI)::get, Map.of(SONG, VIDEO)::get);
        assertEquals(SONG_URI, own.uri(SONG));
    }

    @Test
    public void declinesAnInvalidPartnerId() {
        OfflinePlaylistArtwork.TrackCovers tracks = new OfflinePlaylistArtwork.TrackCovers(
                Map.of(SONG, SONG_URI)::get, id -> "../invalid");
        assertNull(tracks.uri(VIDEO));
    }

    @Test
    public void sharesStoredHeaderImageAndRetainsItForTheLastSource() throws Exception {
        OfflinePlaylistCoverFiles files = new OfflinePlaylistCoverFiles(temporary.getRoot());
        String asset = OfflinePlaylistCoverFiles.assetHash("known-gallery-cover");
        files.remember(SOURCE, asset, ARTWORK, () -> true);
        assertTrue(files.linkShared(ALIAS, asset, () -> true));

        OfflinePlaylistCoverFiles.Ref ref = files.read(SOURCE);
        assertNotNull(ref);
        assertEquals(ref, files.read(ALIAS));
        File image = files.image(ref);
        assertNotNull(image);
        assertArrayEquals(ARTWORK, Files.readAllBytes(image.toPath()));

        files.retainOnly(Set.of(ALIAS));
        assertNull(files.read(SOURCE));
        assertTrue(image.isFile());
        files.retainOnly(Set.of());
        assertNull(files.read(ALIAS));
        assertFalse(image.exists());
    }

    @Test
    public void avoidsASecondImageFileForEqualBytesAndLinksTrackCoversWithoutCopying() throws Exception {
        OfflinePlaylistCoverFiles files = new OfflinePlaylistCoverFiles(temporary.getRoot());
        String first = OfflinePlaylistCoverFiles.assetHash("known-gallery-cover");
        String second = OfflinePlaylistCoverFiles.assetHash("alternate-gallery-cover");
        files.remember(SOURCE, first, ARTWORK, () -> true);
        files.remember(ALIAS, second, ARTWORK, () -> true);
        assertEquals(files.image(files.read(SOURCE)), files.image(files.read(ALIAS)));

        files.linkTrack(SOURCE, first, VIDEO, () -> true);
        OfflinePlaylistCoverFiles.Ref ref = files.read(SOURCE);
        assertNotNull(ref);
        assertEquals(VIDEO, ref.target());
        assertTrue(ref.isTrack());
        assertNull(files.image(ref));
    }

    @Test
    public void declinesAnOversizedImageOrACompletedTransferForADiscardedSource() throws Exception {
        OfflinePlaylistCoverFiles files = new OfflinePlaylistCoverFiles(temporary.getRoot());
        String asset = OfflinePlaylistCoverFiles.assetHash("known-gallery-cover");
        files.remember(SOURCE, asset, ARTWORK, () -> false);
        assertNull(files.read(SOURCE));
        files.remember(SOURCE, asset, new byte[OfflinePlaylistCoverFiles.MAX_IMAGE_BYTES + 1], () -> true);
        assertNull(files.read(SOURCE));
        assertArrayEquals(new String[0], temporary.getRoot().list());
    }
}
