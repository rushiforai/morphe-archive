package nl.johninnl.eclipse.auto.data;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.junit.Test;

public class PlaybackTest {
    private final FakeApp app = new FakeApp();

    @Test public void playUsesTheCollectionOriginAndClampsTheIndex() {
        List<Model.Track> tracks = FakeApp.tracks("a", "b", "c");
        Playback.play(app, tracks, 1, "origin:x");
        Playback.play(app, tracks, 99, null);
        Playback.play(app, tracks, -4, null);
        assertEquals(Arrays.asList("play 3@1 origin:x", "play 3@2 library", "play 3@0 library"), app.calls);
    }

    @Test public void playingAnEmptyListDoesNothing() {
        Playback.play(app, new ArrayList<Model.Track>(), 0, null);
        Playback.shuffle(app, new ArrayList<Model.Track>(), null);
        assertTrue(app.calls.isEmpty());
    }

    @Test public void shuffleSwitchesShuffleOnOnlyWhenItIsOffThenPlaysFromTheStart() {
        List<Model.Track> tracks = FakeApp.tracks("a", "b");
        Playback.shuffle(app, tracks, null);
        assertEquals(Arrays.asList("toggleShuffle", "play 2@0 library"), app.calls);
        app.calls.clear();
        Playback.shuffle(app, tracks, null);
        assertEquals("shuffle already on: it must not be toggled off", Arrays.asList("play 2@0 library"), app.calls);
    }

    @Test public void addToUpNextAddsAtMostFiftyInOrder() {
        List<Model.Track> many = new ArrayList<>();
        for (int i = 0; i < 80; i++) many.add(FakeApp.track("t" + i, "x"));
        assertEquals(50, Playback.addToUpNext(app, many));
        assertEquals(50, app.calls.size());
        assertEquals("addToUpNext t0", app.calls.get(0));
        assertEquals("addToUpNext t49", app.calls.get(49));
    }

    @Test public void jumpingToUpNextDropsTheSongsInFrontThenSkipsIntoIt() {
        Playback.jumpToUpNext(app, 3);
        assertEquals(Arrays.asList("removeUpNext 0", "removeUpNext 0", "removeUpNext 0", "skipNext false"), app.calls);
        app.calls.clear();
        Playback.jumpToUpNext(app, 0);
        assertEquals("the first queued song needs no removal", Arrays.asList("skipNext false"), app.calls);
    }

    @Test public void jumpingWithinTheContextMovesTheIndexThenPlaysWithoutTouchingUpNext() {
        Model.Track target = FakeApp.track("later", "x");
        Playback.jumpToContext(app, target, 7);
        assertEquals(Arrays.asList("setQueueIndex 7", "playKeepingQueue later"), app.calls);
        for (String call : app.calls) {
            assertTrue(call, !call.startsWith("clearUpNext") && !call.startsWith("removeUpNext"));
        }
    }

    @Test public void anUnresolvedContextIndexIsIgnored() {
        Playback.jumpToContext(app, FakeApp.track("lost", "x"), -1);
        Playback.jumpToUpNext(app, -1);
        assertTrue(app.calls.isEmpty());
    }

    @Test public void headLimitsTheDisplayListNotThePlayList() {
        List<Model.Track> tracks = FakeApp.tracks("a", "b", "c");
        assertEquals(2, Playback.head(tracks, 2).size());
        assertEquals(3, Playback.head(tracks, 10).size());
    }
}
