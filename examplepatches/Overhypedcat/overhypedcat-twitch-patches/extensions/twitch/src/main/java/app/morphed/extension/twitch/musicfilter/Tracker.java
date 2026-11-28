package app.morphed.extension.twitch.musicfilter;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Works out what's playing and where, from what was heard (a port of Mor Assistant's relay.Tracker: same timings, budget
 * and decisions). The filter reads {@link #playing} as it goes; the listener hears what it's doing and what went
 * wrong, never kept quiet.
 */
public final class Tracker {
    public static final int RATE = Canceller.RATE;
    static final int MATCH_S = 8; // seconds of the stream a copy is first lined up with
    static final int FOLLOW_S = 4; // seconds checked against the song while it's taken out
    static final int ASK_S = 5; // seconds Shazam hears, sent in one request
    static final int LISTEN_GAP_S = 3; // Shazam knew nothing: this long, then it hears the next ASK_S (no overlap)
    static final int CHECK_S = 4; // how often the song's place is checked while it's being taken out
    static final int LOST = 6; // checks in a row without finding the song where it should be: it has stopped
    static final int[] SHAZAM_ON_MISSES = {2, 4}; // which of those checks ask Shazam what's playing
    static final int NOTHING_RUN = 2; // answers in a row without a song: no music now, so Shazam rests...
    static final int NOTHING_REST_S = 60; // ...this long
    static final int NEXT_SONG_WAIT_S = 0; // once a song is over, this long before Shazam is asked what's next
    static final int LISTEN_S = 6; // a song named but not taken out yet: tried again this soon
    static final int KNOWN_S = 10; // how often the stream is looked for among the songs heard before
    static final int KNOWN_MAX = 60; // the latest songs heard before that are looked through
    static final int UNUSABLE_S = 20; // how often Shazam is asked while a song with no usable copy plays
    static final int LIMITED_S = 60; // Shazam refused: left alone this long, doubling each time...
    static final int LIMITED_MAX_S = 240; // ...up to this
    static final int WAVER = Align.REACH; // a place found this few samples off is no move
    static final int RETRIES = 2; // a song named that couldn't be taken out yet is tried again this many times
    static final String RATE_LIMIT = "Shazam rate limit";

    /** Names the song in a few seconds of mono sound; null when Shazam doesn't know it. */
    public interface Recognizer {
        Song recognize(float[] sound) throws SongProblem;
    }

    /** The clean copies: which copy matched which song, the downloads and their prints. */
    public interface Library {
        /** YouTube ids to try: the one that matched before, then the searches' results (searched lazily). */
        Iterator<String> candidates(Song song);

        void remember(Song song, String videoId);

        /** The songs whose copy and print are kept, the latest first. */
        List<Known> heardBefore();

        /** The copy's sound, downloaded when needed and decoded; stages hears which of those it's at. */
        SongCopy load(String videoId, Stages stages) throws SongProblem;

        void keepPrint(String videoId, float[] print);

        /** Forgets a broken download, so it's fetched afresh next time. */
        void drop(String videoId);
    }

    /** A song heard before: its copy's id and a way to read its print. */
    public static final class Known {
        public final Song song;
        public final String videoId;
        public final PrintReader print;

        public Known(Song song, String videoId, PrintReader print) {
            this.song = song;
            this.videoId = videoId;
            this.print = print;
        }
    }

    /** What loading a copy is at. */
    public interface Stages {
        void downloading();

        void decoding();
    }

    public interface PrintReader {
        float[] read() throws Exception;
    }

    /** A candidate iterator's failure to search, raised once the rest are tried. */
    public static final class SearchFailed extends RuntimeException {
        public final SongProblem problem;

        public SearchFailed(SongProblem problem) {
            super(problem.getMessage(), problem);
            this.problem = problem;
        }
    }

    public interface Listener {
        void state(boolean filtering);

        /**
         * Something went wrong and the filter carries on ("few words | the whole sentence", see
         * {@link StatusWords}); null once what failed works again. countdown: seconds until it's over (0: no
         * count), exact, so telling it again doesn't move its end.
         */
        void problem(String text, double countdown);

        /** What it's doing just now, in a few words ({@link StatusWords}); countdown as for a problem. */
        void step(String text, double countdown);

        /** How long a step took, for the debug log. */
        default void timing(String text) {
        }
    }

    private final Heard heard;
    private final Library library;
    private final Recognizer recognizer;
    private final Clock clock;
    private final Listener listener;
    Budget budget;

    public volatile Playing playing;
    private volatile boolean retryWanted;
    private boolean retryTold;
    private volatile boolean stopped;
    private int busyFor; // the wait a retry was told to have, for its sentence (the words count it down)
    private String told; // the problem this tracker told last (null: none, or it's over)
    private int round;
    private String[] avoid; // (song key, video id) of a copy a retry gave up on
    private int misses;
    private int tries;
    private double nextAt;
    private final Map<String, String> unusable = new HashMap<>();
    private int limited;
    private double shazamAfter;
    private boolean refused;
    private Song retrySong;
    private int retryLeft;
    private double askAt;
    private final Set<String> mismatched = new HashSet<>();
    private SongCopy loaded; // one copy kept: memory
    private long askedFrom;
    private final Map<String, Long> shifts = new HashMap<>();
    /** The prints read so far, by video: they don't change, and are looked through every few seconds. */
    private final Map<String, float[]> prints = new HashMap<>();
    /** What it does between tries (Listening, Resting, Retrying), told again after a step in between; until when. */
    private String between = StatusWords.LISTENING;
    private double betweenUntil;

    public Tracker(Heard heard, Library library, Recognizer recognizer, Clock clock, Budget budget, Listener listener) {
        this.heard = heard;
        this.library = library;
        this.recognizer = recognizer;
        this.clock = clock;
        this.budget = budget;
        this.listener = listener;
    }

    /** One look, when it's due; a retry asked for comes first. */
    void step() throws SongProblem {
        if (refused && clock.seconds() >= shazamAfter) {
            refused = false;
            if (told != null && told.startsWith(RATE_LIMIT)) tell(null, 0); // its wait is over
        }
        if (retryWanted) {
            if (shazamWait() <= 0) {
                retryWanted = false;
                if (retryTold) tell(null, 0);
                retryTold = false;
                retry();
                return;
            }
            // Kept until Shazam can be asked; the song (if any) is still followed meanwhile. Told at every look, so
            // nothing in between (the song found in place, a song heard before) hides it.
            // (once told, not over another problem told meanwhile: that one is news, the wait isn't)
            if (!retryTold) busyFor = (int) Math.ceil(shazamWait());
            String busy = StatusWords.problem("Shazam busy", "Shazam can't be asked again yet, the retry starts "
                    + in(busyFor));
            if (!retryTold || told == null || told.equals(busy)) tell(busy, shazamWait());
            retryTold = true;
        }
        if (clock.seconds() < nextAt) return;
        if (playing != null) check();
        else listen(null, false);
    }

    /** A step, with whatever goes wrong in it told rather than ending the filter. */
    public void look() {
        try {
            step();
        } catch (SongProblem.RateLimited problem) { // asking sooner would only keep it going
            int wait = (int) Math.min(LIMITED_S * Math.pow(2, limited), LIMITED_MAX_S);
            limited += 1;
            shazamAfter = clock.seconds() + wait;
            refused = true;
            stepBack();
            tell(StatusWords.problem(RATE_LIMIT, problem.getMessage() + ", asking again " + in(wait)), wait);
        } catch (SongProblem problem) { // Shazam or YouTube couldn't be reached: the next look tries again
            stepBack();
            tell(problem.getMessage(), 0);
        } catch (Throwable error) { // never the stream's end, but always said
            nextAt = clock.seconds() + LISTEN_S;
            stepBack();
            tell(StatusWords.problem("Song removal error", "Song removal ran into an error: "
                    + app.morphed.extension.twitch.Messages.of(error)), 0);
        }
    }

    /** After a failed step: back to what it does between tries (or searching for the song it holds). */
    private void stepBack() {
        Playing current = playing;
        if (current == null) sayBetween();
        else listener.step(misses > 0 ? StatusWords.LOST_SYNC : StatusWords.REMOVING, 0);
    }

    /** Is the song still where it's thought to be? Follows it when it moved; lets go when it's gone. */
    private void check() throws SongProblem {
        nextAt = clock.seconds() + CHECK_S;
        Heard.Stretch sound = heard.latest(FOLLOW_S * RATE);
        Playing current = playing;
        if (sound != null && sound.start + current.offset >= current.copy.length()) {
            listener.timing(current.song + " is over");
            set(null, NEXT_SONG_WAIT_S); // the song is over: listen for the next one
            listen(null, false);
            return;
        }
        Long at = null;
        if (sound != null) at = Align.still(sound.samples, current.copy, sound.start + current.offset).at;
        if (at == null) {
            misses += 1;
            if (misses == 1) listener.timing("Lost " + current.song + ", looking for it");
            listener.step(StatusWords.LOST_SYNC, 0);
            if (misses >= LOST) {
                listener.timing("Let go of " + current.song);
                set(null, NEXT_SONG_WAIT_S);
                return;
            }
            if (sound != null) askAgain(current); // the same song somewhere else? Or another?
            return;
        }
        if (misses > 0) listener.step(StatusWords.REMOVING, 0); // found again
        misses = 0;
        // The song is where it should be: what failed works again (not a retry still waiting for Shazam).
        if (told != null && !retryTold && clock.seconds() >= shazamAfter) tell(null, 0);
        if (Math.abs(at - sound.start - current.offset) > WAVER) playing = current.movedTo(at - sound.start);
    }

    /** The retry button: at the next look, forget the song and ask Shazam afresh. */
    public void retrySoon() {
        retryWanted = true;
    }

    /** A wait as words, for a problem's sentence (the few words count it down). */
    static String in(int seconds) {
        if (seconds <= 20) return "in a few seconds";
        if (seconds <= 90) return "in about a minute";
        return "in about " + Math.round(seconds / 60.0) + " minutes";
    }

    /** The session ended: the song's copy is let go (memory). */
    /**
     * The session ended (set before its thread is interrupted: HTTP may swallow the interrupt). Whatever it was
     * loading is let go, and no other copy is tried.
     */
    void stop() {
        stopped = true;
    }

    private boolean stopped() {
        return stopped || Thread.currentThread().isInterrupted();
    }

    void release() {
        playing = null;
        loaded = null;
    }

    private void retry() throws SongProblem {
        Playing current = playing;
        avoid = current != null ? new String[]{current.song.key, current.copy.videoId} : null;
        round += 1;
        loaded = null;
        unusable.clear();
        mismatched.clear();
        shifts.clear();
        set(null, 0);
        listener.step(StatusWords.RESTARTING, 0);
        listen(null, true);
    }

    private void take() {
        budget.take();
    }

    private double shazamWait() {
        return Math.max(Math.max(budget.waitSeconds(), shazamAfter - clock.seconds()), 0.0);
    }

    private static boolean contains(int[] values, int value) {
        for (int v : values) if (v == value) return true;
        return false;
    }

    /** Shazam's answer; when it can't be asked, a problem saying so. */
    private Song ask(float[] sound) throws SongProblem {
        try {
            return recognizer.recognize(sound);
        } catch (SongProblem.RateLimited refused) {
            throw refused;
        } catch (SongProblem problem) {
            throw new SongProblem(StatusWords.problem("Shazam unreachable", problem.getMessage()), problem);
        }
    }

    /** Told what it does between tries, and until when (0: no end told). */
    private void between(String step, double until) {
        between = step;
        betweenUntil = until;
        sayBetween();
    }

    private void sayBetween() {
        double left = betweenUntil > 0 ? betweenUntil - clock.seconds() : 0;
        if (left <= 0 && !StatusWords.LISTENING.equals(between)) { // its wait is over
            between = StatusWords.LISTENING;
            betweenUntil = 0;
        }
        listener.step(between, Math.max(left, 0));
    }

    /** A problem of the tracker's own (null: what it told is over). */
    private void tell(String text, double countdown) {
        told = text;
        listener.problem(text, countdown);
    }

    /**
     * While the song can't be found where it should be: look for it all over its copy first (skipped ahead, or a
     * version arranged differently), and follow it there; only when it isn't anywhere in it, ask Shazam.
     */
    private void askAgain(Playing current) throws SongProblem {
        Heard.Stretch since = heard.latest(Math.min(MATCH_S, FOLLOW_S * misses) * RATE);
        Long at = since != null ? Align.find(since.samples, current.copy, since.start + current.offset).at : null;
        if (at != null) {
            misses = 0;
            playing = current.movedTo(at - since.start);
            listener.timing("Found " + current.song + " again elsewhere in its copy");
            listener.step(StatusWords.REMOVING, 0);
            return;
        }
        if (!contains(SHAZAM_ON_MISSES, misses) || shazamWait() > 0) return;
        Heard.Stretch sound = heard.latest(ASK_S * RATE);
        if (sound == null) return;
        askedFrom = sound.start;
        take();
        listener.step(StatusWords.ASKING, 0);
        Song song = ask(sound.samples);
        limited = 0;
        listener.timing("Shazam (mid-song) named " + (song == null ? "nothing" : song));
        if (song != null && !song.equals(current.song)) {
            set(null, 0); // (Shazam just named the next one)
            listen(song, false);
            return;
        }
        listener.step(StatusWords.LOST_SYNC, 0); // still looking for the song held
    }

    /**
     * Ask Shazam (unless it just named the song); for a song it knows, find a copy that lines up with the stream.
     * fresh: straight to Shazam, never a song tried before or heard before (a retry).
     */
    private void listen(Song song, boolean fresh) throws SongProblem {
        double now = clock.seconds();
        Heard.Stretch sound = heard.latest(ASK_S * RATE);
        if (sound == null) { // not enough heard yet: looked at again the moment there is
            long missing = (long) ASK_S * RATE - heard.total();
            nextAt = now + Math.max(missing, 1) / (double) RATE;
            sayBetween(); // (collecting sound: also after a retry)
            return;
        }
        nextAt = now + KNOWN_S;
        if (song == null && retrySong != null && !fresh) { // named before and not done with: tried again
            song = retrySong;
            if (retryLeft > 1) retryLeft -= 1;
            else retrySong = null;
        }
        if (song == null && !fresh) song = known(); // a song heard before: told without asking Shazam
        if (song == null) {
            double wait = Math.max(shazamWait(), askAt - now);
            if (wait > 0) {
                nextAt = now + Math.min(wait, KNOWN_S); // meanwhile still looked for among the songs heard before
                if (betweenUntil > 0 && now >= betweenUntil) sayBetween(); // a rest over, Shazam still busy
                return;
            }
            take();
            askAt = now + LISTEN_GAP_S + ASK_S; // the next clip starts after this one's end and a gap
            nextAt = Math.min(nextAt, askAt);
            askedFrom = sound.start;
            listener.step(StatusWords.ASKING, 0);
            song = ask(sound.samples);
            limited = 0; // Shazam answered
            if (song == null) {
                if (told != null) tell(null, 0); // Shazam answered: whatever failed before works again
                tries += 1; // only an answer counts as a try
                if (tries % NOTHING_RUN == 0) {
                    askAt = now + NOTHING_REST_S; // (from the ask, as the gap: Shazam's answer may take a while)
                    between(StatusWords.RESTING, askAt);
                } else {
                    between(StatusWords.LISTENING, 0);
                }
                return;
            }
            listener.timing("Shazam named " + song);
        }
        if (unusable.containsKey(song.key)) {
            tell(unusable.get(song.key), 0);
            askAt = clock.seconds() + UNUSABLE_S;
            between(StatusWords.LISTENING, 0);
            return;
        }
        boolean compared = false;
        String failed = null;
        listener.step(StatusWords.FINDING, 0);
        Iterator<String> copies = copies(song);
        while (true) {
            if (stopped()) return; // the session ended: no more copies
            String videoId;
            try {
                if (!copies.hasNext()) break;
                videoId = copies.next();
            } catch (SearchFailed failure) {
                throw new SongProblem(StatusWords.problem("YouTube search failed", failure.problem.getMessage()),
                        failure.problem);
            }
            SongCopy copy;
            try {
                copy = copy(song, videoId);
            } catch (CopyFailed problem) {
                failed = problem.getMessage(); // this copy can't be had; another might
                continue;
            }
            compared = true;
            listener.step(StatusWords.LINING_UP, 0);
            Heard.Stretch stretch = heard.latest(MATCH_S * RATE);
            if (stretch == null) stretch = heard.latest(ASK_S * RATE);
            Long said = null; // where Shazam's place in the song puts this stretch (by Shazam's copy)
            if (song.hasOffset()) said = Math.round(song.offset * RATE) + stretch.start - askedFrom;
            Long expected = said == null ? null : said + shifts.getOrDefault(videoId, 0L);
            Long at = Align.find(stretch.samples, copy, expected).at;
            if (at != null) {
                if (said != null) shifts.put(videoId, at - said);
                library.remember(song, videoId);
                avoid = null;
                listener.timing("Removing " + song + " (copy " + videoId + ")");
                set(new Playing(song, copy, at - stretch.start, round), NEXT_SONG_WAIT_S);
                return;
            }
        }
        if (compared && !mismatched.contains(song.key)) { // once could be talking over it: tried again
            mismatched.add(song.key);
            tryAgain(song);
            tell(StatusWords.problem("No match yet", "YouTube's copy of " + song
                    + " doesn't line up with the stream yet, trying again"), LISTEN_S); // (counts the retry down)
            return;
        }
        if (compared) {
            unusable.put(song.key, StatusWords.problem("Only other versions", "YouTube has only other versions of "
                    + song + " than the one playing"));
        } else if (failed != null) { // not held against the song: it may download next time
            tryAgain(song);
            tell(failed, LISTEN_S); // (counts the retry down)
            return;
        } else {
            unusable.put(song.key, StatusWords.problem("Not on YouTube", song + " isn't on YouTube Music or YouTube"));
        }
        tell(unusable.get(song.key), 0);
        askAt = clock.seconds() + UNUSABLE_S;
        between(StatusWords.LISTENING, 0);
    }

    /**
     * The song's copies to try, searched lazily, the one a retry gave up on last. A failed search is raised
     * (SearchFailed) unless a copy given up on is left to try.
     */
    private Iterator<String> copies(Song song) {
        String avoided = avoid != null && avoid[0].equals(song.key) ? avoid[1] : null;
        Iterator<String> candidates = library.candidates(song);
        List<String> later = new ArrayList<>();
        return new Iterator<String>() {
            private String next;
            private boolean searching = true;
            private int laterAt;

            @Override
            public boolean hasNext() {
                while (next == null && searching) {
                    try {
                        if (!candidates.hasNext()) {
                            searching = false;
                            break;
                        }
                        String videoId = candidates.next();
                        if (videoId.equals(avoided)) later.add(videoId);
                        else next = videoId;
                    } catch (SearchFailed failure) {
                        searching = false;
                        if (later.isEmpty()) throw failure;
                    }
                }
                if (next == null && laterAt < later.size()) next = later.get(laterAt++);
                return next != null;
            }

            @Override
            public String next() {
                if (!hasNext()) throw new java.util.NoSuchElementException();
                String out = next;
                next = null;
                return out;
            }
        };
    }

    /**
     * The song playing, if it's one heard before (by the prints of the copies kept), else null. Told from the
     * latest MATCH_S, or from ASK_S while that's all there is (a stream just opened).
     */
    private Song known() {
        Heard.Stretch stretch = heard.latest(MATCH_S * RATE);
        if (stretch == null) stretch = heard.latest(ASK_S * RATE);
        List<Known> before = library.heardBefore();
        if (before.size() > KNOWN_MAX) before = before.subList(0, KNOWN_MAX);
        if (stretch == null || before.isEmpty()) return null;
        listener.step(StatusWords.CHECKING, 0);
        List<float[]> read = new ArrayList<>();
        for (Known known : before) {
            float[] print = prints.get(known.videoId);
            if (print == null) {
                try {
                    print = known.print.read();
                    prints.put(known.videoId, print);
                } catch (Exception broken) {
                    print = new float[0]; // a broken print: passed over, made again with its copy
                }
            }
            read.add(print);
        }
        // Only the prints looked through stay in memory (at most KNOWN_MAX, about a megabyte each); others are
        // read again from storage if they're ever among the latest songs once more.
        java.util.Set<String> looked = new java.util.HashSet<>();
        for (Known known : before) looked.add(known.videoId);
        prints.keySet().retainAll(looked);
        Long found = Align.known(stretch.samples, read).at;
        if (found == null) {
            sayBetween();
            return null;
        }
        Song song = before.get(found.intValue()).song;
        listener.timing("Heard " + song + " before: told without Shazam");
        return song;
    }

    /** Have the next look (soon) try this song again, without asking Shazam (unless it's been tried enough). */
    private void tryAgain(Song song) {
        if (retrySong == null || !retrySong.equals(song)) {
            retrySong = song;
            retryLeft = RETRIES;
        }
        nextAt = clock.seconds() + LISTEN_S;
        between(StatusWords.RETRYING, nextAt);
    }

    /** A copy that couldn't be had (its message is a problem's words and sentence); another may do. */
    static final class CopyFailed extends SongProblem {
        CopyFailed(String message, Throwable cause) {
            super(message, cause);
        }
    }

    private SongCopy copy(Song song, String videoId) throws CopyFailed {
        if (loaded == null || !loaded.videoId.equals(videoId)) {
            // The copy kept so far goes first: two songs at once would be a lot of memory.
            loaded = null;
            Align.forget();
            SongCopy copy;
            long started = System.currentTimeMillis();
            boolean[] decoding = {false};
            try {
                copy = library.load(videoId, new Stages() {
                    @Override
                    public void downloading() {
                        listener.step(StatusWords.DOWNLOADING, 0);
                    }

                    @Override
                    public void decoding() {
                        decoding[0] = true;
                        listener.step(StatusWords.DECODING, 0);
                    }
                });
            } catch (SongProblem problem) {
                // a broken download: fetched afresh next time (not one stopped because the session ended)
                if (!stopped()) library.drop(videoId);
                String detail = (decoding[0] ? "YouTube's copy of " + song + " couldn't be read: "
                        : "Couldn't get " + song + " from YouTube: ") + problem.getMessage();
                throw new CopyFailed(StatusWords.problem(decoding[0] ? "Unreadable copy" : "Download failed", detail),
                        problem);
            }
            long got = System.currentTimeMillis();
            copy.reduced();
            loaded = copy;
            listener.timing("Copy " + videoId + " ready: got it in " + (got - started) + " ms, prepared in "
                    + (System.currentTimeMillis() - got) + " ms");
            float[] print = Align.thin(copy.reduced());
            prints.put(videoId, print);
            library.keepPrint(videoId, print);
        }
        return loaded;
    }

    /** The song being taken out now, or null; with null, Shazam is asked what's next after wait s. */
    private void set(Playing next, int wait) {
        boolean had = playing != null;
        playing = next;
        misses = 0;
        tries = 0;
        retrySong = null;
        askAt = had && next == null ? clock.seconds() + wait : 0.0;
        nextAt = clock.seconds() + (next != null ? CHECK_S : 0);
        if (next != null) told = null; // (the session clears the problem when a song is taken out)
        listener.state(next != null);
        if (next != null) listener.step(StatusWords.REMOVING, 0);
        else between(StatusWords.LISTENING, 0);
    }
}
