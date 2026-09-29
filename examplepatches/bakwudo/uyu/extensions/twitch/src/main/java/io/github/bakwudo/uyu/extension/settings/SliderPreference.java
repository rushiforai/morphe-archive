package io.github.bakwudo.uyu.extension.settings;

import android.content.Context;
import android.preference.Preference;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.SeekBar;
import android.widget.TextView;

/**
 * A preference row with a slider under the title. The summary shows the current value, and
 * the value is saved while the slider moves, so the danmaku preview follows it.
 */
@SuppressWarnings("deprecation")
public final class SliderPreference extends Preference {
    public interface Formatter {
        String format(int value);
    }

    private static final Object SLIDER_TAG = new Object();

    private final IntSetting setting;
    private final int step;
    private final Formatter formatter;
    private int value;

    public SliderPreference(Context context, IntSetting setting, int step, Formatter formatter) {
        super(context);
        this.setting = setting;
        this.step = step;
        this.formatter = formatter;
        setKey(setting.key);
        setPersistent(true);
        setDefaultValue(setting.defaultValue);
    }

    @Override
    protected void onSetInitialValue(boolean restorePersistedValue, Object defaultValue) {
        value = setting.get();
        setSummary(formatter.format(value));
    }

    @Override
    protected View onCreateView(ViewGroup parent) {
        View row = super.onCreateView(parent);

        LinearLayout layout = new LinearLayout(getContext());
        layout.setOrientation(LinearLayout.VERTICAL);
        layout.addView(row);

        SeekBar slider = new SeekBar(getContext());
        slider.setTag(SLIDER_TAG);
        slider.setPaddingRelative(row.getPaddingStart(), 0, row.getPaddingEnd(), row.getPaddingBottom());
        layout.addView(slider, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        return layout;
    }

    @Override
    protected void onBindView(View view) {
        super.onBindView(view);
        SeekBar slider = view.findViewWithTag(SLIDER_TAG);
        TextView summary = view.findViewById(android.R.id.summary);
        if (slider == null) return;

        slider.setOnSeekBarChangeListener(null);
        slider.setMax((setting.max - setting.min) / step);
        slider.setProgress((value - setting.min) / step);
        slider.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override
            public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                if (!fromUser) return;
                int newValue = setting.min + progress * step;
                if (newValue == value || !callChangeListener(newValue)) return;
                value = newValue;
                persistInt(newValue);
                // setSummary rebinds the row, so only update the text while dragging.
                if (summary != null) summary.setText(formatter.format(newValue));
                if (!seekBar.isPressed()) setSummary(formatter.format(newValue));
            }

            @Override
            public void onStartTrackingTouch(SeekBar seekBar) {
            }

            @Override
            public void onStopTrackingTouch(SeekBar seekBar) {
                setSummary(formatter.format(value));
            }
        });
    }
}
