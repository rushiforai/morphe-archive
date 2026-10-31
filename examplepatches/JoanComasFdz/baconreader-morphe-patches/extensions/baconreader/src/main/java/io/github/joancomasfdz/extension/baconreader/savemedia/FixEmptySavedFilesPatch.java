// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader.savemedia;

import java.lang.reflect.Field;

import io.github.joancomasfdz.extension.baconreader.errors.ErrorDialog;

/**
 * Saving a post's media creates the file first, named after the post with a guessed extension
 * ("title.jpg"). The download then uses the extension of the media's URL ("title.jpeg"), in a second
 * file, and the first one stays empty.
 */
@SuppressWarnings("unused")
public final class FixEmptySavedFilesPatch {
    private FixEmptySavedFilesPatch() {
    }

    /**
     * Called before the media is downloaded to {@code target} (a DocumentFile). Deletes the app's empty
     * placeholder when it is another file, and makes the app use {@code target} for the "saved"
     * notification.
     */
    public static void onDownloadTarget(Object service, Object target) {
        try {
            if (service == null || target == null) return;
            Field field = service.getClass().getDeclaredField("completeFile");
            field.setAccessible(true);
            Object placeholder = field.get(service);
            if (placeholder == null || placeholder == target) return;

            Object placeholderUri = invoke(placeholder, "getUri");
            if (placeholderUri == null || placeholderUri.equals(invoke(target, "getUri"))) return;
            // Albums keep a folder here; only an empty file is a leftover placeholder.
            if (!Boolean.TRUE.equals(invoke(placeholder, "isFile"))) return;
            if (!Long.valueOf(0).equals(invoke(placeholder, "length"))) return;

            invoke(placeholder, "delete");
            field.set(service, target);
        } catch (Exception ex) {
            ErrorDialog.printException(() -> "Could not remove the empty file", ex);
        }
    }

    private static Object invoke(Object object, String method) throws Exception {
        return object.getClass().getMethod(method).invoke(object);
    }
}
