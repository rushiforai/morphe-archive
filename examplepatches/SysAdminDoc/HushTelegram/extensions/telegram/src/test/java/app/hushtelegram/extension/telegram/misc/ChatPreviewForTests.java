/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

/** Asks {@link ChatPreview} whether it would act, since the unpatched app has no chat preview menu. */
public final class ChatPreviewForTests {
    private ChatPreviewForTests() {}

    public static boolean active() {
        return ChatPreview.active();
    }
}
