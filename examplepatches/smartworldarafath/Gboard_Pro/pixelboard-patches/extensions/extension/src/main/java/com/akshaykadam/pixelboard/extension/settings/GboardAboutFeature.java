package com.akshaykadam.pixelboard.extension.settings;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;

import com.akshaykadam.pixelboard.extension.BuildConfig;

import java.util.ArrayList;
import java.util.Collections;
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

        // 1. DEVELOPER & COMMUNITY
        List<GboardPatchesSettingsContract.Row> devRows = new ArrayList<>();
        devRows.add(new GboardPatchesSettingsContract.NavigationRow(
                "Developer",
                "Arafath Rahman",
                null,
                true,
                () -> openUrl(ctx, "https://github.com/smartworldarafath"),
                false
        ));
        devRows.add(new GboardPatchesSettingsContract.NavigationRow(
                "Community",
                "Telegram Community & Support\nJoin for updates, help and discussions",
                true,
                () -> openUrl(ctx, "https://t.me/smartworldarafath")
        ));
        devRows.add(new GboardPatchesSettingsContract.NavigationRow(
                "Source Code",
                "GitHub Repository\nView the source code and contribute",
                true,
                () -> openUrl(ctx, "https://github.com/smartworldarafath/Gboard_Pro")
        ));
        sections.add(new GboardPatchesSettingsContract.Section(
                "DEVELOPER & COMMUNITY",
                devRows
        ));

        // 2. APPLICATION & SYSTEM
        List<GboardPatchesSettingsContract.Row> infoRows = new ArrayList<>();
        infoRows.add(new GboardPatchesSettingsContract.NavigationRow(
                "Release Version",
                "v" + BuildConfig.PATCH_VERSION,
                true,
                () -> openUrl(ctx, "https://github.com/smartworldarafath/Gboard_Pro/releases")
        ));
        infoRows.add(new GboardPatchesSettingsContract.NavigationRow(
                "Base Gboard",
                "18.6.3.1002251336-release-arm64-v8a",
                true,
                () -> openUrl(ctx, "https://github.com/smartworldarafath/Gboard_Pro/releases")
        ));
        sections.add(new GboardPatchesSettingsContract.Section(
                "APPLICATION & SYSTEM",
                infoRows
        ));

        List<GboardPatchesSettingsContract.StatusBlock> statusBlocks = new ArrayList<>();
        statusBlocks.add(new GboardPatchesSettingsContract.StatusBlock(
                "Gboard Pro",
                "Gboard From Google Pixel 11 series with Pixel exclusive features with Gemini",
                GboardPatchesSettingsContract.StatusTone.INFO
        ));

        return new GboardPatchesSettingsContract.Screen(
                "About",
                null,
                "About",
                "Developer & project details",
                statusBlocks,
                sections,
                GboardPatchesSettingsContract.RefreshPolicy.none(),
                GboardPatchesSettingsContract.PanelStyle.FLAT,
                null,
                false
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
