package dev.jason.gboardpatches.extension.customstickers;

import static dev.jason.gboardpatches.extension.customstickers.GboardCustomStickersUi.runSafely;

import android.app.AlertDialog;
import android.content.Context;
import android.util.Log;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;

import dev.jason.gboardpatches.extension.R;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsContract;

/** One pack: its sticker grid, selection, keyboard visibility, defaults, export, delete. */
final class GboardCustomStickersPackFeature implements GboardPatchesSettingsContract.Feature {
    private static final String TAG = "GboardPatches";
    private final GboardCustomStickersUi ui;
    private final String packId;
    // Null when not selecting.
    private Set<String> selection;
    // Progress text while stickers are being added; null when idle.
    private volatile String busy;

    GboardCustomStickersPackFeature(GboardCustomStickersUi ui, String packId) {
        this.ui = ui;
        this.packId = packId;
    }

    @Override
    public String getEntryTitle() {
        return ui.entryTitle;
    }

    @Override
    public String getEntrySummary() {
        return "";
    }

    @Override
    public boolean onBackRequested(GboardPatchesSettingsContract.FeatureHost host) {
        if (selection == null) return false;
        selection = null;
        GboardPatchesSettingsContract.refresh(host);
        return true;
    }

    @Override
    public GboardPatchesSettingsContract.Screen buildScreen(
            GboardPatchesSettingsContract.FeatureHost host) {
        try {
            Context hostContext = host == null ? null : host.getContext();
            if (hostContext == null) return ui.errorScreen();
            GboardCustomStickersStore.Pack pack =
                    GboardCustomStickersStore.findPack(hostContext, packId);
            if (pack == null) {
                return ui.statusScreen(ui.entryTitle, ui.text(
                        R.string.gboard_patches_custom_stickers_pack_missing,
                        "This sticker pack no longer exists."));
            }
            if (selection != null) selection.retainAll(pack.stickers);
            List<GboardPatchesSettingsContract.Section> sections = new ArrayList<>();
            List<GboardPatchesSettingsContract.Row> stickerRows = new ArrayList<>();
            if (pack.stickers.isEmpty()) {
                stickerRows.add(new GboardPatchesSettingsContract.InfoRow(
                        ui.text(R.string.gboard_patches_custom_stickers_no_stickers,
                                "No stickers yet"),
                        ui.text(R.string.gboard_patches_custom_stickers_add_summary, ""), true));
            } else {
                GboardCustomStickersViews.GridLabels labels =
                        new GboardCustomStickersViews.GridLabels(
                                ui.text(R.string.gboard_patches_custom_stickers_sticker_item,
                                        "Sticker %1$d"),
                                ui.text(R.string.gboard_patches_custom_stickers_cover, "Cover"),
                                ui.text(R.string.gboard_patches_custom_stickers_photo, "Photo"),
                                ui.text(R.string.gboard_patches_custom_stickers_selected,
                                        "Selected"));
                Set<String> selected = selection;
                stickerRows.add(new GboardPatchesSettingsContract.CustomViewRow(viewHost ->
                        GboardCustomStickersViews.createStickerGrid(viewHost.getContext(),
                                pack, labels, selected,
                                (fileName, position) -> runSafely("tap sticker", () -> {
                                    if (selection != null) {
                                        if (!selection.remove(fileName)) selection.add(fileName);
                                        GboardPatchesSettingsContract.refresh(host);
                                    } else {
                                        GboardPatchesSettingsContract.openFeature(host,
                                                new GboardCustomStickersEditorFeature(ui, packId,
                                                        Collections.singletonList(fileName),
                                                        false));
                                    }
                                }),
                                (fileName, target) -> runSafely("move sticker", () -> {
                                    try {
                                        GboardCustomStickersStore.moveStickers(hostContext,
                                                packId, Collections.singletonList(fileName),
                                                target);
                                    } catch (Throwable failure) {
                                        Log.w(TAG, "Failed to move sticker", failure);
                                        ui.showSaveFailed(host);
                                    }
                                    GboardPatchesSettingsContract.refresh(host);
                                }))));
                if (selection == null) {
                    stickerRows.add(new GboardPatchesSettingsContract.ActionRow(
                            ui.text(R.string.gboard_patches_custom_stickers_select,
                                    "Select stickers"),
                            "", true, () -> runSafely("start selecting", () -> {
                                selection = new LinkedHashSet<>();
                                GboardPatchesSettingsContract.refresh(host);
                            })));
                }
            }
            sections.add(new GboardPatchesSettingsContract.Section(
                    ui.text(R.string.gboard_patches_custom_stickers_section_stickers, "Stickers"),
                    pack.stickers.isEmpty() ? null
                            : ui.text(R.string.gboard_patches_custom_stickers_grid_hint, ""),
                    GboardPatchesSettingsContract.SectionStyle.DEFAULT, stickerRows));
            if (selection != null) sections.add(selectionSection(host, hostContext, pack));

            List<GboardPatchesSettingsContract.Row> packRows = new ArrayList<>();
            Boolean shown = GboardCustomStickersRuntime.isShownInKeyboard(hostContext, packId);
            if (shown != null) {
                packRows.add(new GboardPatchesSettingsContract.ToggleRow(
                        ui.text(R.string.gboard_patches_custom_stickers_show_in_keyboard,
                                "Show in keyboard"),
                        ui.text(R.string.gboard_patches_custom_stickers_show_in_keyboard_summary,
                                ""),
                        true, shown, checked -> {
                            if (!GboardCustomStickersRuntime.setShownInKeyboard(
                                    hostContext, packId, checked)) {
                                ui.showSaveFailed(host);
                            }
                        }));
            }
            packRows.add(new GboardPatchesSettingsContract.NavigationRow(
                    ui.text(R.string.gboard_patches_custom_stickers_defaults,
                            "Default edits for new stickers"),
                    pack.defaults.isEmpty()
                            ? ui.text(R.string.gboard_patches_custom_stickers_defaults_off,
                                    "Off")
                            : ui.text(R.string.gboard_patches_custom_stickers_defaults_on,
                                    "Applied automatically to stickers you add"),
                    !pack.stickers.isEmpty(),
                    () -> runSafely("open default edits",
                            () -> GboardPatchesSettingsContract.openFeature(host,
                                    new GboardCustomStickersEditorFeature(ui, packId,
                                            Collections.emptyList(), true)))));
            packRows.add(new GboardPatchesSettingsContract.ActionRow(
                    ui.text(R.string.gboard_patches_custom_stickers_rename, "Rename pack"),
                    pack.name, true,
                    () -> runSafely("rename sticker pack", () -> rename(host, hostContext, pack))));
            packRows.add(new GboardPatchesSettingsContract.ActionRow(
                    ui.text(R.string.gboard_patches_custom_stickers_export_pack, "Export pack"),
                    ui.text(R.string.gboard_patches_custom_stickers_export_pack_summary, ""),
                    !pack.stickers.isEmpty(),
                    () -> runSafely("export sticker pack",
                            () -> exportPack(host, hostContext, pack))));
            packRows.add(new GboardPatchesSettingsContract.DangerRow(
                    ui.text(R.string.gboard_patches_custom_stickers_delete_pack, "Delete pack"),
                    "", true, () -> runSafely("delete sticker pack", () -> {
                        try {
                            GboardCustomStickersStore.deletePack(hostContext, packId);
                            GboardCustomStickersRuntime.setShownInKeyboard(
                                    hostContext, packId, false);
                        } catch (Throwable failure) {
                            Log.w(TAG, "Failed to delete sticker pack", failure);
                            ui.showSaveFailed(host);
                        }
                        GboardPatchesSettingsContract.refresh(host);
                    }),
                    ui.text(R.string.gboard_patches_custom_stickers_delete_pack, "Delete pack"),
                    ui.text(R.string.gboard_patches_custom_stickers_delete_pack_confirm, "")));
            sections.add(new GboardPatchesSettingsContract.Section(
                    ui.text(R.string.gboard_patches_custom_stickers_section_pack, "Pack"),
                    packRows));

            String progress = busy;
            return new GboardPatchesSettingsContract.Screen(
                    pack.name, ui.headerBadge, pack.name, ui.stickerCount(pack.stickers.size()),
                    ui.progressBlocks(progress), sections,
                    GboardPatchesSettingsContract.RefreshPolicy.none(),
                    GboardPatchesSettingsContract.PanelStyle.FLAT,
                    new GboardPatchesSettingsContract.CommandRow(
                            ui.text(R.string.gboard_patches_custom_stickers_add, "Add stickers"),
                            "", progress == null,
                            () -> runSafely("add stickers",
                                    () -> addStickers(host, hostContext))));
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to render sticker pack settings", throwable);
            return ui.errorScreen();
        }
    }

