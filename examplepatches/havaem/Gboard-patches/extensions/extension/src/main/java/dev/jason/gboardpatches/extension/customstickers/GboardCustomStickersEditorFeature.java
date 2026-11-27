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

/**
 * Edits one sticker, several stickers at once, or the pack's defaults for new stickers.
 * Stickers are always rendered from their own original image.
 */
final class GboardCustomStickersEditorFeature implements GboardPatchesSettingsContract.Feature {
    private static final String TAG = "GboardPatches";
    private final GboardCustomStickersUi ui;
    private final String packId;
    private final List<String> targets;
    private final boolean defaultsMode;
    // Kept across refreshes of this screen; nothing is written until Save.
    private boolean loaded;
    private GboardCustomStickersStore.Edits saved = GboardCustomStickersStore.Edits.NONE;
    private int backgroundTolerance;
    private int cornerPercent;
    private int outlineWidth;
    private int outlineColor = GboardCustomStickersUi.OUTLINE_COLORS[0];
    private volatile String busy;

    GboardCustomStickersEditorFeature(GboardCustomStickersUi ui, String packId,
            List<String> targets, boolean defaultsMode) {
        this.ui = ui;
        this.packId = packId;
        this.targets = new ArrayList<>(targets);
        this.defaultsMode = defaultsMode;
    }

    @Override
    public String getEntryTitle() {
        return ui.entryTitle;
    }

    @Override
    public String getEntrySummary() {
        return "";
    }

    private GboardCustomStickersStore.Edits edits() {
        return new GboardCustomStickersStore.Edits(
                backgroundTolerance, cornerPercent, outlineWidth, outlineColor);
    }

    private boolean changed() {
        return loaded && !edits().equals(saved);
    }

