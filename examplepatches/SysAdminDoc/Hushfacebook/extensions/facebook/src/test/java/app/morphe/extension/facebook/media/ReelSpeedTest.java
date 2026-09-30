/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.media;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import android.os.SystemClock;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.ArrayList;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Map;

import app.morphe.extension.facebook.reels.ReelHold;
import app.morphe.extension.facebook.reels.ReelHoldForTests;
import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/**
 * Keep the reel speed: a speed picked in a reel's menu is kept for the viewer the reel played in,
 * and the first start of each later video there gets it when the video is a reel that's neither an
 * ad nor live. A reel readied before the pick gets it when it starts again, the same reel started
 * again keeps whatever it's at, another viewer keeps its own speed, normal speed goes back to
 * Facebook's reset, and off, paused or failing, every reel starts as Facebook starts it.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ReelSpeedTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final String REELS = "fb_shorts_viewer";
    /** Where accounts whose Reels live in the Video tab play them. */
    private static final String VIDEO_TAB = "video_home";
    private static final String IN_FEED = "fb_shorts_native_in_feed_unit";

    /** What a player's VideoPlayerParams say about the video it bound. */
    private static final class Video {
        final boolean reel;
        final boolean ad;
        final boolean live;

        Video(boolean reel, boolean ad, boolean live) {
            this.reel = reel;
            this.ad = ad;
            this.live = live;
        }
    }

    private static final Video REEL = new Video(true, false, false);
    private static final Video AD = new Video(true, true, false);
    private static final Video LIVE = new Video(true, false, true);
    private static final Video NOT_A_REEL = new Video(false, false, false);

    /** Stands in for FbGrootPlayer: its PlayerOrigin's toString, the params of the video it binds and the speeds set on it. */
    private static final class FakePlayers implements ReelSpeed.Player {
        final Map<Object, String> origins = new IdentityHashMap<>();
        final Map<Object, Video> kinds = new IdentityHashMap<>();
        final Map<Object, Object> params = new IdentityHashMap<>();
        final List<String> set = new ArrayList<>();
        /** The speed each player plays at, normal until one is set. */
        final Map<Object, Float> speeds = new IdentityHashMap<>();
        RuntimeException failure;

        /** A player from [origin] whose videos are reels that are neither ads nor live. */
        Object player(String origin) {
            return player(origin, REEL);
        }

        Object player(String origin, Video kind) {
            Object player = new Object();
            origins.put(player, origin);
            kinds.put(player, kind);
            return player;
        }

        /** [player] binds a new video: new params, as Facebook builds for every video. */
        void bind(Object player) {
            params.put(player, new Video[] {kinds.get(player)});
        }

        @Override
        public void setSpeed(Object player, float speed) {
            if (failure != null) throw failure;
            set.add(origins.get(player) + " " + speed);
            // Facebook's setter is hooked too, so the extension hears its own change.
            ReelSpeed.speedSet(player, speed);
            speeds.put(player, speed);
        }

        double speed(Object player) {
            Float speed = speeds.get(player);
            return speed == null ? ReelSpeed.NORMAL : speed;
        }

        @Override
        public Object origin(Object player) {
            String origin = origins.get(player);
            return origin == null ? null : new Object() {
                @Override
                public String toString() {
                    return origin;
                }
            };
        }

        @Override
        public Object params(Object player) {
            return params.get(player);
        }

        private static Video video(Object params) {
            return ((Video[]) params)[0];
        }

        @Override
        public boolean reel(Object params) {
            return video(params).reel;
        }

        @Override
        public boolean ad(Object params) {
            return video(params).ad;
        }

        @Override
        public boolean live(Object params) {
            return video(params).live;
        }
    }

    private FakePlayers players;

    @Before
    public void start() {
        SystemClock.sleep(60_000);
        ReelSpeed.forget();
        players = new FakePlayers();
        ReelSpeed.access = players;
        HookStatus.clear();
    }

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.KEEP_REEL_SPEED.resetToDefault();
        ReelSpeed.forget();
        ReelHoldForTests.forget();
        HookStatus.clear();
    }

    /** A pick in the Reels menu as Facebook makes it: the speed set on the reel's player, then the toast. */
    private static void pick(Object player, float speed) {
        ReelSpeed.speedSet(player, speed);
        SystemClock.sleep(150);
        ReelSpeed.picked(speed);
    }

    /** A reel coming on screen: its player binds the video, then starts playing it. */
    private void play(Object player) {
        players.bind(player);
        ReelSpeed.started(player);
    }

    /** The same video started again, after a pause or once it's on screen. */
    private static void resume(Object player) {
        ReelSpeed.started(player);
    }

    private static String statusLine() {
        for (String line : HookStatus.report()) {
            if (line.startsWith(FamilyNames.KEEP_REEL_SPEED + ":")) return line;
        }
        return null;
    }

    @Test
    public void aPickedSpeedCarriesToEveryNextReelOfTheViewer() {
        assertTrue("the switch starts off", Settings.KEEP_REEL_SPEED.get());
        Object first = players.player(REELS + "::reels_tab");
        play(first);
        assertEquals("a reel started before any pick was changed", 0, players.set.size());
        pick(first, 1.5f);
        assertEquals(1.5f, ReelSpeed.kept(REELS), 0f);

        Object second = players.player(REELS + "::reels_tab");
        play(second);
        // Pooled players come back for later reels, and a reel can start where another left off.
        play(first);
        Object third = players.player(REELS + "::feed_chaining");
        play(third);
        assertEquals(List.of(REELS + "::reels_tab 1.5", REELS + "::reels_tab 1.5", REELS + "::feed_chaining 1.5"),
                players.set);
        assertEquals(FamilyNames.KEEP_REEL_SPEED + ": invoked 9, 2 found, 0 missing. Counted: "
                + ReelSpeed.APPLIED + " 3", statusLine());
    }

    /**
     * Some accounts get their Reels in the Video tab, where reels play under video_home beside the
     * tab's other videos. A pick on a reel there carries to the tab's next reels, and the tab's
     * other videos, its ads and other viewers keep Facebook's speed.
     */
    @Test
    public void theVideoTabsReelsKeepTheirSpeedToo() {
        Object reel = players.player(VIDEO_TAB);
        play(reel);
        pick(reel, 2f);
        assertEquals(2f, ReelSpeed.kept(VIDEO_TAB), 0f);
        play(players.player(VIDEO_TAB));
        play(players.player(VIDEO_TAB + "::fb_shorts_in_watch_tab"));
        play(players.player(VIDEO_TAB, NOT_A_REEL));
        play(players.player(VIDEO_TAB, AD));
        play(players.player(REELS));
        assertEquals(List.of(VIDEO_TAB + " 2.0", VIDEO_TAB + "::fb_shorts_in_watch_tab 2.0"), players.set);
    }

    /**
     * Facebook readies the next reel before you get to it, and can start it early. It gets the speed
     * picked after that when it starts again on screen, once.
     */
    @Test
    public void aReelStartedBeforeThePickGetsItWhenItStartsAgain() {
        Object current = players.player(REELS);
        play(current);
        Object next = players.player(REELS);
        play(next);
        pick(current, 1.5f);
        resume(next);
        resume(next);
        resume(current);
        assertEquals("the reel readied before the pick didn't get it once, or the picked reel got it again",
                List.of(REELS + " 1.5"), players.set);
    }

    /** Paused and started again, a reel stays at what it's at: a 2x hold, say, lasts until the next reel. */
    @Test
    public void theSameReelStartedAgainKeepsItsSpeed() {
        Object reel = players.player(REELS);
        play(reel);
        pick(reel, 0.5f);
        Object next = players.player(REELS);
        play(next);
        ReelSpeed.speedSet(next, 2f);
        resume(next);
        resume(next);
        assertEquals(List.of(REELS + " 0.5"), players.set);
    }

    /**
     * With Hold a reel for 2x in too, a hold on a reel at the kept speed ends at that speed, and
     * neither its speed-up nor its lift is a pick. Both go through the player's setter, where Keep the
     * reel speed's hook runs first, as Morphe puts the two in: it hears the normal speed Facebook's
     * lift sets, and Hold a reel for 2x's hook then puts the kept speed back in its place.
     */
    @Test
    public void aHoldOnAReelAtTheKeptSpeedEndsThereAndPicksNothing() {
        Object reel = players.player(VIDEO_TAB);
        play(reel);
        pick(reel, 2f);
        Object next = players.player(VIDEO_TAB);
        play(next);
        ReelHoldForTests.holdAndLift(next, players::speed, (player, speed) -> {
            ReelSpeed.speedSet(player, speed);
            players.speeds.put(player, ReelHold.speedSet(player, speed));
        }, 1f);
        assertEquals("the held reel didn't go back to the kept speed", 2.0, players.speed(next), 0.0);
        SystemClock.sleep(150);
        assertEquals(2f, ReelSpeed.kept(VIDEO_TAB), 0f);
        play(players.player(VIDEO_TAB));
        assertEquals(List.of(VIDEO_TAB + " 2.0", VIDEO_TAB + " 2.0"), players.set);
    }

    /**
     * Facebook's Reels viewer plays ads and live videos between reels, and its speed menu may not
     * offer a speed there; a live video sped up runs into its live edge. They, and a video in the
     * viewer that isn't a reel, start at Facebook's speed while the next reel gets the kept one.
     */
    @Test
    public void anAdALiveVideoOrAnotherVideoInTheViewerStartsAtFacebooksSpeed() {
        Object reel = players.player(REELS);
        play(reel);
        pick(reel, 1.5f);
        play(players.player(REELS + "::reels_tab", AD));
        play(players.player(REELS, LIVE));
        play(players.player(REELS, NOT_A_REEL));
        assertEquals("an ad, a live video or a video that isn't a reel got the kept speed", 0, players.set.size());
        play(players.player(REELS));
        assertEquals(List.of(REELS + " 1.5"), players.set);
    }

    /**
     * Each viewer keeps its own speed: a pick on a reel in the feed carries to the feed's next reels
     * only, and doesn't take the place of, or forget, the Reels viewer's.
     */
    @Test
    public void aPickInOneViewerStaysThere() {
        Object inFeed = players.player(IN_FEED + "::newsfeed");
        play(inFeed);
        pick(inFeed, 2f);
        assertEquals(2f, ReelSpeed.kept(IN_FEED), 0f);
        assertEquals("an in-feed pick changed the Reels viewer's speed", 1f, ReelSpeed.kept(REELS), 0f);
        play(players.player(IN_FEED));
        play(players.player(REELS));
        assertEquals(List.of(IN_FEED + " 2.0"), players.set);

        Object reel = players.player(REELS);
        play(reel);
        pick(reel, 1.5f);
        pick(inFeed, 1f);
        assertEquals(1f, ReelSpeed.kept(IN_FEED), 0f);
        assertEquals("normal speed in the feed forgot the Reels viewer's speed", 1.5f, ReelSpeed.kept(REELS), 0f);
        play(players.player(IN_FEED));
        play(players.player(REELS));
        assertEquals(List.of(IN_FEED + " 2.0", REELS + " 1.5"), players.set);
    }

    /**
     * Normal picked on a video already at normal, an ad in the Reels viewer say, sets no speed, so
     * its toast has no player to go by. It forgets the speed of the viewer whose video started last,
     * the one on screen, and no other. With nothing started yet it forgets nothing.
     */
    @Test
    public void normalPickedOnAVideoAtNormalForgetsOnlyTheViewerOnScreen() {
        Object inFeed = players.player(IN_FEED + "::newsfeed");
        pick(inFeed, 2f);
        ReelSpeed.picked(1f);
        assertEquals("normal with nothing on screen forgot a speed", 2f, ReelSpeed.kept(IN_FEED), 0f);

        Object reel = players.player(REELS);
        play(reel);
        pick(reel, 1.5f);
        play(players.player(REELS, AD));
        ReelSpeed.picked(1f);
        assertEquals("normal in the Reels viewer kept its speed", 1f, ReelSpeed.kept(REELS), 0f);
        assertEquals("normal in the Reels viewer forgot the feed's speed", 2f, ReelSpeed.kept(IN_FEED), 0f);
        play(players.player(REELS));
        play(players.player(IN_FEED));
        assertEquals(List.of(IN_FEED + " 2.0"), players.set);
    }

    @Test
    public void aPlayerInAnotherViewerStartsAtFacebooksSpeed() {
        Object reel = players.player(REELS);
        play(reel);
        pick(reel, 1.5f);
        play(players.player("newsfeed"));
        play(players.player("video_home::fb_shorts_viewer"));
        Object noOrigin = new Object();
        players.bind(noOrigin);
        ReelSpeed.started(noOrigin);
        assertEquals(0, players.set.size());
    }

    @Test
    public void normalSpeedGoesBackToFacebooksReset() {
        Object reel = players.player(REELS);
        play(reel);
        pick(reel, 2f);
        pick(reel, 1f);
        assertEquals(1f, ReelSpeed.kept(REELS), 0f);
        play(players.player(REELS));
        assertEquals(0, players.set.size());
    }

    /** The toast names the change it follows; a toast with no such change just before keeps nothing. */
    @Test
    public void aToastWithoutItsSpeedChangeKeepsNothing() {
        Object reel = players.player(REELS);
        play(reel);
        ReelSpeed.speedSet(reel, 1.25f);
        ReelSpeed.picked(1.5f);
        assertEquals("a toast for another speed kept one", 1f, ReelSpeed.kept(REELS), 0f);
        ReelSpeed.speedSet(reel, 1.5f);
        SystemClock.sleep(ReelSpeed.PICK_WINDOW_MS + 1);
        ReelSpeed.picked(1.5f);
        assertEquals("a toast long after the change kept it", 1f, ReelSpeed.kept(REELS), 0f);
        ReelSpeed.picked(1.5f);
        assertEquals(1f, ReelSpeed.kept(REELS), 0f);
        play(players.player(REELS));
        assertEquals(0, players.set.size());
    }

    @Test
    public void offNothingIsKeptOrApplied() {
        Settings.KEEP_REEL_SPEED.save(false);
        Object reel = players.player(REELS);
        play(reel);
        pick(reel, 1.5f);
        Settings.KEEP_REEL_SPEED.save(true);
        play(players.player(REELS));
        assertEquals("a pick made while off was kept", 0, players.set.size());

        pick(reel, 1.5f);
        Settings.KEEP_REEL_SPEED.save(false);
        play(players.player(REELS));
        assertEquals("a reel started while off got the kept speed", 0, players.set.size());
    }

    @Test
    public void pausedEveryReelStartsAsFacebookStartsIt() {
        Object reel = players.player(REELS);
        play(reel);
        pick(reel, 1.5f);
        for (HushfacebookPause.Reason reason : new HushfacebookPause.Reason[] {
                HushfacebookPause.Reason.SWITCH, HushfacebookPause.Reason.CRASH_LOOP}) {
            PauseForTests.pause(reason);
            play(players.player(REELS));
            assertEquals(reason.name(), 0, players.set.size());
        }
        PauseForTests.resume();
        play(players.player(REELS));
        assertEquals(List.of(REELS + " 1.5"), players.set);
    }

    @Test
    public void aFailingSetterIsReportedAndTheReelPlaysOn() {
        Object reel = players.player(REELS);
        play(reel);
        pick(reel, 1.5f);
        players.failure = new IllegalStateException("the setter failed");
        play(players.player(REELS));
        assertTrue(HookStatus.missing(FamilyNames.KEEP_REEL_SPEED).get(0)
                .startsWith("a working 'player start' hook (it threw "));
    }

    /** Until the patch fills the stubs in, no player has a viewer, so nothing is kept. */
    @Test
    public void unpatchedStubsKeepNothing() {
        ReelSpeed.access = ReelSpeed.PATCHED;
        Object reel = new Object();
        pick(reel, 1.5f);
        assertEquals(1f, ReelSpeed.kept(REELS), 0f);
    }
}
