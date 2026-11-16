package app.morphed.extension.twitch.musicfilter;

import static org.junit.Assert.assertEquals;
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

    static final class FakeClock implements Clock {
        double now = 1000;

        @Override
        public double seconds() {
            return now;
        }
    }

    static final class Events implements Tracker.Listener {
        final List<String> problems = new ArrayList<>(), steps = new ArrayList<>();
        Boolean filtering;

        @Override
        public void state(boolean on) {
            filtering = on;
        }

        @Override
        public void problem(String text) {
            problems.add(text);
        }

        @Override
        public void ready(int seconds) {
        }

        @Override
        public void step(String text) {
            steps.add(text);
        }
    }

    static final class FakeLibrary implements Tracker.Library {
        final SongCopy copy;
        final List<String> loaded = new ArrayList<>();
        String remembered;
        boolean searchFails;

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
            return Collections.emptyList();
        }

        @Override
        public SongCopy load(String videoId) {
            loaded.add(videoId);
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
        Random random = new Random(1);
        short[] left = new short[seconds * RATE], right = new short[seconds * RATE];
        for (int i = 0; i < left.length; i++) {
            double tone = Math.sin(2 * Math.PI * (220 + 40 * ((i / (RATE / 2)) % 9)) * i / RATE);
            left[i] = (short) ((random.nextGaussian() * 0.3 + tone) * 9000);
            right[i] = left[i];
        }
        return new SongCopy("vid1", left, right);
    }

    private static Heard heardFrom(SongCopy copy, int songStart, int seconds) {
        Heard heard = new Heard();
        float[] stream = copy.mono(songStart, songStart + seconds * RATE);
        heard.add(stream, stream.length);
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

        // more of the song comes in: still found where it should be
        float[] more = copy.mono(17 * RATE, 21 * RATE);
        heard.add(more, more.length);
        clock.now += Tracker.CHECK_S;
        tracker.look();
        assertEquals(5L * RATE, tracker.playing.offset);
    }

    @Test
    public void shazamKnowingNothingCountsAsATryAndRestsAfterTwo() {
        SongCopy copy = song(20);
        Heard heard = heardFrom(copy, 0, 12);
        FakeClock clock = new FakeClock();
        Events events = new Events();
        int[] asked = {0};
        Tracker tracker = new Tracker(heard, new FakeLibrary(copy), sound -> {
            asked[0]++;
            return null;
        }, clock, new Budget(clock), events);
        tracker.look();
        clock.now += Tracker.ASK_S;
        tracker.look();
        assertEquals(2, asked[0]);
        assertTrue(events.steps.toString(), events.steps.contains("No music found, resting a minute"));
        clock.now += Tracker.ASK_S;
        tracker.look();
        assertEquals("resting: no request", 2, asked[0]);
        assertNull(tracker.playing);
    }

    @Test
    public void aRefusalWaitsLongerEachTimeAndIsTold() {
        Heard heard = heardFrom(song(20), 0, 12);
        FakeClock clock = new FakeClock();
        Events events = new Events();
        int[] asked = {0};
        Tracker tracker = new Tracker(heard, new FakeLibrary(song(20)), sound -> {
            asked[0]++;
            throw new SongProblem.RateLimited("Shazam is getting too many requests from this connection");
        }, clock, new Budget(clock), events);
        tracker.look();
        assertEquals("Shazam is getting too many requests from this connection, asking again in about a minute",
                events.problems.get(events.problems.size() - 1));
        clock.now += 30;
        tracker.look();
        assertEquals("still waiting", 1, asked[0]);
        clock.now += 40;
        tracker.look();
        assertEquals(2, asked[0]);
        assertTrue(events.problems.get(events.problems.size() - 1).endsWith("asking again in about 2 minutes"));
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
        assertTrue(events.problems.toString(), events.problems.contains("Searching YouTube failed: no connection"));
        assertNull(tracker.playing);
    }

    @Test
    public void aCopyOfAnotherVersionIsTriedTwiceThenGivenUpOn() {
        SongCopy copy = song(20);
        Heard heard = new Heard();
        float[] noise = new float[12 * RATE];
        Random random = new Random(4);
        for (int i = 0; i < noise.length; i++) noise[i] = (float) random.nextGaussian() * 0.2f;
        heard.add(noise, noise.length);
        FakeClock clock = new FakeClock();
        Events events = new Events();
        Tracker tracker = new Tracker(heard, new FakeLibrary(copy), sound -> new Song("k", "T", "A"), clock,
                new Budget(clock), events);
        tracker.look();
        assertTrue(events.problems.toString(), events.problems.get(events.problems.size() - 1).contains("doesn't line up"));
        clock.now += Tracker.LISTEN_S;
        tracker.look(); // the retry, no new request
        assertTrue(events.problems.toString(),
                events.problems.get(events.problems.size() - 1).contains("only other versions"));
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

        tracker.retrySoon();
        tracker.look();
        assertEquals(1, asked[0]);
        assertEquals("Retrying in about a minute, once Shazam can be asked again",
                events.steps.get(events.steps.size() - 1));
        assertTrue("not a problem: " + events.problems, events.problems.isEmpty());
        assertNotNull("the song is still taken out meanwhile", tracker.playing);

        clock.now += 41;
        tracker.look();
        assertTrue(events.steps.toString(), events.steps.contains("Retrying from the start"));
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
}
