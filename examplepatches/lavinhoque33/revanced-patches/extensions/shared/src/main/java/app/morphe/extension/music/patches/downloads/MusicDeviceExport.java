/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-20.
 */
package app.morphe.extension.music.patches.downloads;

import static app.morphe.extension.shared.utils.StringRef.str;

import android.app.Activity;
import android.app.AlertDialog;
import android.database.Cursor;
import android.net.Uri;
import android.provider.MediaStore;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Map;

import app.morphe.extension.shared.downloads.PortableExport;
import app.morphe.extension.shared.downloads.PortableExportDialog;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;

/** Entry from the existing Downloads settings group; independent of the active download method. */
public final class MusicDeviceExport {
    private MusicDeviceExport() {}

    public static void show(Activity activity) {
        String[] actions = {str("rvx_export_file"), str("rvx_export_playlist")};
        new AlertDialog.Builder(activity)
                .setTitle(str("morphe_music_export_device_files_title"))
                .setItems(actions, (dialog, which) -> choose(activity, which == 1, actions[which]))
                .setNegativeButton(android.R.string.cancel, null)
                .show();
    }

    private static void choose(Activity activity, boolean playlist, String title) {
        AlertDialog loading = new AlertDialog.Builder(activity)
                .setTitle(title)
                .setMessage(str("rvx_export_loading"))
                .setNegativeButton(android.R.string.cancel, null)
                .show();
        Utils.runOnBackgroundThread(() -> {
            try {
                Map<Long, Uri> published = NativeAudioStore.publishedAudioForExport();
                List<PortableExport.Request> choices = playlist ? NativePlaylistStore.publishedPlaylistsForExport(published)
                        : readFiles(activity, published);
                Utils.runOnMainThread(() -> showChoices(activity, loading, title, playlist, choices));
            } catch (RuntimeException ex) {
                Logger.printDebug(() -> "Could not list the published Music downloads", ex);
                Utils.runOnMainThread(() -> {
                    if (activity.isFinishing() || activity.isDestroyed() || !loading.isShowing()) return;
                    loading.dismiss();
                    showMessage(activity, title, "rvx_export_list_failed");
                });
            }
        });
    }

    private static List<PortableExport.Request> readFiles(Activity activity, Map<Long, Uri> published) {
        if (published.isEmpty()) return List.of();
        List<PortableExport.Request> files = new ArrayList<>();
        var resolver = activity.getApplicationContext().getContentResolver();
        String[] columns = {MediaStore.Audio.Media.DISPLAY_NAME};
        int unavailable = 0;
        for (Uri source : published.values()) {
            try (Cursor cursor = resolver.query(source, columns, null, null, null)) {
                if (cursor == null || !cursor.moveToFirst()) continue;
                String name = cursor.getString(0);
                if (name != null && !name.isBlank()) files.add(new PortableExport.Request(name, false, List.of(source)));
            } catch (SecurityException | IllegalArgumentException ex) {
                // An ejected volume or a revoked source must not hide files from other volumes.
                unavailable++;
            }
        }
        if (files.isEmpty() && unavailable > 0) throw new IllegalStateException("No published audio row was readable");
        files.sort(Comparator.comparing(PortableExport.Request::title, String.CASE_INSENSITIVE_ORDER));
        return files;
    }

    private static void showChoices(Activity activity, AlertDialog loading, String title, boolean playlist,
                                    List<PortableExport.Request> choices) {
        if (activity.isFinishing() || activity.isDestroyed() || !loading.isShowing()) return;
        loading.dismiss();
        if (choices.isEmpty()) {
            showMessage(activity, title, playlist ? "rvx_export_no_playlists" : "rvx_export_no_files");
            return;
        }
        String[] names = new String[choices.size()];
        for (int index = 0; index < names.length; index++) {
            var choice = choices.get(index);
            names[index] = playlist ? str("rvx_export_playlist_choice", choice.title(), choice.media().size())
                    : choice.title();
        }
        new AlertDialog.Builder(activity)
                .setTitle(title)
                .setItems(names, (dialog, which) -> PortableExportDialog.show(activity, choices.get(which)))
                .setNegativeButton(android.R.string.cancel, null)
                .show();
    }

    private static void showMessage(Activity activity, String title, String messageKey) {
        new AlertDialog.Builder(activity)
                .setTitle(title)
                .setMessage(str(messageKey))
                .setPositiveButton(android.R.string.ok, null)
                .show();
    }
}
