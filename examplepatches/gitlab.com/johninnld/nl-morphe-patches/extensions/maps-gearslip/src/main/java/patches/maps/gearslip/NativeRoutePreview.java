package patches.maps.gearslip;

import android.content.res.Resources;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

/**
 * Maps' own Start control on its car route preview, found by resource entry name in the live car
 * window. The host cannot press it (Maps draws it into the surface), so a host that asks gets the
 * same {@link View#performClick()} the driver's tap ends in. Never a touch at a position.
 *
 * <p>Maps 26.44.06 draws one footer under the destination card for several actions. The same two
 * views carry "Loading", "Retry", "Add stop", "Select stop", "Replace stop", "Continue" and "Start",
 * only the label differs, so a view counts as Start only while it is labelled with Maps' own
 * {@value #START_LABEL} string, in the language the car window was built with.
 *
 * <p>Read and clicked on the main thread, like every other access to the car window.
 */
final class NativeRoutePreview {
    /**
     * Resource entry names of the clickable footer views that carry the Start action, in Maps
     * 26.44.06 (see docs/research/2026-11-22-maps-start-guidance-design.md, section 1). The wide
     * layout draws the first (a text button), the narrow one the second (an icon button); either
     * runs the same primary action. The patch refuses a Maps whose footer builder does not use
     * the ids of exactly these names; keep this list and that check together.
     */
    static final String[] START_NAMES = {
        "place_details_navigation_footer_action_button",
        "place_details_navigation_footer_spinner_or_action_icon",
    };
    /** Maps' string resource for the Start label; the footer shows it while its action is Start. */
    static final String START_LABEL = "CAR_START_NAVIGATION";

    private NativeRoutePreview() {}

    /**
     * The Start view, or null: attached, shown (itself and every ancestor visible and not fully
     * transparent, with a size), enabled, and labelled as Start.
     */
    static View find(View decor) {
        if (decor == null) return null;
        for (String name : START_NAMES)
            for (View view : NativeOccupiedAreas.find(decor, name))
                if (usable(view) && labelledStart(view)) return view;
        return null;
    }

    /** Whether the route preview is up: a Start view is there and guidance is not running. */
    static boolean shown(View decor, boolean guiding) {
        return !guiding && find(decor) != null;
    }

    /**
     * Presses Start. The view that took the click, or null when there is no Start view or it did
     * not handle the click (no click handler).
     */
    static View start(View decor) {
        View start = find(decor);
        return start != null && start.performClick() ? start : null;
    }

    private static boolean usable(View view) {
        if (!view.isAttachedToWindow() || !view.isEnabled() || view.getWidth() <= 0 || view.getHeight() <= 0) return false;
        for (View node = view; node != null; node = node.getParent() instanceof View ? (View) node.getParent() : null)
            if (node.getVisibility() != View.VISIBLE || node.getAlpha() <= 0f) return false;
        return true;
    }

    /** Whether the view, or a visible view inside it, shows the Start label as its text or description. */
    private static boolean labelledStart(View view) {
        String label = startLabel(view);
        return label != null && carries(view, label);
    }

    /**
     * Maps' Start string as the car window's own resources spell it. Read through the view, not the
     * service, because the host's configuration (language) belongs to the car window. Null when
     * Maps has no such string: then nothing is Start, rather than a guess.
     */
    static String startLabel(View view) {
        try {
            Resources resources = view.getResources();
            int id = resources.getIdentifier(START_LABEL, "string", view.getContext().getPackageName());
            return id == 0 ? null : resources.getString(id);
        } catch (RuntimeException unavailable) { return null; }
    }

    private static boolean carries(View view, String label) {
        if (view.getVisibility() != View.VISIBLE || view.getAlpha() <= 0f) return false;
        if (matches(view.getContentDescription(), label)) return true;
        if (view instanceof TextView && matches(((TextView) view).getText(), label)) return true;
        if (view instanceof ViewGroup)
            for (int i = 0; i < ((ViewGroup) view).getChildCount(); i++)
                if (carries(((ViewGroup) view).getChildAt(i), label)) return true;
        return false;
    }

    private static boolean matches(CharSequence text, String label) {
        return text != null && label.equals(text.toString().trim());
    }
}
