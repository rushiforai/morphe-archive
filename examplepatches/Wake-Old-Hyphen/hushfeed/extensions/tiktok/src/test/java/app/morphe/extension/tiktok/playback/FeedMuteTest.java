package app.morphe.extension.tiktok.playback;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.content.Context;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.tiktok.settings.Settings;
import app.morphe.extension.tiktok.settings.SettingsStatus;
import com.ss.android.ugc.aweme.feed.model.Aweme;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;

/**
 * Mute feed videos: a feed video's engine is silenced as it plays and given its sound back on
 * unmute; a video no feed controller asked for (DMs), one on another screen, a story or a LIVE
 * keeps its sound; an engine reused for such a video gets its sound back; and the feed's audio
 * focus is turned down, and given up, only while muted with a feed video in front.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 34)
public class FeedMuteTest {
    private final Map<Object, String> ids = new HashMap<>();
    private final List<String> calls = new ArrayList<>();
    private ActivityController<Activity> feed;
    private boolean wasEnabled;
    private CountDownLatch muteEntered;
    private CountDownLatch releaseMute;
    private final AtomicBoolean engineMuted = new AtomicBoolean();

    /** Stands in for a PlayerController; FeedMute reads its host from this field. */
    static final class Controller {
        final Activity activity;

        Controller(Activity activity) {
            this.activity = activity;
        }
    }

    /** A screen that isn't the feed, like the detail page a DM's post opens in. */
    public static final class OtherScreen extends Activity {
    }

    @Before public void setUp() {
        Utils.setContext(RuntimeEnvironment.getApplication());
        FeedMute.resetForTests();
        wasEnabled = SettingsStatus.feedMuteEnabled;
        SettingsStatus.feedMuteEnabled = true;
        Settings.FEED_MUTED.save(false);
        FeedMute.nativeForTests = new FeedMute.Native() {
            @Override public String sourceId(Object engine) { return ids.get(engine); }
            @Override public boolean isMute(Object engine) { return false; }
            @Override public void setMute(Object engine, boolean mute) {
                if (mute && muteEntered != null) {
                    muteEntered.countDown();
                    try {
                        if (!releaseMute.await(5, TimeUnit.SECONDS)) throw new AssertionError("mute stalled");
                    } catch (InterruptedException interrupted) {
                        Thread.currentThread().interrupt();
                        throw new AssertionError(interrupted);
                    }
                }
                engineMuted.set(mute);
                calls.add(name(engine) + (mute ? " mute" : " sound"));
            }
            @Override public void abandonSession(Object helper) { calls.add("abandon session " + helper); }
            @Override public void requestSession(Object helper) { calls.add("request session " + helper); }
            @Override public void abandonPage(Object helper, Context context) { calls.add("abandon page " + helper); }
            @Override public void requestPage(Object helper, Context context) { calls.add("request page " + helper); }
        };
        feed = Robolectric.buildActivity(Activity.class).setup();
        FeedMute.install(feed.get());
    }

    @After public void tearDown() {
        FeedMute.resetForTests();
        Settings.FEED_MUTED.resetToDefault();
        SettingsStatus.feedMuteEnabled = wasEnabled;
        feed.pause().stop().destroy();
    }

    /**
     * Pausing the feed for the comments, or for a return, takes the sound from TikTok by asking
     * for focus. A muted feed has none to take, so the ask would only stop the music another
     * app is playing under it.
     */
    @Test public void pausingAMutedFeedLeavesOtherAppsSoundAlone() {
        Settings.FEED_MUTED.save(true);
        FeedMute.onControllerPlay(new Controller(feed.get()), video("111"));
        FeedMute.onEnginePlay(engine("A", "111"));
        assertTrue(FeedMute.isHoldingFocus());
        var audio = org.robolectric.Shadows.shadowOf((android.media.AudioManager)
                RuntimeEnvironment.getApplication().getSystemService(Context.AUDIO_SERVICE));
        try {
            PausePlayback.quietenForTests();
            assertNull("a muted feed asked for the focus", audio.getLastAudioFocusRequest());
            assertFalse(PausePlayback.quietenedForTests());

            FeedMute.setMuted(false);
            PausePlayback.quietenForTests();
            assertNotNull("with sound the feed must still be quietened",
                    audio.getLastAudioFocusRequest());
        } finally {
            PausePlayback.resetForTests();
        }
    }

    @Test public void aFeedVideoPlaysSilentWhileMutedAndGetsItsSoundBack() {
        Settings.FEED_MUTED.save(true);
        Object engine = engine("A", "101");
        FeedMute.onControllerPlay(new Controller(feed.get()), video("101"));
        FeedMute.onEnginePlay(engine);
        assertEquals(List.of("A mute"), calls);

        // The next video comes on a fresh engine, which starts with sound.
        Object next = engine("B", "102");
        FeedMute.onControllerPlay(new Controller(feed.get()), video("102"));
        FeedMute.onEnginePlay(next);
        assertEquals(List.of("A mute", "B mute"), calls);

        calls.clear();
        FeedMute.setMuted(false);
        assertEquals("unmute gives both engines TikTok's own state back", 2, calls.size());
        assertTrue(calls.contains("A sound"));
        assertTrue(calls.contains("B sound"));
        calls.clear();
        FeedMute.onEnginePlay(engine);
        assertEquals("an unmuted feed engine is left alone", List.of(), calls);
    }

    /**
     * Mute switched on from the settings page, with the feed behind it, gives the focus back when
     * the feed returns (S22, 2026-09-28: another app's music stayed paused on the muted feed).
     */
    @Test public void muteFromSettingsGivesTheFocusBackOnReturn() {
        FeedMute.onControllerPlay(new Controller(feed.get()), video("401"));
        FeedMute.onEnginePlay(engine("A", "401"));
        FeedMute.holdSessionFocus("session");
        FeedMute.holdPageFocus("page");
        calls.clear();

        feed.pause();
        FeedMute.setMuted(true);
        assertFalse("focus was touched with the feed away", calls.contains("abandon session session"));

        feed.resume();
        assertTrue(calls.toString(), calls.contains("abandon session session"));
        assertTrue(calls.toString(), calls.contains("abandon page page"));
    }

    /**
     * Sound turned back on while the video is paused asks for the focus when the feed next plays,
     * the resumed video or the next one (S22, 2026-09-28: it played over another app's music).
     */
    @Test public void soundOnWhilePausedAsksForTheFocusWhenTheFeedPlays() {
        Settings.FEED_MUTED.save(true);
        Object engine = engine("A", "501");
        FeedMute.onControllerPlay(new Controller(feed.get()), video("501"));
        FeedMute.onEnginePlay(engine);
        FeedMute.holdSessionFocus("session");
        FeedMute.holdPageFocus("page");
        calls.clear();

        // Nothing is playing (the test has no player to ask), so nothing is asked for yet.
        FeedMute.setMuted(false);
        org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();
        assertFalse(calls.toString(), calls.contains("request session session"));

        FeedMute.onEnginePlay(engine);
        org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();
        assertTrue(calls.toString(), calls.contains("request session session"));
        assertTrue(calls.toString(), calls.contains("request page page"));

        // Once: the next play asks for nothing more.
        calls.clear();
        FeedMute.onEnginePlay(engine);
        org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();
        assertFalse(calls.toString(), calls.contains("request session session"));
    }

    /** The button stays off a story or a LIVE replay, which keep their sound whatever it says. */
    @Test public void theButtonAppliesOnlyToVideosTheMuteGoverns() {
        FeedMute.onControllerPlay(new Controller(feed.get()), video("601"));
        FeedMute.onControllerPlay(new Controller(feed.get()), aweme("602", 0, true, 0));
        assertTrue(FeedMute.appliesTo("601"));
        assertFalse("a story kept the mute button", FeedMute.appliesTo("602"));
        assertTrue("an unknown video lost the button", FeedMute.appliesTo("never-played"));
    }

    /**
     * A video opened from a profile, a hashtag or a sound plays in the detail pager, which draws
     * the mute button too. What the button says has to hold there.
     */
    @Test public void aDetailPagerVideoFollowsTheMuteButton() {
        Settings.FEED_MUTED.save(true);
        ActivityController<com.ss.android.ugc.aweme.detail.ui.DetailActivity> pager =
                Robolectric.buildActivity(com.ss.android.ugc.aweme.detail.ui.DetailActivity.class).setup();
        try {
            Object engine = engine("pager", "301");
            FeedMute.onControllerPlay(new Controller(pager.get()), video("301"));
            FeedMute.onEnginePlay(engine);
            assertEquals(List.of("pager mute"), calls);
            assertTrue(FeedMute.isHoldingFocus());

            calls.clear();
            FeedMute.setMuted(false);
            assertEquals(List.of("pager sound"), calls);
        } finally {
            pager.pause().stop().destroy();
        }
    }

    @Test public void videosTheFeedDidNotAskForKeepTheirSound() {
        Settings.FEED_MUTED.save(true);
        // A DM chat's video: no feed controller asked for it.
        FeedMute.onEnginePlay(engine("dm", "201"));
        // A post opened from a DM plays on another screen.
        ActivityController<OtherScreen> other = Robolectric.buildActivity(OtherScreen.class).setup();
        FeedMute.onControllerPlay(new Controller(other.get()), video("202"));
        FeedMute.onEnginePlay(engine("detail", "202"));
        // Stories and a LIVE on the feed's own screen. A story is told by its flag or, shared
        // into the feed, by its type alone.
        FeedMute.onControllerPlay(new Controller(feed.get()), aweme("203", 0, true, 0));
        FeedMute.onEnginePlay(engine("story", "203"));
        FeedMute.onControllerPlay(new Controller(feed.get()), aweme("205", 45, false, 0));
        FeedMute.onEnginePlay(engine("shared story", "205"));
        FeedMute.onControllerPlay(new Controller(feed.get()), live("204"));
        FeedMute.onEnginePlay(engine("live", "204"));
        assertEquals(List.of(), calls);
        other.pause().stop().destroy();
    }

    @Test public void anEngineReusedForAnotherVideoGetsItsSoundBack() {
        Settings.FEED_MUTED.save(true);
        Object engine = engine("A", "301");
        FeedMute.onControllerPlay(new Controller(feed.get()), video("301"));
        FeedMute.onEnginePlay(engine);
        ids.put(engine, "302");
        FeedMute.onEnginePlay(engine);
        assertEquals(List.of("A mute", "A sound"), calls);
    }

    @Test public void aVideoSeenInTheFeedKeepsSoundWhenOpenedFromAnotherScreen() {
        Settings.FEED_MUTED.save(true);
        FeedMute.onControllerPlay(new Controller(feed.get()), video("305"));
        feed.pause();
        FeedMute.onEnginePlay(engine("dm", "305"));
        assertEquals("a remembered video id alone cannot mute another screen", List.of(), calls);
    }

    @Test public void unmuteWaitsForAnEarlierPlayerMuteToFinish() throws Exception {
        Settings.FEED_MUTED.save(true);
        Object engine = engine("A", "310");
        FeedMute.onControllerPlay(new Controller(feed.get()), video("310"));
        muteEntered = new CountDownLatch(1);
        releaseMute = new CountDownLatch(1);
        CountDownLatch unmuteDone = new CountDownLatch(1);
        Thread player = new Thread(() -> FeedMute.onEnginePlay(engine));
        player.start();
        assertTrue(muteEntered.await(5, TimeUnit.SECONDS));
        Thread toggle = new Thread(() -> {
            Settings.FEED_MUTED.save(false);
            FeedMute.refresh();
            unmuteDone.countDown();
        });
        toggle.start();
        try {
            assertFalse("an older player mute must finish before unmute", unmuteDone.await(200, TimeUnit.MILLISECONDS));
        } finally {
            releaseMute.countDown();
        }
        player.join(5000);
        toggle.join(5000);
        assertFalse(player.isAlive());
        assertFalse(toggle.isAlive());
        assertFalse("the engine stays audible after the toggle", engineMuted.get());
    }

    @Test public void focusIsTurnedDownOnlyForAMutedFeedInFront() throws Exception {
        Object session = "S";
        FeedMute.onControllerPlay(new Controller(feed.get()), video("401"));
        assertFalse("unmuted, the request goes through", FeedMute.holdSessionFocus(session));
        Settings.FEED_MUTED.save(true);
        assertTrue(FeedMute.holdSessionFocus(session));
        assertTrue(FeedMute.holdPageFocus("P"));
        assertTrue("the daily hold stops waiting for a grant", FeedMute.isHoldingFocus());

        // TikTok asks from its own threads.
        AtomicBoolean offMain = new AtomicBoolean();
        Thread worker = new Thread(() -> offMain.set(FeedMute.holdSessionFocus(session)));
        worker.start();
        worker.join();
        assertTrue(offMain.get());

        FeedMute.onControllerPlay(new Controller(feed.get()), story("402"));
        assertFalse("a story on the feed's screen takes the focus", FeedMute.holdSessionFocus(session));
        FeedMute.onControllerPlay(new Controller(feed.get()), video("403"));
        feed.pause();
        assertFalse("another screen in front takes the focus", FeedMute.holdPageFocus("P"));
        feed.resume();
        assertTrue(FeedMute.holdPageFocus("P"));
    }

    @Test public void mutingMidVideoGivesUpTheFocusTheFeedHeld() {
        Object engine = engine("A", "501");
        FeedMute.onControllerPlay(new Controller(feed.get()), video("501"));
        FeedMute.onEnginePlay(engine);
        assertFalse(FeedMute.holdSessionFocus("S"));
        assertFalse(FeedMute.holdPageFocus("P"));
        assertEquals("nothing touched before the mute", List.of(), calls);

        FeedMute.setMuted(true);
        assertEquals(List.of("A mute", "abandon session S", "abandon page P"), calls);
        assertTrue(Settings.FEED_MUTED.get());
    }

    @Test public void withoutThePatchNothingIsTouched() {
        SettingsStatus.feedMuteEnabled = false;
        Settings.FEED_MUTED.save(true);
        FeedMute.onControllerPlay(new Controller(feed.get()), video("601"));
        FeedMute.onEnginePlay(engine("A", "601"));
        assertFalse(FeedMute.holdSessionFocus("S"));
        assertEquals(List.of(), calls);
    }

    private Object engine(String name, String id) {
        Object engine = new Object() {
            @Override public String toString() {
                return name;
            }
        };
        ids.put(engine, id);
        return engine;
    }

    private static String name(Object engine) {
        return engine.toString();
    }

    private static Aweme video(String id) {
        return aweme(id, 0, false, 0);
    }

    private static Aweme story(String id) {
        return aweme(id, 40, true, 0);
    }

    private static Aweme live(String id) {
        return aweme(id, 0, false, 7);
    }

    private static Aweme aweme(String id, int type, boolean story, long liveId) {
        return new Aweme() {
            @Override public String getAid() { return id; }
            @Override public int getAwemeType() { return type; }
            @Override public boolean getIsTikTokStory() { return story; }
            @Override public long getLiveId() { return liveId; }
            @Override public boolean isLiveReplay() { return false; }
            @Override public String getLiveType() { return null; }
        };
    }
}
