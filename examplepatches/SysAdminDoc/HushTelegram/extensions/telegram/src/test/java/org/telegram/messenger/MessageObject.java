/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package org.telegram.messenger;

import org.telegram.tgnet.TLRPC;

/** Test stand-in for the peer-to-dialog rule the extension borrows. */
public class MessageObject {
    public static long getPeerId(TLRPC.Peer peer) {
        if (peer == null) return 0;
        if (peer.user_id != 0) return peer.user_id;
        if (peer.chat_id != 0) return -peer.chat_id;
        return -peer.channel_id;
    }
}
