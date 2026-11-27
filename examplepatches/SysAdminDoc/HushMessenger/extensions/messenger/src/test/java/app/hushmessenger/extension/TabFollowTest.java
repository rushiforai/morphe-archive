package app.hushmessenger.extension;

import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

import android.content.ComponentCallbacks2;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Picture;
import android.graphics.Rect;
import android.graphics.drawable.ColorDrawable;
import android.os.Handler;
import android.os.Looper;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import java.time.Duration;
import java.util.ArrayList;
import java.util.List;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowChoreographer;

/**
 * Page follows your finger (#194): while a swipe between tabs is under way, the home screen's page and title move with
 * the finger, the tab the finger heads for comes in beside them, and the tab bar stays put. What comes in is a picture
 * of that tab's page from the last time it was left, the hidden page Messenger keeps for it when there's no picture, and
 * the colour behind the pages when there's neither. A swipe that commits carries the page off that side before the tab
 * changes. Everything ends back in place.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class TabFollowTest {
    private static final String HOME = "Lapp/hushmessenger/extension/TabSwipeTest$Home;";
    private static final String BAR = "Lapp/hushmessenger/extension/TabSwipeTest$Bar;";
    private static final String TAB = "Lapp/hushmessenger/extension/TabSwipeTest$Tab;";
    private static final String ROUTE = HOME + "->current()" + TAB + "|" + HOME + "->bar:" + BAR + "|"
        + BAR + "->tabs:Ljava/util/List;|" + HOME + "->select(" + TAB + ")V";
    /** The colour behind Messenger's pages in these layouts, the way the home screen's root has it. */
    private static final int SURFACE = 0xFF242526;
    /** Where every layout here puts its tab bar. */
    private static final Rect BAR_BOX = new Rect(0, 1740, 1080, 1920);

    private View header;
    private View page;
    private View layer;
    private View bar;
    /** The home screen the last frame was built for. */
    private TabSwipeTest.Home shown;
    /** Every place the page was put since the last swipe began, with the tab open at that moment. */
    private final List<Object[]> moves = new ArrayList<>();
    private boolean barMoved;
    /** The view around the holder, the holder of the tabs' pages, and each tab's page. */
    private FrameLayout level;
    private FrameLayout holder;
    private final java.util.Map<TabSwipeTest.Tab, FrameLayout> tabPages = new java.util.EnumMap<>(TabSwipeTest.Tab.class);
    /** With the normal tab bar: the column holding the holder beside an empty layer. */
    private FrameLayout column;
    /** Every place the holder (or with the normal bar, its column) was put, with the tab open at that moment. */
    private final List<Object[]> holderMoves = new ArrayList<>();

    @Test public void thePageAndTitleFollowTheFingerAndTheTabBarStays() {
        on(true);
        TabSwipeTest.Home home = new TabSwipeTest.Home();
        TabSwipe.SwipeFrame frame = frame(home, true);

        down(frame);
        move(frame, 825);
        move(frame, 750);
        assertNotNull("The swipe took the page", frame.following());
        assertEquals(-150f, page.getTranslationX(), 0.01f);
        assertEquals(-150f, header.getTranslationX(), 0.01f);
        assertEquals(-150f, layer.getTranslationX(), 0.01f);
        assertEquals("The tab bar never moves", 0f, bar.getTranslationX(), 0.01f);

        // Chats is the first tab, so towards the start the page only gives a little.
        move(frame, 1000);
        assertEquals(100 * TabFollow.EDGE_PULL, page.getTranslationX(), 0.01f);
        up(frame, 1000);
        settle();
        assertNull(home.picked);
        assertEquals("And springs back", 0f, page.getTranslationX(), 0.01f);
        assertEquals(0f, header.getTranslationX(), 0.01f);
        assertTrue(Settings.lastActive(TabFollow.KEY) > 0);
    }

    @Test public void aSwipeThatCommitsCarriesThePageOffThenTheNextTabSlidesIn() {
        on(true);
        TabSwipeTest.Home home = new TabSwipeTest.Home();
        TabSwipe.SwipeFrame frame = frame(home, true);

        swipe(frame, -300);
        assertNull("The tab waits for the page to leave", home.picked);
        assertTrue(frame.following().sliding());
        float[] went = watch(TabSwipeTest.Tab.PEOPLE);
        assertTrue("The page left to the left, the way the finger went", went[0] < -540);
        assertTrue("and the new one came in from the right, the side the next tab is on, since People had no picture", went[3] > 540);
        assertEquals(0f, page.getTranslationX(), 0.01f);
        assertEquals(0f, header.getTranslationX(), 0.01f);
        assertFalse("The tab bar never moved", barMoved);
        assertNotNull("Chats' picture was taken as the swipe left it", frame.pictureOf(TabSwipeTest.Tab.INBOX));

        // Back the other way, Chats' picture comes in from the left behind the page, so once the tab has changed
        // everything goes straight into place under it. Nothing slides in a second time.
        swipe(frame, 300);
        went = watch(TabSwipeTest.Tab.INBOX);
        assertTrue(went[1] > 540);
        assertEquals("The page never came in again from the left", 0f, went[2], 0.01f);
        assertEquals(0f, went[3], 0.01f);
        assertEquals(0f, page.getTranslationX(), 0.01f);
        assertFalse(barMoved);
        assertNothingBeside(frame);
    }

    /**
     * Lets the slides run and checks [tab] opened. Gives back how far left and right the page went while the old tab
     * still showed, then the same once [tab] had opened.
     */
    private float[] watch(TabSwipeTest.Tab tab) {
        settle();
        assertSame(tab, shown.picked);
        float[] went = new float[4];
        for (Object[] move : moves) {
            int at = move[1] == tab ? 2 : 0;
            went[at] = Math.min(went[at], (Float) move[0]);
            went[at + 1] = Math.max(went[at + 1], (Float) move[0]);
        }
        return went;
    }

    @Test public void aShortSwipeOrOneWithNoTabThatWaySpringsBack() {
        on(true);
        TabSwipeTest.Home home = new TabSwipeTest.Home();
        TabSwipe.SwipeFrame frame = frame(home, true);

        swipe(frame, -40);
        settle();
        assertNull(home.picked);
        assertEquals(0f, page.getTranslationX(), 0.01f);

        // Far enough to commit, but there's no tab before the first one.
        swipe(frame, 300);
        settle();
        assertNull(home.picked);
        assertEquals(0f, page.getTranslationX(), 0.01f);

        // A swipe the screen takes away puts the page back too.
        down(frame);
        move(frame, 825);
        move(frame, 700);
        frame.dispatchTouchEvent(MotionEvent.obtain(0, 30, MotionEvent.ACTION_CANCEL, 700, 500, 0));
        settle();
        assertNull(home.picked);
        assertEquals(0f, page.getTranslationX(), 0.01f);
        assertNothingBeside(frame);
    }

    @Test public void aNewTouchDuringTheSlideFinishesItWithTheTabChanged() {
        on(true);
        TabSwipeTest.Home home = new TabSwipeTest.Home();
        TabSwipe.SwipeFrame frame = frame(home, true);

        swipe(frame, -300);
        assertNull(home.picked);
        down(frame);
        assertSame("The tab the swipe was going to", TabSwipeTest.Tab.PEOPLE, home.picked);
        assertNull(frame.following());
        assertEquals(0f, page.getTranslationX(), 0.01f);
        assertNothingBeside(frame);
        settle();
        assertEquals("Nothing slides in after it was finished", 0f, page.getTranslationX(), 0.01f);
        up(frame, 900);
    }

    @Test public void offOrOnAScreenWithNoBarAlongTheBottomTheSwipeJustChangesTheTab() {
        on(false);
        TabSwipeTest.Home home = new TabSwipeTest.Home();
        TabSwipe.SwipeFrame frame = frame(home, true);
        down(frame);
        move(frame, 825);
        move(frame, 700);
        assertNull(frame.following());
        assertEquals(0f, page.getTranslationX(), 0.01f);
        up(frame, 600);
        assertSame("At once, the way it always did", TabSwipeTest.Tab.PEOPLE, home.picked);

        on(true);
        TabSwipeTest.Home other = new TabSwipeTest.Home();
        TabSwipe.SwipeFrame noBar = frame(other, false);
        down(noBar);
        move(noBar, 825);
        move(noBar, 700);
        assertNull("A layout Hush doesn't know isn't moved", noBar.following());
        assertEquals(0f, page.getTranslationX(), 0.01f);
        up(noBar, 600);
        assertSame(TabSwipeTest.Tab.PEOPLE, other.picked);

        // It rides on Swipe between tabs, so that going off stops it as well.
        Settings.preferences.edit().putBoolean(TabSwipe.KEY, false).commit();
        assertFalse(TabFollow.on());
    }

    @Test public void pausedOrOffNoPictureIsTakenAndNothingIsDrawnBeside() {
        on(true);
        TabSwipeTest.Home home = new TabSwipeTest.Home();
        TabSwipe.SwipeFrame frame = frame(home, true);
        // Paused after the home screen was built, so its frame is there and has to leave it alone.
        Settings.preferences.edit().putBoolean("paused", true).commit();
        home.open = TabSwipeTest.Tab.PEOPLE;
        tapBar(frame);
        assertNull("Paused, Hush leaves the home screen stock", frame.pictureOf(TabSwipeTest.Tab.PEOPLE));
        home.open = TabSwipeTest.Tab.INBOX;
        down(frame);
        move(frame, 825);
        move(frame, 700);
        assertNull(frame.following());
        assertEquals(0f, page.getTranslationX(), 0.01f);
        assertNothingBeside(frame);
        up(frame, 890);

        Settings.preferences.edit().putBoolean("paused", false).putBoolean(TabFollow.KEY, false).commit();
        home.open = TabSwipeTest.Tab.PEOPLE;
        tapBar(frame);
        assertNull("and so does the switch being off", frame.pictureOf(TabSwipeTest.Tab.PEOPLE));
    }

    /**
     * A tab left by a tap on the tab bar has its page's picture taken as the finger goes down, before Messenger swaps
     * the page. A swipe towards that tab later brings the picture in right beside the moving page, wherever the finger
     * has taken it, over the colour behind the pages and never over the tab bar.
     */
    @Test public void theNextTabsPictureComesInBesideThePageAndMovesWithTheFinger() {
        on(true);
        TabSwipeTest.Home home = new TabSwipeTest.Home();
        TabSwipe.SwipeFrame frame = frame(home, true);
        home.open = TabSwipeTest.Tab.PEOPLE;
        tap(frame, 540, 600);
        assertNull("A tap on the page isn't leaving the tab", frame.pictureOf(TabSwipeTest.Tab.PEOPLE));
        tapBar(frame);
        Picture people = frame.pictureOf(TabSwipeTest.Tab.PEOPLE);
        assertNotNull("Leaving People by a tap on the bar took its picture", people);
        // That tap opened Chats.
        home.open = TabSwipeTest.Tab.INBOX;

        down(frame);
        move(frame, 825);
        move(frame, 600);
        Recorder seen = drawn(frame);
        assertEquals(1, seen.pictures.size());
        assertSame(people, seen.pictures.get(0));
        assertEquals("People comes in right beside the page, where the finger took it", 780f, seen.picturesAt.get(0), 0.01f);
        assertEquals(new Rect(780, 0, 1080, 1920), seen.clips.get(0));
        assertEquals("never over the tab bar", BAR_BOX, seen.cutOut.get(0));
        assertEquals("over the colour behind the pages", SURFACE, (int) seen.colors.get(0));

        move(frame, 450);
        assertEquals(-450f, page.getTranslationX(), 0.01f);
        seen = drawn(frame);
        assertEquals("and it keeps up with the finger", 630f, seen.picturesAt.get(0), 0.01f);
        assertEquals(new Rect(630, 0, 1080, 1920), seen.clips.get(0));

        // Towards Chats' start there's no tab, so only the colour shows in the little gap.
        move(frame, 1000);
        seen = drawn(frame);
        assertTrue(seen.pictures.isEmpty());
        assertEquals(new Rect(0, 0, 30, 1920), seen.clips.get(0));
        assertEquals(SURFACE, (int) seen.colors.get(0));
        up(frame, 1000);
        settle();
        assertEquals(0f, page.getTranslationX(), 0.01f);
        assertNothingBeside(frame);
    }

    /** A tab with no picture and no page of Messenger's yet shows the colour behind the pages, never a black gap. */
    @Test public void withNeitherAPictureNorAPageTheGapIsTheColourBehindThePages() {
        on(true);
        TabSwipeTest.Home home = new TabSwipeTest.Home();
        TabSwipe.SwipeFrame frame = floating(home, TabSwipeTest.Tab.INBOX);

        down(frame);
        move(frame, 825);
        move(frame, 600);
        assertNull(frame.following().beside());
        Recorder seen = drawn(frame);
        assertTrue("People has no picture yet", seen.pictures.isEmpty());
        assertEquals(1, seen.colors.size());
        assertEquals(SURFACE, (int) seen.colors.get(0));
        assertEquals(new Rect(780, 0, 1080, 1920), seen.clips.get(0));
        assertEquals("and the floating bar stays clear of it", BAR_BOX, seen.cutOut.get(0));

        move(frame, 400);
        assertEquals(new Rect(580, 0, 1080, 1920), drawn(frame).clips.get(0));
        up(frame, 400);
        settle();
        assertSame(TabSwipeTest.Tab.PEOPLE, home.picked);
        assertNothingBeside(frame);
    }

    /**
     * With the floating tab bar every tab's page sits in one holder, and Messenger builds a tab's page the first time it
     * opens, here while the old page is off the side of the screen. Litho draws only what it saw on screen the last time
     * its own view moved, so the new page came in blank until something moved it (#194).
     */
    @Test public void aPageMessengerBuildsWhileTheOldOneIsOffTheScreenIsDrawnOnceItSlidesIn() {
        on(true);
        TabSwipeTest.Home home = new TabSwipeTest.Home();
        TabSwipe.SwipeFrame frame = floating(home, TabSwipeTest.Tab.INBOX);

        down(frame);
        move(frame, 825);
        move(frame, 600);
        assertNull("People has no page yet, so nothing comes along beside", frame.following().beside());
        assertTrue(level.getClipChildren());
        up(frame, 600);
        settle();
        assertSame(TabSwipeTest.Tab.PEOPLE, home.picked);
        FrameLayout people = tabPages.get(TabSwipeTest.Tab.PEOPLE);
        assertNotNull("Messenger built the page while the old one was carried off", people);
        assertEquals(0f, onScreenX(people), 0.01f);
        assertEquals("and it was drawn where it came to rest, all of it", 0f, litho(people).seenAt, 0.01f);
        assertEquals(0f, header.getTranslationX(), 0.01f);
        assertTrue(level.getClipChildren());
    }

    /**
     * A tab opened before keeps its page in the holder, hidden. That page comes along beside the moving one while the
     * finger drags, with the picture taken when the tab was left showing over it, and once the swipe commits it's the
     * page Messenger shows, so it stays where it came to.
     */
    @Test public void aTabOpenedBeforeComesAlongBesideThePageAndStaysWhenTheSwipeCommits() {
        on(true);
        TabSwipeTest.Home home = new TabSwipeTest.Home();
        TabSwipe.SwipeFrame frame = visitedPeople(home);
        FrameLayout people = tabPages.get(TabSwipeTest.Tab.PEOPLE);
        FrameLayout chats = tabPages.get(TabSwipeTest.Tab.INBOX);
        Picture picture = frame.pictureOf(TabSwipeTest.Tab.PEOPLE);
        assertNotNull("People's picture was taken as the swipe left it", picture);

        down(frame);
        move(frame, 825);
        move(frame, 600);
        assertSame(people, frame.following().beside());
        assertEquals(View.VISIBLE, people.getVisibility());
        assertEquals("People sits just right of the page, the side it opens from", 780f, onScreenX(people), 0.01f);
        assertFalse("and isn't cut off at the holder's edge", level.getClipChildren());
        assertTrue("Litho was told it's partly on screen", litho(people).seenAt > 0);
        Recorder seen = drawn(frame);
        assertSame("Its picture shows over it, in the same place", picture, seen.pictures.get(0));
        assertEquals(780f, seen.picturesAt.get(0), 0.01f);

        holderMoves.clear();
        // Frames wait for the clock here and come one at a time, so the slide and the fade take their time instead of
        // running out in one go. A long idle would skip to its end and give an animation a single frame.
        ShadowChoreographer.setPaused(true);
        try {
            up(frame, 600);
            for (int step = 0; step < 40 && frame.following().covering() == null; step++) frames(1);
            assertSame("The tab changed once the page was off the screen", TabSwipeTest.Tab.PEOPLE, home.picked);
            assertSame("Landed, the picture covers the screen while it fades into the page", picture, frame.following().covering());
            frames(2);
            assertSame("It's still fading a frame later", picture, frame.following().covering());
            seen = drawn(frame);
            assertSame(picture, seen.pictures.get(0));
            assertEquals(new Rect(0, 0, 1080, 1920), seen.clips.get(0));
            assertEquals(0f, seen.picturesAt.get(0), 0.01f);
        } finally {
            ShadowChoreographer.setPaused(false);
        }
        settle();
        assertNull("and it's gone once it has faded", frame.following().covering());
        assertEquals(View.GONE, chats.getVisibility());
        assertEquals(View.VISIBLE, people.getVisibility());
        assertEquals(0f, people.getTranslationX(), 0.01f);
        assertEquals(0f, holder.getTranslationX(), 0.01f);
        for (Object[] move : holderMoves) {
            if (move[1] == TabSwipeTest.Tab.PEOPLE) assertFalse("The page that came along never jumped back off the screen", (Float) move[0] > 0);
        }
        assertEquals(0f, litho(people).seenAt, 0.01f);
        assertEquals("The title is back in place too", 0f, header.getTranslationX(), 0.01f);
        assertTrue("The holder's parent clips again", level.getClipChildren());
        assertNull(frame.following().beside());
        assertNothingBeside(frame);
    }

    @Test public void aSwipeThatSpringsBackOrTurnsAroundHidesThePageBesideAgain() {
        on(true);
        TabSwipeTest.Home home = new TabSwipeTest.Home();
        TabSwipe.SwipeFrame frame = visitedPeople(home);
        FrameLayout people = tabPages.get(TabSwipeTest.Tab.PEOPLE);
        FrameLayout chats = tabPages.get(TabSwipeTest.Tab.INBOX);

        down(frame);
        move(frame, 825);
        move(frame, 750);
        assertSame(people, frame.following().beside());
        up(frame, 750);
        settle();
        assertSame("Too short to change the tab", TabSwipeTest.Tab.INBOX, home.open);
        assertEquals(View.GONE, people.getVisibility());
        assertEquals(0f, people.getTranslationX(), 0.01f);
        assertEquals(View.VISIBLE, chats.getVisibility());
        assertEquals(0f, holder.getTranslationX(), 0.01f);
        assertTrue(level.getClipChildren());

        // Back the other way, where Chats has no tab before it, People goes again at once.
        down(frame);
        move(frame, 825);
        move(frame, 750);
        assertSame(people, frame.following().beside());
        move(frame, 1000);
        assertNull(frame.following().beside());
        assertEquals(View.GONE, people.getVisibility());
        assertTrue(level.getClipChildren());
        up(frame, 1000);
        settle();
        assertSame(TabSwipeTest.Tab.INBOX, home.open);
        assertEquals(View.VISIBLE, chats.getVisibility());
    }

    /** Low memory lets the pictures go, and then the hidden page Messenger keeps comes along beside on its own. */
    @Test public void withThePictureGoneTheHiddenPageComesAlongOnItsOwn() {
        on(true);
        TabSwipeTest.Home home = new TabSwipeTest.Home();
        TabSwipe.SwipeFrame frame = visitedPeople(home);
        FrameLayout people = tabPages.get(TabSwipeTest.Tab.PEOPLE);

        RuntimeEnvironment.getApplication().onTrimMemory(ComponentCallbacks2.TRIM_MEMORY_UI_HIDDEN);
        assertNotNull("Leaving the screen isn't low memory", frame.pictureOf(TabSwipeTest.Tab.PEOPLE));
        RuntimeEnvironment.getApplication().onTrimMemory(ComponentCallbacks2.TRIM_MEMORY_BACKGROUND);
        assertNull(frame.pictureOf(TabSwipeTest.Tab.PEOPLE));

        down(frame);
        move(frame, 825);
        move(frame, 600);
        assertSame(people, frame.following().beside());
        assertEquals("The page itself moves with the finger", 780f, onScreenX(people), 0.01f);
        move(frame, 500);
        assertEquals(680f, onScreenX(people), 0.01f);
        Recorder seen = drawn(frame);
        assertTrue("and draws itself, with nothing over it", seen.pictures.isEmpty());
        assertTrue(seen.colors.isEmpty());
        up(frame, 890);
        settle();
        assertSame(TabSwipeTest.Tab.INBOX, home.open);
        assertEquals(View.GONE, people.getVisibility());
    }

    /** A picture taken with another theme or at another size no longer fits, so it isn't shown. */
    @Test public void aNewThemeOrSizeDropsThePictures() {
        on(true);
        TabSwipeTest.Home home = new TabSwipeTest.Home();
        TabSwipe.SwipeFrame frame = frame(home, true);
        home.open = TabSwipeTest.Tab.PEOPLE;
        tapBar(frame);
        assertNotNull(frame.pictureOf(TabSwipeTest.Tab.PEOPLE));
        home.open = TabSwipeTest.Tab.INBOX;

        // Messenger's own light and dark switch paints the root again without a configuration change.
        int light = 0xFFFFFFFF;
        frame.getChildAt(0).setBackground(new ColorDrawable(light));
        down(frame);
        move(frame, 825);
        move(frame, 600);
        Recorder seen = drawn(frame);
        assertTrue("The dark picture isn't shown on a light screen", seen.pictures.isEmpty());
        assertEquals(light, (int) seen.colors.get(0));
        assertNull(frame.pictureOf(TabSwipeTest.Tab.PEOPLE));
        up(frame, 890);
        settle();

        home.open = TabSwipeTest.Tab.PEOPLE;
        tapBar(frame);
        assertNotNull(frame.pictureOf(TabSwipeTest.Tab.PEOPLE));
        frame.dispatchConfigurationChanged(new Configuration());
        assertNull("A configuration change drops them too", frame.pictureOf(TabSwipeTest.Tab.PEOPLE));

        tapBar(frame);
        assertNotNull(frame.pictureOf(TabSwipeTest.Tab.PEOPLE));
        RuntimeEnvironment.getApplication().onConfigurationChanged(new Configuration());
        assertNull(frame.pictureOf(TabSwipeTest.Tab.PEOPLE));

        tapBar(frame);
        frame.layout(0, 0, 1080, 1800);
        assertNull("and so does a new size", frame.pictureOf(TabSwipeTest.Tab.PEOPLE));
    }

    /**
     * With Messenger's normal tab bar the holder sits inside a column beside an empty layer as big as it, which kept
     * Hush from finding it. The hidden page comes along there too, and the column and the view around it stop clipping
     * while it does. Every way a swipe can end puts back each view's place, visibility and clipping exactly as it was,
     * with nothing left drawn beside.
     */
    @Test public void withTheNormalTabBarEveryEndingPutsEverythingBack() {
        on(true);
        TabSwipeTest.Home home = new TabSwipeTest.Home();
        home.open = TabSwipeTest.Tab.PEOPLE;
        TabSwipe.SwipeFrame frame = normal(home, TabSwipeTest.Tab.INBOX, TabSwipeTest.Tab.PEOPLE);
        swipe(frame, 300);
        settle();
        assertSame(TabSwipeTest.Tab.INBOX, home.open);
        FrameLayout people = tabPages.get(TabSwipeTest.Tab.PEOPLE);
        Picture picture = frame.pictureOf(TabSwipeTest.Tab.PEOPLE);
        assertNotNull(picture);
        column.setClipChildren(false);
        assertBackInPlace(frame, false);

        // Let go too soon, so it springs back.
        dragTo(frame, 750, people, picture);
        up(frame, 750);
        settle();
        assertBackInPlace(frame, false);

        // Taken away by the screen.
        dragTo(frame, 700, people, picture);
        frame.dispatchTouchEvent(MotionEvent.obtain(0, 30, MotionEvent.ACTION_CANCEL, 700, 500, 0));
        settle();
        assertBackInPlace(frame, false);

        // A second finger.
        dragTo(frame, 700, people, picture);
        secondFinger(frame, 700);
        move(frame, 500);
        settle();
        assertBackInPlace(frame, false);
        up(frame, 500);
        settle();
        assertSame("A second finger never changes the tab", TabSwipeTest.Tab.INBOX, home.open);
        assertBackInPlace(frame, false);

        // The home screen leaving the window puts it all back at once and keeps the tab.
        dragTo(frame, 700, people, picture);
        frame.onDetachedFromWindow();
        assertNull(frame.following());
        assertBackInPlace(frame, false);
        frame.dispatchTouchEvent(MotionEvent.obtain(0, 30, MotionEvent.ACTION_CANCEL, 700, 500, 0));
        settle();
        assertSame(TabSwipeTest.Tab.INBOX, home.open);

        // The switch going off mid-swipe puts it all back at once, and the swipe ends the plain way.
        dragTo(frame, 700, people, picture);
        Settings.preferences.edit().putBoolean(TabFollow.KEY, false).commit();
        move(frame, 650);
        assertNull(frame.following());
        assertBackInPlace(frame, false);
        assertNull("Off, the pictures go", frame.pictureOf(TabSwipeTest.Tab.PEOPLE));
        up(frame, 890);
        settle();
        assertSame(TabSwipeTest.Tab.INBOX, home.open);
        assertBackInPlace(frame, false);
    }

    /** With the normal tab bar, a swipe that commits leaves the page that came along where it is, under its picture. */
    @Test public void withTheNormalTabBarACommittedSwipeLandsOnThePageThatCameAlong() {
        on(true);
        TabSwipeTest.Home home = new TabSwipeTest.Home();
        home.open = TabSwipeTest.Tab.PEOPLE;
        TabSwipe.SwipeFrame frame = normal(home, TabSwipeTest.Tab.INBOX, TabSwipeTest.Tab.PEOPLE);
        swipe(frame, 300);
        settle();
        FrameLayout people = tabPages.get(TabSwipeTest.Tab.PEOPLE);
        FrameLayout chats = tabPages.get(TabSwipeTest.Tab.INBOX);
        Picture picture = frame.pictureOf(TabSwipeTest.Tab.PEOPLE);

        holderMoves.clear();
        swipe(frame, -300);
        settle();
        assertSame(TabSwipeTest.Tab.PEOPLE, home.open);
        assertEquals(View.VISIBLE, people.getVisibility());
        assertEquals(View.GONE, chats.getVisibility());
        for (Object[] move : holderMoves) {
            if (move[1] == TabSwipeTest.Tab.PEOPLE) assertFalse("The column never came in again from the right", (Float) move[0] > 0);
        }
        for (View view : new View[] {header, column, holder, people, chats}) assertEquals(0f, view.getTranslationX(), 0.01f);
        assertEquals(0f, litho(people).seenAt, 0.01f);
        assertTrue(column.getClipChildren());
        assertTrue(level.getClipChildren());
        assertNothingBeside(frame);
        assertNotNull("Chats' picture was taken as this swipe left it", frame.pictureOf(TabSwipeTest.Tab.INBOX));
        assertSame("and People's is kept", picture, frame.pictureOf(TabSwipeTest.Tab.PEOPLE));
    }

    /** Drags from Chats to [x], where People's page and [picture] come in beside, with the column and its parent unclipped. */
    private void dragTo(TabSwipe.SwipeFrame frame, float x, FrameLayout people, Picture picture) {
        down(frame);
        move(frame, 825);
        move(frame, x);
        assertNotNull(frame.following());
        assertSame("Found beside the empty layer", people, frame.following().beside());
        assertEquals(View.VISIBLE, people.getVisibility());
        assertEquals(1080 + x - 900, onScreenX(people), 0.01f);
        assertFalse(column.getClipChildren());
        assertFalse(level.getClipChildren());
        Recorder seen = drawn(frame);
        assertSame(picture, seen.pictures.get(0));
        assertEquals(1080 + x - 900, seen.picturesAt.get(0), 0.01f);
    }

    /** Chats shows, People is hidden, nothing has moved, the clipping is as it was and nothing is drawn beside. */
    private void assertBackInPlace(TabSwipe.SwipeFrame frame, boolean columnClips) {
        FrameLayout chats = tabPages.get(TabSwipeTest.Tab.INBOX);
        FrameLayout people = tabPages.get(TabSwipeTest.Tab.PEOPLE);
        assertEquals(View.VISIBLE, chats.getVisibility());
        assertEquals(View.GONE, people.getVisibility());
        for (View view : new View[] {header, column, holder, chats, people, bar}) assertEquals(0f, view.getTranslationX(), 0.01f);
        assertEquals(columnClips, column.getClipChildren());
        assertTrue(level.getClipChildren());
        assertNothingBeside(frame);
    }

    private static void assertNothingBeside(TabSwipe.SwipeFrame frame) {
        Recorder seen = drawn(frame);
        assertTrue("No picture is left drawn", seen.pictures.isEmpty());
        assertTrue("and no colour", seen.colors.isEmpty());
    }

    /** A floating home screen that has opened People once and come back to Chats, so People's page is kept, hidden. */
    private TabSwipe.SwipeFrame visitedPeople(TabSwipeTest.Home home) {
        home.open = TabSwipeTest.Tab.PEOPLE;
        TabSwipe.SwipeFrame frame = floating(home, TabSwipeTest.Tab.INBOX, TabSwipeTest.Tab.PEOPLE);
        swipe(frame, 300);
        settle();
        assertSame(TabSwipeTest.Tab.INBOX, home.open);
        assertEquals(View.GONE, tabPages.get(TabSwipeTest.Tab.PEOPLE).getVisibility());
        assertEquals(View.VISIBLE, tabPages.get(TabSwipeTest.Tab.INBOX).getVisibility());
        assertEquals(0f, holder.getTranslationX(), 0.01f);
        return frame;
    }

    /**
     * The home screen with the floating tab bar: the holder of the tabs' pages, with a page for each of [built] and only
     * the open tab's shown, an empty layer, the title along the top and the bar along the bottom. Opening a tab shows its
     * page, building it the first time, a moment later, the way a fragment change runs.
     */
    private TabSwipe.SwipeFrame floating(TabSwipeTest.Home home, TabSwipeTest.Tab... built) {
        android.content.Context context = RuntimeEnvironment.getApplication();
        shown = home;
        tabPages.clear();
        FrameLayout root = root(context);
        level = new FrameLayout(context);
        root.addView(level, fill());
        holder = new FrameLayout(context) {
            @Override public void setTranslationX(float x) {
                super.setTranslationX(x);
                holderMoves.add(new Object[] {x, shown.open});
            }
        };
        level.addView(holder, fill());
        for (TabSwipeTest.Tab tab : built) {
            FrameLayout page = tabPage(context);
            tabPages.put(tab, page);
            holder.addView(page, fill());
        }
        level.addView(new FrameLayout(context), fill());
        header = new View(context);
        level.addView(header, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 170, Gravity.TOP));
        bar = new View(context);
        level.addView(bar, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 180, Gravity.BOTTOM));
        return wrapPages(root, home);
    }

    /**
     * The home screen with Messenger's normal tab bar: the title along the top, under it a column holding the holder of
     * the tabs' pages and an empty layer as big as the holder, and the bar along the bottom.
     */
    private TabSwipe.SwipeFrame normal(TabSwipeTest.Home home, TabSwipeTest.Tab... built) {
        android.content.Context context = RuntimeEnvironment.getApplication();
        shown = home;
        tabPages.clear();
        FrameLayout root = root(context);
        level = new FrameLayout(context);
        root.addView(level, fill());
        header = new View(context);
        level.addView(header, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 170, Gravity.TOP));
        column = new FrameLayout(context) {
            @Override public void setTranslationX(float x) {
                super.setTranslationX(x);
                holderMoves.add(new Object[] {x, shown.open});
            }
        };
        FrameLayout.LayoutParams between = fill();
        between.topMargin = 170;
        between.bottomMargin = 180;
        level.addView(column, between);
        holder = new FrameLayout(context);
        column.addView(holder, fill());
        for (TabSwipeTest.Tab tab : built) {
            FrameLayout page = tabPage(context);
            tabPages.put(tab, page);
            holder.addView(page, fill());
        }
        column.addView(new FrameLayout(context), fill());
        bar = new View(context);
        level.addView(bar, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 180, Gravity.BOTTOM));
        return wrapPages(root, home);
    }

    /** The home screen's root, painted the colour Messenger puts behind its pages. */
    private static FrameLayout root(android.content.Context context) {
        FrameLayout root = new FrameLayout(context);
        root.setLayoutParams(new ViewGroup.LayoutParams(1080, 1920));
        root.setBackground(new ColorDrawable(SURFACE));
        return root;
    }

    /** Wraps [root] and has opening a tab show only its page in the holder, building it the first time. */
    private TabSwipe.SwipeFrame wrapPages(FrameLayout root, TabSwipeTest.Home home) {
        android.content.Context context = root.getContext();
        View wrapped = TabSwipe.wrap(root, home, ROUTE);
        assertTrue(wrapped instanceof TabSwipe.SwipeFrame);
        TabSwipe.SwipeFrame frame = (TabSwipe.SwipeFrame) wrapped;
        layOut(frame);
        // Hidden pages keep where they were last laid out, the way a fragment's view does once it's hidden.
        for (java.util.Map.Entry<TabSwipeTest.Tab, FrameLayout> page : tabPages.entrySet()) {
            page.getValue().setVisibility(page.getKey() == home.open ? View.VISIBLE : View.GONE);
        }
        FrameLayout pages = holder;
        home.selected = tab -> new Handler(Looper.getMainLooper()).post(() -> {
            FrameLayout page = tabPages.get(tab);
            if (page == null) {
                page = tabPage(context);
                tabPages.put(tab, page);
                pages.addView(page, fill());
            }
            for (FrameLayout each : tabPages.values()) each.setVisibility(each == page ? View.VISIBLE : View.GONE);
            layOut(frame);
        });
        return frame;
    }

    private static FrameLayout tabPage(android.content.Context context) {
        FrameLayout page = new FrameLayout(context);
        page.addView(new Litho(context), fill());
        return page;
    }

    private static Litho litho(FrameLayout page) {
        return (Litho) page.getChildAt(0);
    }

    private static FrameLayout.LayoutParams fill() {
        return new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
    }

    private static void layOut(View frame) {
        frame.measure(View.MeasureSpec.makeMeasureSpec(1080, View.MeasureSpec.EXACTLY),
            View.MeasureSpec.makeMeasureSpec(1920, View.MeasureSpec.EXACTLY));
        frame.layout(0, 0, 1080, 1920);
    }

    /** Where [view] sits across the screen, counting every view around it that moved. */
    private static float onScreenX(View view) {
        float x = 0;
        for (View at = view; at != null; at = at.getParent() instanceof View ? (View) at.getParent() : null) {
            x += at.getLeft() + at.getTranslationX();
        }
        return x;
    }

    /** Draws [frame] the way the screen does and gives back what the frame drew beside the moving page. */
    private static Recorder drawn(TabSwipe.SwipeFrame frame) {
        Recorder seen = new Recorder();
        frame.draw(seen);
        return seen;
    }

    /**
     * A canvas that keeps what the frame draws of its own: pictures and where they went across, colours, and the strip
     * they were kept to with what was cut out of it. The views inside draw as usual and none of them does any of that.
     */
    static final class Recorder extends Canvas {
        final List<Picture> pictures = new ArrayList<>();
        final List<Float> picturesAt = new ArrayList<>();
        final List<Integer> colors = new ArrayList<>();
        final List<Rect> clips = new ArrayList<>();
        final List<Rect> cutOut = new ArrayList<>();
        private float lastX;

        Recorder() {
            super(Bitmap.createBitmap(1, 1, Bitmap.Config.ARGB_8888));
        }

        @Override public void translate(float dx, float dy) {
            lastX = dx;
            super.translate(dx, dy);
        }

        @Override public void drawPicture(Picture picture) {
            pictures.add(picture);
            picturesAt.add(lastX);
        }

        @Override public void drawColor(int color) {
            colors.add(color);
        }

        @Override public boolean clipRect(Rect rect) {
            clips.add(new Rect(rect));
            return super.clipRect(rect);
        }

        @Override public boolean clipOutRect(Rect rect) {
            cutOut.add(new Rect(rect));
            return super.clipOutRect(rect);
        }
    }

    /**
     * Stands in for a Litho view: it looks at where it is on screen only when it moves itself, the way Litho's mounting
     * view does, and moving by nothing counts.
     */
    static final class Litho extends FrameLayout {
        /** Where it was across the screen the last time it looked, or NaN if it never did. */
        float seenAt = Float.NaN;

        Litho(android.content.Context context) {
            super(context);
        }

        @Override public void offsetLeftAndRight(int offset) {
            super.offsetLeftAndRight(offset);
            seenAt = onScreenX(this);
        }

        @Override public boolean onTouchEvent(MotionEvent event) {
            return true;
        }
    }

    private void on(boolean follow) {
        Settings.preferences.edit().putBoolean(TabSwipe.KEY, true).putBoolean(TabFollow.KEY, follow).commit();
    }

    /**
     * The home screen the way Messenger lays it out: a column of one view inside another, then the title along the
     * top, the page under it, an empty layer over the page, and the tab bar along the bottom.
     */
    private TabSwipe.SwipeFrame frame(TabSwipeTest.Home home, boolean withBar) {
        android.content.Context context = RuntimeEnvironment.getApplication();
        FrameLayout root = root(context);
        FrameLayout level = new FrameLayout(context);
        root.addView(level, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        header = new View(context);
        level.addView(header, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 170, Gravity.TOP));
        shown = home;
        page = new View(context) {
            @Override public boolean onTouchEvent(MotionEvent event) { return true; }

            @Override public void setTranslationX(float x) {
                super.setTranslationX(x);
                moves.add(new Object[] {x, shown.picked});
            }
        };
        FrameLayout.LayoutParams under = new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
        under.topMargin = 170;
        level.addView(page, under);
        layer = new FrameLayout(context);
        level.addView(layer, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        bar = new View(context) {
            @Override public void setTranslationX(float x) {
                super.setTranslationX(x);
                if (x != 0) barMoved = true;
            }
        };
        if (withBar) level.addView(bar, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 180, Gravity.BOTTOM));
        View wrapped = TabSwipe.wrap(root, home, ROUTE);
        assertTrue(wrapped instanceof TabSwipe.SwipeFrame);
        wrapped.measure(View.MeasureSpec.makeMeasureSpec(1080, View.MeasureSpec.EXACTLY),
            View.MeasureSpec.makeMeasureSpec(1920, View.MeasureSpec.EXACTLY));
        wrapped.layout(0, 0, 1080, 1920);
        return (TabSwipe.SwipeFrame) wrapped;
    }

    private void swipe(TabSwipe.SwipeFrame frame, int sideways) {
        moves.clear();
        down(frame);
        for (int step = 1; step <= 4; step++) move(frame, 900 + sideways * step / 4f);
        up(frame, 900 + sideways);
    }

    private static void down(TabSwipe.SwipeFrame frame) {
        frame.dispatchTouchEvent(MotionEvent.obtain(0, 0, MotionEvent.ACTION_DOWN, 900, 500, 0));
    }

    private static void move(TabSwipe.SwipeFrame frame, float x) {
        frame.dispatchTouchEvent(MotionEvent.obtain(0, 10, MotionEvent.ACTION_MOVE, x, 500, 0));
    }

    private static void up(TabSwipe.SwipeFrame frame, float x) {
        frame.dispatchTouchEvent(MotionEvent.obtain(0, 50, MotionEvent.ACTION_UP, x, 500, 0));
    }

    private static void tap(TabSwipe.SwipeFrame frame, float x, float y) {
        frame.dispatchTouchEvent(MotionEvent.obtain(0, 0, MotionEvent.ACTION_DOWN, x, y, 0));
        frame.dispatchTouchEvent(MotionEvent.obtain(0, 40, MotionEvent.ACTION_UP, x, y, 0));
    }

    /** A tap on the tab bar, which sits along the bottom of every layout here. */
    private static void tapBar(TabSwipe.SwipeFrame frame) {
        tap(frame, 540, 1830);
    }

    /** A second finger going down while the first is still at [x]. */
    private static void secondFinger(TabSwipe.SwipeFrame frame, float x) {
        MotionEvent.PointerProperties[] fingers = {new MotionEvent.PointerProperties(), new MotionEvent.PointerProperties()};
        fingers[0].id = 0;
        fingers[1].id = 1;
        MotionEvent.PointerCoords[] at = {new MotionEvent.PointerCoords(), new MotionEvent.PointerCoords()};
        at[0].x = x;
        at[0].y = 500;
        at[1].x = 300;
        at[1].y = 900;
        int action = MotionEvent.ACTION_POINTER_DOWN | (1 << MotionEvent.ACTION_POINTER_INDEX_SHIFT);
        frame.dispatchTouchEvent(MotionEvent.obtain(0, 30, action, 2, fingers, at, 0, 0, 1f, 1f, 0, 0, 0, 0));
    }

    private static void settle() {
        shadowOf(Looper.getMainLooper()).idleFor(Duration.ofSeconds(1));
    }

    /** With frames paused, about [count] frames' time, in steps short enough that each frame gets its turn. */
    private static void frames(int count) {
        for (int i = 0; i < count * 2; i++) shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(10));
    }

    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        Settings.hookErrors.clear();
        CrashGuard.resetForTests();
        restart();
    }

    @After public void restart() {
        Settings.tabSwiping = null;
        Settings.bottomTabs.clear();
    }
}
