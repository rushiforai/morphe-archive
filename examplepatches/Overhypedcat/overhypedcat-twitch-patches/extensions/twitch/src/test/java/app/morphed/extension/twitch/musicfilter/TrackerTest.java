package app.morphed.extension.twitch.musicfilter;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

/** The song tracker's decisions with a fake Shazam, a fake library and a song really playing in the stream. */
public class TrackerTest {
    private static final int RATE = Canceller.RATE;
    private static final List<String> STEPS = Arrays.asList(StatusWords.LISTENING, StatusWords.CHECKING,
            StatusWords.ASKING, StatusWords.FINDING, StatusWords.DOWNLOADING, StatusWords.DECODING,
            StatusWords.LINING_UP, StatusWords.REMOVING, StatusWords.LOST_SYNC, StatusWords.RESTING,
            StatusWords.RETRYING, StatusWords.RESTARTING);

    static final class FakeClock implements Clock {
        double now = 1000;

        @Override
        public double seconds() {
            return now;
        }
    }

    static final class Events implements Tracker.Listener {
        final List<String> problems = new ArrayList<>(), steps = new ArrayList<>();
        final List<Double> problemCounts = new ArrayList<>(), stepCounts = new ArrayList<>();
        Boolean filtering;

        @Override
        public void state(boolean on) {
            filtering = on;
        }

        @Override
        public void problem(String text, double countdown) {
            problems.add(text);
            problemCounts.add(countdown);
        }

        @Override
        public void step(String text, double countdown) {
            assertTrue("a step in a few words: " + text, STEPS.contains(text));
            steps.add(text);
            stepCounts.add(countdown);
        }

        String lastStep() {
            return steps.get(steps.size() - 1);
        }

        double lastStepCount() {
            return stepCounts.get(stepCounts.size() - 1);
        }

        double lastProblemCount() {
            return problemCounts.get(problemCounts.size() - 1);
        }

        String lastProblem() {
            return problems.get(problems.size() - 1);
        }
    }

    static class FakeLibrary implements Tracker.Library {
        final SongCopy copy;
        final List<String> loaded = new ArrayList<>();
        final List<Tracker.Known> known = new ArrayList<>();
        String remembered;
        boolean searchFails, downloads;
        SongProblem downloadFails, decodeFails;

        FakeLibrary(SongCopy copy) {
            this.copy = copy;
        }

        @Override
        public Iterator<String> candidates(Song song) {
            if (searchFails) {
                return new Iterator<String>() {
                    @Override
                    public boolean hasNext() {
                        throw new Tracker.SearchFailed(new SongProblem("Searching YouTube failed: no connection"));
                    }

                    @Override
                    public String next() {
                        throw new IllegalStateException();
                    }
                };
            }
            return Collections.singletonList(copy.videoId).iterator();
        }

        @Override
        public void remember(Song song, String videoId) {
            remembered = videoId;
        }

        @Override
        public List<Tracker.Known> heardBefore() {
            return known;
        }

        @Override
        public SongCopy load(String videoId, Tracker.Stages stages) throws SongProblem {
            loaded.add(videoId);
            if (downloads) {
                stages.downloading();
                if (downloadFails != null) throw downloadFails;
            }
            stages.decoding();
            if (decodeFails != null) throw decodeFails;
            return copy;
        }

        @Override
        public void keepPrint(String videoId, float[] print) {
        }

        @Override
        public void drop(String videoId) {
        }
    }

    /** A "song": shaped noise, so it lines up in one place only. */
    static SongCopy song(int seconds) {
        return song(seconds, 1, "vid1");
    }

    static SongCopy song(int seconds, long seed, String id) {
        Random random = new Random(seed);
        short[] left = new short[seconds * RATE], right = new short[seconds * RATE];
        for (int i = 0; i < left.length; i++) {
            double tone = Math.sin(2 * Math.PI * (220 + 40 * ((i / (RATE / 2)) % 9)) * i / RATE);
            left[i] = (short) ((random.nextGaussian() * 0.3 + tone) * 9000);
            right[i] = left[i];
        }
        return new SongCopy(id, left, right);
    }

    private static Heard heardFrom(SongCopy copy, int songStart, int seconds) {
        Heard heard = new Heard();
        float[] stream = copy.mono(songStart, songStart + seconds * RATE);
        heard.add(stream, stream.length);
        return heard;
    }

