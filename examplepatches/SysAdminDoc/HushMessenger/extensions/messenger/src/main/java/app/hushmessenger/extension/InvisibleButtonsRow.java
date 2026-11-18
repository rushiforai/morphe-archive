package app.hushmessenger.extension;

import android.view.Gravity;
import android.view.View;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.TextView;
import android.widget.Toast;
import java.util.List;
import java.util.Map;

/**
 * The rows under Invisible buttons (#191): every button Messenger has shown so far, each with a strip of levels from
 * invisible to as Messenger draws it. One per settings page, filled again on every return, so a button first seen while
 * settings sat behind Messenger turns up without a trip out and back.
 */
final class InvisibleButtonsRow {
    private final SettingsActivity page;
    private LinearLayout list;

    InvisibleButtonsRow(SettingsActivity page) {
        this.page = page;
    }

    void addTo(LinearLayout content) {
        list = page.ui.column();
        list.setTag("invisible_buttons_list");
        page.ui.add(content, list, 0);
        fill(null);
    }

    /** Filled again from what's saved. Focus goes back to the level that was picked, if any, for TalkBack. */
    void fill(String focusTag) {
        if (list == null) return;
        list.removeAllViews();
        SettingsUi ui = page.ui;
        List<String> listed = InvisibleButtons.listed();
        if (listed.isEmpty()) {
            TextView none = ui.text(page.text.get("invisible_buttons_empty"), 13, ui.muted, false);
            none.setTag("invisible_buttons_empty");
            ui.add(list, none, 8);
            return;
        }
        Map<String, Integer> levels = InvisibleButtons.levels();
        for (String name : listed) {
            Integer level = levels.get(name);
            addItem(name, level == null ? 100 : level);
        }
        if (focusTag == null) return;
        View used = list.findViewWithTag(focusTag);
        if (used != null && used.isEnabled()) used.post(() -> used.performAccessibilityAction(AccessibilityNodeInfo.ACTION_ACCESSIBILITY_FOCUS, null));
    }

    private void addItem(String name, int level) {
        SettingsUi ui = page.ui;
        SettingsText text = page.text;
        LinearLayout item = ui.column();
        item.setTag("invisible_buttons_row_" + name);
        item.addView(ui.text(name, 15, level < 100 ? ui.muted : ui.text, false), new LinearLayout.LayoutParams(-1, -2));
        RadioGroup strip = new RadioGroup(page);
        strip.setOrientation(LinearLayout.HORIZONTAL);
        strip.setTag("invisible_buttons_levels_" + name);
        for (int choice : InvisibleButtons.LEVELS_OFFERED) {
            String shown = text.percent(choice);
            RadioButton option = page.radio("invisible_buttons_level_" + choice + "_" + name, text.display(shown));
            // A strip of five fits a phone's width only without the radio circles; the picked one wears the accent.
            option.setButtonDrawable(null);
            option.setGravity(Gravity.CENTER);
            option.setTextSize(14);
            option.setPadding(ui.dp(2), ui.dp(8), ui.dp(2), ui.dp(8));
            option.setTextColor(new android.content.res.ColorStateList(
                new int[][] {{android.R.attr.state_checked}, {}}, new int[] {ui.accent, ui.text}));
            option.setContentDescription(text.get("invisible_buttons_level_choice", shown, name));
            option.setChecked(choice == level);
            option.setOnClickListener(view -> {
                if (choice == level) return;
                InvisibleButtons.setLevel(name, choice);
                fill((String) view.getTag());
                page.feedback(choice == 0 ? text.get("invisible_buttons_invisible")
                    : choice >= 100 ? text.get("invisible_buttons_visible") : text.get("invisible_buttons_level", shown), Toast.LENGTH_SHORT);
            });
            strip.addView(option, new RadioGroup.LayoutParams(0, -2, 1));
        }
        item.addView(strip, new LinearLayout.LayoutParams(-1, -2));
        ui.add(list, item, 8);
    }
}
