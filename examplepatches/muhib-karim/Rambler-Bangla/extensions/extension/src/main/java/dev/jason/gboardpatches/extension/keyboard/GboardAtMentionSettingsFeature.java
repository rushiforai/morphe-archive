package dev.jason.gboardpatches.extension.keyboard;

import android.content.Context;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import dev.jason.gboardpatches.extension.R;
import dev.jason.gboardpatches.extension.settings.GboardPatchesIcons;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsContract;
import dev.jason.gboardpatches.extension.settings.GboardSettingsText;

/**
 * Patches → Keyboard: SwiftKey-style personalized @mention & email suggestion strip
 * plus optional native fixed-list email provider completion.
 */
public final class GboardAtMentionSettingsFeature
        implements GboardPatchesSettingsContract.Feature {
    private final Context textContext;

    public GboardAtMentionSettingsFeature(Context context) {
        this.textContext = context;
    }

    @Override
    public String getEntryTitle() {
        return text(R.string.gboard_patches_at_mention_title);
    }

    @Override
    public String getEntrySummary() {
        return text(R.string.gboard_patches_at_mention_summary);
    }

    @Override
    public int getEntryIcon() {
        return GboardPatchesIcons.AT_SIGN;
    }

    @Override
    public String getEntryTone() {
        return "teal";
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
        return GboardRamblerKeyboardPrefs.isAtMentionFeatureAvailable();
    }

    @Override
    public GboardPatchesSettingsContract.Screen buildScreen(
            GboardPatchesSettingsContract.FeatureHost host) {
        Context ctx = host == null ? textContext : host.getContext();
        boolean enabled = GboardRamblerKeyboardPrefs.readAtMentionsEnabled(ctx);
        int learnedCount = GboardRamblerKeyboardPrefs.readAtMentionCount(ctx);
        String preview = GboardRamblerKeyboardPrefs.readAtMentionPreview(ctx, 6);

        String title = text(R.string.gboard_patches_at_mention_title);
        String summary = text(R.string.gboard_patches_at_mention_summary);
        String badge = text(R.string.gboard_patches_header_badge);

        List<GboardPatchesSettingsContract.Row> stripRows =
                new ArrayList<GboardPatchesSettingsContract.Row>();
        stripRows.add(new GboardPatchesSettingsContract.ToggleRow(
                text(R.string.gboard_patches_at_mention_enabled_title),
                text(R.string.gboard_patches_at_mention_enabled_summary),
                true,
                enabled,
                value -> {
                    GboardRamblerKeyboardPrefs.writeAtMentionsEnabled(ctx, value);
                    GboardPatchesSettingsContract.refresh(host);
                }));
        stripRows.add(new GboardPatchesSettingsContract.CommandRow(
                text(R.string.gboard_patches_at_mention_add_title),
                text(R.string.gboard_patches_at_mention_add_summary),
                true,
                () -> GboardPatchesSettingsContract.showTextInputDialog(
                        host,
                        text(R.string.gboard_patches_at_mention_add_dialog_title),
                        text(R.string.gboard_patches_at_mention_add_dialog_hint),
                        "",
                        raw -> {
                            int added = GboardRamblerKeyboardPrefs.addAtMentionTokens(ctx, raw);
                            GboardPatchesSettingsContract.showMessage(
                                    host,
                                    added > 0
                                            ? GboardSettingsText.format(
                                                    textContext,
                                                    R.string.gboard_patches_at_mention_added_toast,
                                                    added)
                                            : text(R.string.gboard_patches_at_mention_add_invalid_toast));
                            GboardPatchesSettingsContract.refresh(host);
                        })));

        String learnedSummary = learnedCount == 0
                ? text(R.string.gboard_patches_at_mention_learned_empty)
                : GboardSettingsText.format(
                        textContext,
                        R.string.gboard_patches_at_mention_learned_preview,
                        learnedCount,
                        preview);
        stripRows.add(new GboardPatchesSettingsContract.DangerRow(
                text(R.string.gboard_patches_at_mention_learned_title),
                learnedSummary,
                learnedCount > 0,
                () -> {
                    GboardRamblerKeyboardPrefs.clearAtMentions(ctx);
                    GboardPatchesSettingsContract.showMessage(
                            host, text(R.string.gboard_patches_at_mention_cleared_toast));
                    GboardPatchesSettingsContract.refresh(host);
                },
                text(R.string.gboard_patches_at_mention_clear_confirm_title),
                text(R.string.gboard_patches_at_mention_clear_confirm_message)));

        List<GboardPatchesSettingsContract.Section> sections =
                new ArrayList<GboardPatchesSettingsContract.Section>();
        sections.add(new GboardPatchesSettingsContract.Section(
                text(R.string.gboard_patches_at_mention_section),
                stripRows));

        if (GboardRamblerKeyboardPrefs.isHiddenFlagsAvailable()) {
            boolean nativeEmailOn = GboardRamblerKeyboardPrefs.readHiddenFlagOverride(
                    ctx, GboardRamblerKeyboardPrefs.FLAG_NATIVE_EMAIL_COMPLETION, false);
            sections.add(new GboardPatchesSettingsContract.Section(
                    text(R.string.gboard_patches_at_mention_email_section),
                    Collections.singletonList(new GboardPatchesSettingsContract.ToggleRow(
                            text(R.string.gboard_patches_native_email_completion_title),
                            text(R.string.gboard_patches_native_email_completion_summary),
                            true,
                            nativeEmailOn,
                            value -> {
                                GboardRamblerKeyboardPrefs.writeHiddenFlagOverride(
                                        ctx,
                                        GboardRamblerKeyboardPrefs.FLAG_NATIVE_EMAIL_COMPLETION,
                                        value);
                                GboardPatchesSettingsContract.refresh(host);
                            }))));
        }

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
