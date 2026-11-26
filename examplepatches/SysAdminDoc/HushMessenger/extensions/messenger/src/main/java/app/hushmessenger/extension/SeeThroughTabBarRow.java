package app.hushmessenger.extension;

import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.Toast;
import java.util.ArrayList;
import java.util.List;

/**
 * The levels under See-through tab bar (#194), the most solid first. Until one is picked Standard is checked, since
 * that's what the switch uses. A pick saves the moment it's tapped. Messenger only paints the pill again when its own
 * colors change, so the new level shows once Messenger restarts.
 */
final class SeeThroughTabBarRow {
    private final SettingsActivity page;
    private final List<RadioButton> choices = new ArrayList<>();

    SeeThroughTabBarRow(SettingsActivity page) {
        this.page = page;
    }

    void addTo(LinearLayout content) {
        RadioGroup group = new RadioGroup(page);
        group.setTag("see_through_tab_bar_choices");
        group.setOrientation(LinearLayout.VERTICAL);
        for (String level : SeeThroughTabBar.LEVELS) {
            RadioButton choice = page.radio(SeeThroughTabBar.LEVEL + "_" + level, page.text.get(SeeThroughTabBar.KEY + "_" + level));
            choice.setOnClickListener(clicked -> pick(level));
            group.addView(choice, new RadioGroup.LayoutParams(-1, -2));
            choices.add(choice);
        }
        page.ui.add(content, group, 4);
        page.ui.add(content, page.ui.text(page.text.get("see_through_tab_bar_help"), 13, page.ui.muted, false), 8);
        fill();
    }

    void fill() {
        String checked = SeeThroughTabBar.LEVEL + "_" + SeeThroughTabBar.picked();
        for (RadioButton choice : choices) choice.setChecked(choice.getTag().equals(checked));
    }

    private void pick(String level) {
        if (Settings.preferences != null) Settings.preferences.edit().putString(SeeThroughTabBar.LEVEL, level).apply();
        fill();
        page.feedback(page.text.get("see_through_tab_bar_picked", page.text.get(SeeThroughTabBar.KEY + "_" + level)), Toast.LENGTH_SHORT);
    }
}
