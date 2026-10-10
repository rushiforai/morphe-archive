package dev.twitchpatches.extension.settings;

import android.content.Context;
import android.os.Build;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Gravity;
import android.widget.CompoundButton;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.util.List;
import java.util.ArrayList;
import java.util.function.Consumer;

final class TwitchSettingsRows {
    private TwitchSettingsRows() { }

    static void populate(ViewGroup parent, List<? extends SettingEntry> options, Consumer<SettingGroup> open, boolean headers) {
        List<Runnable> updates = new ArrayList<>();
        SettingSection section = null;
        for (SettingEntry option : options) {
            if (headers && section != option.section()) {
                section = option.section();
                parent.addView(header(parent, section));
            }
            if (option instanceof SettingGroup) parent.addView(navigation(parent, (SettingGroup) option, open));
            else if (option instanceof ToggleSetting) parent.addView(row(parent, (ToggleSetting) option, updates));
            else throw new IllegalStateException("Unknown settings entry type.");
        }
    }

    private static View navigation(ViewGroup parent, SettingGroup group, Consumer<SettingGroup> open) {
        View row = inflate(parent, "sub_menu_recycler_item");
        TextView title = TwitchSettingsResources.view(row, "menu_item_title", TextView.class);
        TextView description = TwitchSettingsResources.view(row, "menu_item_description", TextView.class);
        title.setText(group.title());
        description.setText(group.summary());
        description.setVisibility(group.summary().isEmpty() ? View.GONE : View.VISIBLE);
        title.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        description.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        row.setContentDescription(group.title() + ". " + group.summary());
        row.setFocusable(true);
        row.setOnClickListener(view -> open.accept(group));
        row.setSaveFromParentEnabled(false);
        return row;
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

    private static View row(ViewGroup parent, ToggleSetting option, List<Runnable> updates) {
        View row = inflate(parent, "toggle_menu_recycler_item");
        TextView title = TwitchSettingsResources.view(row, "menu_item_title", TextView.class);
        TextView description = TwitchSettingsResources.view(row, "menu_item_description", TextView.class);
        TextView footer = TwitchSettingsResources.view(row, "section_summary", TextView.class);
        CompoundButton toggle = TwitchSettingsResources.view(row, "toggle", CompoundButton.class);
        title.setText(option.title());
        footer.setVisibility(View.GONE);
        if (footer.getParent() instanceof View) ((View) footer.getParent()).setVisibility(View.GONE);
        title.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        description.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        if (!option.summary().isEmpty())
            toggle.setMinimumHeight(Math.round(48 * parent.getResources().getDisplayMetrics().density));
        View text = (View) description.getParent();
        LinearLayout.LayoutParams textParams = (LinearLayout.LayoutParams) text.getLayoutParams();
        textParams.gravity = Gravity.CENTER_VERTICAL;
        text.setLayoutParams(textParams);
        CompoundButton.OnCheckedChangeListener listener = (button, checked) -> {
            option.setEnabled(checked);
            updates.forEach(Runnable::run);
        };
        Runnable update = () -> {
            toggle.setOnCheckedChangeListener(null);
            toggle.setChecked(option.isEnabled());
            description.setText(option.summary());
            description.setVisibility(option.summary().isEmpty() ? View.GONE : View.VISIBLE);
            toggle.setContentDescription(option.title() + ". " + option.summary());
            toggle.setOnCheckedChangeListener(listener);
        };
        updates.add(update);
        update.run();
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
