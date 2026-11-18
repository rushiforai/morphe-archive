package patches.maps.gearslip;

import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;
import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.Resources;
import android.graphics.Rect;
import android.os.Looper;
import android.view.View;
import android.widget.FrameLayout;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 32)
public final class NativeOccupiedAreasTest {
    private final Map<Integer, String> names = new HashMap<>();
    private Context context;
    private FrameLayout root;
    private int nextId = 0x7f990200;

    /** Maps 26.44's guidance layout on a 1216x480 surface (positions from its real view tree). */
    @Before public void scene() {
        Activity activity = Robolectric.buildActivity(Activity.class).setup().get();
        Resources original = activity.getResources();
        Resources resources = new Resources(activity.getAssets(), original.getDisplayMetrics(), original.getConfiguration()) {
            @Override public String getResourceEntryName(int id) { return names.containsKey(id) ? names.get(id) : super.getResourceEntryName(id); }
        };
        context = new ContextWrapper(activity) { @Override public Resources getResources() { return resources; } };
        root = new FrameLayout(context);
        activity.setContentView(root, new FrameLayout.LayoutParams(1216, 480));
    }

    private FrameLayout group(FrameLayout parent, String name, int x, int y, int width, int height) {
        FrameLayout group = new FrameLayout(context);
        group.setId(nextId); names.put(nextId++, name);
        group.addView(new View(context), new FrameLayout.LayoutParams(width, height));
        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(width, height);
        params.leftMargin = x; params.topMargin = y;
        parent.addView(group, params);
        return group;
    }

    private void layout() { root.requestLayout(); shadowOf(Looper.getMainLooper()).idle(); }

    @Test public void mapsBoxesAreReportedWhereTheyAreDrawnTopToBottom() {
        group(root, "status_card_view", 84, 294, 420, 150);
        group(root, "one_bar_ellipsizing_container", 10, 12, 64, 192);
        group(root, "nav_card_view", 84, 16, 420, 88);
        group(root, "one_bar_bottom_group", 13, 318, 58, 126);
        group(root, "speed_limit_and_watermark_view", 1080, 402, 110, 58);
        layout();
        assertEquals(Arrays.asList(new Rect(10, 12, 74, 204), new Rect(84, 16, 504, 104), new Rect(84, 294, 504, 444),
                new Rect(13, 318, 71, 444), new Rect(1080, 402, 1190, 460)), NativeOccupiedAreas.of(root));
    }

    @Test public void anAlertAboveTheEtaCardIsItsOwnBoxAndHiddenOrEmptyGroupsAreLeftOut() {
        group(root, "alert_cards_placeholder", 84, 230, 420, 64);
        group(root, "status_card_view", 84, 294, 420, 150);
        group(root, "recenter_button_container", 520, 444, 0, 0);
        group(root, "zoom_widget_view", 13, 318, 58, 126).setVisibility(View.INVISIBLE);
        layout();
        assertEquals(Arrays.asList(new Rect(84, 230, 504, 294), new Rect(84, 294, 504, 444)), NativeOccupiedAreas.of(root));
    }

    @Test public void aBoxInsideAnotherListedBoxIsNotRepeatedAndTranslationsCount() {
        FrameLayout panel = group(root, "menu_frame_view", 84, 16, 420, 428);
        group(panel, "car_search_box", 0, 0, 400, 56);
        FrameLayout eta = group(root, "status_card_view", 84, 294, 420, 150);
        layout();
        eta.setTranslationY(40);
        List<Rect> areas = NativeOccupiedAreas.of(root);
        assertEquals(2, areas.size());
        assertEquals("An animating card is reported where it is drawn, clipped to the screen", new Rect(84, 334, 504, 480), areas.get(1));
    }
}
