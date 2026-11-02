package app.spicetify.extension.spotify.localserver;

import java.io.File;
import java.net.URI;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 35, manifest = Config.NONE)
public class IndexCacheTest {
    private final JellyfinConnection jellyfin = new JellyfinConnection(
            new JellyfinClient.Account(new ServerConnection("https://music.example/", "", ""),
                    "device", "cccccccccccccccccccccccccccccccc", "Listener", "secret"),
            "dddddddddddddddddddddddddddddddd", "Music");

    @Test public void savedTracksComeBackWithTheSameIdsAndBrowseFacts() throws Exception {
        List<BrowseMetadata.ArtistCredit> band = Collections.singletonList(new BrowseMetadata.ArtistCredit("eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee", "Band"));
        RemoteTrack jellyfinTrack = new RemoteTrack(jellyfin, URI.create("https://music.example/Audio/1/stream"), "1", "source",
                2048, "v1", "flac", "Song", "Album", "Band", 181,
                new BrowseMetadata("ffffffffffffffffffffffffffffffff", "", "Band", "tag", band, band, 1, 3));
        ServerConnection dav = new ServerConnection("https://files.example/music/", "user", "secret");
        RemoteTrack davTrack = new RemoteTrack(dav, URI.create("https://files.example/music/a/b.mp3"), 1024, "\"etag\"")
                .withMetadata(dav, "Other", "Record", "Singer", "Singer", 2, 7, 95);
        File file = File.createTempFile("index", ".bin");
        IndexCache.commit(IndexCache.write(file, "key", Arrays.asList(jellyfinTrack, davTrack)), file);

        List<RemoteTrack> restored = IndexCache.read(file, "key");
        assertEquals(2, restored.size());
        RemoteTrack first = restored.get(0);
        assertEquals(jellyfinTrack.id, first.id);
        assertEquals(jellyfinTrack.url, first.url);
        assertEquals(jellyfinTrack.providerIdentity, first.providerIdentity);
        assertEquals(181, first.durationSeconds);
        assertEquals("tag", first.browse.albumImageTag);
        assertEquals("Band", first.browse.albumArtists.get(0).name);
        assertEquals(3, first.browse.trackNumber);
        RemoteTrack second = restored.get(1);
        assertEquals(davTrack.id, second.id);
        assertEquals("\"etag\"", second.etag);
        assertNull(second.providerIdentity);
        assertEquals(7, second.browse.trackNumber);
        assertTrue(file.delete());
    }

    @Test public void aScanForAnotherServerIsIgnored() throws Exception {
        File file = File.createTempFile("index", ".bin");
        IndexCache.commit(IndexCache.write(file, "one", Collections.emptyList()), file);
        assertTrue(IndexCache.read(file, "two").isEmpty());
        assertTrue(file.delete());
        assertTrue(IndexCache.read(file, "one").isEmpty());
    }

    @Test public void aTruncatedIndexIsDeletedInsteadOfRead() throws Exception {
        File file = File.createTempFile("index", ".bin");
        java.nio.file.Files.write(file.toPath(), new byte[] {0x1f, (byte) 0x8b, 8, 0});
        assertTrue(IndexCache.read(file, "key").isEmpty());
        assertFalse(file.exists());
    }
}
