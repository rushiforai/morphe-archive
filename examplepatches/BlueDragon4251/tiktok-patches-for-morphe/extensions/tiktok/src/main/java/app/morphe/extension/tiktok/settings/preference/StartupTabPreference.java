package app.morphe.extension.tiktok.settings.preference;

import android.content.Context;
import android.preference.ListPreference;
import android.view.View;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import app.morphe.extension.shared.settings.StringSetting;
import app.morphe.extension.tiktok.Utils;
import app.morphe.extension.tiktok.navigation.NavigationTabOptions;
import app.morphe.extension.tiktok.navigation.StartupTabController;
import app.morphe.extension.tiktok.settings.Settings;

@SuppressWarnings("deprecation")
public final class StartupTabPreference extends ListPreference {
    public StartupTabPreference(Context context, StringSetting setting) {
        super(context);
        setTitle("Startup feed");
        setKey(setting.key);

        List<CharSequence> labels = new ArrayList<>();
        List<CharSequence> values = new ArrayList<>();
        labels.add("TikTok default");
        values.add(StartupTabController.DEFAULT);
        labels.add("Last used feed");
        values.add(StartupTabController.LAST_USED);

        Set<String> observed = new LinkedHashSet<>(NavigationTabOptions.parseObservedKeys(
                Settings.FEED_NAVIGATION_OBSERVED_TABS.get()
        ));
        observed.add(NavigationTabOptions.HOT);
        for (NavigationTabOptions.Option option : NavigationTabOptions.optionsForKeys(observed)) {
            labels.add(option.label);
            values.add(option.key);
        }

        setEntries(labels.toArray(new CharSequence[0]));
        setEntryValues(values.toArray(new CharSequence[0]));
        setValue(setting.get());
        int selected = findIndexOfValue(setting.get());
        setSummary(selected >= 0 ? labels.get(selected) : setting.get());
    }

    @Override
    protected void onBindView(View view) {
        super.onBindView(view);
        Utils.setTitleAndSummaryColor(view);
    }
}
