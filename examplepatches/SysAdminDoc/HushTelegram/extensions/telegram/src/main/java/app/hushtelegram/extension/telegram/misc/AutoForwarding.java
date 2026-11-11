/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.os.SystemClock;

import androidx.annotation.Nullable;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Auto-forwarding rules. A new message someone else sends in a rule's first chat is forwarded to
 * its second chat on the same account, the way Forward sends it, and a rule can take only photos,
 * videos and files. Your own messages stay, scheduled ones included. A forward one of your signed-in
 * accounts sent, or one that came from the destination, isn't forwarded, and neither is a copy of a
 * message a rule already sent into its chat or its destination, so rules pointing at each other
 * don't loop, on one account or across two, channels included. A message that comes in twice goes
 * out once, and each account sends at most {@link #PER_MINUTE} forwards a minute. Notifications built from a push
 * aren't forwarded: Telegram hands the same messages over again once it connects. Telegram hands
 * over only unread messages, so one already read on another device before this one connects stays.
 */
public final class AutoForwarding {
    /** The most forwards one account sends in a minute. Past it, new matches aren't forwarded. */
    static final int PER_MINUTE = 20;
    /** How many forwarded messages are remembered, so one that comes in twice goes out once. */
    private static final int REMEMBERED = 512;
    private static final long MINUTE = 60_000L;

    static Telegram telegram = new Stubs();

    private static final Map<String, Boolean> forwarded = new LinkedHashMap<String, Boolean>() {
        @Override
        protected boolean removeEldestEntry(Map.Entry<String, Boolean> eldest) {
            return size() > REMEMBERED;
        }
    };
    /**
     * Each original a rule forwarded, with the chat it went to, on any account. A forward keeps
     * its original's author, date and photo or file through every copy, so a copy coming round
     * again is known by them even when its sender is a channel and its header names a third chat.
     * Unless the original was a forward from a hidden author, its date and photo, file or text are
     * kept on their own too: a copy that comes back naming its author by a hidden name is known by
     * those. That's two for each forward, so twice as many are kept.
     */
    private static final Map<String, Boolean> copies = new LinkedHashMap<String, Boolean>() {
        @Override
        protected boolean removeEldestEntry(Map.Entry<String, Boolean> eldest) {
            return size() > 2 * REMEMBERED;
        }
    };
    private static final Map<Integer, ArrayDeque<Long>> sentAt = new HashMap<>();

    private AutoForwarding() {
    }

    /** On the account signed in as [user], new messages in [source] go to [destination]. */
    public static final class Rule {
        public final long user;
        public final long source;
        public final long destination;
        /** Only messages with a photo, video, file, voice message or sticker. */
        public final boolean mediaOnly;

        public Rule(long user, long source, long destination, boolean mediaOnly) {
            this.user = user;
            this.source = source;
            this.destination = destination;
            this.mediaOnly = mediaOnly;
        }

        String line() {
            return user + " " + source + " " + destination + " " + (mediaOnly ? 1 : 0);
        }

        /** The same pair of chats on the same account, whatever it takes. */
        public boolean samePair(Rule other) {
            return user == other.user && source == other.source && destination == other.destination;
        }

        @Override
        public boolean equals(Object other) {
            return other instanceof Rule && samePair((Rule) other) && mediaOnly == ((Rule) other).mediaOnly;
        }

        @Override
        public int hashCode() {
            return Long.valueOf(user).hashCode() * 31 * 31 + Long.valueOf(source).hashCode() * 31
                    + Long.valueOf(destination).hashCode() + (mediaOnly ? 1 : 0);
        }
    }

    /** A chat the rules page lists: Telegram's dialog id for it, its name and whether you can post there. */
    public static final class Chat {
        public final long id;
        public final String name;
        public final boolean canPost;

        public Chat(long id, String name, boolean canPost) {
            this.id = id;
            this.name = name;
            this.canPost = canPost;
        }
    }

    /** The account shown now: who it's signed in as, its chats and its rules. */
    public static final class Shown {
        public final long user;
        public final List<Chat> chats;
        public final List<Rule> rules;

        public Shown(long user, List<Chat> chats, List<Rule> rules) {
            this.user = user;
            this.chats = chats;
            this.rules = rules;
        }

        /** The chat's name, or its id when it isn't on the list any more. */
        public String name(long id) {
            for (Chat chat : chats) {
                if (chat.id == id) return chat.name;
            }
            return String.valueOf(id);
        }

        /** The chats a rule can watch. Not Saved Messages: Telegram never hands over what's posted there. */
        public List<Chat> sources() {
            List<Chat> sources = new ArrayList<>();
            for (Chat chat : chats) {
                if (chat.id != user) sources.add(chat);
            }
            return sources;
        }

        /** The chats [source]'s messages can go to: any you can post in but [source]. */
        public List<Chat> destinations(long source) {
            List<Chat> destinations = new ArrayList<>();
            for (Chat chat : chats) {
                if (chat.id != source && chat.canPost) destinations.add(chat);
            }
            return destinations;
        }
    }

    /** The saved rules, one a line: user, source, destination, then 1 for media only. Lines that don't read are left out. */
    static List<Rule> parse(@Nullable String saved) {
        List<Rule> rules = new ArrayList<>();
        if (saved == null) return rules;
        for (String line : saved.split("\n")) {
            String[] parts = line.trim().split(" ");
            if (parts.length != 4) continue;
            try {
                long user = Long.parseLong(parts[0]);
                long source = Long.parseLong(parts[1]);
                long destination = Long.parseLong(parts[2]);
                if (user == 0 || source == 0 || destination == 0 || source == destination) continue;
                if (!parts[3].equals("0") && !parts[3].equals("1")) continue;
                Rule rule = new Rule(user, source, destination, parts[3].equals("1"));
                if (!holdsPair(rules, rule)) rules.add(rule);
            } catch (NumberFormatException unreadable) {
                // Left out, like any other line that doesn't read.
            }
        }
        return rules;
    }

    static String format(List<Rule> rules) {
        StringBuilder text = new StringBuilder();
        for (Rule rule : rules) {
            if (text.length() > 0) text.append('\n');
            text.append(rule.line());
        }
        return text.toString();
    }

    private static boolean holdsPair(List<Rule> rules, Rule rule) {
        for (Rule held : rules) {
            if (held.samePair(rule)) return true;
        }
        return false;
    }

    /** The saved rules. Read as saved even while HushTelegram is paused, so a rule added then keeps the rest. */
    public static List<Rule> rules() {
        return parse(Settings.AUTO_FORWARDING_RULES.savedValue());
    }

    /**
     * Saves [rule] after the others. A rule back into its own chat, or for a pair of chats already
     * on the list, isn't saved. The answer is whether the rule was saved.
     */
    public static synchronized boolean add(Rule rule) {
        if (rule.user == 0 || rule.source == 0 || rule.destination == 0 || rule.source == rule.destination) return false;
        List<Rule> rules = rules();
        if (holdsPair(rules, rule)) return false;
        rules.add(rule);
        return Settings.AUTO_FORWARDING_RULES.save(format(rules));
    }

    /** Takes [rule] off the list. The answer is whether it's off the saved list now. */
    public static synchronized boolean remove(Rule rule) {
        List<Rule> rules = rules();
        return !rules.remove(rule) || Settings.AUTO_FORWARDING_RULES.save(format(rules));
    }

    /**
     * The account shown now, with its chats (archived ones too, secret chats and the Archived Chats
     * entry left out) and its rules, or null when they can't be read.
     */
    @Nullable
    public static Shown shown() {
        try {
            int account = telegram.selectedAccount();
            long user = telegram.userId(account);
            List<Rule> mine = new ArrayList<>();
            for (Rule rule : rules()) {
                if (rule.user == user) mine.add(rule);
            }
            Set<Long> ids = new LinkedHashSet<>();
            for (int folder = 0; folder <= 1; folder++) {
                List<?> dialogs = telegram.dialogs(account, folder);
                if (dialogs == null) continue;
                for (Object dialog : dialogs) {
                    if (dialog != null) ids.add(telegram.dialogId(dialog));
                }
            }
            List<Chat> chats = new ArrayList<>();
            for (long id : ids) {
                if (id == 0 || telegram.folder(id) || telegram.secret(id)) continue;
                // Your own chat is Saved Messages, as Telegram lists it, not your name.
                String name = id == user ? L10n.t("Saved Messages") : telegram.peerName(account, id);
                chats.add(new Chat(id, name == null || name.trim().isEmpty() ? String.valueOf(id) : name,
                        telegram.canPost(account, id)));
            }
            return new Shown(user, Collections.unmodifiableList(chats), Collections.unmodifiableList(mine));
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.AUTO_FORWARDING, "chat list for rules", failure);
            return null;
        }
    }

    /**
     * NotificationsController.processNewMessages(messages, isLast, isFcm, latch) hands over each
     * batch of new messages before it decides on notifications. [push] is isFcm, non-zero for yes.
     */
    public static void onNewMessages(Object messages, int push) {
        try {
            if (!Utils.settingsReady() || !Settings.AUTO_FORWARDING.get()) return;
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.AUTO_FORWARDING, "switch read", t);
            return;
        }
        HookStatus.counted(FamilyNames.AUTO_FORWARDING, "messages checked for forwarding");
        if (push != 0 || !(messages instanceof List)) return;
        try {
            List<Rule> rules = rules();
            if (rules.isEmpty()) return;
            Map<String, Batch> batches = matches(new ArrayList<>((List<?>) messages), rules);
            if (batches.isEmpty()) return;
            Utils.runOnMainThreadNowOrLater(() -> {
                for (Batch batch : batches.values()) send(batch);
            });
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.AUTO_FORWARDING, "rules", failure);
        }
    }

    /** One account's messages for one destination, in the order they came. */
    static final class Batch {
        final int account;
        final long destination;
        final ArrayList<Object> messages = new ArrayList<>();

        Batch(int account, long destination) {
            this.account = account;
            this.destination = destination;
        }
    }

    /** The messages each destination gets, and each one remembered as forwarded. */
    static synchronized Map<String, Batch> matches(List<?> messages, List<Rule> rules) {
        Map<String, Batch> batches = new LinkedHashMap<>();
        Map<Integer, Long> users = new HashMap<>();
        // Every account a rule is for: a forward one of them sent is a rule's, on whichever account it lands.
        Set<Long> owners = new HashSet<>();
        for (Rule rule : rules) owners.add(rule.user);
        // Remembered once the batch is read: an album's parts share an original, and one part
        // mustn't hold back the next.
        List<String> sending = new ArrayList<>();
        for (Object message : messages) {
            if (message == null) continue;
            int account = telegram.account(message);
            Long user = users.get(account);
            if (user == null) {
                user = telegram.userId(account);
                users.put(account, user);
            }
            long dialog = telegram.dialog(message);
            int id = telegram.id(message);
            for (Rule rule : rules) {
                if (rule.user != user || rule.source != dialog || id <= 0) continue;
                // Telegram hands over your own messages only when a scheduled one goes out, so none go.
                if (telegram.out(message)) continue;
                // A rule's forward landing on another account you're signed in to, or a channel's post
                // its discussion group got, would go back where it came from and round again.
                if (telegram.forwarded(message)
                        && (owners.contains(telegram.sender(message)) || telegram.origin(message) == rule.destination)) continue;
                if (telegram.service(message)) continue;
                if (rule.mediaOnly && !telegram.media(message)) continue;
                // A copy a rule made, back in a chat it went to or on its way there again. Across two
                // accounts through channels its sender is the channel and its header can name a third chat.
                String original = original(message);
                String moment = moment(message);
                boolean hidden = telegram.forwarded(message) && telegram.origin(message) == 0;
                if (telegram.forwarded(message) && (copies.containsKey(original + "@" + dialog)
                        || copies.containsKey(original + "@" + rule.destination)
                        || hidden && (copies.containsKey(moment + "@" + dialog)
                        || copies.containsKey(moment + "@" + rule.destination)))) continue;
                String key = account + ":" + dialog + ":" + id + ":" + rule.destination;
                if (forwarded.containsKey(key)) continue;
                if (!allowed(account)) {
                    HookStatus.counted(FamilyNames.AUTO_FORWARDING, "forwards over the per-minute limit");
                    continue;
                }
                forwarded.put(key, Boolean.TRUE);
                sending.add(original + "@" + rule.destination);
                // Two hidden authors can post in the same second, so a hidden one's moment isn't kept.
                if (!hidden) sending.add(moment + "@" + rule.destination);
                String to = account + ":" + rule.destination;
                Batch batch = batches.get(to);
                if (batch == null) {
                    batch = new Batch(account, rule.destination);
                    batches.put(to, batch);
                }
                batch.messages.add(message);
            }
        }
        for (String copy : sending) copies.put(copy, Boolean.TRUE);
        return batches;
    }

    /**
     * Who first sent [message], when, and its photo or file: the forward header's author and date,
     * or its own. An album's parts share an author and a date, and their photos tell them apart. A
     * hidden author's header has a name and no id.
     */
    private static String original(Object message) {
        if (!telegram.forwarded(message)) return telegram.sender(message) + "/" + moment(message);
        long origin = telegram.origin(message);
        return (origin != 0 ? String.valueOf(origin) : "~" + telegram.originName(message)) + "/" + moment(message);
    }

    /**
     * When [message]'s original was first sent, and its photo or file, without who sent it. Without
     * either, whatever else it holds stands in, and then its text, or every one of them sent in that
     * second would look the same.
     */
    private static String moment(Object message) {
        int date = telegram.forwarded(message) ? telegram.originDate(message) : telegram.date(message);
        long media = telegram.mediaId(message);
        if (media != 0) return date + "/" + media;
        String held = held(message);
        if (held != null) return date + "/" + held;
        String text = telegram.text(message);
        return date + "/t" + (text == null ? 0 : text.hashCode());
    }

    /**
     * The poll, dice roll, contact, place, story, game, giveaway, checklist or invoice [message]
     * holds, each of which a forward keeps, or null. Two same-face rolls, or the same contact,
     * place, checklist title or invoice, from one author's second still look alike, as do two
     * giveaways with the same end, winners and prize, and a live location is known by the fix it
     * carries.
     */
    @Nullable
    private static String held(Object message) {
        long poll = telegram.pollId(message);
        if (poll != 0) return "p" + poll;
        String emoticon = telegram.emoticon(message);
        if (emoticon != null) return "d" + emoticon + telegram.diceValue(message);
        String phone = telegram.phone(message);
        if (phone != null && !phone.isEmpty()) return "c" + phone;
        double latitude = telegram.latitude(message);
        double longitude = telegram.longitude(message);
        String title = telegram.title(message);
        // A venue's name tells it from a plain location on the same spot.
        if (latitude != 0 || longitude != 0) return "g" + latitude + "," + longitude + (title == null ? "" : "/" + title);
        // Story ids count up per chat, so two chats' stories can share one.
        int story = telegram.storyId(message);
        if (story != 0) return "s" + telegram.storyPeer(message) + "/" + story;
        long game = telegram.gameId(message);
        if (game != 0) return "m" + game;
        int end = telegram.giveawayEnd(message);
        // A Premium and a Stars giveaway can end together with as many winners.
        if (end != 0) return "v" + end + "x" + telegram.giveawayCount(message)
                + "/" + telegram.giveawayMonths(message) + "/" + telegram.giveawayStars(message);
        String checklist = telegram.checklist(message);
        if (checklist != null) return "k" + checklist;
        // Only an invoice is left with a title.
        if (title != null) return "i" + title + "/" + telegram.amount(message) + "/" + telegram.currency(message);
        return null;
    }

    /** Whether [account] may send one more forward this minute, and if so, counts it. */
    private static boolean allowed(int account) {
        long now = telegram.now();
        ArrayDeque<Long> times = sentAt.get(account);
        if (times == null) {
            times = new ArrayDeque<>();
            sentAt.put(account, times);
        }
        while (!times.isEmpty() && now - times.peekFirst() >= MINUTE) times.pollFirst();
        if (times.size() >= PER_MINUTE) return false;
        times.addLast(now);
        return true;
    }

    private static void send(Batch batch) {
        try {
            int result = telegram.forward(batch.account, batch.messages, batch.destination);
            HookStatus.counted(FamilyNames.AUTO_FORWARDING, result == 0 ? "messages forwarded" : "forwards Telegram refused");
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.AUTO_FORWARDING, "forward", failure);
        }
    }

    /** Forgets what was forwarded and when, for tests. */
    static synchronized void reset() {
        forwarded.clear();
        copies.clear();
        sentAt.clear();
    }

    /** What this needs from Telegram. */
    interface Telegram {
        int account(Object message);

        long dialog(Object message);

        int id(Object message);

        boolean out(Object message);

        boolean forwarded(Object message);

        long sender(Object message);

        long origin(Object message);

        int date(Object message);

        int originDate(Object message);

        @Nullable
        String originName(Object message);

        long mediaId(Object message);

        long pollId(Object message);

        double latitude(Object message);

        double longitude(Object message);

        @Nullable
        String phone(Object message);

        @Nullable
        String emoticon(Object message);

        int diceValue(Object message);

        int storyId(Object message);

        long storyPeer(Object message);

        long gameId(Object message);

        int giveawayEnd(Object message);

        int giveawayCount(Object message);

        int giveawayMonths(Object message);

        long giveawayStars(Object message);

        @Nullable
        String checklist(Object message);

        @Nullable
        String title(Object message);

        long amount(Object message);

        @Nullable
        String currency(Object message);

        @Nullable
        String text(Object message);

        boolean service(Object message);

        boolean media(Object message);

        int selectedAccount();

        long userId(int account);

        @Nullable
        List<?> dialogs(int account, int folder);

        long dialogId(Object dialog);

        boolean secret(long dialog);

        boolean folder(long dialog);

        boolean canPost(int account, long id);

        @Nullable
        String peerName(int account, long id);

        int forward(int account, ArrayList<Object> messages, long destination);

        long now();
    }

    private static final class Stubs implements Telegram {
        @Override public int account(Object message) { return AutoForwarding.account(message); }
        @Override public long dialog(Object message) { return AutoForwarding.dialog(message); }
        @Override public int id(Object message) { return AutoForwarding.id(message); }
        @Override public boolean out(Object message) { return AutoForwarding.out(message); }
        @Override public boolean forwarded(Object message) { return AutoForwarding.forwarded(message); }
        @Override public long sender(Object message) { return AutoForwarding.sender(message); }
        @Override public long origin(Object message) { return AutoForwarding.origin(message); }
        @Override public int date(Object message) { return AutoForwarding.date(message); }
        @Override public int originDate(Object message) { return AutoForwarding.originDate(message); }
        @Override public String originName(Object message) { return AutoForwarding.originName(message); }
        @Override public long mediaId(Object message) { return AutoForwarding.mediaId(message); }
        @Override public long pollId(Object message) { return AutoForwarding.pollId(message); }
        @Override public double latitude(Object message) { return AutoForwarding.latitude(message); }
        @Override public double longitude(Object message) { return AutoForwarding.longitude(message); }
        @Override public String phone(Object message) { return AutoForwarding.phone(message); }
        @Override public String emoticon(Object message) { return AutoForwarding.emoticon(message); }
        @Override public int diceValue(Object message) { return AutoForwarding.diceValue(message); }
        @Override public int storyId(Object message) { return AutoForwarding.storyId(message); }
        @Override public long storyPeer(Object message) { return AutoForwarding.storyPeer(message); }
        @Override public long gameId(Object message) { return AutoForwarding.gameId(message); }
        @Override public int giveawayEnd(Object message) { return AutoForwarding.giveawayEnd(message); }
        @Override public int giveawayCount(Object message) { return AutoForwarding.giveawayCount(message); }
        @Override public int giveawayMonths(Object message) { return AutoForwarding.giveawayMonths(message); }
        @Override public long giveawayStars(Object message) { return AutoForwarding.giveawayStars(message); }
        @Override public String checklist(Object message) { return AutoForwarding.checklist(message); }
        @Override public String title(Object message) { return AutoForwarding.title(message); }
        @Override public long amount(Object message) { return AutoForwarding.amount(message); }
        @Override public String currency(Object message) { return AutoForwarding.currency(message); }
        @Override public String text(Object message) { return AutoForwarding.text(message); }
        @Override public boolean service(Object message) { return AutoForwarding.service(message); }
        @Override public boolean media(Object message) { return AutoForwarding.media(message); }
        @Override public int selectedAccount() { return AutoForwarding.selectedAccount(); }
        @Override public long userId(int account) { return AutoForwarding.userId(account); }
        @Override public List<?> dialogs(int account, int folder) { return AutoForwarding.dialogs(account, folder); }
        @Override public long dialogId(Object dialog) { return AutoForwarding.dialogId(dialog); }
        @Override public boolean secret(long dialog) { return AutoForwarding.secret(dialog); }
        @Override public boolean folder(long dialog) { return AutoForwarding.folder(dialog); }
        @Override public boolean canPost(int account, long id) { return AutoForwarding.canPost(account, id); }
        @Override public String peerName(int account, long id) { return AutoForwarding.peerName(account, id); }
        @Override public int forward(int account, ArrayList<Object> messages, long destination) {
            return AutoForwarding.forward(account, messages, destination);
        }
        @Override public long now() { return SystemClock.elapsedRealtime(); }
    }

    // Stubs. The patch gives each one Telegram's code; until then they do nothing.

    /** {@code message.currentAccount}. */
    public static int account(Object message) { return 0; }

    /** {@code message.getDialogId()}. */
    public static long dialog(Object message) { return 0L; }

    /** {@code message.getId()}. */
    public static int id(Object message) { return 0; }

    /** {@code message.isOut()}. */
    public static boolean out(Object message) { return false; }

    /** {@code message.isForwarded()}. */
    public static boolean forwarded(Object message) { return false; }

    /** {@code message.getFromChatId()}: who sent it, a user or a chat as a dialog id. */
    public static long sender(Object message) { return 0L; }

    /** The dialog id the forward header names as where it came from, or 0 when it names none. */
    public static long origin(Object message) { return 0L; }

    /** {@code message.messageOwner.date}, in seconds. */
    public static int date(Object message) { return 0; }

    /** The forward header's date, when the message it copies was first sent, or 0 when it has none. */
    public static int originDate(Object message) { return 0; }

    /** The name the forward header gives an author who hides their account, or null. */
    @Nullable
    public static String originName(Object message) { return null; }

    /** The id of the message's photo or file, which a forward keeps, or 0 when it has neither. */
    public static long mediaId(Object message) { return 0L; }

    /** {@code TL_messageMediaPoll.poll.id}: the poll's id, which a forward keeps, or 0 when it isn't a poll. */
    public static long pollId(Object message) { return 0L; }

    /** {@code media.geo.lat}: a location or venue's latitude, or 0 when it has none. */
    public static double latitude(Object message) { return 0d; }

    /** {@code media.geo._long}: a location or venue's longitude, or 0 when it has none. */
    public static double longitude(Object message) { return 0d; }

    /** {@code media.phone_number}: a shared contact's phone number, or null. */
    @Nullable
    public static String phone(Object message) { return null; }

    /** {@code TL_messageMediaDice.emoticon}: the emoji a dice roll was thrown with, or null when it isn't one. */
    @Nullable
    public static String emoticon(Object message) { return null; }

    /** {@code TL_messageMediaDice.value}: what a dice roll landed on, or 0. */
    public static int diceValue(Object message) { return 0; }

    /** {@code media.id}: a shared story's id, or 0 when it isn't one. */
    public static int storyId(Object message) { return 0; }

    /** {@code media.peer}, or an older layer's {@code media.user_id}: whose story it is, or 0. */
    public static long storyPeer(Object message) { return 0L; }

    /** {@code media.game.id}: a game's id, or 0 when it isn't one. */
    public static long gameId(Object message) { return 0L; }

    /** {@code until_date} of a giveaway or its results, or 0 when it's neither. */
    public static int giveawayEnd(Object message) { return 0; }

    /** A giveaway's {@code quantity}, or its results' {@code winners_count}, or 0. */
    public static int giveawayCount(Object message) { return 0; }

    /** {@code months} of a giveaway or its results: how much Premium each winner gets, or 0. */
    public static int giveawayMonths(Object message) { return 0; }

    /** {@code stars} of a giveaway or its results: how many Stars it gives away, or 0. */
    public static long giveawayStars(Object message) { return 0L; }

    /** {@code TL_messageMediaToDo.todo.title.text}: a checklist's title, or null when it isn't one. */
    @Nullable
    public static String checklist(Object message) { return null; }

    /** {@code media.title}: an invoice or venue's title, or null. */
    @Nullable
    public static String title(Object message) { return null; }

    /** {@code media.total_amount}: what an invoice asks for, or 0. */
    public static long amount(Object message) { return 0L; }

    /** {@code media.currency}: the currency an invoice's amount is in, or null. */
    @Nullable
    public static String currency(Object message) { return null; }

    /** {@code message.messageOwner.message}: its text, or a photo or file's caption, or null. */
    @Nullable
    public static String text(Object message) { return null; }

    /** Whether the message is a service message: an action other than TL_messageActionEmpty. */
    public static boolean service(Object message) { return false; }

    /** {@code !message.isMediaEmpty()}: a photo, video, file, voice message or sticker, not a link preview. */
    public static boolean media(Object message) { return false; }

    /** {@code UserConfig.selectedAccount}. */
    public static int selectedAccount() { return 0; }

    /** {@code UserConfig.getInstance(account).getClientUserId()}. */
    public static long userId(int account) { return 0L; }

    /** {@code MessagesController.getInstance(account).getDialogs(folder)}. */
    @Nullable
    public static ArrayList<?> dialogs(int account, int folder) { return null; }

    /** {@code dialog.id}, for a TLRPC.Dialog. */
    public static long dialogId(Object dialog) { return 0L; }

    /** {@code DialogObject.isEncryptedDialog(dialog)}. */
    public static boolean secret(long dialog) { return false; }

    /** {@code DialogObject.isFolderDialogId(dialog)}: the Archived Chats entry, not a chat. */
    public static boolean folder(long dialog) { return false; }

    /**
     * Whether you can post in the chat: a user's chat unless it's Replies, Telegram's service
     * account or a deleted account, a group or channel when you're in it, it isn't a channel's
     * direct messages and {@code ChatObject.canSendMessages} says so.
     */
    public static boolean canPost(int account, long id) { return true; }

    /** {@code MessagesController.getInstance(account).getPeerName(id)}. */
    @Nullable
    public static String peerName(int account, long id) { return null; }

    /**
     * {@code SendMessagesHelper.getInstance(account).sendMessage(messages, destination, ...)}, the
     * send Forward makes, with the sender shown and notifying. 0 when Telegram took it.
     */
    public static int forward(int account, ArrayList<Object> messages, long destination) { return 1; }
}