    @Override
    public boolean onBackRequested(GboardPatchesSettingsContract.FeatureHost host) {
        if (busy != null) return true;
        if (!changed()) return false;
        GboardPatchesSettingsContract.showManagedDialog(host, onDismiss -> {
            AlertDialog dialog = new AlertDialog.Builder(host.getContext())
                    .setTitle(ui.text(R.string.gboard_patches_custom_stickers_discard_title,
                            "Discard changes?"))
                    .setMessage(ui.text(R.string.gboard_patches_custom_stickers_discard_message,
                            "Your edits have not been saved."))
                    .setPositiveButton(ui.text(R.string.gboard_patches_custom_stickers_discard,
                            "Discard"), (button, which) ->
                            GboardPatchesSettingsContract.closeFeature(host))
                    .setNegativeButton(ui.text(
                            R.string.gboard_patches_custom_stickers_keep_editing,
                            "Keep editing"), null)
                    .create();
            dialog.setOnDismissListener(ignored -> onDismiss.run());
            dialog.show();
            return true;
        });
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
            List<String> live = new ArrayList<>(targets);
            if (pack != null) live.retainAll(pack.stickers);
            String sample = pack == null ? null
                    : defaultsMode ? (pack.stickers.isEmpty() ? null : pack.stickers.get(0))
                    : live.isEmpty() ? null : live.get(0);
            if (sample == null) {
                return ui.statusScreen(ui.entryTitle, ui.text(defaultsMode
                        ? R.string.gboard_patches_custom_stickers_defaults_needs_sticker
                        : R.string.gboard_patches_custom_stickers_sticker_missing,
                        "This sticker no longer exists."));
            }
            if (!loaded) {
                // Reopening continues from the saved settings.
                loaded = true;
                saved = defaultsMode ? pack.defaults : pack.editsOf(sample);
                backgroundTolerance = saved.backgroundTolerance;
                cornerPercent = saved.cornerPercent;
                outlineWidth = saved.outlineWidth;
                if (saved.outlineWidth > 0) outlineColor = saved.outlineColor;
            }
            String itemLabel = ui.text(
                    R.string.gboard_patches_custom_stickers_sticker_item, "Sticker %1$d");
            String title = defaultsMode
                    ? ui.text(R.string.gboard_patches_custom_stickers_defaults_title,
                            "Default edits")
                    : live.size() > 1
                            ? String.format(Locale.ROOT, ui.text(
                                    R.string.gboard_patches_custom_stickers_edit_count,
                                    "Edit %1$d stickers"), live.size())
                            : String.format(Locale.ROOT, itemLabel,
                                    pack.stickers.indexOf(sample) + 1);
            List<GboardPatchesSettingsContract.Section> sections = new ArrayList<>();
            GboardCustomStickersViews.EditorLabels labels =
                    new GboardCustomStickersViews.EditorLabels(title,
                            ui.text(R.string.gboard_patches_custom_stickers_hold_hint,
                                    "Hold the image to see the original."),
                            ui.text(R.string.gboard_patches_custom_stickers_background_not_found,
                                    "No plain background found at the image edges."),
                            ui.text(R.string.gboard_patches_custom_stickers_remove_background,
                                    "Remove background"),
                            ui.text(R.string.gboard_patches_custom_stickers_corners,
                                    "Round corners"),
                            ui.text(R.string.gboard_patches_custom_stickers_outline, "Outline"));
            GboardCustomStickersStore.Edits edits = edits();
            sections.add(new GboardPatchesSettingsContract.Section(null,
                    Collections.singletonList(new GboardPatchesSettingsContract.CustomViewRow(
                            viewHost -> GboardCustomStickersViews.createEditorPreview(
                                    viewHost.getContext(),
                                    GboardCustomStickersStore.stickerFile(
                                            hostContext, packId, pack.sourceOf(sample)),
                                    edits, labels,
                                    chosen -> runSafely("set sticker edits", () -> {
                                        backgroundTolerance = chosen.backgroundTolerance;
                                        cornerPercent = chosen.cornerPercent;
                                        outlineWidth = chosen.outlineWidth;
                                        GboardPatchesSettingsContract.refresh(host);
                                    }))))));

            if (outlineWidth > 0) {
                String[] colorValues = new String[GboardCustomStickersUi.OUTLINE_COLORS.length];
                for (int i = 0; i < colorValues.length; i++) {
                    colorValues[i] = Integer.toHexString(GboardCustomStickersUi.OUTLINE_COLORS[i]);
                }
                sections.add(new GboardPatchesSettingsContract.Section(
                        ui.text(R.string.gboard_patches_custom_stickers_section_edit, "Edit"),
                        Collections.singletonList(selector(host,
                                ui.text(R.string.gboard_patches_custom_stickers_outline_color,
                                        "Outline color"),
                                new String[]{
                                        ui.text(R.string.gboard_patches_custom_stickers_color_white, "White"),
                                        ui.text(R.string.gboard_patches_custom_stickers_color_black, "Black"),
                                        ui.text(R.string.gboard_patches_custom_stickers_color_yellow, "Yellow"),
                                        ui.text(R.string.gboard_patches_custom_stickers_color_pink, "Pink")},
                                colorValues,
                                Integer.toHexString(outlineColor),
                                value -> outlineColor = (int) Long.parseLong(value, 16)))));
            }
            if (!defaultsMode && live.size() == 1) {
                sections.add(stickerSection(host, hostContext, pack, sample));
            }

            String progress = busy;
            return new GboardPatchesSettingsContract.Screen(
                    title, ui.headerBadge, title, pack.name,
                    ui.progressBlocks(progress), sections,
                    GboardPatchesSettingsContract.RefreshPolicy.none(),
                    GboardPatchesSettingsContract.PanelStyle.FLAT,
                    new GboardPatchesSettingsContract.CommandRow(
                            ui.text(R.string.gboard_patches_custom_stickers_save, "Save"),
                            "", changed() && progress == null,
                            () -> runSafely("save sticker edits",
                                    () -> save(host, hostContext, live))));
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to render sticker editor", throwable);
            return ui.errorScreen();
        }
    }

    private GboardPatchesSettingsContract.Section stickerSection(
            GboardPatchesSettingsContract.FeatureHost host, Context hostContext,
            GboardCustomStickersStore.Pack pack, String fileName) {
        List<GboardPatchesSettingsContract.Row> rows = new ArrayList<>();
        boolean isCover = fileName.equals(pack.cover);
        rows.add(new GboardPatchesSettingsContract.ActionRow(
                ui.text(R.string.gboard_patches_custom_stickers_set_cover, "Set as cover"),
                isCover ? ui.text(R.string.gboard_patches_custom_stickers_already_cover,
                        "This sticker is the pack cover.") : "",
                !isCover,
                () -> runSafely("set sticker cover", () -> {
                    try {
                        GboardCustomStickersStore.setCover(hostContext, packId, fileName);
                    } catch (Throwable failure) {
                        Log.w(TAG, "Failed to set sticker cover", failure);
                        ui.showSaveFailed(host);
                    }
                    GboardPatchesSettingsContract.refresh(host);
                })));
        rows.add(new GboardPatchesSettingsContract.DangerRow(
                ui.text(R.string.gboard_patches_custom_stickers_delete_sticker, "Delete sticker"),
                "", true, () -> runSafely("delete sticker", () -> {
                    try {
                        GboardCustomStickersStore.deleteSticker(hostContext, packId, fileName);
                        GboardPatchesSettingsContract.closeFeature(host);
                    } catch (Throwable failure) {
                        Log.w(TAG, "Failed to delete sticker", failure);
                        ui.showSaveFailed(host);
                    }
                    GboardPatchesSettingsContract.refresh(host);
                }),
                ui.text(R.string.gboard_patches_custom_stickers_delete_sticker, "Delete sticker"),
                ui.text(R.string.gboard_patches_custom_stickers_delete_sticker_confirm,
                        "Delete this sticker?")));
        return new GboardPatchesSettingsContract.Section(
                ui.text(R.string.gboard_patches_custom_stickers_section_sticker, "Sticker"), rows);
    }

    private GboardPatchesSettingsContract.Row selector(
            GboardPatchesSettingsContract.FeatureHost host, String title,
            String[] labels, String[] values, String current,
            GboardPatchesSettingsContract.StringValueConsumer apply) {
        int index = java.util.Arrays.asList(values).indexOf(current);
        return new GboardPatchesSettingsContract.SelectorRow(title, "",
                labels[Math.max(0, index)], true,
                () -> runSafely("choose sticker edit", () ->
                        GboardPatchesSettingsContract.showChoiceDialog(host, title, labels,
                                values, current, null, null, value -> runSafely(
                                        "apply sticker edit", () -> {
                                            apply.accept(value);
                                            GboardPatchesSettingsContract.refresh(host);
                                        }))));
    }

    /** Saves the defaults, or re-renders each sticker from its own original. */
    private void save(GboardPatchesSettingsContract.FeatureHost host, Context hostContext,
            List<String> fileNames) {
        GboardCustomStickersStore.Edits edits = edits();
        busy = "";
        GboardPatchesSettingsContract.refresh(host);
        // Decoding, editing and encoding 512 px stickers is too slow for the UI thread.
        new Thread(() -> runSafely("save sticker edits", () -> {
            String message;
            if (defaultsMode) {
                try {
                    GboardCustomStickersStore.setDefaults(hostContext, packId, edits);
                    message = ui.text(R.string.gboard_patches_custom_stickers_defaults_saved,
                            "Default edits saved.");
                } catch (Throwable failure) {
                    Log.w(TAG, "Failed to save default edits", failure);
                    message = ui.text(R.string.gboard_patches_custom_stickers_save_failed,
                            "Could not save the change.");
                }
            } else {
                int failed = 0;
                for (int i = 0; i < fileNames.size(); i++) {
                    busy = String.format(Locale.ROOT, ui.text(
                            R.string.gboard_patches_custom_stickers_saving_progress,
                            "Saving %1$d of %2$d"), i + 1, fileNames.size());
                    GboardPatchesSettingsContract.refresh(host);
                    try {
                        GboardCustomStickersStore.saveEdited(
                                hostContext, packId, fileNames.get(i), edits);
                    } catch (Throwable failure) {
                        Log.w(TAG, "Failed to save edited sticker", failure);
                        failed++;
                    }
                }
                message = failed == 0
                        ? String.format(Locale.ROOT, ui.text(
                                R.string.gboard_patches_custom_stickers_saved,
                                "%1$d stickers saved."), fileNames.size())
                        : String.format(Locale.ROOT, ui.text(
                                R.string.gboard_patches_custom_stickers_save_partial,
                                "%1$d saved, %2$d could not be saved."),
                                fileNames.size() - failed, failed);
            }
            busy = null;
            saved = edits;
            GboardPatchesSettingsContract.showMessage(host, message);
            // Saved stickers get new file names, so this editor is done.
            GboardPatchesSettingsContract.closeFeature(host);
            GboardPatchesSettingsContract.refresh(host);
        }), "GboardStickerSave").start();
    }
}

