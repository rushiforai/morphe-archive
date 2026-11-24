package app.morphe.extension.kicktv.homedestination;

import android.app.Activity;
import android.graphics.Typeface;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;

import app.morphe.extension.kicktv.base.MorpheSection;
import app.morphe.extension.kicktv.base.MorpheTheme;

/**
 * DEFAULT HOME DESTINATION section of the SEYTTINGS dialog. Discovered by the
 * base SEYTTINGS extension through reflection, so it only appears when the
 * DEFAULT HOME DESTINATION patch was applied.
 *
 * <p>The button cycles through Home, Categories, Live, Following and Settings.
 * The chosen destination is opened automatically when KICK starts.</p>
 */
public final class HomeDestinationSection implements MorpheSection {

    private static final String[] DESTINATIONS = {
            "Home", "Categories", "Live", "Following", "Settings"
    };

    @Override
    public void addTo(final Activity activity, LinearLayout container) {
        TextView header = new TextView(activity);
        header.setText("DEFAULT HOME DESTINATION");
        header.setTextColor(MorpheTheme.COLOR_ACCENT);
        header.setTextSize(13);
        header.setTypeface(Typeface.DEFAULT_BOLD);
        header.setPadding(0, MorpheTheme.dp(activity, 6), 0, MorpheTheme.dp(activity, 4));
        container.addView(header, MorpheTheme.matchWidth());

        final Button destButton = new Button(activity);
        destButton.setAllCaps(false);
        destButton.setTextSize(18);
        destButton.setTextColor(MorpheTheme.COLOR_ACCENT);
        MorpheTheme.makeFocusable(activity, destButton);
        container.addView(destButton, MorpheTheme.matchWidth());

        final TextView hint = new TextView(activity);
        hint.setText("Opens the chosen tab automatically when KICK starts. "
                + "Pick Home, Categories, Live, Following or Settings.");
        hint.setTextColor(MorpheTheme.COLOR_MUTED);
        hint.setTextSize(13);
        hint.setPadding(
                MorpheTheme.dp(activity, 10),
                MorpheTheme.dp(activity, 8),
                MorpheTheme.dp(activity, 10),
                MorpheTheme.dp(activity, 8));
        container.addView(hint, MorpheTheme.matchWidth());

        final Runnable updateState = () -> destButton.setText("Open on start: "
                + HomeDestinationPrefs.getHomeDestination());

        destButton.setOnClickListener(v -> {
            String current = HomeDestinationPrefs.getHomeDestination();
            int index = indexOf(current);
            int next = (index + 1) % DESTINATIONS.length;
            HomeDestinationPrefs.setHomeDestination(DESTINATIONS[next]);
            updateState.run();
        });

        updateState.run();
    }

    private static int indexOf(String destination) {
        for (int i = 0; i < DESTINATIONS.length; i++) {
            if (DESTINATIONS[i].equals(destination)) {
                return i;
            }
        }
        return 0;
    }
}
