package app.morphe.extension.facebook.media;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

import java.util.Arrays;

public final class MediaVariantSelectorTest {
    @Test
    public void verticalVideoUsesShortEdgeAsQualityLabel() {
        MediaVariant v720 = variant("v720", 720, 1280, 3_000_000);
        MediaVariant v1080 = variant("v1080", 1080, 1920, 2_000_000);

        assertEquals(
                "v1080",
                MediaVariantSelector.bestDashVideo(
                        Arrays.asList(v720, v1080)
                ).representationId
        );
    }

    @Test
    public void equalResolutionUsesHighestBitrate() {
        MediaVariant low = variant("low", 720, 1280, 1_000_000);
        MediaVariant high = variant("high", 720, 1280, 2_000_000);

        assertEquals(
                "high",
                MediaVariantSelector.bestDashVideo(
                        Arrays.asList(low, high)
                ).representationId
        );
    }

    private static MediaVariant variant(
            String id,
            int width,
            int height,
            long bitrate
    ) {
        return new MediaVariant(
                MediaVariant.Kind.DASH_VIDEO,
                "https://video.example/" + id + ".mp4",
                width,
                height,
                bitrate,
                "video/mp4",
                "av01",
                id,
                "dash_segment_base",
                false
        );
    }
}

