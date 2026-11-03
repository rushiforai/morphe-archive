package app.morphe.extension.pinedrama.playback;

import static org.junit.Assert.assertEquals;

import android.app.Activity;
import android.content.Context;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.settings.PausedProcess;
import app.morphe.extension.pinedrama.settings.Settings;
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
        // Installed from the feed's onCreate, as the patch does, so its start is seen.
        feed = Robolectric.buildActivity(Activity.class).create();
        FeedMute.install(feed.get());
        feed.start().postCreate(null).resume().visible();
    }

    @After public void tearDown() {
        FeedMute.resetForTests();
        Settings.FEED_MUTED.resetToDefault();
        Settings.FEED_MUTE_BUTTON.resetToDefault();
        Settings.FOCUS_WAITS_FOR_VIDEO.resetToDefault();
        feed.pause().stop().destroy();
    }

    /**
     * Under Pause every switch reads off. The report keeps the reader's choices and says the
     * pause is why the feed has its sound, rather than calling the button turned off.
     */
    @Test public void aPausedReportKeepsTheChoicesAndSaysItIsPaused() {
        Settings.FEED_MUTED.save(true);
        Settings.FEED_MUTE_BUTTON.save(true);
        PausedProcess.set(true);
        try {
            assertEquals(List.of("Mute feed videos: on",
                    "HushPine is paused, so the feed plays with its sound",
                    "Mute button on the feed: shown",
                    "Other apps play until a video starts: off",
                    "Feed players muted since PineDrama started: 0", "Audio focus requests turned down: 0"),
                    FeedMute.Report.INSTANCE.lines());
        } finally {
            PausedProcess.set(false);
        }
    }

    /** The last call made on the named engine. */
    private String lastFor(String name) {
        String last = null;
        for (String call : calls) if (call.startsWith(name + " ")) last = call;
        return last;
    }

    private static void idleMain() {
        org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();
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
