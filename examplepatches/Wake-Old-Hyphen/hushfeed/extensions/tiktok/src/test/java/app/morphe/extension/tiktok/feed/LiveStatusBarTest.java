package app.morphe.extension.tiktok.feed;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.content.res.Resources;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.FrameLayout;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.tiktok.settings.Settings;
import com.ss.android.ugc.aweme.live.LivePlayActivity;
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
 * #38: a LIVE room hides its status bar, reaches into the cutout and loses the strip TikTok keeps
 * for the bar while it is in front, and gives all three back when it leaves; nothing else is
 * touched, and the switch decides.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 34)
public class LiveStatusBarTest {
    @Before public void setUp() {
        Utils.setContext(RuntimeEnvironment.getApplication());
        Settings.HIDE_STATUS_BAR_IN_LIVE.save(false);
    }

    @After public void tearDown() {
        Settings.HIDE_STATUS_BAR_IN_LIVE.resetToDefault();
        Utils.setContext(RuntimeEnvironment.getApplication());
    }

    @Test public void aLiveRoomHidesItsBarWhileInFrontAndGivesItBack() {
        Settings.HIDE_STATUS_BAR_IN_LIVE.save(true);
        followFromTheMainActivity();
        ActivityController<LivePlayActivity> room = Robolectric.buildActivity(LivePlayActivity.class).setup();
        LivePlayActivity live = room.get();
        assertTrue("the room's bar wasn't hidden", LiveStatusBar.isHidden(live));
        assertEquals(WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_SHORT_EDGES,
                live.getWindow().getAttributes().layoutInDisplayCutoutMode);

        room.pause();
        assertFalse("leaving kept the bar hidden", LiveStatusBar.isHidden(live));
        assertEquals("the cutout mode wasn't given back",
                WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_DEFAULT,
                live.getWindow().getAttributes().layoutInDisplayCutoutMode);

        room.resume();
        assertTrue("coming back to the room didn't hide it again", LiveStatusBar.isHidden(live));
        room.pause().stop().destroy();
    }

    /** 47.1.3's LIVE window already reaches into the cutout on every edge; that stays. */
    @Test public void aRoomAlreadyInTheCutoutKeepsItsOwnMode() {
        Settings.HIDE_STATUS_BAR_IN_LIVE.save(true);
        followFromTheMainActivity();
        ActivityController<LivePlayActivity> room = Robolectric.buildActivity(LivePlayActivity.class).create();
        LivePlayActivity live = room.get();
        WindowManager.LayoutParams attributes = live.getWindow().getAttributes();
        attributes.layoutInDisplayCutoutMode = WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_ALWAYS;
        live.getWindow().setAttributes(attributes);
        room.start().resume().visible();
        assertTrue("the room's bar wasn't hidden", LiveStatusBar.isHidden(live));
        assertEquals("ALWAYS was narrowed", WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_ALWAYS,
                live.getWindow().getAttributes().layoutInDisplayCutoutMode);
        room.pause();
        assertEquals(WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_ALWAYS,
                live.getWindow().getAttributes().layoutInDisplayCutoutMode);
        room.stop().destroy();
    }

    @Test public void theSwitchOffOrAnotherScreenLeavesTheBarAlone() {
        followFromTheMainActivity();
        ActivityController<LivePlayActivity> room = Robolectric.buildActivity(LivePlayActivity.class).setup();
        assertFalse("hidden with the switch off", LiveStatusBar.isHidden(room.get()));
        room.pause().stop().destroy();

        Settings.HIDE_STATUS_BAR_IN_LIVE.save(true);
        ActivityController<Activity> other = Robolectric.buildActivity(Activity.class).setup();
        assertFalse("a screen that isn't a LIVE room was touched", LiveStatusBar.isHidden(other.get()));
        other.pause().stop().destroy();
    }

