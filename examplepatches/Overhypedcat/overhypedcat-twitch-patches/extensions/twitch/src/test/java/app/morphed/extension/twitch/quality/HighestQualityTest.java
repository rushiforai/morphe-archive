package app.morphed.extension.twitch.quality;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import com.amazonaws.ivs.player.Player;
import com.amazonaws.ivs.player.Quality;

import org.junit.Before;
import org.junit.Test;

import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

/** Which quality is the highest, and what counts as a new stream. */
public class HighestQualityTest {
    private static HighestQuality.Choice q(String name, int height, float fps, int bitrate) {
        return new HighestQuality.Choice(name, height, fps, bitrate);
    }

    @Test
    public void theMostLinesWin() {
        List<HighestQuality.Choice> qualities = Arrays.asList(q("720p60", 720, 60, 3_000_000),
                q("1080p60", 1080, 60, 6_000_000), q("480p30", 480, 30, 1_400_000));
        assertEquals(1, HighestQuality.best(qualities));
    }

    @Test
    public void thenTheMostFramesThenTheMostBits() {
        assertEquals(1, HighestQuality.best(Arrays.asList(q("1080p30", 1080, 30, 6_000_000), q("1080p60", 1080, 59.94f, 6_000_000))));
        assertEquals(0, HighestQuality.best(Arrays.asList(q("1080p60 (source)", 1080, 60, 8_000_000), q("1080p60", 1080, 60, 6_000_000))));
    }

    @Test
    public void audioOnlyIsNeverPicked() {
        assertEquals(-1, HighestQuality.best(Collections.singletonList(q("audio_only", 0, 0, 160_000))));
        assertEquals(1, HighestQuality.best(Arrays.asList(q("audio_only", 0, 0, 9_000_000), q("160p30", 160, 30, 230_000))));
        assertEquals(-1, HighestQuality.best(Collections.emptyList()));
    }

    @Test
    public void aNewLoadIsANewStreamAndAChangedListIsNot() {
        List<HighestQuality.Choice> one = Arrays.asList(q("1080p60", 1080, 60, 1), q("720p60", 720, 60, 1));
        List<HighestQuality.Choice> more = Arrays.asList(q("1080p60", 1080, 60, 1), q("720p60", 720, 60, 1), q("audio_only", 0, 0, 1));
        assertNotEquals("another session: the next stream, or the same channel again",
                HighestQuality.key("s1", one), HighestQuality.key("s2", one));
        assertEquals("a quality added in the same stream: what was chosen stays",
                HighestQuality.key("s1", one), HighestQuality.key("s1", more));
        // without a session, the names (in any order) tell streams apart
        assertEquals(HighestQuality.key(null, one), HighestQuality.key(null,
                Arrays.asList(q("720p60", 720, 60, 1), q("1080p60", 1080, 60, 1))));
        assertNotEquals(HighestQuality.key(null, one), HighestQuality.key(null, more));
    }

    /** A player as far as the switch goes: its qualities, mode, mute and session. */
    private static final class FakePlayer implements Player {
        Set<Quality> qualities = new LinkedHashSet<>();
        Quality quality;
        boolean auto = true, muted;
        String session = "s1";

        FakePlayer with(Quality... list) {
            qualities = new LinkedHashSet<>(Arrays.asList(list));
            return this;
        }

        @Override public State getState() { return State.PLAYING; }
        @Override public boolean isMuted() { return muted; }
        @Override public void pause() { }
        @Override public void play() { }
        @Override public Set<Quality> getQualities() { return qualities; }
        @Override public Quality getQuality() { return quality; }
        @Override public void setQuality(Quality q) { quality = q; auto = false; }
        @Override public boolean isAutoQualityMode() { return auto; }
        @Override public void setAutoQualityMode(boolean on) { auto = on; }
        @Override public String getSessionId() { return session; }
        @Override public long getPosition() { return 0; }
        @Override public long getBufferedPosition() { return 0; }
        @Override public long getLiveLatency() { return 0; }
        @Override public long getBandwidthEstimate() { return 0; }
        @Override public com.amazonaws.ivs.player.Statistics getStatistics() { return null; }
    }

