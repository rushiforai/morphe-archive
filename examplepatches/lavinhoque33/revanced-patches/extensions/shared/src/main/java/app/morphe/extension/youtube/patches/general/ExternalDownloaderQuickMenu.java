/*
 * Copyright (C) 2026 lavinhoque33
 *
 * This file is part of the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-10-24.
 *
 * The quick download menu idea comes from Morphe:
 * https://github.com/MorpheApp/morphe-patches/pull/3883
 */

package app.morphe.extension.youtube.patches.general;

import static app.morphe.extension.shared.utils.StringRef.str;

import android.app.Activity;
import android.app.AlertDialog;
import android.os.Bundle;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import java.util.List;

import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.settings.Settings;

/**
 * A menu shown by the video download buttons that queues a video or audio download
 * in the background of the external downloader, using the downloader's default settings.
 * <p>
 * Only downloaders that understand the quick download extras of YTDLnis are supported.
 */
public final class ExternalDownloaderQuickMenu {
    private static final String YTDLNIS_PACKAGE = "com.deniscerri.ytdl";

    /**
     * YTindir is a YTDLnis fork that also applies the requested quality.
     */
    private static final String YTINDIR_PACKAGE = "com.rl.ytindr";

    private static final List<String> SUPPORTED_PACKAGES = List.of(YTDLNIS_PACKAGE, YTINDIR_PACKAGE);

    private static final String TYPE_VIDEO = "video";
    private static final String TYPE_AUDIO = "audio";
    private static final int QUICK_VIDEO_HEIGHT = 1080;
    private static final int QUICK_AUDIO_KBPS = 192;

    /**
     * Receives the extras to add to the download intent.
     * A null value opens the downloader as usual.
     */
    public interface Launcher {
        void launch(@Nullable Bundle extras);
    }

    private ExternalDownloaderQuickMenu() {
    }

    /**
     * @return If the menu is enabled and the chosen downloader supports quick downloads.
     */
    public static boolean isAvailable(@NonNull String downloaderPackageName) {
        return Settings.EXTERNAL_DOWNLOADER_QUICK_MENU.get()
                && SUPPORTED_PACKAGES.contains(downloaderPackageName.trim());
    }

    /**
     * Shows the menu, or opens the downloader as usual if no activity is available.
     */
    public static void show(@NonNull String downloaderPackageName, @NonNull Launcher launcher) {
        final Activity activity = Utils.getActivity();
        if (activity == null) {
            launcher.launch(null);
            return;
        }

        final boolean showQuality = YTINDIR_PACKAGE.equals(downloaderPackageName.trim());
        final String[] labels = {
                str(showQuality ? "morphe_external_downloader_quick_menu_video_quality"
                        : "morphe_external_downloader_quick_menu_video"),
                str(showQuality ? "morphe_external_downloader_quick_menu_audio_quality"
                        : "morphe_external_downloader_quick_menu_audio"),
                str("morphe_external_downloader_quick_menu_all_options")
        };

        new AlertDialog.Builder(activity)
                .setTitle(str("morphe_external_downloader_quick_menu_title_dialog"))
                .setItems(labels, (dialog, which) -> launcher.launch(createExtras(which, showQuality)))
                .show();
    }

    @Nullable
    private static Bundle createExtras(int selectedIndex, boolean applyQuality) {
        final Bundle extras = new Bundle();
        switch (selectedIndex) {
            case 0:
                extras.putString("TYPE", TYPE_VIDEO);
                if (applyQuality) extras.putInt("VIDEO_QUALITY", QUICK_VIDEO_HEIGHT);
                break;
            case 1:
                extras.putString("TYPE", TYPE_AUDIO);
                if (applyQuality) extras.putInt("AUDIO_BITRATE", QUICK_AUDIO_KBPS);
                break;
            default:
                return null;
        }
        extras.putBoolean("BACKGROUND", true);

        return extras;
    }
}
