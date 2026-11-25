/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;
import java.util.Locale;
import java.util.Set;

/**
 * Sticker files through Telegram's automatic cache cleanup (#110). Once a day Telegram deletes the
 * cached media its chats' Keep media time has run out on, and while the cache is over its size limit
 * it deletes the files used longest ago. Both walks skip a file whose path is in Telegram's set of
 * files in use. With the switch on, the answer is yes for sticker files too (.webp, .tgs and .webm),
 * so a pack you've used doesn't have to download again. Clearing the cache by hand goes another way
 * and still removes them.
 */
public final class StickerCache {
    private StickerCache() {}

    static final String KEPT = "sticker file kept through cache cleanup";

    /** The endings of Telegram's sticker files: static, animated and video stickers. */
    private static final String[] STICKER_ENDINGS = {".webp", ".tgs", ".webm"};

    /**
     * Replaces the cleanup's {@code usingFilePaths.contains(path)}.
     *
     * @param inUse Telegram's set of the paths in use
     * @param path the file's path
     * @return whether the cleanup leaves the file alone
     */
    public static boolean kept(Object inUse, Object path) {
        // Telegram's own answer comes first, and fails the way its own call would.
        if (((Set<?>) inUse).contains(path)) return true;
        HookStatus.invoked(FamilyNames.CHANGE_STICKER_SIZE);
        try {
            if (Utils.settingsReady() && Settings.KEEP_STICKER_CACHE.get() && sticker(path)) {
                HookStatus.counted(FamilyNames.CHANGE_STICKER_SIZE, KEPT);
                return true;
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.CHANGE_STICKER_SIZE, KEPT, failure);
        }
        return false;
    }

    /** Whether [path] names a sticker file, by its ending. */
    static boolean sticker(Object path) {
        if (!(path instanceof String)) return false;
        String name = ((String) path).toLowerCase(Locale.ROOT);
        for (String ending : STICKER_ENDINGS) if (name.endsWith(ending)) return true;
        return false;
    }
}
