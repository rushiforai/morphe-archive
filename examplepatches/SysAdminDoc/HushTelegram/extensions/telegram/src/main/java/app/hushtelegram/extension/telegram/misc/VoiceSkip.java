/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import java.util.ArrayList;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Next and previous for voice messages (#77). Telegram gives those buttons to music only: the
 * notification, the lock screen, headphones, a car and the full player skip between songs, and a
 * voice message gets play and pause. With the switch on, next plays the voice message after the
 * one playing, from the queue Telegram already plays them from when one ends, and previous goes
 * back to the one heard before it in that chat, or to the start of this one after a few seconds,
 * the way it does for a song. Voice messages stay voice messages, so Raise to Listen, the speed
 * button and transcription carry on as before. A view-once voice message is never skipped.
 */
public final class VoiceSkip {
    private VoiceSkip() {}

    /** PlaybackStateCompat's ACTION_SKIP_TO_PREVIOUS and ACTION_SKIP_TO_NEXT. */
    static final long SKIP_ACTIONS = 0x10L | 0x20L;

    /** Past this many seconds in, previous starts the message again instead of going back. */
    static final int RESTART_AFTER_SECONDS = 3;

    /** How many voice messages previous can walk back through. */
    static final int REMEMBERED = 50;

    /** Telegram's side, swapped out by tests. The real one calls the stubs the patch writes. */
    interface Telegram {
        /** The message playing now, or null. */
        Object playing();

        /** The voice messages Telegram plays next, the one playing among them, or null. */
        ArrayList<?> queue();

        /** Whether that queue keeps only unread messages. */
        boolean unread();

        boolean isMusic(Object message);

        boolean isVoice(Object message);

        boolean once(Object message);

        int id(Object message);

        long dialog(Object message);

        /** How far into the message playback is, in seconds. */
        int seconds(Object message);

        void play(Object message);

        void seekStart(Object message);

        /** Hands Telegram a new queue, the way it does when a voice message is tapped. */
        void requeue(ArrayList<Object> queue, boolean unread);
    }

    static Telegram telegram = new Telegram() {
        @Override public Object playing() { return VoiceSkip.playing(); }

        @Override public ArrayList<?> queue() { return VoiceSkip.queue(); }

        @Override public boolean unread() { return VoiceSkip.unread(); }

        @Override public boolean isMusic(Object message) { return VoiceSkip.isMusic(message); }

        @Override public boolean isVoice(Object message) { return VoiceSkip.isVoice(message); }

        @Override public boolean once(Object message) { return VoiceSkip.once(message); }

        @Override public int id(Object message) { return VoiceSkip.id(message); }

        @Override public long dialog(Object message) { return VoiceSkip.dialog(message); }

        @Override public int seconds(Object message) { return VoiceSkip.seconds(message); }

        @Override public void play(Object message) { VoiceSkip.play(message); }

        @Override public void seekStart(Object message) { VoiceSkip.seekStart(message); }

        @Override public void requeue(ArrayList<Object> queue, boolean unread) { VoiceSkip.requeue(queue, unread); }
    };

    /** The voice messages heard in one chat, oldest first. */
    private static final ArrayList<Object> heard = new ArrayList<>();
    private static long heardIn;

    /**
     * First in MediaController.playNextMessageWithoutOrder(boolean), which every next button reaches.
     *
     * @param byStop non-zero when a song ended by itself, which Telegram handles as before
     * @return whether the extension handled it, so Telegram's song skip doesn't run
     */
    public static boolean next(int byStop) {
        if (byStop != 0) return false;
        try {
            Object playing = eligible();
            if (playing == null) return false;
            ArrayList<?> queue = telegram.queue();
            int at = indexOf(queue, playing);
            if (at >= 0 && at + 1 < queue.size()) {
                telegram.play(queue.get(at + 1));
                HookStatus.counted(FamilyNames.VOICE_MUSIC_PLAYER, "skipped to the next voice message");
            }
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.VOICE_MUSIC_PLAYER, "next voice message", failure);
            return false;
        }
    }

    /**
     * First in MediaController.playPreviousMessage(), which every previous button reaches.
     *
     * @return whether the extension handled it, so Telegram's song skip doesn't run
     */
    public static boolean previous() {
        try {
            Object playing = eligible();
            if (playing == null) return false;
            Object before = telegram.seconds(playing) > RESTART_AFTER_SECONDS ? null : heardBefore(playing);
            if (before == null) {
                telegram.seekStart(playing);
                HookStatus.counted(FamilyNames.VOICE_MUSIC_PLAYER, "voice message started again");
                return true;
            }
            // Telegram drops each voice message from the queue once it ends. The one going back
            // goes in again in front of the one playing, so the queue carries on from there.
            ArrayList<?> queue = telegram.queue();
            int at = indexOf(queue, playing);
            if (at >= 0 && indexOf(queue, before) < 0) {
                ArrayList<Object> again = new ArrayList<>(queue);
                again.add(at, before);
                telegram.requeue(again, telegram.unread());
            }
            telegram.play(before);
            HookStatus.counted(FamilyNames.VOICE_MUSIC_PLAYER, "back to the previous voice message");
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.VOICE_MUSIC_PLAYER, "previous voice message", failure);
            return false;
        }
    }

    /**
     * Asked where Telegram's media session checks whether the message playing is music before it
     * skips, for a next or previous from the notification, the lock screen or a car.
     *
     * @param message the message playing, never null at those sites
     * @return whether the session skips
     */
    public static boolean skips(Object message) {
        try {
            return telegram.isMusic(message) || skippable(message);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.VOICE_MUSIC_PLAYER, "skip buttons", failure);
            return false;
        }
    }

    /**
     * Asked wherever Telegram's music service sets which buttons its media session offers. A
     * voice message the switch covers gets next and previous, as a song does.
     *
     * @param actions the buttons Telegram offers, none while a message loads
     * @return the buttons the session offers
     */
    public static long actions(long actions) {
        try {
            Object playing = telegram.playing();
            if (playing == null || !skippable(playing)) return actions;
            remember(playing);
            return actions == 0 ? 0 : actions | SKIP_ACTIONS;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.VOICE_MUSIC_PLAYER, "skip buttons", failure);
            return actions;
        }
    }

    /** The voice message playing, remembered, when the switch covers it; otherwise null. */
    private static Object eligible() {
        Object playing = telegram.playing();
        if (playing == null || !skippable(playing)) return null;
        remember(playing);
        return playing;
    }

    /** A voice message, not music and not view-once, with the switch on. */
    static boolean skippable(Object message) {
        if (telegram.isMusic(message) || !telegram.isVoice(message) || telegram.once(message)) return false;
        return on();
    }

    /** Whether the switch is on and HushTelegram isn't paused. */
    static boolean on() {
        HookStatus.invoked(FamilyNames.VOICE_MUSIC_PLAYER);
        try {
            return Utils.settingsReady() && Settings.VOICE_SKIP.get();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.VOICE_MUSIC_PLAYER, "skip switch", failure);
            return false;
        }
    }

    /** Adds a voice message to what was heard in its chat, starting over in another chat. */
    static synchronized void remember(Object message) {
        long dialog = telegram.dialog(message);
        if (dialog != heardIn) {
            heard.clear();
            heardIn = dialog;
        }
        int at = indexOf(heard, message);
        if (at >= 0) {
            heard.set(at, message);
            return;
        }
        heard.add(message);
        if (heard.size() > REMEMBERED) heard.remove(0);
    }

    /** The voice message heard just before [message] in its chat, or null. */
    static synchronized Object heardBefore(Object message) {
        if (telegram.dialog(message) != heardIn) return null;
        int at = indexOf(heard, message);
        return at > 0 ? heard.get(at - 1) : null;
    }

    /** Forgets what was heard. For tests. */
    static synchronized void forget() {
        heard.clear();
        heardIn = 0;
    }

    /** Where the same message sits in [list], matched by its chat and id, or -1. */
    private static int indexOf(ArrayList<?> list, Object message) {
        if (list == null) return -1;
        int id = telegram.id(message);
        long dialog = telegram.dialog(message);
        for (int i = 0; i < list.size(); i++) {
            Object other = list.get(i);
            if (other == message || other != null && telegram.id(other) == id && telegram.dialog(other) == dialog) return i;
        }
        return -1;
    }

    /** The message playing now, or null. Replaced when patching. */
    public static Object playing() { return null; }

    /** MediaController's voice queue. Replaced when patching. */
    public static ArrayList<?> queue() { return null; }

    /** Whether the voice queue keeps only unread messages. Replaced when patching. */
    public static boolean unread() { return false; }

    /** Telegram's own music check. Replaced when patching. */
    public static boolean isMusic(Object message) { return false; }

    /** Whether the message is a voice message. Replaced when patching. */
    public static boolean isVoice(Object message) { return false; }

    /** Whether the voice message plays once and disappears. Replaced when patching. */
    public static boolean once(Object message) { return true; }

    /** The message's id. Replaced when patching. */
    public static int id(Object message) { return 0; }

    /** The message's chat. Replaced when patching. */
    public static long dialog(Object message) { return 0; }

    /** How far into the message playback is, in seconds. Replaced when patching. */
    public static int seconds(Object message) { return 0; }

    /** Plays the message. Replaced when patching. */
    public static void play(Object message) {}

    /** Starts the message again from the beginning. Replaced when patching. */
    public static void seekStart(Object message) {}

    /** Hands MediaController a new voice queue. Replaced when patching. */
    public static void requeue(ArrayList<Object> queue, boolean unread) {}
}
