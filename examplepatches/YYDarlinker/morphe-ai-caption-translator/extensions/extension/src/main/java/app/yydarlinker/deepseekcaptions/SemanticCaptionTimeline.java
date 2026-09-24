package app.yydarlinker.deepseekcaptions;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

final class SemanticCaptionTimeline {
    private static final long PRESENTATION_LEAD_MS = 0L;

    private static volatile String currentVideo = "";
    private static volatile String ownerVideo = "";
    private static volatile List<CaptionDocument.Cue> cues = Collections.emptyList();

    private SemanticCaptionTimeline() {}

    static long presentationTime(long rawTimeMs) {
        return Math.max(0L, rawTimeMs) + PRESENTATION_LEAD_MS;
    }

    static void onVideoId(String value) {
        currentVideo = value == null ? "" : value.trim();
    }

    static String currentVideoId() {
        return currentVideo;
    }

    static boolean replace(String videoId, List<CaptionDocument.Cue> values) {
        String owner = videoId == null ? "" : videoId.trim();
        if (owner.isEmpty()) return false;
        ownerVideo = owner;
        cues = values == null
                ? Collections.emptyList()
                : Collections.unmodifiableList(new ArrayList<>(values));
        return true;
    }

    static CaptionDocument.Cue activeCue(long timeMs) {
        List<CaptionDocument.Cue> local = cues;
        if (local.isEmpty()) return null;
        String current = currentVideo;
        String owner = ownerVideo;
        if (!current.isEmpty() && !owner.isEmpty() && !current.equals(owner)) return null;

        int low = 0;
        int high = local.size();
        while (low < high) {
            int middle = (low + high) >>> 1;
            if (local.get(middle).startMs <= timeMs) low = middle + 1;
            else high = middle;
        }
        int index = Math.max(0, low - 1);
        CaptionDocument.Cue cue = local.get(index);
        return timeMs >= cue.startMs && timeMs < cue.endMs ? cue : null;
    }
}
