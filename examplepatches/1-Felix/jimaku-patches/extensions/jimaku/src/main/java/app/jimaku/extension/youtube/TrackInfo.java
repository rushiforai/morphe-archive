package app.jimaku.extension.youtube;

import java.util.List;

/** What YouTube says about a video before anything is made, as the extension's {@code TrackInfo}. */
public final class TrackInfo {
    /** A track uploaded with the video, in one of Jimaku's languages. */
    public static final class Uploaded {
        public final String lang;
        public final CaptionTrack track;

        Uploaded(String lang, CaptionTrack track) {
            this.lang = lang;
            this.track = track;
        }
    }

    public final String video;
    public final String title;
    /** The length in seconds, from YouTube's own data so an ad's never stands in for it, or null. */
    public final Double duration;
    /** A stream that is live, yet to start, or still being processed after it ended: nothing can be made for it yet. */
    public final boolean live;
    /**
     * The track Standard translates from: the uploaded one in the automatic track's language where
     * there is one, else the automatic one; without an automatic track, the uploaded one the player
     * starts with, or the only one. Null when there is none.
     */
    public final CaptionTrack source;
    /** YouTube's automatic track, or null. */
    public final CaptionTrack automatic;
    /** {@link #source}'s language in Jimaku's codes, or null. */
    public final String language;
    /** The tracks uploaded with the video, one per language. */
    public final List<Uploaded> uploaded;

    TrackInfo(String video, String title, Double duration, boolean live, CaptionTrack source, CaptionTrack automatic, String language,
            List<Uploaded> uploaded) {
        this.video = video;
        this.title = title;
        this.duration = duration;
        this.live = live;
        this.source = source;
        this.automatic = automatic;
        this.language = language;
        this.uploaded = uploaded;
    }

    /** The track uploaded in {@code lang}, or null. */
    public CaptionTrack uploadedIn(String lang) {
        for (Uploaded each : uploaded) if (each.lang.equals(lang)) return each.track;
        return null;
    }
}
