package dev.twitchpatches.extension.settings;

import android.content.Context;
import android.os.Build;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CompoundButton;
import android.widget.TextView;
import java.util.List;

final class TwitchSettingsRows {
    private TwitchSettingsRows() { }

    static void populate(ViewGroup parent, List<ToggleSetting> options) {
        SettingSection section = null;
        for (ToggleSetting option : options) {
            if (section != option.section()) {
                section = option.section();
                parent.addView(header(parent, section));
            }
            parent.addView(row(parent, option));
        }
    }

    private static View header(ViewGroup parent, SettingSection section) {
        View header = inflate(parent, "recycler_header_item");
        header.setBackgroundColor(TwitchSettingsResources.color(parent.getContext(), "background_body"));
        TextView title = TwitchSettingsResources.view(header, "header_text", TextView.class);
        title.setText(section.title());
        title.setAllCaps(true);
        if (Build.VERSION.SDK_INT >= 28) title.setAccessibilityHeading(true);
        return header;
    }

    private static View row(ViewGroup parent, ToggleSetting option) {
        View row = inflate(parent, "toggle_menu_recycler_item");
        TextView title = TwitchSettingsResources.view(row, "menu_item_title", TextView.class);
        TextView description = TwitchSettingsResources.view(row, "menu_item_description", TextView.class);
        TextView footer = TwitchSettingsResources.view(row, "section_summary", TextView.class);
        CompoundButton toggle = TwitchSettingsResources.view(row, "toggle", CompoundButton.class);
        title.setText(option.title());
        description.setText(option.summary());
        description.setVisibility(option.summary().isEmpty() ? View.GONE : View.VISIBLE);
        footer.setVisibility(View.GONE);
        if (footer.getParent() instanceof View) ((View) footer.getParent()).setVisibility(View.GONE);
        toggle.setContentDescription(option.title() + ". " + option.summary());
        title.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        description.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        toggle.setMinimumHeight(Math.round(48 * parent.getResources().getDisplayMetrics().density));
        toggle.setChecked(option.isEnabled());
        toggle.setOnCheckedChangeListener((button, checked) -> option.setEnabled(checked));
        row.setOnClickListener(view -> toggle.toggle());
        row.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        row.setFocusable(false);
        // Repeated row IDs share restored state; disable native restoration.
        row.setSaveFromParentEnabled(false);
        toggle.setSaveEnabled(false);
        return row;
    }

    private static View inflate(ViewGroup parent, String layout) {
        Context context = parent.getContext();
        return LayoutInflater.from(context).inflate(TwitchSettingsResources.resource(context, "layout", layout), parent, false);
    }
}
