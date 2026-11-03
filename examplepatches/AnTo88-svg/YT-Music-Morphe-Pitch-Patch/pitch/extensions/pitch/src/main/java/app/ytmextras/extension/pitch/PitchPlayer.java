package app.ytmextras.extension.pitch;

/**
 * Added to ExoPlayerImpl while patching.
 */
public interface PitchPlayer {
    void ytmextras_setPlaybackParameters(float speed, float pitch);
}
