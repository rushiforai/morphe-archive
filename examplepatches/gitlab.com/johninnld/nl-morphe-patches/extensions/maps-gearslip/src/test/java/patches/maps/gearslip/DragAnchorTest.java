package patches.maps.gearslip;

import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;
import android.app.Activity;
import android.os.Looper;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.ScrollView;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

/** The Car App Library reports a drag only as distances; this chooses where Maps feels it begin. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 32)
public final class DragAnchorTest {
    private FrameLayout root;
    private ScrollView list;

    @Before public void scene() {
        Activity activity = Robolectric.buildActivity(Activity.class).setup().get();
        root = new FrameLayout(activity);
        list = new ScrollView(activity);
        View rows = new View(activity); rows.setMinimumHeight(1000);
        list.addView(rows, new FrameLayout.LayoutParams(420, 1000));
        FrameLayout.LayoutParams panel = new FrameLayout.LayoutParams(420, 300);
        panel.leftMargin = 84; panel.topMargin = 16;
        root.addView(list, panel);
        activity.setContentView(root, new FrameLayout.LayoutParams(1216, 480));
        shadowOf(Looper.getMainLooper()).idle();
    }

    @Test public void aVerticalDragOverAScrollableMapsListScrollsThatList() {
        assertTrue(list.canScrollVertically(1));
        float[] anchor = ProjectionRenderer.dragAnchor(root, 0, 30, 1216, 480);
        assertTrue("Starts inside the list, not on the map: " + anchor[0], anchor[0] > 84 && anchor[0] < 504);
        assertEquals(166f, anchor[1], 1f);
    }

    @Test public void aSidewaysDragOrNoListPansTheMap() {
        assertArrayEquals(new float[]{608f, 240f}, ProjectionRenderer.dragAnchor(root, 40, 5, 1216, 480), 0f);
        list.setVisibility(View.GONE);
        assertArrayEquals(new float[]{608f, 240f}, ProjectionRenderer.dragAnchor(root, 0, 30, 1216, 480), 0f);
        assertArrayEquals(new float[]{608f, 240f}, ProjectionRenderer.dragAnchor(null, 0, 30, 1216, 480), 0f);
    }

    /** Stands in for Maps' paged CarRecyclerView, which does not report itself as scrollable. */
    public static final class PagedCarRecyclerView extends FrameLayout {
        public PagedCarRecyclerView(android.content.Context context) { super(context); }
    }

    @Test public void aPagedCarListThatDoesNotReportScrollingStillGetsTheDrag() {
        list.setVisibility(View.GONE);
        PagedCarRecyclerView paged = new PagedCarRecyclerView(root.getContext());
        FrameLayout.LayoutParams panel = new FrameLayout.LayoutParams(396, 334);
        panel.leftMargin = 16; panel.topMargin = 98;
        root.addView(paged, panel);
        shadowOf(Looper.getMainLooper()).idle();
        assertFalse(paged.canScrollVertically(1));
        float[] anchor = ProjectionRenderer.dragAnchor(root, 0, 30, 1216, 480);
        assertTrue("Starts inside the paged list: " + anchor[0] + "," + anchor[1], anchor[0] > 16 && anchor[0] < 412 && anchor[1] > 98 && anchor[1] < 432);
    }

    @Test public void theListOnTopWinsOverALargerOneHiddenBehindIt() {
        PagedCarRecyclerView front = new PagedCarRecyclerView(root.getContext());
        FrameLayout.LayoutParams small = new FrameLayout.LayoutParams(200, 120);
        small.leftMargin = 150; small.topMargin = 60;
        root.addView(front, small);
        shadowOf(Looper.getMainLooper()).idle();
        assertSame(front, ProjectionRenderer.topList(root));
    }

    @Test public void theDiagnosticNamesTheViewUnderTheDragStart() {
        assertEquals("View", NativeOccupiedAreas.describe(root, 294, 166));
        assertEquals("FrameLayout", NativeOccupiedAreas.describe(root, 1000, 400));
    }
}
