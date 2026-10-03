package app.morphe.extension.facebook.media;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import org.junit.Test;

import java.util.List;

public final class DashManifestParserTest {
    @Test
    public void parsesFacebookBaseUrlSegmentBaseManifest() {
        String manifest =
                "<?xml version=\"1.0\" encoding=\"UTF-8\"?>" +
                "<MPD xmlns=\"urn:mpeg:dash:schema:mpd:2011\">" +
                "<Period>" +
                "<AdaptationSet contentType=\"video\" mimeType=\"video/mp4\">" +
                "<Representation id=\"v720\" width=\"720\" height=\"1280\" " +
                "bandwidth=\"1500000\" codecs=\"av01.0.05M.08\">" +
                "<BaseURL>https://video.example/v720.mp4?a=1&amp;b=2</BaseURL>" +
                "<SegmentBase indexRange=\"100-200\"/>" +
                "</Representation>" +
                "<Representation id=\"v1080\" width=\"1080\" height=\"1920\" " +
                "bandwidth=\"3200000\" codecs=\"av01.0.08M.08\">" +
                "<BaseURL>https://video.example/v1080.mp4</BaseURL>" +
                "<SegmentBase indexRange=\"100-200\"/>" +
                "</Representation>" +
                "</AdaptationSet>" +
                "<AdaptationSet contentType=\"audio\" mimeType=\"audio/mp4\">" +
                "<Representation id=\"a64\" bandwidth=\"64000\" codecs=\"mp4a.40.42\">" +
                "<BaseURL>https://video.example/a64.mp4</BaseURL>" +
                "<SegmentBase indexRange=\"50-90\"/>" +
                "</Representation>" +
                "<Representation id=\"a128\" bandwidth=\"128000\" codecs=\"mp4a.40.42\">" +
                "<BaseURL>https://video.example/a128.mp4</BaseURL>" +
                "<SegmentBase indexRange=\"50-90\"/>" +
                "</Representation>" +
                "</AdaptationSet>" +
                "</Period>" +
                "</MPD>";

        List<MediaVariant> variants = DashManifestParser.parse(manifest);
        assertEquals(4, variants.size());

        MediaVariant video = MediaVariantSelector.bestDashVideo(variants);
        assertNotNull(video);
        assertEquals("v1080", video.representationId);
        assertEquals(1080, video.qualityEdge());
        assertEquals("dash_segment_base", video.sourceRole);
        assertEquals(
                video.manifestId,
                MediaVariantSelector.bestDashPair(variants)
                        .audio.manifestId
        );

        MediaVariant audio = MediaVariantSelector.bestDashAudio(variants);
        assertNotNull(audio);
        assertEquals("a128", audio.representationId);
        assertEquals(128000, audio.bitrate);
    }

    @Test
    public void malformedManifestReturnsEmptyList() {
        assertEquals(
                0,
                DashManifestParser.parse("<MPD><broken>").size()
        );
    }
}

