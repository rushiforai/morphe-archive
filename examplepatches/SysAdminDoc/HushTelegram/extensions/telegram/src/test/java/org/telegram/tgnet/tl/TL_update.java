/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package org.telegram.tgnet.tl;

import org.telegram.tgnet.TLRPC;

/** Test stand-ins for the two updates reaction notifications read. */
public final class TL_update {
    private TL_update() { }

    public static class TL_updateMessageReactions {
        public TLRPC.Peer peer;
        public int msg_id;
        public int top_msg_id;
        public TLRPC.TL_messageReactions reactions;
    }

    public static class TL_updateEditMessage {
        public TLRPC.Message message;
    }
}
