package io.github.bakwudo.uyu.extension.settings;

import android.app.Activity;
import android.app.FragmentManager;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import io.github.bakwudo.uyu.extension.Utils;

/**
 * Adds an "uyu" row to the top of Twitch's settings screen. Tapping it shows the uyu settings
 * on top of Twitch's settings, inside the same SettingsActivity.
 */
@SuppressWarnings({"deprecation", "unused"})
public final class SettingsPatch {
    public static final String TITLE = "uyu";

    private static final String FRAGMENT_TAG = "uyu_settings";

    private SettingsPatch() {
    }

    /**
     * Injection point: return value of the settings screen's onCreateView. The screen is drawn
     * with Jetpack Compose, so the row is placed above it instead of inside its list.
     *
     * @param settingsView The view Twitch creates for its settings screen.
     * @return The view to show instead: the "uyu" row followed by Twitch's settings.
     */
    public static View addSettingsEntry(View settingsView) {
        try {
            Context context = settingsView.getContext();
            int layout = Utils.getResourceId(context, "settings_menu_item", "layout");
            if (layout == 0) {
                Utils.logInfo("settings_menu_item layout not found, uyu entry not added");
                return settingsView;
            }

            LinearLayout wrapper = new LinearLayout(context);
            wrapper.setOrientation(LinearLayout.VERTICAL);

            View entry = LayoutInflater.from(context).inflate(layout, wrapper, false);
            TextView title = entry.findViewById(Utils.getResourceId(context, "menu_item_title", "id"));
            if (title != null) title.setText(TITLE);
            ImageView icon = entry.findViewById(Utils.getResourceId(context, "icon", "id"));
            int iconRes = Utils.getResourceId(context, "ic_settings", "drawable");
            if (icon != null && iconRes != 0) icon.setImageResource(iconRes);
            entry.setOnClickListener(SettingsPatch::openSettings);
            wrapper.addView(entry);

            // Added last: if anything above fails, the original view is still unattached.
            wrapper.addView(settingsView, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));
            return wrapper;
        } catch (Exception ex) {
            Utils.logError("Failed to add the uyu settings entry", ex);
            return settingsView;
        }
    }

    private static void openSettings(View entry) {
        Activity activity = Utils.findActivity(entry.getContext());
        if (activity != null) showScreen(activity, null);
    }

    /**
     * Shows an uyu settings screen over the current one. SettingsActivity is single top, so
     * starting it again from itself would not create a new screen. The platform fragment back
     * stack is popped by the activity's back handling, including the toolbar's back arrow.
     *
     * @param section One of the {@link UyuSettingsFragment} sections, or null for the list of
     *                sections.
     */
    static void showScreen(Activity activity, String section) {
        try {
            String tag = section == null ? FRAGMENT_TAG : FRAGMENT_TAG + "_" + section;
            FragmentManager fragmentManager = activity.getFragmentManager();
            if (fragmentManager.findFragmentByTag(tag) != null) return;

            int container = Utils.getResourceId(activity, "fragment_container", "id");
            if (container == 0 || activity.findViewById(container) == null) {
                Utils.logInfo("fragment_container not found, cannot show uyu settings");
                return;
            }

            fragmentManager.beginTransaction()
                    .add(container, UyuSettingsFragment.create(section), tag)
                    .addToBackStack(tag)
                    .commit();
        } catch (Exception ex) {
            Utils.logError("Failed to open uyu settings", ex);
        }
    }

    /**
     * The title view of SettingsActivity's toolbar. The toolbar is an AndroidX class whose
     * methods may be obfuscated, so only its child views are touched.
     */
    static TextView findToolbarTitle(Activity activity) {
        View toolbar = activity.findViewById(Utils.getResourceId(activity, "actionBar", "id"));
        if (!(toolbar instanceof ViewGroup group)) return null;
        for (int i = 0; i < group.getChildCount(); i++) {
            if (group.getChildAt(i) instanceof TextView title) return title;
        }
        return null;
    }
}
