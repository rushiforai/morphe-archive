package patches.maps.gearslip;

import android.graphics.Rect;
import android.view.View;
import android.view.ViewGroup;
import java.util.ArrayList;
import java.util.List;

/**
 * Where Maps' own car UI currently draws its boxes (buttons, turn card, alert and ETA cards,
 * recentre, speed limit and watermark), in the surface's pixels. Maps keeps its layout exactly as
 * Google draws it; a host that floats something over the map (DriveDeck's player) reads these and
 * places its piece in the space Maps leaves free. Read-only: nothing here moves a view.
 */
final class NativeOccupiedAreas {
    /** Maps 26.44 car groups by resource name; a group inside another listed group is not repeated. */
    static final String[] GROUPS = {
        "menu_frame_view", "one_bar_ellipsizing_container", "nav_card_view",
        "main_suggested_destinations_search_box", "destination_input_search_box", "car_search_box",
        "alert_cards_placeholder", "upcoming_rest_stop", "status_card_view",
        "one_bar_bottom_group", "zoom_widget_view", "recenter_button_container", "speed_limit_and_watermark_view",
    };
    static final int MAX_AREAS = 16;

    private NativeOccupiedAreas() {}

    /** The drawn boxes inside [root], in [root]'s pixels, top to bottom; empty groups are left out. */
    static List<Rect> of(ViewGroup root) {
        List<Rect> areas = new ArrayList<>();
        if (root == null || root.getWidth() <= 0 || root.getHeight() <= 0) return areas;
        List<View> taken = new ArrayList<>();
        for (String name : GROUPS) {
            for (View group : find(root, name)) {
                if (nested(group, taken, root)) continue;
                Rect content = content(group, root);
                if (content == null || !content.intersect(0, 0, root.getWidth(), root.getHeight())) continue;
                taken.add(group);
                areas.add(content);
                if (areas.size() == MAX_AREAS) return sorted(areas);
            }
        }
        return sorted(areas);
    }

    private static List<Rect> sorted(List<Rect> areas) {
        areas.sort((a, b) -> a.top != b.top ? Integer.compare(a.top, b.top) : Integer.compare(a.left, b.left));
        return areas;
    }

    /**
     * The union of the group's visible, non-empty leaf views, in [root]'s pixels (the surface's);
     * null when it draws nothing. Translations count: an animating card is reported where it is.
     */
    static Rect content(View group, View root) {
        if (!shown(group)) return null;
        Rect union = new Rect();
        collect(group, union);
        if (union.isEmpty()) return null;
        int[] origin = new int[2];
        root.getLocationInWindow(origin);
        union.offset(-origin[0], -origin[1]);
        return union;
    }

    private static void collect(View view, Rect union) {
        if (view.getVisibility() != View.VISIBLE || view.getAlpha() == 0f) return;
        if (view instanceof ViewGroup && ((ViewGroup) view).getChildCount() > 0) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) collect(group.getChildAt(i), union);
            return;
        }
        if (view.getWidth() <= 0 || view.getHeight() <= 0) return;
        int[] at = new int[2];
        view.getLocationInWindow(at);
        union.union(at[0], at[1], at[0] + view.getWidth(), at[1] + view.getHeight());
    }

    private static boolean shown(View view) {
        for (View node = view; node != null; node = node.getParent() instanceof View ? (View) node.getParent() : null)
            if (node.getVisibility() != View.VISIBLE) return false;
        return view.isAttachedToWindow();
    }

    private static boolean nested(View view, List<View> taken, View root) {
        for (View node = view.getParent() instanceof View ? (View) view.getParent() : null; node != null && node != root;
                node = node.getParent() instanceof View ? (View) node.getParent() : null)
            if (taken.contains(node)) return true;
        return false;
    }

    private static List<View> find(View view, String name) {
        List<View> found = new ArrayList<>();
        find(view, name, found);
        return found;
    }

    private static void find(View view, String name, List<View> found) {
        if (name.equals(name(view))) { found.add(view); return; }
        if (view instanceof ViewGroup) for (int i = 0; i < ((ViewGroup) view).getChildCount(); i++) find(((ViewGroup) view).getChildAt(i), name, found);
    }

    /** The deepest visible view under a point, as "Class#resource-name", for diagnostics. */
    static String describe(View root, float x, float y) {
        View hit = null;
        java.util.ArrayDeque<View> pending = new java.util.ArrayDeque<>();
        pending.add(root);
        int[] at = new int[2], origin = new int[2];
        root.getLocationInWindow(origin);
        while (!pending.isEmpty()) {
            View view = pending.removeFirst();
            if (view.getVisibility() != View.VISIBLE) continue;
            view.getLocationInWindow(at);
            float left = at[0] - origin[0], top = at[1] - origin[1];
            if (x < left || y < top || x >= left + view.getWidth() || y >= top + view.getHeight()) continue;
            hit = view;
            if (view instanceof ViewGroup) for (int i = 0; i < ((ViewGroup) view).getChildCount(); i++) pending.add(((ViewGroup) view).getChildAt(i));
        }
        if (hit == null) return "nothing";
        String name = name(hit);
        return hit.getClass().getSimpleName() + (name == null ? "" : "#" + name);
    }

    static String name(View view) {
        int id = view.getId();
        if (id == View.NO_ID || (id >>> 24) == 0) return null;
        try { return view.getResources().getResourceEntryName(id); } catch (RuntimeException unnamed) { return null; }
    }
}
