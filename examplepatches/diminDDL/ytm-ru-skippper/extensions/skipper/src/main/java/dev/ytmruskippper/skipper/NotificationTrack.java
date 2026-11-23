package dev.ytmruskippper.skipper;

import java.util.ArrayList;
import java.util.List;

/** A track as the media notification shows it, with the artist credit split into runs. */
final class NotificationTrack {
    final String videoId;
    final String title;
    final String artistCredit;
    final List<CreditRun> runs;

    private NotificationTrack(String videoId, String title, String artistCredit, List<CreditRun> runs) {
        this.videoId = videoId;
        this.title = title;
        this.artistCredit = artistCredit;
        this.runs = runs;
    }

    static NotificationTrack read(Object model, CharSequence title, CharSequence credit)
            throws ReflectiveOperationException {
        // Obfuscated members of the 9.30.53 track models (both implementations share them):
        // t() is the video ID, a() the artist byline, whose field c holds its text runs.
        // A run's field c is its text, and l its navigation endpoint, set for linked artists.
        String videoId = (String) model.getClass().getMethod("t").invoke(model);
        Object byline = model.getClass().getMethod("a").invoke(model);
        List<CreditRun> runs = new ArrayList<>();
        if (byline != null) {
            for (Object run : (Iterable<?>) byline.getClass().getField("c").get(byline)) {
                Class<?> type = run.getClass();
                runs.add(new CreditRun((String) type.getField("c").get(run), type.getField("l").get(run) != null));
            }
        }
        return new NotificationTrack(videoId, title == null ? "" : title.toString(),
                credit == null ? "" : credit.toString(), runs);
    }

    /** The linked artists, or the whole credit when no run is linked. */
    List<String> artistNames() {
        List<String> names = new ArrayList<>();
        for (CreditRun run : runs) {
            if (run.linked && run.text != null && !run.text.trim().isEmpty()) {
                String name = run.text.trim();
                if (!names.contains(name)) names.add(name);
            }
        }
        if (names.isEmpty() && !artistCredit.trim().isEmpty()) names.add(artistCredit.trim());
        return names;
    }

    static final class CreditRun {
        final String text;
        final boolean linked;

        CreditRun(String text, boolean linked) {
            this.text = text;
            this.linked = linked;
        }
    }
}
