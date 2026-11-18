package app.afterglow.extension.video;

/**
 * One of YouTube's video players: the local player director that plays a video on the
 * device, or the casting (MDX) director. The methods are added to YouTube's obfuscated
 * director classes by {@code VideoStatePatch} and call the director's own methods, so
 * a seek or speed change goes through the same code as YouTube's own controls.
 *
 * <p>Only {@link VideoState} should hold these, and only weakly; call them on the main
 * thread.
 */
public interface PlayerController {
    /** Seeks to an absolute time in milliseconds. False if the director refused. */
    boolean afterglow_seekTo(long timeMs);

    /** Seeks by an offset in milliseconds. False if the director refused. */
    boolean afterglow_seekToRelative(long offsetMs);

    /** Current playback time in milliseconds. */
    long afterglow_getVideoTime();

    /** Current playback rate, 1.0 for normal speed. */
    float afterglow_getPlaybackSpeed();

    /** Sets the playback rate, as YouTube's speed menu does. */
    void afterglow_setPlaybackSpeed(float speed);

    /** Id of the video this director plays, or null before it has one. */
    String afterglow_getVideoId();
}
