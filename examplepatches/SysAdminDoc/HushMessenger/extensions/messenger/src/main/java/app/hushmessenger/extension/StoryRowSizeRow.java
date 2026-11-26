package app.hushmessenger.extension;

import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.Toast;
import java.util.ArrayList;
import java.util.List;

/**
 * The sizes under Smaller stories row (#240), the largest first. Until one is picked 90% is checked, since that's what
 * the switch uses. A pick saves the moment it's tapped, and the row takes it the next time the chats come up.
 */
final class StoryRowSizeRow {
    private final SettingsActivity page;
    private final List<RadioButton> choices = new ArrayList<>();

    StoryRowSizeRow(SettingsActivity page) {
        this.page = page;
    }

    void addTo(LinearLayout content) {
        RadioGroup group = new RadioGroup(page);
        group.setTag("story_row_size_choices");
        group.setOrientation(LinearLayout.VERTICAL);
        for (String level : StoryRowSize.LEVELS) {
            RadioButton choice = page.radio(StoryRowSize.LEVEL + "_" + level, label(level));
            choice.setOnClickListener(clicked -> pick(level));
            group.addView(choice, new RadioGroup.LayoutParams(-1, -2));
            choices.add(choice);
        }
        page.ui.add(content, group, 4);
        String largest = label(StoryRowSize.LEVELS[0]);
        String smallest = label(StoryRowSize.LEVELS[StoryRowSize.LEVELS.length - 1]);
        page.ui.add(content, page.ui.text(page.text.get("story_row_size_help", largest, smallest), 13, page.ui.muted, false), 8);
        fill();
    }

    /** A size the way the settings language writes a percentage. */
    String label(String level) {
        return page.text.percent(Integer.parseInt(level));
    }

    void fill() {
        String checked = StoryRowSize.LEVEL + "_" + StoryRowSize.picked();
        for (RadioButton choice : choices) choice.setChecked(choice.getTag().equals(checked));
    }

    private void pick(String level) {
        if (Settings.preferences != null) Settings.preferences.edit().putString(StoryRowSize.LEVEL, level).apply();
        fill();
        page.feedback(page.text.get("story_row_size_picked", label(level)), Toast.LENGTH_SHORT);
    }
}
