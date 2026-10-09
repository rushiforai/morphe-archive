package app.spicetify.extension.spotify.extensions;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNotSame;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;
import static org.robolectric.Shadows.shadowOf;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import app.spicetify.extension.spotify.extensions.PlayerBridgeTest.FakeRequest;
import app.spicetify.extension.spotify.extensions.PlayerBridgeTest.FakeRouter;
import app.spicetify.extension.spotify.settings.InstalledPatches;
import app.spicetify.extension.spotify.settings.PatchSettings;
import app.spicetify.extension.spotify.settings.SpotifySheet;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;
import org.robolectric.shadows.ShadowDialog;
import org.robolectric.shadows.ShadowLog;
import org.robolectric.shadows.ShadowToast;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 35, manifest = Config.NONE, shadows = HomeChipsTest.WithExtensions.class)
public class HomeChipsTest {
    private static final String TOKEN = "sp://auth/v2/token?renew=0";
    private static final String ALL = "sp://esperanto/spotify.your_library_esperanto.proto.YourLibraryService/All";

    private final Context context = RuntimeEnvironment.getApplication();
    private final FakeRouter router = new FakeRouter();

    /** Spotify patched with the extensions patch. */
    @Implements(value = InstalledPatches.class, isInAndroidSdk = false)
    public static class WithExtensions {
        @Implementation
        public static boolean extensions() {
            return true;
        }
    }

    @Before
    public void setUp() {
        // Spotify's onCreate, before any Activity starts: with the extensions patch, it starts the tracker.
        PatchSettings.initialize(context);
        Extensions.setAppContext(context);
        PlayerBridge.attach(router);
        Extensions.setOn(context, Extensions.RANDOM_SONG, false);
        // The status map outlives a test, so no test may pass on the line the last one left.
        Extensions.status(Extensions.RANDOM_SONG, "not run");
    }

    @After
    public void tearDown() {
        Extensions.setOn(context, Extensions.RANDOM_SONG, false);
    }

    // ---- The pill (hook A) ----

    @Test
    public void onThePillGoesRightAfterTheFirstChipInANewListAndTheChipsAreLeftAlone() {
        Extensions.setOn(context, Extensions.RANDOM_SONG, true);
        List<String> chips = Arrays.asList("All", "Music", "Podcasts");

        List<?> withPill = HomeChips.chips(chips, "Random");

        assertEquals(Arrays.asList("All", "Random", "Music", "Podcasts"), withPill);
        assertNotSame(chips, withPill);
        assertEquals(Arrays.asList("All", "Music", "Podcasts"), chips);
    }

    @Test
    public void withTwoChipsThePillIsNeitherFirstNorLast() {
        Extensions.setOn(context, Extensions.RANDOM_SONG, true);

        assertEquals(Arrays.asList("All", "Random", "Music"), HomeChips.chips(Arrays.asList("All", "Music"), "Random"));
    }

    @Test
    public void fewerThanTwoChipsGetNoPill() {
        Extensions.setOn(context, Extensions.RANDOM_SONG, true);
        List<String> all = Collections.singletonList("All");
        List<String> none = Collections.emptyList();

        // Home selects the first chip when nothing is selected, so a pill there would become the feed.
        assertSame(all, HomeChips.chips(all, "Random"));
        assertSame(none, HomeChips.chips(none, "Random"));
    }

    @Test
    public void offTheChipsComeBackAsTheyWere() {
        List<String> chips = Arrays.asList("All", "Music", "Podcasts");

        assertSame(chips, HomeChips.chips(chips, "Random"));
    }

    @Test
    public void chipsThatCantBeCopiedComeBackAsTheyWere() {
        Extensions.setOn(context, Extensions.RANDOM_SONG, true);
        List<String> unreadable = new AbstractList<String>() {
            @Override
            public String get(int index) {
                throw new IllegalStateException("a chip can't be read");
            }

            @Override
            public int size() {
                return 3;
            }
        };

        assertSame(unreadable, HomeChips.chips(unreadable, "Random"));
    }

    // ---- A tap (hook B) and the chooser ----

    @Test
    public void onlyThePillsTapIsTakenAndItsChooserOpensOnTheResumedActivity() {
        Activity home = Robolectric.buildActivity(Activity.class).setup().get();

        assertFalse("another chip's tap is Home's", HomeChips.onTap("client-native:default"));
        assertFalse(HomeChips.onTap(null));
        assertTrue(HomeChips.onTap(HomeChips.PILL_ID));
        assertNull("the chooser is posted, so the tap returns at once", ShadowDialog.getLatestDialog());

        shadowOf(Looper.getMainLooper()).idle();

        Dialog chooser = ShadowDialog.getLatestDialog();
        assertTrue("Spicetify's own sheet: " + chooser, chooser instanceof SpotifySheet);
        assertTrue(chooser.isShowing());
        assertSame(home, chooser.getOwnerActivity());
        assertEquals(Arrays.asList("Play a random song", "From Spotify", "From your library", "Cancel"), texts(chooser));
        assertEquals("one chooser, for the pill's tap only", 1, ShadowDialog.getShownDialogs().size());
    }

