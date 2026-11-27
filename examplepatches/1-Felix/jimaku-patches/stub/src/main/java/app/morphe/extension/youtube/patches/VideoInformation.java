package app.morphe.extension.youtube.patches;

/** Signature stub of Morphe Patches' video information. */
public final class VideoInformation {
    private VideoInformation() {
    }

    /** The playback time in milliseconds, asked from the player on each call. */
    public static long getVideoTime() {
        throw new UnsupportedOperationException();
    }

    /** The length of the video in front in milliseconds, or 0 before it is known. */
    public static long getVideoLength() {
        throw new UnsupportedOperationException();
    }

    public static boolean lastVideoIdIsShort() {
        throw new UnsupportedOperationException();
    }
}
