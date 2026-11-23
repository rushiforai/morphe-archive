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
        return "Board UI";
    }

    @Override
    public String getEntrySummary() {
        return "Custom display & AMOLED styling";
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

        boolean amoledBlack = prefs.getBoolean(KEY_AMOLED_BLACK, false);

        List<GboardPatchesSettingsContract.Section> sections = new ArrayList<>();

        List<GboardPatchesSettingsContract.Row> rows = new ArrayList<>();
        rows.add(new GboardPatchesSettingsContract.ToggleRow(
                "AMOLED Pure Black Mode",
                "Pitch black keyboard background for battery savings on OLED screens",
                true,
                amoledBlack,
                value -> {
                    prefs.edit().putBoolean(KEY_AMOLED_BLACK, value).apply();
                    try {
                        PreferenceManager.getDefaultSharedPreferences(ctx)
                                .edit().putBoolean(KEY_AMOLED_BLACK, value).apply();
                    } catch (Throwable ignored) {
                    }
                    if (host != null) host.submit(h -> h.refresh());
                }
        ));

        sections.add(new GboardPatchesSettingsContract.Section(
                "DISPLAY & THEMES",
                rows
        ));

        List<GboardPatchesSettingsContract.StatusBlock> statusBlocks = new ArrayList<>();
        statusBlocks.add(new GboardPatchesSettingsContract.StatusBlock(
                "AMOLED Pure Black Optimization",
                "When enabled, the keyboard window renders with true #000000 pitch-black pixels to maximize battery life on OLED and AMOLED displays.",
                GboardPatchesSettingsContract.StatusTone.INFO
        ));

        return new GboardPatchesSettingsContract.Screen(
                "Board UI",
                null,
                "Board UI",
                "Custom display & AMOLED styling",
                statusBlocks,
                sections
        );
    }
}
