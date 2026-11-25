package app.hushmessenger.extension;

import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.TextView;
import android.widget.Toast;
import java.util.ArrayList;
import java.util.List;

/**
 * The rates under Screen refresh rate (#208), one choice for each rate the screen does at its size, slowest first. Until
 * one is picked the fastest is checked, since that's what the switch asks for. A pick saves the moment it's tapped and
 * reaches Messenger's screens as they come back to the front.
 */
final class RefreshRateRow {
    private final SettingsActivity page;
    private final List<RadioButton> choices = new ArrayList<>();
    private List<Integer> rates = new ArrayList<>();

    RefreshRateRow(SettingsActivity page) {
        this.page = page;
    }

    void addTo(LinearLayout content) {
        rates = RefreshRate.rates(RefreshRate.display(page));
        if (rates.size() < 2) {
            TextView single = page.ui.text(page.text.get("refresh_rate_single"), 13, page.ui.muted, false);
            single.setTag("refresh_rate_single");
            page.ui.add(content, single, 8);
            return;
        }
        RadioGroup group = new RadioGroup(page);
        group.setTag("refresh_rate_choices");
        group.setOrientation(LinearLayout.VERTICAL);
        for (int rate : rates) {
            RadioButton choice = page.radio(RefreshRate.RATE + "_" + rate, page.text.get("refresh_rate_hz", String.valueOf(rate)));
            choice.setOnClickListener(clicked -> pick(rate));
            group.addView(choice, new RadioGroup.LayoutParams(-1, -2));
            choices.add(choice);
        }
        page.ui.add(content, group, 4);
        page.ui.add(content, page.ui.text(page.text.get("refresh_rate_help"), 13, page.ui.muted, false), 8);
        fill();
    }

    void fill() {
        if (rates.isEmpty()) return;
        String checked = RefreshRate.RATE + "_" + shown(rates, RefreshRate.picked());
        for (RadioButton choice : choices) choice.setChecked(choice.getTag().equals(checked));
    }

    /**
     * The choice that shows as picked: the saved rate when the screen does it, otherwise the nearest, the faster on a tie,
     * as RefreshRate.modeFor asks for. Nothing saved shows the fastest. [rates] is slowest first.
     */
    static int shown(List<Integer> rates, int picked) {
        int best = rates.get(rates.size() - 1);
        if (picked <= 0) return best;
        for (int rate : rates) {
            if (Math.abs(rate - picked) <= Math.abs(best - picked)) best = rate;
        }
        return best;
    }

    private void pick(int rate) {
        if (Settings.preferences != null) Settings.preferences.edit().putInt(RefreshRate.RATE, rate).apply();
        fill();
        page.feedback(page.text.get("refresh_rate_picked", String.valueOf(rate)), Toast.LENGTH_SHORT);
    }
}
