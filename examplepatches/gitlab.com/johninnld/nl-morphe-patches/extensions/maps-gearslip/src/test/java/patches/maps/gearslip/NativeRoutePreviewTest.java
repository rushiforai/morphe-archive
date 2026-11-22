package patches.maps.gearslip;

import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;
import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.Resources;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.TextView;
import java.util.ArrayList;
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
public final class NativeRoutePreviewTest {
    private static final int START_STRING = 0x7f990001;
    private static final String WIDE = NativeRoutePreview.START_NAMES[0], NARROW = NativeRoutePreview.START_NAMES[1];
    private final Map<Integer, String> names = new HashMap<>();
    private final List<View> clicked = new ArrayList<>();
    /** What Maps' CAR_START_NAVIGATION string reads in the car window's language; null when Maps has none. */
    private String startString = "Start";
    private Context context;
    private FrameLayout root;
    private int nextId = 0x7f990300;

    /** Maps 26.44's car window: a surface-sized root whose views are named, with Maps' own string table. */
    @Before public void scene() {
        Activity activity = Robolectric.buildActivity(Activity.class).setup().get();
        Resources original = activity.getResources();
        Resources resources = new Resources(activity.getAssets(), original.getDisplayMetrics(), original.getConfiguration()) {
            @Override public String getResourceEntryName(int id) { return names.containsKey(id) ? names.get(id) : super.getResourceEntryName(id); }
            @Override public int getIdentifier(String name, String type, String packageName) {
                if (NativeRoutePreview.START_LABEL.equals(name) && "string".equals(type) && activity.getPackageName().equals(packageName))
                    return startString == null ? 0 : START_STRING;
                return super.getIdentifier(name, type, packageName);
            }
            @Override public String getString(int id) { return id == START_STRING ? startString : super.getString(id); }
        };
        context = new ContextWrapper(activity) { @Override public Resources getResources() { return resources; } };
        root = new FrameLayout(context);
        activity.setContentView(root, new FrameLayout.LayoutParams(1216, 480));
    }

    private void layout() { root.requestLayout(); shadowOf(Looper.getMainLooper()).idle(); }

    private <V extends View> V named(V view, String name) {
        view.setId(nextId); names.put(nextId++, name);
        return view;
    }

    /** The wide footer's button as Maps builds it: a clickable frame (named) around a labelled text. */
    private FrameLayout button(ViewGroup parent, String name, CharSequence label, boolean withClickHandler) {
        FrameLayout frame = named(new FrameLayout(context), name);
        if (withClickHandler) frame.setOnClickListener(clicked::add);
        TextView text = new TextView(context);
        text.setText(label);
        frame.addView(text, new FrameLayout.LayoutParams(200, 60));
        parent.addView(frame, new FrameLayout.LayoutParams(300, 80));
        return frame;
    }

    private FrameLayout button(String name, CharSequence label) { return button(root, name, label, true); }

    @Test public void theNamesAreMapsFooterButtonsForTheWideAndTheNarrowLayout() {
        assertArrayEquals(new String[]{"place_details_navigation_footer_action_button", "place_details_navigation_footer_spinner_or_action_icon"},
                NativeRoutePreview.START_NAMES);
    }

    @Test public void aShownEnabledLabelledStartButtonIsFound() {
        FrameLayout start = button(WIDE, "Start");
        layout();
        assertSame(start, NativeRoutePreview.find(root));
    }

    @Test public void theNarrowLayoutsIconButtonIsLabelledByItsContentDescription() {
        FrameLayout frame = named(new FrameLayout(context), NARROW);
        ImageView icon = new ImageView(context);
        icon.setContentDescription("Start");
        frame.addView(icon, new FrameLayout.LayoutParams(48, 48));
        root.addView(frame, new FrameLayout.LayoutParams(80, 80));
        layout();
        assertSame(frame, NativeRoutePreview.find(root));
    }

    @Test public void theStartLabelIsMapsStringInTheCarWindowsLanguage() {
        startString = "Starten";
        FrameLayout dutch = button(WIDE, "Starten");
        layout();
        assertSame(dutch, NativeRoutePreview.find(root));
        startString = "Start";
        assertNull("An English car window does not read Starten as Start", NativeRoutePreview.find(root));
    }

    @Test public void theSameFooterWithAnotherActionIsNotStart() {
        for (String label : new String[]{"Add stop", "Continue", "Retry", "Loading…", "Select stop", "Replace stop", ""}) {
            root.removeAllViews();
            button(WIDE, label);
            layout();
            assertNull("'" + label + "' is not Start", NativeRoutePreview.find(root));
        }
    }

