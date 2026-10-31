package app.morphed.extension.twitch.hls;

import org.junit.Test;

import java.util.Arrays;
import java.util.LinkedHashSet;

import app.morphed.extension.twitch.Playlists;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

public class AdMarkersTest {
    @Test
    public void detectsStitchedAdDateRange() {
        assertTrue(AdMarkers.hasAdTags(Playlists.AD_DATERANGE));
    }

    @Test
    public void detectsCueOut() {
        assertTrue(AdMarkers.hasAdTags("#EXT-X-CUE-OUT:30"));
    }

    @Test
    public void ignoresSessionMetadata() {
        String line = "#EXT-X-DATERANGE:ID=\"source-1\",CLASS=\"twitch-stream-source\",START-DATE=\"2026-10-28T12:00:00Z\"";
        assertFalse(AdMarkers.hasAdTags(line));
        assertFalse(AdMarkers.isAdTagLine(line));
    }

    @Test
    public void adTagLinesIncludeCueInAndTrackingAttributes() {
        assertTrue(AdMarkers.isAdTagLine("#EXT-X-CUE-IN"));
        assertTrue(AdMarkers.isAdTagLine("#EXT-X-DATERANGE:ID=\"x\",X-TV-TWITCH-AD-URL=\"https://ads\""));
        assertFalse(AdMarkers.isAdTagLine("https://edge.example/stitched-ad/1.ts"));
    }

    @Test
    public void suspiciousMarkersFindNewAdClassesAndTags() {
        String text = "#EXTM3U\n"
                + "#EXT-X-DATERANGE:ID=\"a\",CLASS=\"twitch-video-ad\",START-DATE=\"2026-10-28T12:00:00Z\"\n"
                + "#EXT-X-SPLICE-POINT:1\n"
                + "#EXT-X-DATERANGE:ID=\"b\",CLASS=\"twitch-stream-source\",START-DATE=\"2026-10-28T12:00:00Z\"\n";

        assertEquals(new LinkedHashSet<>(Arrays.asList("CLASS=\"twitch-video-ad\"", "#EXT-X-SPLICE-POINT")),
                AdMarkers.suspiciousMarkers(text));
    }

    @Test
    public void lingeringQuartileBeaconIsNotSuspicious() {
        String text = "#EXTM3U\n#EXT-X-DATERANGE:ID=\"q\",CLASS=\"twitch-ad-quartile\",START-DATE=\"2026-10-28T12:00:00Z\","
                + "X-TV-TWITCH-AD-QUARTILE=\"2\",X-TV-TWITCH-AD-URL=\"https://ads.example\"\n";

        assertTrue(AdMarkers.suspiciousMarkers(text).isEmpty());
        assertFalse(AdMarkers.hasAdTags(text));
        assertTrue(AdMarkers.isAdTagLine(text.split("\n")[1]));
    }

    @Test
    public void adClassesMatchWhereverClassStandsInTheLine() {
        assertTrue(AdMarkers.hasAdTags("#EXT-X-DATERANGE:ID=\"m\",CLASS=\"twitch-maf-ad\",START-DATE=\"2026-10-28T12:00:00Z\""));
        assertTrue(AdMarkers.hasAdTags("#EXT-X-DATERANGE:CLASS=\"twitch-trigger\",ID=\"t\""));
        assertTrue(AdMarkers.hasAdTags("#EXT-X-DATERANGE:ID=\"t\",CLASS=\"twitch-trigger\""));
    }

    @Test
    public void ordinaryPlaylistHasNoSuspiciousMarkers() {
        assertTrue(AdMarkers.suspiciousMarkers(Playlists.media("n", 100, "llll", false)
                + "#EXT-X-PRELOAD-HINT:TYPE=PART,URI=\"x\"\n").isEmpty());
    }

    @Test
    public void recognisesAdSegmentUrls() {
        assertTrue(AdMarkers.isAdSegmentUrl("https://edge.example/adsquared/1.ts"));
        assertFalse(AdMarkers.isAdSegmentUrl("https://edge.example/live/1.ts"));
        // Placeholders are not ads by themselves: Twitch also serves them when a stream hiccups.
        assertFalse(AdMarkers.isAdSegmentUrl("https://edge.example/_404/1.ts"));
        assertTrue(AdMarkers.isPlaceholderUrl("https://edge.example/_404/1.ts"));
        assertTrue(AdMarkers.isPlaceholderUrl("https://edge.example/processing/1.ts"));
    }
}
