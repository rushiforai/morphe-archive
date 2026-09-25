/*
 * Copyright 2026 icysymmetra/tiktok-patches-for-morphe contributors
 * https://github.com/icysymmetra/tiktok-patches-for-morphe
 */
package app.morphe.extension.tiktok.settings.preference.categories;

import android.content.Context;
import android.preference.PreferenceScreen;

import app.morphe.extension.tiktok.settings.Settings;
import app.morphe.extension.tiktok.settings.SettingsStatus;
import app.morphe.extension.tiktok.settings.preference.NumberInputPreference;
import app.morphe.extension.tiktok.settings.preference.ThemeColorPreference;
import app.morphe.extension.tiktok.settings.preference.ThemePresetPreference;
import app.morphe.extension.tiktok.settings.preference.TogglePreference;
import app.morphe.extension.tiktok.theme.ThemeSettings;

@SuppressWarnings("deprecation")
public final class InterfacePreferenceCategory extends ConditionalPreferenceCategory {
    public InterfacePreferenceCategory(Context context, PreferenceScreen screen) {
        super(context, screen);
        setTitle("Interface");
    }

    @Override
    public boolean getSettingsStatus() {
        return SettingsStatus.themeEngineEnabled
                || SettingsStatus.captchaPopupSuppressionEnabled
                || SettingsStatus.promotionalBannersEnabled
                || SettingsStatus.alwaysShowPublishDateEnabled
                || SettingsStatus.automaticClearDisplayEnabled;
    }

    @Override
    public void addPreferences(Context context) {
        if (SettingsStatus.themeEngineEnabled) {
            addPreference(new ThemePresetPreference(context));
            addPreference(new ThemeColorPreference(
                    context,
                    "Custom background",
                    "Background color used by the Custom preset.",
                    ThemeSettings.CUSTOM_BACKGROUND,
                    true
            ));
            addPreference(new ThemeColorPreference(
                    context,
                    "Custom surface",
                    "Navigation and panel surface color used by the Custom preset.",
                    ThemeSettings.CUSTOM_SURFACE,
                    true
            ));
            addPreference(new ThemeColorPreference(
                    context,
                    "Custom accent",
                    "Accent color exposed by the Theme Engine for supported TikTok surfaces.",
                    ThemeSettings.CUSTOM_ACCENT,
                    true
            ));
            addPreference(new ThemeColorPreference(
                    context,
                    "Custom text",
                    "Text/contrast color exposed by the Theme Engine for supported surfaces.",
                    ThemeSettings.CUSTOM_TEXT,
                    true
            ));
            addPreference(new ThemeColorPreference(
                    context,
                    "Liquid Glass tint",
                    "Tint and base transparency for the Liquid Glass preset.",
                    ThemeSettings.GLASS_TINT,
                    true
            ));
            addPreference(new NumberInputPreference(
                    context,
                    "Liquid Glass opacity",
                    "Opacity of glass-like navigation and panel surfaces. Choose 10-95%.",
                    ThemeSettings.GLASS_OPACITY_PERCENT,
                    10,
                    95,
                    "%"
            ));
            addPreference(new NumberInputPreference(
                    context,
                    "Liquid Glass corner radius",
                    "Corner radius for glass-like surfaces. Choose 0-48 dp.",
                    ThemeSettings.GLASS_CORNER_RADIUS_DP,
                    0,
                    48,
                    "dp"
            ));
        }

        if (SettingsStatus.automaticClearDisplayEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Automatic Clear Display",
                    "Automatically hide TikTok's feed controls after a short delay on each new video.",
                    Settings.AUTOMATIC_CLEAR_DISPLAY
            ));
            addPreference(new NumberInputPreference(
                    context,
                    "Clear Display delay",
                    "Delay in milliseconds before controls are hidden. Choose 250-15000 ms.",
                    Settings.AUTOMATIC_CLEAR_DISPLAY_DELAY_MS,
                    250,
                    15000,
                    "ms"
            ));
        }
        if (SettingsStatus.promotionalBannersEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Hide floating promotions",
                    "Hide floating promotion badges, coins, and timer banners on the homepage.",
                    Settings.HIDE_HOMEPAGE_COIN
            ));
        }
        if (SettingsStatus.captchaPopupSuppressionEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Hide CAPTCHA popups",
                    "Hide browsing and LIVE puzzle dialogs. Login and account verification remain available.",
                    Settings.HIDE_CAPTCHA_POPUPS
            ));
        }
        if (SettingsStatus.alwaysShowPublishDateEnabled) {
            addPreference(new TogglePreference(
                    context,
                    "Always show publish date",
                    "Always show the publish date in video author information. Requires restart.",
                    Settings.ALWAYS_SHOW_PUBLISH_DATE
            ));
        }
    }
}
