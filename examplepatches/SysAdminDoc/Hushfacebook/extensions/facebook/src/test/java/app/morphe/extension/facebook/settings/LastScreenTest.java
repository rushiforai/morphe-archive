/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.content.Context;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;

import org.junit.After;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.android.controller.ActivityController;

import java.util.List;

/**
 * The [LAST SCREEN LEFT] report section (#18): the views under two points at the right edge of the
 * last Facebook screen that paused, by class and resource name, top view first where views overlap,
 * and nothing the screen says.
 */
@RunWith(RobolectricTestRunner.class)
public class LastScreenTest {
    private static final int WIDTH = 1000, HEIGHT = 2000;

    @After
    public void forget() {
        LastScreen.clearForTests();
    }

    /** A reel-like screen: a pager page with a button column at the right edge, a label on each button. */
    private static final class Screen {
        final FrameLayout root;

        Screen(Context context) {
            root = new FrameLayout(context);
            root.setId(android.R.id.content);
            FrameLayout page = new FrameLayout(context);
            FrameLayout inner = new FrameLayout(context);
            page.addView(inner, new FrameLayout.LayoutParams(WIDTH, HEIGHT));
            LinearLayout column = new LinearLayout(context);
            column.setOrientation(LinearLayout.VERTICAL);
            column.setId(View.generateViewId());
            ImageView like = new ImageView(context);
            like.setContentDescription("Like, 496K reactions");
            column.addView(like, new LinearLayout.LayoutParams(140, 1400));
            FrameLayout.LayoutParams at = new FrameLayout.LayoutParams(140, 1400);
            at.leftMargin = 860;
            at.topMargin = 600;
            inner.addView(column, at);
            root.addView(page, new FrameLayout.LayoutParams(WIDTH, HEIGHT));
            // Drawn last, so on top, but invisible: the path has to pass it by.
            View hiddenOverlay = new FrameLayout(context);
            hiddenOverlay.setVisibility(View.INVISIBLE);
            root.addView(hiddenOverlay, new FrameLayout.LayoutParams(WIDTH, HEIGHT));
            layOut(root);
        }
    }

