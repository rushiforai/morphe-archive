/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

/** Asks {@link VolumeKeys} about a volume key, which unpatched stubs can't tell from the chat's own answer. */
public final class VolumeKeysForTests {
    private VolumeKeysForTests() {}

    /** Whether a volume key in a chat would go to the volume without the chat seeing it. */
    public static boolean keyGoesToTheVolume() {
        return VolumeKeys.keepMuted();
    }
}
