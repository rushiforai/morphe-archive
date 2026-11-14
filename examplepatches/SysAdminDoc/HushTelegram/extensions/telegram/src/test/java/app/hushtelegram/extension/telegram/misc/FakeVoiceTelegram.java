/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import java.util.ArrayList;
import java.util.List;

/** Telegram's MediaController and MessageObject as {@link VoiceSkip} sees them, with what it asked for. */
final class FakeVoiceTelegram implements VoiceSkip.Telegram {
    /** A message in a chat. */
    static final class Message {
        final int id;
        final long dialog;
        boolean music;
        boolean voice = true;
        boolean once;
        int seconds;

        Message(int id, long dialog) {
            this.id = id;
            this.dialog = dialog;
        }

        static Message song(int id, long dialog) {
            Message song = new Message(id, dialog);
            song.music = true;
            song.voice = false;
            return song;
        }

        @Override public String toString() { return String.valueOf(id); }
    }

    Message playing;
    ArrayList<Object> queue = new ArrayList<>();
    boolean unread;
    boolean breaks;
    final List<String> calls = new ArrayList<>();

    /** Plays [message] from a queue of [queued], the way tapping a voice message in a chat does. */
    static FakeVoiceTelegram playing(Message message, Message... queued) {
        FakeVoiceTelegram telegram = new FakeVoiceTelegram();
        telegram.playing = message;
        for (Message each : queued) telegram.queue.add(each);
        return telegram;
    }

    /** Telegram finishing the message playing: it leaves the queue and the next one starts. */
    void ends() {
        int at = queue.indexOf(playing);
        queue.remove(at);
        playing = at < queue.size() ? (Message) queue.get(at) : null;
    }

    private Message of(Object message) {
        if (breaks) throw new IllegalStateException("a renamed MessageObject");
        return (Message) message;
    }

    @Override public Object playing() {
        if (breaks) throw new IllegalStateException("a renamed MediaController");
        return playing;
    }

    @Override public ArrayList<?> queue() { return queue; }

    @Override public boolean unread() { return unread; }

    @Override public boolean isMusic(Object message) { return of(message).music; }

    @Override public boolean isVoice(Object message) { return of(message).voice; }

    @Override public boolean once(Object message) { return of(message).once; }

    @Override public int id(Object message) { return of(message).id; }

    @Override public long dialog(Object message) { return of(message).dialog; }

    @Override public int seconds(Object message) { return of(message).seconds; }

    @Override public void play(Object message) {
        calls.add("play " + message);
        playing = (Message) message;
        playing.seconds = 0;
    }

    @Override public void seekStart(Object message) {
        calls.add("start " + message);
        ((Message) message).seconds = 0;
    }

    @Override public void requeue(ArrayList<Object> queue, boolean unread) {
        calls.add("queue " + queue + (unread ? " unread" : ""));
        this.queue = queue;
        this.unread = unread;
    }
}
