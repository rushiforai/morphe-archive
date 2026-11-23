package nl.johninnl.eclipse.auto.data;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import java.util.ArrayList;
import java.util.List;
import org.junit.Test;

public class QueueViewTest {
    private static Model.QueueSnapshot snapshot(List<Model.Track> upNext, List<Model.Track> all, int current) {
        List<Model.Track> tail = new ArrayList<>(all.subList(Math.min(all.size(), current + 1), all.size()));
        List<Object> songs = new ArrayList<>();
        for (Model.Track track : all) songs.add(track.song);
        return new Model.QueueSnapshot(all.isEmpty() ? null : all.get(current), upNext, tail, songs, current, "Road Trip", false);
    }

    @Test public void sectionsAreUpNextThenTheContextTailInPlayingOrder() {
        List<Model.Track> all = FakeApp.tracks("c0", "c1", "c2", "c3");
        QueueView view = QueueView.of(snapshot(FakeApp.tracks("u0", "u1"), all, 1));
        assertEquals("c1", view.nowPlaying.title);
        assertEquals("u0", view.upNext.get(0).track.title);
        assertEquals("u1", view.upNext.get(1).track.title);
        assertEquals(2, view.context.size());
        assertEquals("c2", view.context.get(0).track.title);
        assertEquals(2, view.context.get(0).index);
        assertEquals(3, view.context.get(1).index);
        assertEquals("Next from Road Trip", view.contextTitle());
        assertTrue(view.hasUpcoming());
        assertTrue(view.clearable());
    }

    @Test public void clearOnlyAppliesToUpNext() {
        List<Model.Track> all = FakeApp.tracks("c0", "c1");
        QueueView view = QueueView.of(snapshot(new ArrayList<Model.Track>(), all, 0));
        assertFalse(view.clearable());
        assertTrue(view.hasUpcoming());
        QueueView ended = QueueView.of(snapshot(new ArrayList<Model.Track>(), all, 1));
        assertFalse(ended.hasUpcoming());
    }

    @Test public void rowsAreCappedAtOneHundredWithUpNextFirst() {
        List<Model.Track> up = new ArrayList<>();
        for (int i = 0; i < 30; i++) up.add(FakeApp.track("u" + i, "x"));
        List<Model.Track> all = new ArrayList<>();
        for (int i = 0; i < 200; i++) all.add(FakeApp.track("c" + i, "x"));
        QueueView view = QueueView.of(snapshot(up, all, 0));
        assertEquals(30, view.upNext.size());
        assertEquals(70, view.context.size());
        assertEquals(QueueView.ROW_CAP, view.upNext.size() + view.context.size());
        assertEquals("c1", view.context.get(0).track.title);
    }

    @Test public void aHugeUpNextLeavesNoRoomForTheTail() {
        List<Model.Track> up = new ArrayList<>();
        for (int i = 0; i < 150; i++) up.add(FakeApp.track("u" + i, "x"));
        QueueView view = QueueView.of(snapshot(up, FakeApp.tracks("c0", "c1", "c2"), 0));
        assertEquals(QueueView.ROW_CAP, view.upNext.size());
        assertTrue(view.context.isEmpty());
    }

    @Test public void shuffledTailSongsAreFoundByIdentityNotByPosition() {
        List<Model.Track> all = FakeApp.tracks("c0", "c1", "c2", "c3", "c4");
        List<Object> songs = new ArrayList<>();
        for (Model.Track track : all) songs.add(track.song);
        // Playing order is c0, then shuffled c3, c1, c4, c2.
        List<Model.Track> tail = new ArrayList<>();
        for (int i : new int[] {3, 1, 4, 2}) tail.add(all.get(i));
        Model.QueueSnapshot shuffled = new Model.QueueSnapshot(all.get(0), new ArrayList<Model.Track>(), tail, songs, 0, "Mix", false);
        QueueView view = QueueView.of(shuffled);
        assertEquals(3, view.context.get(0).index);
        assertEquals(1, view.context.get(1).index);
        assertEquals(4, view.context.get(2).index);
        assertEquals(2, view.context.get(3).index);
        assertSame(all.get(3), view.context.get(0).track);
    }

    @Test public void aTailSongThatIsNotInTheQueueIsNotTappable() {
        List<Model.Track> all = FakeApp.tracks("c0", "c1");
        List<Model.Track> tail = new ArrayList<>();
        tail.add(FakeApp.track("ghost", "x"));
        List<Object> songs = new ArrayList<>();
        for (Model.Track track : all) songs.add(track.song);
        QueueView view = QueueView.of(new Model.QueueSnapshot(all.get(0), new ArrayList<Model.Track>(), tail, songs, 0, "", false));
        assertEquals(-1, view.context.get(0).index);
        assertEquals("Next up", view.contextTitle());
    }

    @Test public void anEmptyQueueHasNothingUpcoming() {
        QueueView view = QueueView.of(Model.QueueSnapshot.empty());
        assertFalse(view.hasUpcoming());
        assertFalse(view.clearable());
    }
}
