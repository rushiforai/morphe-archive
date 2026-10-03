package app.morphe.extension.facebook.media;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

public final class QualityPreferenceTest {
    @Test
    public void downloadQualityFallsBackToHighest() {
        assertEquals(
                DownloadQuality.HIGHEST,
                DownloadQuality.fromPreference(null)
        );
        assertEquals(
                DownloadQuality.HIGHEST,
                DownloadQuality.fromPreference("UNKNOWN")
        );
    }

    @Test
    public void playbackQualityFallsBackToAuto() {
        assertEquals(
                PlaybackQuality.AUTO,
                PlaybackQuality.fromPreference(null)
        );
        assertEquals(
                PlaybackQuality.AUTO,
                PlaybackQuality.fromPreference("UNKNOWN")
        );
    }

    @Test
    public void selectedDownloadAndPlaybackTargetsAreIndependent() {
        assertEquals(240, DownloadQuality.P240.targetQualityEdge());
        assertEquals(720, PlaybackQuality.P720.targetQualityEdge());
    }
}

