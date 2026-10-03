package app.morphe.extension.facebook.media;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

import java.util.Arrays;

public final class DashPairSelectorTest {
    @Test
    public void neverMixesTracksAcrossManifests() {
        MediaVariant firstVideo = variant(
                MediaVariant.Kind.DASH_VIDEO,
                "first",
                "v1",
                720,
                1280,
                1_000_000
        );
        MediaVariant firstAudio = variant(
                MediaVariant.Kind.DASH_AUDIO,
                "first",
                "a1",
                0,
                0,
                64_000
        );
        MediaVariant secondVideo = variant(
                MediaVariant.Kind.DASH_VIDEO,
                "second",
                "v2",
                1080,
                1920,
                2_000_000
        );
        MediaVariant secondAudio = variant(
                MediaVariant.Kind.DASH_AUDIO,
                "second",
                "a2",
                0,
                0,
                128_000
        );

        MediaVariantSelector.DashPair pair =
                MediaVariantSelector.bestDashPair(
                        Arrays.asList(
                                firstVideo,
                                firstAudio,
                                secondVideo,
                                secondAudio
                        )
                );
        assertEquals("second", pair.video.manifestId);
        assertEquals("second", pair.audio.manifestId);
        assertEquals("v2", pair.video.representationId);
        assertEquals("a2", pair.audio.representationId);
    }

    private static MediaVariant variant(
            MediaVariant.Kind kind,
            String manifest,
            String id,
            int width,
            int height,
            long bitrate
    ) {
        return new MediaVariant(
                kind,
                "https://video.example/" + id + ".mp4",
                width,
                height,
                bitrate,
                kind == MediaVariant.Kind.DASH_AUDIO
                        ? "audio/mp4"
                        : "video/mp4",
                kind == MediaVariant.Kind.DASH_AUDIO ? "mp4a" : "av01",
                id,
                manifest,
                "dash_segment_base",
                false
        );
    }
}
