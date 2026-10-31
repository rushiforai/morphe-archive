/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Executor;
import java.util.concurrent.atomic.AtomicBoolean;

/** Lets tests outside this package ask the finished-download hook, and gives them a Telegram to ask it with. */
public final class SaveDownloadsForTests {
    private SaveDownloadsForTests() {}

    /** A document as Telegram's downloader names it, and its own file name. */
    static final class Document {
        final String attachName;
        final String name;

        Document(String attachName, String name) {
            this.attachName = attachName;
            this.name = name;
        }
    }

    /** A message with a document, and what Telegram's checks say about it. */
    static final class Message {
        final Document document;
        final boolean fileOrSong;
        final boolean forbidden;
        final boolean secret;
        /** Whether it's a photo or a video, and a photo's size Telegram shows it at. */
        final boolean photoOrVideo;
        final Document photo;
        /** Whether it's view-once or self-destructing media, which Telegram counts as neither of the above. */
        final boolean timed;

        Message(Document document, boolean fileOrSong, boolean forbidden) {
            this(document, fileOrSong, forbidden, false);
        }

        Message(Document document, boolean fileOrSong, boolean forbidden, boolean secret) {
            this(document, fileOrSong, forbidden, secret, false, null, false);
        }

        private Message(Document document, boolean fileOrSong, boolean forbidden, boolean secret, boolean photoOrVideo,
                Document photo, boolean timed) {
            this.document = document;
            this.fileOrSong = fileOrSong;
            this.forbidden = forbidden;
            this.secret = secret;
            this.photoOrVideo = photoOrVideo;
            this.photo = photo;
            this.timed = timed;
        }

        /** A photo message, its biggest size named [size]. */
        static Message photo(Document size, boolean forbidden, boolean secret) {
            return new Message(null, false, forbidden, secret, true, size, false);
        }

        /** A video message, whose file is its document. */
        static Message video(Document video, boolean forbidden) {
            return new Message(video, false, forbidden, false, true, null, false);
        }

        /** A view-once or self-destructing photo, its biggest size named [size]. A secret chat's is forbidden too. */
        static Message timedPhoto(Document size, boolean forbidden, boolean secret) {
            return new Message(null, false, forbidden || secret, secret, false, size, true);
        }

        /** A view-once or self-destructing video, voice or round video, whose file is its document. */
        static Message timedDocument(Document document, boolean forbidden, boolean secret) {
            return new Message(document, false, forbidden || secret, secret, false, null, true);
        }
    }

    /** Telegram's message database, by "account:chat:message", and every lookup made in it. */
    static final Map<String, Message> STORED = new HashMap<>();
    static final List<String> LOOKUPS = new ArrayList<>();

    /** Answers the way the stubs do for {@link Message} parents. */
    static final SaveDownloads.Telegram TELEGRAM = new SaveDownloads.Telegram() {
        @Override
        public Object storedMessage(int account, long dialogId, int messageId) {
            String key = account + ":" + dialogId + ":" + messageId;
            LOOKUPS.add(key);
            return STORED.get(key);
        }

        @Override
        public Object document(Object parent) {
            return parent instanceof Message ? ((Message) parent).document : null;
        }

        @Override
        public boolean fileOrSong(Object message) {
            return ((Message) message).fileOrSong;
        }

        @Override
        public boolean savingForbidden(Object message) {
            return ((Message) message).forbidden;
        }

        @Override
        public boolean secretChat(Object message) {
            return ((Message) message).secret;
        }

        @Override
        public String attachName(Object document) {
            return ((Document) document).attachName;
        }

        @Override
        public String documentName(Object document) {
            return ((Document) document).name;
        }

        @Override
        public boolean photoOrVideo(Object message) {
            return ((Message) message).photoOrVideo;
        }

        @Override
        public Object photo(Object message) {
            return ((Message) message).photo;
        }

        @Override
        public boolean timedMedia(Object message) {
            return ((Message) message).timed;
        }
    };

    /** Whether a PDF from an ordinary message, once downloaded, would be queued for a copy. */
    public static boolean queuesACopy() {
        SaveDownloads.Telegram telegram = SaveDownloads.telegram;
        Executor work = SaveDownloads.work;
        AtomicBoolean queued = new AtomicBoolean();
        SaveDownloads.telegram = TELEGRAM;
        SaveDownloads.work = task -> queued.set(true);
        try {
            SaveDownloads.fileLoaded(0, "2_51.pdf", new File("2_51.pdf"),
                    new Message(new Document("2_51.pdf", "report.pdf"), true, false));
        } finally {
            SaveDownloads.telegram = telegram;
            SaveDownloads.work = work;
        }
        return queued.get();
    }

    /** Whether a PDF from a chat that doesn't allow saving, once downloaded, would be queued for a copy. */
    public static boolean queuesARestrictedCopy() {
        SaveDownloads.Telegram telegram = SaveDownloads.telegram;
        Executor work = SaveDownloads.work;
        AtomicBoolean queued = new AtomicBoolean();
        SaveDownloads.telegram = TELEGRAM;
        SaveDownloads.work = task -> queued.set(true);
        try {
            SaveDownloads.fileLoaded(0, "2_51.pdf", new File("2_51.pdf"),
                    new Message(new Document("2_51.pdf", "report.pdf"), true, true));
        } finally {
            SaveDownloads.telegram = telegram;
            SaveDownloads.work = work;
        }
        return queued.get();
    }

    /** Whether a view-once photo from an ordinary chat, once downloaded, would be queued for a copy. */
    public static boolean queuesATimedCopy() {
        SaveDownloads.Telegram telegram = SaveDownloads.telegram;
        Executor work = SaveDownloads.work;
        AtomicBoolean queued = new AtomicBoolean();
        SaveDownloads.telegram = TELEGRAM;
        SaveDownloads.work = task -> queued.set(true);
        try {
            SaveDownloads.fileLoaded(0, "-5012_33.jpg", new File("-5012_33.jpg.enc"),
                    Message.timedPhoto(new Document("-5012_33.jpg", null), false, false));
        } finally {
            SaveDownloads.telegram = telegram;
            SaveDownloads.work = work;
        }
        return queued.get();
    }
}
