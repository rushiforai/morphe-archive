package app.jimaku.extension.youtube;

/** One caption track of a video, as YouTube's player answer lists it. */
public final class CaptionTrack {
    /** YouTube's code for the track's language, such as en-GB. */
    public final String code;
    /** YouTube's signed address for the track's text. */
    public final String address;
    /** YouTube's automatic track, as against one uploaded with the video. */
    public final boolean automatic;

    CaptionTrack(String code, String address, boolean automatic) {
        this.code = code;
        this.address = address;
        this.automatic = automatic;
    }
}