    private static Heard noise(int seconds, long seed) {
        Heard heard = new Heard();
        float[] noise = new float[seconds * RATE];
        Random random = new Random(seed);
        for (int i = 0; i < noise.length; i++) noise[i] = (float) random.nextGaussian() * 0.2f;
        heard.add(noise, noise.length);
        return heard;
    }

    @Test
    public void namesALinesUpAndFollowsTheSong() {
        SongCopy copy = song(40);
        Heard heard = heardFrom(copy, 5 * RATE, 12);
        FakeClock clock = new FakeClock();
        Events events = new Events();
        FakeLibrary library = new FakeLibrary(copy);
        Song shazamSays = new Song("k", "Title", "Artist", 5.0);
        Tracker tracker = new Tracker(heard, library, sound -> shazamSays, clock, new Budget(clock), events);

        tracker.look();
        Playing playing = tracker.playing;
        assertNotNull("not taken out; problems " + events.problems + " steps " + events.steps, playing);
        assertEquals(shazamSays, playing.song);
        // stream sample 0 is song sample 5 s in
        assertEquals(5L * RATE, playing.offset);
        assertEquals("vid1", library.remembered);
        assertEquals(Boolean.TRUE, events.filtering);
        assertEquals(Arrays.asList(StatusWords.ASKING, StatusWords.FINDING, StatusWords.DECODING,
                StatusWords.LINING_UP, StatusWords.REMOVING), events.steps);

        // more of the song comes in: still found where it should be
        float[] more = copy.mono(17 * RATE, 21 * RATE);
        heard.add(more, more.length);
        clock.now += Tracker.CHECK_S;
        tracker.look();
        assertEquals(5L * RATE, tracker.playing.offset);
    }

    @Test
    public void shazamHearsFiveSecondsTheMomentTheyAreThere() {
        SongCopy copy = song(20);
        Heard heard = heardFrom(copy, 0, 3);
        FakeClock clock = new FakeClock();
        List<Integer> heardLengths = new ArrayList<>();
        Tracker tracker = new Tracker(heard, new FakeLibrary(copy), sound -> {
            heardLengths.add(sound.length);
            return null;
        }, clock, new Budget(clock), new Events());
        tracker.look();
        assertTrue("3 s heard: not yet", heardLengths.isEmpty());
        float[] more = copy.mono(3 * RATE, 5 * RATE);
        heard.add(more, more.length);
        clock.now += 1.99;
        tracker.look();
        assertTrue("not looked at again before the 5 s are due", heardLengths.isEmpty());
        clock.now += 0.01;
        tracker.look();
        assertEquals(Collections.singletonList(Tracker.ASK_S * RATE), heardLengths);
        assertEquals(5, Tracker.ASK_S);
    }

    @Test
    public void withNoMusicShazamIsAskedEveryEightSecondsTwiceThenRestsAMinute() {
        Heard heard = noise(12, 2);
        FakeClock clock = new FakeClock();
        Events events = new Events();
        double start = clock.now;
        List<Double> askedAt = new ArrayList<>();
        Tracker tracker = new Tracker(heard, new FakeLibrary(song(20)), sound -> {
            askedAt.add(clock.now - start);
            return null;
        }, clock, new Budget(clock), events);
        for (int tenth = 0; tenth <= 900; tenth++) { // 90 s, looked at every 0.1 s
            clock.now = start + tenth / 10.0;
            tracker.look();
        }
        assertEquals(4, askedAt.size());
        assertEquals(0, askedAt.get(0), 1e-6);
        assertEquals(8, askedAt.get(1), 0.11);
        assertEquals(68, askedAt.get(2), 0.11);
        assertEquals(76, askedAt.get(3), 0.11);
        int rest = events.steps.indexOf(StatusWords.RESTING);
        assertTrue(events.steps.toString(), rest >= 0);
        assertEquals("the rest counts down", Tracker.NOTHING_REST_S, events.stepCounts.get(rest), 1e-9);
        assertNull(tracker.playing);
    }

