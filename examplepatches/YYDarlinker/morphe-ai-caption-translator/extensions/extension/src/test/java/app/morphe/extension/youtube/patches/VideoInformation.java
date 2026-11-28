package app.morphe.extension.youtube.patches;

/** The public getters read by the add-on at runtime. */
public final class VideoInformation {
    public static String videoId = "";
    public static long position;
    public static float speed = 1f;

    public static String getVideoId() { return videoId; }
    public static long getVideoTime() { return position; }
    public static float getPlaybackSpeed() { return speed; }
}