    private GboardPatchesSettingsContract.Section selectionSection(
            GboardPatchesSettingsContract.FeatureHost host, Context hostContext,
            GboardCustomStickersStore.Pack pack) {
        List<String> picked = new ArrayList<>();
        for (String sticker : pack.stickers) {
            if (selection.contains(sticker)) picked.add(sticker);
        }
        boolean any = !picked.isEmpty();
        boolean all = picked.size() == pack.stickers.size();
        List<GboardPatchesSettingsContract.Row> rows = new ArrayList<>();
        rows.add(new GboardPatchesSettingsContract.ActionRow(
                ui.text(R.string.gboard_patches_custom_stickers_edit_selected, "Edit selected"),
                "", any, () -> runSafely("edit selected stickers", () -> {
                    selection = null;
                    GboardPatchesSettingsContract.openFeature(host,
                            new GboardCustomStickersEditorFeature(ui, packId, picked, false));
                })));
        rows.add(new GboardPatchesSettingsContract.ActionRow(
                all ? ui.text(R.string.gboard_patches_custom_stickers_clear_selection,
                                "Clear selection")
                        : ui.text(R.string.gboard_patches_custom_stickers_select_all,
                                "Select all"),
                "", true, () -> runSafely("change selection", () -> {
                    if (all) selection.clear(); else selection.addAll(pack.stickers);
                    GboardPatchesSettingsContract.refresh(host);
                })));
        rows.add(new GboardPatchesSettingsContract.DangerRow(
                ui.text(R.string.gboard_patches_custom_stickers_delete_selected,
                        "Delete selected"),
                "", any, () -> runSafely("delete selected stickers", () -> {
                    int failed = GboardCustomStickersStore.deleteStickers(
                            hostContext, packId, picked);
                    if (failed > 0) ui.showSaveFailed(host);
                    selection = null;
                    GboardPatchesSettingsContract.refresh(host);
                }),
                ui.text(R.string.gboard_patches_custom_stickers_delete_selected,
                        "Delete selected"),
                ui.text(R.string.gboard_patches_custom_stickers_delete_selected_confirm,
                        "Delete the selected stickers?")));
        rows.add(new GboardPatchesSettingsContract.ActionRow(
                ui.text(R.string.gboard_patches_custom_stickers_done, "Done"), "", true,
                () -> runSafely("stop selecting", () -> {
                    selection = null;
                    GboardPatchesSettingsContract.refresh(host);
                })));
        return new GboardPatchesSettingsContract.Section(
                String.format(Locale.ROOT, ui.text(
                        R.string.gboard_patches_custom_stickers_selected_count,
                        "%1$d selected"), picked.size()),
                rows);
    }

