package com.akshaykadam.pixelboard.extension.settings;

import android.content.Context;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public final class GboardProFeature implements GboardPatchesSettingsContract.Feature {
    private final Context context;

    public GboardProFeature(Context context) {
        this.context = context;
    }

    @Override
    public String getEntryTitle() {
        return "Pro";
    }

    @Override
    public String getEntrySummary() {
        return "Appearance, Board UI & Advanced Settings";
    }

    @Override
    public boolean isAvailable(Context context) {
        return true;
    }

    @Override
    public List<GboardPatchesSettingsContract.Feature> getNavigationChildren() {
        return Arrays.asList(
                new GboardAppearanceFeature(context),
                new GboardBoardUiFeature(context),
                new GboardAdvancedSettingsFeature(context));
    }

    @Override
    public GboardPatchesSettingsContract.Screen buildScreen(GboardPatchesSettingsContract.FeatureHost host) {
        Context ctx = host != null && host.getContext() != null ? host.getContext() : context;
        List<GboardPatchesSettingsContract.Section> sections = new ArrayList<>();

        List<GboardPatchesSettingsContract.Row> rows = new ArrayList<>();

        // 1. Appearance
        rows.add(new GboardPatchesSettingsContract.NavigationRow(
                "Appearance",
                "Material 3 Expressive UI theme palettes",
                true,
                () -> {
                    if (host != null) {
                        GboardPatchesSettingsContract.openFeature(host, new GboardAppearanceFeature(ctx));
                    }
                }));

        // 2. Board UI
        rows.add(new GboardPatchesSettingsContract.NavigationRow(
                "Board UI",
                "AMOLED Pure Black keyboard styling",
                true,
                () -> {
                    if (host != null) {
                        GboardPatchesSettingsContract.openFeature(host, new GboardBoardUiFeature(ctx));
                    }
                }));

        // 3. Advanced Settings
        rows.add(new GboardPatchesSettingsContract.NavigationRow(
                "Advanced Settings",
                "Gemini voice typing, writing tools & modular patches",
                true,
                () -> {
                    if (host != null) {
                        GboardPatchesSettingsContract.openFeature(host, new GboardAdvancedSettingsFeature(ctx));
                    }
                }));

        sections.add(new GboardPatchesSettingsContract.Section("GBOARD PRO CUSTOMIZATIONS", rows));

        return new GboardPatchesSettingsContract.Screen(
                "Pro",
                "Gboard Pro",
                "Pro",
                "Exclusive appearance styles, board UI and advanced features",
                Collections.emptyList(),
                sections);
    }
}
