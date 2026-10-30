/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package org.telegram.tgnet;

/** Test stand-ins carrying the names and public fields the extension reads from Telegram's own classes. */
public final class TLRPC {
    private TLRPC() { }

    /** A group, as Telegram keeps a basic one. */
    public static class Chat { }

    /** A channel or supergroup. */
    public static class TL_channel extends Chat { }

    public static class TL_boolTrue { }

    public static class TL_boolFalse { }

    /** The request the phone screen sends for a login code. */
    public static class TL_auth_sendCode { }

    /** Any other request, for the cases that aren't sign-in. */
    public static class TL_auth_resendCode { }

    public static class Peer {
        public long user_id;
        public long chat_id;
        public long channel_id;
    }

    public static class TL_peerUser extends Peer { }

    public static class TL_peerChat extends Peer { }

    public static class Reaction { }

    public static class TL_reactionEmoji extends Reaction {
        public String emoticon;
    }

    public static class MessagePeerReaction {
        public int flags;
        public Peer peer_id;
        public Reaction reaction;
        public int date;
        public boolean unread;
    }

    public static class MessageReactions {
        public java.util.ArrayList<MessagePeerReaction> recent_reactions = new java.util.ArrayList<>();
    }

    public static class TL_messageReactions extends MessageReactions { }

    public static class Message {
        public int id;
        public boolean out;
        public Peer peer_id;
        public TL_messageReactions reactions;
    }

    public static class TL_error {
        public int code;
        public String text;

        public TL_error(int code, String text) {
            this.code = code;
            this.text = text;
        }
    }
}
