package app.jimaku.extension.youtube;

import java.util.ArrayList;
import java.util.List;

/** What YouTube says about a video, as tests outside this package need it. */
public final class TrackFixtures {
    private TrackFixtures() {
    }

    /** A video with an automatic track in {@code language}, or none where it is null, and captions uploaded in {@code uploaded}. */
    public static TrackInfo track(String video, String language, Double duration, boolean live, String... uploaded) {
        CaptionTrack automatic = language != null ? new CaptionTrack(language, "https://www.youtube.com/api/timedtext?v=" + video, true) : null;
        List<TrackInfo.Uploaded> tracks = new ArrayList<>();
        for (String lang : uploaded) {
            tracks.add(new TrackInfo.Uploaded(lang, new CaptionTrack(lang, "https://www.youtube.com/api/timedtext?lang=" + lang, false)));
        }
        return new TrackInfo(video, "A video", duration, live, automatic, automatic, language, tracks);
    }
}
