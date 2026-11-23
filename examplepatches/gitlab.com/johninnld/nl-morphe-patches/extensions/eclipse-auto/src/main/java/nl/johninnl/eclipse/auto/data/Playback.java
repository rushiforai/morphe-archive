package nl.johninnl.eclipse.auto.data;

import java.util.ArrayList;
import java.util.List;

/**
 * Playback and queue semantics shared by every surface (design section 3.5), written against
 * {@link AppPort} so the exact call order is testable. All of it runs on the main thread.
 */
public final class Playback {
    /** At most this many songs are added to Up Next in one go. */
    public static final int ADD_TO_UP_NEXT_CAP = 50;

    /**
     * Play {@code tracks} from {@code index}; the origin defaults to the library. Recent songs that
     * are not in the library cannot be queued, so they are left out and the start index follows the
     * song that was tapped.
     */
    public static void play(AppPort app, List<Model.Track> tracks, int index, Object origin) {
        if (tracks.isEmpty()) return;
        int tapped = Math.max(0, Math.min(index, tracks.size() - 1));
        List<Model.Track> playable = new ArrayList<>(tracks.size());
        int start = -1;
        for (int i = 0; i < tracks.size(); i++) {
            if (!tracks.get(i).isPlayable()) continue;
            if (start < 0 && i >= tapped) start = playable.size();
            playable.add(tracks.get(i));
        }
        if (playable.isEmpty()) return;
        app.play(playable, start < 0 ? playable.size() - 1 : start, origin == null ? app.libraryOrigin() : origin);
    }

    /**
     * What tapping a row does: a recent song with no library song is looked up in the catalogue and
     * played on its own; anything else plays the list from that row. {@code historyDone} hears
     * whether the lookup found something (nullable).
     */
    public static void tap(AppPort app, List<Model.Track> tracks, int index, Object origin, Async<Boolean> historyDone) {
        if (index >= 0 && index < tracks.size() && tracks.get(index).history != null) {
            app.playHistoryEntry(tracks.get(index).history, historyDone == null ? new Async<Boolean>() {
                @Override public void done(Boolean found, Throwable failure) { }
            } : historyDone);
            return;
        }
        play(app, tracks, index, origin);
    }

    /** Switch shuffle on when it is off, then play the whole list from its start. */
    public static void shuffle(AppPort app, List<Model.Track> tracks, Object origin) {
        if (tracks.isEmpty()) return;
        if (app.shuffleOff()) app.toggleShuffle();
        play(app, tracks, 0, origin);
    }

    /** Add the first {@link #ADD_TO_UP_NEXT_CAP} songs to Up Next; returns how many were added. */
    public static int addToUpNext(AppPort app, List<Model.Track> tracks) {
        int added = 0;
        for (int i = 0; i < tracks.size() && added < ADD_TO_UP_NEXT_CAP; i++) {
            if (!tracks.get(i).isPlayable()) continue;
            app.addToUpNext(tracks.get(i));
            added++;
        }
        return added;
    }

    /** Jump to {@code upNext[k]}: drop the k songs in front of it, then skip into it. */
    public static void jumpToUpNext(AppPort app, int k) {
        if (k < 0) return;
        for (int i = 0; i < k; i++) app.removeUpNext(0);
        app.skipNext(false);
    }

    /**
     * Jump to a context song at {@code absoluteIndex} of the app's queue without touching Up Next:
     * the phone clears Up Next here, the car deliberately does not.
     */
    public static void jumpToContext(AppPort app, Model.Track track, int absoluteIndex) {
        if (absoluteIndex < 0) return;
        app.setQueueIndex(absoluteIndex);
        app.playKeepingQueue(track);
    }

    /** A copy of {@code tracks} limited to {@code cap} entries (the display cap, not the play list). */
    public static List<Model.Track> head(List<Model.Track> tracks, int cap) {
        return new ArrayList<>(tracks.subList(0, Math.min(cap, tracks.size())));
    }

    private Playback() { }
}
