package app.bitchord.telegram;

import com.music.bitchord.data.model.Song;
import com.music.bitchord.data.sources.TrackMatcher;

import java.util.ArrayList;
import java.util.List;

/**
 * A stricter check for Telegram files before BitChord picks one to play instead of a song.
 *
 * <p>BitChord accepts a title that merely contains the other one, within 30 seconds, which is fine
 * for streaming catalogues but let "How I'd Love To Love You" stand in for "L-O-V-E". A Telegram
 * file must have the same title (brackets and punctuation aside) within 10 seconds, or a containing
 * title within 3 seconds.
 */
public final class TelegramMatch {
    private TelegramMatch() {}

    static final int SAME_TITLE_SEC = 10, CONTAINED_TITLE_SEC = 3;
    static final String TELEGRAM = "src:" + NativeSource.ID + "::";

    /** Called first in BitChord's TrackMatcher.best and .ranked. Never throws. */
    public static List<Song> filter(List<Song> candidates, TrackMatcher.Target target) {
        try {
            if (candidates == null || target == null) return candidates;
            List<Song> kept = null;
            for (int i = 0; i < candidates.size(); i++) {
                Song song = candidates.get(i);
                boolean telegram =
                        song != null && song.videoId != null && song.videoId.startsWith(TELEGRAM);
                boolean ok =
                        !telegram
                                || accepts(
                                        target.title,
                                        target.durationSec,
                                        song.title,
                                        LegendMatch.seconds(song.durationText));
                boolean checking = false;
                if (!ok) {
                    SoundCheck sound = SoundCheck.active;
                    int gotSec = LegendMatch.seconds(song.durationText);
                    if (sound != null
                            && uncertain(target.title, target.durationSec, song.title, gotSec)) {
                        sound.consider(
                                target.title,
                                target.artist,
                                target.durationSec,
                                song.videoId.substring(TELEGRAM.length()));
                        checking = true;
                    }
                }
                if (!ok)
                    HostLog.d(
                            "Unofficial Telegram skipped '"
                                    + song.title
                                    + "' ("
                                    + HostLog.length(LegendMatch.seconds(song.durationText))
                                    + ") for '"
                                    + target.title
                                    + "' ("
                                    + HostLog.length(
                                            target.durationSec == null ? 0 : target.durationSec)
                                    + "): the title or length doesn't match"
                                    + (checking ? "; it'll be checked by sound" : ""));
                if (!ok && kept == null) kept = new ArrayList<>(candidates.subList(0, i));
                if (ok && kept != null) kept.add(song);
            }
            return kept == null ? candidates : kept;
        } catch (Throwable e) {
            return candidates;
        }
    }

    static boolean accepts(String wanted, Integer wantedSec, String got, int gotSec) {
        List<String> a = TrackNames.words(core(wanted)), b = TrackNames.words(core(got));
        if (a.isEmpty() || b.isEmpty()) return false;
        int drift =
                wantedSec != null && wantedSec > 0 && gotSec > 0
                        ? Math.abs(wantedSec - gotSec)
                        : -1;
        boolean same = a.equals(b) || String.join("", a).equals(String.join("", b));
        if (same) return drift <= SAME_TITLE_SEC;
        boolean contained = contains(a, b) || contains(b, a);
        return contained && drift >= 0 && drift <= CONTAINED_TITLE_SEC;
    }

    /**
     * Turned down only for its length: the same or a containing title, with a length that's off by
     * more than {@link #accepts} allows but no more than a minute. Worth checking by sound.
     */
    static boolean uncertain(String wanted, Integer wantedSec, String got, int gotSec) {
        if (wantedSec == null || wantedSec <= 0 || gotSec <= 0) return false;
        if (accepts(wanted, wantedSec, got, gotSec)) return false;
        List<String> a = TrackNames.words(core(wanted)), b = TrackNames.words(core(got));
        if (a.isEmpty() || b.isEmpty()) return false;
        boolean related =
                a.equals(b)
                        || String.join("", a).equals(String.join("", b))
                        || contains(a, b)
                        || contains(b, a);
        return related && Math.abs(wantedSec - gotSec) <= SoundCheck.MAX_DRIFT_SEC;
    }

    /** The title without bracketed parts: "(Remastered 2009)", "[Live]". */
    static String core(String title) {
        if (title == null) return "";
        String text = title.replaceAll("[(\\[{][^)\\]}]*[)\\]}]", " ");
        int open = text.indexOf('(');
        if (open < 0) open = text.indexOf('[');
        return (open >= 0 ? text.substring(0, open) : text).trim();
    }

    /** Whether {@code inner} appears in {@code outer} as consecutive words. */
    static boolean contains(List<String> outer, List<String> inner) {
        if (inner.size() >= outer.size()) return false;
        for (int i = 0; i + inner.size() <= outer.size(); i++)
            if (outer.subList(i, i + inner.size()).equals(inner)) return true;
        return false;
    }
}
