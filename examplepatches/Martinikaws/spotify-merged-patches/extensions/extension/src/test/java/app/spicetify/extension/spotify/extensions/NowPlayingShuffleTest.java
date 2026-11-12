package app.spicetify.extension.spotify.extensions;

import static app.spicetify.extension.spotify.extensions.PlayerBridgeTest.onBridge;
import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.SharedPreferences;
import android.view.View;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.FrameLayout;
import android.widget.ImageButton;
import app.spicetify.extension.spotify.extensions.PlayerBridgeTest.FakeRequest;
import app.spicetify.extension.spotify.extensions.PlayerBridgeTest.FakeRouter;
import java.util.concurrent.atomic.AtomicInteger;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 35, manifest = Config.NONE)
public class NowPlayingShuffleTest {
    private static final String GET_STATE = "sp://esperanto/spotify.player.esperanto.proto.ContextPlayer/GetState";
    private static final String PLAY = "sp://esperanto/spotify.player.esperanto.proto.ContextPlayer/Play";
    private static final String PLAYLIST_GET =
            "sp://esperanto/spotify.playlist_esperanto.proto.PlaylistDataService/Get";
    private static final String PLAYLIST = "spotify:playlist:p";

    private final Context context = RuntimeEnvironment.getApplication();
    private final FakeRouter router = new FakeRouter();

    @Before
    public void setUp() {
        Extensions.setAppContext(context);
        PlayerBridge.attach(router);
        // The status outlives a test, so no test may pass on the line the last one left.
        Extensions.status(Extensions.SHUFFLE_PLUS, "not run");
    }

    @After
    public void tearDown() {
        // Off removes each switch listener, which would otherwise keep a stream open into the next test.
        Extensions.setOn(context, Extensions.SHUFFLE_PLUS, false);
        Extensions.setOn(context, Extensions.TRASH_BIN, false);
    }

    @Test
    public void onALongPressShufflesWhatsPlayingAndTakesThePressFromTheTap() throws Exception {
        ImageButton button = nowPlayingButton(context); // built while Shuffle+ is still off
        Extensions.setOn(context, Extensions.SHUFFLE_PLUS, true);
        FakeRequest stream = router.next();
        assertEquals("SUB", stream.action);
        assertEquals(GET_STATE, stream.uri);
        stream.callback.onResponse(200, ShufflePlusTest.state(PLAYLIST));

        assertTrue("true skips the tap and gives the haptic feedback", button.performLongClick());

        FakeRequest get = router.next();
        assertEquals(PLAYLIST_GET, get.uri);
        assertArrayEquals(Esperanto.playlistGet(PLAYLIST, 0, 500), get.body);
        assertEquals("the press only posts the run", "Spicetify player bridge", get.thread);
        get.callback.onResponse(200, RandomSongTest.playlistPage(2, "spotify:track:a", "spotify:track:b"));
        FakeRequest play = router.next();
        assertEquals(PLAY, play.uri);
        play.callback.onResponse(200, new byte[0]);
        ShufflePlusTest.awaitStatus("Shuffled 2 songs");
    }

    @Test
    public void offALongPressIsLeftToTheTapAndListsNothing() throws Exception {
        // Trash Bin's stream says a playlist is playing, so a Shuffle+ run would list it.
        Extensions.setOn(context, Extensions.TRASH_BIN, true);
        router.next().callback.onResponse(200, ShufflePlusTest.state(PLAYLIST));

        assertFalse("false lets the press end as a tap", nowPlayingButton(context).performLongClick());

        onBridge(() -> null); // runs after anything the press posted
        assertEquals("only Trash Bin's stream", 1, router.requests.size());
    }

    @Test
    public void aLongPressThatThrowsIsLeftToTheTap() {
        assertFalse(nowPlayingButton(broken()).performLongClick());
    }

    @Test
    public void aButtonThatCantTakeTheListenerThrowsNothingIntoSpotify() {
        NowPlayingShuffle.onButton(null);
    }

    @Test
    public void talkBackIsOfferedTheLongPressOnlyWhileShufflePlusIsOnAndHearsItsName() {
        // In a window, as in Now Playing: a view that isn't attached describes no actions at all.
        Activity nowPlaying = Robolectric.buildActivity(Activity.class).setup().get();
        ImageButton button = nowPlayingButton(nowPlaying); // built while Shuffle+ is still off
        button.setContentDescription("Shuffle");
        nowPlaying.setContentView((View) button.getParent());

        AccessibilityNodeInfo off = button.createAccessibilityNodeInfo();
        assertNull("no long-press while Shuffle+ is off", longClick(off));
        assertFalse(off.isLongClickable());

        Extensions.setOn(context, Extensions.SHUFFLE_PLUS, true);
        AccessibilityNodeInfo on = button.createAccessibilityNodeInfo();
        assertNotNull("a long-press once Shuffle+ is on", longClick(on));
        assertEquals("Shuffle+", String.valueOf(longClick(on).getLabel()));
        assertTrue(on.isLongClickable());
        assertEquals("Spotify's own description stays", "Shuffle", String.valueOf(on.getContentDescription()));
    }

