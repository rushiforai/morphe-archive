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
 * The rows under Hide chat menu items (#153): each item seen so far in the chat list's long-press menu, with a button to
 * hide or show it. One per settings page. Filled again on every return, so items seen while settings sat behind
 * Messenger show up.
 */
final class ChatMenuItemsRow {
    private final SettingsActivity page;
    private LinearLayout list;

    ChatMenuItemsRow(SettingsActivity page) {
        this.page = page;
    }

    void addTo(LinearLayout content) {
        list = page.ui.column();
        list.setTag("chat_menu_items_list");
        page.ui.add(content, list, 0);
        fill(null);
    }

    /** Filled again from what's saved. Focus goes back to the button that was used, if any, for TalkBack. */
    void fill(String focusTag) {
        if (list == null) return;
        list.removeAllViews();
        SettingsUi ui = page.ui;
        List<String> seen = ChatMenuItems.seen();
        if (seen.isEmpty()) {
            TextView none = ui.text(page.text.get("chat_menu_items_empty"), 13, ui.muted, false);
            none.setTag("chat_menu_items_empty");
            ui.add(list, none, 8);
            return;
        }
        Set<String> hidden = ChatMenuItems.hidden();
        for (String name : seen) addItem(name, hidden.contains(name));
        if (focusTag == null) return;
        View used = list.findViewWithTag(focusTag);
        if (used != null && used.isEnabled()) used.post(() -> used.performAccessibilityAction(AccessibilityNodeInfo.ACTION_ACCESSIBILITY_FOCUS, null));
    }

    private void addItem(String name, boolean hidden) {
        SettingsUi ui = page.ui;
        SettingsText text = page.text;
        String label = ChatMenuItems.label(name);
        LinearLayout row = ui.row();
        row.setTag("chat_menu_items_row_" + name);
        if (ui.largeText) row.setOrientation(LinearLayout.VERTICAL);
        TextView title = ui.text(hidden ? text.get("message_actions_hidden_label", label) : label, 15, hidden ? ui.muted : ui.text, false);
        row.addView(title, new LinearLayout.LayoutParams(ui.largeText ? -1 : 0, -2, ui.largeText ? 0 : 1));
        Button toggle = ui.button(text.get(hidden ? "message_actions_show" : "message_actions_hide"));
        toggle.setTag("chat_menu_items_toggle_" + name);
        toggle.setContentDescription(text.get(hidden ? "message_actions_show" : "message_actions_hide") + ", " + label);
        toggle.setOnClickListener(view -> {
            ChatMenuItems.setHidden(name, !hidden);
            fill((String) view.getTag());
            page.feedback(text.get(hidden ? "message_actions_shown" : "message_actions_hidden"), Toast.LENGTH_SHORT);
        });
        row.addView(toggle, new LinearLayout.LayoutParams(-2, -2));
        ui.add(list, row, 8);
    }
}
