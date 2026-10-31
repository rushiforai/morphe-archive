package app.ratbanana.extension.gaminghub;

import android.view.View;
import android.view.ViewParent;

/**
 * Removes the gift icon in the home toolbar that opens the Events page.
 */
@SuppressWarnings("unused")
public final class EventsButton {

    private EventsButton() {
    }

    /**
     * Injection point.
     * <p>
     * Hides the container of the gift icon rather than the icon alone,
     * so the "new event" dot badge inside the same container is hidden too
     * and no empty touch target is left behind.
     *
     * @param eventIcon The gift icon of the home toolbar.
     */
    public static void hide(View eventIcon) {
        if (eventIcon == null) {
            return;
        }

        eventIcon.setVisibility(View.GONE);

        ViewParent container = eventIcon.getParent();
        if (container instanceof View) {
            ((View) container).setVisibility(View.GONE);
        }
    }
}
