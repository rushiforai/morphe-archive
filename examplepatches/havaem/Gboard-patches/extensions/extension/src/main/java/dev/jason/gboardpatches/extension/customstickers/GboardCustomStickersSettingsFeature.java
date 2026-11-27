package dev.jason.gboardpatches.extension.customstickers;

import static dev.jason.gboardpatches.extension.customstickers.GboardCustomStickersUi.runSafely;

import android.content.Context;
import android.util.Log;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

import dev.jason.gboardpatches.extension.R;
import dev.jason.gboardpatches.extension.settings.GboardPatchesFeatureAvailability;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsContract;

/** Custom Stickers root screen: pack list, import, keyboard options and usage. */
public final class GboardCustomStickersSettingsFeature
        implements GboardPatchesSettingsContract.Feature {
    private static final String TAG = "GboardPatches";
    private static final String[] ARCHIVE_TYPES = {
            "application/zip", "application/x-zip-compressed", "application/octet-stream"
    };

    private final GboardCustomStickersUi ui;
    private final String entrySummary;

    public GboardCustomStickersSettingsFeature(Context context) {
        ui = new GboardCustomStickersUi(context);
        entrySummary = ui.text(R.string.gboard_patches_custom_stickers_summary, "");
    }

    @Override
    public String getEntryTitle() {
        return ui.entryTitle;
    }

    @Override
    public String getEntrySummary() {
        return entrySummary;
    }

    @Override
    public boolean isAvailable(Context context) {
        return GboardPatchesFeatureAvailability.hasFeature(
                context, GboardPatchesFeatureAvailability.FEATURE_CUSTOM_STICKERS);
    }

    @Override
    public GboardPatchesSettingsContract.Screen buildScreen(
            GboardPatchesSettingsContract.FeatureHost host) {
        try {
            Context hostContext = host == null ? null : host.getContext();
            if (hostContext == null) return ui.errorScreen();
            List<GboardCustomStickersStore.Pack> packs = GboardCustomStickersStore.load(hostContext);
            List<GboardPatchesSettingsContract.Row> packRows = new ArrayList<>();
            if (packs.isEmpty()) {
                packRows.add(new GboardPatchesSettingsContract.InfoRow(
                        ui.text(R.string.gboard_patches_custom_stickers_empty, "No sticker packs yet"),
                        ui.text(R.string.gboard_patches_custom_stickers_empty_summary, ""), true));
            } else {
                List<String> summaries = new ArrayList<>();
                for (GboardCustomStickersStore.Pack pack : packs) {
                    summaries.add(packSummary(hostContext, pack));
                }
                packRows.add(new GboardPatchesSettingsContract.CustomViewRow(viewHost ->
                        GboardCustomStickersViews.createPackList(viewHost.getContext(), packs,
                                summaries,
                                packId -> runSafely("open sticker pack",
                                        () -> GboardPatchesSettingsContract.openFeature(
                                                host, new GboardCustomStickersPackFeature(ui, packId))),
                                (packId, target) -> runSafely("move sticker pack", () -> {
                                    try {
                                        GboardCustomStickersStore.movePack(
                                                hostContext, packId, target);
                                    } catch (Throwable failure) {
                                        Log.w(TAG, "Failed to move sticker pack", failure);
                                        ui.showSaveFailed(host);
                                    }
                                    GboardPatchesSettingsContract.refresh(host);
                                }))));
            }
            packRows.add(new GboardPatchesSettingsContract.ActionRow(
                    ui.text(R.string.gboard_patches_custom_stickers_import_pack, "Import pack"),
                    ui.text(R.string.gboard_patches_custom_stickers_import_pack_summary, ""), true,
                    () -> runSafely("import sticker pack", () -> importPack(host, hostContext))));
            List<GboardPatchesSettingsContract.Section> sections = new ArrayList<>();
            sections.add(new GboardPatchesSettingsContract.Section(
                    ui.text(R.string.gboard_patches_custom_stickers_section_packs, "Sticker packs"),
                    packs.isEmpty() ? null
                            : ui.text(R.string.gboard_patches_custom_stickers_pack_list_hint, ""),
                    GboardPatchesSettingsContract.SectionStyle.DEFAULT, packRows));
            sections.add(new GboardPatchesSettingsContract.Section(
                    ui.text(R.string.gboard_patches_custom_stickers_usage_title, "How to use"),
                    Collections.singletonList(new GboardPatchesSettingsContract.InfoRow(
                            ui.text(R.string.gboard_patches_custom_stickers_usage_title, "How to use"),
                            ui.text(R.string.gboard_patches_custom_stickers_usage_summary, ""),
                            true))));
            return new GboardPatchesSettingsContract.Screen(
                    ui.entryTitle, ui.headerBadge, ui.entryTitle, entrySummary,
                    Collections.emptyList(), sections,
                    GboardPatchesSettingsContract.RefreshPolicy.none(),
                    GboardPatchesSettingsContract.PanelStyle.FLAT,
                    new GboardPatchesSettingsContract.CommandRow(
                            ui.text(R.string.gboard_patches_custom_stickers_create,
                                    "Create sticker pack"),
                            "", true,
                            () -> runSafely("create sticker pack",
                                    () -> createPack(host, hostContext))));
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to render custom stickers settings", throwable);
            return ui.errorScreen();
        }
    }

    private String packSummary(Context hostContext, GboardCustomStickersStore.Pack pack) {
        if (pack.stickers.isEmpty()) {
            return ui.text(R.string.gboard_patches_custom_stickers_pack_empty_summary,
                    "Empty, add stickers to show it in the keyboard");
        }
        String count = ui.stickerCount(pack.stickers.size());
        if (Boolean.FALSE.equals(GboardCustomStickersRuntime.isShownInKeyboard(hostContext, pack.id))) {
            return count + " · " + ui.text(R.string.gboard_patches_custom_stickers_hidden,
                    "Not shown in keyboard");
        }
        return count;
    }

    private void createPack(GboardPatchesSettingsContract.FeatureHost host, Context hostContext) {
        GboardPatchesSettingsContract.showTextInputDialog(host,
                ui.text(R.string.gboard_patches_custom_stickers_create, "Create sticker pack"),
                ui.text(R.string.gboard_patches_custom_stickers_name_hint, "Pack name"), "",
                name -> runSafely("save new sticker pack", () -> {
                    try {
                        GboardCustomStickersStore.Pack pack =
                                GboardCustomStickersStore.createPack(hostContext, name);
                        // Gboard's header lists only "added" packs; new packs start added.
                        GboardCustomStickersRuntime.setShownInKeyboard(hostContext, pack.id, true);
                        GboardPatchesSettingsContract.refresh(host);
                        GboardCustomStickersPackFeature packFeature =
                                new GboardCustomStickersPackFeature(ui, pack.id);
                        GboardPatchesSettingsContract.openFeature(host, packFeature);
                        packFeature.addStickers(host, hostContext);
                    } catch (Throwable failure) {
                        Log.w(TAG, "Failed to create sticker pack", failure);
                        ui.showSaveFailed(host);
                    }
                }));
    }

    private void importPack(GboardPatchesSettingsContract.FeatureHost host, Context hostContext) {
        // The bounded picker reads the file on a worker thread.
        GboardPatchesSettingsContract.openBinaryDocument(host, ARCHIVE_TYPES,
                GboardCustomStickersStore.MAX_ARCHIVE_BYTES, document -> {
                    String message;
                    try {
                        GboardCustomStickersStore.Pack pack = GboardCustomStickersStore.importPack(
                                hostContext, document.getData());
                        GboardCustomStickersRuntime.setShownInKeyboard(hostContext, pack.id, true);
                        message = String.format(Locale.ROOT, ui.text(
                                R.string.gboard_patches_custom_stickers_imported,
                                "Imported pack %1$s."), pack.name);
                    } catch (Throwable failure) {
                        Log.w(TAG, "Failed to import sticker pack", failure);
                        message = ui.text(R.string.gboard_patches_custom_stickers_import_failed,
                                "This file is not a sticker pack.");
                    }
                    GboardPatchesSettingsContract.showMessage(host, message);
                    GboardPatchesSettingsContract.refresh(host);
                });
    }

}
