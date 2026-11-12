/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.graphics.Bitmap;

import java.io.File;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Telegram's photo editor applies a crop by drawing the photo it shows into a new, cropped copy.
 * When that photo isn't loaded, or drawing the copy fails, Telegram gives up on the crop without a
 * word: Done closes the crop view and Send goes on, so the photo goes out whole, cropped-out part
 * included. With the switch on, either failure stops the crop where it is instead. Done and Send
 * leave the editor open and say to try again, and the next tap runs the crop from the start.
 * Videos are cropped as they're sent, so they're left as they are. A live photo's still is a
 * cropped copy like a photo's, so a copy that fails holds it too, and so does a still that can't
 * be read from its file.
 */
public final class CropGuard {
    private CropGuard() {}

    // Set by a failed crop and read right after it, both on the main thread.
    private static boolean failed;

    /** Called as Telegram starts applying an edit, so an older failure isn't read as this one's. */
    public static void begin() {
        HookStatus.invoked(FamilyNames.CROP_GUARD);
        failed = false;
    }

    /**
     * Asked before a photo's crop is applied.
     *
     * @param photo the photo the editor shows, or null when it isn't loaded
     * @return true to stop the crop, leaving the photo and its edits as they were
     */
    public static boolean missing(Bitmap photo) {
        if (photo != null && !photo.isRecycled()) return false;
        return fail("photo not loaded");
    }

    /**
     * Asked once the cropped copy of a photo is drawn.
     *
     * @param cropped the copy, or null when Telegram couldn't draw it
     * @return true to stop the crop before the copy is used and take the crop back off the photo
     */
    public static boolean notMade(Bitmap cropped) {
        if (cropped != null) return false;
        return fail("cropped copy not made");
    }

    /**
     * Asked as a live photo's still is read from its file, which happens after Telegram has set the
     * new crop on the photo.
     *
     * @param still the still, or null when the file couldn't be read
     * @return true to stop the crop there and take it back off the photo
     */
    public static boolean stillUnread(Bitmap still) {
        if (still != null) return false;
        return fail("still not read");
    }

    /**
     * Called as a failed crop is taken back off the photo, once for each file it leaves behind: the
     * drawing Telegram cropped for it and, when the crop stopped at the still's read, the photo's
     * earlier edited copy and its thumbnail, which Telegram deletes before it draws a new copy. The
     * photo no longer points at any of them, so they're deleted here instead of left in the cache.
     *
     * @param path the file, or null when the photo has none
     */
    public static void dropCopy(String path) {
        if (path == null) return;
        try {
            File file = new File(path);
            if (!file.delete() && file.exists()) HookStatus.counted(FamilyNames.CROP_GUARD, "file not deleted");
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.CROP_GUARD, "file", failure);
        }
    }

    /**
     * Asked by Done and Send right after the edit is applied.
     *
     * @return true when the crop failed, so they keep the editor open
     */
    public static boolean held() {
        if (!failed) return false;
        failed = false;
        try {
            Utils.showToastShort(L10n.t("Couldn't crop the photo. Try again."));
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.CROP_GUARD, "toast", failure);
        }
        return true;
    }

    private static boolean fail(String why) {
        if (!on()) return false;
        failed = true;
        HookStatus.counted(FamilyNames.CROP_GUARD, why);
        return true;
    }

    /** Whether the switch is on and HushTelegram isn't paused. */
    static boolean on() {
        try {
            return Utils.settingsReady() && Settings.CROP_GUARD.get();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.CROP_GUARD, "switch", failure);
            return false;
        }
    }
}
