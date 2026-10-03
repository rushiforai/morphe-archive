/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.comment;

import android.content.Context;
import java.util.ArrayList;
import java.util.List;
import kotlin.jvm.functions.Function0;
import app.hushgram.extension.instagram.download.CommentPhotoDownload;
import app.hushgram.extension.instagram.download.MediaSave;
import app.hushgram.extension.instagram.settings.FamilyNames;
import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.Utils;
import app.hushgram.extension.shared.diagnostics.HookStatus;

/** An explicit Save action in the selected comment's native menu, for the comment's own photo. */
public final class CommentPhoto {
    private CommentPhoto() {}

    interface NativeRows {
        List<MediaSave.Rendition> photo(Object comment);
        Object row(Object callback);
        Object callback(Object row);
    }

    interface Save {
        void photo(Context context, List<MediaSave.Rendition> snapshot);
    }

    private static final NativeRows NATIVE = new NativeRows() {
        public List<MediaSave.Rendition> photo(Object comment) {
            return CommentPhotoDownload.snapshot(CommentPhotoNative.photoMedia(comment));
        }
        public Object row(Object callback) { return CommentPhotoNative.newRow(callback); }
        public Object callback(Object row) { return CommentPhotoNative.callback(row); }
    };

    private static final Save SAVE = CommentPhotoDownload::save;

    public static List<?> rows(List<?> rows, Object comment, Context context) {
        return rows(rows, comment, context, NATIVE, SAVE);
    }

    static List<?> rows(List<?> rows, Object comment, Context context, NativeRows nativeRows, Save save) {
        try {
            HookStatus.invoked(FamilyNames.COMMENT_PHOTO);
            if (rows == null || context == null || comment == null || !enabled()) return rows;
            // Copied now, so the row saves the photo this menu was opened for.
            List<MediaSave.Rendition> read = nativeRows.photo(comment);
            List<MediaSave.Rendition> snapshot = read == null || read.isEmpty() ? null : CommentPhotoDownload.copy(read);
            int owned = 0;
            PhotoAction existing = null;
            for (Object row : rows) {
                Object callback = nativeRows.callback(row);
                if (callback instanceof PhotoAction) {
                    owned++;
                    existing = (PhotoAction) callback;
                }
            }
            if (snapshot == null) {
                if (owned == 0) return rows;
                List<Object> cleaned = new ArrayList<>(rows.size() - owned);
                for (Object row : rows) {
                    if (!(nativeRows.callback(row) instanceof PhotoAction)) cleaned.add(row);
                }
                return cleaned;
            }
            if (owned == 1 && samePhoto(snapshot, existing.snapshot)) return rows;
            Object photo = nativeRows.row(new PhotoAction(snapshot, context, save));
            if (photo == null) return rows;
            List<Object> augmented = new ArrayList<>(rows.size() + 1);
            for (Object row : rows) {
                if (!(nativeRows.callback(row) instanceof PhotoAction)) augmented.add(row);
            }
            augmented.add(photo);
            return augmented;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.COMMENT_PHOTO, "comment menu", failure);
            return rows;
        }
    }

    private static boolean enabled() {
        return Utils.settingsReady() && Settings.SAVE_COMMENT_PHOTOS.get();
    }

    private static boolean samePhoto(List<MediaSave.Rendition> current, List<MediaSave.Rendition> shown) {
        if (current.size() != shown.size()) return false;
        for (int i = 0; i < current.size(); i++) {
            MediaSave.Rendition a = current.get(i);
            MediaSave.Rendition b = shown.get(i);
            if (!a.url.equals(b.url) || a.width != b.width || a.height != b.height) return false;
        }
        return true;
    }

    /** Holds only the copied sizes and the short-lived menu's context. */
    public static final class PhotoAction implements Function0<Object> {
        final List<MediaSave.Rendition> snapshot;
        final Context context;
        final Save save;

        PhotoAction(List<MediaSave.Rendition> snapshot, Context context, Save save) {
            this.snapshot = snapshot;
            this.context = context;
            this.save = save;
        }

        /** Instagram ignores this result, then dismisses its menu using the stock callback. */
        @Override public Object invoke() {
            try {
                if (enabled()) save.photo(context, snapshot);
            } catch (Throwable failure) {
                HookStatus.threw(FamilyNames.COMMENT_PHOTO, "save comment photo", failure);
                CommentPhotoDownload.failed(context);
            }
            return null;
        }
    }
}
