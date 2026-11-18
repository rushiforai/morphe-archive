package io.github.sabopura.morphe.extension.twitch.danmaku;

import io.github.sabopura.morphe.extension.twitch.Diagnostics;
import io.github.sabopura.morphe.extension.twitch.original.ChatTts;
import io.github.sabopura.morphe.extension.twitch.original.HypeMeter;
import io.github.sabopura.morphe.extension.twitch.ui.Feature;
import io.github.sabopura.morphe.extension.twitch.ui.Features;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/**
 * The output of Twitch's live chat parser, for every feature that reads it. The parser thread only queues
 * the message; one background thread reads it once and hands it to each feature in turn, so a slow
 * subscriber delays other subscribers but never the parser. Replayed history and duplicates never arrive.
 */
@SuppressWarnings("unused")
public final class LiveChat {
    /** Called on the background thread; must return quickly and hand off anything slow. */
    public interface Subscriber {
        boolean wants();

        void onMessage(Message message);
    }

    /** One chat message, in the order it arrived. */
    public static final class Message {
        public final String author, login, userId, room, text;
        final ChatMessageReader.Comment comment;

        private Message(ChatMessageReader.Comment comment, String room) {
            this.comment = comment;
            author = comment.author;
            login = comment.login;
            userId = comment.userId;
            this.room = room;
            text = comment.plainText;
        }

        /** The text without Twitch's own emotes. */
        public String withoutEmotes() {
            return ChatTokens.withoutEmotes(comment.segments);
        }
    }

    private static final int RECENT_IDS = 2048;
    private static final int QUEUE = 256;
    private static final Subscriber[] SUBSCRIBERS = subscribers();
    /** No thread exists until chat flows, and it ends after 30 idle seconds. Under load the oldest message is dropped. */
    private static final ThreadPoolExecutor WORKER = new ThreadPoolExecutor(0, 1, 30, TimeUnit.SECONDS,
            new ArrayBlockingQueue<>(QUEUE), runnable -> {
        Thread thread = new Thread(runnable, "sabopura-livechat");
        thread.setDaemon(true);
        thread.setPriority(Thread.NORM_PRIORITY - 1);
        return thread;
    }, new ThreadPoolExecutor.DiscardOldestPolicy());
    private static final LiveAgeGate AGE = new LiveAgeGate();
    private static final Map<String, Boolean> RECENT = new LinkedHashMap<String, Boolean>() {
        @Override
        protected boolean removeEldestEntry(Map.Entry<String, Boolean> eldest) {
            return size() > RECENT_IDS;
        }
    };
    private static String currentRoom;

    private LiveChat() {
    }

    private static Subscriber[] subscribers() {
        List<Subscriber> found = new ArrayList<>();
        if (Features.has(Feature.DANMAKU)) found.add(TwitchDanmaku.SUBSCRIBER);
        if (Features.has(Feature.CHAT_TTS)) found.add(ChatTts.SUBSCRIBER);
        if (Features.has(Feature.HYPE_METER)) found.add(HypeMeter.SUBSCRIBER);
        return found.toArray(new Subscriber[0]);
    }

    /** Injection point: each parsed live chat message, on the parser's own thread. */
    public static void onMessage(Object message) {
        try {
            if (message == null || !anyWants()) return;
            WORKER.execute(() -> deliver(message));
        } catch (RuntimeException | LinkageError ignored) {
            // A refused message only happens while the process shuts down.
        }
    }

    private static boolean anyWants() {
        for (Subscriber subscriber : SUBSCRIBERS) if (subscriber.wants()) return true;
        return false;
    }

    private static void deliver(Object raw) {
        try {
            Map<?, ?> tags = MessageAccess.tags(raw);
            String room = ChatMessageReader.tag(tags, "room-id");
            if (room != null && !room.equals(currentRoom)) {
                currentRoom = room;
                AGE.reset();
            }
            long sentAt = ChatMessageReader.sentAt(tags, MessageAccess.timestampSeconds(raw));
            if (sentAt > 0L && !AGE.isLive(sentAt, System.currentTimeMillis())) return;
            String id = ChatMessageReader.tag(tags, "id");
            if (id != null && !firstSight(id)) return;
            Object sender = MessageAccess.sender(raw);
            ChatMessageReader.Comment comment = ChatMessageReader.read(tags,
                    sender == null ? null : MessageAccess.login(sender), MessageAccess.color(raw),
                    MessageAccess.tokens(raw), MessageAccess.gigantifiedEmote(raw));
            if (comment == null || comment.plainText.isEmpty() && !hasEmote(comment)) return;
            if (id == null && !firstSight(comment.author + '\u0000' + comment.plainText + '\u0000' + sentAt)) return;
            Message message = new Message(comment, currentRoom);
            for (Subscriber subscriber : SUBSCRIBERS) {
                if (!subscriber.wants()) continue;
                try {
                    subscriber.onMessage(message);
                } catch (Throwable failure) {
                    Diagnostics.note("danmaku.live-subscriber", failure);
                }
            }
        } catch (Throwable failure) {
            Diagnostics.note("danmaku.live-read", failure);
        }
    }

    private static boolean firstSight(String key) {
        synchronized (RECENT) {
            return RECENT.put(key, Boolean.TRUE) == null;
        }
    }

    private static boolean hasEmote(ChatMessageReader.Comment comment) {
        for (ChatTokens.Segment segment : comment.segments) if (segment.isEmote()) return true;
        return false;
    }
}
