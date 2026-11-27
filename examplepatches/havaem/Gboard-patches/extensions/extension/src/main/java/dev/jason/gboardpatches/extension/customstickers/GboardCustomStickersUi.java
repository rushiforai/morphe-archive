package dev.jason.gboardpatches.extension.customstickers;

import android.content.Context;
import android.util.Log;

import java.util.Collections;
import java.util.List;
import java.util.Locale;

import dev.jason.gboardpatches.extension.R;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsContract;
import dev.jason.gboardpatches.extension.settings.GboardSettingsText;

/** Text and screen helpers shared by the Custom Stickers settings screens. */
final class GboardCustomStickersUi {
    private static final String TAG = "GboardPatches";
    static final String[] IMAGE_TYPES = {
            "image/png", "image/webp", "image/jpeg", "image/gif"
    };
    // White, black, yellow, pink.
    static final int[] OUTLINE_COLORS = {0xFFFFFFFF, 0xFF000000, 0xFFFFD600, 0xFFFF4081};

    private final Context context;
    final String entryTitle;
    final String headerBadge;

    GboardCustomStickersUi(Context context) {
        this.context = context;
        entryTitle = text(R.string.gboard_patches_custom_stickers_title, "Custom Stickers");
        headerBadge = text(R.string.gboard_patches_header_badge, "GBOARD");
    }

    String text(int resourceId, String fallback) {
        try {
            return GboardSettingsText.get(context, resourceId);
        } catch (Throwable throwable) {
            return fallback;
        }
    }

    String stickerCount(int count) {
        return String.format(Locale.ROOT,
                text(R.string.gboard_patches_custom_stickers_sticker_count, "%1$d stickers"), count);
    }

    void showSaveFailed(GboardPatchesSettingsContract.FeatureHost host) {
        GboardPatchesSettingsContract.showMessage(host, text(
                R.string.gboard_patches_custom_stickers_save_failed, "Could not save the change."));
    }

    List<GboardPatchesSettingsContract.StatusBlock> progressBlocks(String progress) {
        return progress == null ? Collections.emptyList() : Collections.singletonList(
                new GboardPatchesSettingsContract.StatusBlock(
                        text(R.string.gboard_patches_custom_stickers_working, "Working…"),
                        progress, GboardPatchesSettingsContract.StatusTone.INFO));
    }

    GboardPatchesSettingsContract.Screen errorScreen() {
        return statusScreen(
                text(R.string.gboard_patches_custom_stickers_error_title, "Custom Stickers unavailable"),
                text(R.string.gboard_patches_custom_stickers_error_summary, ""));
    }

    GboardPatchesSettingsContract.Screen statusScreen(String title, String summary) {
        return new GboardPatchesSettingsContract.Screen(
                entryTitle, headerBadge, entryTitle, "",
                Collections.singletonList(new GboardPatchesSettingsContract.StatusBlock(
                        title, summary, GboardPatchesSettingsContract.StatusTone.WARNING)),
                Collections.emptyList());
    }

    static void runSafely(String operation, Runnable action) {
        try {
            action.run();
        } catch (Throwable throwable) {
            try {
                Log.w(TAG, "Failed to " + operation, throwable);
            } catch (Throwable ignored) {
                // Feature callbacks must not propagate into the settings host.
            }
        }
    }
}
