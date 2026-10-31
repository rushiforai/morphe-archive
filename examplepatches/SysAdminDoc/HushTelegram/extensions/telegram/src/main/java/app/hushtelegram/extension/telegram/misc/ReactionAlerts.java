/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Reaction notifications without push, a second switch under UnifiedPush notifications. Telegram
 * shows a reaction to your message only when a push says so, and a build that gets no push (no
 * Firebase for a re-signed app, no UnifiedPush app) never shows one. The connection Telegram keeps
 * open gets the same reaction as an update, and this hands it to Telegram's notifications the way
 * the push would have, with the same text and the same quiet channel.
 *
 * <p>Only a reaction the server marks unread counts, which it does for reactions to your own
 * messages, and only a recent one, so catching up after a while offline doesn't bring back old
 * reactions. Telegram keys its notifications by message, so a push for the same reaction, before
 * or after, shows once. A custom emoji shows as the emoji it stands for once this phone has loaded
 * it. Until then, and for paid reactions, it's left to the push.
 */
public final class ReactionAlerts {
    private ReactionAlerts() {}

    /** How old a reaction can be, in seconds, and still notify. */
    static final int RECENT = 600;

    /** How far ahead of this phone's clock a reaction's time can be. */
    static final int AHEAD = 60;

    /** Reactions remembered as shown. Past it, the oldest is forgotten. */
    static final int REMEMBERED = 200;

    /** One reaction an update carries. */
    static final class Reaction {
        final long dialog;
        final int id;
        final int topic;
        final long from;
        final String emoji;
        final int date;
        final boolean unread;
        final boolean mine;
        /** A custom emoji's document ID, or 0 for any other reaction. */
        final long custom;

        Reaction(long dialog, int id, int topic, long from, String emoji, int date, boolean unread, boolean mine) {
            this(dialog, id, topic, from, emoji, date, unread, mine, 0);
        }

        Reaction(long dialog, int id, int topic, long from, String emoji, int date, boolean unread, boolean mine, long custom) {
            this.dialog = dialog;
            this.id = id;
            this.topic = topic;
            this.from = from;
            this.emoji = emoji;
            this.date = date;
            this.unread = unread;
            this.mine = mine;
            this.custom = custom;
        }
    }

    /** The stored copy of the message that got the reaction. */
    static final class Stored {
        final String text;
        final boolean mine;

        Stored(String text, boolean mine) {
            this.text = text;
            this.mine = mine;
        }
    }

    /** Telegram's side of one account. */
    interface Source {
        /** The account's own user ID. */
        long self() throws Exception;

        /** The server's time as Telegram reckons it, in seconds. */
        int now() throws Exception;

        /** Runs [work] on the storage queue, or throws when the queue won't take it. */
        void post(Runnable work) throws Exception;

        /** The stored copy of [id] in [dialog], or null when the phone has none. */
        Stored stored(long dialog, int id) throws Exception;

        /** Hands Telegram's notifications the reaction, with the message's text or null. */
        void show(Reaction reaction, String text) throws Exception;

        /** The emoji the custom emoji [document] stands for, or null when this phone hasn't loaded it. */
        String emojiOf(long document) throws Exception;
    }

    /** The account behind a message controller. */
    interface Sources {
        Source of(Object controller) throws Exception;
    }

    /** What a reactions update carries. */
    interface Updates {
        /** The update's recent reactions, empty when it lists none. */
        List<Reaction> of(Object update) throws Exception;
    }

    static Sources sources = ReactionAlertsBridge::of;
    static Updates updates = ReactionAlertsBridge::reactionsOf;

    private static final Map<String, Boolean> SHOWN = new LinkedHashMap<String, Boolean>(16, 0.75f, false) {
        @Override protected boolean removeEldestEntry(Map.Entry<String, Boolean> eldest) {
            return size() > REMEMBERED;
        }
    };

