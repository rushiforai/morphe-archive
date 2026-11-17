package app.hushmessenger.extension;

import android.app.TimePickerDialog;
import android.text.format.DateFormat;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.Toast;

/**
 * Quiet mode's own rows (#190): the break button, which opens a sheet of how long it should last, and the two times the
 * daily window runs between, each one a tap away from the phone's own clock picker.
 */
final class QuietModeRow {
    private final SettingsActivity page;
    private Button taking, starts, ends;
    private SettingsDialog open;

    QuietModeRow(SettingsActivity page) {
        this.page = page;
    }

    /** The break button first, then the Every night switch the page hands in, then the window it runs between. */
    void addTo(LinearLayout content, LinearLayout nightly) {
        taking = page.ui.button("");
        taking.setTag("quiet_mode_break");
        taking.setOnClickListener(clicked -> pickBreak());
        page.ui.add(content, taking, 8);
        page.ui.add(content, nightly, 8);
        starts = page.ui.button("");
        starts.setTag("quiet_mode_start");
        starts.setOnClickListener(clicked -> pickTime(true));
        page.ui.add(content, starts, 8);
        ends = page.ui.button("");
        ends.setTag("quiet_mode_stop");
        ends.setOnClickListener(clicked -> pickTime(false));
        page.ui.add(content, ends, 8);
        fill();
    }

    /** Filled again on every return, so a break that ran out while settings sat behind Messenger reads right. */
    void fill() {
        if (taking == null) return;
        taking.setText(QuietMode.breakLabel(page, page.text));
        starts.setText(page.text.get("quiet_mode_start", QuietMode.minuteLabel(page, QuietMode.from())));
        ends.setText(page.text.get("quiet_mode_stop", QuietMode.minuteLabel(page, QuietMode.to())));
    }

    private void pickBreak() {
        if (open != null || page.isFinishing() || page.isDestroyed()) return;
        SettingsDialog sheet = new SettingsDialog(page, page.ui, page.text,
            page.text.get("quiet_mode_how_long"), page.text.get("quiet_mode_how_long_hint"));
        sheet.setTag("quiet_mode_sheet");
        RadioGroup group = new RadioGroup(page);
        group.setTag("quiet_mode_choices");
        group.setOrientation(LinearLayout.VERTICAL);
        long until = QuietMode.until();
        for (int minutes : QuietMode.BREAKS) {
            RadioButton choice = page.radio("quiet_mode_break_" + minutes, QuietMode.breakChoice(page.text, minutes));
            choice.setChecked(minutes == 0 && until <= 0 && QuietMode.breakRunning());
            choice.setOnClickListener(clicked -> took(minutes));
            group.addView(choice, new RadioGroup.LayoutParams(-1, -2));
        }
        page.ui.add(sheet.body, group, 0);
        if (QuietMode.breakRunning()) {
            Button end = page.ui.button(page.text.get("quiet_mode_end"));
            end.setTag("quiet_mode_end");
            end.setOnClickListener(clicked -> {
                QuietMode.endBreak();
                sheet.dialog.dismiss();
                fill();
            });
            sheet.action(end);
        }
        sheet.dialog.setOnDismissListener(dismissed -> {
            if (open == sheet) open = null;
        });
        open = sheet;
        sheet.show();
    }

    private void took(int minutes) {
        QuietMode.startBreak(minutes);
        // Picking how long a break lasts is as clear a yes as the switch itself, so a break never sits there doing
        // nothing because Quiet mode was still off.
        page.turnOn(QuietMode.KEY);
        if (open != null) open.dialog.dismiss();
        fill();
        page.feedback(QuietMode.breakLabel(page, page.text), Toast.LENGTH_SHORT);
    }

    /** The phone's own clock picker, in the format the phone is set to. */
    private void pickTime(boolean start) {
        int minute = start ? QuietMode.from() : QuietMode.to();
        new TimePickerDialog(page, (view, hour, minutes) -> {
            int picked = hour * 60 + minutes;
            if (start) QuietMode.setWindow(picked, QuietMode.to());
            else QuietMode.setWindow(QuietMode.from(), picked);
            fill();
        }, minute / 60, minute % 60, DateFormat.is24HourFormat(page)).show();
    }

    /** For tests: the sheet that's open, or null. */
    SettingsDialog openSheet() {
        return open;
    }
}
