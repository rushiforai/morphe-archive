package dev.jason.gboardpatches.extension.swiftkey;

import android.content.Context;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import dev.jason.gboardpatches.extension.R;
import dev.jason.gboardpatches.extension.settings.GboardPatchesFeatureAvailability;
import dev.jason.gboardpatches.extension.settings.GboardPatchesIcons;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsContract;
import dev.jason.gboardpatches.extension.settings.GboardSettingsText;

/**
 * Patches → Keyboard: SwiftKey Mode for seamless migration from Microsoft SwiftKey.
 *
 * <p>Provides a 1-tap master toggle plus sub-toggles for:
 * <ul>
 *   <li>In-place Shift-to-Capitalize word at cursor (Double-tap or Single-tap)</li>
 *   <li>Smart space trim before punctuation</li>
 *   <li>SwiftKey-style custom text-expansion shortcuts on the native suggestion strip</li>
 *   <li>Reversible 1-tap SwiftKey Keyboard Preset (Number row, Long-press symbols, 200 ms
 *       snappy long-press, Auto-space after punctuation, Double-space period, Undo auto-correct
 *       on backspace, Swipe-down dismiss, Shift+Backspace forward delete, Extended Clipboard)</li>
 * </ul>
 */
public final class GboardSwiftKeySettingsFeature
        implements GboardPatchesSettingsContract.Feature {
    private final Context textContext;

    public GboardSwiftKeySettingsFeature(Context context) {
        this.textContext = context;
    }

    @Override
    public String getEntryTitle() {
        return text(R.string.gboard_patches_swiftkey_mode_title);
    }

    @Override
    public String getEntrySummary() {
        return text(R.string.gboard_patches_swiftkey_mode_summary);
    }

    @Override
    public int getEntryIcon() {
        return GboardPatchesIcons.BOLT;
    }

    @Override
    public String getEntryTone() {
        return "blue";
    }

    @Override
    public String getRootSectionKey() {
        return GboardPatchesSettingsContract.ROOT_SECTION_KEYBOARD;
    }

    @Override
    public boolean showRootEntryToggle() {
        return true;
    }

    @Override
    public boolean isAvailable(Context context) {
        return GboardPatchesFeatureAvailability.hasFeature(
                context, GboardPatchesFeatureAvailability.FEATURE_SHIFT_FORWARD_DELETE);
    }

    @Override
    public GboardPatchesSettingsContract.Screen buildScreen(
            GboardPatchesSettingsContract.FeatureHost host) {
        Context ctx = host == null ? textContext : host.getContext();
        boolean enabled = GboardSwiftKeySettings.readEnabled(ctx);
        boolean shiftCase = GboardSwiftKeySettings.readShiftCaseEnabled(ctx);
        String trigger = GboardSwiftKeySettings.readShiftTrigger(ctx);
        boolean punctTrim = GboardSwiftKeySettings.readPunctTrimEnabled(ctx);
        boolean shortcutsEnabled = GboardSwiftKeySettings.readShortcutsEnabled(ctx);
        boolean presetApplied = GboardSwiftKeySettings.readPresetApplied(ctx);
        int shortcutCount = GboardSwiftKeySettings.readShortcutsCount(ctx);
        String shortcutPreview = GboardSwiftKeySettings.readShortcutsPreview(ctx, 5);

        String title = text(R.string.gboard_patches_swiftkey_mode_title);
        String summary = text(R.string.gboard_patches_swiftkey_mode_summary);
        String badge = text(R.string.gboard_patches_header_badge);

        List<GboardPatchesSettingsContract.Row> masterRows =
                new ArrayList<GboardPatchesSettingsContract.Row>();
        masterRows.add(new GboardPatchesSettingsContract.ToggleRow(
                text(R.string.gboard_patches_swiftkey_mode_enabled_title),
                text(R.string.gboard_patches_swiftkey_mode_enabled_summary),
                true,
                enabled,
                value -> {
                    GboardSwiftKeySettings.writeEnabled(ctx, value);
                    GboardSwiftKeyRuntime.invalidateCache();
                    GboardPatchesSettingsContract.refresh(host);
                }).setMasterToggle(true));

        List<GboardPatchesSettingsContract.Row> typingRows =
                new ArrayList<GboardPatchesSettingsContract.Row>();
        typingRows.add(new GboardPatchesSettingsContract.ToggleRow(
                text(R.string.gboard_patches_swiftkey_shift_case_title),
                text(R.string.gboard_patches_swiftkey_shift_case_summary),
                enabled,
                shiftCase,
                value -> {
                    GboardSwiftKeySettings.writeShiftCaseEnabled(ctx, value);
                    GboardSwiftKeyRuntime.invalidateCache();
                    GboardPatchesSettingsContract.refresh(host);
                }));
        String triggerLabel = GboardSwiftKeySettings.TRIGGER_SINGLE_TAP.equals(trigger)
                ? text(R.string.gboard_patches_swiftkey_shift_trigger_single)
                : text(R.string.gboard_patches_swiftkey_shift_trigger_double);
        typingRows.add(new GboardPatchesSettingsContract.SelectorRow(
                text(R.string.gboard_patches_swiftkey_shift_trigger_title),
                text(R.string.gboard_patches_swiftkey_shift_trigger_summary),
                triggerLabel,
                enabled && shiftCase,
                () -> GboardPatchesSettingsContract.showChoiceDialog(
                        host,
                        text(R.string.gboard_patches_swiftkey_shift_trigger_title),
                        new String[] {
                                text(R.string.gboard_patches_swiftkey_shift_trigger_double),
                                text(R.string.gboard_patches_swiftkey_shift_trigger_single)
                        },
                        new String[] {
                                GboardSwiftKeySettings.TRIGGER_DOUBLE_TAP,
                                GboardSwiftKeySettings.TRIGGER_SINGLE_TAP
                        },
                        trigger,
                        null,
                        null,
                        selected -> {
                            GboardSwiftKeySettings.writeShiftTrigger(ctx, selected);
                            GboardSwiftKeyRuntime.invalidateCache();
                            GboardPatchesSettingsContract.refresh(host);
                        })));
        typingRows.add(new GboardPatchesSettingsContract.ToggleRow(
                text(R.string.gboard_patches_swiftkey_punct_trim_title),
                text(R.string.gboard_patches_swiftkey_punct_trim_summary),
                enabled,
                punctTrim,
                value -> {
                    GboardSwiftKeySettings.writePunctTrimEnabled(ctx, value);
                    GboardSwiftKeyRuntime.invalidateCache();
                    GboardPatchesSettingsContract.refresh(host);
                }));

        List<GboardPatchesSettingsContract.Row> shortcutRows =
                new ArrayList<GboardPatchesSettingsContract.Row>();
        shortcutRows.add(new GboardPatchesSettingsContract.ToggleRow(
                text(R.string.gboard_patches_swiftkey_shortcuts_enabled_title),
                text(R.string.gboard_patches_swiftkey_shortcuts_enabled_summary),
                enabled,
                shortcutsEnabled,
                value -> {
                    GboardSwiftKeySettings.writeShortcutsEnabled(ctx, value);
                    GboardPatchesSettingsContract.refresh(host);
                }));
        shortcutRows.add(new GboardPatchesSettingsContract.CommandRow(
                text(R.string.gboard_patches_swiftkey_shortcuts_add_title),
                text(R.string.gboard_patches_swiftkey_shortcuts_add_summary),
                enabled && shortcutsEnabled,
                () -> GboardPatchesSettingsContract.showTextInputDialog(
                        host,
                        text(R.string.gboard_patches_swiftkey_shortcuts_add_dialog_title),
                        text(R.string.gboard_patches_swiftkey_shortcuts_add_dialog_hint),
                        "",
                        raw -> {
                            int added = GboardSwiftKeySettings.addShortcutsFromInput(ctx, raw);
                            GboardPatchesSettingsContract.showMessage(
                                    host,
                                    added > 0
                                            ? GboardSettingsText.format(
                                                    textContext,
                                                    R.string.gboard_patches_swiftkey_shortcuts_added_toast,
                                                    added)
                                            : text(R.string.gboard_patches_swiftkey_shortcuts_add_invalid_toast));
                            GboardPatchesSettingsContract.refresh(host);
                        })));
        String savedShortcutsSummary = shortcutCount == 0
                ? text(R.string.gboard_patches_swiftkey_shortcuts_saved_empty)
                : GboardSettingsText.format(
                        textContext,
                        R.string.gboard_patches_swiftkey_shortcuts_saved_preview,
                        shortcutCount,
                        shortcutPreview);
        shortcutRows.add(new GboardPatchesSettingsContract.DangerRow(
                text(R.string.gboard_patches_swiftkey_shortcuts_saved_title),
                savedShortcutsSummary,
                shortcutCount > 0,
                () -> {
                    GboardSwiftKeySettings.clearShortcuts(ctx);
                    GboardPatchesSettingsContract.showMessage(
                            host, text(R.string.gboard_patches_swiftkey_shortcuts_cleared_toast));
                    GboardPatchesSettingsContract.refresh(host);
                },
                text(R.string.gboard_patches_swiftkey_shortcuts_clear_confirm_title),
                text(R.string.gboard_patches_swiftkey_shortcuts_clear_confirm_message)));

        List<GboardPatchesSettingsContract.Row> presetRows =
                new ArrayList<GboardPatchesSettingsContract.Row>();
        presetRows.add(new GboardPatchesSettingsContract.ToggleRow(
                text(R.string.gboard_patches_swiftkey_preset_title),
                text(R.string.gboard_patches_swiftkey_preset_summary),
                true,
                presetApplied,
                value -> {
                    GboardSwiftKeySettings.setPresetApplied(ctx, value);
                    GboardPatchesSettingsContract.showMessage(
                            host,
                            value
                                    ? text(R.string.gboard_patches_swiftkey_preset_applied_toast)
                                    : text(R.string.gboard_patches_swiftkey_preset_restored_toast));
                    GboardPatchesSettingsContract.refresh(host);
                }).setRestartRequired(GboardSwiftKeySettings.PREF_KEY_PRESET_APPLIED));

        List<GboardPatchesSettingsContract.Section> sections =
                new ArrayList<GboardPatchesSettingsContract.Section>();
        sections.add(new GboardPatchesSettingsContract.Section(
                text(R.string.gboard_patches_flag_patch_section_feature), masterRows));
        sections.add(new GboardPatchesSettingsContract.Section(
                text(R.string.gboard_patches_swiftkey_section_typing), typingRows));
        sections.add(new GboardPatchesSettingsContract.Section(
                text(R.string.gboard_patches_swiftkey_section_shortcuts), shortcutRows));
        sections.add(new GboardPatchesSettingsContract.Section(
                text(R.string.gboard_patches_swiftkey_section_preset), presetRows));

        return new GboardPatchesSettingsContract.Screen(
                title,
                badge,
                title,
                summary,
                Collections.emptyList(),
                sections);
    }

    private String text(int resId) {
        return GboardSettingsText.get(textContext, resId);
    }
}
