/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import android.content.ContentProvider;
import android.content.ContentUris;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.MatrixCursor;
import android.net.Uri;
import android.provider.MediaStore;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Random;
import java.util.concurrent.Executor;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.misc.SaveDownloadsForTests.Document;
import app.hushtelegram.extension.telegram.misc.SaveDownloadsForTests.Message;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class SaveDownloadsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();
    @Rule public final TemporaryFolder elsewhere = new TemporaryFolder();

    private final SaveDownloads.Telegram realTelegram = SaveDownloads.telegram;
    private final Executor realWork = SaveDownloads.work;
    private Downloads downloads;

    @Before public void setUp() {
        restore();
        SaveDownloads.telegram = SaveDownloadsForTests.TELEGRAM;
        SaveDownloads.work = Runnable::run;
        downloads = Robolectric.setupContentProvider(Downloads.class, MediaStore.AUTHORITY);
    }

    @After public void restore() {
        SaveDownloads.telegram = realTelegram;
        SaveDownloads.work = realWork;
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.SAVE_DOWNLOADS);
        Settings.SAVE_DOWNLOADS.resetToDefault();
        SettingReadsForTests.mend(Settings.SAVE_RESTRICTED_DOWNLOADS);
        Settings.SAVE_RESTRICTED_DOWNLOADS.resetToDefault();
        SettingReadsForTests.mend(Settings.SAVE_TIMED_MEDIA);
        Settings.SAVE_TIMED_MEDIA.resetToDefault();
        SettingReadsForTests.mend(Settings.MESSAGE_MENU_SAVE_PROTECTED);
        Settings.MESSAGE_MENU_SAVE_PROTECTED.resetToDefault();
        HookStatus.clear();
        SaveDownloadsForTests.STORED.clear();
        SaveDownloadsForTests.LOOKUPS.clear();
        SaveDownloads.forgetFound();
    }

    private static Context context() {
        return RuntimeEnvironment.getApplication();
    }

    /** A finished download where Telegram keeps it on Android 11 and up: its own external files folder. */
    private static File downloaded(String name, String text) throws IOException {
        File folder = new File(context().getExternalFilesDir(null), "Telegram/Telegram Documents");
        assertTrue(folder.isDirectory() || folder.mkdirs());
        File file = new File(folder, name);
        Files.write(file.toPath(), text.getBytes(StandardCharsets.UTF_8));
        return file;
    }

    private static Message pdf() {
        return new Message(new Document("2_51.pdf", "report.pdf"), true, false);
    }

    private ByteArrayOutputStream bodyOf(long id) {
        ByteArrayOutputStream body = new ByteArrayOutputStream();
        Shadows.shadowOf(context().getContentResolver()).registerOutputStream(downloads.uriFor(id), body);
        return body;
    }

    @Test public void offByDefaultNothingIsCopied() throws IOException {
        assertFalse(Settings.SAVE_DOWNLOADS.get());
        SaveDownloads.fileLoaded(0, "2_51.pdf", downloaded("2_51.pdf", "pdf"), pdf());
        assertTrue(downloads.rows.isEmpty());
        assertTrue(String.join("\n", HookStatus.report()).contains(FamilyNames.SAVE_DOWNLOADS));
    }

    @Test public void onAFileFromAMessageGoesToDownloadTelegramUnderItsOwnName() throws IOException {
        Settings.SAVE_DOWNLOADS.save(true);
        ByteArrayOutputStream body = bodyOf(1);
        SaveDownloads.fileLoaded(0, "2_51.pdf", downloaded("2_51.pdf", "the whole report"), pdf());

        ContentValues row = downloads.row(1);
        assertEquals("report.pdf", row.getAsString(MediaStore.MediaColumns.DISPLAY_NAME));
        assertEquals("Download/Telegram/", row.getAsString(MediaStore.MediaColumns.RELATIVE_PATH));
        // Hidden while it's written, then shown.
        assertEquals(Integer.valueOf(0), row.getAsInteger(MediaStore.MediaColumns.IS_PENDING));
        assertEquals(1, downloads.pendingInserts);
        assertEquals("the whole report", body.toString(StandardCharsets.UTF_8.name()));
        assertTrue(String.join("\n", HookStatus.report()).contains("file saved to Download/Telegram"));
    }

    @Test public void thumbnailsOtherMediaAndOtherParentsStayInTelegram() throws IOException {
        Settings.SAVE_DOWNLOADS.save(true);
        File file = downloaded("2_51.pdf", "pdf");
        // The document's thumbnail finishes under its own name, with the same message as its parent.
        SaveDownloads.fileLoaded(0, "2_77.jpg", file, pdf());
        // A GIF, voice or round video, as Telegram's checks call it.
        SaveDownloads.fileLoaded(0, "2_51.pdf", file, new Message(new Document("2_51.pdf", "clip.mp4"), false, false));
        // A sticker set, a profile photo or a wallpaper isn't a message.
        SaveDownloads.fileLoaded(0, "2_51.pdf", file, "a sticker set");
        SaveDownloads.fileLoaded(0, "2_51.pdf", file, null);
        SaveDownloads.fileLoaded(0, null, file, pdf());
        SaveDownloads.fileLoaded(0, "2_51.pdf", null, pdf());
        assertTrue(downloads.rows.isEmpty());
    }

    @Test public void aFileTheChatDoesntAllowSavingStaysInTelegram() throws IOException {
        Settings.SAVE_DOWNLOADS.save(true);
        SaveDownloads.fileLoaded(0, "2_51.pdf", downloaded("2_51.pdf", "pdf"),
                new Message(new Document("2_51.pdf", "report.pdf"), true, true));
        assertTrue(downloads.rows.isEmpty());
        assertTrue(String.join("\n", HookStatus.report()).contains("saving not allowed"));
    }

    private static Message restrictedPdf() {
        return new Message(new Document("2_51.pdf", "report.pdf"), true, true);
    }

    @Test public void saveByHandCopiesWithOnlyTheItemsOwnSwitchOn() throws IOException {
        assertFalse(Settings.SAVE_DOWNLOADS.get());
        assertFalse(Settings.SAVE_RESTRICTED_DOWNLOADS.get());
        File file = downloaded("2_51.pdf", "the protected report");
        // Switch off: nothing is copied.
        assertNull(SaveDownloads.saveByHand(file, "report.pdf", "2_51.pdf"));
        assertTrue(downloads.rows.isEmpty());

        Settings.MESSAGE_MENU_SAVE_PROTECTED.save(true);
        ByteArrayOutputStream body = bodyOf(1);
        assertEquals(SaveDownloads.SAVED, SaveDownloads.saveByHand(file, "report.pdf", "2_51.pdf"));
        ContentValues row = downloads.row(1);
        assertEquals("report.pdf", row.getAsString(MediaStore.MediaColumns.DISPLAY_NAME));
        assertEquals("Download/Telegram/", row.getAsString(MediaStore.MediaColumns.RELATIVE_PATH));
        assertEquals(Integer.valueOf(0), row.getAsInteger(MediaStore.MediaColumns.IS_PENDING));
        assertEquals("the protected report", body.toString(StandardCharsets.UTF_8.name()));
        // Tapped again, it is already there.
        assertEquals(SaveDownloads.ALREADY_SAVED, SaveDownloads.saveByHand(file, "report.pdf", "2_51.pdf"));
        assertEquals(1, downloads.rows.size());
    }

    @Test public void saveByHandStopsWhenPausedOrTheSwitchGoesOff() throws IOException {
        File file = downloaded("2_51.pdf", "pdf");
        Settings.MESSAGE_MENU_SAVE_PROTECTED.save(true);
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        assertNull(SaveDownloads.saveByHand(file, "report.pdf", "2_51.pdf"));
        PauseForTests.resume();
        Settings.MESSAGE_MENU_SAVE_PROTECTED.save(false);
        assertNull(SaveDownloads.saveByHand(file, "report.pdf", "2_51.pdf"));
        assertTrue(downloads.rows.isEmpty());
    }

    @Test public void saveByHandLeavesTheAutomaticSwitchesAlone() throws IOException {
        Settings.MESSAGE_MENU_SAVE_PROTECTED.save(true);
        SaveDownloads.fileLoaded(0, "2_51.pdf", downloaded("2_51.pdf", "pdf"), restrictedPdf());
        assertTrue("the automatic copy stays off", downloads.rows.isEmpty());
    }

    /**
     * What Telegram's background queue hands over for a file it auto-downloads while its chat is
     * closed: "sent_", the channel, the message, the chat, the message type and the size.
     */
    private static String queuedKey(int messageId, long dialogId, int type) {
        return "sent_" + (dialogId < 0 ? -dialogId - 1000000000000L : 0) + "_" + messageId + "_" + dialogId + "_" + type + "_4096";
    }

    @Test public void aFileTelegramDownloadsWithItsChatClosedIsCopiedUnderItsOwnName() throws IOException {
        Settings.SAVE_DOWNLOADS.save(true);
        SaveDownloadsForTests.STORED.put("1:-1002233445566:51", pdf());
        ByteArrayOutputStream body = bodyOf(1);
        SaveDownloads.fileLoaded(1, "2_51.pdf", downloaded("2_51.pdf", "came in overnight"),
                queuedKey(51, -1002233445566L, SaveDownloads.FILE_TYPE));

        // Looked up on the account the download belongs to, in the chat the key names.
        assertEquals(java.util.Collections.singletonList("1:-1002233445566:51"), SaveDownloadsForTests.LOOKUPS);
        assertEquals("report.pdf", downloads.row(1).getAsString(MediaStore.MediaColumns.DISPLAY_NAME));
        assertEquals("came in overnight", body.toString(StandardCharsets.UTF_8.name()));
        assertTrue(String.join("\n", HookStatus.report()).contains(SaveDownloads.SAVED));
    }

    @Test public void aSongFromAPrivateChatIsLookedUpToo() throws IOException {
        Settings.SAVE_DOWNLOADS.save(true);
        SaveDownloadsForTests.STORED.put("0:777000:9", new Message(new Document("2_51.pdf", "song.mp3"), true, false));
        bodyOf(1);
        SaveDownloads.fileLoaded(0, "2_51.pdf", downloaded("2_51.pdf", "la"), queuedKey(9, 777000L, SaveDownloads.SONG_TYPE));
        assertEquals("song.mp3", downloads.row(1).getAsString(MediaStore.MediaColumns.DISPLAY_NAME));
    }

    @Test public void photosVideosAndOtherKeysAreNeverLookedUp() throws IOException {
        Settings.SAVE_DOWNLOADS.save(true);
        File file = downloaded("2_51.pdf", "pdf");
        SaveDownloadsForTests.STORED.put("0:-1002233445566:51", pdf());
        // A photo, a video, a voice message and a GIF auto-download the same way.
        for (int type : new int[] {1, 3, 2, 8}) {
            SaveDownloads.fileLoaded(0, "2_51.pdf", file, queuedKey(51, -1002233445566L, type));
        }
        SaveDownloads.fileLoaded(0, "2_51.pdf", file, "sent_");
        SaveDownloads.fileLoaded(0, "2_51.pdf", file, "sent_0_51_-100_x_4096");
        SaveDownloads.fileLoaded(0, "2_51.pdf", file, "sent_0_99999999999_-100_9_4096");
        assertTrue(SaveDownloadsForTests.LOOKUPS.isEmpty());
        assertTrue(downloads.rows.isEmpty());
    }

    @Test public void otherMediaIsCountedButNotItsThumbnails() throws IOException {
        Settings.SAVE_DOWNLOADS.save(true);
        File file = downloaded("2_51.pdf", "pdf");
        // A GIF's own file from an open chat, then its thumbnail, then a voice message auto-downloaded in the background.
        SaveDownloads.fileLoaded(0, "2_51.pdf", file, new Message(new Document("2_51.pdf", "clip.mp4"), false, false));
        SaveDownloads.fileLoaded(0, "2_77.jpg", file, new Message(new Document("2_51.pdf", "clip.mp4"), false, false));
        SaveDownloads.fileLoaded(0, "2_51.pdf", file, queuedKey(51, -1002233445566L, 2));
        assertTrue(downloads.rows.isEmpty());
        assertTrue(String.join("\n", HookStatus.report()).contains(SaveDownloads.OTHER_MEDIA + " 2"));
    }

    @Test public void aQueuedFileWhoseMessageIsGoneStaysInTelegram() throws IOException {
        Settings.SAVE_DOWNLOADS.save(true);
        SaveDownloads.fileLoaded(0, "2_51.pdf", downloaded("2_51.pdf", "pdf"), queuedKey(51, -1002233445566L, SaveDownloads.FILE_TYPE));
        assertTrue(downloads.rows.isEmpty());
        assertTrue(String.join("\n", HookStatus.report()).contains(SaveDownloads.NOT_STORED));
    }

    @Test public void aQueuedFileFromAChatThatDoesntAllowSavingFollowsTheSecondSwitch() throws IOException {
        Settings.SAVE_DOWNLOADS.save(true);
        SaveDownloadsForTests.STORED.put("0:-1002233445566:51", restrictedPdf());
        String key = queuedKey(51, -1002233445566L, SaveDownloads.FILE_TYPE);
        SaveDownloads.fileLoaded(0, "2_51.pdf", downloaded("2_51.pdf", "pdf"), key);
        assertTrue(downloads.rows.isEmpty());
        assertTrue(String.join("\n", HookStatus.report()).contains(SaveDownloads.KEPT));

        Settings.SAVE_RESTRICTED_DOWNLOADS.save(true);
        bodyOf(1);
        SaveDownloads.fileLoaded(0, "2_51.pdf", downloaded("2_51.pdf", "pdf"), key);
        assertEquals("report.pdf", downloads.row(1).getAsString(MediaStore.MediaColumns.DISPLAY_NAME));
    }

    @Test public void aQueuedThumbnailIsNotCopiedAsItsDocument() throws IOException {
        Settings.SAVE_DOWNLOADS.save(true);
        SaveDownloadsForTests.STORED.put("0:-1002233445566:51", pdf());
        SaveDownloads.fileLoaded(0, "2_77.jpg", downloaded("2_77.jpg", "thumb"), queuedKey(51, -1002233445566L, SaveDownloads.FILE_TYPE));
        assertTrue(downloads.rows.isEmpty());
    }

    @Test public void aLookupThatFailsIsCountedAndNothingIsCopied() throws IOException {
        Settings.SAVE_DOWNLOADS.save(true);
        SaveDownloads.telegram = new ThrowingLookup();
        SaveDownloads.fileLoaded(0, "2_51.pdf", downloaded("2_51.pdf", "pdf"), queuedKey(51, -1002233445566L, SaveDownloads.FILE_TYPE));
        assertTrue(downloads.rows.isEmpty());
        assertTrue(String.join("\n", HookStatus.report()).contains("background download"));
    }

    /** Telegram's database refusing a read, as it does while an account is being removed. */
    private static final class ThrowingLookup implements SaveDownloads.Telegram {
        private final SaveDownloads.Telegram inner = SaveDownloadsForTests.TELEGRAM;
        @Override public Object document(Object parent) { return inner.document(parent); }
        @Override public boolean fileOrSong(Object message) { return inner.fileOrSong(message); }
        @Override public boolean savingForbidden(Object message) { return inner.savingForbidden(message); }
        @Override public boolean secretChat(Object message) { return inner.secretChat(message); }
        @Override public String attachName(Object document) { return inner.attachName(document); }
        @Override public String documentName(Object document) { return inner.documentName(document); }
        @Override public boolean photoOrVideo(Object message) { return inner.photoOrVideo(message); }
        @Override public Object photo(Object message) { return inner.photo(message); }
        @Override public boolean timedMedia(Object message) { return inner.timedMedia(message); }
        @Override public Object storedMessage(int account, long dialogId, int messageId) {
            throw new IllegalStateException("database closed");
        }
    }

    // #29: Save to Gallery is gone in a chat that doesn't allow saving, so the second switch takes its photos and videos.

    private static Message restrictedPhoto() {
        return Message.photo(new Document("-5012_33.jpg", null), true, false);
    }

    @Test public void theSecondSwitchCopiesAPhotoFromAChatThatDoesntAllowSaving() throws IOException {
        Settings.SAVE_DOWNLOADS.save(true);
        File file = downloaded("-5012_33.jpg", "the photo");
        SaveDownloads.fileLoaded(0, "-5012_33.jpg", file, restrictedPhoto());
        assertTrue(downloads.rows.isEmpty());

        Settings.SAVE_RESTRICTED_DOWNLOADS.save(true);
        ByteArrayOutputStream body = bodyOf(1);
        // Its smaller sizes load with the same message, and stay put.
        SaveDownloads.fileLoaded(0, "-5012_31.jpg", downloaded("-5012_31.jpg", "thumb"), restrictedPhoto());
        SaveDownloads.fileLoaded(0, "-5012_33.jpg", file, restrictedPhoto());
        assertEquals(1, downloads.rows.size());
        assertEquals("-5012_33.jpg", downloads.row(1).getAsString(MediaStore.MediaColumns.DISPLAY_NAME));
        assertEquals("Download/Telegram/", downloads.row(1).getAsString(MediaStore.MediaColumns.RELATIVE_PATH));
        assertEquals("the photo", body.toString(StandardCharsets.UTF_8.name()));
        assertTrue(String.join("\n", HookStatus.report()).contains(SaveDownloads.RESTRICTED_MEDIA));
    }

    @Test public void theSecondSwitchCopiesAVideoUnderItsOwnName() throws IOException {
        Settings.SAVE_DOWNLOADS.save(true);
        Settings.SAVE_RESTRICTED_DOWNLOADS.save(true);
        Message video = Message.video(new Document("4_88.mp4", "lesson.mp4"), true);
        ByteArrayOutputStream body = bodyOf(1);
        // The video's cover first, then the video.
        SaveDownloads.fileLoaded(0, "-5012_40.jpg", downloaded("-5012_40.jpg", "cover"), video);
        SaveDownloads.fileLoaded(0, "4_88.mp4", downloaded("4_88.mp4", "moving pictures"), video);
        assertEquals(1, downloads.rows.size());
        assertEquals("lesson.mp4", downloads.row(1).getAsString(MediaStore.MediaColumns.DISPLAY_NAME));
        assertEquals("moving pictures", body.toString(StandardCharsets.UTF_8.name()));
    }

    @Test public void photosAndVideosFromOrdinaryOrSecretChatsStayInTelegram() throws IOException {
        Settings.SAVE_DOWNLOADS.save(true);
        Settings.SAVE_RESTRICTED_DOWNLOADS.save(true);
        // An ordinary chat has Save to Gallery for these.
        SaveDownloads.fileLoaded(0, "-5012_33.jpg", downloaded("-5012_33.jpg", "p"),
                Message.photo(new Document("-5012_33.jpg", null), false, false));
        SaveDownloads.fileLoaded(0, "4_88.mp4", downloaded("4_88.mp4", "v"),
                Message.video(new Document("4_88.mp4", "lesson.mp4"), false));
        // A secret chat never lets anything out.
        SaveDownloads.fileLoaded(0, "-5012_33.jpg", downloaded("-5012_33.jpg", "p"),
                Message.photo(new Document("-5012_33.jpg", null), true, true));
        assertTrue(downloads.rows.isEmpty());
        assertTrue(String.join("\n", HookStatus.report()).contains(SaveDownloads.KEPT));
    }

    @Test public void aQueuedPhotoIsLookedUpOnlyWithTheSecondSwitchOn() throws IOException {
        Settings.SAVE_DOWNLOADS.save(true);
        SaveDownloadsForTests.STORED.put("0:-1002233445566:51", restrictedPhoto());
        String key = queuedKey(51, -1002233445566L, SaveDownloads.PHOTO_TYPE);
        SaveDownloads.fileLoaded(0, "-5012_33.jpg", downloaded("-5012_33.jpg", "overnight"), key);
        assertTrue(SaveDownloadsForTests.LOOKUPS.isEmpty());

        Settings.SAVE_RESTRICTED_DOWNLOADS.save(true);
        bodyOf(1);
        SaveDownloads.fileLoaded(0, "-5012_33.jpg", downloaded("-5012_33.jpg", "overnight"), key);
        assertEquals(java.util.Collections.singletonList("0:-1002233445566:51"), SaveDownloadsForTests.LOOKUPS);
        assertEquals("-5012_33.jpg", downloads.row(1).getAsString(MediaStore.MediaColumns.DISPLAY_NAME));
    }

    @Test public void theSecondSwitchLetsAChatThatDoesntAllowSavingThrough() throws IOException {
        // Off until someone turns it on, since it goes past the owner's setting.
        assertFalse(Settings.SAVE_RESTRICTED_DOWNLOADS.get());
        Settings.SAVE_DOWNLOADS.save(true);
        Settings.SAVE_RESTRICTED_DOWNLOADS.save(true);
        ByteArrayOutputStream body = bodyOf(1);
        SaveDownloads.fileLoaded(0, "2_51.pdf", downloaded("2_51.pdf", "kept by permission"), restrictedPdf());
        assertEquals("report.pdf", downloads.row(1).getAsString(MediaStore.MediaColumns.DISPLAY_NAME));
        assertEquals("kept by permission", body.toString(StandardCharsets.UTF_8.name()));
        String report = String.join("\n", HookStatus.report());
        assertTrue(report.contains(SaveDownloads.RESTRICTED));
        assertTrue(report.contains(SaveDownloads.SAVED));
    }

    @Test public void theSecondSwitchAloneCopiesNothing() throws IOException {
        Settings.SAVE_RESTRICTED_DOWNLOADS.save(true);
        SaveDownloads.fileLoaded(0, "2_51.pdf", downloaded("2_51.pdf", "pdf"), restrictedPdf());
        SaveDownloads.fileLoaded(0, "2_51.pdf", downloaded("2_51.pdf", "pdf"), pdf());
        assertTrue(downloads.rows.isEmpty());
    }

    @Test public void aSecretChatStaysInTelegramWithTheSecondSwitchOn() throws IOException {
        Settings.SAVE_DOWNLOADS.save(true);
        Settings.SAVE_RESTRICTED_DOWNLOADS.save(true);
        SaveDownloads.fileLoaded(0, "2_51.pdf", downloaded("2_51.pdf", "pdf"),
                new Message(new Document("2_51.pdf", "report.pdf"), true, true, true));
        assertTrue(downloads.rows.isEmpty());
        String report = String.join("\n", HookStatus.report());
        assertTrue(report.contains("saving not allowed"));
        assertFalse(report.contains(SaveDownloads.RESTRICTED));
    }

    @Test public void turningTheSecondSwitchOffDropsOnlyTheWaitingCopiesItLetThrough() throws IOException {
        Settings.SAVE_DOWNLOADS.save(true);
        Settings.SAVE_RESTRICTED_DOWNLOADS.save(true);
        java.util.List<Runnable> queued = new java.util.ArrayList<>();
        SaveDownloads.work = queued::add;
        bodyOf(1);
        SaveDownloads.fileLoaded(0, "2_51.pdf", downloaded("2_51.pdf", "pdf"), restrictedPdf());
        SaveDownloads.fileLoaded(0, "2_52.pdf", downloaded("2_52.pdf", "two"),
                new Message(new Document("2_52.pdf", "notes.pdf"), true, false));
        assertEquals(2, queued.size());
        Settings.SAVE_RESTRICTED_DOWNLOADS.save(false);
        for (Runnable copy : queued) copy.run();
        assertEquals(1, downloads.rows.size());
        assertEquals("notes.pdf", downloads.row(1).getAsString(MediaStore.MediaColumns.DISPLAY_NAME));
        assertFalse(receipts().contains("2_51.pdf"));
        assertTrue(String.join("\n", HookStatus.report()).contains(SaveDownloads.DROPPED));
    }

    @Test public void turningTheSecondSwitchOffWhileACopyIsWrittenRemovesTheHiddenEntry() throws IOException {
        Settings.SAVE_DOWNLOADS.save(true);
        Settings.SAVE_RESTRICTED_DOWNLOADS.save(true);
        Shadows.shadowOf(context().getContentResolver()).registerOutputStream(downloads.uriFor(1), new OutputStream() {
            @Override public void write(int b) {
                Settings.SAVE_RESTRICTED_DOWNLOADS.save(false);
            }
        });
        SaveDownloads.fileLoaded(0, "2_51.pdf", downloaded("2_51.pdf", "pdf"), restrictedPdf());
        assertEquals(1, downloads.pendingInserts);
        assertTrue("the hidden entry stayed behind", downloads.rows.isEmpty());
        assertFalse(receipts().contains("2_51.pdf"));
    }

    private static android.content.SharedPreferences receipts() {
        return context().getSharedPreferences(SaveDownloads.RECEIPTS, Context.MODE_PRIVATE);
    }

    // #9: view-once and self-destructing media, which Telegram keeps encrypted in its cache.

    /** [size] bytes that differ block to block, so a keystream off by one block shows. */
    private static byte[] media(int size) {
        byte[] bytes = new byte[size];
        new Random(size).nextBytes(bytes);
        return bytes;
    }

    /**
     * [plain] as FileLoadOperation keeps it: [name] plus ".enc" in the cache, encrypted with AES-256
     * in CTR mode, every block under the IV with that block's number written into its last four bytes.
     * Built a block at a time from AES itself rather than a CTR cipher, beside its key file in the
     * internal cache: 32 bytes of key, then the 16-byte IV, whose last four bytes Telegram ignores.
     */
    private static File encrypted(String name, byte[] plain) throws Exception {
        byte[] key = new byte[32];
        byte[] iv = new byte[16];
        new Random(1).nextBytes(key);
        new Random(2).nextBytes(iv);
        Cipher aes = Cipher.getInstance("AES/ECB/NoPadding");
        aes.init(Cipher.ENCRYPT_MODE, new SecretKeySpec(key, "AES"));
        byte[] sealed = new byte[plain.length];
        for (int block = 0; block * 16 < plain.length; block++) {
            byte[] counter = iv.clone();
            counter[12] = (byte) (block >>> 24);
            counter[13] = (byte) (block >>> 16);
            counter[14] = (byte) (block >>> 8);
            counter[15] = (byte) block;
            byte[] stream = aes.doFinal(counter);
            for (int i = 0; i < 16 && block * 16 + i < plain.length; i++) {
                sealed[block * 16 + i] = (byte) (plain[block * 16 + i] ^ stream[i]);
            }
        }
        File cache = context().getExternalCacheDir();
        if (!cache.mkdirs() && !cache.isDirectory()) fail("no cache folder");
        File file = new File(cache, name + SaveDownloads.ENCRYPTED);
        Files.write(file.toPath(), sealed);
        ByteArrayOutputStream keyFile = new ByteArrayOutputStream();
        keyFile.write(key);
        keyFile.write(iv);
        Files.write(new File(context().getCacheDir(), file.getName() + ".key").toPath(), keyFile.toByteArray());
        return file;
    }

    private static Message timedPhoto() {
        return Message.timedPhoto(new Document("-5012_33.jpg", null), false, false);
    }

    @Test public void viewOnceMediaStaysInTelegramUntilItsOwnSwitchIsOn() throws Exception {
        // Off until someone turns it on, since it goes past the sender's timer.
        assertFalse(Settings.SAVE_TIMED_MEDIA.get());
        Settings.SAVE_DOWNLOADS.save(true);
        Settings.SAVE_RESTRICTED_DOWNLOADS.save(true);
        SaveDownloads.fileLoaded(0, "-5012_33.jpg", encrypted("-5012_33.jpg", media(100)), timedPhoto());
        assertTrue(downloads.rows.isEmpty());
        String report = String.join("\n", HookStatus.report());
        assertTrue(report.contains(SaveDownloads.OTHER_MEDIA));
        assertFalse(report.contains(SaveDownloads.TIMED));
    }

    @Test public void theTimedSwitchAloneCopiesNothing() throws Exception {
        Settings.SAVE_TIMED_MEDIA.save(true);
        SaveDownloads.fileLoaded(0, "-5012_33.jpg", encrypted("-5012_33.jpg", media(100)), timedPhoto());
        assertTrue(downloads.rows.isEmpty());
    }

    @Test public void withItsSwitchOnAViewOncePhotoIsCopiedDecrypted() throws Exception {
        Settings.SAVE_DOWNLOADS.save(true);
        Settings.SAVE_TIMED_MEDIA.save(true);
        // Over 64 KB and 4,096 blocks, so the copy reads it in pieces and the block number carries.
        byte[] photo = media(70_001);
        ByteArrayOutputStream body = bodyOf(1);
        // Its smaller sizes load with the same message, and stay put.
        SaveDownloads.fileLoaded(0, "-5012_31.jpg", encrypted("-5012_31.jpg", media(40)), timedPhoto());
        SaveDownloads.fileLoaded(0, "-5012_33.jpg", encrypted("-5012_33.jpg", photo), timedPhoto());
        assertEquals(1, downloads.rows.size());
        // Under the photo's own name, without the ".enc" Telegram adds.
        assertEquals("-5012_33.jpg", downloads.row(1).getAsString(MediaStore.MediaColumns.DISPLAY_NAME));
        assertEquals("Download/Telegram/", downloads.row(1).getAsString(MediaStore.MediaColumns.RELATIVE_PATH));
        assertArrayEquals(photo, body.toByteArray());
        String report = String.join("\n", HookStatus.report());
        assertTrue(report.contains(SaveDownloads.TIMED));
        assertTrue(report.contains(SaveDownloads.SAVED));
        assertEquals(1L, receipts().getLong("-5012_33.jpg", -1));
    }

    @Test public void aViewOnceVoiceMessageOrVideoKeepsItsOwnExtension() throws Exception {
        Settings.SAVE_DOWNLOADS.save(true);
        Settings.SAVE_TIMED_MEDIA.save(true);
        byte[] voice = media(3_000);
        byte[] video = media(5_000);
        ByteArrayOutputStream first = bodyOf(1);
        ByteArrayOutputStream second = bodyOf(2);
        // A voice message has no file name of its own, a video can.
        SaveDownloads.fileLoaded(0, "2_88.ogg", encrypted("2_88.ogg", voice),
                Message.timedDocument(new Document("2_88.ogg", ""), false, false));
        SaveDownloads.fileLoaded(0, "4_90.mp4", encrypted("4_90.mp4", video),
                Message.timedDocument(new Document("4_90.mp4", "beach.mp4"), false, false));
        assertEquals("2_88.ogg", downloads.row(1).getAsString(MediaStore.MediaColumns.DISPLAY_NAME));
        assertEquals("beach.mp4", downloads.row(2).getAsString(MediaStore.MediaColumns.DISPLAY_NAME));
        assertArrayEquals(voice, first.toByteArray());
        assertArrayEquals(video, second.toByteArray());
    }

    @Test public void aSecretChatsTimedMediaStaysInTelegramWithEverySwitchOn() throws Exception {
        Settings.SAVE_DOWNLOADS.save(true);
        Settings.SAVE_RESTRICTED_DOWNLOADS.save(true);
        Settings.SAVE_TIMED_MEDIA.save(true);
        SaveDownloads.fileLoaded(0, "-5012_33.jpg", encrypted("-5012_33.jpg", media(100)),
                Message.timedPhoto(new Document("-5012_33.jpg", null), false, true));
        SaveDownloads.fileLoaded(0, "2_88.ogg", encrypted("2_88.ogg", media(100)),
                Message.timedDocument(new Document("2_88.ogg", ""), false, true));
        assertTrue(downloads.rows.isEmpty());
        String report = String.join("\n", HookStatus.report());
        assertTrue(report.contains(SaveDownloads.KEPT + " 2"));
        assertFalse(report.contains(SaveDownloads.TIMED));
    }

    @Test public void timedMediaFromAChatThatDoesntAllowSavingNeedsTheSecondSwitchToo() throws Exception {
        Settings.SAVE_DOWNLOADS.save(true);
        Settings.SAVE_TIMED_MEDIA.save(true);
        Message forbidden = Message.timedPhoto(new Document("-5012_33.jpg", null), true, false);
        byte[] photo = media(500);
        File file = encrypted("-5012_33.jpg", photo);
        SaveDownloads.fileLoaded(0, "-5012_33.jpg", file, forbidden);
        assertTrue(downloads.rows.isEmpty());
        assertTrue(String.join("\n", HookStatus.report()).contains(SaveDownloads.KEPT));

        Settings.SAVE_RESTRICTED_DOWNLOADS.save(true);
        ByteArrayOutputStream body = bodyOf(1);
        SaveDownloads.fileLoaded(0, "-5012_33.jpg", file, forbidden);
        assertArrayEquals(photo, body.toByteArray());
    }

    @Test public void turningTheTimedSwitchOffDropsOnlyTheWaitingCopiesItLetThrough() throws Exception {
        Settings.SAVE_DOWNLOADS.save(true);
        Settings.SAVE_TIMED_MEDIA.save(true);
        java.util.List<Runnable> queued = new java.util.ArrayList<>();
        SaveDownloads.work = queued::add;
        bodyOf(1);
        SaveDownloads.fileLoaded(0, "-5012_33.jpg", encrypted("-5012_33.jpg", media(100)), timedPhoto());
        SaveDownloads.fileLoaded(0, "2_51.pdf", downloaded("2_51.pdf", "pdf"), pdf());
        assertEquals(2, queued.size());
        Settings.SAVE_TIMED_MEDIA.save(false);
        for (Runnable copy : queued) copy.run();
        assertEquals(1, downloads.rows.size());
        assertEquals("report.pdf", downloads.row(1).getAsString(MediaStore.MediaColumns.DISPLAY_NAME));
        assertFalse(receipts().contains("-5012_33.jpg"));
        assertTrue(String.join("\n", HookStatus.report()).contains(SaveDownloads.DROPPED));
    }

    @Test public void queuedVoiceAndRoundVideosAreLookedUpOnlyWithTheTimedSwitchOn() throws Exception {
        Settings.SAVE_DOWNLOADS.save(true);
        SaveDownloadsForTests.STORED.put("0:777000:9", Message.timedDocument(new Document("2_88.ogg", ""), false, false));
        String voiceKey = queuedKey(9, 777000L, SaveDownloads.VOICE_TYPE);
        String roundKey = queuedKey(10, 777000L, SaveDownloads.ROUND_TYPE);
        byte[] voice = media(3_000);
        File file = encrypted("2_88.ogg", voice);
        SaveDownloads.fileLoaded(0, "2_88.ogg", file, voiceKey);
        SaveDownloads.fileLoaded(0, "2_89.mp4", file, roundKey);
        assertTrue(SaveDownloadsForTests.LOOKUPS.isEmpty());

        Settings.SAVE_TIMED_MEDIA.save(true);
        ByteArrayOutputStream body = bodyOf(1);
        SaveDownloads.fileLoaded(0, "2_88.ogg", file, voiceKey);
        SaveDownloads.fileLoaded(0, "2_89.mp4", file, roundKey);
        assertEquals(java.util.Arrays.asList("0:777000:9", "0:777000:10"), SaveDownloadsForTests.LOOKUPS);
        assertEquals("2_88.ogg", downloads.row(1).getAsString(MediaStore.MediaColumns.DISPLAY_NAME));
        assertArrayEquals(voice, body.toByteArray());
    }

    @Test public void anEncryptedFileWithoutItsKeyLeavesNothingBehind() throws Exception {
        Settings.SAVE_DOWNLOADS.save(true);
        Settings.SAVE_TIMED_MEDIA.save(true);
        File file = encrypted("-5012_33.jpg", media(100));
        assertTrue(new File(context().getCacheDir(), file.getName() + ".key").delete());
        SaveDownloads.fileLoaded(0, "-5012_33.jpg", file, timedPhoto());
        assertEquals(1, downloads.pendingInserts);
        assertTrue("the half-written entry is removed", downloads.rows.isEmpty());
        assertFalse(HookStatus.missing(FamilyNames.SAVE_DOWNLOADS).isEmpty());
        assertFalse(receipts().contains("-5012_33.jpg"));
    }

    @Test public void theSameDocumentDownloadedAgainIsCopiedOnce() throws IOException {
        Settings.SAVE_DOWNLOADS.save(true);
        bodyOf(1);
        SaveDownloads.fileLoaded(0, "2_51.pdf", downloaded("2_51.pdf", "pdf"), pdf());
        assertEquals(1, downloads.rows.size());
        // The note is on disk, not in memory, so it holds across a restart.
        assertEquals(1L, receipts().getLong("2_51.pdf", -1));

        SaveDownloads.fileLoaded(0, "2_51.pdf", downloaded("2_51.pdf", "pdf"), pdf());
        assertEquals(1, downloads.rows.size());
        assertTrue(String.join("\n", HookStatus.report()).contains("file already in Download/Telegram"));
    }

    @Test public void twoDocumentsWithTheSameNameAndSizeBothGetACopy() throws IOException {
        Settings.SAVE_DOWNLOADS.save(true);
        ByteArrayOutputStream first = bodyOf(1);
        ByteArrayOutputStream second = bodyOf(2);
        SaveDownloads.fileLoaded(0, "2_51.pdf", downloaded("2_51.pdf", "one"), pdf());
        SaveDownloads.fileLoaded(0, "2_52.pdf", downloaded("2_52.pdf", "two"),
                new Message(new Document("2_52.pdf", "report.pdf"), true, false));
        assertEquals("report.pdf", downloads.row(1).getAsString(MediaStore.MediaColumns.DISPLAY_NAME));
        assertEquals("report (1).pdf", downloads.row(2).getAsString(MediaStore.MediaColumns.DISPLAY_NAME));
        assertEquals("one", first.toString(StandardCharsets.UTF_8.name()));
        assertEquals("two", second.toString(StandardCharsets.UTF_8.name()));
    }

    /**
     * Telegram keeps a document under its own name, and one it has no path saved for counts as
     * downloaded when a file of that name and size is there, so a second report.pdf of the same
     * size opens the first one's file. Downloaded for real, it lands beside it and is copied.
     */
    @Test public void aFileTelegramTookByNameAndSizeIsNotCopied() throws IOException {
        Settings.SAVE_DOWNLOADS.save(true);
        ByteArrayOutputStream first = bodyOf(1);
        File report = downloaded("report.pdf", "one");
        SaveDownloads.finishing(new Object(), new File(report.getParentFile(), "2_51.pdf.temp"), report);
        SaveDownloads.fileLoaded(0, "2_51.pdf", report, pdf());
        assertEquals("one", first.toString(StandardCharsets.UTF_8.name()));

        Message twin = new Message(new Document("2_52.pdf", "report.pdf"), true, false);
        SaveDownloads.finishing(new Object(), null, report);
        SaveDownloads.fileLoaded(0, "2_52.pdf", report, twin);
        assertEquals(1, downloads.rows.size());
        assertEquals(-1L, receipts().getLong("2_52.pdf", -1));
        assertTrue(String.join("\n", HookStatus.report()).contains(SaveDownloads.NOT_ITS_OWN));

        ByteArrayOutputStream second = bodyOf(2);
        File own = downloaded("report (1).pdf", "two");
        SaveDownloads.finishing(new Object(), new File(own.getParentFile(), "2_52.pdf.temp"), own);
        SaveDownloads.fileLoaded(0, "2_52.pdf", own, twin);
        assertEquals("report (1).pdf", downloads.row(2).getAsString(MediaStore.MediaColumns.DISPLAY_NAME));
        assertEquals("two", second.toString(StandardCharsets.UTF_8.name()));
    }

    /** Only a file under the document's name with no saved path is held back, and only for its own finish. */
    @Test public void aFileTelegramFoundOtherwiseIsCopied() throws IOException {
        Settings.SAVE_DOWNLOADS.save(true);
        for (long id = 1; id <= 3; id++) bodyOf(id);
        // Under the downloader's name, which no other document has.
        File named = downloaded("2_51.pdf", "one");
        SaveDownloads.finishing(new Object(), null, named);
        SaveDownloads.fileLoaded(0, "2_51.pdf", named, pdf());
        assertEquals(1, downloads.rows.size());

        // At a path Telegram saved for this document.
        File report = downloaded("report.pdf", "two");
        Message other = new Message(new Document("2_52.pdf", "report.pdf"), true, false);
        SaveDownloads.finishing(null, null, report);
        SaveDownloads.fileLoaded(0, "2_52.pdf", report, other);
        assertEquals(2, downloads.rows.size());

        // Held back once, then taken back, so the file's next finish is an ordinary one.
        Message third = new Message(new Document("2_53.pdf", "report.pdf"), true, false);
        SaveDownloads.finishing(new Object(), null, report);
        SaveDownloads.fileLoaded(0, "2_53.pdf", report, third);
        assertEquals(2, downloads.rows.size());
        SaveDownloads.fileLoaded(0, "2_53.pdf", report, third);
        assertEquals(3, downloads.rows.size());
    }

    /** One that finishes with the switch off is taken back too, and doesn't hold back a later copy. */
    @Test public void aFoundFileIsTakenBackWithTheSwitchOff() throws IOException {
        bodyOf(1);
        File report = downloaded("report.pdf", "one");
        SaveDownloads.finishing(new Object(), null, report);
        SaveDownloads.fileLoaded(0, "2_51.pdf", report, pdf());
        Settings.SAVE_DOWNLOADS.save(true);
        SaveDownloads.fileLoaded(0, "2_51.pdf", report, pdf());
        assertEquals(1, downloads.rows.size());
    }

    /** A report.pdf of three bytes already in Download/Telegram, added at [added] in MediaStore's seconds. */
    private void anEntryAddedAt(long added) {
        ContentValues earlier = new ContentValues();
        earlier.put(MediaStore.MediaColumns.DISPLAY_NAME, "report.pdf");
        earlier.put(MediaStore.MediaColumns.RELATIVE_PATH, "Download/Telegram/");
        earlier.put(MediaStore.MediaColumns.SIZE, 3L);
        earlier.put(MediaStore.MediaColumns.DATE_ADDED, added);
        downloads.rows.put(1L, earlier);
        downloads.nextId = 2;
    }

    /** Since the list began, a name and size match can be another file, so only a note counts. */
    @Test public void anEntryAddedSinceTheListBeganNeedsItsNote() throws IOException {
        Settings.SAVE_DOWNLOADS.save(true);
        assertTrue(receipts().edit().putLong(SaveDownloads.BEGAN, 1000).commit());
        anEntryAddedAt(2000);
        ByteArrayOutputStream body = bodyOf(2);
        SaveDownloads.fileLoaded(0, "2_51.pdf", downloaded("2_51.pdf", "pdf"), pdf());
        assertEquals("report (1).pdf", downloads.row(2).getAsString(MediaStore.MediaColumns.DISPLAY_NAME));
        assertEquals("pdf", body.toString(StandardCharsets.UTF_8.name()));
    }

    /** Copies from a version without the list are matched the way it matched them, once each. */
    @Test public void aCopyFromBeforeTheListIsTakenOnceInsteadOfCopiedAgain() throws IOException {
        Settings.SAVE_DOWNLOADS.save(true);
        anEntryAddedAt(1000);
        SaveDownloads.fileLoaded(0, "2_51.pdf", downloaded("2_51.pdf", "pdf"), pdf());
        assertEquals(1, downloads.rows.size());
        assertEquals(1L, receipts().getLong("2_51.pdf", -1));
        // The first copy that found no list started it.
        assertTrue(receipts().getLong(SaveDownloads.BEGAN, -1) > 1000);
        assertTrue(String.join("\n", HookStatus.report()).contains(SaveDownloads.ALREADY_SAVED));

        // Another document of the same name and size finds the old entry taken.
        ByteArrayOutputStream body = bodyOf(2);
        SaveDownloads.fileLoaded(0, "2_52.pdf", downloaded("2_52.pdf", "two"),
                new Message(new Document("2_52.pdf", "report.pdf"), true, false));
        assertEquals("report (1).pdf", downloads.row(2).getAsString(MediaStore.MediaColumns.DISPLAY_NAME));
        assertEquals("two", body.toString(StandardCharsets.UTF_8.name()));
        assertEquals(2L, receipts().getLong("2_52.pdf", -1));
    }

    @Test public void aCopyDeletedFromDownloadsIsMadeAgain() throws IOException {
        Settings.SAVE_DOWNLOADS.save(true);
        bodyOf(1);
        bodyOf(2);
        SaveDownloads.fileLoaded(0, "2_51.pdf", downloaded("2_51.pdf", "pdf"), pdf());
        downloads.rows.clear();
        SaveDownloads.fileLoaded(0, "2_51.pdf", downloaded("2_51.pdf", "pdf"), pdf());
        assertEquals("report.pdf", downloads.row(2).getAsString(MediaStore.MediaColumns.DISPLAY_NAME));
        assertEquals(2L, receipts().getLong("2_51.pdf", -1));
    }

    @Test public void theNotesKeepTheNewestAndDropTheOldest() throws IOException {
        Settings.SAVE_DOWNLOADS.save(true);
        android.content.SharedPreferences.Editor full = receipts().edit();
        for (int i = 0; i < SaveDownloads.MAX_RECEIPTS; i++) full.putLong("2_" + (1000 + i) + ".pdf", 100 + i);
        full.commit();
        downloads.nextId = 5000;
        bodyOf(5000);
        SaveDownloads.fileLoaded(0, "2_51.pdf", downloaded("2_51.pdf", "pdf"), pdf());
        // The notes, plus when the list began.
        assertEquals(SaveDownloads.MAX_RECEIPTS + 1, receipts().getAll().size());
        assertEquals(5000L, receipts().getLong("2_51.pdf", -1));
        assertFalse("the oldest note stayed", receipts().contains("2_1000.pdf"));
        assertTrue(receipts().contains("2_1001.pdf"));
    }

    @Test public void aCopyWaitingWhenTheSwitchGoesOffOrPausesPublishesNothing() throws IOException {
        Settings.SAVE_DOWNLOADS.save(true);
        java.util.List<Runnable> queued = new java.util.ArrayList<>();
        SaveDownloads.work = queued::add;
        File file = downloaded("2_51.pdf", "pdf");
        SaveDownloads.fileLoaded(0, "2_51.pdf", file, pdf());
        Settings.SAVE_DOWNLOADS.save(false);
        SaveDownloads.fileLoaded(0, "2_51.pdf", file, pdf());
        assertEquals(1, queued.size());
        queued.remove(0).run();

        Settings.SAVE_DOWNLOADS.save(true);
        SaveDownloads.fileLoaded(0, "2_51.pdf", file, pdf());
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        queued.remove(0).run();
        assertTrue(downloads.rows.isEmpty());
        assertEquals("nothing was even started", 0, downloads.pendingInserts);
        assertTrue(String.join("\n", HookStatus.report()).contains("copy dropped, switched off or paused"));
        assertFalse(receipts().contains("2_51.pdf"));
    }

    @Test public void pausingWhileTheCopyIsWrittenRemovesTheHiddenEntry() throws IOException {
        Settings.SAVE_DOWNLOADS.save(true);
        Shadows.shadowOf(context().getContentResolver()).registerOutputStream(downloads.uriFor(1), new OutputStream() {
            @Override public void write(int b) {
                PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
            }
        });
        SaveDownloads.fileLoaded(0, "2_51.pdf", downloaded("2_51.pdf", "pdf"), pdf());
        assertEquals(1, downloads.pendingInserts);
        assertTrue("the hidden entry stayed behind", downloads.rows.isEmpty());
        assertTrue(String.join("\n", HookStatus.report()).contains("copy dropped, switched off or paused"));
        assertFalse(receipts().contains("2_51.pdf"));
    }

    @Test public void aFileAlreadyInSharedStorageIsntCopiedAgain() throws IOException {
        Settings.SAVE_DOWNLOADS.save(true);
        // Android 10 with storage access keeps Telegram's folder on shared storage.
        File shared = elsewhere.newFile("2_51.pdf");
        assertFalse(SaveDownloads.insideApp(context(), shared));
        SaveDownloads.fileLoaded(0, "2_51.pdf", shared, pdf());
        assertTrue(downloads.rows.isEmpty());
        assertTrue(String.join("\n", HookStatus.report()).contains("file already in shared storage"));
        assertTrue(SaveDownloads.insideApp(context(), downloaded("2_51.pdf", "pdf")));
        assertTrue(SaveDownloads.insideApp(context(), new File(context().getExternalCacheDir(), "2_51.pdf")));
        assertTrue(SaveDownloads.insideApp(context(), new File(context().getFilesDir(), "2_51.pdf")));
    }

    @Config(sdk = 28)
    @Test public void android9KeepsTelegramsSharedFolder() throws IOException {
        Settings.SAVE_DOWNLOADS.save(true);
        SaveDownloads.fileLoaded(0, "2_51.pdf", downloaded("2_51.pdf", "pdf"), pdf());
        assertTrue(downloads.rows.isEmpty());
        assertTrue(String.join("\n", HookStatus.report()).contains("Android 9"));
    }

    @Test public void aCopyThatFailsLeavesNothingBehind() throws IOException {
        Settings.SAVE_DOWNLOADS.save(true);
        Shadows.shadowOf(context().getContentResolver()).registerOutputStream(downloads.uriFor(1), new OutputStream() {
            @Override public void write(int b) throws IOException {
                throw new IOException("storage full");
            }
        });
        SaveDownloads.fileLoaded(0, "2_51.pdf", downloaded("2_51.pdf", "pdf"), pdf());
        assertEquals(1, downloads.pendingInserts);
        assertTrue("the half-written entry is removed", downloads.rows.isEmpty());
        assertFalse(HookStatus.missing(FamilyNames.SAVE_DOWNLOADS).isEmpty());
    }

    @Test public void pausingAnEarlyStartOrAnUnreadableSwitchCopiesNothing() throws IOException {
        Settings.SAVE_DOWNLOADS.save(true);
        File file = downloaded("2_51.pdf", "pdf");
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            SaveDownloads.fileLoaded(0, "2_51.pdf", file, pdf());
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> SaveDownloads.fileLoaded(0, "2_51.pdf", file, pdf()));
        SettingReadsForTests.breakReads(Settings.SAVE_DOWNLOADS);
        SaveDownloads.fileLoaded(0, "2_51.pdf", file, pdf());
        assertTrue(downloads.rows.isEmpty());
        assertFalse(HookStatus.missing(FamilyNames.SAVE_DOWNLOADS).isEmpty());
    }

    @Test public void theNameIsTheDocumentsOwnWithAnExtension() {
        assertEquals("report.pdf", SaveDownloads.displayName("report.pdf", "2_51.pdf"));
        // A song sent without a file name, or a name without an extension, takes the download's.
        assertEquals("2_51.mp3", SaveDownloads.displayName("", "2_51.mp3"));
        assertEquals("2_51.mp3", SaveDownloads.displayName(null, "2_51.mp3"));
        assertEquals("notes.txt", SaveDownloads.displayName("notes", "2_51.txt"));
        assertEquals("notes", SaveDownloads.displayName("notes", "2_51"));
        // A name can't reach outside the folder.
        assertEquals("_.._etc_passwd.txt", SaveDownloads.displayName("/../etc/passwd.txt", "2_51.txt"));
        assertEquals("2_51.txt", SaveDownloads.displayName("..", "2_51.txt"));
        assertEquals("2_51.txt", SaveDownloads.displayName("  ", "2_51.txt"));
        // A right-to-left override (U+202E) in "report<RLO>exe.pdf" would show it as "reportfdp.exe" in a file manager.
        assertEquals("report_exe.pdf", SaveDownloads.displayName("report\u202eexe.pdf", "2_51.pdf"));
        assertEquals("a_b_c.txt", SaveDownloads.displayName("a\u2066b\u2069c.txt", "2_51.txt"));
        // Marks that don't reorder text, like the zero-width joiner in an emoji sequence, stay.
        String coder = "\uD83D\uDC68\u200D\uD83D\uDCBB.pdf";
        assertEquals(coder, SaveDownloads.displayName(coder, "2_51.pdf"));
    }

    @Test public void aNameTooLongForTheFileSystemLosesTheEndOfItsStemAndKeepsItsExtension() {
        String stem = new String(new char[300]).replace('\0', 'x');
        String name = SaveDownloads.displayName(stem + ".pdf", "2_51.pdf");
        assertEquals(SaveDownloads.MAX_NAME_BYTES, name.getBytes(StandardCharsets.UTF_8).length);
        assertTrue(name, name.endsWith(".pdf"));
        assertEquals(SaveDownloads.MAX_NAME_BYTES, SaveDownloads.displayName(stem, "2_51").getBytes(StandardCharsets.UTF_8).length);
        // Cut by code points, so a four-byte emoji at the edge isn't halved into two broken characters.
        StringBuilder faces = new StringBuilder();
        for (int i = 0; i < 100; i++) faces.append("😀");
        String cut = SaveDownloads.displayName(faces + ".mp3", "2_51.mp3");
        assertTrue(cut, cut.getBytes(StandardCharsets.UTF_8).length <= SaveDownloads.MAX_NAME_BYTES);
        assertTrue(cut, cut.endsWith(".mp3"));
        assertEquals((SaveDownloads.MAX_NAME_BYTES - 4) / 4 * 2 + 4, cut.length());
        // A name that's all extension has nothing left to cut, so the download's own name is used.
        assertEquals("2_51.pdf", SaveDownloads.displayName("." + stem, "2_51.pdf"));
    }

    /** MediaStore's Downloads table, as much of it as a copy touches. */
    public static final class Downloads extends ContentProvider {
        final Map<Long, ContentValues> rows = new LinkedHashMap<>();
        long nextId = 1;
        int pendingInserts;

        Uri uriFor(long id) {
            return ContentUris.withAppendedId(MediaStore.Downloads.EXTERNAL_CONTENT_URI, id);
        }

        ContentValues row(long id) {
            ContentValues row = rows.get(id);
            assertNotNull("no Downloads entry " + id, row);
            return row;
        }

        @Override public boolean onCreate() {
            return true;
        }

        @Override public Uri insert(Uri uri, ContentValues values) {
            ContentValues row = new ContentValues(values);
            row.put(MediaStore.MediaColumns.DATE_ADDED, System.currentTimeMillis() / 1000);
            if (Integer.valueOf(1).equals(row.getAsInteger(MediaStore.MediaColumns.IS_PENDING))) pendingInserts++;
            // MediaStore keeps names in a folder unique by numbering the newcomer.
            String name = row.getAsString(MediaStore.MediaColumns.DISPLAY_NAME);
            for (ContentValues other : rows.values()) {
                if (name.equals(other.getAsString(MediaStore.MediaColumns.DISPLAY_NAME))) {
                    row.put(MediaStore.MediaColumns.DISPLAY_NAME, name.replace(".pdf", " (1).pdf"));
                }
            }
            long id = nextId++;
            rows.put(id, row);
            return uriFor(id);
        }

        /** One entry by its own address, or the entries a version without the list could have made. */
        @Override public Cursor query(Uri uri, String[] projection, String selection,
                String[] selectionArgs, String sortOrder) {
            MatrixCursor cursor = new MatrixCursor(projection);
            if (selection == null) {
                long id = ContentUris.parseId(uri);
                if (rows.containsKey(id)) cursor.addRow(new Object[]{id});
                return cursor;
            }
            assertEquals("only copies from before the list are found by name and size",
                    SaveDownloads.OLDER_COPY, selection);
            for (Map.Entry<Long, ContentValues> entry : rows.entrySet()) {
                ContentValues row = entry.getValue();
                Long added = row.getAsLong(MediaStore.MediaColumns.DATE_ADDED);
                if (selectionArgs[0].equals(row.getAsString(MediaStore.MediaColumns.DISPLAY_NAME))
                        && selectionArgs[1].equals(row.getAsString(MediaStore.MediaColumns.RELATIVE_PATH))
                        && selectionArgs[2].equals(String.valueOf(row.getAsLong(MediaStore.MediaColumns.SIZE)))
                        && added != null && added < Long.parseLong(selectionArgs[3])) {
                    cursor.addRow(new Object[]{entry.getKey()});
                }
            }
            return cursor;
        }

        @Override public int update(Uri uri, ContentValues values, String selection, String[] selectionArgs) {
            ContentValues row = rows.get(ContentUris.parseId(uri));
            if (row == null) return 0;
            row.putAll(values);
            return 1;
        }

        @Override public int delete(Uri uri, String selection, String[] selectionArgs) {
            return rows.remove(ContentUris.parseId(uri)) == null ? 0 : 1;
        }

        @Override public String getType(Uri uri) {
            return "application/octet-stream";
        }
    }
}
