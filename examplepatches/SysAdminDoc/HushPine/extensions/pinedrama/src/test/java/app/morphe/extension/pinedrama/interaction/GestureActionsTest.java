package app.morphe.extension.pinedrama.interaction;

import static org.junit.Assert.*;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.os.SystemClock;
import android.preference.PreferenceActivity;
import android.preference.PreferenceScreen;
import android.view.MotionEvent;
import android.widget.FrameLayout;
import app.morphe.extension.pinedrama.SettingsContextRule;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.pinedrama.settings.Settings;
import app.morphe.extension.pinedrama.settings.SettingsStatus;
import app.morphe.extension.pinedrama.settings.preference.ChoicePreference;
import org.junit.Rule;
import org.junit.Test;
import org.junit.After;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class GestureActionsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();
    @After public void tearDown() {
        GestureActions.forgetDoubleTaps();
        SettingsStatus.sensitiveWarningsEnabled = false;
    }
    public static final class TestActivity extends PreferenceActivity {
        @Override public void onCreate(android.os.Bundle state) {
            setTheme(android.R.style.Theme_Material_NoActionBar);
            super.onCreate(state);
        }
    }
    public static final class Params {
        public final Clip aweme;
        Params(String id) { aweme = new Clip(id); }
        Params(Clip clip) { aweme = clip; }
    }
    public static final class Clip {
        public final String aid;
        public final String shareUrl;
        public final SoundStub music;
        Clip(String id) { this(id, null, null); }
        Clip(String id, String shareUrl, SoundStub music) {
            aid = id;
            this.shareUrl = shareUrl;
            this.music = music;
        }
    }

    /** A press at {@code x} across the screen, which is what decides the seek zone. */
    private static MotionEvent press(float x) {
        return MotionEvent.obtain(0L, 0L, MotionEvent.ACTION_DOWN, x, 10f, 0);
    }

    private static MotionEvent middleOf(android.app.Activity activity) {
        return press(activity.getResources().getDisplayMetrics().widthPixels / 2f);
    }

    /** Native seek(float) takes a percentage; 0pTR converts it to integer engine milliseconds. */
    public static final class FakePlayer {
        public final int durationMs = 30_000;
        public float sought = Float.NaN;
        public void seek(float percentage) { sought = (int) (percentage * 0.01d * durationMs); }
    }

    /** Stands in for PlayerController, whose getPlayerManager() kept its name. */
    public static final class FakeController {
        public final FakePlayer player = new FakePlayer();
        public FakePlayer getPlayerManager() { return player; }
    }

    /** A controller whose shape changed out from under us. */
    public static final class ShapelessController {
    }

    private static java.util.List<String> entryValues(PreferenceScreen screen, String key) {
        java.util.List<String> values = new java.util.ArrayList<>();
        for (CharSequence value : ((ChoicePreference) screen.findPreference(key)).getEntryValues()) {
            values.add(value.toString());
        }
        return values;
    }

    private static MotionEvent down(long downTime, float x) {
        return MotionEvent.obtain(downTime, downTime, MotionEvent.ACTION_DOWN, x, 10f, 0);
    }

    /** PineDrama's own like keeps PineDrama's behavior: its double tap doesn't take the long press. */
    @Test public void tikToksOwnDoubleTapLeavesTheLongPressAlone() {
        try (var controller = Robolectric.buildActivity(android.app.Activity.class).setup()) {
            var activity = controller.get();
            Utils.setContext(activity);
            Settings.EDGE_SEEK.save(false);
            Settings.LONG_PRESS_ACTION.save("default");
            Settings.DOUBLE_TAP_ACTION.save("default");
            float middle = activity.getResources().getDisplayMetrics().widthPixels / 2f;
            long second = SystemClock.uptimeMillis();

            assertFalse(GestureActions.onDoubleTap(down(second - 180, middle)));
            assertFalse(GestureActions.onLongPress(down(second, middle)));
            assertFalse(GestureActions.onLongPress(middle));
        } finally {
            Settings.DOUBLE_TAP_ACTION.resetToDefault();
            Settings.LONG_PRESS_ACTION.resetToDefault();
            Settings.EDGE_SEEK.resetToDefault();
        }
    }

    /**
     * #251: Open the search page is on both gestures and sends TikTok's own search link to
     * PineDrama itself, so it works with the feed's search button hidden.
     */
    @Test public void openSearchSendsTikToksSearchLinkFromEitherGesture() {
        try (var controller = Robolectric.buildActivity(android.app.Activity.class).setup().visible()) {
            var activity = controller.get();
            Utils.setContext(activity);
            Utils.setActivity(activity);
            activity.setContentView(new FrameLayout(activity));
            Settings.EDGE_SEEK.save(false);
            var shadow = org.robolectric.Shadows.shadowOf(activity);

            Settings.LONG_PRESS_ACTION.save("open_search");
            assertTrue(GestureActions.takesLongPress("open_search"));
            assertTrue(GestureActions.onLongPress(middleOf(activity)));
            org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();
            android.content.Intent pressed = shadow.getNextStartedActivity();
            assertNotNull("a long press opened nothing", pressed);
            assertEquals(android.content.Intent.ACTION_VIEW, pressed.getAction());
            assertEquals(GestureActions.SEARCH_PAGE_URI, String.valueOf(pressed.getData()));
            assertEquals("PineDrama's own router, never a browser", activity.getPackageName(), pressed.getPackage());
            assertTrue(String.valueOf(pressed.getData()).contains("enter_blank_page=1"));

            Settings.LONG_PRESS_ACTION.save("default");
            Settings.DOUBLE_TAP_ACTION.save("open_search");
            assertTrue(GestureActions.onDoubleTap());
            org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();
            android.content.Intent tapped = shadow.getNextStartedActivity();
            assertNotNull("a double tap opened nothing", tapped);
            assertEquals(GestureActions.SEARCH_PAGE_URI, String.valueOf(tapped.getData()));
        } finally {
            Settings.LONG_PRESS_ACTION.resetToDefault();
            Settings.DOUBLE_TAP_ACTION.resetToDefault();
            Settings.EDGE_SEEK.resetToDefault();
        }
    }

    @Test public void onlyTheOuterThirdsSeekAndOnlyWhenAskedTo() {
        try (var controller = Robolectric.buildActivity(android.app.Activity.class).setup().visible()) {
            var activity = controller.get();
            Utils.setContext(activity);
            int width = activity.getResources().getDisplayMetrics().widthPixels;
            assertTrue("the screen has a width to divide", width > 0);
            Settings.EDGE_SEEK_SECONDS.save(7);

            // Off: every zone leaves the Long press action to decide, edges included.
            Settings.EDGE_SEEK.save(false);
            for (float at : new float[]{0.02f, 0.2f, 0.5f, 0.8f, 0.98f}) {
                assertEquals(0, GestureActions.edgeSeekDelta(press(width * at)));
            }

            Settings.EDGE_SEEK.save(true);
            assertEquals(-7000L, GestureActions.edgeSeekDelta(press(0f)));
            assertEquals(-7000L, GestureActions.edgeSeekDelta(press(width * 0.3f)));
            assertEquals(7000L, GestureActions.edgeSeekDelta(press(width * 0.7f)));
            assertEquals(7000L, GestureActions.edgeSeekDelta(press(width - 1f)));

            // A value the dialog would never accept, which is how a restored backup can
            // arrive. The top of the dialog's range is what a press is worth.
            Settings.EDGE_SEEK_SECONDS.save(100000);
            assertEquals(-60_000L, GestureActions.edgeSeekDelta(press(0f)));
            assertEquals(60_000L, GestureActions.edgeSeekDelta(press(width - 1f)));
            Settings.EDGE_SEEK_SECONDS.save(-5);
            assertEquals(0, GestureActions.edgeSeekDelta(press(0f)));
            Settings.EDGE_SEEK_SECONDS.save(7);

            // The middle third keeps the Long press action.
            assertEquals(0, GestureActions.edgeSeekDelta(press(width / 2f)));
            assertEquals(0, GestureActions.edgeSeekDelta(press(width / 3f)));
            assertEquals(0, GestureActions.edgeSeekDelta(press(width * 2f / 3f)));

            // Both lines to the pixel, and the two zones are the same width.
            int third = width / 3;
            assertEquals(-7000L, GestureActions.edgeSeekDelta(press(third - 1)));
            assertEquals(0, GestureActions.edgeSeekDelta(press(third)));
            assertEquals(0, GestureActions.edgeSeekDelta(press(width - third - 1)));
            assertEquals(7000L, GestureActions.edgeSeekDelta(press(width - third)));

            // Side by side with another app, PineDrama's window does not start at the left of
            // the display, so the press across the window and the press across the display
            // are different numbers. The zones follow the window, which is what the video
            // fills. An event offset this way reports the two separately.
            MotionEvent offset = press(width + 20f);
            offset.offsetLocation(-width, 0f);
            assertEquals(width + 20f, offset.getRawX(), 0.5f);
            assertEquals(20f, offset.getX(), 0.5f);
            assertEquals(-7000L, GestureActions.edgeSeekDelta(offset));

            // Nothing to act on: no event, and a distance of zero.
            assertEquals(0, GestureActions.edgeSeekDelta(null));
            Settings.EDGE_SEEK_SECONDS.save(0);
            assertEquals(0, GestureActions.edgeSeekDelta(press(0f)));
        } finally {
            Settings.EDGE_SEEK.save(false);
            Settings.EDGE_SEEK_SECONDS.save(5);
        }
    }

    @Test public void copyingTheLinkPutsTheSanitisedAddressOnTheClipboard() {
        // The clipboard is somewhere the link goes, so it gets the same treatment a shared link
        // gets: PineDrama's own address carries the parameters that say who sent it.
        try (var controller = Robolectric.buildActivity(android.app.Activity.class).setup()) {
            Utils.setContext(controller.get());
            assertTrue(GestureActions.copyToClipboard("PineDrama link",
                    "https://www.tiktok.com/@someone/video/7712345"));

            android.content.ClipboardManager clipboard =
                    (android.content.ClipboardManager) controller.get()
                            .getSystemService(android.content.Context.CLIPBOARD_SERVICE);
            android.content.ClipData clip = clipboard.getPrimaryClip();
            assertNotNull("nothing reached the clipboard", clip);
            assertEquals("https://www.tiktok.com/@someone/video/7712345",
                    String.valueOf(clip.getItemAt(0).getText()));

            // Nothing to copy is not something to put on the clipboard.
            assertFalse(GestureActions.copyToClipboard("PineDrama link", null));
            assertFalse(GestureActions.copyToClipboard("PineDrama link", ""));
        }
    }

    public static final class SoundStub {
        private final String id;
        private final ShareInfoStub shareInfo;
        SoundStub(String id) { this(id, null); }
        /** A sound PineDrama hands a share URL for, which is the case that carries a query. */
        SoundStub(String id, String shareUrl) {
            this.id = id;
            this.shareInfo = shareUrl == null ? null : new ShareInfoStub(shareUrl);
        }
        public String getId() { return id; }
        public String getMid() { return id; }
        public ShareInfoStub getShareInfo() { return shareInfo; }
    }

    public static final class ShareInfoStub {
        private final String shareUrl;
        ShareInfoStub(String shareUrl) { this.shareUrl = shareUrl; }
        public String getShareUrl() { return shareUrl; }
    }

    /** Only what soundLink reads: a post whose music entry may or may not be there. */
    public static final class PostWithSound {
        private final SoundStub music;
        PostWithSound(SoundStub music) { this.music = music; }
        public SoundStub getMusic() { return music; }
    }

    @Test public void aCopiedLinkIsMarkedSensitiveLikeEveryOtherClipTheBundleWrites() {
        // These two actions built their own ClipData and were the only clips in the bundle
        // without the flag, so a clipboard viewer read them back with no warning.
        try (var controller = Robolectric.buildActivity(android.app.Activity.class).setup()) {
            var activity = controller.get();
            Utils.setContext(activity);
            assertTrue(GestureActions.copyToClipboard("PineDrama sound",
                    "https://www.tiktok.com/music/x-77"));

            ClipboardManager clipboard =
                    (ClipboardManager) activity.getSystemService(Context.CLIPBOARD_SERVICE);
            android.os.PersistableBundle extras =
                    clipboard.getPrimaryClip().getDescription().getExtras();
            assertNotNull("the clip carries no description extras at all", extras);
            assertTrue("the copied link was not marked sensitive",
                    extras.getBoolean("android.content.extra.IS_SENSITIVE"));
        }
    }

    @Test public void theSoundLinkIsThePageForThatSound() {
        // A post with only its own audio carries no sound entry, which is the ordinary case
        // rather than a failure, so the action has to say so instead of copying nothing.
        assertNull("a post with no sound produced a link", GestureActions.soundLink(new PostWithSound(null)));
        assertNull("no aweme produced a link", GestureActions.soundLink(null));

        String link = GestureActions.soundLink(new PostWithSound(new SoundStub("7712345678901234567")));
        assertNotNull("a post with a sound produced no link", link);
        assertTrue("the link is not a sound page: " + link,
                link.startsWith("https://www.tiktok.com/music/"));
        assertTrue("the link does not name the sound: " + link,
                link.endsWith("7712345678901234567"));
    }

    /** A double tap at {@code x}, {@code y}, with its own times so no earlier answer is reused. */
    private static MotionEvent tapAt(float x, float y, long downTime) {
        return MotionEvent.obtain(downTime, downTime, MotionEvent.ACTION_UP, x, y, 0);
    }

}
