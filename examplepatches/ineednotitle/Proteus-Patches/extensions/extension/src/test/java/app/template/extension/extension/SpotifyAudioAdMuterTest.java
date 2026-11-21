package app.template.extension.extension;

import org.junit.Test;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

public class SpotifyAudioAdMuterTest {

    @Test
    public void detectsAdsByIdMarkers() {
        assertTrue(SpotifyAudioAdMuter.isAd("spotify:ad:12345", "Anything", "Anyone", 30000));
        assertTrue(SpotifyAudioAdMuter.isAd("spotifyad:promo", null, null, -1));
        assertTrue(SpotifyAudioAdMuter.isAd("urn:item:ad:9", null, null, -1));
        assertTrue(SpotifyAudioAdMuter.isAd("media/track/audio-ad-1", null, null, -1));
    }

    @Test
    public void detectsAdsByLocalizedTitles() {
        assertTrue(SpotifyAudioAdMuter.isAd(null, "Advertisement", "Brand", 30000));
        assertTrue(SpotifyAudioAdMuter.isAd(null, "Werbung", "Brand", 30000));
        assertTrue(SpotifyAudioAdMuter.isAd(null, " advertisement ", "Brand", 30000));
    }

    @Test
    public void detectsShortUnnamedSpotifyItemsAsAds() {
        assertTrue(SpotifyAudioAdMuter.isAd(null, "", "Spotify", 30000));
        assertTrue(SpotifyAudioAdMuter.isAd(null, "Spotify", "Spotify", 2000));
    }

    @Test
    public void keepsRealTracks() {
        assertFalse(SpotifyAudioAdMuter.isAd("spotify:track:abc", "Song", "Artist", 200000));
        assertFalse(SpotifyAudioAdMuter.isAd(null, "Advertisement (Deluxe)", "Artist", 200000));
    }

    @Test
    public void keepsShortOrLongItemsByOtherArtists() {
        // Too short or too long to be an ad, and not attributed to Spotify.
        assertFalse(SpotifyAudioAdMuter.isAd(null, "", "Artist", 500));
        assertFalse(SpotifyAudioAdMuter.isAd(null, "", "Artist", 600000));
    }

    @Test
    public void keepsLongItemsBySpotify() {
        // Podcast-style content "by Spotify" is not an ad.
        assertFalse(SpotifyAudioAdMuter.isAd(null, "Episode", "Spotify", 3600000));
    }

    @Test
    public void toleratesNullMetadata() {
        assertFalse(SpotifyAudioAdMuter.isAd(null, null, null, -1));
    }
}
