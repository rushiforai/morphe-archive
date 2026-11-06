package app.hushmessenger.extension;

import android.view.View;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;
import java.util.List;

/**
 * The rows under Customize message actions (#144): for messages you sent and for messages you got, each action seen so
 * far in your order, with buttons to move it up or down and to hide or show it, and a reset back to Messenger's order.
 * One per settings page. Filled again on every return, so actions seen while settings sat behind Messenger show up.
 */
final class MessageActionsRow {
    private static final String ARROW_UP = "↑", ARROW_DOWN = "↓";
    private final SettingsActivity page;
    private LinearLayout list;

    MessageActionsRow(SettingsActivity page) {
        this.page = page;
    }

    void addTo(LinearLayout content) {
        list = page.ui.column();
        list.setTag("message_actions_list");
        page.ui.add(content, list, 0);
        fill(null);
    }

    /** Filled again from the saved order. Focus goes back to the button that was used, if any, for TalkBack. */
    void fill(String focusTag) {
        if (list == null) return;
        list.removeAllViews();
        for (String side : MessageActions.SIDES) addSide(side);
        if (focusTag == null) return;
        View used = list.findViewWithTag(focusTag);
        if (used != null && used.isEnabled()) used.post(() -> used.performAccessibilityAction(AccessibilityNodeInfo.ACTION_ACCESSIBILITY_FOCUS, null));
    }

    private void addSide(String side) {
        SettingsUi ui = page.ui;
        SettingsText text = page.text;
        TextView heading = ui.text(text.get("message_actions_" + side), 14, ui.text, true);
        heading.setTag("message_actions_heading_" + side);
        heading.setAccessibilityHeading(true);
        ui.add(list, heading, 12);
        List<String> shown = MessageActions.shown(side);
        if (shown.isEmpty()) {
            TextView none = ui.text(text.get("message_actions_empty_" + side), 13, ui.muted, false);
            none.setTag("message_actions_empty_" + side);
            ui.add(list, none, 8);
            return;
        }
        java.util.Set<String> hidden = MessageActions.hidden(side);
        for (int i = 0; i < shown.size(); i++) addAction(side, shown.get(i), i, shown.size(), hidden.contains(shown.get(i)));
        Button reset = ui.destructiveButton(text.get("message_actions_reset"));
        reset.setTag("message_actions_reset_" + side);
        reset.setContentDescription(text.get("message_actions_reset") + ", " + text.get("message_actions_" + side));
        reset.setEnabled(MessageActions.customized(side));
        reset.setOnClickListener(view -> {
            String[] before = MessageActions.saved(side);
            MessageActions.reset(side);
            fill(null);
            page.feedback(text.get("message_actions_reset_done"), Toast.LENGTH_SHORT);
            page.offerUndo(text.format("message_actions_reset"), () -> {
                MessageActions.restore(side, before);
                fill(null);
            });
        });
        ui.add(list, reset, 8);
    }

    private void addAction(String side, String name, int at, int count, boolean hidden) {
        SettingsUi ui = page.ui;
        SettingsText text = page.text;
        String label = MessageActions.label(name);
        LinearLayout row = ui.row();
        row.setTag("message_actions_row_" + side + "_" + name);
        if (ui.largeText) row.setOrientation(LinearLayout.VERTICAL);
        TextView title = ui.text(hidden ? text.get("message_actions_hidden_label", label) : label, 15, hidden ? ui.muted : ui.text, false);
        row.addView(title, new LinearLayout.LayoutParams(ui.largeText ? -1 : 0, -2, ui.largeText ? 0 : 1));
        LinearLayout buttons = ui.row();
        Button up = arrow(ARROW_UP, text.get("message_actions_move_up", label), "message_actions_up_" + side + "_" + name, at > 0);
        up.setOnClickListener(view -> move(side, name, -1, (String) view.getTag()));
        buttons.addView(up);
        Button down = arrow(ARROW_DOWN, text.get("message_actions_move_down", label), "message_actions_down_" + side + "_" + name, at < count - 1);
        down.setOnClickListener(view -> move(side, name, 1, (String) view.getTag()));
        buttons.addView(down, margin(4));
        Button toggle = ui.button(text.get(hidden ? "message_actions_show" : "message_actions_hide"));
        toggle.setTag("message_actions_toggle_" + side + "_" + name);
        toggle.setContentDescription(text.get(hidden ? "message_actions_show" : "message_actions_hide") + ", " + label);
        toggle.setOnClickListener(view -> {
            MessageActions.setHidden(side, name, !hidden);
            fill((String) view.getTag());
            page.feedback(text.get(hidden ? "message_actions_shown" : "message_actions_hidden"), Toast.LENGTH_SHORT);
        });
        buttons.addView(toggle, margin(4));
        row.addView(buttons, new LinearLayout.LayoutParams(-2, -2));
        ui.add(list, row, 8);
    }

    private void move(String side, String name, int by, String tag) {
        if (!MessageActions.move(side, name, by)) return;
        fill(tag);
        List<String> shown = MessageActions.shown(side);
        list.announceForAccessibility(page.text.get("message_actions_moved", MessageActions.label(name), shown.indexOf(name) + 1, shown.size()));
    }

    private Button arrow(String symbol, String description, String tag, boolean enabled) {
        Button view = page.ui.button(symbol);
        view.setMinWidth(page.ui.dp(48));
        view.setMinimumWidth(page.ui.dp(48));
        view.setPadding(page.ui.dp(8), page.ui.dp(8), page.ui.dp(8), page.ui.dp(8));
        view.setContentDescription(description);
        view.setTag(tag);
        view.setEnabled(enabled);
        return view;
    }

    private LinearLayout.LayoutParams margin(int startDp) {
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(-2, -2);
        params.setMarginStart(page.ui.dp(startDp));
        return params;
    }
}
