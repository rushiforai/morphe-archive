package app.morphe.extension.facebook.media;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

import java.util.Arrays;
import java.util.List;

public final class ResolutionTargetSelectorTest {
    private final List<MediaVariant> variants = Arrays.asList(
            variant(240, 200_000),
            variant(360, 400_000),
            variant(540, 700_000),
            variant(720, 1_500_000),
            variant(1080, 3_000_000)
    );

    @Test
    public void exactTargetWins() {
        assertEquals(
                720,
                MediaVariantSelector.bestDashVideoForTarget(
                        variants,
                        720
                ).qualityEdge()
        );
    }

    @Test
    public void nearestLowerWinsBeforeHigher() {
        assertEquals(
                540,
                MediaVariantSelector.bestDashVideoForTarget(
                        variants,
                        640
                ).qualityEdge()
        );
    }

    @Test
    public void lowestHigherIsUsedWhenNoLowerExists() {
        assertEquals(
                240,
                MediaVariantSelector.bestDashVideoForTarget(
                        variants,
                        180
                ).qualityEdge()
        );
    }

    @Test
    public void zeroTargetMeansHighestAvailable() {
        assertEquals(
                1080,
                MediaVariantSelector.bestDashVideoForTarget(
                        variants,
                        0
                ).qualityEdge()
        );
    }

    @Test
    public void dashPairHonorsDownloadTarget() {
        MediaVariant audio = new MediaVariant(
                MediaVariant.Kind.DASH_AUDIO,
                "https://video.example/audio.m4a",
                0,
                0,
                128_000,
                "audio/mp4",
                "mp4a",
                "audio",
                "manifest",
                "dash_segment_base",
                true
        );
        MediaVariantSelector.DashPair pair =
                MediaVariantSelector.bestDashPair(
                        Arrays.asList(
                                variant(240, 200_000),
                                variant(720, 1_500_000),
                                audio
                        ),
                        240
                );

        assertEquals(240, pair.video.qualityEdge());
    }

    private static MediaVariant variant(int edge, long bitrate) {
        return new MediaVariant(
                MediaVariant.Kind.DASH_VIDEO,
                "https://video.example/" + edge + ".mp4",
                edge,
                edge * 16 / 9,
                bitrate,
                "video/mp4",
                "av01",
                "v" + edge,
                "manifest",
                "dash_segment_base",
                false
        );
    }
}