    /**
     * Asked by the update loop for each reactions update, before Telegram stores it.
     *
     * @param update the reactions update, as the server sent it
     * @param controller Telegram's message controller
     */
    public static void changed(Object update, Object controller) {
        if (!on()) return;
        try {
            List<Reaction> reactions = updates.of(update);
            if (reactions.isEmpty()) return;
            Source source = sources.of(controller);
            long self = source.self();
            Reaction newest = pick(named(reactions, source), self, source.now());
            if (newest == null || !first(self, newest)) return;
            source.post(() -> show(source, newest));
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.UNIFIED_PUSH, "reaction", failure);
        }
    }

    /** Whether the switch is on and HushTelegram isn't paused. */
    public static boolean on() {
        try {
            HookStatus.invoked(FamilyNames.UNIFIED_PUSH);
            return Utils.settingsReady() && Settings.REACTION_ALERTS.get();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.UNIFIED_PUSH, "reaction switch", failure);
            return false;
        }
    }

    /**
     * Asked by Telegram's silent notification check right after it reads whether a notification is
     * for a reaction. Telegram keeps every reaction notification silent, pushed or not. With the
     * sound switch on, a reaction plays the sound and vibration set for reactions in Telegram's own
     * Notifications and Sounds, the way a message does.
     *
     * @param reaction non-zero when the notification is for a reaction
     * @return whether it still counts as a reaction, which keeps it silent
     */
    public static boolean quiet(int reaction) {
        if (reaction == 0) return false;
        try {
            HookStatus.invoked(FamilyNames.UNIFIED_PUSH);
            if (Utils.settingsReady() && Settings.REACTION_SOUND.get()) {
                HookStatus.counted(FamilyNames.UNIFIED_PUSH, "reaction sounds let through");
                return false;
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.UNIFIED_PUSH, "reaction sound", failure);
        }
        return true;
    }

    /**
     * Telegram's loaded copy of the custom emoji [document] on [account], or null when it hasn't
     * loaded one. The patch writes the body, which asks AnimatedEmojiDrawable.findDocument; this one
     * stays when it can't.
     */
    public static Object emojiDocument(int account, long document) {
        return null;
    }

    /**
     * The reactions with each custom emoji this phone has loaded named by the emoji it stands for. A
     * lookup that fails leaves that one unnamed, so the emoji reactions beside it still count.
     */
    static List<Reaction> named(List<Reaction> reactions, Source source) {
        List<Reaction> named = null;
        for (int i = 0; i < reactions.size(); i++) {
            Reaction reaction = reactions.get(i);
            if (reaction == null || reaction.custom == 0 || (reaction.emoji != null && !reaction.emoji.isEmpty())) continue;
            String emoji;
            try {
                emoji = source.emojiOf(reaction.custom);
            } catch (Throwable failure) {
                HookStatus.threw(FamilyNames.UNIFIED_PUSH, "custom emoji", failure);
                continue;
            }
            if (emoji == null || emoji.isEmpty()) continue;
            if (named == null) named = new ArrayList<>(reactions);
            named.set(i, new Reaction(reaction.dialog, reaction.id, reaction.topic, reaction.from, emoji, reaction.date,
                    reaction.unread, reaction.mine, reaction.custom));
        }
        return named == null ? reactions : named;
    }

    /** The newest unread emoji reaction someone else left within the last {@link #RECENT} seconds, or null. */
    static Reaction pick(List<Reaction> reactions, long self, int now) {
        Reaction newest = null;
        for (Reaction reaction : reactions) {
            if (reaction == null || !reaction.unread || reaction.mine || reaction.from == 0 || reaction.from == self) continue;
            if (reaction.emoji == null || reaction.emoji.isEmpty() || reaction.id <= 0 || reaction.dialog == 0) continue;
            if (reaction.date < now - RECENT || reaction.date > now + AHEAD) continue;
            if (newest == null || reaction.date > newest.date) newest = reaction;
        }
        return newest;
    }

    /** Remembers the reaction, and says whether it wasn't already shown. The server repeats an update now and then. */
    static synchronized boolean first(long self, Reaction reaction) {
        String key = self + ":" + reaction.dialog + ":" + reaction.id + ":" + reaction.from + ":" + reaction.emoji + ":" + reaction.date;
        return SHOWN.put(key, Boolean.TRUE) == null;
    }

    /** Shows the reaction unless the message turns out not to be yours. Runs on the storage queue. */
    static void show(Source source, Reaction reaction) {
        try {
            Stored stored = source.stored(reaction.dialog, reaction.id);
            if (stored != null && !stored.mine) return;
            source.show(reaction, stored == null ? null : stored.text);
            HookStatus.counted(FamilyNames.UNIFIED_PUSH, "reaction shown");
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.UNIFIED_PUSH, "reaction notification", failure);
        }
    }

    /** Forgets every reaction remembered as shown. For tests. */
    static synchronized void forget() {
        SHOWN.clear();
    }
}
