/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package org.telegram.tgnet;

/** Test stand-ins carrying the names and public fields the extension reads from Telegram's own classes. */
public final class TLRPC {
    private TLRPC() { }

    /** A group, as Telegram keeps a basic one. */
    public static class Chat {
        public String title;
        public boolean broadcast;
        public boolean megagroup;
    }

    /** A channel or supergroup. */
    public static class TL_channel extends Chat { }

    public static class TL_boolTrue { }

    public static class TL_boolFalse { }

    /** The request the phone screen sends for a login code. */
    public static class TL_auth_sendCode { }

    /** Any other request, for the cases that aren't sign-in. */
    public static class TL_auth_resendCode { }

    /** Joins a public channel or supergroup. */
    public static class TL_channels_joinChannel { }

    /** Joins a chat by its invite link. */
    public static class TL_messages_importChatInvite { }

    /** Looks an invite link up before joining. */
    public static class TL_messages_checkChatInvite { }

    /** Leaving a channel, which a block on new chats lets through. */
    public static class TL_channels_leaveChannel { }

    public static class InputChannel {
        public long channel_id;
        public long access_hash;
    }

    public static class TL_inputChannel extends InputChannel { }

    /** Marks a channel or supergroup read up to max_id. */
    public static class TL_channels_readHistory {
        public InputChannel channel;
        public int max_id;
    }

    /** Telegram declares every input peer's IDs on this one class. */
    public static class InputPeer {
        public long user_id;
        public long chat_id;
        public long channel_id;
        public long access_hash;
    }

    public static class TL_inputPeerUser extends InputPeer { }

    public static class TL_inputPeerChat extends InputPeer { }

    public static class TL_inputPeerChannel extends InputPeer { }

    /** Saved Messages, which names no one. */
    public static class TL_inputPeerSelf extends InputPeer { }

    /** Marks a private chat or basic group read up to max_id. */
    public static class TL_messages_readHistory {
        public InputPeer peer;
        public int max_id;
    }

    /** Fetches posts' view counts; increment also counts a view on each. */
    public static class TL_messages_getMessagesViews {
        public InputPeer peer;
        public boolean increment;
    }

    public static class TL_messages_sendMessage {
        public InputPeer peer;
        public String message;
    }

    public static class TL_messages_sendMedia {
        public InputPeer peer;
    }

    public static class TL_inputEncryptedChat {
        public int chat_id;
        public long access_hash;
    }

    /** Marks a secret chat read up to max_date. */
    public static class TL_messages_readEncryptedHistory {
        public TL_inputEncryptedChat peer;
        public int max_date;
    }

    public static class TL_messages_sendEncrypted {
        public TL_inputEncryptedChat peer;
    }

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

    public static class TL_reactionCustomEmoji extends Reaction {
        public long document_id;
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
        public boolean reactions_as_tags;
    }

    public static class TL_messageReactions extends MessageReactions { }

    public static class Message {
        public int id;
        public boolean out;
        public Peer peer_id;
        public TL_messageReactions reactions;
        public MessageMedia media;
    }

    /** A message's attachment: a photo or a document, each null for the other kind. */
    public static class MessageMedia {
        public Photo photo;
        public Document document;
    }

    public static class TL_messageMediaPhoto extends MessageMedia { }

    public static class TL_messageMediaDocument extends MessageMedia { }

    public static class Photo {
        public java.util.ArrayList<PhotoSize> sizes = new java.util.ArrayList<>();
    }

    public static class PhotoSize {
        public String type;
    }

    public static class TL_photoSize extends PhotoSize { }

    public static class TL_photoSizeProgressive extends PhotoSize { }

    public static class TL_photoStrippedSize extends PhotoSize { }

    public static class TL_photoCachedSize extends PhotoSize { }

    public static class TL_photoPathSize extends PhotoSize { }

    public static class TL_photoSizeEmpty extends PhotoSize { }

    public static class Document {
        public long size;
        public java.util.ArrayList<PhotoSize> thumbs = new java.util.ArrayList<>();
    }

