package n36;

import android.app.Activity;
import android.content.Context;
import android.content.res.Configuration;
import android.os.Bundle;
import android.preference.PreferenceFragment;
import android.view.View;
import android.widget.FrameLayout;

import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.Locale;

/**
 * The real official 1.45 settings surface, hosted by an Activity in the final DEX.
 *
 * <p>The four inline editors (model, API key, base URL, prompt) are created by the production
 * preferences on top of the real YouTube settings theme, exactly as on device. Nothing here replaces a
 * product class: the host only opens the screen and reports what the production code did.</p>
 */
@SuppressWarnings("deprecation")
public final class N36Host extends Activity {
    public static String callerLocale = "zh-CN";
    public static float callerFontScale = 1f;
    public static boolean callerDark;
    public PreferenceFragment preferences;

    @Override protected void attachBaseContext(Context base) {
        Configuration config = new Configuration(base.getResources().getConfiguration());
        config.setLocale(Locale.forLanguageTag(callerLocale));
        config.fontScale = callerFontScale;
        config.uiMode = (config.uiMode & ~Configuration.UI_MODE_NIGHT_MASK)
                | (callerDark ? Configuration.UI_MODE_NIGHT_YES : Configuration.UI_MODE_NIGHT_NO);
        super.attachBaseContext(base.createConfigurationContext(config));
    }

    @Override public void onCreate(Bundle state) {
        String theme = getIntent().getBooleanExtra("dark", false)
                ? "Theme.YouTube.Settings.Dark" : "Theme.YouTube.Settings";
        int themeId = getResources().getIdentifier(theme, "style", getPackageName());
        if (themeId == 0) throw new IllegalStateException("Actual YouTube settings theme missing " + theme);
        setTheme(themeId);
        super.onCreate(state);
        try {
            Class<?> utils = Class.forName("app.morphe.extension.shared.Utils");
            utils.getMethod("setContext", Context.class).invoke(null, this);
            setLanguage("DEFAULT");
            utils.getMethod("setContext", Context.class).invoke(null, this);
            setLanguage(getIntent().getStringExtra("locale"));
            // A clean, deterministic profile for the input lane; no real provider is ever contacted.
            getSharedPreferences("caption_api_profiles", 0).edit().clear().commit();
            getSharedPreferences("deepseek_caption_translator", 0).edit()
                    .remove("prompt").remove("base_url").remove("model")
                    .putString("base_url", "http://127.0.0.1:9/n36-local-only")
                    .putString("model", "n36-local-model")
                    .putInt("caption_size_tier", CaptionSizeTier()).commit();
            Method clear = Class.forName("app.yydarlinker.deepseekcaptions.SecureApiKey")
                    .getDeclaredMethod("clear", Context.class);
            clear.setAccessible(true);
            clear.invoke(null, this);
            FrameLayout container = new FrameLayout(this);
            container.setId(0x01f33001);
            container.setFitsSystemWindows(true);
            if (android.os.Build.VERSION.SDK_INT >= 30) {
                container.setOnApplyWindowInsetsListener((view, insets) -> {
                    android.graphics.Insets bars = insets.getInsets(android.view.WindowInsets.Type.systemBars());
                    view.setPadding(bars.left, bars.top, bars.right, bars.bottom);
                    return insets;
                });
            }
            setContentView(container);
            preferences = (PreferenceFragment) Class.forName(
                    "app.morphe.extension.youtube.settings.preference.YouTubePreferenceFragment").newInstance();
            getFragmentManager().beginTransaction().replace(container.getId(), preferences).commit();
            getFragmentManager().executePendingTransactions();
            synchronizeOfficialLanguagePreference(getIntent().getStringExtra("locale"));
            Class.forName("app.yydarlinker.deepseekcaptions.CaptionAddonSupport")
                    .getMethod("initialize", Activity.class).invoke(null, this);
        } catch (Exception error) {
            throw new IllegalStateException("N36 genuine official settings host", error);
        }
    }

    @Override protected void onResume() {
        super.onResume();
        View root = getWindow() == null ? null : getWindow().getDecorView();
        if (root != null) root.requestFocus();
    }

    private static int CaptionSizeTier() { return 4; }

    public static void setLanguage(String tag) throws Exception {
        Object setting = Class.forName("app.morphe.extension.shared.settings.BaseSettings")
                .getField("MORPHE_LANGUAGE").get(null);
        Class<?> language = Class.forName("app.morphe.extension.shared.settings.AppLanguage");
        Object selected = null;
        Method locale = language.getMethod("getLocale");
        for (Object value : language.getEnumConstants()) {
            if ((tag == null || "DEFAULT".equals(tag)) && "DEFAULT".equals(((Enum<?>) value).name())) selected = value;
            if (tag != null && !"DEFAULT".equals(tag) && !"DEFAULT".equals(((Enum<?>) value).name())) {
                Locale candidate = (Locale) locale.invoke(value);
                Locale desired = Locale.forLanguageTag(tag);
                boolean candidateTraditional = "Hant".equals(candidate.getScript())
                        || (!"Hans".equals(candidate.getScript())
                            && Arrays.asList("TW", "HK", "MO").contains(candidate.getCountry()));
                boolean desiredTraditional = "Hant".equals(desired.getScript())
                        || (!"Hans".equals(desired.getScript())
                            && Arrays.asList("TW", "HK", "MO").contains(desired.getCountry()));
                if (candidate.getLanguage().equals(desired.getLanguage())
                        && (!"zh".equals(desired.getLanguage()) || candidateTraditional == desiredTraditional))
                    selected = value;
            }
        }
        if (selected == null) throw new IllegalArgumentException("Official AppLanguage missing " + tag);
        setting.getClass().getMethod("save", Object.class).invoke(setting, selected);
    }

    public void synchronizeOfficialLanguagePreference(String tag) throws Exception {
        Object setting = Class.forName("app.morphe.extension.shared.settings.BaseSettings")
                .getField("MORPHE_LANGUAGE").get(null);
        String key = (String) Class.forName("app.morphe.extension.shared.settings.Setting")
                .getField("key").get(setting);
        android.preference.Preference preference = preferences.findPreference(key);
        if (preference instanceof android.preference.ListPreference) {
            Enum<?> value = (Enum<?>) setting.getClass().getMethod("get").invoke(setting);
            ((android.preference.ListPreference) preference).setValue(value.name());
        }
    }
}
