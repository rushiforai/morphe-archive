/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;

import java.io.File;
import java.io.IOException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.FutureTask;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import java.util.concurrent.atomic.AtomicReference;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Logger;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.PatchFamily;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Opens a chat's videos in a player app instead of Telegram's viewer (#99). A video that's on the
 * phone goes over as a content address the player is allowed to read. One that isn't downloaded
 * plays from {@link VideoStreamServer}, which reads it through the same loader Telegram's own player
 * streams with, so nothing has to be saved first and the player can seek.
 *
 * Whenever this can't hand a video over it answers 0, and Telegram's own player opens as usual.
 * Secret chats, view-once media and protected chats always stay in Telegram's player.
 */
public final class ExternalVideo {
    private ExternalVideo() {}

    static final String OPENED = "video opened in another app";
    static final String STREAMED = "video streamed to another app";

    private static final String WHAT = "video in another app";
    private static final String ANY_VIDEO = "video/*";
    private static final long START_WAIT_MS = 1_000;

    /** Telegram's side, through the stubs below. A test answers it itself. */
    static Telegram telegram = new Stubs();

    /** Android's side. A test answers it itself. */
    static Phone phone = new RealPhone();

    static VideoStreamServer.Timing timing = new VideoStreamServer.Timing();

    private static final Object lock = new Object();
    private static VideoStreamServer server;

    /** First thing in the viewer's open. Non-zero means the video went to another app. */
    public static int open(Object message) {
        try {
            HookStatus.invoked(FamilyNames.KEEP_VIDEOS_MUTED);
            return available() && eligible(message) && handOff(message) ? 1 : 0;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.KEEP_VIDEOS_MUTED, WHAT, failure);
            return 0;
        }
    }

    /**
     * The download arrow on a video in a chat. Non-zero means the video went to another app. {@code
     * video} is the small download button a streamable video has in its corner, which still saves it.
     */
    public static int pressed(Object cell, int video) {
        try {
            HookStatus.invoked(FamilyNames.KEEP_VIDEOS_MUTED);
            if (video != 0 || !available() || telegram.cellButton(cell) != 0) return 0;
            Object message = telegram.cellMessage(cell);
            if (!eligible(message)) return 0;
            // The arrow has just marked the video for Telegram's Downloads list, where a stream
            // would otherwise show up as a download.
            telegram.markDownload(message, false);
            boolean handed = false;
            try {
                handed = handOff(message);
            } finally {
                if (!handed) telegram.markDownload(message, true);
            }
            return handed ? 1 : 0;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.KEEP_VIDEOS_MUTED, WHAT, failure);
            return 0;
        }
    }

    /** Ends every stream, from the notification's Stop. */
    public static void stopStreaming() {
        VideoStreamServer running;
        synchronized (lock) {
            running = server;
        }
        if (running != null) stopInBackground(running);
    }

    static boolean streaming() {
        synchronized (lock) {
            return server != null && !server.stopped();
        }
    }

    /** Whether the switch is on in this build and in the settings. */
    static boolean available() {
        try {
            return Utils.settingsReady() && Settings.EXTERNAL_PLAYER.get()
                    && PatchFamily.Capability.EXTERNAL_PLAYER.installed();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.KEEP_VIDEOS_MUTED, WHAT, failure);
            return false;
        }
    }

    /** A plain video, from a chat that lets it leave Telegram. Round videos and GIFs play where they are. */
    private static boolean eligible(Object message) {
        if (message == null || !telegram.isVideo(message) || telegram.isRound(message) || telegram.isGif(message)
                || telegram.isSecret(message) || telegram.isBlurred(message)) return false;
        long dialog = telegram.dialog(message);
        return !telegram.dialogEncrypted(dialog) && !telegram.noForwards(message)
                && !telegram.peerNoForwards(telegram.account(message), dialog)
                && telegram.document(message) != null;
    }

    private static boolean handOff(Object message) throws IOException {
        Context context = Utils.getContext();
        if (context == null) return false;
        Object document = telegram.document(message);
        String name = telegram.name(message);
        String mime = telegram.mime(document);
        File file = localFile(message);
        return file != null ? openFile(context, file, name, mime) : stream(context, message, document, name, mime);
    }

    /** The finished file, where it was sent from or where Telegram keeps downloads. */
    private static File localFile(Object message) {
        String sent = telegram.path(message);
        if (sent != null && !sent.isEmpty() && usable(new File(sent))) return new File(sent);
        File cached = telegram.file(message);
        return usable(cached) ? cached : null;
    }

    private static boolean usable(File file) {
        return file != null && file.isFile() && file.length() > 0;
    }

    private static boolean openFile(Context context, File file, String name, String mime) {
        Uri address = providerAddress(context, file);
        // Telegram's provider doesn't share its internal cache, so such a file is served instead.
        if (address == null) {
            return serve(context, "file:" + file.getPath(), name, mime, file.length(), VideoStreamServer.fileSource(file));
        }
        try {
            launch(context, address, mime, true);
        } catch (ActivityNotFoundException none) {
            phone.toast(L10n.t("No app can play this video"));
            return false;
        }
        HookStatus.counted(FamilyNames.KEEP_VIDEOS_MUTED, OPENED);
        return true;
    }

    private static Uri providerAddress(Context context, File file) {
        try {
            return telegram.fileAddress(context, context.getPackageName() + ".provider", file);
        } catch (IllegalArgumentException notShared) {
            return null;
        }
    }

    private static boolean stream(Context context, Object message, Object document, String name, String mime) {
        int account = telegram.account(message);
        long size = telegram.size(document);
        String key = telegram.key(document);
        // Telegram's address builder needs the type, and the player needs a length to seek in.
        Uri address = size > 0 && mime != null && key != null && !key.isEmpty()
                ? telegram.streamAddress(account, message, document) : null;
        String scheme = address == null ? null : address.getScheme();
        if ("file".equals(scheme) && address.getPath() != null && usable(new File(address.getPath()))) {
            // It finished arriving a moment ago.
            return openFile(context, new File(address.getPath()), name, mime);
        }
        if (!"tg".equals(scheme)) {
            phone.toast(L10n.t("Couldn't stream this video"));
            return false;
        }
        boolean ownsLoad = !telegram.loading(account, key);
        return serve(context, key, name, mime, size, new TelegramSource(account, document, address, ownsLoad));
    }

    private static boolean serve(Context context, String key, String name, String mime, long size, VideoStreamServer.Source source) {
        VideoStreamServer running = null;
        try {
            running = runningServer();
            String address = running.add(key, name, mime, size, source);
            if (address == null) throw new IOException("the stream server had just stopped");
            phone.keepAlive(context);
            launch(context, Uri.parse(address), mime, false);
            HookStatus.counted(FamilyNames.KEEP_VIDEOS_MUTED, STREAMED);
            return true;
        } catch (ActivityNotFoundException none) {
            undo(running, key);
            phone.toast(L10n.t("No app can play this video"));
            return false;
        } catch (IOException | RuntimeException failure) {
            undo(running, key);
            Logger.printException(() -> "Couldn't stream a video to another app", failure);
            phone.toast(L10n.t("Couldn't stream this video"));
            return false;
        }
    }

    private static void launch(Context context, Uri address, String mime, boolean grant) {
        String safe = VideoStreamServer.safeMime(mime);
        Intent view = new Intent(Intent.ACTION_VIEW)
                .setDataAndType(address, safe != null ? safe : ANY_VIDEO)
                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        if (grant) view.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
        phone.view(context, view);
    }

    private static void undo(VideoStreamServer running, String key) {
        if (running == null) return;
        running.remove(key);
        if (running.empty()) stopInBackground(running);
    }

    /**
     * The running server, or a new one. Binding a socket isn't allowed on the main thread, so it
     * happens on its own, and a server that takes too long is left to stop by itself when nothing
     * has come to it.
     */
    private static VideoStreamServer runningServer() throws IOException {
        synchronized (lock) {
            if (server != null && !server.stopped()) return server;
        }
        AtomicReference<VideoStreamServer> self = new AtomicReference<>();
        FutureTask<VideoStreamServer> starting = new FutureTask<>(() -> {
            VideoStreamServer created = new VideoStreamServer(timing, () -> ended(self.get()));
            self.set(created);
            created.start();
            return created;
        });
        Thread thread = new Thread(starting, "video stream start");
        thread.setDaemon(true);
        thread.start();
        VideoStreamServer created;
        try {
            created = starting.get(START_WAIT_MS, TimeUnit.MILLISECONDS);
        } catch (InterruptedException interrupted) {
            Thread.currentThread().interrupt();
            throw new IOException("interrupted while starting the stream server", interrupted);
        } catch (ExecutionException | TimeoutException failed) {
            throw new IOException("the stream server didn't start", failed);
        }
        synchronized (lock) {
            server = created;
        }
        return created;
    }

    private static void ended(VideoStreamServer stopped) {
        synchronized (lock) {
            if (server != stopped) return;
            server = null;
        }
        phone.stopped();
    }

    private static void stopInBackground(VideoStreamServer running) {
        Thread thread = new Thread(running::stop, "video stream stop");
        thread.setDaemon(true);
        thread.start();
    }

    /** Puts everything a test changed back. */
    static void reset() {
        VideoStreamServer running;
        synchronized (lock) {
            running = server;
            server = null;
        }
        if (running != null) running.stop();
        telegram = new Stubs();
        phone = new RealPhone();
        timing = new VideoStreamServer.Timing();
    }

    /** A video read through Telegram's streaming loader, which fetches the parts asked for. */
    private static final class TelegramSource implements VideoStreamServer.Source {
        private final int account;
        private final Object document;
        private final Uri address;
        private final boolean ownsLoad;

        TelegramSource(int account, Object document, Uri address, boolean ownsLoad) {
            this.account = account;
            this.document = document;
            this.address = address;
            this.ownsLoad = ownsLoad;
        }

        @Override public VideoStreamServer.Reader open(long position, long length) throws IOException {
            Object stream = telegram.newStream();
            boolean opened = false;
            try {
                telegram.openStream(stream, address, position, length);
                opened = true;
            } finally {
                if (!opened) telegram.closeStream(stream);
            }
            return new VideoStreamServer.Reader() {
                @Override public int read(byte[] into, int offset, int count) throws IOException {
                    return telegram.readStream(stream, into, offset, count);
                }

                @Override public void close() {
                    telegram.closeStream(stream);
                }
            };
        }

        /** Telegram keeps downloading after its readers leave, so the player's exit has to end that. */
        @Override public void idle() {
            // A download the person started themselves carries on.
            if (ownsLoad) telegram.cancelLoad(account, document);
        }
    }

    /** What this needs from Android. */
    interface Phone {
        /** Keeps the app running behind the player. Throws when Android refuses. */
        void keepAlive(Context context);

        void view(Context context, Intent intent);

        void toast(String text);

        /** The last stream is over. Called on any thread. */
        void stopped();
    }

    private static final class RealPhone implements Phone {
        @Override public void keepAlive(Context context) { ExternalVideoService.start(context); }

        @Override public void view(Context context, Intent intent) { context.startActivity(intent); }

        @Override public void toast(String text) { Utils.showToastShort(text); }

        @Override public void stopped() { Utils.runOnMainThread(ExternalVideoService::finish); }
    }

    /** What this needs from Telegram. */
    interface Telegram {
        boolean isVideo(Object message);
        boolean isRound(Object message);
        boolean isGif(Object message);
        boolean isSecret(Object message);
        boolean isBlurred(Object message);
        long dialog(Object message);
        boolean dialogEncrypted(long dialog);
        boolean noForwards(Object message);
        boolean peerNoForwards(int account, long dialog);
        Object document(Object message);
        int account(Object message);
        String path(Object message);
        File file(Object message);
        String name(Object message);
        void markDownload(Object message, boolean marked);
        String mime(Object document);
        long size(Object document);
        String key(Object document);
        boolean loading(int account, String key);
        void cancelLoad(int account, Object document);
        Uri streamAddress(int account, Object message, Object document);
        Object newStream();
        void openStream(Object stream, Uri address, long position, long length) throws IOException;
        int readStream(Object stream, byte[] into, int offset, int count) throws IOException;
        void closeStream(Object stream);
        Uri fileAddress(Context context, String authority, File file);
        Object cellMessage(Object cell);
        int cellButton(Object cell);
    }

    private static final class Stubs implements Telegram {
        @Override public boolean isVideo(Object message) { return messageIsVideo(message); }
        @Override public boolean isRound(Object message) { return messageIsRound(message); }
        @Override public boolean isGif(Object message) { return messageIsGif(message); }
        @Override public boolean isSecret(Object message) { return messageIsSecret(message); }
        @Override public boolean isBlurred(Object message) { return messageIsBlurred(message); }
        @Override public long dialog(Object message) { return messageDialog(message); }
        @Override public boolean dialogEncrypted(long dialog) { return dialogIsEncrypted(dialog); }
        @Override public boolean noForwards(Object message) { return messageNoForwards(message); }
        @Override public boolean peerNoForwards(int account, long dialog) { return chatNoForwards(account, dialog); }
        @Override public Object document(Object message) { return messageDocument(message); }
        @Override public int account(Object message) { return messageAccount(message); }
        @Override public String path(Object message) { return messagePath(message); }
        @Override public File file(Object message) { return messageFile(message); }
        @Override public String name(Object message) { return messageName(message); }
        @Override public void markDownload(Object message, boolean marked) { messageMarkDownload(message, marked); }
        @Override public String mime(Object document) { return documentMime(document); }
        @Override public long size(Object document) { return documentSize(document); }
        @Override public String key(Object document) { return documentKey(document); }
        @Override public boolean loading(int account, String key) { return loadRunning(account, key); }
        @Override public void cancelLoad(int account, Object document) { stopLoad(account, document); }
        @Override public Uri streamAddress(int account, Object message, Object document) { return streamUri(account, message, document); }
        @Override public Object newStream() { return createStream(); }
        @Override public void openStream(Object stream, Uri address, long position, long length) throws IOException {
            streamOpen(stream, address, position, length);
        }
        @Override public int readStream(Object stream, byte[] into, int offset, int count) throws IOException {
            return streamRead(stream, into, offset, count);
        }
        @Override public void closeStream(Object stream) { streamClose(stream); }
        @Override public Uri fileAddress(Context context, String authority, File file) { return fileUri(context, authority, file); }
        @Override public Object cellMessage(Object cell) { return cellMessageObject(cell); }
        @Override public int cellButton(Object cell) { return cellButtonState(cell); }
    }

    // Stubs. The patch gives each one Telegram's code; until then they do nothing.

    /** {@code message.isVideo()}. */
    public static boolean messageIsVideo(Object message) { return false; }

    /** {@code message.isRoundVideo()}. */
    public static boolean messageIsRound(Object message) { return false; }

    /** {@code message.isGif()}. */
    public static boolean messageIsGif(Object message) { return false; }

    /** {@code message.isSecretMedia()}, which view-once media answers too. */
    public static boolean messageIsSecret(Object message) { return false; }

    /** {@code message.needDrawBluredPreview()}. */
    public static boolean messageIsBlurred(Object message) { return false; }

    /** {@code message.getDialogId()}. */
    public static long messageDialog(Object message) { return 0; }

    /** {@code DialogObject.isEncryptedDialog(dialog)}. */
    public static boolean dialogIsEncrypted(long dialog) { return false; }

    /** {@code message.messageOwner.noforwards}. */
    public static boolean messageNoForwards(Object message) { return false; }

    /** {@code MessagesController.getInstance(account).isPeerNoForwards(dialog)}. */
    public static boolean chatNoForwards(int account, long dialog) { return false; }

    /** {@code message.getDocument()}. */
    public static Object messageDocument(Object message) { return null; }

    /** {@code message.currentAccount}. */
    public static int messageAccount(Object message) { return 0; }

    /** {@code message.messageOwner.attachPath}. */
    public static String messagePath(Object message) { return null; }

    /** {@code FileLoader.getPathToMessage(message.messageOwner)}. */
    public static File messageFile(Object message) { return null; }

    /** {@code message.getDocumentName()}. */
    public static String messageName(Object message) { return null; }

    /** {@code message.putInDownloadsStore = marked}. */
    public static void messageMarkDownload(Object message, boolean marked) {}

    /** {@code document.mime_type}. */
    public static String documentMime(Object document) { return null; }

    /** {@code document.size}. */
    public static long documentSize(Object document) { return 0; }

    /** {@code FileLoader.getAttachFileName(document)}. */
    public static String documentKey(Object document) { return null; }

    /** {@code FileLoader.getInstance(account).isLoadingFile(key)}. */
    public static boolean loadRunning(int account, String key) { return false; }

    /** {@code FileLoader.getInstance(account).cancelLoadFile(document)}. */
    public static void stopLoad(int account, Object document) {}

    /** {@code FileStreamLoadOperation.prepareUri}, whose parameters this order follows in the builds' code. */
    public static Uri streamUri(int account, Object message, Object document) { return null; }

    /** {@code new FileStreamLoadOperation()}. */
    public static Object createStream() { return null; }

    /** {@code stream.open(new DataSpec(address, position, length))}. */
    public static long streamOpen(Object stream, Uri address, long position, long length) throws IOException { return 0; }

    /** {@code stream.read(into, offset, count)}. */
    public static int streamRead(Object stream, byte[] into, int offset, int count) throws IOException { return -1; }

    /** {@code stream.close()}. */
    public static void streamClose(Object stream) {}

    /** {@code FileProvider.getUriForFile(context, authority, file)}. */
    public static Uri fileUri(Context context, String authority, File file) { return null; }

    /** {@code cell.getMessageObject()}. */
    public static Object cellMessageObject(Object cell) { return null; }

    /** {@code cell.buttonState}. */
    public static int cellButtonState(Object cell) { return -1; }
}
