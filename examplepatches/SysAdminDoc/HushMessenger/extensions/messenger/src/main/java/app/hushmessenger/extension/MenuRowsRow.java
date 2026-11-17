package app.hushmessenger.extension;

import android.view.View;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;
import java.util.List;
import java.util.Set;

/**
 * The rows under the Menu tab section (#189): every row Messenger's Menu tab has shown, with a button to hide or show
 * it. One per settings page. Filled again on every return, so a row seen while settings sat behind Messenger shows up.
 */
final class MenuRowsRow {
    private final SettingsActivity page;
    private LinearLayout list;

    MenuRowsRow(SettingsActivity page) {
        this.page = page;
    }

    void addTo(LinearLayout content) {
        list = page.ui.column();
        list.setTag("menu_rows_list");
        page.ui.add(content, list, 0);
        fill(null);
    }

    /** Filled again from what's saved. Focus goes back to the button that was used, if any, for TalkBack. */
    void fill(String focusTag) {
        if (list == null) return;
        list.removeAllViews();
        SettingsUi ui = page.ui;
        List<String> seen = MenuRows.seen();
        if (seen.isEmpty()) {
            TextView none = ui.text(page.text.get("menu_rows_empty"), 13, ui.muted, false);
            none.setTag("menu_rows_empty");
            ui.add(list, none, 8);
            return;
        }
        Set<String> hidden = MenuRows.hidden();
        for (String name : seen) addRow(name, hidden.contains(name));
        if (focusTag == null) return;
        View used = list.findViewWithTag(focusTag);
        if (used != null && used.isEnabled()) used.post(() -> used.performAccessibilityAction(AccessibilityNodeInfo.ACTION_ACCESSIBILITY_FOCUS, null));
    }

    private void addRow(String name, boolean hidden) {
        SettingsUi ui = page.ui;
        SettingsText text = page.text;
        String label = MenuRows.label(name);
        LinearLayout row = ui.row();
        row.setTag("menu_rows_row_" + name);
        if (ui.largeText) row.setOrientation(LinearLayout.VERTICAL);
        TextView title = ui.text(hidden ? text.get("message_actions_hidden_label", label) : label, 15, hidden ? ui.muted : ui.text, false);
        row.addView(title, new LinearLayout.LayoutParams(ui.largeText ? -1 : 0, -2, ui.largeText ? 0 : 1));
        Button toggle = ui.button(text.get(hidden ? "message_actions_show" : "message_actions_hide"));
        toggle.setTag("menu_rows_toggle_" + name);
        toggle.setContentDescription(text.get(hidden ? "message_actions_show" : "message_actions_hide") + ", " + label);
        toggle.setOnClickListener(view -> {
            MenuRows.setHidden(name, !hidden);
            fill((String) view.getTag());
            page.feedback(text.get(hidden ? "message_actions_shown" : "message_actions_hidden"), Toast.LENGTH_SHORT);
        });
        row.addView(toggle, new LinearLayout.LayoutParams(-2, -2));
        ui.add(list, row, 8);
    }
}
