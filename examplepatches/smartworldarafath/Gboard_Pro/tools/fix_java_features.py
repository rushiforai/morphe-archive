import os

# 1. GboardSettingsText.java
path_gst = 'pixelboard-patches/extensions/extension/src/main/java/com/akshaykadam/pixelboard/extension/settings/GboardSettingsText.java'
with open(path_gst, 'r', encoding='utf-8') as f:
    gst = f.read()

gst_clean = """package com.akshaykadam.pixelboard.extension.settings;

import android.content.Context;
import java.util.Locale;

public final class GboardSettingsText {
    private GboardSettingsText() {
    }

    public static String get(Context context, int resId) {
        if (context == null) return "";
        try {
            return context.getString(resId);
        } catch (Throwable t) {
            return "";
        }
    }

    public static String format(Context context, int resId, Object... args) {
        if (context == null) return "";
        try {
            return context.getString(resId, args);
        } catch (Throwable t) {
            return "";
        }
    }

    public static String quantity(Context context, int resId, int quantity) {
        if (context == null) return "";
        try {
            return context.getResources().getQuantityString(resId, quantity, quantity);
        } catch (Throwable t) {
            return "";
        }
    }
}
"""
with open(path_gst, 'w', encoding='utf-8') as f:
    f.write(gst_clean)
print("Updated GboardSettingsText.java")

# 2. GboardAboutFeature.java
path_about = 'pixelboard-patches/extensions/extension/src/main/java/com/akshaykadam/pixelboard/extension/settings/GboardAboutFeature.java'
about_code = """package com.akshaykadam.pixelboard.extension.settings;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;

import java.util.ArrayList;
import java.util.List;

public final class GboardAboutFeature implements GboardPatchesSettingsContract.Feature {

    private final Context context;

    public GboardAboutFeature(Context context) {
        this.context = context;
    }

    @Override
    public String getEntryTitle() {
        return "About";
    }

    @Override
    public String getEntrySummary() {
        return "Developer & project details";
    }

    @Override
    public boolean isAvailable(Context context) {
        return true;
    }

    @Override
    public void onVisible(GboardPatchesSettingsContract.FeatureHost host) {
    }

    @Override
    public GboardPatchesSettingsContract.Screen buildScreen(GboardPatchesSettingsContract.FeatureHost host) {
        Context ctx = host != null && host.getContext() != null ? host.getContext() : context;

        List<GboardPatchesSettingsContract.Section> sections = new ArrayList<>();

        // 1. Project Info Section
        List<GboardPatchesSettingsContract.Row> infoRows = new ArrayList<>();
        infoRows.add(new GboardPatchesSettingsContract.DetailRow(
                "Application",
                "Gboard Pro (Enhanced Edition)",
                false
        ));
        infoRows.add(new GboardPatchesSettingsContract.DetailRow(
                "Version",
                "v1.0.4 (Release)",
                false
        ));
        infoRows.add(new GboardPatchesSettingsContract.DetailRow(
                "Maintainer & Developer",
                "Arafath Rahman (@smartworldarafath)",
                false
        ));
        infoRows.add(new GboardPatchesSettingsContract.DetailRow(
                "License",
                "GNU General Public License v3.0 (GPLv3)",
                false
        ));
        sections.add(new GboardPatchesSettingsContract.Section(
                "PROJECT INFORMATION",
                infoRows
        ));

        // 2. Links & Community Section
        List<GboardPatchesSettingsContract.Row> linkRows = new ArrayList<>();
        linkRows.add(new GboardPatchesSettingsContract.CommandRow(
                "GitHub Repository",
                "smartworldarafath/Gboard_Pro",
                true,
                () -> openUrl(ctx, "https://github.com/smartworldarafath/Gboard_Pro")
        ));
        linkRows.add(new GboardPatchesSettingsContract.CommandRow(
                "Report Issue or Request Feature",
                "Submit feedback and bug reports on GitHub",
                true,
                () -> openUrl(ctx, "https://github.com/smartworldarafath/Gboard_Pro/issues")
        ));
        linkRows.add(new GboardPatchesSettingsContract.CommandRow(
                "Developer Telegram",
                "@smartworldarafath",
                true,
                () -> openUrl(ctx, "https://t.me/smartworldarafath")
        ));
        sections.add(new GboardPatchesSettingsContract.Section(
                "COMMUNITY & SUPPORT",
                linkRows
        ));

        List<GboardPatchesSettingsContract.StatusBlock> statusBlocks = new ArrayList<>();
        statusBlocks.add(new GboardPatchesSettingsContract.StatusBlock(
                "Gboard Pro by Arafath Rahman",
                "A modern, high-performance Gboard enhancement with Material 3 Expressive styling, 144Hz/120Hz high refresh rate support, Gemini Voice, and in-app updates.",
                GboardPatchesSettingsContract.StatusTone.INFO
        ));

        return new GboardPatchesSettingsContract.Screen(
                "About",
                null,
                "About",
                "Developer & project details",
                statusBlocks,
                sections
        );
    }

    private void openUrl(Context ctx, String url) {
        try {
            Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(url));
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            ctx.startActivity(intent);
        } catch (Throwable ignored) {
        }
    }
}
"""
with open(path_about, 'w', encoding='utf-8') as f:
    f.write(about_code)