    @Test
    public void aSongOverMeansAskingRightAway() {
        SongCopy copy = song(20);
        Heard heard = heardFrom(copy, 8 * RATE, 12); // the song ends as the stream's 12 s do
        FakeClock clock = new FakeClock();
        int[] asked = {0};
        Song shazamSays = new Song("k", "Title", "Artist", 8.0);
        Tracker tracker = new Tracker(heard, new FakeLibrary(copy), sound -> {
            asked[0]++;
            return asked[0] == 1 ? shazamSays : null;
        }, clock, new Budget(clock), new Events());
        tracker.look();
        assertNotNull(tracker.playing);
        float[] after = new float[4 * RATE];
        heard.add(after, after.length);
        clock.now += Tracker.CHECK_S;
        tracker.look();
        assertNull("the song is over", tracker.playing);
        assertEquals("asked what's next at once", 2, asked[0]);
    }

    @Test
    public void aSongHeardBeforeIsToldFromFiveSecondsWithoutShazam() {
        SongCopy copy = song(30);
        SongCopy other = song(30, 9, "vid2");
        Heard heard = heardFrom(copy, 11 * RATE, Tracker.ASK_S); // a stream just opened: 5 s heard
        FakeClock clock = new FakeClock();
        Events events = new Events();
        FakeLibrary library = new FakeLibrary(copy);
        Song song = new Song("k", "Title", "Artist");
        float[] print = Align.thin(copy.reduced()), otherPrint = Align.thin(other.reduced());
        library.known.add(new Tracker.Known(new Song("k2", "Other", "Artist"), "vid2", () -> otherPrint));
        library.known.add(new Tracker.Known(song, "vid1", () -> print));
        int[] asked = {0};
        Tracker tracker = new Tracker(heard, library, sound -> {
            asked[0]++;
            return null;
        }, clock, new Budget(clock), events);
        tracker.look();
        assertEquals("no Shazam request", 0, asked[0]);
        assertNotNull("problems " + events.problems + " steps " + events.steps, tracker.playing);
        assertEquals(song, tracker.playing.song);
        assertEquals(StatusWords.CHECKING, events.steps.get(0));
    }

    @Test
    public void checkingKnownSongsGoesBackToWhatItDidBetween() {
        Heard heard = noise(12, 5);
        FakeClock clock = new FakeClock();
        Events events = new Events();
        FakeLibrary library = new FakeLibrary(song(20));
        float[] print = Align.thin(song(30, 9, "vid2").reduced());
        library.known.add(new Tracker.Known(new Song("k2", "Other", "Artist"), "vid2", () -> print));
        Tracker tracker = new Tracker(heard, library, sound -> null, clock, new Budget(clock), events);
        tracker.look();
        assertEquals(Arrays.asList(StatusWords.CHECKING, StatusWords.LISTENING, StatusWords.ASKING,
                StatusWords.LISTENING), events.steps);
    }

    @Test
    public void aRefusalWaitsLongerEachTimeAndCountsDown() {
        Heard heard = heardFrom(song(20), 0, 12);
        FakeClock clock = new FakeClock();
        Events events = new Events();
        int[] asked = {0};
        Tracker tracker = new Tracker(heard, new FakeLibrary(song(20)), sound -> {
            asked[0]++;
            throw new SongProblem.RateLimited("Shazam is getting too many requests from this connection");
        }, clock, new Budget(clock), events);
        tracker.look();
        assertEquals("Shazam rate limit | Shazam is getting too many requests from this connection, asking again"
                + " in about a minute", events.lastProblem());
        assertEquals(60, events.lastProblemCount(), 1e-9);
        assertEquals("not left on Asking Shazam", StatusWords.LISTENING, events.lastStep());
        clock.now += 30;
        tracker.look();
        assertEquals("still waiting", 1, asked[0]);
        clock.now += 40;
        tracker.look();
        assertEquals(2, asked[0]);
        assertTrue(events.lastProblem().endsWith("asking again in about 2 minutes"));
        assertEquals(120, events.lastProblemCount(), 1e-9);
    }

    @Test
    public void shazamUnreachableIsToldAndTriedAgainOnTheEightSecondBeat() {
        Heard heard = noise(12, 3);
        FakeClock clock = new FakeClock();
        Events events = new Events();
        int[] asked = {0};
        Tracker tracker = new Tracker(heard, new FakeLibrary(song(20)), sound -> {
            asked[0]++;
            throw new SongProblem("Shazam couldn't be asked what's playing: no internet connection");
        }, clock, new Budget(clock), events);
        tracker.look();
        assertEquals("Shazam unreachable | Shazam couldn't be asked what's playing: no internet connection",
                events.lastProblem());
        assertEquals(StatusWords.LISTENING, events.lastStep());
        clock.now += Tracker.LISTEN_GAP_S + Tracker.ASK_S - 0.1;
        tracker.look();
        assertEquals(1, asked[0]);
        clock.now += 0.2;
        tracker.look();
        assertEquals(2, asked[0]);
    }