    private static final Quality P1080 = new Quality("1080p60", 1080, 60, 6_000_000);
    private static final Quality P720 = new Quality("720p60", 720, 60, 3_000_000);
    private static final Quality AUDIO = new Quality("audio_only", 0, 0, 160_000);

    @Before
    public void startFresh() {
        HighestQuality.forget();
    }

    @Test
    public void aNewStreamStartsAtItsHighest() {
        FakePlayer player = new FakePlayer().with(P720, AUDIO, P1080);
        HighestQuality.apply(player);
        assertFalse(player.auto);
        assertEquals(P1080, player.quality);
    }

    @Test
    public void qualitiesNotKnownYetAreWaitedFor() {
        FakePlayer player = new FakePlayer();
        HighestQuality.apply(player);
        assertTrue("nothing to choose from yet", player.auto);
        player.with(P720, P1080);
        HighestQuality.apply(player);
        assertEquals(P1080, player.quality);
    }

    @Test
    public void aQualityChosenAfterwardsStays() {
        FakePlayer player = new FakePlayer().with(P720, P1080);
        HighestQuality.apply(player);
        player.setAutoQualityMode(true); // the viewer picks Auto
        player.with(P720, P1080, AUDIO); // and the list changes later in the same stream
        HighestQuality.apply(player);
        assertTrue("Auto, as picked", player.auto);
    }

    @Test
    public void aQualityTwitchSavedIsReplacedAtTheStart() {
        // Twitch puts back the quality chosen last time: the switch is for the start of every stream all the same.
        FakePlayer player = new FakePlayer().with(P720, P1080);
        player.setQuality(P720);
        HighestQuality.apply(player);
        assertEquals(P1080, player.quality);
    }

    @Test
    public void unnamedQualitiesAreLeftAlone() {
        // an ad's or a preview's player: nothing to name in the log, nothing to set
        FakePlayer player = new FakePlayer().with(new Quality("", 720, 30, 1), new Quality(null, 1080, 30, 1));
        HighestQuality.apply(player);
        assertTrue(player.auto);
    }

    @Test
    public void aMutedPreviewIsLeftAloneUntilItsWatched() {
        FakePlayer player = new FakePlayer().with(P720, P1080);
        player.muted = true;
        HighestQuality.apply(player);
        assertTrue(player.auto);
        assertNull(player.quality);
        player.muted = false; // opened from the feed
        HighestQuality.apply(player);
        assertEquals(P1080, player.quality);
    }

    @Test
    public void aStreamStartedWithTheSwitchOffKeepsAQualityPickedByHand() {
        FakePlayer player = new FakePlayer().with(P720, P1080);
        HighestQuality.seenWithoutIt(player); // the stream starts, the switch off
        // the switch turned on in it, then 720p picked by hand (the hook runs again on each pick)
        player.setQuality(P720);
        HighestQuality.apply(player);
        assertEquals("picked by hand: it stays", P720, player.quality);
        // from the next stream on, the switch counts
        player.session = "s2";
        HighestQuality.apply(player);
        assertEquals(P1080, player.quality);
    }

    @Test
    public void anAdsUnnamedQualitiesDontUseUpTheStream() {
        FakePlayer player = new FakePlayer().with(new Quality("", 720, 30, 1));
        HighestQuality.apply(player);
        player.with(P720, P1080); // the stream's own, later in the same session
        HighestQuality.apply(player);
        assertEquals(P1080, player.quality);
    }

    @Test
    public void theNextStreamOnTheSamePlayerStartsAtItsHighestToo() {
        FakePlayer player = new FakePlayer().with(P720, P1080);
        HighestQuality.apply(player);
        player.setAutoQualityMode(true); // Twitch's start of the next stream
        player.session = "s2";
        HighestQuality.apply(player);
        assertEquals(P1080, player.quality);
        assertFalse(player.auto);
    }
}
