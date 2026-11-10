package app.morphe.extension.twitch.base;

import android.app.Activity;
import android.widget.LinearLayout;

/**
 * A block of settings contributed by a feature patch. The base SEYTTINGS
 * extension discovers implementations through reflection, so a section only
 * appears when the matching feature extension was merged into the app.
 */
public interface SeyttingsSection {

    /** Adds this section's views to the SEYTTINGS dialog. */
    void addTo(Activity activity, LinearLayout parent);
}