    @Test
    public void aFailedSearchIsToldAndTriedAgain() {
        SongCopy copy = song(20);
        Heard heard = heardFrom(copy, 0, 12);
        FakeClock clock = new FakeClock();
        Events events = new Events();
        FakeLibrary library = new FakeLibrary(copy);
        library.searchFails = true;
        Tracker tracker = new Tracker(heard, library, sound -> new Song("k", "T", "A"), clock, new Budget(clock), events);
        tracker.look();
        assertTrue(events.problems.toString(),
                events.problems.contains("YouTube search failed | Searching YouTube failed: no connection"));
        assertEquals(StatusWords.LISTENING, events.lastStep());
        assertNull(tracker.playing);
    }

    @Test
    public void aDownloadOrDecodingThatFailsIsToldAsSuchAndRetried() {
        for (boolean decoding : new boolean[]{false, true}) {
            SongCopy copy = song(20);
            FakeClock clock = new FakeClock();
            Events events = new Events();
            FakeLibrary library = new FakeLibrary(copy);
            library.downloads = true;
            if (decoding) library.decodeFails = new SongProblem("the download has no sound in it");
            else library.downloadFails = new SongProblem("the download failed: timed out");
            Tracker tracker = new Tracker(heardFrom(copy, 0, 12), library, sound -> new Song("k", "T", "A"), clock,
                    new Budget(clock), events);
            tracker.look();
            assertTrue(events.steps.toString(), events.steps.contains(StatusWords.DOWNLOADING));
            assertEquals(decoding, events.steps.contains(StatusWords.DECODING));
            assertEquals(decoding ? "Unreadable copy | YouTube's copy of A - T couldn't be read: the download has no"
                            + " sound in it" : "Download failed | Couldn't get A - T from YouTube: the download failed:"
                            + " timed out", events.lastProblem());
            assertEquals(StatusWords.RETRYING, events.lastStep());
            assertEquals(Tracker.LISTEN_S, events.lastStepCount(), 1e-9);
            assertEquals("the problem counts the retry down", Tracker.LISTEN_S, events.lastProblemCount(), 1e-9);
        }
    }

    @Test
    public void aCopyOfAnotherVersionIsTriedTwiceThenGivenUpOn() {
        SongCopy copy = song(20);
        Heard heard = noise(12, 4);
        FakeClock clock = new FakeClock();
        Events events = new Events();
        Tracker tracker = new Tracker(heard, new FakeLibrary(copy), sound -> new Song("k", "T", "A"), clock,
                new Budget(clock), events);
        tracker.look();
        assertTrue(events.problems.toString(), events.lastProblem().startsWith("No match yet | "));
        assertTrue(events.lastProblem().contains("doesn't line up"));
        assertEquals(StatusWords.RETRYING, events.lastStep());
        assertEquals(Tracker.LISTEN_S, events.lastStepCount(), 1e-9);
        assertEquals("the problem counts the retry down", Tracker.LISTEN_S, events.lastProblemCount(), 1e-9);
        clock.now += Tracker.LISTEN_S;
        tracker.look(); // the retry, no new request
        assertTrue(events.problems.toString(), events.lastProblem().startsWith("Only other versions | "));
        assertEquals(StatusWords.LISTENING, events.lastStep());
    }

    @Test
    public void budgetAllowsTwoAtOnceThenOneEveryTwentySeconds() {
        FakeClock clock = new FakeClock();
        Budget budget = new Budget(clock);
        assertEquals(0, budget.waitSeconds(), 0);
        budget.take();
        budget.take();
        assertEquals(20, budget.waitSeconds(), 1e-9);
        clock.now += 15;
        assertEquals(5, budget.waitSeconds(), 1e-9);
        clock.now += 5;
        assertEquals(0, budget.waitSeconds(), 1e-9);
    }

    @Test
    public void heardKeepsTheLatestSecondsInOrder() {
        Heard heard = new Heard(1, 10); // 10 samples kept
        float[] a = new float[7];
        for (int i = 0; i < 7; i++) a[i] = i;
        heard.add(a, 7);
        heard.add(a, 7);
        Heard.Stretch latest = heard.latest(10);
        assertEquals(4, latest.start);
        assertEquals(Arrays.toString(new float[]{4, 5, 6, 0, 1, 2, 3, 4, 5, 6}), Arrays.toString(latest.samples));
        assertNull(heard.latest(11));
    }

