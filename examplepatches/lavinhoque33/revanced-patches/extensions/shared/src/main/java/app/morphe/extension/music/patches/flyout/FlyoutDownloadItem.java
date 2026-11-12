/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-10.
 */
package app.morphe.extension.music.patches.flyout;

import static app.morphe.extension.shared.utils.StringRef.str;

import android.widget.TextView;

import androidx.annotation.Nullable;

import com.google.protobuf.MessageLite;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import app.morphe.extension.music.patches.downloads.LocalDownloadManager;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;

/**
 * Relabels the Download item of a song menu to "Remove download" when the song has a stream copy, so the label says
 * what the tap does. The menu item presenter keeps the item's model in a protobuf field the app obfuscates, so the
 * field is found by its type (the first protobuf message the presenter holds that names a video) instead of by name.
 */
final class FlyoutDownloadItem {
    /** Command field of the menu service item renderer. */
    private static final int MENU_SERVICE_ITEM = 66441155;
    /** Field of the service item renderer that holds its endpoint. */
    private static final int SERVICE_ENDPOINT = 3;
    /** Command field of the offline video endpoint of an account that may save the song. */
    private static final int OFFLINE_VIDEO_ENDPOINT = 73080600;

    /** The protobuf fields of a presenter class, by class; empty when it has none. */
    private static final Map<Class<?>, Field[]> MODEL_FIELDS = new ConcurrentHashMap<>();

    private FlyoutDownloadItem() {
    }

    /** Relabels the item bound to the text view when its song has a stream copy. Main thread, at bind time. */
    static void relabel(TextView textView, @Nullable Object presenter) {
        try {
            if (presenter == null) return;

            String videoId = videoIdOf(presenter);
            if (videoId == null || !LocalDownloadManager.offersRemove(videoId)) return;

            // The app sets the label after this hook, so the new text is set once that has run.
            Utils.runOnMainThreadDelayed(() -> textView.setText(str("morphe_music_remove_download")), 0L);
        } catch (Exception ex) {
            Logger.printException(() -> "FlyoutDownloadItem: could not relabel the Download item", ex);
        }
    }

    /** The video the menu item belongs to, or null for an item that names none (an album or a playlist). */
    @Nullable
    private static String videoIdOf(Object presenter) throws IllegalAccessException {
        for (Field field : modelFields(presenter.getClass())) {
            if (!(field.get(presenter) instanceof MessageLite model)) continue;

            String videoId = videoIdOf(model.toByteArray());
            if (videoId != null) return videoId;
        }
        return null;
    }

    @Nullable
    private static String videoIdOf(byte[] model) {
        try {
            ProtoMessage endpoint = new ProtoMessage(model).messagePath(MENU_SERVICE_ITEM, SERVICE_ENDPOINT);
            String videoId = FlyoutPatch.offlineUpsellVideoId(endpoint.serializedBytes());
            if (videoId.isEmpty()) videoId = endpoint.messageField(OFFLINE_VIDEO_ENDPOINT).stringField(1);
            return videoId.isEmpty() ? null : videoId;
        } catch (RuntimeException notAServiceItem) {
            return null;
        }
    }

    private static Field[] modelFields(Class<?> presenterClass) {
        return MODEL_FIELDS.computeIfAbsent(presenterClass, type -> {
            List<Field> fields = new ArrayList<>();
            for (Class<?> current = type; current != null && current != Object.class;
                 current = current.getSuperclass()) {
                for (Field field : current.getDeclaredFields()) {
                    if (!MessageLite.class.isAssignableFrom(field.getType())) continue;

                    field.setAccessible(true);
                    fields.add(field);
                }
            }
            return fields.toArray(new Field[0]);
        });
    }
}
