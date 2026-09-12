package app.morphe.extension.tiktok.settings.preference;

import android.content.Context;
import android.preference.EditTextPreference;
import android.text.InputType;
import android.view.View;

import app.morphe.extension.shared.settings.IntegerSetting;
import app.morphe.extension.tiktok.Utils;

@SuppressWarnings("deprecation")
public final class PercentageInputPreference extends EditTextPreference {
    private final String baseSummary;
    private final int min;
    private final int max;

    public PercentageInputPreference(
            Context context,
            String title,
            String summary,
            IntegerSetting setting,
            int min,
            int max
    ) {
        super(context);
        this.baseSummary = summary;
        this.min = min;
        this.max = max;
        setTitle(title);
        setKey(setting.key);
        getEditText().setInputType(InputType.TYPE_CLASS_NUMBER);
        setText(String.valueOf(clamp(setting.get())));
    }

    @Override
    public void setText(String text) {
        int value = parse(text);
        super.setText(String.valueOf(value));
        if (baseSummary != null) {
            setSummary(baseSummary + "\nCurrent: " + value + "%");
        }
    }

    @Override
    protected void onDialogClosed(boolean positiveResult) {
        if (!positiveResult) {
            return;
        }

        String clamped = String.valueOf(parse(getEditText().getText().toString()));
        if (callChangeListener(clamped)) {
            setText(clamped);
        }
    }

    @Override
    protected void onBindView(View view) {
        super.onBindView(view);
        Utils.setTitleAndSummaryColor(view);
    }

    private int parse(String value) {
        try {
            return clamp(Integer.parseInt(value == null ? "" : value.trim()));
        } catch (NumberFormatException ignored) {
            return min;
        }
    }

    private int clamp(int value) {
        return Math.max(min, Math.min(max, value));
    }
}
