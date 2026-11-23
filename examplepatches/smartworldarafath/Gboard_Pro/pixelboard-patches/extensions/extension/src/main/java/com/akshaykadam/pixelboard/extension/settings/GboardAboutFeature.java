package com.akshaykadam.pixelboard.extension.settings;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;

import com.akshaykadam.pixelboard.extension.BuildConfig;

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

        // 1. Maintainer & Developer Section
        List<GboardPatchesSettingsContract.Row> devRows = new ArrayList<>();
        devRows.add(new GboardPatchesSettingsContract.CommandRow(
                "Arafath Rahman (@smartworldarafath)",
                "Project Creator, Maintainer & Lead Android Engineer",
                true,
                () -> openUrl(ctx, "https://github.com/smartworldarafath")
        ));
        devRows.add(new GboardPatchesSettingsContract.CommandRow(
                "Telegram Community & Support",
                "Direct chat & updates @smartworldarafath",
                true,
                () -> openUrl(ctx, "https://t.me/smartworldarafath")
        ));
        devRows.add(new GboardPatchesSettingsContract.CommandRow(
                "Issue Tracker & Feedback",
                "Submit bug reports and feature requests on GitHub",
                true,
                () -> openUrl(ctx, "https://github.com/smartworldarafath/Gboard_Pro/issues")
        ));
        sections.add(new GboardPatchesSettingsContract.Section(
                "MAINTAINER & COMMUNITY",
                devRows
        ));

        // 2. Application & System Section
        List<GboardPatchesSettingsContract.Row> infoRows = new ArrayList<>();
        infoRows.add(new GboardPatchesSettingsContract.DetailRow(
                "Release Version",
                "v" + BuildConfig.PATCH_VERSION + " (Beta)",
                false
        ));
        infoRows.add(new GboardPatchesSettingsContract.DetailRow(
                "Base Gboard",
                "18.4.1.985164140-release-arm64-v8a",
                false
        ));
        infoRows.add(new GboardPatchesSettingsContract.DetailRow(
                "Display Engine",
                "144Hz / 120Hz Ultra Smooth Refresh Rate",
                false
        ));
        infoRows.add(new GboardPatchesSettingsContract.DetailRow(
                "License",
                "GNU General Public License v3.0 (GPLv3)",
                false
        ));
        sections.add(new GboardPatchesSettingsContract.Section(
                "APPLICATION & SYSTEM",
                infoRows
        ));

        // 3. Core Highlights Section
        List<GboardPatchesSettingsContract.Row> highlightRows = new ArrayList<>();
        highlightRows.add(new GboardPatchesSettingsContract.DetailRow(
                "Material 3 Expressive",
                "Blush Lilac, Cotton Candy, Sunset Peach & Fresh Mint dynamic palettes",
                false
        ));
        highlightRows.add(new GboardPatchesSettingsContract.DetailRow(
                "AI Voice Dictation",
                "Gemini neural dictation model integration with smart punctuation",
                false
        ));
        highlightRows.add(new GboardPatchesSettingsContract.DetailRow(
                "Clipboard System",
                "Dual standard & custom hourly retention with Samsung/Vivo sync",
                false
        ));
        highlightRows.add(new GboardPatchesSettingsContract.DetailRow(
                "Zero-Telemetry Privacy",
                "100% on-device processing with zero data transmission",
                false
        ));
        sections.add(new GboardPatchesSettingsContract.Section(
                "CORE HIGHLIGHTS",
                highlightRows
        ));

        // 4. Open Source & Legal Section
        List<GboardPatchesSettingsContract.Row> linkRows = new ArrayList<>();
        linkRows.add(new GboardPatchesSettingsContract.CommandRow(
                "GitHub Repository",
                "smartworldarafath/Gboard_Pro",
                true,
                () -> openUrl(ctx, "https://github.com/smartworldarafath/Gboard_Pro")
        ));
        linkRows.add(new GboardPatchesSettingsContract.CommandRow(
                "Release Notes & Changelog",
                "View full changelog history on GitHub Releases",
                true,
                () -> openUrl(ctx, "https://github.com/smartworldarafath/Gboard_Pro/releases")
        ));
        linkRows.add(new GboardPatchesSettingsContract.CommandRow(
                "Privacy Policy & Terms",
                "Zero-telemetry guarantee and open-source terms",
                true,
                () -> openUrl(ctx, "https://github.com/smartworldarafath/Gboard_Pro#readme")
        ));
        sections.add(new GboardPatchesSettingsContract.Section(
                "OPEN SOURCE & LEGAL",
                linkRows
        ));

        List<GboardPatchesSettingsContract.StatusBlock> statusBlocks = new ArrayList<>();
        statusBlocks.add(new GboardPatchesSettingsContract.StatusBlock(
                "Gboard Pro",
                "Next-generation Gboard enhancement with Material 3 Expressive styling, 144Hz high refresh rate, Gemini Voice, and dual clipboard retention.",
                GboardPatchesSettingsContract.StatusTone.INFO
        ));

        return new GboardPatchesSettingsContract.Screen(
                "About",
                "v" + BuildConfig.PATCH_VERSION,
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
