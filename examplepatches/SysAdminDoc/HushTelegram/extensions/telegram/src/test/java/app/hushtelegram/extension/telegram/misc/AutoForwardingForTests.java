/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import app.hushtelegram.extension.telegram.settings.Settings;

/** Lets tests give auto-forwarding a Telegram, and see what it sends. */
public final class AutoForwardingForTests {
    private AutoForwardingForTests() {}

    private static AutoForwarding.Telegram saved;

    /** One new message, as the stubs read it. */
    public static final class Message {
        public final int account;
        public final long dialog;
        public final int id;
        public boolean out;
        public boolean forwarded;
        /** Who sent it, as a dialog id. */
        public long sender;
        /** Where a forward came from, as a dialog id, or 0. */
        public long origin;
        /** When it was sent: second [id], unless a test says otherwise. */
        public int date;
        /** When the message a forward copies was first sent, or 0. */
        public int originDate;
        /** The name a forward header gives a hidden author, or null. */
        public String originName;
        /** Its photo or file, or 0. */
        public long mediaId;
        /** Its poll, or 0. */
        public long pollId;
        /** Where a location or venue is, or 0 and 0. */
        public double latitude;
        public double longitude;
        /** A shared contact's phone number, or null. */
        public String phone;
        /** A dice roll's emoji and what it landed on, or null and 0. */
        public String emoticon;
        public int diceValue;
        /** A shared story's id and whose story it is, or 0 and 0. */
        public int storyId;
        public long storyPeer;
        /** Its game, or 0. */
        public long gameId;
        /** A giveaway's end, how many win and what each gets, or 0s. */
        public int giveawayEnd;
        public int giveawayCount;
        public int giveawayMonths;
        public long giveawayStars;
        /** A checklist's title, or null. */
        public String checklist;
        /** An invoice or venue's title, or null, and what an invoice asks for and in which currency. */
        public String title;
        public long amount;
        public String currency;
        /** Its text, or null. */
        public String text;
        public boolean service;
        public boolean media;

        public Message(int account, long dialog, int id) {
            this.account = account;
            this.dialog = dialog;
            this.id = id;
            this.date = id;
        }

        @Override public String toString() {
            return dialog + "/" + id;
        }
    }

    /** Telegram with each account's user and chats, a clock to move and every forward it was asked for. */
    public static class Fake implements AutoForwarding.Telegram {
        public int selected = 0;
        public final Map<Integer, Long> users = new HashMap<>();
        /** Each account's chat list (folder 0) and archive (folder 1), as dialog ids. */
        public final Map<String, List<Long>> chats = new HashMap<>();
        public final Map<Long, String> names = new HashMap<>();
        public final List<Long> secret = new ArrayList<>();
        public final List<Long> folders = new ArrayList<>();
        /** Chats you can't post in. */
        public final List<Long> readOnly = new ArrayList<>();
        /** Each forward as "account: messages to destination". */
        public final List<String> sent = new ArrayList<>();
        public long now = 1_000_000L;
        public int answer = 0;

        public Fake chats(int account, int folder, Long... ids) {
            List<Long> list = new ArrayList<>();
            for (Long id : ids) list.add(id);
            chats.put(account + "/" + folder, list);
            return this;
        }

        @Override public int account(Object message) { return ((Message) message).account; }
        @Override public long dialog(Object message) { return ((Message) message).dialog; }
        @Override public int id(Object message) { return ((Message) message).id; }
        @Override public boolean out(Object message) { return ((Message) message).out; }
        @Override public boolean forwarded(Object message) { return ((Message) message).forwarded; }
        @Override public long sender(Object message) { return ((Message) message).sender; }
        @Override public long origin(Object message) { return ((Message) message).origin; }
        @Override public int date(Object message) { return ((Message) message).date; }
        @Override public int originDate(Object message) { return ((Message) message).originDate; }
        @Override public String originName(Object message) { return ((Message) message).originName; }
        @Override public long mediaId(Object message) { return ((Message) message).mediaId; }
        @Override public long pollId(Object message) { return ((Message) message).pollId; }
        @Override public double latitude(Object message) { return ((Message) message).latitude; }
        @Override public double longitude(Object message) { return ((Message) message).longitude; }
        @Override public String phone(Object message) { return ((Message) message).phone; }
        @Override public String emoticon(Object message) { return ((Message) message).emoticon; }
        @Override public int diceValue(Object message) { return ((Message) message).diceValue; }
        @Override public int storyId(Object message) { return ((Message) message).storyId; }
        @Override public long storyPeer(Object message) { return ((Message) message).storyPeer; }
        @Override public long gameId(Object message) { return ((Message) message).gameId; }
        @Override public int giveawayEnd(Object message) { return ((Message) message).giveawayEnd; }
        @Override public int giveawayCount(Object message) { return ((Message) message).giveawayCount; }
        @Override public int giveawayMonths(Object message) { return ((Message) message).giveawayMonths; }
        @Override public long giveawayStars(Object message) { return ((Message) message).giveawayStars; }
        @Override public String checklist(Object message) { return ((Message) message).checklist; }
        @Override public String title(Object message) { return ((Message) message).title; }
        @Override public long amount(Object message) { return ((Message) message).amount; }
        @Override public String currency(Object message) { return ((Message) message).currency; }
        @Override public String text(Object message) { return ((Message) message).text; }
        @Override public boolean service(Object message) { return ((Message) message).service; }
        @Override public boolean media(Object message) { return ((Message) message).media; }
        @Override public int selectedAccount() { return selected; }
        @Override public long userId(int account) { return users.getOrDefault(account, 0L); }
        @Override public List<?> dialogs(int account, int folder) { return chats.get(account + "/" + folder); }
        @Override public long dialogId(Object dialog) { return (Long) dialog; }
        @Override public boolean secret(long dialog) { return secret.contains(dialog); }
        @Override public boolean folder(long dialog) { return folders.contains(dialog); }
        @Override public boolean canPost(int account, long id) { return !readOnly.contains(id); }
        @Override public String peerName(int account, long id) { return names.get(id); }
        @Override public long now() { return now; }

        @Override public int forward(int account, ArrayList<Object> messages, long destination) {
            sent.add(account + ": " + messages + " to " + destination);
            return answer;
        }
    }

    /** Gives auto-forwarding [telegram]. {@link #restore} undoes it. */
    public static Fake use(Fake telegram) {
        if (saved == null) saved = AutoForwarding.telegram;
        AutoForwarding.telegram = telegram;
        AutoForwarding.reset();
        return telegram;
    }

    /** Back to the stubs, with no rules and nothing remembered. */
    public static void restore() {
        if (saved != null) AutoForwarding.telegram = saved;
        saved = null;
        AutoForwarding.reset();
        Settings.AUTO_FORWARDING_RULES.resetToDefault();
    }
}
