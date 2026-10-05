/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.patches.download;

import android.content.Context;
import android.content.SharedPreferences;
import android.net.Uri;

import androidx.annotation.Nullable;

import app.morphe.extension.crimera.downloader.FolderPicker;
import app.morphe.extension.crimera.downloader.engine.DestinationCheck;
import app.morphe.extension.instagram.utils.InstagramLogger;
import app.morphe.extension.shared.Utils;

/**
 * The one folder every Instagram download goes to. The shared downloader never stores a folder; it
 * saves where the request says, so keeping, validating and replacing the folder is done here.
 */
final class DownloadFolder {
    // Kept from the first downloader so a folder chosen then still applies.
    private static final String PREFERENCES_NAME = "piko_settings";
    private static final String KEY_TREE_URI = "custom_download_tree_uri";

    private static final String CHOOSE_FOLDER = "Choose a download folder to continue";
    private static final String FOLDER_SAVED = "Download directory updated!";
    private static final String FOLDER_NOT_SAVED = "Failed to save download folder";
    private static final String PICKER_FAILED = "Could not open folder picker";

    private DownloadFolder() {
    }

    /** The saved folder when the system still lets this app write to it, else null. */
    @Nullable
    static Uri writableTree(Context context) {
        String saved = preferences(context).getString(KEY_TREE_URI, "");
        if (saved == null || saved.isBlank()) return null;

        Uri tree = Uri.parse(saved);
        return DestinationCheck.hasPersistedWritePermission(context.getContentResolver(), tree) ? tree : null;
    }

    /** Forgets the folder, so the next download asks for a new one. */
    static void clear(Context context) {
        preferences(context).edit().remove(KEY_TREE_URI).apply();
    }

    /** Opens the system folder picker and keeps the folder the user picks. */
    static void choose(Context context) {
        Context appContext = context.getApplicationContext();
        try {
            FolderPicker.launch(context, new FolderPicker.Callback() {
                @Override
                public void onPicked(Uri tree, String displayPath, boolean persisted) {
                    // A grant that lasts only this session would lose the folder at the next launch.
                    if (!persisted) {
                        Utils.showToastShort(FOLDER_NOT_SAVED);
                        return;
                    }
                    preferences(appContext).edit().putString(KEY_TREE_URI, tree.toString()).apply();
                    Utils.showToastShort(FOLDER_SAVED);
                }

                @Override
                public void onCancelled() {
                }

                @Override
                public void onUnwritable() {
                    Utils.showToastShort(FOLDER_NOT_SAVED);
                }
            });
            Utils.showToastShort(CHOOSE_FOLDER);
        } catch (RuntimeException e) {
            InstagramLogger.printException(() -> "Could not open the folder picker", e);
            Utils.showToastShort(PICKER_FAILED);
        }
    }

    private static SharedPreferences preferences(Context context) {
        return context.getApplicationContext().getSharedPreferences(PREFERENCES_NAME, Context.MODE_PRIVATE);
    }
}
