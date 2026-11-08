package app.morphe.extension.pinedrama.interaction;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.content.Context;
import android.os.Looper;
import android.view.View;
import android.widget.FrameLayout;

import app.morphe.extension.pinedrama.SettingsContextRule;
import app.morphe.extension.pinedrama.settings.Settings;

import com.ss.android.ugc.aweme.common.widget.VerticalViewPager;
import com.ss.android.ugc.aweme.feed.model.Aweme;
import com.ss.android.ugc.aweme.series.innerfeed.viewmodel.SeriesInnerFeedViewModel;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;

import java.time.Duration;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/** Issue #1: full screen opens on the whole series, and only on a series. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
public class LandscapeEpisodesTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @After public void reset() {
        Settings.LANDSCAPE_EPISODES.resetToDefault();
        LandscapeEpisodes.leaving(null);
    }

    private static Aweme episode(String id) {
        return new Aweme() {
            @Override public String getAid() {
                return id;
            }

            @Override public boolean isAd() {
                return false;
            }
        };
    }

    private static Aweme ad(String id) {
        return new Aweme() {
            @Override public String getAid() {
                return id;
            }

            @Override public boolean isAd() {
                return true;
            }
        };
    }

    @Test public void theSeriesReplacesTheOneItemListWithoutItsAds() {
        Aweme first = episode("1");
        Aweme second = episode("2");
        List<Object> chosen = LandscapeEpisodes.select(
                Collections.singletonList(episode("2")), Arrays.asList(first, ad("9"), second));
        assertEquals(Arrays.asList(first, second), chosen);
    }

    @Test public void aVideoOutsideTheSeriesKeepsItsOwnList() {
        assertNull(LandscapeEpisodes.select(
                Collections.singletonList(episode("7")), Arrays.asList(episode("1"), episode("2"))));
    }

    @Test public void aListThatAlreadyHoldsSeveralIsNotTheOneItemSeed() {
        assertNull(LandscapeEpisodes.select(
                Arrays.asList(episode("1"), episode("2")), Arrays.asList(episode("1"), episode("2"))));
    }

    @Test public void anEntryThatIsOnlyAnAdIsNotASession() {
        assertNull(LandscapeEpisodes.select(
                Collections.singletonList(ad("9")), Arrays.asList(ad("9"), episode("1"))));
    }

    @Test public void missingInputsAreNotASession() {
        assertNull(LandscapeEpisodes.select(null, new ArrayList<>()));
        assertNull(LandscapeEpisodes.select(Collections.singletonList(episode("1")), null));
        assertNull(LandscapeEpisodes.select(new ArrayList<>(), new ArrayList<>()));
    }

    @Test public void moreLoadsWithinThreeOfTheEndAsTheViewerItselfDoes() {
        assertFalse(LandscapeEpisodes.nearEnd(5, 10));
        assertTrue(LandscapeEpisodes.nearEnd(6, 10));
        assertTrue(LandscapeEpisodes.nearEnd(9, 10));
    }

    @Test public void earlierEpisodesLoadNearTheStart() {
        assertTrue(LandscapeEpisodes.nearStart(0));
        assertTrue(LandscapeEpisodes.nearStart(1));
        assertFalse(LandscapeEpisodes.nearStart(2));
    }

    @Test public void theExitFindsAnEpisodeByIdInTheRawList() {
        List<Object> raw = Arrays.asList(episode("1"), ad("9"), episode("2"));
        assertEquals("ads still count in the portrait list", 2, LandscapeEpisodes.indexOf(raw, "2"));
        assertEquals(-1, LandscapeEpisodes.indexOf(raw, "5"));
        assertEquals(-1, LandscapeEpisodes.indexOf(null, "1"));
        assertEquals(-1, LandscapeEpisodes.indexOf(raw, null));
    }

    @Test public void withoutASeriesModelTheViewerRunsItsOwnCode() {
        LandscapeEpisodes.remember(new Object(), new Object());
        List<Object> seed = Collections.singletonList(episode("1"));
        assertSame(seed, LandscapeEpisodes.episodes(seed));
        assertFalse("native load more", LandscapeEpisodes.loadMore(new Object(), 0, 1, false));
        assertFalse("native load previous", LandscapeEpisodes.loadPrevious(new Object()));
    }

    @Test public void theSwitchOffLeavesTheSeedAlone() {
        Settings.LANDSCAPE_EPISODES.save(false);
        List<Object> seed = Collections.singletonList(episode("1"));
        assertSame(seed, LandscapeEpisodes.episodes(seed));
        assertFalse(LandscapeEpisodes.loadMore(new Object(), 0, 1, false));
    }

    /** Stands in for the viewer: only the names and shapes the extension reaches for. */
    public static final class FakeViewer {
        final List<String> calls = new ArrayList<>();
        FakeAbility ability;

        public FakeAbility Hz() {
            return ability;
        }

        public void fr(boolean automatic) {
            calls.add("automatic=" + automatic);
        }

        public void R3(List<?> episodes, boolean more) {
            calls.add("append " + episodes.size());
        }

        public void Qc(List<?> episodes, boolean more) {
            calls.add("prepend " + episodes.size());
        }

        public void B3(Exception why) {
            calls.add("load ended");
        }
    }

    private SeriesInnerFeedViewModel open(boolean hasNext, boolean grows) {
        SeriesInnerFeedViewModel series = new SeriesInnerFeedViewModel(
                new ArrayList<>(Arrays.asList(episode("1"), episode("2"), episode("3"))));
        series.hasNext = hasNext;
        series.growsWith = grows ? episode("4") : null;
        LandscapeEpisodes.remember(new Object(), series);
        List<Object> seed = Collections.singletonList(episode("3"));
        assertEquals("opened on the whole series", 3, LandscapeEpisodes.episodes(seed).size());
        return series;
    }

    private static void waitOutPolling() {
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(10));
    }

    @Test public void aNextPageGoesToTheAppendWithoutMovingThePlayer() {
        SeriesInnerFeedViewModel series = open(true, true);
        FakeViewer viewer = new FakeViewer();

        assertTrue(LandscapeEpisodes.loadMore(viewer, 2, 3, false));
        waitOutPolling();

        assertEquals("asked for the next page", Collections.singletonList(4), series.modes);
        assertEquals(Arrays.asList("automatic=true", "append 4"), viewer.calls);
    }

    @Test public void anEarlierPageGoesToThePrepend() {
        SeriesInnerFeedViewModel series = open(true, true);
        FakeViewer viewer = new FakeViewer();

        assertTrue(LandscapeEpisodes.loadPrevious(viewer));
        waitOutPolling();

        assertEquals("asked for the previous page", Collections.singletonList(2), series.modes);
        assertEquals(Collections.singletonList("prepend 4"), viewer.calls);
    }

    @Test public void aPullPastTheLastEpisodeMovesOnOnceTheNextPageArrives() {
        open(true, true);
        FakeViewer viewer = new FakeViewer();

        assertTrue(LandscapeEpisodes.loadMore(viewer, 2, 3, true));
        waitOutPolling();

        assertEquals("the spinner stays up for the load, and the append moves the player",
                Arrays.asList("automatic=false", "append 4"), viewer.calls);
    }

    @Test public void aPullWithNothingLeftTakesTheSpinnerDown() {
        SeriesInnerFeedViewModel series = open(false, false);
        FakeViewer viewer = new FakeViewer();

        assertTrue(LandscapeEpisodes.loadMore(viewer, 2, 3, true));
        waitOutPolling();

        assertTrue("nothing to ask for", series.modes.isEmpty());
        assertEquals(Arrays.asList("automatic=false", "load ended"), viewer.calls);
    }

    @Test public void aLoadThatNeverArrivesTakesTheSpinnerDown() {
        open(true, false);
        FakeViewer viewer = new FakeViewer();

        assertTrue(LandscapeEpisodes.loadMore(viewer, 2, 3, true));
        waitOutPolling();

        assertEquals(Arrays.asList("automatic=false", "load ended"), viewer.calls);
    }

    /** The portrait screen, the one thing the entry hook asks of the assem. */
    public static final class FakeAssem {
        final View container;

        FakeAssem(View container) {
            this.container = container;
        }

        public View getContainerView() {
            return container;
        }
    }

    /** The viewer's pager ability and the video it's on. */
    public static final class FakeAbility {
        final Aweme current;

        FakeAbility(Aweme current) {
            this.current = current;
        }

        public Aweme LLLILZLLLI() {
            return current;
        }
    }

    /** Stops on the last of four episodes while the portrait pager holds only {@code pages}. */
    private VerticalViewPager openAndLeaveOnTheLastEpisode(int pages) {
        Context context = RuntimeEnvironment.getApplication();
        VerticalViewPager pager = new VerticalViewPager(context);
        pager.current = 0;
        pager.pages = new VerticalViewPager.Pages(pages);
        FrameLayout screen = new FrameLayout(context);
        screen.addView(pager);

        Aweme last = episode("4");
        SeriesInnerFeedViewModel series = new SeriesInnerFeedViewModel(
                new ArrayList<>(Arrays.asList(episode("1"), episode("2"), episode("3"), last)));
        series.hasNext = false;
        LandscapeEpisodes.remember(new FakeAssem(screen), series);
        LandscapeEpisodes.episodes(Collections.singletonList(episode("1")));
        FakeViewer viewer = new FakeViewer();
        viewer.ability = new FakeAbility(last);
        LandscapeEpisodes.loadMore(viewer, 3, 4, false);

        LandscapeEpisodes.leaving(null);
        return pager;
    }

    private static void idleMillis(long millis) {
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(millis));
    }

    @Test public void leavingWaitsForThePortraitPagerToHoldTheEpisode() {
        VerticalViewPager pager = openAndLeaveOnTheLastEpisode(2);

        idleMillis(500);
        assertEquals("a jump now would land on its last page", 0, pager.advances);

        pager.pages.count = 4;
        idleMillis(200);
        assertEquals(1, pager.advances);
        assertEquals(3, pager.current);
    }

    @Test public void leavingMovesAtOnceWhenThePortraitPagerAlreadyHoldsEverything() {
        VerticalViewPager pager = openAndLeaveOnTheLastEpisode(4);

        assertEquals(3, pager.current);
    }

    @Test public void aPortraitPagerThatNeverCatchesUpStillGetsTheJump() {
        VerticalViewPager pager = openAndLeaveOnTheLastEpisode(2);

        waitOutPolling();

        assertEquals(1, pager.advances);
    }

    @Test public void aPortraitScreenThatPutsItselfBackGetsMovedAgain() {
        VerticalViewPager pager = openAndLeaveOnTheLastEpisode(4);
        assertEquals(3, pager.current);

        pager.current = 0;
        idleMillis(200);

        assertEquals(3, pager.current);
    }

    @Test public void theJumpStopsWatchingAfterAMoment() {
        VerticalViewPager pager = openAndLeaveOnTheLastEpisode(4);
        idleMillis(2000);

        pager.current = 1;
        idleMillis(2000);

        assertEquals("a swipe of your own stays put", 1, pager.current);
    }

    @Test public void aPageThatDidNotComeIsAskedForAgainNearTheEnd() {
        SeriesInnerFeedViewModel series = open(true, false);
        FakeViewer viewer = new FakeViewer();
        assertTrue(LandscapeEpisodes.loadMore(viewer, 2, 3, false));
        waitOutPolling();
        assertEquals("the first ask came to nothing", Collections.singletonList(4), series.modes);

        series.growsWith = episode("4");
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(6));

        assertEquals(Arrays.asList(4, 4), series.modes);
        assertTrue(viewer.calls.contains("append 4"));
    }

    @Test public void aPageThatArrivedLateIsHandedOverWithoutAskingAgain() {
        SeriesInnerFeedViewModel series = open(true, false);
        FakeViewer viewer = new FakeViewer();
        assertTrue(LandscapeEpisodes.loadMore(viewer, 2, 3, false));
        waitOutPolling();

        series.getAwemeList().add(episode("4"));
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(6));

        assertEquals(Collections.singletonList(4), series.modes);
        assertTrue(viewer.calls.contains("append 4"));
    }

    @Test public void awayFromTheEndAFailedPageIsLeftForTheNextSwipe() {
        SeriesInnerFeedViewModel series = open(true, false);
        FakeViewer viewer = new FakeViewer();
        assertTrue(LandscapeEpisodes.loadMore(viewer, 2, 3, false));
        waitOutPolling();

        assertTrue(LandscapeEpisodes.loadMore(viewer, 0, 30, false));
        series.modes.clear();
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(6));

        assertFalse("nothing near the end to load for", series.modes.contains(4));
    }

    @Test public void openingFullScreenAgainDropsTheWaitingJump() {
        VerticalViewPager pager = openAndLeaveOnTheLastEpisode(2);

        LandscapeEpisodes.remember(new Object(), new Object());
        pager.pages.count = 4;
        waitOutPolling();

        assertEquals(0, pager.advances);
    }
}
