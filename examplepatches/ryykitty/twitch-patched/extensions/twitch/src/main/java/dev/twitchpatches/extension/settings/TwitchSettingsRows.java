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
import java.util.function.Supplier;

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
            if (option instanceof SettingGroup) parent.addView(navigation(parent, (SettingGroup) option, open, updates, option::summary));
            else if (option instanceof ToggleSetting) parent.addView(row(parent, (ToggleSetting) option, updates));
            else throw new IllegalStateException("Unknown settings entry type.");
        }
    }

    static View navigation(ViewGroup parent, SettingGroup group, Consumer<SettingGroup> open) {
        return navigation(parent, group, open, new ArrayList<>(), group::summary);
    }

    private static View navigation(ViewGroup parent, SettingGroup group, Consumer<SettingGroup> open,
            List<Runnable> updates, Supplier<String> summary) {
        View row = inflate(parent, "sub_menu_recycler_item");
        TextView title = TwitchSettingsResources.view(row, "menu_item_title", TextView.class);
        TextView description = TwitchSettingsResources.view(row, "menu_item_description", TextView.class);
        title.setText(group.title());
        Runnable update = () -> {
            String details = summary.get();
            description.setText(details);
            description.setVisibility(details.isEmpty() ? View.GONE : View.VISIBLE);
            row.setContentDescription(group.title() + ". " + details);
        };
        updates.add(update);
        update.run();
        title.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        description.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        row.setFocusable(true);
        row.setOnClickListener(view -> open.accept(group));
        row.setSaveFromParentEnabled(false);
        TwitchSettingsIcons.decorate(row, group, true);
        return row;
    }

    static void results(ViewGroup parent, List<SettingsSearch.Result> results, Consumer<SettingGroup> open) {
        List<Runnable> updates = new ArrayList<>();
        for (SettingsSearch.Result result : results) {
            if (result.entry instanceof ToggleSetting)
                parent.addView(row(parent, (ToggleSetting) result.entry, updates, result::summary));
            else {
                SettingGroup group = (SettingGroup) result.entry;
                parent.addView(navigation(parent, group, open, updates, result::summary));
            }
        }
        if (results.isEmpty()) empty(parent, "No matching settings.");
    }

    static void empty(ViewGroup parent, String message) {
        View row = inflate(parent, "sub_menu_recycler_item");
        row.setForeground(null);
        row.setClickable(false);
        row.setFocusable(false);
        TextView title = TwitchSettingsResources.view(row, "menu_item_title", TextView.class);
        title.setVisibility(View.GONE);
        TextView description = TwitchSettingsResources.view(row, "menu_item_description", TextView.class);
        description.setText(message);
        description.setVisibility(View.VISIBLE);
        parent.addView(row);
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
        return row(parent, option, updates, option::summary);
    }

    private static View row(ViewGroup parent, ToggleSetting option, List<Runnable> updates, Supplier<String> summary) {
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
            String details = summary.get();
            description.setText(details);
            description.setVisibility(details.isEmpty() ? View.GONE : View.VISIBLE);
            toggle.setContentDescription(option.title() + ". " + details);
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
        TwitchSettingsIcons.decorate(row, option, false);
        return row;
    }

    private static View inflate(ViewGroup parent, String layout) {
        Context context = parent.getContext();
        return LayoutInflater.from(context).inflate(TwitchSettingsResources.resource(context, "layout", layout), parent, false);
    }
}