    /**
     * On the S22 the bar hid and a black strip stayed: TikTok's room sits a status bar lower than
     * its container and keeps that offset with the bar gone. The shape is 47.1.3's: AppCompat's
     * empty full-screen frame comes first, TikTok's room container second, and the room inside it
     * is held down by a top margin under a full-size layer that starts at the top. A first build
     * followed only the first full-screen child and never reached the room.
     */
    @Test public void theStripKeptForTheBarGoesWhileTheRoomIsInFront() {
        Settings.HIDE_STATUS_BAR_IN_LIVE.save(true);
        followFromTheMainActivity();
        int bar = platformBar();
        ActivityController<LivePlayActivity> room = Robolectric.buildActivity(LivePlayActivity.class).create();
        LivePlayActivity live = room.get();
        FrameLayout root = new FrameLayout(live);
        FrameLayout appCompat = new FrameLayout(live);
        appCompat.addView(new FrameLayout(live), new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        root.addView(appCompat, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        FrameLayout container = new FrameLayout(live);
        root.addView(container, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        FrameLayout stream = new FrameLayout(live);
        FrameLayout.LayoutParams held = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
        held.topMargin = bar;
        held.bottomMargin = 135;
        container.addView(stream, held);
        container.addView(new FrameLayout(live), new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        live.setContentView(root);
        room.start().resume().visible();

        layOut(live);
        assertEquals("the strip stayed", 0, topMargin(stream));
        assertEquals("the bottom was touched", 135, ((ViewGroup.MarginLayoutParams) stream.getLayoutParams()).bottomMargin);

        // TikTok setting its offset again on a relayout of its own gets the same answer.
        held.topMargin = bar;
        stream.setLayoutParams(held);
        layOut(live);
        assertEquals("the strip came back on a relayout", 0, topMargin(stream));

        room.pause();
        assertEquals("leaving didn't give the strip back", bar, topMargin(stream));
        layOut(live);
        assertEquals("a layout after leaving took it again", bar, topMargin(stream));

        room.resume();
        layOut(live);
        assertEquals("coming back kept the strip", 0, topMargin(stream));
        room.pause().stop().destroy();
    }

    /**
     * The same strip as a container's own padding, under an outer padding of another height that
     * has to stay; the lifted container keeps its other three sides.
     */
    @Test public void aPaddedContainerLosesOnlyTheBarsHeight() {
        Settings.HIDE_STATUS_BAR_IN_LIVE.save(true);
        followFromTheMainActivity();
        int bar = platformBar();
        ActivityController<LivePlayActivity> room = Robolectric.buildActivity(LivePlayActivity.class).create();
        LivePlayActivity live = room.get();
        FrameLayout outer = new FrameLayout(live);
        outer.setPadding(0, 3, 0, 0);
        FrameLayout container = new FrameLayout(live);
        container.setPadding(7, bar, 9, 135);
        outer.addView(container, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        live.setContentView(outer);
        room.start().resume().visible();

        layOut(live);
        assertEquals("a padding that isn't the bar's was taken", 3, outer.getPaddingTop());
        assertEquals("the strip stayed", 0, container.getPaddingTop());
        assertEquals(7, container.getPaddingLeft());
        assertEquals(9, container.getPaddingRight());
        assertEquals(135, container.getPaddingBottom());

        room.pause();
        assertEquals("leaving didn't give the strip back", bar, container.getPaddingTop());
        room.stop().destroy();
    }

    @Test public void withTheSwitchOffTheStripStays() {
        followFromTheMainActivity();
        int bar = platformBar();
        ActivityController<LivePlayActivity> room = Robolectric.buildActivity(LivePlayActivity.class).create();
        LivePlayActivity live = room.get();
        FrameLayout container = new FrameLayout(live);
        container.setPadding(0, bar, 0, 0);
        live.setContentView(container);
        room.start().resume().visible();
        layOut(live);
        assertEquals(bar, container.getPaddingTop());
        room.pause().stop().destroy();
    }

    private static int platformBar() {
        Resources system = Resources.getSystem();
        int bar = system.getDimensionPixelSize(system.getIdentifier("status_bar_height", "dimen", "android"));
        assertTrue("no platform status bar height to test with", bar > 0);
        return bar;
    }

    private static int topMargin(View view) {
        return ((ViewGroup.MarginLayoutParams) view.getLayoutParams()).topMargin;
    }

    private static void layOut(Activity activity) {
        View decor = activity.getWindow().getDecorView();
        decor.measure(View.MeasureSpec.makeMeasureSpec(1080, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(2316, View.MeasureSpec.EXACTLY));
        decor.layout(0, 0, 1080, 2316);
        decor.getViewTreeObserver().dispatchOnGlobalLayout();
    }

    private static void followFromTheMainActivity() {
        ActivityController<Activity> main = Robolectric.buildActivity(Activity.class).setup();
        LiveStatusBar.follow(main.get());
    }
}
