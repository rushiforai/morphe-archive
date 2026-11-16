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
    static final int ASK_S = 10; // seconds Shazam hears, sent in one request
    static final int CHECK_S = 4; // how often the song's place is checked while it's being taken out
    static final int LOST = 6; // checks in a row without finding the song where it should be: it has stopped
    static final int[] SHAZAM_ON_MISSES = {2, 4}; // which of those checks ask Shazam what's playing
    static final int NOTHING_RUN = 2; // answers in a row without a song: no music now, so Shazam rests...
    static final int NOTHING_REST_S = 60; // ...this long
    static final int NEXT_SONG_WAIT_S = 5; // once a song is over, this long before Shazam is asked what's next
    static final int LISTEN_S = 6; // a song named but not taken out yet: tried again this soon
    static final int KNOWN_S = 10; // how often the stream is looked for among the songs heard before
    static final int KNOWN_MAX = 60; // the latest songs heard before that are looked through
    static final int UNUSABLE_S = 20; // how often Shazam is asked while a song with no usable copy plays
    static final int LIMITED_S = 60; // Shazam refused: left alone this long, doubling each time...
    static final int LIMITED_MAX_S = 240; // ...up to this
    static final int WAVER = Align.REACH; // a place found this few samples off is no move
    static final int RETRIES = 2; // a song named that couldn't be taken out yet is tried again this many times

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

        /** The copy's sound, downloaded and decoded when needed. */
        SongCopy load(String videoId) throws SongProblem;

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

        /** Something went wrong and the filter carries on; null once what failed works again. */
        void problem(String text);

        /** Seconds until Shazam may be asked again (0: now). */
        void ready(int seconds);

        /** What it's doing just now. */
        void step(String text);

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
            listener.problem(null); // its wait is over
        }
        if (retryWanted) {
            if (shazamWait() <= 0) {
                retryWanted = false;
                retryTold = false;
                retry();
                return;
            }
            if (!retryTold) { // kept until Shazam can be asked; the song (if any) is still followed meanwhile
                retryTold = true;
                listener.step("Retrying " + in((int) Math.ceil(shazamWait())) + ", once Shazam can be asked again");
                tellReady();
            }
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
            listener.problem(problem.getMessage() + ", asking again " + in(wait));
            tellReady();
        } catch (SongProblem problem) { // Shazam or YouTube couldn't be reached: the next look tries again
            listener.problem(problem.getMessage());
        } catch (Throwable error) { // never the stream's end, but always said
            listener.problem("Song removal ran into an error: " + app.morphed.extension.twitch.Messages.of(error));
            nextAt = clock.seconds() + LISTEN_S;
        }
    }

    /** Is the song still where it's thought to be? Follows it when it moved; lets go when it's gone. */
    private void check() throws SongProblem {
        nextAt = clock.seconds() + CHECK_S;
        Heard.Stretch sound = heard.latest(FOLLOW_S * RATE);
        Playing current = playing;
        if (sound != null && sound.start + current.offset >= current.copy.length()) {
            set(null, NEXT_SONG_WAIT_S); // the song is over: listen for the next one after a short wait
            listen(null, false);
            return;
        }
        Long at = null;
        if (sound != null) at = Align.still(sound.samples, current.copy, sound.start + current.offset).at;
        if (at == null) {
            misses += 1;
            listener.step("Lost " + current.song + ", looking for it");
            if (misses >= LOST) {
                set(null, NEXT_SONG_WAIT_S);
                return;
            }
            if (sound != null) askAgain(current); // the same song somewhere else? Or another?
            return;
        }
        if (misses > 0) listener.step("Removing " + current.song); // found again
        misses = 0;
        if (clock.seconds() >= shazamAfter) listener.problem(null); // the song is where it should be
        if (Math.abs(at - sound.start - current.offset) > WAVER) playing = current.movedTo(at - sound.start);
    }

    /** The retry button: at the next look, forget the song and ask Shazam afresh. */
    public void retrySoon() {
        retryWanted = true;
    }

    /** A wait as words that stay true while they're shown (they aren't counted down). */
    static String in(int seconds) {
        if (seconds <= 20) return "in a few seconds";
        if (seconds <= 90) return "in about a minute";
        return "in about " + Math.round(seconds / 60.0) + " minutes";
    }

    /** The session ended: the song's copy is let go (memory). */
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
        listener.step("Retrying from the start");
        set(null, 0);
        listen(null, true);
    }

    private void take() {
        budget.take();
        tellReady();
    }

    void tellReady() {
        listener.ready((int) Math.ceil(shazamWait()));
    }

    private double shazamWait() {
        return Math.max(Math.max(budget.waitSeconds(), shazamAfter - clock.seconds()), 0.0);
    }

    private static boolean contains(int[] values, int value) {
        for (int v : values) if (v == value) return true;
        return false;
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
            listener.step("Removing " + current.song);
            return;
        }
        if (!contains(SHAZAM_ON_MISSES, misses) || shazamWait() > 0) return;
        Heard.Stretch sound = heard.latest(ASK_S * RATE);
        if (sound == null) return;
        askedFrom = sound.start;
        take();
        listener.step("The song changed, asking Shazam what's on");
        Song song = recognizer.recognize(sound.samples);
        limited = 0;
        if (song != null && !song.equals(current.song)) {
            set(null, 0); // (Shazam just named the next one)
            listen(song, false);
        }
    }

    /**
     * Ask Shazam (unless it just named the song); for a song it knows, find a copy that lines up with the stream.
     * fresh: straight to Shazam, never a song tried before or heard before (a retry).
     */
    private void listen(Song song, boolean fresh) throws SongProblem {
        Heard.Stretch sound = heard.latest(ASK_S * RATE);
        if (sound == null) { // not enough heard yet
            nextAt = clock.seconds() + 1;
            return;
        }
        double now = clock.seconds();
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
                return;
            }
            take();
            askAt = now + ASK_S;
            nextAt = Math.min(nextAt, askAt);
            askedFrom = sound.start;
            listener.step("Asking Shazam what's playing");
            song = recognizer.recognize(sound.samples);
            limited = 0; // Shazam answered
            if (song == null) {
                tries += 1; // only an answer counts as a try
                if (tries % NOTHING_RUN == 0) {
                    askAt = clock.seconds() + NOTHING_REST_S;
                    listener.step("No music found, resting a minute");
                } else {
                    listener.step("Listening for music");
                }
                listener.problem(null); // Shazam answered: whatever failed before works again
                return;
            }
        }
        if (unusable.containsKey(song.key)) {
            listener.problem(unusable.get(song.key));
            askAt = clock.seconds() + UNUSABLE_S;
            return;
        }
        boolean compared = false;
        String failed = null;
        listener.step("Finding " + song + " on YouTube");
        Iterator<String> copies = copies(song);
        while (true) {
            String videoId;
            try {
                if (!copies.hasNext()) break;
                videoId = copies.next();
            } catch (SearchFailed failure) {
                throw failure.problem;
            }
            SongCopy copy;
            try {
                if (loaded == null || !loaded.videoId.equals(videoId)) listener.step("Getting " + song);
                copy = copy(videoId);
            } catch (SongProblem problem) {
                failed = problem.getMessage(); // this copy can't be had; another might
                continue;
            }
            compared = true;
            listener.step("Lining up " + song);
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
                set(new Playing(song, copy, at - stretch.start, round), NEXT_SONG_WAIT_S);
                return;
            }
        }
        if (compared && !mismatched.contains(song.key)) { // once could be talking over it: tried again
            mismatched.add(song.key);
            tryAgain(song);
            listener.problem("YouTube's copy of " + song + " doesn't line up with the stream yet, trying again");
            return;
        }
        if (compared) {
            unusable.put(song.key, "YouTube has only other versions of " + song + " than the one playing");
        } else if (failed != null) { // not held against the song: it may download next time
            tryAgain(song);
            listener.problem("Couldn't get " + song + " from YouTube: " + failed);
            return;
        } else {
            unusable.put(song.key, song + " isn't on YouTube Music or YouTube");
        }
        listener.problem(unusable.get(song.key));
        askAt = clock.seconds() + UNUSABLE_S;
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

    /** The song playing, if it's one heard before (by the prints of the copies kept), else null. */
    private Song known() {
        Heard.Stretch stretch = heard.latest(MATCH_S * RATE);
        List<Known> before = library.heardBefore();
        if (before.size() > KNOWN_MAX) before = before.subList(0, KNOWN_MAX);
        if (stretch == null || before.isEmpty()) return null;
        List<float[]> read = new ArrayList<>();
        for (Known known : before) {
            float[] print = prints.get(known.videoId);
            if (print == null) {
                try {
                    print = known.print.read();
                    if (prints.size() >= KNOWN_MAX * 2) prints.clear(); // (only ever the latest few)
                    prints.put(known.videoId, print);
                } catch (Exception broken) {
                    print = new float[0]; // a broken print: passed over, made again with its copy
                }
            }
            read.add(print);
        }
        Long found = Align.known(stretch.samples, read).at;
        return found != null ? before.get(found.intValue()).song : null;
    }

    /** Have the next look (soon) try this song again, without asking Shazam (unless it's been tried enough). */
    private void tryAgain(Song song) {
        if (retrySong == null || !retrySong.equals(song)) {
            retrySong = song;
            retryLeft = RETRIES;
        }
        nextAt = clock.seconds() + LISTEN_S;
    }

    private SongCopy copy(String videoId) throws SongProblem {
        if (loaded == null || !loaded.videoId.equals(videoId)) {
            // The copy kept so far goes first: two songs at once would be a lot of memory.
            loaded = null;
            Align.forget();
            SongCopy copy;
            long started = System.currentTimeMillis();
            try {
                copy = library.load(videoId);
            } catch (SongProblem problem) {
                library.drop(videoId); // a broken download: fetched afresh next time
                throw problem;
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
        listener.state(next != null);
        listener.step(next != null ? "Removing " + next.song : "Listening for music");
    }
}
