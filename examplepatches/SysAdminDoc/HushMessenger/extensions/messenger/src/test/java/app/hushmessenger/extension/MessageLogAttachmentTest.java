package app.hushmessenger.extension;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.res.AssetFileDescriptor;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.os.ParcelFileDescriptor;
import com.facebook.messaging.model.attachment.Attachment;
import com.facebook.messaging.model.attachment.AttachmentImageMap;
import com.facebook.messaging.model.attachment.AudioData;
import com.facebook.messaging.model.attachment.ImageData;
import com.facebook.messaging.model.attachment.ImageUrl;
import com.facebook.messaging.model.attachment.VideoData;
import com.facebook.messaging.model.messages.Message;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

/** Keeping a message's own media: finding its address, fetching it, and pointing the entry at the file. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class MessageLogAttachmentTest {
    private static final String ADDRESS = "https://cdn.example.com/audio.mp4?oe=6A1B2C3D";
    private static final String SMALL = "https://cdn.example.com/photo-s.jpg?oe=6A1B2C3D";
    private static final String BIG = "https://cdn.example.com/photo-l.jpg?oe=6A1B2C3D";
    /** A video's own address and the thumbnail Messenger sends beside it, which look alike on the message. */
    private static final String MOVIE = "https://cdn.example.com/video.mp4?oe=6A1B2C3D";
    private static final String THUMB = "https://cdn.example.com/video-thumb.jpg?oe=6A1B2C3D";
    private static final String THREAD = "thread-7";
    private static final String ID = "mid.100";
    /** Stands in for the fetch, so no test reaches a network. */
    private static final byte[] CLIP = "ftypM4A clip bytes".getBytes(StandardCharsets.UTF_8);

    /** The message, preview and file tokens in an encrypted chat's in-app address, the order Messenger writes them in. */
    private static final String PK = "4096";
    private static final String PREVIEW_TOKEN = "preview-token";
    private static final String FILE_TOKEN = "file-token";
    private static final String QUERY = "content_type=1&is_decouple_tam=true";
    private static final byte[] PREVIEW_JPEG = bytesOf(0xFF, 0xD8, 0xFF, 0xE0, 'p', 'r', 'e', 'v');
    private static final byte[] FULL_JPEG = bytesOf(0xFF, 0xD8, 0xFF, 0xE1, 'f', 'u', 'l', 'l', 's', 'i', 'z', 'e');

    private java.util.function.Function<String, byte[]> download;
    private java.util.function.ToLongFunction<String> measure;
    private java.util.function.Function<String, byte[]> openInApp;
    private java.util.function.LongConsumer retryLater;
    private final List<String> asked = new java.util.ArrayList<>();
    private final List<String> measured = new java.util.ArrayList<>();

    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        CrashGuard.resetForTests();
        CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
        retryLater = MessageLog.retryLater;
        MessageLog.retryLater = delay -> { };
        MessageLog.retry();
        MessageLog.forgetCaptures();
        Settings.hookErrors.clear();
        MessageLog.vault = new MessageLogTest.SoftwareVault();
        logFile().delete();
        MessageLogMedia.deleteAll(Settings.appContext);
        download = MessageLogAttachment.download;
        measure = MessageLogAttachment.measure;
        openInApp = MessageLogAttachment.openInApp;
        TamServer.files.clear();
        TamServer.opened.clear();
        Robolectric.setupContentProvider(TamServer.class, Settings.appContext.getPackageName() + ".tam-attachment");
        asked.clear();
        measured.clear();
        MessageLogAttachment.download = address -> {
            asked.add(address);
            return CLIP;
        };
        // What the server says about a video and its thumbnail, which is how the two are told apart.
        MessageLogAttachment.measure = address -> {
            measured.add(address);
            return MOVIE.equals(address) ? 2_000_000 : THUMB.equals(address) ? 40_000 : -1;
        };
        Settings.preferences.edit().putBoolean(MessageLog.KEY, true).putBoolean(MessageLog.KEEP_VOICE, true)
            .putBoolean(MessageLog.KEEP_PHOTOS, true).putBoolean(MessageLog.KEEP_VIDEOS, true).commit();
    }

    @After public void tidy() {
        MessageLogAttachment.download = download;
        MessageLogAttachment.measure = measure;
        MessageLogAttachment.openInApp = openInApp;
        TamServer.files.clear();
        TamServer.opened.clear();
        MessageLog.retryLater = retryLater;
        logFile().delete();
        MessageLogMedia.deleteAll(Settings.appContext);
        MessageLog.vault = null;
    }

    private File logFile() {
        return new File(Settings.appContext.getFilesDir(), MessageLog.FILE);
    }

    private static Message voiceMessage() {
        return Message.with(Attachment.audio(new AudioData(Uri.parse(ADDRESS))));
    }

    private static Message photoMessage() {
        return Message.with(Attachment.image(ImageData.of(
            AttachmentImageMap.of(new ImageUrl(240, 180, SMALL)),
            AttachmentImageMap.of(new ImageUrl(1440, 1920, BIG), new ImageUrl(480, 640, SMALL)))));
    }

    private static Message videoMessage() {
        return Message.with(Attachment.video(new VideoData(Uri.parse(MOVIE), Uri.parse(THUMB))));
    }

    private static MessageLogAttachment.Found audio() {
        return new MessageLogAttachment.Found(ADDRESS, MessageLogAttachment.AUDIO);
    }

    private static MessageLogAttachment.Found photo() {
        return new MessageLogAttachment.Found(BIG, MessageLogAttachment.PHOTO);
    }

    private static MessageLogAttachment.Found video() {
        return new MessageLogAttachment.Found(new String[] {MOVIE, THUMB}, MessageLogAttachment.VIDEO);
    }

    private static String nameOf(String kind) {
        return MessageLogAttachment.name(THREAD, ID, kind);
    }

    @Test public void theAddressIsFoundThroughTheAttachmentsOwnTypes() {
        MessageLogAttachment.Found found = MessageLogAttachment.found(voiceMessage());
        assertEquals(ADDRESS, found.address());
        assertEquals(MessageLogAttachment.AUDIO, found.kind);
    }

    /** Messenger offers the same photo at several sizes, and only the biggest is worth keeping. */
    @Test public void aPhotosBiggestAddressIsTheOneFound() {
        MessageLogAttachment.Found found = MessageLogAttachment.found(photoMessage());
        assertEquals(BIG, found.address());
        assertEquals(MessageLogAttachment.PHOTO, found.kind);
    }

    /** A photo with no size against any address still gets kept, from the first address that's the message's own. */
    @Test public void aPhotoWithNoSizesStillHasAnAddress() {
        Message message = Message.with(Attachment.image(ImageData.of(null,
            AttachmentImageMap.of(new ImageUrl(0, 0, BIG)))));
        assertEquals(BIG, MessageLogAttachment.found(message).address());
    }

    /**
     * A video arrives with its own address and its thumbnail's, both the same type and neither marked, so both are
     * carried off Messenger's thread and nothing is asked over the network while the message is being logged.
     */
    @Test public void bothOfAVideosAddressesAreCarried() {
        MessageLogAttachment.Found found = MessageLogAttachment.found(videoMessage());
        assertEquals(MessageLogAttachment.VIDEO, found.kind);
        assertArrayEquals(new String[] {MOVIE, THUMB}, found.addresses);
        assertEquals(List.of(), measured);
        assertEquals(List.of(), asked);
    }

    @Test public void anotherKindOfAttachmentHasNoAddressToFind() {
        assertNull(MessageLogAttachment.found(Message.with(Attachment.video(new VideoData(null)))));
        assertNull(MessageLogAttachment.found(Message.with()));
        assertNull(MessageLogAttachment.found(Message.with(Attachment.audio(new AudioData(null)))));
        assertNull(MessageLogAttachment.found(Message.with(Attachment.image(ImageData.of(null, null)))));
        assertNull(MessageLogAttachment.found(new Object()));
        assertNull(MessageLogAttachment.found(null));
    }

    /** Only the signed address the message came with. A file already on the phone is Messenger's to hand out, not ours. */
    @Test public void anAddressThatIsntTheMessagesOwnIsLeftAlone() {
        for (String address : new String[] {"file:///data/data/com.facebook.orca/clip.mp4", "content://media/external/audio/1",
            "http://cdn.example.com/audio.mp4", "content://com.example.other.tam-attachment/4096/a/b"}) {
            assertNull(address, MessageLogAttachment.found(Message.with(Attachment.audio(new AudioData(Uri.parse(address))))));
            assertNull(address, MessageLogAttachment.found(Message.with(Attachment.image(ImageData.of(null,
                AttachmentImageMap.of(new ImageUrl(1440, 1920, address)))))));
        }
    }

    @Test public void nothingIsReadWithTheSwitchesOff() {
        Settings.preferences.edit().putBoolean(MessageLog.KEEP_VOICE, false).commit();
        assertNull(MessageLogAttachment.found(voiceMessage()));
        assertEquals(BIG, MessageLogAttachment.found(photoMessage()).address());
        Settings.preferences.edit().putBoolean(MessageLog.KEEP_VIDEOS, false).commit();
        assertNull(MessageLogAttachment.found(videoMessage()));
        Settings.preferences.edit().putBoolean(MessageLog.KEEP_PHOTOS, false).commit();
        assertNull(MessageLogAttachment.found(photoMessage()));
        Settings.preferences.edit().putBoolean(MessageLog.KEEP_VOICE, true).putBoolean(MessageLog.KEY, false).commit();
        assertNull(MessageLogAttachment.found(voiceMessage()));
        Settings.preferences.edit().putBoolean(MessageLog.KEY, true).putBoolean("paused", true).commit();
        assertNull(MessageLogAttachment.found(voiceMessage()));
    }

    /** The hook hands the message over before its text, and what it found waits there for the log's own call. */
    @Test public void theHookHandsTheAddressOverWithTheMessage() {
        Settings.incomingMessageMedia(voiceMessage());
        assertEquals(ADDRESS, Settings.takeIncomingMessageMedia().address());
        assertNull(Settings.takeIncomingMessageMedia());
        Settings.incomingMessageMedia(voiceMessage());
        Settings.incomingMessageMedia(Message.with());
        assertNull("a message with no media clears what the one before it left", Settings.takeIncomingMessageMedia());
    }

    /** The message stored, then its clip fetched and sealed where the log's screen plays it from. */
    @Test public void aClipIsKeptWithItsMessage() throws Exception {
        MessageLog.storeNow(null, THREAD, ID);
        assertEquals(nameOf(MessageLogAttachment.AUDIO), MessageLogAttachment.keepNow(THREAD, ID, audio()));
        assertEquals(List.of(ADDRESS), asked);
        List<MessageLog.Entry> entries = MessageLog.entries();
        assertEquals(1, entries.size());
        MessageLog.Entry kept = entries.get(0);
        assertTrue(kept.attachment);
        assertEquals(MessageLogAttachment.AUDIO, kept.mediaType);
        assertEquals(nameOf(MessageLogAttachment.AUDIO), kept.media);
        assertArrayEquals(CLIP, MessageLogMedia.open(Settings.appContext, kept.media));
        assertTrue(Settings.hookErrors.isEmpty());
    }

    /** A photo takes the name the notification's own preview would have, so the entry only ever has one picture. */
    @Test public void aPhotoIsKeptUnderThePicturesOwnName() throws Exception {
        MessageLog.storeNow(null, THREAD, ID);
        assertEquals(MessageLog.digest(THREAD + '\u0000' + ID), nameOf(MessageLogAttachment.PHOTO));
        assertEquals(nameOf(MessageLogAttachment.PHOTO), MessageLogAttachment.keepNow(THREAD, ID, photo()));
        assertEquals(List.of(BIG), asked);
        MessageLog.Entry kept = MessageLog.entries().get(0);
        assertEquals("", kept.mediaType);
        assertEquals(nameOf(MessageLogAttachment.PHOTO), kept.media);
        assertArrayEquals(CLIP, MessageLogMedia.open(Settings.appContext, kept.media));
    }

    /** The video, not the thumbnail beside it: the server says how big each is, and a thumbnail is a fraction of its video. */
    @Test public void theBiggerOfAVideosAddressesIsTheOneKept() throws Exception {
        MessageLog.storeNow(null, THREAD, ID);
        assertEquals(nameOf(MessageLogAttachment.VIDEO), MessageLogAttachment.keepNow(THREAD, ID, video()));
        assertEquals(List.of(MOVIE, THUMB), measured);
        assertEquals(List.of(MOVIE), asked);
        MessageLog.Entry kept = MessageLog.entries().get(0);
        assertEquals(MessageLogAttachment.VIDEO, kept.mediaType);
        assertEquals(nameOf(MessageLogAttachment.VIDEO), kept.media);
        assertArrayEquals(CLIP, MessageLogMedia.open(Settings.appContext, kept.media));
        assertNotEquals(nameOf(MessageLogAttachment.PHOTO), kept.media);
        assertTrue(Settings.hookErrors.isEmpty());
    }

    /** Some servers won't answer how big a file is, and then the only way left to tell the two apart is to fetch both. */
    @Test public void bothAreFetchedWhenNothingSaysHowBigTheyAre() throws Exception {
        byte[] movie = new byte[4096];
        MessageLogAttachment.measure = address -> {
            measured.add(address);
            return -1;
        };
        MessageLogAttachment.download = address -> {
            asked.add(address);
            return MOVIE.equals(address) ? movie : CLIP;
        };
        MessageLog.storeNow(null, THREAD, ID);
        assertEquals(nameOf(MessageLogAttachment.VIDEO), MessageLogAttachment.keepNow(THREAD, ID, video()));
        assertEquals(List.of(MOVIE, THUMB), asked);
        assertArrayEquals(movie, MessageLogMedia.open(Settings.appContext, MessageLog.entries().get(0).media));
    }

    /** A video is the largest thing the log keeps, and one past that size leaves its message logged without it. */
    @Test public void aVideoPastItsSizeIsntKept() {
        MessageLogAttachment.download = address -> new byte[MessageLogAttachment.MAX_VIDEO_BYTES + 1];
        MessageLog.storeNow(null, THREAD, ID);
        assertEquals("", MessageLogAttachment.keepNow(THREAD, ID, video()));
        assertTrue(MessageLog.entries().get(0).media.isEmpty());
        assertEquals(MessageLogAttachment.MAX_VIDEO_BYTES, MessageLogMedia.MAX_ANY_BYTES);
        assertTrue(MessageLogAttachment.MAX_VIDEO_BYTES > MessageLogAttachment.MAX_PHOTO_BYTES);
    }

    /** The clip can land while the message is still waiting to be written, and then the one write carries both. */
    @Test public void aClipThatArrivesBeforeTheWriteGoesInWithIt() throws Exception {
        MessageLog.queue(null, THREAD, ID);
        assertEquals(nameOf(MessageLogAttachment.AUDIO), MessageLogAttachment.keepNow(THREAD, ID, audio()));
        MessageLog.drain();
        List<MessageLog.Entry> entries = MessageLog.entries();
        assertEquals(1, entries.size());
        assertEquals(MessageLogAttachment.AUDIO, entries.get(0).mediaType);
        assertArrayEquals(CLIP, MessageLogMedia.open(Settings.appContext, entries.get(0).media));
    }

    /** Messenger builds one message's notification twice, and the second fetch is the one that isn't needed. */
    @Test public void theSameClipIsFetchedOnce() {
        assertEquals(nameOf(MessageLogAttachment.AUDIO), MessageLogAttachment.keepNow(THREAD, ID, audio()));
        assertEquals(nameOf(MessageLogAttachment.AUDIO), MessageLogAttachment.keepNow(THREAD, ID, audio()));
        assertEquals(List.of(ADDRESS), asked);
    }

    @Test public void aMessageStaysLoggedWhenItsMediaCantBeFetched() {
        MessageLogAttachment.download = address -> {
            asked.add(address);
            return null;
        };
        MessageLog.storeNow(null, THREAD, ID);
        assertEquals("", MessageLogAttachment.keepNow(THREAD, ID, audio()));
        List<MessageLog.Entry> entries = MessageLog.entries();
        assertEquals(1, entries.size());
        assertTrue(entries.get(0).media.isEmpty());
        assertEquals("", entries.get(0).mediaType);
        assertFalse(new File(Settings.appContext.getFilesDir(), MessageLogMedia.DIR).isDirectory());
    }

    /** A file past the kind's own size isn't kept, so one huge photo can't push the rest of the log out. */
    @Test public void mediaPastItsSizeIsntKept() {
        MessageLogAttachment.download = address -> new byte[MessageLogAttachment.MAX_AUDIO_BYTES + 1];
        MessageLog.storeNow(null, THREAD, ID);
        assertEquals("", MessageLogAttachment.keepNow(THREAD, ID, audio()));
        assertTrue(MessageLog.entries().get(0).media.isEmpty());
        assertTrue(MessageLogAttachment.MAX_PHOTO_BYTES > MessageLogAttachment.MAX_AUDIO_BYTES);
    }

    /** A picture off the notification is what the log already had for this message, so it keeps it. */
    @Test public void aPictureAlreadyKeptIsntReplaced() throws Exception {
        MessageLog.storeNow(null, THREAD, ID);
        String picture = MessageLog.digest(THREAD + '\u0000' + ID);
        File dir = new File(Settings.appContext.getFilesDir(), MessageLogMedia.DIR);
        dir.mkdirs();
        MessageLog.sealInto(dir, picture, "a picture".getBytes(StandardCharsets.UTF_8));
        assertTrue(MessageLog.attachNow(THREAD, ID, picture, ""));
        assertFalse(MessageLog.attachNow(THREAD, ID, nameOf(MessageLogAttachment.AUDIO), MessageLogAttachment.AUDIO));
        List<MessageLog.Entry> entries = MessageLog.entries();
        assertEquals(picture, entries.get(0).media);
        assertEquals("", entries.get(0).mediaType);
    }

    /** A clip whose message isn't in the log has nothing to belong to, and the next write drops the file. */
    @Test public void aClipWithNoMessageIsntKept() {
        assertFalse(MessageLog.attachNow(THREAD, ID, nameOf(MessageLogAttachment.AUDIO), MessageLogAttachment.AUDIO));
    }

    /** The kind is a column of its own, and a log written before it still reads the way it did. */
    @Test public void theKindSurvivesAWriteAndAnOlderLogStillReads() throws Exception {
        MessageLog.write(Settings.appContext, List.of(
            new MessageLog.Entry(1_700_000_000_000L, THREAD, "", "Ana", "", ID, false, true, "a".repeat(64), MessageLogAttachment.AUDIO),
            new MessageLog.Entry(1_700_000_001_000L, THREAD, "", "Ana", "", "mid.101", false, true, "b".repeat(64)),
            new MessageLog.Entry(1_700_000_002_000L, THREAD, "", "Ana", "", "mid.102", false, true, "c".repeat(64), MessageLogAttachment.VIDEO)));
        List<MessageLog.Entry> back = MessageLog.read(logFile());
        assertEquals(3, back.size());
        assertEquals(MessageLogAttachment.AUDIO, back.get(0).mediaType);
        assertEquals("a".repeat(64), back.get(0).media);
        assertEquals("", back.get(1).mediaType);
        assertEquals("b".repeat(64), back.get(1).media);
        assertEquals(MessageLogAttachment.VIDEO, back.get(2).mediaType);
        assertEquals("c".repeat(64), back.get(2).media);
    }

    /** A kind the log doesn't know reads as a picture, which is what every entry before this was. */
    @Test public void anUnknownKindReadsAsAPicture() throws Exception {
        MessageLog.sealInto(Settings.appContext.getFilesDir(), MessageLog.FILE,
            ("1700000000000\t" + THREAD + "\t\tAna\t\t" + ID + "\t\t" + "a".repeat(64) + "\tsomething\n").getBytes(StandardCharsets.UTF_8));
        List<MessageLog.Entry> back = MessageLog.read(logFile());
        assertEquals(1, back.size());
        assertEquals("", back.get(0).mediaType);
    }

    /** An unsend marks the clip's message like any other, and the clip stays with it. */
    @Test public void anUnsentVoiceMessageKeepsItsClip() {
        MessageLog.storeNow(null, THREAD, ID);
        assertEquals(nameOf(MessageLogAttachment.AUDIO), MessageLogAttachment.keepNow(THREAD, ID, audio()));
        assertTrue(MessageLog.markNow(ID, THREAD, ""));
        MessageLog.Entry marked = MessageLog.entries().get(0);
        assertTrue(marked.unsent);
        assertEquals(MessageLogAttachment.AUDIO, marked.mediaType);
        assertEquals(nameOf(MessageLogAttachment.AUDIO), marked.media);
    }

    /** Clear takes the files with the messages, and Undo puts both back. */
    @Test public void clearAndUndoTakeTheClipAlong() throws Exception {
        MessageLog.storeNow(null, THREAD, ID);
        assertEquals(nameOf(MessageLogAttachment.AUDIO), MessageLogAttachment.keepNow(THREAD, ID, audio()));
        MessageLog.Cleared cleared = MessageLog.clearForUndo();
        assertTrue(cleared.cleared);
        assertTrue(MessageLog.entries().isEmpty());
        assertTrue(MessageLog.restore(cleared));
        MessageLog.Entry back = MessageLog.entries().get(0);
        assertEquals(MessageLogAttachment.AUDIO, back.mediaType);
        assertArrayEquals(CLIP, MessageLogMedia.open(Settings.appContext, back.media));
    }

    private static byte[] bytesOf(int... values) {
        byte[] bytes = new byte[values.length];
        for (int i = 0; i < values.length; i++) bytes[i] = (byte) values[i];
        return bytes;
    }

    /** An MP4's opening box, then one track handler of [handler]'s kind, with its tag eight bytes before the kind. */
    private static byte[] mp4(String... handlers) {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        appendTo(out, bytesOf(0, 0, 0, 16, 'f', 't', 'y', 'p', 'i', 's', 'o', 'm', 0, 0, 2, 0));
        for (String handler : handlers) {
            appendTo(out, bytesOf(0, 0, 0, 33, 'h', 'd', 'l', 'r', 0, 0, 0, 0, 0, 0, 0, 0));
            appendTo(out, handler.getBytes(StandardCharsets.US_ASCII));
            appendTo(out, new byte[13]);
        }
        return out.toByteArray();
    }

    private static void appendTo(ByteArrayOutputStream out, byte[] bytes) {
        out.write(bytes, 0, bytes.length);
    }

    /** Where Messenger puts an encrypted chat's picture: inside the app, the message's token, the preview's, the file's. */
    private static String inAppAddress() {
        return "content://" + Settings.appContext.getPackageName() + ".tam-attachment/" + PK + "/" + PREVIEW_TOKEN + "/"
            + FILE_TOKEN + "?" + QUERY;
    }

    /** The same address with the file's own token alone, which is the one asked first. */
    private static String fileItselfAddress() {
        return "content://" + Settings.appContext.getPackageName() + ".tam-attachment/" + PK + "/" + FILE_TOKEN + "?" + QUERY;
    }

    /** An encrypted chat's photo or video as its notification has it: the in-app address at every size, with no sizes. */
    private static Message encryptedMessage() {
        String address = inAppAddress();
        return Message.with(Attachment.image(ImageData.of(AttachmentImageMap.of(new ImageUrl(0, 0, address)),
            AttachmentImageMap.of(new ImageUrl(0, 0, address), new ImageUrl(0, 0, address)))));
    }

    /**
     * An encrypted chat's picture has no server address, only one inside the app, and it's carried with no kind, since
     * only the file says whether it's the photo or a video behind its preview. Nothing is read on Messenger's thread.
     */
    @Test public void anEncryptedChatsPictureIsFoundAtItsInAppAddress() {
        MessageLogAttachment.Found found = MessageLogAttachment.found(encryptedMessage());
        assertNotNull(found);
        assertNull(found.kind);
        assertArrayEquals(new String[] {fileItselfAddress(), inAppAddress()}, found.addresses);
        assertEquals(List.of(), TamServer.opened);
    }

    /** The file itself, not the preview Messenger's address names first, read through Messenger's own server. */
    @Test public void anEncryptedChatsPhotoIsKeptAtFullSize() throws Exception {
        TamServer.files.put(PREVIEW_TOKEN, PREVIEW_JPEG);
        TamServer.files.put(FILE_TOKEN, FULL_JPEG);
        MessageLog.storeNow(null, THREAD, ID);
        assertEquals(nameOf(MessageLogAttachment.PHOTO),
            MessageLogAttachment.keepNow(THREAD, ID, MessageLogAttachment.found(encryptedMessage())));
        assertEquals(List.of(fileItselfAddress()), TamServer.opened);
        MessageLog.Entry kept = MessageLog.entries().get(0);
        assertEquals("", kept.mediaType);
        assertArrayEquals(FULL_JPEG, MessageLogMedia.open(Settings.appContext, kept.media));
        assertEquals(List.of(), asked);
        assertTrue(Settings.hookErrors.isEmpty());
    }

    /** A video arrives behind its preview picture's address, and the file read says it's a video, so it plays as one. */
    @Test public void anEncryptedChatsVideoIsKeptAsAVideo() throws Exception {
        byte[] movie = mp4("soun", "vide");
        TamServer.files.put(PREVIEW_TOKEN, PREVIEW_JPEG);
        TamServer.files.put(FILE_TOKEN, movie);
        MessageLog.storeNow(null, THREAD, ID);
        assertEquals(nameOf(MessageLogAttachment.VIDEO),
            MessageLogAttachment.keepNow(THREAD, ID, MessageLogAttachment.found(encryptedMessage())));
        MessageLog.Entry kept = MessageLog.entries().get(0);
        assertEquals(MessageLogAttachment.VIDEO, kept.mediaType);
        assertArrayEquals(movie, MessageLogMedia.open(Settings.appContext, kept.media));
    }

    /** When the file itself can't be had, the address as it came still answers with the preview, and that's kept. */
    @Test public void thePreviewIsKeptWhenTheFileItselfCantBeHad() throws Exception {
        TamServer.files.put(PREVIEW_TOKEN, PREVIEW_JPEG);
        MessageLog.storeNow(null, THREAD, ID);
        assertEquals(nameOf(MessageLogAttachment.PHOTO),
            MessageLogAttachment.keepNow(THREAD, ID, MessageLogAttachment.found(encryptedMessage())));
        assertEquals(List.of(fileItselfAddress(), inAppAddress()), TamServer.opened);
        assertArrayEquals(PREVIEW_JPEG, MessageLogMedia.open(Settings.appContext, MessageLog.entries().get(0).media));
    }

    /** A video in an encrypted chat is kept on the video switch alone, and a photo there waits on the photo switch. */
    @Test public void anEncryptedChatsMediaWaitsOnItsOwnSwitch() throws Exception {
        Settings.preferences.edit().putBoolean(MessageLog.KEEP_PHOTOS, false).commit();
        TamServer.files.put(FILE_TOKEN, FULL_JPEG);
        MessageLog.storeNow(null, THREAD, ID);
        MessageLogAttachment.Found found = MessageLogAttachment.found(encryptedMessage());
        assertNotNull(found);
        assertEquals("", MessageLogAttachment.keepNow(THREAD, ID, found));
        TamServer.files.put(FILE_TOKEN, mp4("vide"));
        assertEquals(nameOf(MessageLogAttachment.VIDEO), MessageLogAttachment.keepNow(THREAD, ID, found));
        Settings.preferences.edit().putBoolean(MessageLog.KEEP_VIDEOS, false).commit();
        assertNull(MessageLogAttachment.found(encryptedMessage()));
    }

    /** Pictures, videos and voice by their opening bytes, and anything else not kept at all. */
    @Test public void theFileSaysWhatItIs() {
        assertEquals(MessageLogAttachment.PHOTO, MessageLogAttachment.kindOf(FULL_JPEG));
        assertEquals(MessageLogAttachment.PHOTO, MessageLogAttachment.kindOf(bytesOf(0x89, 'P', 'N', 'G', 0x0D, 0x0A)));
        assertEquals(MessageLogAttachment.PHOTO, MessageLogAttachment.kindOf(bytesOf('G', 'I', 'F', '8', '9', 'a')));
        assertEquals(MessageLogAttachment.PHOTO,
            MessageLogAttachment.kindOf(bytesOf('R', 'I', 'F', 'F', 0, 0, 0, 0, 'W', 'E', 'B', 'P')));
        assertEquals(MessageLogAttachment.PHOTO,
            MessageLogAttachment.kindOf(bytesOf(0, 0, 0, 24, 'f', 't', 'y', 'p', 'h', 'e', 'i', 'c')));
        assertEquals(MessageLogAttachment.VIDEO, MessageLogAttachment.kindOf(mp4("vide", "soun")));
        assertEquals(MessageLogAttachment.VIDEO, MessageLogAttachment.kindOf(mp4()));
        assertEquals(MessageLogAttachment.AUDIO, MessageLogAttachment.kindOf(mp4("soun")));
        assertEquals(MessageLogAttachment.VIDEO, MessageLogAttachment.kindOf(bytesOf(0x1A, 0x45, 0xDF, 0xA3, 0x9F)));
        assertEquals(MessageLogAttachment.AUDIO, MessageLogAttachment.kindOf(bytesOf('O', 'g', 'g', 'S', 0)));
        assertNull(MessageLogAttachment.kindOf("just some text".getBytes(StandardCharsets.UTF_8)));
        assertNull(MessageLogAttachment.kindOf(new byte[0]));
    }

    /**
     * Messenger's own server for an encrypted chat's media: it answers a typed open with the first of the address's
     * tokens it holds a file for, and refuses a plain open, the way Messenger's does.
     */
    public static class TamServer extends ContentProvider {
        static final Map<String, byte[]> files = new HashMap<>();
        static final List<String> opened = new java.util.ArrayList<>();

        @Override public boolean onCreate() { return true; }

        @Override public AssetFileDescriptor openTypedAssetFile(Uri uri, String mimeTypeFilter, Bundle opts)
                throws FileNotFoundException {
            opened.add(uri.toString());
            List<String> path = uri.getPathSegments();
            for (int i = 1; i < path.size(); i++) {
                byte[] bytes = files.get(path.get(i));
                if (bytes == null) continue;
                File file = new File(getContext().getCacheDir(), "tam-" + path.get(i));
                try {
                    Files.write(file.toPath(), bytes);
                } catch (IOException unwritable) {
                    throw new FileNotFoundException(unwritable.toString());
                }
                return new AssetFileDescriptor(ParcelFileDescriptor.open(file, ParcelFileDescriptor.MODE_READ_ONLY), 0,
                    AssetFileDescriptor.UNKNOWN_LENGTH);
            }
            throw new FileNotFoundException("Can't locate file when resolving content token");
        }

        @Override public ParcelFileDescriptor openFile(Uri uri, String mode) throws FileNotFoundException {
            throw new FileNotFoundException("No files supported by provider");
        }

        @Override public AssetFileDescriptor openAssetFile(Uri uri, String mode) throws FileNotFoundException {
            throw new FileNotFoundException("No files supported by provider");
        }

        @Override public String getType(Uri uri) { return null; }
        @Override public Cursor query(Uri uri, String[] columns, String selection, String[] arguments, String order) { return null; }
        @Override public Uri insert(Uri uri, ContentValues values) { return null; }
        @Override public int delete(Uri uri, String selection, String[] arguments) { return 0; }
        @Override public int update(Uri uri, ContentValues values, String selection, String[] arguments) { return 0; }
    }
}