    @Test
    public void aRetryWhileShazamMustWaitIsKeptAndDoneLater() {
        SongCopy copy = song(40);
        Heard heard = heardFrom(copy, 5 * RATE, 12);
        FakeClock clock = new FakeClock();
        Events events = new Events();
        int[] asked = {0};
        Song shazamSays = new Song("k", "Title", "Artist", 5.0);
        Budget budget = new Budget(clock);
        Tracker tracker = new Tracker(heard, new FakeLibrary(copy), sound -> {
            asked[0]++;
            return shazamSays;
        }, clock, budget, events);
        tracker.look();
        assertNotNull(tracker.playing);
        budget.take();
        budget.take(); // used up: 40 s to wait
        int problemsBefore = events.problems.size();

        tracker.retrySoon();
        tracker.look();
        assertEquals(1, asked[0]);
        assertTrue(events.lastProblem(), events.lastProblem().startsWith("Shazam busy | "));
        assertEquals(40, events.lastProblemCount(), 1e-9);
        assertNotNull("the song is still taken out meanwhile", tracker.playing);

        // the song found in place meanwhile doesn't hide the waiting retry
        float[] more = copy.mono(17 * RATE, 21 * RATE);
        heard.add(more, more.length);
        clock.now += Tracker.CHECK_S;
        tracker.look();
        assertTrue(events.problems.toString(), events.lastProblem().startsWith("Shazam busy | "));
        assertEquals("counting on, not from the start", 36, events.lastProblemCount(), 1e-9);

        clock.now += 41;
        tracker.look();
        assertTrue(events.steps.toString(), events.steps.contains(StatusWords.RESTARTING));
        assertTrue("the busy problem is over", events.problems.subList(problemsBefore, events.problems.size())
                .contains(null));
        assertEquals("asked afresh", 2, asked[0]);
    }

    @Test
    public void anEndedSessionLetsGoOfTheSong() {
        SongCopy copy = song(40);
        Heard heard = heardFrom(copy, 5 * RATE, 12);
        FakeClock clock = new FakeClock();
        Tracker tracker = new Tracker(heard, new FakeLibrary(copy), sound -> new Song("k", "T", "A", 5.0), clock,
                new Budget(clock), new Events());
        tracker.look();
        assertNotNull(tracker.playing);
        tracker.release();
        assertNull(tracker.playing);
    }

    @Test
    public void theRestIsTimedFromTheAskEvenWhenShazamIsSlow() {
        Heard heard = noise(12, 6);
        FakeClock clock = new FakeClock();
        double start = clock.now;
        List<Double> askedAt = new ArrayList<>();
        Tracker tracker = new Tracker(heard, new FakeLibrary(song(20)), sound -> {
            askedAt.add(clock.now - start);
            clock.now += 2; // Shazam takes 2 s to answer
            return null;
        }, clock, new Budget(clock), new Events());
        for (int tenth = 0; tenth <= 900; tenth++) {
            if (start + tenth / 10.0 > clock.now) clock.now = start + tenth / 10.0;
            tracker.look();
        }
        assertEquals(askedAt.toString(), 4, askedAt.size());
        assertEquals(8, askedAt.get(1), 0.11);
        assertEquals(68, askedAt.get(2), 0.11);
        assertEquals(76, askedAt.get(3), 0.11);
    }

    @Test
    public void aSongThatCantBeUsedIsNotToldOverAndOver() {
        SongCopy copy = song(20);
        FakeClock clock = new FakeClock();
        Events events = new Events();
        Tracker tracker = new Tracker(noise(12, 7), new FakeLibrary(copy) {
            @Override
            public Iterator<String> candidates(Song song) {
                return Collections.emptyIterator(); // not on YouTube
            }
        }, sound -> new Song("k", "T", "A"), clock, new Budget(clock), events);
        for (int i = 0; i < 6; i++) {
            tracker.look();
            clock.now += Tracker.UNUSABLE_S;
        }
        assertTrue(events.problems.toString(), events.problems.size() >= 2);
        for (String problem : events.problems) {
            assertEquals("never cleared in between", "Not on YouTube | A - T isn't on YouTube Music or YouTube", problem);
        }
    }

