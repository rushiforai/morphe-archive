/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package org.telegram.tgnet.tl;

import org.telegram.tgnet.TLRPC;

/** Test stand-ins for the updates reaction notifications and Special contacts read. */
public final class TL_update {
    private TL_update() { }

    public static class TL_updateUserStatus {
        public long user_id;
        public TLRPC.UserStatus status;
    }

    public static class TL_updateUserName {
        public long user_id;
        public String first_name;
        public String last_name;
        public java.util.ArrayList<TLRPC.TL_username> usernames = new java.util.ArrayList<>();
    }

    public static class TL_updateUserPhone {
        public long user_id;
        public String phone;
    }

    public static class TL_updateUserTyping {
        public long user_id;
        public int top_msg_id;
        public TLRPC.SendMessageAction action;
    }

    public static class TL_updateChatUserTyping {
        public long chat_id;
        public TLRPC.Peer from_id;
        public TLRPC.SendMessageAction action;
    }

    public static class TL_updateChannelUserTyping {
        public long channel_id;
        public int top_msg_id;
        public TLRPC.Peer from_id;
        public TLRPC.SendMessageAction action;
    }

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