print("Updated GboardAboutFeature.java")

# 3. GboardAppearanceFeature.java
path_app = 'pixelboard-patches/extensions/extension/src/main/java/com/akshaykadam/pixelboard/extension/settings/GboardAppearanceFeature.java'
appearance_code = """package com.akshaykadam.pixelboard.extension.settings;

import android.content.ComponentName;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.List;

public final class GboardAppearanceFeature implements GboardPatchesSettingsContract.Feature {

    public static final String PREF_NAME = "gboard_pro_appearance_prefs";
    public static final String KEY_SELECTED_ICON = "selected_app_icon_alias";
    public static final String KEY_UI_THEME = "selected_gboard_ui_theme";

    private final Context context;

    public GboardAppearanceFeature(Context context) {
        this.context = context;
    }

    @Override
    public String getEntryTitle() {
        return "Appearance";
    }

    @Override
    public String getEntrySummary() {
        return "App icons & styling";
    }

    @Override
    public boolean isAvailable(Context context) {
        return true;
    }

    @Override
    public void onVisible(GboardPatchesSettingsContract.FeatureHost host) {
    }

    @Override
    public GboardPatchesSettingsContract.Screen buildScreen(GboardPatchesSettingsContract.FeatureHost host) {
        Context ctx = host != null && host.getContext() != null ? host.getContext() : context;
        SharedPreferences prefs = ctx.getSharedPreferences(PREF_NAME, Context.MODE_PRIVATE);

        String currentIcon = prefs.getString(KEY_SELECTED_ICON, "launcher.Default");
        String currentTheme = prefs.getString(KEY_UI_THEME, "default");

        List<GboardPatchesSettingsContract.Section> sections = new ArrayList<>();

        // 1. App Launcher Icons Section
        List<GboardPatchesSettingsContract.Row> iconRows = new ArrayList<>();
        String[] iconAliases = {
                "launcher.Default",
                "launcher.Purple",
                "launcher.Slate",
                "launcher.ForestGreen",
                "launcher.NavyBlue"
        };
        String[] iconTitles = {
                "Classic Gboard Pro (Default)",
                "Expressive Purple",
                "Slate Charcoal",
                "Forest Emerald",
                "Midnight Navy"
        };
        String[] iconSummaries = {
                "Official modern Material You adaptive icon",
                "Vibrant violet-purple gradient with glow accent",
                "Minimalist graphite matte aesthetic",
                "Nature-inspired emerald green with deep sage",
                "Deep indigo and cobalt blue"
        };

        for (int i = 0; i < iconAliases.length; i++) {
            final String alias = iconAliases[i];
            boolean selected = alias.equals(currentIcon);
            iconRows.add(new GboardPatchesSettingsContract.RadioRow(
                    iconTitles[i],
                    iconSummaries[i],
                    true,
                    selected,
                    () -> {
                        applyAppIcon(ctx, alias);
                        if (host != null) {
                            host.submit(h -> h.refresh());
                        }
                    }
            ));
        }
        sections.add(new GboardPatchesSettingsContract.Section(
                "APP LAUNCHER ICONS",
                iconRows
        ));

        // 2. Gboard UI Themes Section with "beta" badge
        List<GboardPatchesSettingsContract.Row> themeRows = new ArrayList<>();
        String[] themeKeys = {"default", "rainbow", "botanical", "ocean"};
        String[] themeTitles = {
                "Default Material 3",
                "Expressive Rainbow",
                "Fresh Botanical",
                "Ocean Lavender"
        };
        String[] themeSummaries = {
                "Official adaptive dynamic palette based on system wallpaper",
                "Warm espresso and vivid sunset coral multi-tone vibe",
                "Deep forest moss and luminous sage botanical palette",
                "Midnight azure and ethereal twilight lavender multi-color"
        };

        for (int i = 0; i < themeKeys.length; i++) {
            final String key = themeKeys[i];
            boolean selected = key.equals(currentTheme);
            themeRows.add(new GboardPatchesSettingsContract.RadioRow(
                    themeTitles[i],
                    themeSummaries[i],
                    true,
                    selected,
                    () -> {
                        prefs.edit().putString(KEY_UI_THEME, key).apply();
                        Toast.makeText(ctx, "Applied " + key + " UI theme", Toast.LENGTH_SHORT).show();
                        if (host != null) {
                            host.submit(h -> h.refresh());
                        }
                    }
            ));
        }
        sections.add(new GboardPatchesSettingsContract.Section(
                "GBOARD UI (BETA)",
                themeRows
        ));

        List<GboardPatchesSettingsContract.StatusBlock> statusBlocks = new ArrayList<>();
        statusBlocks.add(new GboardPatchesSettingsContract.StatusBlock(
                "Custom Appearance",
                "Personalize your Gboard Pro experience with custom adaptive launcher icons and Material 3 Expressive UI tones.",
                GboardPatchesSettingsContract.StatusTone.INFO
        ));

        return new GboardPatchesSettingsContract.Screen(
                "Appearance",
                "Beta",
                "Appearance",
                "App icons & styling",
                statusBlocks,
                sections
        );
    }

    private void applyAppIcon(Context ctx, String targetAlias) {
        try {
            SharedPreferences prefs = ctx.getSharedPreferences(PREF_NAME, Context.MODE_PRIVATE);
            prefs.edit().putString(KEY_SELECTED_ICON, targetAlias).apply();

            PackageManager pm = ctx.getPackageManager();
            String pkg = ctx.getPackageName();

            String[] allAliases = {
                    "launcher.Default",
                    "launcher.Purple",
                    "launcher.Slate",
                    "launcher.ForestGreen",
                    "launcher.NavyBlue"
            };

            for (String alias : allAliases) {
                ComponentName comp = new ComponentName(pkg, pkg + "." + alias);
                int newState = alias.equals(targetAlias)
                        ? PackageManager.COMPONENT_ENABLED_STATE_ENABLED
                        : PackageManager.COMPONENT_ENABLED_STATE_DISABLED;
                try {
                    pm.setComponentEnabledSetting(comp, newState, PackageManager.DONT_KILL_APP);
                } catch (Throwable ignored) {
                }
            }
            Toast.makeText(ctx, "Icon updated! Launcher will refresh shortly.", Toast.LENGTH_SHORT).show();
        } catch (Throwable t) {
            Toast.makeText(ctx, "Icon preference saved.", Toast.LENGTH_SHORT).show();
        }
    }
}
"""
with open(path_app, 'w', encoding='utf-8') as f:
    f.write(appearance_code)