    void addStickers(GboardPatchesSettingsContract.FeatureHost host, Context hostContext) {
        // Documents arrive one by one on a single worker thread, then completion runs there.
        int[] counts = new int[2];
        GboardPatchesSettingsContract.openBinaryDocuments(host, GboardCustomStickersUi.IMAGE_TYPES,
                GboardCustomStickersStore.MAX_IMPORT_BYTES, document -> {
                    busy = String.format(Locale.ROOT, ui.text(
                            R.string.gboard_patches_custom_stickers_adding_progress,
                            "Adding stickers: %1$d done"), counts[0] + counts[1]);
                    GboardPatchesSettingsContract.refresh(host);
                    try {
                        GboardCustomStickersStore.addSticker(
                                hostContext, packId, document.getData());
                        counts[0]++;
                    } catch (Throwable failure) {
                        Log.w(TAG, "Failed to add sticker", failure);
                        counts[1]++;
                    }
                }, () -> {
                    busy = null;
                    String message = counts[1] == 0
                            ? String.format(Locale.ROOT, ui.text(
                                    R.string.gboard_patches_custom_stickers_added,
                                    "%1$d stickers added."), counts[0])
                            : String.format(Locale.ROOT, ui.text(
                                    R.string.gboard_patches_custom_stickers_add_failed,
                                    "%1$d added, %2$d could not be added."),
                                    counts[0], counts[1]);
                    GboardPatchesSettingsContract.showMessage(host, message);
                    GboardPatchesSettingsContract.refresh(host);
                });
    }

    /** The zip is streamed straight into the picked file on a worker thread. */
    private void exportPack(GboardPatchesSettingsContract.FeatureHost host,
            Context hostContext, GboardCustomStickersStore.Pack pack) {
        String fileName = pack.name.replaceAll("[\\\\/:*?\"<>|]", "_") + ".zip";
        GboardPatchesSettingsContract.createStreamDocument(host, fileName, "application/zip",
                output -> GboardCustomStickersStore.exportPack(hostContext, packId, output),
                () -> GboardPatchesSettingsContract.showMessage(host, ui.text(
                        R.string.gboard_patches_custom_stickers_exported, "Pack exported.")));
    }

    private void rename(GboardPatchesSettingsContract.FeatureHost host, Context hostContext,
            GboardCustomStickersStore.Pack pack) {
        GboardPatchesSettingsContract.showTextInputDialog(host,
                ui.text(R.string.gboard_patches_custom_stickers_rename, "Rename pack"),
                ui.text(R.string.gboard_patches_custom_stickers_name_hint, "Pack name"), pack.name,
                name -> runSafely("save sticker pack name", () -> {
                    try {
                        GboardCustomStickersStore.renamePack(hostContext, packId, name);
                    } catch (Throwable failure) {
                        Log.w(TAG, "Failed to rename sticker pack", failure);
                        ui.showSaveFailed(host);
                    }
                    GboardPatchesSettingsContract.refresh(host);
                }));
    }
}

