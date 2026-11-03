package app.consumerclarity;

import android.app.Activity;
import android.content.SharedPreferences;
import android.content.res.Configuration;

import java.util.Locale;

public final class ConsumerClarityDisplay {
    private ConsumerClarityDisplay() {}

    public static void apply(Activity activity) {
        SharedPreferences preferences = ConsumerClaritySettings.get(activity);
        int language = preferences.getInt("preferred_language", 0);
        int textScale = preferences.getInt("text_scale", 0);
        if (language == 0 && textScale == 0) return;
        Configuration configuration = new Configuration(activity.getResources().getConfiguration());
        if (language == 1) configuration.setLocale(Locale.ENGLISH);
        else if (language == 2) configuration.setLocale(new Locale("ar"));
        else if (language == 3) configuration.setLocale(new Locale("ckb"));
        if (textScale > 0) configuration.fontScale = textScale / 100.0f;
        activity.getResources().updateConfiguration(configuration, activity.getResources().getDisplayMetrics());
    }
}