    @Test
    public void describingTheButtonWhenTheSwitchCantBeReadThrowsNothingIntoSpotify() {
        assertNotNull(nowPlayingButton(broken()).createAccessibilityNodeInfo());
    }

    @Test
    public void spotifysClickListenerStillTakesTheTap() {
        ImageButton button = new ImageButton(context);
        AtomicInteger taps = new AtomicInteger();
        button.setOnClickListener(v -> taps.incrementAndGet());

        NowPlayingShuffle.onButton(button);

        button.performClick();
        assertEquals(1, taps.get());
    }

    @Test
    public void onATapTogglesBetweenShufflePlusAndStandardPresetOrderSkippingSpotifysShuffle() throws Exception {
        ImageButton button = new ImageButton(context);
        AtomicInteger spotifyTaps = new AtomicInteger();
        NowPlayingShuffle.onButton(button);
        // Spotify attaches its click listener in Lp/aes;->c after the constructor hook N1.
        button.setOnClickListener(v -> spotifyTaps.incrementAndGet());
        NowPlayingShuffle.ensureClickWrapped(button);

        Extensions.setOn(context, Extensions.SHUFFLE_PLUS, true);
        FakeRequest stream = router.next();
        assertEquals("SUB", stream.action);
        assertEquals(GET_STATE, stream.uri);
        stream.callback.onResponse(200, ShufflePlusTest.state(PLAYLIST, "spotify:track:b", "uid-b"));

        // First tap: runs Shuffle+ (true Fisher-Yates shuffle) and does not call Spotify's listener.
        button.performClick();
        assertEquals("Spotify's smart/mixed shuffle listener is skipped", 0, spotifyTaps.get());

        FakeRequest firstGet = router.next();
        assertEquals(PLAYLIST_GET, firstGet.uri);
        firstGet.callback.onResponse(200, RandomSongTest.playlistPage(2, "spotify:track:a", "spotify:track:b"));
        FakeRequest firstPlay = router.next();
        assertEquals(PLAY, firstPlay.uri);
        firstPlay.callback.onResponse(200, new byte[0]);
        ShufflePlusTest.awaitStatus("Shuffled 2 songs");
        assertTrue(ShufflePlus.isShuffled());

        // Second tap on the same playlist: switches to standard preset order (no mixing) starting at current track.
        button.performClick();
        assertEquals(0, spotifyTaps.get());

        FakeRequest secondGet = router.next();
        assertEquals(PLAYLIST_GET, secondGet.uri);
        secondGet.callback.onResponse(200, RandomSongTest.playlistPage(2, "spotify:track:a", "spotify:track:b"));
        FakeRequest secondPlay = router.next();
        assertEquals(PLAY, secondPlay.uri);
        assertArrayEquals("plays in exact preset order starting at current song index 1",
                Esperanto.playOrder(PLAYLIST, java.util.Arrays.asList("spotify:track:a", "spotify:track:b"), 1),
                secondPlay.body);
        secondPlay.callback.onResponse(200, new byte[0]);
        ShufflePlusTest.awaitStatus("Preset order (2 songs)");
        assertFalse(ShufflePlus.isShuffled());
    }

    /** The node's long-click action, or null when it has none. */
    private static AccessibilityNodeInfo.AccessibilityAction longClick(AccessibilityNodeInfo info) {
        for (AccessibilityNodeInfo.AccessibilityAction action : info.getActionList()) {
            if (action.getId() == AccessibilityNodeInfo.ACTION_LONG_CLICK) return action;
        }
        return null;
    }

    /** A context whose switches can't be read. */
    private Context broken() {
        return new ContextWrapper(context) {
            @Override
            public Context getApplicationContext() {
                return this;
            }

            @Override
            public SharedPreferences getSharedPreferences(String name, int mode) {
                throw new IllegalStateException("the switch can't be read");
            }
        };
    }

    /**
     * The shuffle button after hook N1, in a parent as in Now Playing, since a long-press nothing
     * takes asks the parent for a context menu.
     */
    private static ImageButton nowPlayingButton(Context context) {
        ImageButton button = new ImageButton(context);
        new FrameLayout(context).addView(button);
        NowPlayingShuffle.onButton(button);
        return button;
    }
}
