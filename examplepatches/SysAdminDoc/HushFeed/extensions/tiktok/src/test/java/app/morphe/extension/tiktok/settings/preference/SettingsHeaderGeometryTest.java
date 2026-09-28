package app.morphe.extension.tiktok.settings.preference;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.graphics.Rect;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.FrameLayout;
import android.widget.LinearLayout;

import app.morphe.extension.shared.Utils;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

/**
 * The page header's Back control keeps a whole 48 dp square: drawn, touchable and read out.
 *
 * <p>It used to sit 8 dp outside the toolbar on a negative margin, which the toolbar clipped, so
 * the S25's accessibility tree read it as 40 by 48 dp and the clipped strip took no touches. The
 * arrow and the title stay where they were: flush with the header's start edge and 8 dp in.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 34, qualifiers = "w360dp-h800dp-mdpi")
public class SettingsHeaderGeometryTest {
    @Test public void leftToRight() {
        assertWholeTarget(View.LAYOUT_DIRECTION_LTR);
    }

    @Test public void rightToLeft() {
        assertWholeTarget(View.LAYOUT_DIRECTION_RTL);
    }

    @Test @Config(fontScale = 2.0f)
    public void atTwiceTheTextSize() {
        assertWholeTarget(View.LAYOUT_DIRECTION_LTR);
    }

    @Test @Config(qualifiers = "night")
    public void inTheDarkTheme() {
        assertWholeTarget(View.LAYOUT_DIRECTION_LTR);
    }

    private static void assertWholeTarget(int direction) {
        try (var owner = Robolectric.buildActivity(Activity.class).setup().visible()) {
            Activity activity = owner.get();
            Utils.setContext(activity);
            int gutter = SettingsUi.dp(activity, 16);
            FrameLayout page = new FrameLayout(activity);
            page.setPadding(gutter, 0, gutter, 0);
            LinearLayout header = SettingsHeaderPreference.createHeader(activity, "Comments", () -> { });
            page.addView(header, new FrameLayout.LayoutParams(-1, -2));
            if (direction == View.LAYOUT_DIRECTION_RTL) setDirection(page, direction);
            activity.setContentView(page);
            View root = activity.findViewById(android.R.id.content);
            root.measure(View.MeasureSpec.makeMeasureSpec(SettingsUi.dp(activity, 360), View.MeasureSpec.EXACTLY),
                    View.MeasureSpec.makeMeasureSpec(SettingsUi.dp(activity, 800), View.MeasureSpec.EXACTLY));
            root.layout(0, 0, root.getMeasuredWidth(), root.getMeasuredHeight());

            assertEquals("the fixture is not laid out in the direction it names",
                    direction, header.getLayoutDirection());
            ViewGroup toolbar = header.findViewWithTag("hushfeed_toolbar");
            assertNotNull(toolbar);
            View back = toolbar.getChildAt(0);
            int target = SettingsUi.dp(activity, 48);

            // Nothing between the control and the page reaches past its parent's edges, which is
            // what a clipping parent would cut off.
            for (View view = back; view != page; view = (View) view.getParent()) {
                View parent = (View) view.getParent();
                assertTrue(describe(view) + " starts before its parent", view.getLeft() >= 0);
                assertTrue(describe(view) + " ends past its parent", view.getRight() <= parent.getWidth());
            }

            Rect visible = new Rect();
            assertTrue("the Back control is not on screen at all", back.getGlobalVisibleRect(visible));
            assertTrue("the visible Back control is " + visible.width() + " by " + visible.height()
                            + " px, under " + target,
                    visible.width() >= target && visible.height() >= target);

            AccessibilityNodeInfo node = back.createAccessibilityNodeInfo();
            Rect bounds = new Rect();
            node.getBoundsInScreen(bounds);
            assertTrue("a screen reader is handed a Back control of " + bounds.width() + " by "
                            + bounds.height() + " px, under " + target,
                    bounds.width() >= target && bounds.height() >= target);

            // Where the arrow and the title were: the control flush with the header's start
            // edge, the title 8 dp in from it.
            View title = header.findViewWithTag("hushfeed_page_title");
            int inset = SettingsUi.dp(activity, 8);
            if (direction == View.LAYOUT_DIRECTION_RTL) {
                assertEquals("the Back control left the header's start edge",
                        header.getWidth(), toolbar.getLeft() + back.getRight());
                assertEquals("the title moved", header.getWidth() - inset, title.getRight());
            } else {
                assertEquals("the Back control left the header's start edge", 0, toolbar.getLeft() + back.getLeft());
                assertEquals("the title moved", inset, title.getLeft());
            }
        }
    }

    /**
     * Every view in the tree told the direction, the way SettingsPagesTest turns its pages round:
     * a hand-built fixture here doesn't take it from the configuration or reliably from a parent.
     */
    private static void setDirection(View view, int direction) {
        view.setLayoutDirection(direction);
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) setDirection(group.getChildAt(i), direction);
        }
    }

    private static String describe(View view) {
        Object tag = view.getTag();
        return tag == null ? view.getClass().getSimpleName() : String.valueOf(tag);
    }
}