    @Test
    public void aRetryBeforeFiveSecondsAreHeardSaysItIsListening() {
        SongCopy copy = song(20);
        Heard heard = heardFrom(copy, 0, 2);
        FakeClock clock = new FakeClock();
        Events events = new Events();
        Tracker tracker = new Tracker(heard, new FakeLibrary(copy), sound -> null, clock, new Budget(clock), events);
        tracker.retrySoon();
        tracker.look();
        assertEquals("not stuck on Restarting", StatusWords.LISTENING, events.lastStep());
    }

    @Test
    public void theEndOfARateLimitClearsItsProblem() {
        SongCopy copy = song(20);
        FakeClock clock = new FakeClock();
        Events events = new Events();
        int[] asked = {0};
        Tracker tracker = new Tracker(noise(12, 8), new FakeLibrary(copy), sound -> {
            asked[0]++;
            if (asked[0] == 1) throw new SongProblem.RateLimited("Shazam is getting too many requests");
            return null;
        }, clock, new Budget(clock), events);
        tracker.look();
        assertTrue(events.lastProblem().startsWith("Shazam rate limit | "));
        clock.now += Tracker.LIMITED_S;
        tracker.look();
        assertNull("its wait is over", events.lastProblem());
    }

    @Test
    public void theEndOfARateLimitLeavesAnotherProblemShown() {
        SongCopy copy = song(30);
        Heard heard = noise(12, 9);
        FakeClock clock = new FakeClock();
        Events events = new Events();
        FakeLibrary library = new FakeLibrary(copy);
        library.downloads = true;
        library.downloadFails = new SongProblem("the download failed: timed out");
        float[] print = Align.thin(copy.reduced());
        library.known.add(new Tracker.Known(new Song("k", "T", "A"), "vid1", () -> print));
        Tracker tracker = new Tracker(heard, library, sound -> {
            throw new SongProblem.RateLimited("Shazam is getting too many requests");
        }, clock, new Budget(clock), events);
        tracker.look();
        assertTrue(events.lastProblem().startsWith("Shazam rate limit | "));
        // meanwhile a song heard before plays: told without Shazam, and its copy fails to download
        float[] song = copy.mono(5 * RATE, 17 * RATE);
        heard.add(song, song.length);
        clock.now += Tracker.KNOWN_S;
        tracker.look();
        assertTrue(events.problems.toString(), events.lastProblem().startsWith("Download failed | "));
        int told = events.problems.size();
        clock.now = 1000 + Tracker.LIMITED_S;
        tracker.look();
        assertFalse("not cleared by the rate limit's end: " + events.problems,
                events.problems.subList(told, events.problems.size()).contains(null));
    }

    @Test
    public void aRestOverWhileShazamIsStillBusySaysListening() {
        Heard heard = noise(12, 10);
        FakeClock clock = new FakeClock();
        Events events = new Events();
        int[] asked = {0};
        Tracker tracker = new Tracker(heard, new FakeLibrary(song(20)), sound -> {
            asked[0]++;
            return null;
        }, clock, new Budget(clock), events);
        tracker.look();
        clock.now += Tracker.LISTEN_GAP_S + Tracker.ASK_S;
        tracker.look();
        assertEquals(StatusWords.RESTING, events.lastStep());
        clock.now += Tracker.NOTHING_REST_S - 1;
        for (int i = 0; i < 6; i++) tracker.budget.take(); // used up elsewhere: Shazam can't be asked when the rest ends
        clock.now += 1;
        tracker.look();
        assertEquals("no ask while the budget is out", 2, asked[0]);
        assertEquals("the rest is over", StatusWords.LISTENING, events.lastStep());
    }

