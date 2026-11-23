package dev.jason.gboardpatches.extension.advancedvoice;

import android.content.Context;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import dev.jason.gboardpatches.extension.R;
import dev.jason.gboardpatches.extension.settings.GboardPatchesFeatureAvailability;
import dev.jason.gboardpatches.extension.settings.GboardPatchesIcons;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsContract;
import dev.jason.gboardpatches.extension.settings.GboardSettingsText;

/** The three stock dictation switches, moved out of the Parakeet page into the patch settings. */
public final class GboardVoiceTypingExtrasSettingsFeature
        implements GboardPatchesSettingsContract.Feature {
    private final String title;
    private final String summary;
    private final String entrySummary;
    private final String badge;
    private final String section;
    private final String errorTitle;
    private final String errorSummary;

    public GboardVoiceTypingExtrasSettingsFeature(Context context) {
        title = text(context, R.string.gboard_patches_voice_extras_title);
        summary = text(context, R.string.gboard_patches_voice_extras_summary);
        entrySummary = text(context, R.string.gboard_patches_voice_extras_entry_summary);
        badge = text(context, R.string.gboard_patches_header_badge);
        section = text(context, R.string.gboard_patches_voice_extras_section);
        errorTitle = text(context, R.string.gboard_patches_voice_extras_error_title);
        errorSummary = text(context, R.string.gboard_patches_voice_extras_error_summary);
    }

    @Override public String getEntryTitle() { return title; }
    @Override public String getEntrySummary() { return entrySummary; }
    @Override public int getEntryIcon() { return GboardPatchesIcons.PLAY; }
    @Override public String getEntryTone() { return "blue"; }

    @Override public boolean isAvailable(Context context) {
        return GboardPatchesFeatureAvailability.hasFeature(
                context, GboardPatchesFeatureAvailability.FEATURE_ADVANCED_VOICE_TYPING);
    }

    @Override public GboardPatchesSettingsContract.Screen buildScreen(
            GboardPatchesSettingsContract.FeatureHost host) {
        try {
            Context context = host == null ? null : host.getContext();
            if (context == null) {
                return errorScreen();
            }
            List<GboardPatchesSettingsContract.Row> rows = new ArrayList<>();
            rows.add(toggle(context, GboardVoiceTypingExtras.ADVANCED_FEATURES,
                    R.string.gboard_patches_voice_extras_features_title,
                    R.string.gboard_patches_voice_extras_features_summary));
            rows.add(toggle(context, GboardVoiceTypingExtras.AUTO_PUNCTUATION,
                    R.string.gboard_patches_voice_extras_punctuation_title,
                    R.string.gboard_patches_voice_extras_punctuation_summary));
            rows.add(toggle(context, GboardVoiceTypingExtras.LANGUAGE_SWITCHING,
                    R.string.gboard_patches_voice_extras_language_title,
                    R.string.gboard_patches_voice_extras_language_summary));
            return new GboardPatchesSettingsContract.Screen(
                    title, badge, title, summary,
                    Collections.emptyList(),
                    Collections.singletonList(new GboardPatchesSettingsContract.Section(
                            section, rows)));
        } catch (Throwable failure) {
            return errorScreen();
        }
    }

    private GboardPatchesSettingsContract.Row toggle(Context context, String key, int titleId,
            int summaryId) {
        boolean checked = GboardVoiceTypingExtras.read(context, key, true);
        return new GboardPatchesSettingsContract.ToggleRow(
                text(context, titleId), text(context, summaryId), true, checked,
                value -> GboardVoiceTypingExtras.write(context, key, value));
    }

    private GboardPatchesSettingsContract.Screen errorScreen() {
        return new GboardPatchesSettingsContract.Screen(
                title, badge, errorTitle, errorSummary,
                Collections.emptyList(), Collections.emptyList());
    }

    private static String text(Context context, int resourceId) {
        return GboardSettingsText.get(context, resourceId);
    }
}
