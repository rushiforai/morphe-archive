package app.morphe.extension.tiktok.settings.preference;

import android.content.Context;
import android.preference.ListPreference;
import android.view.View;

import app.morphe.extension.shared.settings.StringSetting;
import app.morphe.extension.tiktok.Utils;

@SuppressWarnings("deprecation")
public final class SeenVideoRetentionPreference extends ListPreference {
    public SeenVideoRetentionPreference(Context context, StringSetting setting) {
        super(context);
        setTitle("Seen-video retention");
        setEntries(new CharSequence[]{"24 hours", "7 days", "30 days", "90 days", "Forever"});
        setEntryValues(new CharSequence[]{"1", "7", "30", "90", "0"});
        setKey(setting.key);
        setValue(setting.get());
        updateSummary();
        setOnPreferenceChangeListener((preference, newValue) -> {
            String value = String.valueOf(newValue);
            int index = findIndexOfValue(value);
            setSummary(index >= 0 ? getEntries()[index] : value);
            return true;
        });
    }

    @Override
    protected void onBindView(View view) {
        super.onBindView(view);
        Utils.setTitleAndSummaryColor(view);
    }

    private void updateSummary() {
        int index = findIndexOfValue(getValue());
        setSummary(index >= 0 ? getEntries()[index] : getValue());
    }
}
