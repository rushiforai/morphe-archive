package app.afterglow.extension.video;

/**
 * The state of one player director, mapped by name from YouTube's own enum (in 21.43.523
 * {@code Lascj;}: NEW, PLAYBACK_PENDING, PLAYBACK_LOADED, PLAYBACK_INTERRUPTED,
 * INTERSTITIAL_REQUESTED, INTERSTITIAL_PLAYING, READY, VIDEO_REQUESTED, VIDEO_PLAYING, ENDED).
 * Interstitials are ads.
 */
public enum PlayerStatus {
    NEW,
    PLAYBACK_PENDING,
    PLAYBACK_LOADED,
    PLAYBACK_INTERRUPTED,
    INTERSTITIAL_REQUESTED,
    INTERSTITIAL_PLAYING,
    READY,
    VIDEO_REQUESTED,
    VIDEO_PLAYING,
    ENDED;

    static PlayerStatus fromName(String name) {
        if (name == null) return null;
        for (PlayerStatus status : values()) {
            if (status.name().equals(name)) return status;
        }
        return null;
    }

    /** An ad (interstitial) is requested or playing instead of the video. */
    public boolean isAd() {
        return this == INTERSTITIAL_REQUESTED || this == INTERSTITIAL_PLAYING;
    }

    /** The director is about to play or plays something, ad or video. */
    public boolean isActive() {
        return this == INTERSTITIAL_REQUESTED || this == INTERSTITIAL_PLAYING
                || this == VIDEO_REQUESTED || this == VIDEO_PLAYING;
    }
}
