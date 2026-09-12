package app.morphe.extension.tiktok.settings.preference;

import android.content.Context;
import android.preference.ListPreference;
import android.view.View;

import app.morphe.extension.shared.settings.StringSetting;
import app.morphe.extension.tiktok.Utils;

@SuppressWarnings("deprecation")
public final class GestureActionPreference extends ListPreference {
    public enum Kind {
        SINGLE_TAP,
        DOUBLE_TAP,
        DOUBLE_TAP_LEFT,
        DOUBLE_TAP_RIGHT,
        LONG_PRESS
    }

    public GestureActionPreference(Context context, Kind kind, StringSetting setting) {
        super(context);
        setKey(setting.key);
        configure(kind);
        setValue(setting.get());
        updateSummary(setting.get());
        setOnPreferenceChangeListener((preference, newValue) -> {
            updateSummary(String.valueOf(newValue));
            return true;
        });
    }

    @Override
    protected void onBindView(View view) {
        super.onBindView(view);
        Utils.setTitleAndSummaryColor(view);
    }

    private void configure(Kind kind) {
        switch (kind) {
            case SINGLE_TAP:
                setTitle("Single tap");
                setEntries(new CharSequence[]{"TikTok default", "No action", "Play / pause", "Clear Display"});
                setEntryValues(new CharSequence[]{"default", "none", "play_pause", "clear_display"});
                break;
            case DOUBLE_TAP:
                setTitle("Double tap");
                setEntries(new CharSequence[]{"TikTok default", "No action", "Like", "Play / pause", "Clear Display"});
                setEntryValues(new CharSequence[]{"default", "none", "like", "play_pause", "clear_display"});
                break;
            case DOUBLE_TAP_LEFT:
                setTitle("Double tap — left side");
                setEntries(new CharSequence[]{"Use double-tap action", "Seek back 5 seconds", "Seek back 10 seconds", "Seek back 15 seconds"});
                setEntryValues(new CharSequence[]{"default", "seek_back_5", "seek_back_10", "seek_back_15"});
                break;
            case DOUBLE_TAP_RIGHT:
                setTitle("Double tap — right side");
                setEntries(new CharSequence[]{"Use double-tap action", "Seek forward 5 seconds", "Seek forward 10 seconds", "Seek forward 15 seconds"});
                setEntryValues(new CharSequence[]{"default", "seek_forward_5", "seek_forward_10", "seek_forward_15"});
                break;
            case LONG_PRESS:
                setTitle("Long press");
                setEntries(new CharSequence[]{"TikTok default", "No action", "2x speed", "Clear Display"});
                setEntryValues(new CharSequence[]{"default", "none", "speed_2x", "clear_display"});
                break;
        }
    }

    private void updateSummary(String value) {
        int index = findIndexOfValue(value);
        setSummary(index >= 0 ? getEntries()[index] : value);
    }
}