    /** The typing, recording or uploading status shown in a chat. */
    public static class TL_messages_setTyping {
        public InputPeer peer;
        public SendMessageAction action;
    }

    /** Marks voice messages and mentions as played or seen, by message id alone. */
    public static class TL_messages_readMessageContents {
        public java.util.ArrayList<Integer> id = new java.util.ArrayList<>();
    }

    /** The same status in a secret chat. */
    public static class TL_messages_setEncryptedTyping {
        public TL_inputEncryptedChat peer;
    }

    /** A person, with the fields Special contacts compares. */
    public static class User {
        public long id;
        public String first_name;
        public String last_name;
        public String username;
        public java.util.ArrayList<TL_username> usernames = new java.util.ArrayList<>();
        public String phone;
        public UserProfilePhoto photo;
        public UserStatus status;
        public boolean self;
        public boolean contact;
        public boolean mutual_contact;
        public boolean deleted;
        public boolean bot;
        public boolean min;
    }

    public static class TL_user extends User { }

    public static class TL_userEmpty extends User { }

    public static class TL_username {
        public boolean editable;
        public boolean active;
        public String username;
    }

    /** Telegram keeps the last seen time of an offline status in expires too. */
    public static class UserStatus {
        public int expires;
    }

    public static class TL_userStatusOnline extends UserStatus { }

    public static class TL_userStatusOffline extends UserStatus { }

    public static class TL_userStatusRecently extends UserStatus { }

    public static class TL_userStatusLastWeek extends UserStatus { }

    public static class TL_userStatusLastMonth extends UserStatus { }

    public static class TL_userStatusEmpty extends UserStatus { }

    public static class UserProfilePhoto {
        public long photo_id;
        public boolean personal;
        public int dc_id;
    }

    public static class TL_userProfilePhoto extends UserProfilePhoto { }

    public static class TL_userProfilePhotoEmpty extends UserProfilePhoto { }

    /** What a chat's typing line says someone is doing. */
    public static class SendMessageAction { }

    public static class TL_sendMessageTypingAction extends SendMessageAction { }

    public static class TL_sendMessageCancelAction extends SendMessageAction { }

    public static class TL_sendMessageRecordAudioAction extends SendMessageAction { }

    /** A sign-in's answer, which a bot token sign-in hands to the login screen. */
    public static class TL_auth_authorization { }

    /** Requests a bot can't make, and the empty answers a bot account gets for them on the phone. */
    public static class TL_messages_getDialogs { }

    public static class TL_messages_getHistory { }

    public static class TL_contacts_getContacts { }

    public static class TL_messages_getAllStickers { }

    public static class TL_messages_getMaskStickers { }

    public static class TL_messages_getEmojiStickers { }

    public static class TL_messages_getFeaturedStickers { }

    public static class TL_messages_getFeaturedEmojiStickers { }

    /** Telegram fills some lists where it declares them and leaves others for the reader. */
    public static class TL_messages_dialogs {
        public java.util.ArrayList<Object> dialogs = new java.util.ArrayList<>();
        public java.util.ArrayList<Object> messages;
        public java.util.ArrayList<Object> chats;
        public java.util.ArrayList<Object> users;
        public int count;
    }

    public static class TL_messages_messages {
        public java.util.ArrayList<Object> messages;
        public java.util.ArrayList<Object> chats;
        public java.util.ArrayList<Object> users;
    }

    public static class TL_contacts_contacts {
        public java.util.ArrayList<Object> contacts;
        public java.util.ArrayList<Object> users;
        public int saved_count;
    }

    public static class TL_messages_allStickers {
        public long hash;
        public java.util.ArrayList<Object> sets;
    }

    public static class TL_messages_featuredStickers {
        public java.util.ArrayList<Object> sets;
        public java.util.ArrayList<Object> unread;
    }

    public static class TL_error {
        public int code;
        public String text;

        public TL_error() {}

        public TL_error(int code, String text) {
            this.code = code;
            this.text = text;
        }
    }
}
