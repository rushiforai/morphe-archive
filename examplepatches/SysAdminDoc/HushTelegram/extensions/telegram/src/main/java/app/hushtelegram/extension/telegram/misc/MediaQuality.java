/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Photos and videos sent in their best quality without a tap first (#63).
 *
 * <p>A photo's HD button is MediaEditState's highQuality, and while nobody has pressed it for that
 * photo Telegram falls back to the HD choice it remembers from the last press. The patch asks
 * {@link #hdPhoto} about that fallback, so with the switch on a photo starts in HD and its own button
 * still turns HD off. Telegram sends a video of 1000 MB or more at its own size and bitrate, in
 * PhotoViewer.selectCompression for the editor's starting quality and in
 * SendMessagesHelper.createCompressionSettings for a video sent straight from the gallery. The patch
 * passes that limit through {@link #videoLimit}, and with the switch on every video counts as big
 * enough. The editor's quality slider can still lower one video.
 */
public final class MediaQuality {
    /** No file is smaller than this, so every video gets Telegram's own-size path. */
    static final long EVERY_VIDEO = -1L;

    private MediaQuality() {}

    /**
     * Injected where MediaEditState.isHighQuality reads Telegram's remembered HD choice.
     *
     * @param remembered that choice
     * @return whether a photo with no HD press of its own goes out in HD
     */
    public static boolean hdPhoto(boolean remembered) {
        HookStatus.invoked(FamilyNames.FASTER_DOWNLOADS);
        if (remembered) return true;
        try {
            if (!Utils.settingsReady() || !Settings.BEST_QUALITY_MEDIA.get()) return false;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.FASTER_DOWNLOADS, "best quality switch", failure);
            return false;
        }
        HookStatus.counted(FamilyNames.FASTER_DOWNLOADS, "photo started in HD");
        return true;
    }

    /**
     * Injected where Telegram loads the size from which it sends a video as it is.
     *
     * @param limit Telegram's own, 1000 MB
     * @return the limit to use
     */
    public static long videoLimit(long limit) {
        HookStatus.invoked(FamilyNames.FASTER_DOWNLOADS);
        try {
            if (!Utils.settingsReady() || !Settings.BEST_QUALITY_MEDIA.get()) return limit;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.FASTER_DOWNLOADS, "best quality switch", failure);
            return limit;
        }
        HookStatus.counted(FamilyNames.FASTER_DOWNLOADS, "video kept at its own size");
        return EVERY_VIDEO;
    }
}
