package app.morphe.extension.tiktok.settings.preference;

import android.content.Context;
import android.preference.ListPreference;
import android.view.View;

import app.morphe.extension.shared.settings.StringSetting;
import app.morphe.extension.tiktok.Utils;

@SuppressWarnings("deprecation")
public final class DownloadSourcePreference extends ListPreference {
    public DownloadSourcePreference(Context context, StringSetting setting) {
        super(context);
        setTitle("Video download source");
        setEntries(new CharSequence[]{
                "Auto (recommended)",
                "No-watermark stream",
                "H.264 playback stream",
                "Playback stream"
        });
        setEntryValues(new CharSequence[]{"auto", "no_watermark", "h264", "play"});
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
        setSummary(selected + ". BlueIT falls back to Auto if the selected address is unavailable.");
    }
}
