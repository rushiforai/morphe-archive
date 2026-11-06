/*
 * Copyright (C) 2026 lavinhoque33
 *
 * This file is part of the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-10-10.
 * Modified by lavinhoque33, 2026-10-24.
 */

package app.morphe.extension.youtube.patches.general.offline;

import android.content.Context;

import androidx.annotation.Nullable;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;

/**
 * Metadata of the downloads, kept as JSON in {@code filesDir/rvx_offline/index.json}.
 * The media files themselves live in MediaStore (the video and audio folders of the settings).
 * Entries are identified by {@link OfflineVideo#key()}, which is the video id for videos.
 */
public final class OfflineIndex {
    private static final String DIRECTORY = "rvx_offline";
    private static final String INDEX_FILE = "index.json";
    private static final String THUMBNAILS = "thumbs";

    private static final Object LOCK = new Object();
    private static final CopyOnWriteArrayList<Runnable> listeners = new CopyOnWriteArrayList<>();

    @Nullable
    private static List<OfflineVideo> entries;

    private OfflineIndex() {
    }

    static File getDirectory(Context context) {
        File directory = new File(context.getFilesDir(), DIRECTORY);
        //noinspection ResultOfMethodCallIgnored
        directory.mkdirs();
        return directory;
    }

    static File getThumbnailFile(Context context, String key) {
        File directory = new File(getDirectory(context), THUMBNAILS);
        //noinspection ResultOfMethodCallIgnored
        directory.mkdirs();
        return new File(directory, key + ".jpg");
    }

    private static List<OfflineVideo> loaded() {
        if (entries != null) return entries;
        List<OfflineVideo> result = new ArrayList<>();
        File file = new File(getDirectory(Utils.getContext()), INDEX_FILE);
        if (file.isFile()) {
            try (InputStream input = new FileInputStream(file)) {
                byte[] bytes = new byte[(int) file.length()];
                int offset = 0;
                while (offset < bytes.length) {
                    int read = input.read(bytes, offset, bytes.length - offset);
                    if (read < 0) break;
                    offset += read;
                }
                JSONArray array = new JSONArray(new String(bytes, 0, offset, StandardCharsets.UTF_8));
                for (int i = 0; i < array.length(); i++) {
                    JSONObject json = array.optJSONObject(i);
                    OfflineVideo video = json == null ? null : OfflineVideo.fromJson(json);
                    if (video != null) result.add(video);
                }
            } catch (Exception ex) {
                Logger.printException(() -> "Could not read the offline index", ex);
            }
        }
        entries = result;
        return result;
    }

    private static void saveLocked() {
        List<OfflineVideo> list = loaded();
        File directory = getDirectory(Utils.getContext());
        File temporary = new File(directory, INDEX_FILE + ".tmp");
        try {
            JSONArray array = new JSONArray();
            for (OfflineVideo video : list) array.put(video.toJson());
            try (OutputStream output = new FileOutputStream(temporary)) {
                output.write(array.toString().getBytes(StandardCharsets.UTF_8));
                output.flush();
            }
            if (!temporary.renameTo(new File(directory, INDEX_FILE))) {
                throw new IllegalStateException("Could not replace the offline index");
            }
        } catch (Exception ex) {
            Logger.printException(() -> "Could not save the offline index", ex);
        }
    }

    /** @return A snapshot of every entry, in insertion order. */
    public static List<OfflineVideo> getAll() {
        synchronized (LOCK) {
            return new ArrayList<>(loaded());
        }
    }

    /** @param key The video id for videos, see {@link OfflineVideo#key()}. */
    @Nullable
    public static OfflineVideo get(String key) {
        synchronized (LOCK) {
            for (OfflineVideo video : loaded()) {
                if (video.key().equals(key)) return video;
            }
            return null;
        }
    }

    static void put(OfflineVideo video) {
        synchronized (LOCK) {
            List<OfflineVideo> list = loaded();
            for (int i = 0; i < list.size(); i++) {
                if (list.get(i).key().equals(video.key())) {
                    OfflineCaptions.delete(Utils.getContext(), list.get(i));
                    list.remove(i);
                    break;
                }
            }
            list.add(video);
            saveLocked();
        }
        notifyListeners();
    }

    static void remove(String key) {
        boolean removed = false;
        synchronized (LOCK) {
            List<OfflineVideo> list = loaded();
            for (int i = 0; i < list.size(); i++) {
                OfflineVideo video = list.get(i);
                if (video.key().equals(key)) {
                    list.remove(i);
                    OfflineCaptions.delete(Utils.getContext(), video);
                    removed = true;
                    if (!video.thumbnailPath.isEmpty()) {
                        //noinspection ResultOfMethodCallIgnored
                        new File(video.thumbnailPath).delete();
                    }
                    break;
                }
            }
            if (removed) saveLocked();
        }
        if (removed) notifyListeners();
    }

    /** Persists the resume position. Does not notify listeners, as nothing visible changes. */
    static void savePosition(String key, long positionMs) {
        synchronized (LOCK) {
            for (OfflineVideo video : loaded()) {
                if (video.key().equals(key)) {
                    // No equality short-circuit: the player already updated this same
                    // instance before calling here.
                    video.lastPositionMs = positionMs;
                    saveLocked();
                    return;
                }
            }
        }
    }

    static void addListener(Runnable listener) {
        listeners.addIfAbsent(listener);
    }

    static void removeListener(Runnable listener) {
        listeners.remove(listener);
    }

    private static void notifyListeners() {
        Utils.runOnMainThread(() -> {
            for (Runnable listener : listeners) listener.run();
        });
    }
}