    @Test
    public void theChoosersButtonsStartTheirRunsAndCloseIt() throws Exception {
        Robolectric.buildActivity(Activity.class).setup();

        Dialog fromSpotify = choose("From Spotify");
        assertFalse(fromSpotify.isShowing());
        endWith(TOKEN, "from Spotify");
        Dialog fromLibrary = choose("From your library");
        assertFalse(fromLibrary.isShowing());
        endWith(ALL, "from your library");
    }

    @Test
    public void cancelClosesTheChooserAndStartsNothing() throws Exception {
        Robolectric.buildActivity(Activity.class).setup();

        Dialog chooser = choose("Cancel");

        assertFalse(chooser.isShowing());
        PlayerBridgeTest.onBridge(() -> null); // a run would have posted its first step by now
        assertTrue(router.requests.isEmpty());
    }

    @Test
    public void aTapWithNoResumedActivityAsksToOpenHomeAgain() {
        assertTrue("still the pill's tap", HomeChips.onTap(HomeChips.PILL_ID));
        shadowOf(Looper.getMainLooper()).idle();

        assertEquals("Open Home again and retry", ShadowToast.getTextOfLatestToast());
        assertNull(ShadowDialog.getLatestDialog());
    }

    @Test
    public void aChooserThatCantBeShownThrowsNothingIntoSpotify() {
        ActivityController<GoneActivity> home = Robolectric.buildActivity(GoneActivity.class).setup();
        home.get().gone = true;
        assertSame(home.get(), ActivityTracker.resumed());

        assertTrue(HomeChips.onTap(HomeChips.PILL_ID));
        shadowOf(Looper.getMainLooper()).idle(); // rethrows anything the posted chooser throws

        assertNull(ShadowDialog.getLatestDialog());
        assertNull("no Toast either, since there was an Activity", ShadowToast.getTextOfLatestToast());
        assertTrue(ShadowLog.getLogsForTag("Spicetify").stream().anyMatch(log ->
                log.msg.equals("Couldn't show the Random chooser") && log.throwable.getMessage().equals("the window is gone")));
    }

    // ---- The Activity tracker ----

    @Test
    public void spotifysStartupTracksTheResumedActivityUntilItPauses() {
        assertNull("nothing before an Activity resumes", ActivityTracker.resumed());
        ActivityController<Activity> home = Robolectric.buildActivity(Activity.class).setup();
        assertSame(home.get(), ActivityTracker.resumed());

        home.pause();
        assertNull(ActivityTracker.resumed());

        home.resume();
        assertSame(home.get(), ActivityTracker.resumed());
    }

    @Test
    public void anotherActivitysPauseLeavesTheResumedOne() {
        // In split screen, two Activities can be resumed at once and pause in either order.
        ActivityController<Activity> first = Robolectric.buildActivity(Activity.class).setup();
        ActivityController<Activity> second = Robolectric.buildActivity(Activity.class).setup();
        assertSame(second.get(), ActivityTracker.resumed());

        first.pause();

        assertSame(second.get(), ActivityTracker.resumed());
    }

    // ---- Helpers ----

    /** Taps the pill, then the chooser's button {@code label}, and returns the chooser. */
    private static Dialog choose(String label) {
        assertTrue(HomeChips.onTap(HomeChips.PILL_ID));
        shadowOf(Looper.getMainLooper()).idle();
        Dialog chooser = ShadowDialog.getLatestDialog();
        View button = withText(chooser.getWindow().getDecorView(), label);
        assertNotNull("no " + label + " in " + texts(chooser), button);
        assertTrue(button.performClick());
        shadowOf(Looper.getMainLooper()).idle();
        return chooser;
    }

    /** The run's first request is {@code uri}; failing it ends the run with a status that says so. */
    private void endWith(String uri, String reason) throws InterruptedException {
        FakeRequest request = router.next();
        assertEquals(uri, request.uri);
        request.callback.onError(new IllegalStateException(reason));
        RandomSongTest.awaitStatus("Couldn't find a random song: java.lang.IllegalStateException: " + reason);
    }

    /** Every text in {@code dialog}, in view order. */
    private static List<String> texts(Dialog dialog) {
        List<String> texts = new ArrayList<>();
        collect(dialog.getWindow().getDecorView(), texts);
        return texts;
    }

    private static void collect(View view, List<String> texts) {
        if (view instanceof TextView) texts.add(((TextView) view).getText().toString());
        if (view instanceof ViewGroup) {
            for (int i = 0; i < ((ViewGroup) view).getChildCount(); i++) collect(((ViewGroup) view).getChildAt(i), texts);
        }
    }

    private static View withText(View view, String text) {
        if (view instanceof TextView && text.contentEquals(((TextView) view).getText())) return view;
        if (view instanceof ViewGroup) {
            for (int i = 0; i < ((ViewGroup) view).getChildCount(); i++) {
                View found = withText(((ViewGroup) view).getChildAt(i), text);
                if (found != null) return found;
            }
        }
        return null;
    }

    /** An Activity whose window goes away while it's still the resumed one, so no dialog can be shown on it. */
    public static class GoneActivity extends Activity {
        boolean gone;

        @Override
        public Object getSystemService(String name) {
            if (gone && WINDOW_SERVICE.equals(name)) throw new IllegalStateException("the window is gone");
            return super.getSystemService(name);
        }
    }
}
