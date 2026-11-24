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
        return "Amoled & Advanced Settings";
    }

    @Override
    public boolean isAvailable(Context context) {
        return true;
    }

    @Override
    public List<GboardPatchesSettingsContract.Feature> getNavigationChildren() {
        return Arrays.asList(
                new GboardBoardUiFeature(context),
                new GboardAdvancedSettingsFeature(context));
    }

    @Override
    public GboardPatchesSettingsContract.Screen buildScreen(GboardPatchesSettingsContract.FeatureHost host) {
        Context ctx = host != null && host.getContext() != null ? host.getContext() : context;
        List<GboardPatchesSettingsContract.Section> sections = new ArrayList<>();

        List<GboardPatchesSettingsContract.Row> rows = new ArrayList<>();

        // 1. Amoled
        rows.add(new GboardPatchesSettingsContract.NavigationRow(
                "Amoled",
                "AMOLED Pure Black app & keyboard styling",
                true,
                () -> {
                    if (host != null) {
                        GboardPatchesSettingsContract.openFeature(host, new GboardBoardUiFeature(ctx));
                    }
                }));

        // 2. Advanced Settings
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
                "AMOLED pure black mode and advanced features",
                Collections.emptyList(),
                sections,
                GboardPatchesSettingsContract.RefreshPolicy.none(),
                GboardPatchesSettingsContract.PanelStyle.FLAT,
                null,
                false);
    }
}