print("Updated GboardAppearanceFeature.java")

# 4. GboardBoardUiFeature.java
path_board = 'pixelboard-patches/extensions/extension/src/main/java/com/akshaykadam/pixelboard/extension/settings/GboardBoardUiFeature.java'
board_code = """package com.akshaykadam.pixelboard.extension.settings;

import android.content.Context;
import android.content.SharedPreferences;

import java.util.ArrayList;
import java.util.List;

public final class GboardBoardUiFeature implements GboardPatchesSettingsContract.Feature {

    public static final String PREF_NAME = "gboard_pro_board_ui_prefs";
    public static final String KEY_ROUNDED_KEYS = "rounded_keycaps_enabled";
    public static final String KEY_KEY_BORDERS = "key_borders_enabled";
    public static final String KEY_AMOLED_BLACK = "amoled_black_enabled";
    public static final String KEY_COMPACT_PADDING = "compact_padding_enabled";

    private final Context context;

    public GboardBoardUiFeature(Context context) {
        this.context = context;
    }

    @Override
    public String getEntryTitle() {
        return "Board UI";
    }

    @Override
    public String getEntrySummary() {
        return "Custom keycaps, borders & styles";
    }

    @Override
    public boolean isAvailable(Context context) {
        return true;
    }

    @Override
    public void onVisible(GboardPatchesSettingsContract.FeatureHost host) {
    }

    @Override
    public GboardPatchesSettingsContract.Screen buildScreen(GboardPatchesSettingsContract.FeatureHost host) {
        Context ctx = host != null && host.getContext() != null ? host.getContext() : context;
        SharedPreferences prefs = ctx.getSharedPreferences(PREF_NAME, Context.MODE_PRIVATE);

        boolean roundedKeys = prefs.getBoolean(KEY_ROUNDED_KEYS, true);
        boolean keyBorders = prefs.getBoolean(KEY_KEY_BORDERS, true);
        boolean amoledBlack = prefs.getBoolean(KEY_AMOLED_BLACK, false);
        boolean compactPadding = prefs.getBoolean(KEY_COMPACT_PADDING, false);

        List<GboardPatchesSettingsContract.Section> sections = new ArrayList<>();

        List<GboardPatchesSettingsContract.Row> rows = new ArrayList<>();
        rows.add(new GboardPatchesSettingsContract.ToggleRow(
                "Rounded Keycaps",
                "Apply modern pill-shaped rounded geometry to all typing keys",
                true,
                roundedKeys,
                value -> {
                    prefs.edit().putBoolean(KEY_ROUNDED_KEYS, value).apply();
                    if (host != null) host.submit(h -> h.refresh());
                }
        ));
        rows.add(new GboardPatchesSettingsContract.ToggleRow(
                "High-Contrast Key Borders",
                "Display distinct Material 3 key outlines for enhanced key separation",
                true,
                keyBorders,
                value -> {
                    prefs.edit().putBoolean(KEY_KEY_BORDERS, value).apply();
                    if (host != null) host.submit(h -> h.refresh());
                }
        ));
        rows.add(new GboardPatchesSettingsContract.ToggleRow(
                "AMOLED Pure Black Mode",
                "Pitch black keyboard background for battery savings on OLED screens",
                true,
                amoledBlack,
                value -> {
                    prefs.edit().putBoolean(KEY_AMOLED_BLACK, value).apply();
                    if (host != null) host.submit(h -> h.refresh());
                }
        ));
        rows.add(new GboardPatchesSettingsContract.ToggleRow(
                "Compact Key Margins",
                "Slightly reduce keyboard height and spacing for wider screen visibility",
                true,
                compactPadding,
                value -> {
                    prefs.edit().putBoolean(KEY_COMPACT_PADDING, value).apply();
                    if (host != null) host.submit(h -> h.refresh());
                }
        ));

        sections.add(new GboardPatchesSettingsContract.Section(
                "KEYBOARD STYLING",
                rows
        ));

        List<GboardPatchesSettingsContract.StatusBlock> statusBlocks = new ArrayList<>();
        statusBlocks.add(new GboardPatchesSettingsContract.StatusBlock(
                "Board UI Customization",
                "Fine-tune keyboard layouts, key shape radiuses, and tactile border outlines.",
                GboardPatchesSettingsContract.StatusTone.INFO
        ));

        return new GboardPatchesSettingsContract.Screen(
                "Board UI",
                null,
                "Board UI",
                "Custom keycaps, borders & styles",
                statusBlocks,
                sections
        );
    }
}
"""
with open(path_board, 'w', encoding='utf-8') as f:
    f.write(board_code)
print("Updated GboardBoardUiFeature.java")

# 5. PixelBoardUpdateFeature.java
path_update = 'pixelboard-patches/extensions/extension/src/main/java/com/akshaykadam/pixelboard/extension/updater/PixelBoardUpdateFeature.java'
with open(path_update, 'r', encoding='utf-8') as f:
    upd = f.read()

upd = upd.replace('GboardPatchesSettingsContract.PrimaryCommandRow', 'GboardPatchesSettingsContract.CommandRow')
upd = upd.replace('GboardPatchesSettingsContract.SectionStyle.CHANGELOG', 'GboardPatchesSettingsContract.SectionStyle.DEFAULT')
upd = upd.replace('Akshay Kadam (@Akshayykadam)', 'Arafath Rahman (@smartworldarafath)')
upd = upd.replace("""                GboardPatchesSettingsContract.RefreshPolicy.none(),
                GboardPatchesSettingsContract.PanelStyle.FLAT,
                null,
                false);""", """                GboardPatchesSettingsContract.RefreshPolicy.none(),
                GboardPatchesSettingsContract.PanelStyle.FLAT,
                null);""")

with open(path_update, 'w', encoding='utf-8') as f:
    f.write(upd)
print("Updated PixelBoardUpdateFeature.java")
