package app.morphe.extension.tiktok.settings.preference;

import android.content.Context;
import android.preference.ListPreference;
import android.view.View;

import app.morphe.extension.shared.settings.StringSetting;
import app.morphe.extension.tiktok.Utils;

@SuppressWarnings("deprecation")
public final class DownloadQualityPreference extends ListPreference {
    public DownloadQualityPreference(Context context, StringSetting setting) {
        super(context);
        setTitle("Download quality");
        setEntries(new CharSequence[]{
                "Automatic",
                "Highest available",
                "1080p",
                "720p",
                "540p",
                "480p",
                "360p"
        });
        setEntryValues(new CharSequence[]{"auto", "highest", "1080", "720", "540", "480", "360"});
        setKey(setting.key);
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

    private void updateSummary(String value) {
        int index = findIndexOfValue(value);
        String selected = index >= 0 ? String.valueOf(getEntries()[index]) : value;
        setSummary(selected + ". If an exact resolution is unavailable, BlueIT chooses the next lower, then the next higher quality.");
    }
}
