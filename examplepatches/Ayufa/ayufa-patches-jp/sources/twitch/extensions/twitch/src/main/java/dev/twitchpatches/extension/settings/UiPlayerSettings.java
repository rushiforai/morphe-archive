package dev.twitchpatches.extension.settings;

import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;
import dev.twitchpatches.extension.ui.UiSettings;

public final class UiPlayerSettings {
    private static final String TAG = "twitch_patches_ui_settings_entry";
    private UiPlayerSettings() { }

    public static void bind(View root) {
        SettingGroup group = PatchSettings.group(UiSettings.KEY);
        if (group == null) return;
        ViewGroup scroll = TwitchSettingsResources.view(root, "options_scrollview", ViewGroup.class);
        if (scroll.getChildCount() != 1 || !(scroll.getChildAt(0) instanceof LinearLayout))
            throw new IllegalStateException("Player settings content layout changed.");
        LinearLayout contents = (LinearLayout) scroll.getChildAt(0);
        if (contents.findViewWithTag(TAG) != null) return;
        TextView header = TwitchSettingsResources.view(root, "profile_header", TextView.class);
        int position = contents.indexOfChild(header);
        if (position < 0) throw new IllegalStateException("Player settings header layout changed.");
        View row = TwitchSettingsRows.navigation(contents, group, selected -> UiSettings.open());
        row.setTag(TAG);
        contents.addView(row, position + 1);
    }
}
