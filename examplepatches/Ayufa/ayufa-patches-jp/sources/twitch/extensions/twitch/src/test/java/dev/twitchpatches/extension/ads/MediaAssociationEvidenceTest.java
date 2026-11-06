package dev.twitchpatches.extension.ads;

import dev.twitchpatches.extension.ads.hls.HlsPlaylist;
import org.junit.Test;
import static org.junit.Assert.*;

public final class MediaAssociationEvidenceTest {
    private static final String BASE = "https://video-weaver.test.hls.ttvnw.net/live/source.m3u8";
    private static HlsPlaylist master(String media) {
        return HlsPlaylist.parse("#EXTM3U\n#EXT-X-STREAM-INF:BANDWIDTH=3000000,RESOLUTION=1920x1080,CODECS=\"avc1.4d401f\"\n"
                + media + "\n", "https://usher.ttvnw.net/api/v2/channel/hls/example.m3u8");
    }

    @Test public void differentiatesRedirectsQueryReorderingAndSessionChangesWithoutExposingValues() {
        String advertised = BASE + "?session=private-fixture&quality=source";
        MediaAssociationEvidence reordered = new MediaAssociationEvidence(
                BASE + "?quality=source&session=private-fixture", advertised);
        reordered.observe(master(advertised));
        assertEquals("masters=1 requestExact=0 responseExact=1 path=1 queryOrder=1 responseChanged=true",
                reordered.summary());
        assertFalse(reordered.summary().contains("private-fixture"));
        assertFalse(reordered.summary().contains("https"));

        MediaAssociationEvidence changed = new MediaAssociationEvidence(BASE + "?session=different", BASE);
        changed.observe(master(advertised));
        assertTrue(changed.summary().contains("path=1 queryOrder=0"));
    }

    @Test public void distinguishesAbsentCatalogFromDifferentHostOrPath() {
        MediaAssociationEvidence evidence = new MediaAssociationEvidence(BASE, BASE);
        assertTrue(evidence.summary().startsWith("masters=0"));
        evidence.observe(master(BASE.replace("source", "other")));
        evidence.observe(master(BASE.replace("test.hls", "different.hls")));
        assertEquals("masters=2 requestExact=0 responseExact=0 path=0 queryOrder=0 responseChanged=false",
                evidence.summary());
    }

    @Test public void comparesDuplicateParametersAndEncodedValuesAsRawMultisetsOnly() {
        MediaAssociationEvidence evidence = new MediaAssociationEvidence(BASE + "?a=one&a=two", BASE + "?a=%6fne&a=two");
        evidence.observe(master(BASE + "?a=two&a=one"));
        assertTrue(evidence.summary().contains("queryOrder=1"));
        MediaAssociationEvidence distinct = new MediaAssociationEvidence(BASE + "?a=%6fne&a=two", BASE + "?a=one");
        distinct.observe(master(BASE + "?a=two&a=one"));
        assertTrue(distinct.summary().contains("queryOrder=0"));
    }
}