    private static void layOut(View root) {
        root.measure(View.MeasureSpec.makeMeasureSpec(WIDTH, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(HEIGHT, View.MeasureSpec.EXACTLY));
        root.layout(0, 0, WIDTH, HEIGHT);
    }

    @Test
    public void bothPointsFollowTheTopVisibleViewDownToTheButton() {
        Screen screen = new Screen(RuntimeEnvironment.getApplication());

        List<String> lines = LastScreen.describe(screen.root);

        String expected = "FrameLayout#content > FrameLayout x2 > LinearLayout > ImageView (5 views)";
        assertEquals(List.of("right edge 55% down: " + expected, "right edge 70% down: " + expected), lines);
    }

    @Test
    public void nothingTheScreenSaysGoesIn() {
        Screen screen = new Screen(RuntimeEnvironment.getApplication());

        String report = String.join("\n", LastScreen.describe(screen.root));

        assertFalse(report, report.contains("Like"));
        assertFalse(report, report.contains("496K"));
    }

    @Test
    public void theTopOfTwoOverlappingViewsIsTheOneFollowed() {
        Context context = RuntimeEnvironment.getApplication();
        Screen screen = new Screen(context);
        screen.root.addView(new ImageView(context), new FrameLayout.LayoutParams(WIDTH, HEIGHT));
        layOut(screen.root);

        assertEquals(List.of("FrameLayout#content > ImageView (2 views)"),
                LastScreen.walks(screen.root, WIDTH * LastScreen.ACROSS, HEIGHT * 0.55f));
    }

    @Test
    public void whereNoChildHoldsThePointTheChildrenAreNamedWithTheirState() {
        Screen screen = new Screen(RuntimeEnvironment.getApplication());

        assertEquals(List.of("FrameLayout#content > FrameLayout x2 (3 views); nothing at 100,1100 among its 1 children: "
                        + "LinearLayout shown [860,600 140x1400]"),
                LastScreen.walks(screen.root, 100, HEIGHT * 0.55f));
    }

    /** 580's feed: an empty frame over the whole window, holding one gone view, on top of the reel. */
    @Test
    public void anEmptyLayerOnTopIsWrittenThenTheWalkGoesOnUnderIt() {
        Context context = RuntimeEnvironment.getApplication();
        Screen screen = new Screen(context);
        FrameLayout emptyLayer = new FrameLayout(context);
        View placeholder = new View(context);
        placeholder.setVisibility(View.GONE);
        emptyLayer.addView(placeholder);
        screen.root.addView(emptyLayer, new FrameLayout.LayoutParams(WIDTH, HEIGHT));
        layOut(screen.root);

        List<String> lines = LastScreen.describe(screen.root);

        assertEquals(List.of(
                "right edge 55% down: FrameLayout#content > FrameLayout (2 views); "
                        + "nothing at 920,1100 among its 1 children: View gone [0,0 0x0]",
                "right edge 55% down, under that: FrameLayout#content > FrameLayout x2 > LinearLayout > ImageView (5 views)",
                "right edge 70% down: FrameLayout#content > FrameLayout (2 views); "
                        + "nothing at 920,1400 among its 1 children: View gone [0,0 0x0]",
                "right edge 70% down, under that: FrameLayout#content > FrameLayout x2 > LinearLayout > ImageView (5 views)"),
                lines);
    }

    /** A group with no children draws what's at the point itself, the way a Litho host can. */
    @Test
    public void aGroupWithNoChildrenEndsTheWalk() {
        Context context = RuntimeEnvironment.getApplication();
        Screen screen = new Screen(context);
        screen.root.addView(new FrameLayout(context), new FrameLayout.LayoutParams(WIDTH, HEIGHT));
        layOut(screen.root);

        assertEquals(List.of("FrameLayout#content > FrameLayout (2 views)"),
                LastScreen.walks(screen.root, WIDTH * LastScreen.ACROSS, HEIGHT * 0.55f));
    }

    @Test
    public void aStackOfEmptyLayersStopsAfterThreeWalks() {
        Context context = RuntimeEnvironment.getApplication();
        Screen screen = new Screen(context);
        for (int i = 0; i < 4; i++) {
            FrameLayout emptyLayer = new FrameLayout(context);
            View placeholder = new View(context);
            placeholder.setVisibility(View.GONE);
            emptyLayer.addView(placeholder);
            screen.root.addView(emptyLayer, new FrameLayout.LayoutParams(WIDTH, HEIGHT));
        }
        layOut(screen.root);

        List<String> walks = LastScreen.walks(screen.root, WIDTH * LastScreen.ACROSS, HEIGHT * 0.55f);

        assertEquals(walks.toString(), 3, walks.size());
        for (String walk : walks) assertTrue(walk, walk.startsWith("FrameLayout#content > FrameLayout (2 views); nothing"));
    }

    @Test
    public void aWindowNotLaidOutSaysSo() {
        assertEquals(List.of("not laid out"), LastScreen.describe(new FrameLayout(RuntimeEnvironment.getApplication())));
    }

    @Test
    public void nothingIsReportedBeforeAScreenHasPaused() {
        assertTrue(LastScreen.REPORT.lines().isEmpty());
        assertTrue(LastScreen.REPORT.isAppState());
    }

    @Test
    public void aPausingActivityIsReadWithHowLongAgoItWasLeft() {
        ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup();
        View decor = controller.get().getWindow().getDecorView();
        layOut(decor);

        LastScreen.read(controller.get());
        List<String> lines = LastScreen.report(SystemClock.elapsedRealtime() + 42_500);

        assertEquals("screen: Activity, left 42 s before this report", lines.get(0));
        assertEquals(3, lines.size());
        assertTrue(lines.toString(), lines.get(1).startsWith("right edge 55% down: DecorView"));
    }

    @Test
    public void theSettingsEntryReadsEachFacebookScreenAsItPauses() {
        ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup();
        layOut(controller.get().getWindow().getDecorView());

        new SettingsEntry.OpenWhenResumed().onActivityPaused(controller.get());

        assertEquals("screen: Activity, left 0 s before this report",
                LastScreen.report(SystemClock.elapsedRealtime()).get(0));
    }

    @Test
    public void aViewWhoseIdIsNoResourceKeepsJustItsClass() {
        ViewGroup group = new FrameLayout(RuntimeEnvironment.getApplication());
        group.setId(View.generateViewId());

        assertEquals("FrameLayout", LastScreen.name(group));
    }
}
