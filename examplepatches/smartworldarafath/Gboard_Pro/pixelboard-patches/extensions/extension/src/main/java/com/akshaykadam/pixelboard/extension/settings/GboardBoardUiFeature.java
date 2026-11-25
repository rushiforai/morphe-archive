package com.akshaykadam.pixelboard.extension.settings;

import android.content.Context;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;

import java.util.ArrayList;
import java.util.List;

public final class GboardBoardUiFeature implements GboardPatchesSettingsContract.Feature {

    public static final String PREF_NAME = "gboard_pro_board_ui_prefs";
    public static final String KEY_AMOLED_BLACK = "amoled_black_enabled";

    private final Context context;

    public GboardBoardUiFeature(Context context) {
        this.context = context;
    }

    @Override
    public String getEntryTitle() {
        return "Amoled";
    }

    @Override
    public String getEntrySummary() {
        return "AMOLED Pure Black app & keyboard styling";
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

        boolean amoledBlack = GboardM3Helper.isAmoledBlackEnabled(ctx);

        List<GboardPatchesSettingsContract.Section> sections = new ArrayList<>();

        List<GboardPatchesSettingsContract.Row> rows = new ArrayList<>();
        rows.add(new GboardPatchesSettingsContract.ToggleRow(
                "AMOLED Pure Black Mode",
                "True #000000 black background across the entire app UI and keyboard",
                true,
                amoledBlack,
                value -> {
                    prefs.edit().putBoolean(KEY_AMOLED_BLACK, value).commit();
                    try {
                        PreferenceManager.getDefaultSharedPreferences(ctx)
                                .edit().putBoolean(KEY_AMOLED_BLACK, value).commit();
                    } catch (Throwable ignored) {
                    }
                    try {
                        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.N) {
                            Context dps = ctx.createDeviceProtectedStorageContext();
                            dps.getSharedPreferences(PREF_NAME, Context.MODE_PRIVATE)
                                    .edit().putBoolean(KEY_AMOLED_BLACK, value).commit();
                            PreferenceManager.getDefaultSharedPreferences(dps)
                                    .edit().putBoolean(KEY_AMOLED_BLACK, value).commit();
                        }
                    } catch (Throwable ignored) {
                    }
                    GboardM3Helper.invalidateCaches();
                    if (ctx instanceof GboardPatchesSettingsActivity act) {
                        act.runOnUiThread(act::animateThemeChangeTransition);
                    } else if (host != null) {
                        host.submit(h -> h.refresh());
                    }
                }
        ));

        sections.add(new GboardPatchesSettingsContract.Section(
                "DISPLAY & THEMES",
                rows
        ));

        List<GboardPatchesSettingsContract.StatusBlock> statusBlocks = new ArrayList<>();
        statusBlocks.add(new GboardPatchesSettingsContract.StatusBlock(
                "AMOLED Pure Black",
                "When enabled, the entire Gboard Pro app UI and keyboard surfaces switch immediately to true #000000 pure black for OLED displays.",
                GboardPatchesSettingsContract.StatusTone.INFO
        ));

        return new GboardPatchesSettingsContract.Screen(
                "Amoled",
                null,
                "Amoled",
                "AMOLED Pure Black app & keyboard styling",
                statusBlocks,
                sections,
                GboardPatchesSettingsContract.RefreshPolicy.none(),
                GboardPatchesSettingsContract.PanelStyle.FLAT,
                null,
                false
        );
    }
}
