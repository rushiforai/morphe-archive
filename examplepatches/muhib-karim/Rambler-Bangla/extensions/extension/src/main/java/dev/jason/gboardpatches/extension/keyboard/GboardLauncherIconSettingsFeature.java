package dev.jason.gboardpatches.extension.keyboard;

import android.content.Context;

import java.util.Collections;

import dev.jason.gboardpatches.extension.R;
import dev.jason.gboardpatches.extension.settings.GboardPatchesIcons;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsContract;
import dev.jason.gboardpatches.extension.settings.GboardSettingsText;

/**
 * Patches → Keyboard: live toggle to hide/restore Rambler Bangla's app drawer launcher icon.
 */
public final class GboardLauncherIconSettingsFeature
        implements GboardPatchesSettingsContract.Feature {
    private final Context textContext;

    public GboardLauncherIconSettingsFeature(Context context) {
        this.textContext = context;
    }

    @Override
    public String getEntryTitle() {
        return text(R.string.gboard_patches_launcher_icon_title);
    }

    @Override
    public String getEntrySummary() {
        return text(R.string.gboard_patches_launcher_icon_summary);
    }

    @Override
    public int getEntryIcon() {
        return GboardPatchesIcons.VISIBILITY_OFF;
    }

    @Override
    public String getEntryTone() {
        return "amber";
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
        return true;
    }

    @Override
    public GboardPatchesSettingsContract.Screen buildScreen(
            GboardPatchesSettingsContract.FeatureHost host) {
        Context ctx = host == null ? textContext : host.getContext();
        boolean hidden = GboardRamblerKeyboardPrefs.readHideLauncherIcon(ctx);
        String title = text(R.string.gboard_patches_launcher_icon_title);
        String summary = text(R.string.gboard_patches_launcher_icon_summary);
        String badge = text(R.string.gboard_patches_header_badge);
        return new GboardPatchesSettingsContract.Screen(
                title,
                badge,
                title,
                summary,
                Collections.emptyList(),
                Collections.singletonList(new GboardPatchesSettingsContract.Section(
                        text(R.string.gboard_patches_launcher_icon_section),
                        Collections.singletonList(new GboardPatchesSettingsContract.ToggleRow(
                                text(R.string.gboard_patches_launcher_icon_enabled_title),
                                text(R.string.gboard_patches_launcher_icon_enabled_summary),
                                true,
                                hidden,
                                value -> {
                                    boolean ok = GboardRamblerKeyboardPrefs
                                            .setLauncherIconHidden(ctx, value);
                                    GboardPatchesSettingsContract.showMessage(
                                            host,
                                            text(ok
                                                    ? (value
                                                            ? R.string.gboard_patches_launcher_icon_toast_hidden
                                                            : R.string.gboard_patches_launcher_icon_toast_shown)
                                                    : R.string.gboard_patches_launcher_icon_toast_failed));
                                    GboardPatchesSettingsContract.refresh(host);
                                })))));
    }

    private String text(int resId) {
        return GboardSettingsText.get(textContext, resId);
    }
}
