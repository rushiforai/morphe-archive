/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package org.telegram.messenger;

import org.telegram.tgnet.TLRPC;

/** Test stand-in for Telegram's chat helpers, with the one test Keep deleted messages asks by name. */
public final class ChatObject {
    private ChatObject() { }

    public static boolean isChannel(TLRPC.Chat chat) {
        return chat instanceof TLRPC.TL_channel;
    }
}