    @Test
    public void aWaitingRetryDoesNotHideAProblemToldMeanwhile() {
        SongCopy copy = song(30);
        FakeClock clock = new FakeClock();
        Events events = new Events();
        FakeLibrary library = new FakeLibrary(copy);
        library.downloads = true;
        library.downloadFails = new SongProblem("the download failed: timed out");
        float[] print = Align.thin(copy.reduced());
        library.known.add(new Tracker.Known(new Song("k", "T", "A"), "vid1", () -> print));
        Budget budget = new Budget(clock);
        budget.take();
        budget.take(); // Shazam can't be asked for a while
        Tracker tracker = new Tracker(heardFrom(copy, 5 * RATE, 12), library, sound -> null, clock, budget, events);
        tracker.retrySoon();
        tracker.look(); // the retry waits; meanwhile a song heard before is told, and its copy fails to download
        assertTrue(events.problems.toString(), events.problems.get(0).startsWith("Shazam busy | "));
        assertTrue(events.problems.toString(), events.lastProblem().startsWith("Download failed | "));
        for (int i = 0; i < 3; i++) {
            clock.now += 0.2;
            tracker.look();
        }
        assertTrue("not covered by the waiting retry: " + events.problems,
                events.lastProblem().startsWith("Download failed | "));
    }

    @Test
    public void anEndedSessionStopsLoadingCopiesAndKeepsTheDownload() {
        SongCopy copy = song(20);
        List<String> dropped = new ArrayList<>(), tried = new ArrayList<>(); // (not "loaded": FakeLibrary has one)
        Tracker.Library library = new FakeLibrary(copy) {
            @Override
            public Iterator<String> candidates(Song song) {
                return Arrays.asList("a", "b").iterator();
            }

            @Override
            public SongCopy load(String videoId, Tracker.Stages stages) throws SongProblem {
                tried.add(videoId);
                Thread.currentThread().interrupt(); // the session is stopped while decoding
                throw new SongProblem("decoding the download was stopped");
            }

            @Override
            public void drop(String videoId) {
                dropped.add(videoId);
            }
        };
        FakeClock clock = new FakeClock();
        Tracker tracker = new Tracker(noise(12, 11), library, sound -> new Song("k", "T", "A"), clock,
                new Budget(clock), new Events());
        try {
            tracker.look();
        } finally {
            Thread.interrupted(); // (clears the flag for the other tests)
        }
        assertEquals("no other copy tried", Collections.singletonList("a"), tried);
        assertTrue("a stopped download isn't thrown away", dropped.isEmpty());
    }

    @Test
    public void aStoppedSessionTriesNoOtherCopyEvenWhenTheInterruptWasSwallowed() {
        SongCopy copy = song(20);
        List<String> dropped = new ArrayList<>(), tried = new ArrayList<>();
        Tracker[] tracker = new Tracker[1];
        Tracker.Library library = new FakeLibrary(copy) {
            @Override
            public Iterator<String> candidates(Song song) {
                return Arrays.asList("a", "b").iterator();
            }

            @Override
            public SongCopy load(String videoId, Tracker.Stages stages) throws SongProblem {
                tried.add(videoId);
                tracker[0].stop(); // the session ends during the download; HTTP clears the interrupt flag
                throw new SongProblem("the download failed: thread interrupted");
            }

            @Override
            public void drop(String videoId) {
                dropped.add(videoId);
            }
        };
        FakeClock clock = new FakeClock();
        tracker[0] = new Tracker(noise(12, 12), library, sound -> new Song("k", "T", "A"), clock, new Budget(clock),
                new Events());
        tracker[0].look();
        assertEquals("no other copy tried", Collections.singletonList("a"), tried);
        assertTrue(dropped.isEmpty());
    }

    @Test
    public void statusWordsSplitAProblemAndCountDown() {
        String problem = StatusWords.problem("No match yet", "YouTube's copy of A - T doesn't line up");
        assertEquals("No match yet", StatusWords.words(problem));
        assertEquals("YouTube's copy of A - T doesn't line up", StatusWords.detail(problem));
        assertEquals("plain text is both", "boom", StatusWords.words("boom"));
        assertEquals("boom", StatusWords.detail("boom"));
        assertEquals("Resting 52 s", StatusWords.counting("Resting", 52_000, 0));
        assertEquals("Resting 52 s", StatusWords.counting("Resting", 52_000, 100));
        assertEquals("Resting 51 s", StatusWords.counting("Resting", 52_000, 1000));
        assertEquals("over: just the words", "Resting", StatusWords.counting("Resting", 52_000, 52_000));
        assertEquals("no countdown", "Listening", StatusWords.counting("Listening", 0, 5000));
        assertEquals(905, StatusWords.nextTick(52_000, 100));
        assertEquals(1005, StatusWords.nextTick(52_000, 1000));
        assertEquals(-1, StatusWords.nextTick(0, 1000));
        assertEquals(-1, StatusWords.nextTick(52_000, 60_000));
    }
}
