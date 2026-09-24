package com.travianpatch.notifier;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.text.InputType;
import android.view.View;
import android.widget.EditText;
import android.widget.LinearLayout;

/**
 * Lets the user adjust the automation knobs: resource safety buffer, the random delay range after a
 * build slot is ready, the daily quiet window, and the game world's server speed. Saving here does not
 * turn any automation on by itself - nothing reads these live yet.
 */
public class AutomationSettingsActivity extends Activity {

    private EditText bufferInput;
    private EditText minDelayMinutesInput;
    private EditText maxDelayMinutesInput;
    private EditText quietStartRangeStartInput;
    private EditText quietStartRangeEndInput;
    private EditText quietMinDurationInput;
    private EditText quietMaxDurationInput;
    private EditText speedInput;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(buildContent());
    }

    private View buildContent() {
        AutomationSettings.Config c = load();

        LinearLayout column = UiKit.column(this);
        column.addView(UiKit.title(this, "Automation settings"));
        column.addView(UiKit.muted(this, "These only take effect once the automation itself is built. "
                + "Saving here just remembers your preferences."));

        column.addView(UiKit.section(this, "Resource buffer"));
        bufferInput = numberField("Extra percent to keep in reserve", String.valueOf(c.bufferPercent));
        column.addView(bufferInput, UiKit.cardParams(this));

        column.addView(UiKit.section(this, "Delay after ready (minutes)"));
        LinearLayout delayRow = new LinearLayout(this);
        delayRow.setOrientation(LinearLayout.HORIZONTAL);
        minDelayMinutesInput = numberField("Minimum", String.valueOf(c.minDelayMs / 60_000L));
        maxDelayMinutesInput = numberField("Maximum", String.valueOf(c.maxDelayMs / 60_000L));
        delayRow.addView(minDelayMinutesInput, new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f));
        delayRow.addView(maxDelayMinutesInput, new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f));
        column.addView(delayRow, UiKit.cardParams(this));

        column.addView(UiKit.section(this, "Quiet window start range (minutes after midnight)"));
        LinearLayout startRow = new LinearLayout(this);
        startRow.setOrientation(LinearLayout.HORIZONTAL);
        quietStartRangeStartInput = numberField("From", String.valueOf(c.quietHours.startRangeStartMin));
        quietStartRangeEndInput = numberField("To", String.valueOf(c.quietHours.startRangeEndMin));
        startRow.addView(quietStartRangeStartInput, new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f));
        startRow.addView(quietStartRangeEndInput, new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f));
        column.addView(startRow, UiKit.cardParams(this));
        column.addView(UiKit.muted(this, "Example: 1380 to 1500 means the quiet window starts sometime "
                + "between 23:00 and 01:00."));

        column.addView(UiKit.section(this, "Quiet window duration range (minutes)"));
        LinearLayout durationRow = new LinearLayout(this);
        durationRow.setOrientation(LinearLayout.HORIZONTAL);
        quietMinDurationInput = numberField("Minimum", String.valueOf(c.quietHours.minDurationMin));
        quietMaxDurationInput = numberField("Maximum", String.valueOf(c.quietHours.maxDurationMin));
        durationRow.addView(quietMinDurationInput, new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f));
        durationRow.addView(quietMaxDurationInput, new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f));
        column.addView(durationRow, UiKit.cardParams(this));

        column.addView(UiKit.section(this, "Server speed"));
        speedInput = numberField("e.g. 1 for a 1x world, 2 for a 2x world", String.valueOf(c.serverSpeed));
        column.addView(speedInput, UiKit.cardParams(this));

        column.addView(UiKit.primaryButton(this, "Save", new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                save();
                finish();
            }
        }));

        return UiKit.page(this, column);
    }

    private EditText numberField(String hint, String initial) {
        EditText field = new EditText(this);
        field.setHint(hint);
        field.setHintTextColor(UiKit.mutedColor(this));
        field.setTextColor(UiKit.textColor(this));
        field.setInputType(InputType.TYPE_CLASS_NUMBER | InputType.TYPE_NUMBER_FLAG_DECIMAL);
        field.setText(initial);
        return field;
    }

    private AutomationSettings.Config load() {
        SharedPreferences prefs = getSharedPreferences(AutomationSettings.PREFS, Context.MODE_PRIVATE);
        return AutomationSettings.fromJson(prefs.getString(AutomationSettings.KEY, null));
    }

    private void save() {
        AutomationSettings.Config c;
        try {
            c = new AutomationSettings.Config(
                    Integer.parseInt(bufferInput.getText().toString().trim()),
                    Long.parseLong(minDelayMinutesInput.getText().toString().trim()) * 60_000L,
                    Long.parseLong(maxDelayMinutesInput.getText().toString().trim()) * 60_000L,
                    new QuietHours.Config(
                            Integer.parseInt(quietStartRangeStartInput.getText().toString().trim()),
                            Integer.parseInt(quietStartRangeEndInput.getText().toString().trim()),
                            Integer.parseInt(quietMinDurationInput.getText().toString().trim()),
                            Integer.parseInt(quietMaxDurationInput.getText().toString().trim())),
                    Double.parseDouble(speedInput.getText().toString().trim()));
        } catch (NumberFormatException e) {
            return; // leave whatever was already saved untouched rather than save garbage
        }
        getSharedPreferences(AutomationSettings.PREFS, Context.MODE_PRIVATE).edit()
                .putString(AutomationSettings.KEY, AutomationSettings.toJson(c))
                .apply();
    }
}
