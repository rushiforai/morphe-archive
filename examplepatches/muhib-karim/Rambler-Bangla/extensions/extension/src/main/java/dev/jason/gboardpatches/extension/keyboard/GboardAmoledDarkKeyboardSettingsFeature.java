package dev.jason.gboardpatches.extension.keyboard;

import android.content.Context;

import java.util.Collections;

import dev.jason.gboardpatches.extension.R;
import dev.jason.gboardpatches.extension.settings.GboardPatchesIcons;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsContract;
import dev.jason.gboardpatches.extension.settings.GboardSettingsText;

/**
 * Patches → Keyboard: live 1-tap AMOLED pure-black (#000000) dark keyboard toggle.
 */
public final class GboardAmoledDarkKeyboardSettingsFeature
        implements GboardPatchesSettingsContract.Feature {
    private final Context textContext;

    public GboardAmoledDarkKeyboardSettingsFeature(Context context) {
        this.textContext = context;
    }

    @Override
    public String getEntryTitle() {
        return text(R.string.gboard_patches_amoled_dark_title);
    }

    @Override
    public String getEntrySummary() {
        return text(R.string.gboard_patches_amoled_dark_summary);
    }

    @Override
    public int getEntryIcon() {
        return GboardPatchesIcons.DARK_MODE;
    }

    @Override
    public String getEntryTone() {
        return "violet";
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
        return GboardRamblerKeyboardPrefs.isAmoledFeatureAvailable();
    }

    @Override
    public GboardPatchesSettingsContract.Screen buildScreen(
            GboardPatchesSettingsContract.FeatureHost host) {
        Context ctx = host == null ? textContext : host.getContext();
        boolean enabled = GboardRamblerKeyboardPrefs.readAmoledDarkKeyboardEnabled(ctx);
        String title = text(R.string.gboard_patches_amoled_dark_title);
        String summary = text(R.string.gboard_patches_amoled_dark_summary);
        String badge = text(R.string.gboard_patches_header_badge);
        return new GboardPatchesSettingsContract.Screen(
                title,
                badge,
                title,
                summary,
                Collections.emptyList(),
                Collections.singletonList(new GboardPatchesSettingsContract.Section(
                        text(R.string.gboard_patches_amoled_dark_section),
                        Collections.singletonList(new GboardPatchesSettingsContract.ToggleRow(
                                text(R.string.gboard_patches_amoled_dark_enabled_title),
                                text(R.string.gboard_patches_amoled_dark_enabled_summary),
                                true,
                                enabled,
                                value -> {
                                    GboardRamblerKeyboardPrefs.writeAmoledDarkKeyboardEnabled(ctx, value);
                                    GboardPatchesSettingsContract.showMessage(
                                            host,
                                            text(value
                                                    ? R.string.gboard_patches_amoled_dark_toast_on
                                                    : R.string.gboard_patches_amoled_dark_toast_off));
                                    GboardPatchesSettingsContract.refresh(host);
                                })))));
    }

    private String text(int resId) {
        return GboardSettingsText.get(textContext, resId);
    }
}
