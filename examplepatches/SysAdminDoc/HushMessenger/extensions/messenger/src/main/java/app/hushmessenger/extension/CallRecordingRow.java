package app.hushmessenger.extension;

import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.Toast;
import java.util.ArrayList;
import java.util.List;

/**
 * How long call recordings are kept (#193), under Record calls. A folder of calls grows on its own and nobody goes
 * back through it, so this offers a week, a month or three months, and the tidy-up runs after the next recording is
 * saved rather than on a timer of its own.
 */
final class CallRecordingRow {
    private final SettingsActivity page;
    private final List<RadioButton> choices = new ArrayList<>();

    CallRecordingRow(SettingsActivity page) {
        this.page = page;
    }

    void addTo(LinearLayout content) {
        page.ui.add(content, page.ui.text(page.text.get("call_recording_keep"), 15, page.ui.text, true), 8);
        RadioGroup group = new RadioGroup(page);
        group.setTag("call_recording_keep_choices");
        group.setOrientation(LinearLayout.VERTICAL);
        for (String days : CallRecordings.KEEP_CHOICES) {
            RadioButton choice = page.radio("call_recording_keep_" + days, label(days));
            choice.setOnClickListener(clicked -> pick(days));
            group.addView(choice, new RadioGroup.LayoutParams(-1, -2));
            choices.add(choice);
        }
        page.ui.add(content, group, 4);
        page.ui.add(content, page.ui.text(page.text.get("call_recording_keep_help"), 13, page.ui.muted, false), 8);
        fill();
    }

    /** Shows what's saved, so coming back to the page or a change made elsewhere reads right. */
    void fill() {
        if (choices.isEmpty()) return;
        String now = String.valueOf(CallRecordings.keepDays());
        for (RadioButton choice : choices) choice.setChecked(choice.getTag().equals("call_recording_keep_" + now));
    }

    private String label(String days) {
        return page.text.get(id(days), days);
    }

    private static String id(String days) {
        return "0".equals(days) ? "call_recording_keep_all" : "call_recording_keep_days";
    }

    private void pick(String days) {
        if (Settings.preferences != null) Settings.preferences.edit().putString(CallRecordings.KEEP, days).apply();
        fill();
        // The label itself goes in untouched, since the toast's own text is what gets turned around for a right to left locale.
        page.feedback(page.text.get("call_recording_keep_picked", page.text.format(id(days), days)), Toast.LENGTH_SHORT);
    }
}
