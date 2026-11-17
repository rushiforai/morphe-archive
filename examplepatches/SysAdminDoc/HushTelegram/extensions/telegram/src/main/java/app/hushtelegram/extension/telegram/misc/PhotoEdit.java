/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.PatchFamily;
import app.hushtelegram.extension.telegram.settings.Settings;
import java.io.File;

/**
 * Edit a copy in the message menu (#79): a photo from the chat opens in Telegram's own photo editor,
 * the one it shows for a photo you're about to send, where you can draw, add arrows, shapes or text,
 * blur parts, crop or rotate. Its send button sends the edited copy to this chat as a new photo, and
 * the photo in the chat stays as it was.
 *
 * <p>Like Copy photo, it shows only on a photo that's on the phone, and only where Telegram offers
 * Forward, so a chat that doesn't allow saving never gets it, and only in a chat you can send to.
 */
public final class PhotoEdit {
    private PhotoEdit() {}

    /** The longest side of the preview the editor shows while it loads the photo itself. */
    static final int PREVIEW = 512;

    /** Whether the menu offers Edit a copy for this message. */
    static boolean offered(Object message, boolean forwardable) {
        try {
            return forwardable && MessageMenu.on(Settings.MESSAGE_MENU_EDIT_COPY) && PatchFamily.Capability.PHOTO_EDIT.installed()
                    && MessageMenu.photo(message) && MessageMenu.canSend(message) && MessageMenu.downloaded(message) != null;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.MESSAGE_MENU_REPEAT, "edit a copy item", failure);
            return false;
        }
    }

    /** Opens the editor on the photo once its preview is read, off the main thread. */
    static void edit(Context context, Object chat, Object message) {
        File file = MessageMenu.downloaded(message);
        if (file == null || !Utils.runOnBackgroundThread(() -> {
            Bitmap preview = preview(file);
            Utils.runOnMainThread(() -> show(context, chat, file, preview));
        })) {
            MessageMenu.feedback(context, L10n.t(context, "Couldn't open that. Try again."));
        }
    }

    private static void show(Context context, Object chat, File file, Bitmap preview) {
        try {
            if (preview == null || !open(chat, file.getAbsolutePath(), preview)) {
                MessageMenu.feedback(context, L10n.t(context, "Couldn't open that. Try again."));
                return;
            }
            HookStatus.counted(FamilyNames.MESSAGE_MENU_REPEAT, "photo editor opened");
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.MESSAGE_MENU_REPEAT, "photo editor", failure);
            MessageMenu.feedback(context, L10n.t(context, "Couldn't open that. Try again."));
        }
    }

    /** The photo shrunk by a power of two until its longer side is at most {@link #PREVIEW}, or null when it can't be read. */
    static Bitmap preview(File file) {
        try {
            BitmapFactory.Options bounds = new BitmapFactory.Options();
            bounds.inJustDecodeBounds = true;
            BitmapFactory.decodeFile(file.getAbsolutePath(), bounds);
            int longer = Math.max(bounds.outWidth, bounds.outHeight);
            if (longer <= 0) return null;
            BitmapFactory.Options options = new BitmapFactory.Options();
            options.inSampleSize = 1;
            while (longer / options.inSampleSize > PREVIEW) options.inSampleSize *= 2;
            return BitmapFactory.decodeFile(file.getAbsolutePath(), options);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.MESSAGE_MENU_REPEAT, "photo preview", failure);
            return null;
        }
    }

    /**
     * Opens Telegram's photo editor on the photo at {@code path} in this chat, with {@code preview}
     * showing while it loads, the way Telegram opens its video editor. Replaced when patching.
     */
    public static boolean open(Object chat, String path, Bitmap preview) { return false; }

    /** Telegram's photo editor icon. Replaced when patching. */
    public static int icon() { return 0; }
}
