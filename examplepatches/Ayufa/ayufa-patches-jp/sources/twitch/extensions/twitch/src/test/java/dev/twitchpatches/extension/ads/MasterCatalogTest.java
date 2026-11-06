package dev.twitchpatches.extension.ads;

import dev.twitchpatches.extension.ads.hls.HlsPlaylist;
import org.junit.Test;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicLong;
import static org.junit.Assert.*;

public final class MasterCatalogTest {
    private static final String MEDIA = "https://video-weaver.test.hls.ttvnw.net/live/source.m3u8?session=one";
    private static HlsPlaylist master(String media) {
        return HlsPlaylist.parse("#EXTM3U\n#EXT-X-STREAM-INF:BANDWIDTH=3000000,RESOLUTION=1920x1080,CODECS=\"avc1.4d401f\"\n" + media + "\n",
                "https://usher.ttvnw.net/api/channel/hls/example.m3u8");
    }

    @Test public void mediaClientCanAdoptAnExactMasterFromAnotherClient() {
        MasterCatalog catalog = new MasterCatalog();
        catalog.register("https://usher.ttvnw.net/api/channel/hls/example.m3u8?sig=fixture", master(MEDIA));
        MasterCatalog.Entry found = catalog.find(MEDIA);
        assertNotNull(found);
        assertEquals("example", found.channel);
        assertEquals(MEDIA, found.playlist.variants.get(0).uri);
        assertNull(catalog.find(MEDIA.replace("session=one", "session=two")));
        assertNull(catalog.find(MEDIA.replace("ttvnw.net", "example.org")));
    }

    @Test public void unknownMastersAndAmbiguousChannelMappingsAreRejected() {
        MasterCatalog catalog = new MasterCatalog();
        catalog.register("https://example.org/api/channel/hls/example.m3u8", master(MEDIA));
        assertNull(catalog.find(MEDIA));
        catalog.register("https://usher.ttvnw.net/api/channel/hls/example.m3u8", master(MEDIA));
        catalog.register("https://usher.ttvnw.net/api/channel/hls/other.m3u8", master(MEDIA));
        assertNull(catalog.find(MEDIA));
    }

    @Test public void activeMediaKeepsItsHandoffAliveAndUnusedEntriesExpire() {
        AtomicLong clock = new AtomicLong();
        MasterCatalog catalog = new MasterCatalog(clock::get);
        catalog.register("https://usher.ttvnw.net/api/channel/hls/example.m3u8", master(MEDIA));
        clock.addAndGet(TimeUnit.SECONDS.toNanos(110));
        assertNotNull(catalog.find(MEDIA));
        clock.addAndGet(TimeUnit.SECONDS.toNanos(110));
        assertNotNull(catalog.find(MEDIA));
        clock.addAndGet(TimeUnit.SECONDS.toNanos(121));
        assertNull(catalog.find(MEDIA));
    }

    @Test public void capacityIsBoundedAcrossChannelChanges() {
        MasterCatalog catalog = new MasterCatalog();
        for (int index = 0; index < 33; index++) catalog.register(
                "https://usher.ttvnw.net/api/channel/hls/channel" + index + ".m3u8", master(MEDIA + index));
        assertNull(catalog.find(MEDIA + 0));
        assertNotNull(catalog.find(MEDIA + 32));
    }
}