    @Test public void withoutMapsStartStringNothingIsStart() {
        startString = null;
        button(WIDE, "Start");
        layout();
        assertNull(NativeRoutePreview.find(root));
    }

    @Test public void aViewWithAnotherNameIsNotStart() {
        button("start_navigation_action_button", "Start");
        button("place_details_navigation_footer_action_icon", "Start");
        button("prenav_route_overview_navigate_button", "Start");
        layout();
        assertNull(NativeRoutePreview.find(root));
    }

    @Test public void aHiddenOrTransparentStartIsNotFound() {
        FrameLayout start = button(WIDE, "Start");
        layout();
        for (int visibility : new int[]{View.INVISIBLE, View.GONE}) {
            start.setVisibility(visibility);
            layout();
            assertNull(NativeRoutePreview.find(root));
        }
        start.setVisibility(View.VISIBLE);
        start.setAlpha(0f);
        assertNull(NativeRoutePreview.find(root));
        start.setAlpha(1f);
        assertSame(start, NativeRoutePreview.find(root));
    }

    @Test public void aStartUnderAHiddenOrTransparentAncestorIsNotFound() {
        FrameLayout card = new FrameLayout(context);
        root.addView(card, new FrameLayout.LayoutParams(400, 200));
        FrameLayout start = button(card, WIDE, "Start", true);
        layout();
        assertSame(start, NativeRoutePreview.find(root));
        card.setVisibility(View.INVISIBLE);
        assertNull(NativeRoutePreview.find(root));
        card.setVisibility(View.VISIBLE);
        card.setAlpha(0f);
        assertNull("A card faded out is not on the screen", NativeRoutePreview.find(root));
    }

    @Test public void aDetachedStartIsNotFound() {
        FrameLayout start = button(WIDE, "Start");
        layout();
        root.removeView(start);
        assertNull(NativeRoutePreview.find(root));
        assertNull("Not attached to the window, though still laid out", NativeRoutePreview.find(start));
    }

    @Test public void aDisabledStartIsNotFound() {
        FrameLayout start = button(WIDE, "Start");
        layout();
        start.setEnabled(false);
        assertNull("Maps disables the button while it loads", NativeRoutePreview.find(root));
        start.setEnabled(true);
        assertSame(start, NativeRoutePreview.find(root));
    }

    @Test public void aStartWithoutASizeIsNotFound() {
        FrameLayout start = named(new FrameLayout(context), WIDE);
        TextView text = new TextView(context);
        text.setText("Start");
        start.addView(text);
        root.addView(start, new FrameLayout.LayoutParams(0, 0));
        layout();
        assertNull(NativeRoutePreview.find(root));
    }

    @Test public void thereIsNothingToFindWithoutAWindow() {
        assertNull(NativeRoutePreview.find(null));
        assertNull(NativeRoutePreview.start(null));
        assertFalse(NativeRoutePreview.shown(null, false));
    }

    @Test public void startClicksExactlyThatViewAndNothingAtAPosition() {
        View other = button("place_details_navigation_footer_status_message", "Start");
        FrameLayout start = button(WIDE, "Start");
        layout();
        assertSame(start, NativeRoutePreview.start(root));
        assertEquals(java.util.Collections.singletonList(start), clicked);
        assertNotSame(other, clicked.get(0));
    }

    @Test public void startWithoutAStartViewClicksNothing() {
        button(WIDE, "Add stop");
        button("route_select_navigation_icon", "Start");
        layout();
        assertNull(NativeRoutePreview.start(root));
        assertTrue(clicked.isEmpty());
    }

    @Test public void aStartThatTakesNoClickIsNotReportedAsPressed() {
        FrameLayout start = button(root, WIDE, "Start", false);
        layout();
        assertSame("It is the Start view, and shown", start, NativeRoutePreview.find(root));
        assertNull(NativeRoutePreview.start(root));
        assertTrue(clicked.isEmpty());
    }

    @Test public void theRoutePreviewIsShownOnlyWhileStartIsUpAndGuidanceIsNot() {
        assertFalse("No Start view", NativeRoutePreview.shown(root, false));
        FrameLayout start = button(WIDE, "Start");
        layout();
        assertTrue(NativeRoutePreview.shown(root, false));
        assertFalse("Guidance running means the preview is over, whatever is still drawn", NativeRoutePreview.shown(root, true));
        start.setEnabled(false);
        assertFalse(NativeRoutePreview.shown(root, false));
    }
}
