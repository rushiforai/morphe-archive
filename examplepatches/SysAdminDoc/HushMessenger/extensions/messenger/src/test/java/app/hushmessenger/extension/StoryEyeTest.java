package app.hushmessenger.extension;

import android.app.Activity;
import android.app.Fragment;
import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.FrameLayout;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.LooperMode;
import org.robolectric.shadows.ShadowLooper;
import org.robolectric.shadows.ShadowToast;
import static org.junit.Assert.*;

/** #169: the Mark as seen button on stories that View stories anonymously holds back. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
@LooperMode(LooperMode.Mode.PAUSED)
public class StoryEyeTest {
    /** Messenger's story card, which compares by value. */
    static final class Card {
        final String id;

        Card(String id) { this.id = id; }

        @Override public boolean equals(Object other) { return other instanceof Card && ((Card) other).id.equals(id); }

        @Override public int hashCode() { return id.hashCode(); }

        @Override public String toString() { return id; }
    }

    /** One page of Messenger's story viewer: a fragment with its story's card. */
    @SuppressWarnings("deprecation")
    public static final class Page extends Fragment {
        Card card;
        String title = "a story";
    }

    /** Messenger's story viewer: a pager that keeps the pages beside the one on screen loaded. */
    static final class Viewer {
        final List<Page> pages = new ArrayList<>();
        int onScreen;

        /** Messenger's own way to the page on screen. */
        @SuppressWarnings("deprecation")
        static Fragment page(Viewer viewer) { return viewer.pages.isEmpty() ? null : viewer.pages.get(viewer.onScreen); }

        /** Puts the story on screen, as a swipe does, with a page for it if it has none. */
        Card show(Card card) {
            for (int index = 0; index < pages.size(); index++) {
                if (card.equals(pages.get(index).card)) {
                    onScreen = index;
                    return card;
                }
            }
            Page page = new Page();
            page.card = card;
            pages.add(page);
            onScreen = pages.size() - 1;
            return card;
        }
    }

    /** Messenger's story mark-read handler as the patch leaves it: the gate first, then the send it skips. */
    static final class StoryHandler {
        final List<String> sent = new ArrayList<>();

        void markRead(Card card, boolean flag) {
            if (Settings.holdStorySeen(this, card, flag ? 1 : 0)) return;
            sent.add(card + " " + flag);
        }
    }

    private Activity activity;

    @Before public void reset() {
        Context context = RuntimeEnvironment.getApplication();
        Settings.initialize(context);
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        Settings.hookErrors.clear();
        CrashGuard.resetForTests();
        CrashGuard.onProcessStart(context);
        clearEye();
    }

    @After public void clearEye() {
        StoryEye.held = null;
        StoryEye.shownEye = null;
        StoryEye.shownViewer = null;
        synchronized (StoryEye.heldCards) { StoryEye.heldCards.clear(); }
        synchronized (StoryEye.sent) { StoryEye.sent.clear(); }
        synchronized (StoryEye.pageMethods) { StoryEye.pageMethods.clear(); }
        synchronized (StoryEye.cardFields) { StoryEye.cardFields.clear(); }
    }

    private void on(boolean anonymous, boolean button) {
        Settings.preferences.edit().putBoolean(StoryEye.OWNER, anonymous).putBoolean(StoryEye.KEY, button).commit();
    }

    private Viewer viewer;

    /** A story viewer: onViewCreated runs on its view before the view joins a window, as a fragment's does. */
    private View openViewer() {
        viewer = new Viewer();
        return openViewer(viewer);
    }

    private View openViewer(Object storyViewer) {
        activity = Robolectric.buildActivity(Activity.class).setup().get();
        FrameLayout view = new FrameLayout(activity);
        StoryEye.viewerCreated(storyViewer, view);
        activity.setContentView(view);
        ShadowLooper.idleMainLooper();
        return view;
    }

    private StoryEye.Eye eye() {
        return activity.getWindow().getDecorView().findViewWithTag(StoryEye.VIEW_TAG);
    }

    /** The viewer's pager scrolled, as it does while a swipe moves to the next story. */
    private void scrolled() throws Exception {
        ViewTreeObserver observer = activity.getWindow().getDecorView().getViewTreeObserver();
        Method dispatch = ViewTreeObserver.class.getDeclaredMethod("dispatchOnScrollChanged");
        dispatch.setAccessible(true);
        dispatch.invoke(observer);
    }

    private static String lastToast() {
        ShadowLooper.idleMainLooper();
        return ShadowToast.getTextOfLatestToast();
    }

    @Test public void aTapSendsTheHeldSeenOnceThroughMessengersOwnHandler() {
        on(true, true);
        openViewer();
        StoryEye.Eye eye = eye();
        assertNotNull("the eye joins the viewer's window", eye);
        assertEquals("hidden until a story's seen is held back", View.GONE, eye.getVisibility());

        StoryHandler handler = new StoryHandler();
        Card first = viewer.show(new Card("card-1"));
        handler.markRead(first, true);
        assertTrue("opening the story sends nothing", handler.sent.isEmpty());
        assertEquals(View.VISIBLE, eye.getVisibility());
        assertFalse(eye.done);
        assertEquals("Mark as seen", eye.getContentDescription());

        assertTrue(eye.performClick());
        assertEquals("the tap replays the held send with Messenger's own flag", Arrays.asList("card-1 true"), handler.sent);
        assertEquals("Marked as seen", lastToast());
        assertTrue(eye.done);
        assertEquals("Marked as seen", eye.getContentDescription());

        eye.performClick();
        assertEquals("a second tap has nothing left to send", Arrays.asList("card-1 true"), handler.sent);
        assertEquals("Nothing to mark as seen", lastToast());

        // The replay ends with the tap, so the next story is held back again and its eye has the slash back.
        handler.markRead(viewer.show(new Card("card-2")), false);
        assertEquals(Arrays.asList("card-1 true"), handler.sent);
        assertFalse(eye.done);
        eye.performClick();
        assertEquals(Arrays.asList("card-1 true", "card-2 false"), handler.sent);

        // Swiping back to a story already sent shows it as sent, and Messenger's own seen for it stays held.
        handler.markRead(viewer.show(new Card("card-1")), true);
        assertTrue(eye.done);
        assertEquals(Arrays.asList("card-1 true", "card-2 false"), handler.sent);
        assertFalse(Settings.hookErrors.containsKey(StoryEye.OWNER));
    }

    /**
     * #202: the viewer keeps the next story loaded beside the one on screen, and its seen is held back as soon as it
     * loads. The eye sends the seen for the story on screen, not for the one loaded last, and follows the swipes.
     */
    @Test public void theEyeSendsTheStoryOnScreenNotTheOneLoadedBesideIt() throws Exception {
        on(true, true);
        openViewer();
        StoryHandler handler = new StoryHandler();
        Card first = viewer.show(new Card("card-1"));
        handler.markRead(first, true);
        Card second = viewer.show(new Card("card-2"));
        viewer.show(first);
        handler.markRead(second, false);
        StoryEye.Eye eye = eye();
        assertEquals(View.VISIBLE, eye.getVisibility());
        assertFalse(eye.done);

        assertTrue(eye.performClick());
        assertEquals("the tap sends the story on screen", Arrays.asList("card-1 true"), handler.sent);
        assertEquals("Marked as seen", lastToast());
        assertTrue(eye.done);

        viewer.show(second);
        scrolled();
        assertFalse("the next story's seen is still held back", eye.done);
        eye.performClick();
        assertEquals(Arrays.asList("card-1 true", "card-2 false"), handler.sent);

        viewer.show(first);
        scrolled();
        assertTrue("back on the first story, it shows as sent", eye.done);

        viewer.show(new Card("card-3"));
        scrolled();
        assertEquals("a story whose seen wasn't held back has no eye", View.GONE, eye.getVisibility());
        eye.performClick();
        assertEquals(Arrays.asList("card-1 true", "card-2 false"), handler.sent);
        assertFalse(Settings.hookErrors.containsKey(StoryEye.OWNER));
    }

    /** A viewer that can't say which story is on screen gets the eye for the story held back last, as before #202. */
    @Test public void aViewerWithoutAPageOnScreenFallsBackToTheNewestStory() {
        on(true, true);
        openViewer(new Object());
        StoryHandler handler = new StoryHandler();
        handler.markRead(new Card("card-1"), true);
        handler.markRead(new Card("card-2"), false);
        assertTrue(eye().performClick());
        assertEquals(Arrays.asList("card-2 false"), handler.sent);
        assertTrue("the miss is kept for the bug report", Settings.hookErrors.containsKey(StoryEye.OWNER));
    }

    @Test public void nothingIsHeldWithTheButtonOffOrTheControlOffOrPaused() {
        on(true, false);
        openViewer();
        StoryHandler handler = new StoryHandler();
        handler.markRead(new Card("card-1"), true);
        assertTrue("View stories anonymously still holds the seen back", handler.sent.isEmpty());
        assertNull(StoryEye.held);
        assertEquals(View.GONE, eye().getVisibility());

        on(false, true);
        handler.markRead(new Card("card-2"), true);
        assertEquals("with the control off Messenger sends its own seen", Arrays.asList("card-2 true"), handler.sent);
        assertNull(StoryEye.held);

        on(true, true);
        Settings.preferences.edit().putBoolean("paused", true).commit();
        handler.markRead(new Card("card-3"), true);
        assertEquals(Arrays.asList("card-2 true", "card-3 true"), handler.sent);
        assertNull(StoryEye.held);
        assertEquals(View.GONE, eye().getVisibility());
    }

    @Test public void closingTheViewersWindowTakesTheEyeOffWithoutBreakingTheWindow() {
        on(true, true);
        View view = openViewer();
        new StoryHandler().markRead(viewer.show(new Card("card-1")), true);
        StoryEye.Eye eye = eye();
        View decor = activity.getWindow().getDecorView();
        assertSame(decor, eye.getParent());

        // A dialog closing detaches its whole window at once; the eye is the decor's last child in that walk.
        activity.getWindowManager().removeViewImmediate(decor);
        assertFalse(view.isAttachedToWindow());
        assertNull("the card goes with the viewer", StoryEye.held);
        assertTrue(StoryEye.heldCards.isEmpty());
        assertNull(StoryEye.shownViewer);
        assertEquals(View.GONE, eye.getVisibility());
        ShadowLooper.idleMainLooper();
        assertNull(eye.getParent());
        assertNull(((ViewGroup) decor).findViewWithTag(StoryEye.VIEW_TAG));
        assertFalse(Settings.hookErrors.containsKey(StoryEye.OWNER));
    }

    static final class TwoSends {
        void markRead(Card card, boolean flag) { }

        void markOther(Card card, boolean flag) { }
    }

    @Test public void aHandlerWithTwoPossibleSendsSendsNothing() throws Exception {
        assertNull(StoryEye.markRead(TwoSends.class, new Card("card-1")));
        assertNotNull(StoryEye.markRead(StoryHandler.class, new Card("card-1")));

        on(true, true);
        StoryEye.hold(new TwoSends(), new Card("card-1"), true);
        assertFalse(StoryEye.markSeen());
    }
}
