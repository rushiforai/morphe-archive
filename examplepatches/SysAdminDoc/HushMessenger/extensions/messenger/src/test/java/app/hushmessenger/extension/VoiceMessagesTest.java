package app.hushmessenger.extension;

import android.content.ContentValues;
import android.content.Context;
import android.net.Uri;
import android.provider.MediaStore;
import android.webkit.MimeTypeMap;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.Executor;
import java.util.concurrent.RejectedExecutionException;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowContentResolver;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class VoiceMessagesTest {
    static final Executor WORKER = VoiceMessages.copies;
    static final VoiceMessages.Library SHARED = VoiceMessages.library;

    @Rule public TemporaryFolder folder = new TemporaryFolder();

    /** What the fake library was asked to add, as "name|mime", and the hashes it already holds. */
    final List<String> added = new ArrayList<>();
    final Set<String> stored = new HashSet<>();
    final List<byte[]> sounds = new ArrayList<>();
    int lookups;

    final VoiceMessages.Library fake = new VoiceMessages.Library() {
        @Override public boolean has(Context context, String hash) {
            lookups++;
            return stored.contains(hash);
        }

        @Override public void add(Context context, String name, String mime, byte[] sound) {
            added.add(name + "|" + mime);
            sounds.add(sound);
        }
    };

    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        Settings.hookErrors.clear();
        CrashGuard.resetForTests();
        VoiceMessages.saved.clear();
        VoiceMessages.copies = Runnable::run;
        VoiceMessages.library = fake;
    }

    @After public void restore() {
        VoiceMessages.copies = WORKER;
        VoiceMessages.library = SHARED;
        VoiceMessages.saved.clear();
    }

    static byte[] bytes(int... values) {
        byte[] out = new byte[values.length];
        for (int i = 0; i < values.length; i++) out[i] = (byte) values[i];
        return out;
    }

    static byte[] ascii(String text) {
        return text.getBytes(StandardCharsets.ISO_8859_1);
    }

    /** A voice message the way Messenger caches it: an MP4 box header, then the sound. */
    static byte[] m4a(String body) {
        return ascii("\0\0\0\u0018ftypM4A \0\0\0\0" + body);
    }

    Uri cached(byte[] sound) throws IOException {
        File file = folder.newFile();
        Files.write(file.toPath(), sound);
        return Uri.fromFile(file);
    }

    void turnOn() {
        Settings.preferences.edit().putBoolean(VoiceMessages.KEY, true).commit();
    }

    @Test public void theFormatComesFromTheFirstBytes() {
        assertEquals(VoiceMessages.Format.M4A, VoiceMessages.Format.of(m4a("")));
        assertEquals(VoiceMessages.Format.OGG, VoiceMessages.Format.of(ascii("OggS\0\u0002")));
        assertEquals(VoiceMessages.Format.AMR, VoiceMessages.Format.of(ascii("#!AMR\n")));
        assertEquals(VoiceMessages.Format.WAV, VoiceMessages.Format.of(ascii("RIFF$\0\0\0WAVEfmt ")));
        assertEquals(VoiceMessages.Format.WEBM, VoiceMessages.Format.of(bytes(0x1A, 0x45, 0xDF, 0xA3, 0x01)));
        assertEquals(VoiceMessages.Format.AAC, VoiceMessages.Format.of(bytes(0xFF, 0xF1, 0x50)));
        assertEquals(VoiceMessages.Format.AAC, VoiceMessages.Format.of(bytes(0xFF, 0xF9, 0x50)));
        assertEquals(VoiceMessages.Format.MP3, VoiceMessages.Format.of(bytes(0xFF, 0xFB, 0x90)));
        assertEquals(VoiceMessages.Format.MP3, VoiceMessages.Format.of(ascii("ID3\u0004")));
        assertEquals("audio/mp4", VoiceMessages.Format.M4A.mime);
        assertEquals("m4a", VoiceMessages.Format.M4A.extension);
        assertNull("A RIFF that isn't WAVE isn't sound", VoiceMessages.Format.of(ascii("RIFF\0\0\0\0AVI LIST")));
        assertNull(VoiceMessages.Format.of(ascii("<html>")));
        assertNull("A bare sync byte is too short to tell", VoiceMessages.Format.of(bytes(0xFF)));
        assertNull(VoiceMessages.Format.of(new byte[0]));
    }

    @Test public void theNameCarriesTheTimeAndTheHashLast() throws Exception {
        String hash = VoiceMessages.hash(m4a("hello"));
        assertTrue(hash.matches("[0-9a-f]{12}"));
        assertEquals(hash, VoiceMessages.hash(m4a("hello")));
        assertNotEquals(hash, VoiceMessages.hash(m4a("hello!")));
        java.util.Calendar when = java.util.Calendar.getInstance();
        when.set(2026, java.util.Calendar.OCTOBER, 30, 14, 5, 33);
        assertEquals("Voice message 2026-10-30 14.05.33 " + hash + ".m4a",
            VoiceMessages.name(hash, VoiceMessages.Format.M4A, when.getTime()));
    }

    @Test @Config(sdk = 36) public void aPlayedVoiceMessageIsSavedOnceAndAReplayAddsNothing() throws Exception {
        turnOn();
        byte[] sound = m4a("first voice message");
        Uri audio = cached(sound);
        VoiceMessages.played(audio);
        assertEquals(1, added.size());
        String hash = VoiceMessages.hash(sound);
        assertTrue(added.get(0), added.get(0).matches("Voice message \\d{4}-\\d\\d-\\d\\d \\d\\d\\.\\d\\d\\.\\d\\d " + hash + "\\.m4a\\|audio/mp4"));
        assertArrayEquals(sound, sounds.get(0));
        VoiceMessages.played(audio);
        VoiceMessages.played(cached(sound));
        assertEquals("The same sound from another cache file is still the same voice message", 1, added.size());
        assertEquals("A replay asks the library nothing", 1, lookups);
        VoiceMessages.played(cached(m4a("second voice message")));
        assertEquals(2, added.size());
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test @Config(sdk = 36) public void aCopySavedBeforeMessengerRestartedIsFoundAndNotAddedAgain() throws Exception {
        turnOn();
        byte[] sound = m4a("kept from yesterday");
        stored.add(VoiceMessages.hash(sound));
        VoiceMessages.played(cached(sound));
        VoiceMessages.played(cached(sound));
        assertTrue(added.isEmpty());
        assertEquals(1, lookups);
    }

    @Test @Config(sdk = 36) public void offPauseSafeModeAndAMissingControlSaveNothing() throws Exception {
        Uri audio = cached(m4a("not mine to keep"));
        for (String state : new String[] {"off", "paused", "safe", "missing"}) {
            Settings.initialize(RuntimeEnvironment.getApplication());
            Settings.preferences.edit().clear().putBoolean(VoiceMessages.KEY, !state.equals("off"))
                .putBoolean("paused", state.equals("paused")).putBoolean("safe_mode", state.equals("safe")).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
            if (state.equals("missing")) Settings.installed = Collections.emptySet();
            VoiceMessages.played(audio);
            assertTrue(state, added.isEmpty());
            assertEquals(state, 0, lookups);
        }
    }

    @Test @Config(sdk = 36) public void onlyAFileAlreadyOnThePhoneIsCopied() throws Exception {
        turnOn();
        VoiceMessages.played(null);
        VoiceMessages.played(Uri.parse("https://cdn.example.com/voice.mp4"));
        assertTrue(added.isEmpty());
        assertEquals(0, lookups);
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test @Config(sdk = 36) public void aFileClearedBeforeTheCopyOrNotSoundIsSkippedQuietly() throws Exception {
        turnOn();
        File gone = folder.newFile();
        Uri audio = Uri.fromFile(gone);
        assertTrue(gone.delete());
        VoiceMessages.played(audio);
        VoiceMessages.played(cached(new byte[0]));
        VoiceMessages.played(cached(ascii("encrypted at rest, not a sound header")));
        assertTrue(added.isEmpty());
        assertEquals(0, lookups);
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test @Config(sdk = 36) public void aLibraryFailureIsRecordedAndTheNextPlayTriesAgain() throws Exception {
        turnOn();
        VoiceMessages.library = new VoiceMessages.Library() {
            @Override public boolean has(Context context, String hash) { return false; }
            @Override public void add(Context context, String name, String mime, byte[] sound) throws IOException {
                throw new IOException("storage full");
            }
        };
        Uri audio = cached(m4a("too big for the phone"));
        VoiceMessages.played(audio);
        assertTrue(Settings.hookErrors.get(VoiceMessages.KEY).startsWith("java.io.IOException at "));
        VoiceMessages.library = fake;
        VoiceMessages.played(audio);
        assertEquals("A failed copy isn't remembered as saved", 1, added.size());
    }

    @Test @Config(sdk = 36) public void aFullQueueDropsTheCopyWithoutAnError() throws Exception {
        turnOn();
        VoiceMessages.copies = work -> { throw new RejectedExecutionException("full"); };
        VoiceMessages.played(cached(m4a("one too many")));
        assertTrue(added.isEmpty());
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test @Config(sdk = 36) public void theWorkerIsOneDaemonThreadOffThePlayer() throws Exception {
        turnOn();
        VoiceMessages.copies = WORKER;
        java.util.concurrent.CountDownLatch done = new java.util.concurrent.CountDownLatch(1);
        Thread[] ran = new Thread[1];
        WORKER.execute(() -> { ran[0] = Thread.currentThread(); done.countDown(); });
        assertTrue(done.await(5, java.util.concurrent.TimeUnit.SECONDS));
        assertNotSame(Thread.currentThread(), ran[0]);
        assertTrue(ran[0].isDaemon());
        assertEquals("HushVoiceCopy", ran[0].getName());
    }

    @Test @Config(sdk = 28) public void android9SavesNothingAndTheSwitchSaysSo() throws Exception {
        turnOn();
        VoiceMessages.played(cached(m4a("no shared folders here")));
        assertTrue(added.isEmpty());
        assertFalse(Settings.available(VoiceMessages.KEY));
    }

    @Test public void theSwitchSitsUnderPhotosAndVideosAndStartsOff() {
        String[] spec = null;
        for (String[] control : SettingsActivity.CONTROLS) if (control[0].equals(VoiceMessages.KEY)) spec = control;
        assertNotNull(spec);
        assertEquals("Save voice messages you play", spec[1]);
        assertEquals("photos_videos", spec[3]);
        assertTrue(SettingsActivity.EXPERIMENTAL.contains(VoiceMessages.KEY));
        assertTrue(Settings.installed.contains(VoiceMessages.KEY));
        assertFalse(Settings.preferences.getBoolean(VoiceMessages.KEY, false));
        assertEquals(android.os.Build.VERSION.SDK_INT >= 29, Settings.available(VoiceMessages.KEY));
    }

    // The real library, through Robolectric's resolver, which records what reaches MediaStore.

    ShadowContentResolver resolver() {
        return Shadows.shadowOf(RuntimeEnvironment.getApplication().getContentResolver());
    }

    @Test @Config(sdk = 36) public void sharedAudioWritesAPendingItemThenPublishesIt() throws Exception {
        Context context = RuntimeEnvironment.getApplication();
        ShadowContentResolver shadow = resolver();
        shadow.setNextDatabaseIdForInserts(0);
        Uri collection = MediaStore.Audio.Media.getContentUri(MediaStore.VOLUME_EXTERNAL_PRIMARY);
        Uri item = Uri.parse(collection + "/1");
        ByteArrayOutputStream written = new ByteArrayOutputStream();
        shadow.registerOutputStream(item, written);
        byte[] sound = m4a("on the shared shelf");
        new VoiceMessages.SharedAudio().add(context, "Voice message x 0123456789ab.m4a", "audio/mp4", sound);
        assertEquals(1, shadow.getInsertStatements().size());
        ContentValues values = shadow.getInsertStatements().get(0).getContentValues();
        assertEquals(collection, shadow.getInsertStatements().get(0).getUri());
        assertEquals("Voice message x 0123456789ab.m4a", values.getAsString(MediaStore.MediaColumns.DISPLAY_NAME));
        assertEquals("audio/mp4", values.getAsString(MediaStore.MediaColumns.MIME_TYPE));
        assertEquals("Recordings/Messenger", values.getAsString(MediaStore.MediaColumns.RELATIVE_PATH));
        assertEquals(Integer.valueOf(1), values.getAsInteger(MediaStore.MediaColumns.IS_PENDING));
        assertArrayEquals(sound, written.toByteArray());
        assertEquals(1, shadow.getUpdateStatements().size());
        assertEquals(item, shadow.getUpdateStatements().get(0).getUri());
        assertEquals(Integer.valueOf(0), shadow.getUpdateStatements().get(0).getContentValues().getAsInteger(MediaStore.MediaColumns.IS_PENDING));
        assertTrue(shadow.getDeleteStatements().isEmpty());
    }

    @Test @Config(sdk = 30) public void android11HasNoRecordingsFolderSoMusicHoldsThem() throws Exception {
        ShadowContentResolver shadow = resolver();
        // Robolectric's type map starts empty, where a phone's already pairs ogg with audio/ogg.
        Shadows.shadowOf(MimeTypeMap.getSingleton()).addExtensionMimeTypeMapping("ogg", "audio/ogg");
        new VoiceMessages.SharedAudio().add(RuntimeEnvironment.getApplication(), "v 0123456789ab.ogg", "audio/ogg", ascii("OggS"));
        assertEquals("Music/Messenger", shadow.getInsertStatements().get(0).getContentValues().getAsString(MediaStore.MediaColumns.RELATIVE_PATH));
    }

    @Test @Config(sdk = 36) public void aWriteThatFailsRemovesTheHalfMadeItem() {
        ShadowContentResolver shadow = resolver();
        shadow.setNextDatabaseIdForInserts(0);
        Uri item = Uri.parse(MediaStore.Audio.Media.getContentUri(MediaStore.VOLUME_EXTERNAL_PRIMARY) + "/1");
        shadow.registerOutputStream(item, new OutputStream() {
            @Override public void write(int b) throws IOException { throw new IOException("no space"); }
            @Override public void write(byte[] b, int off, int len) throws IOException { throw new IOException("no space"); }
        });
        assertThrows(IOException.class, () -> new VoiceMessages.SharedAudio().add(RuntimeEnvironment.getApplication(),
            "v 0123456789ab.m4a", "audio/mp4", m4a("lost")));
        assertTrue(shadow.getUpdateStatements().isEmpty());
        assertEquals(1, shadow.getDeleteStatements().size());
        assertEquals(item, shadow.getDeleteStatements().get(0).getUri());
    }

    @Test @Config(sdk = 36) public void sharedAudioFindsAnEarlierCopyByTheHashInItsName() throws Exception {
        // Robolectric answers MediaStore with its own small provider, so the copy is really stored and looked up.
        Context context = RuntimeEnvironment.getApplication();
        VoiceMessages.SharedAudio shared = new VoiceMessages.SharedAudio();
        ShadowContentResolver shadow = resolver();
        shadow.setNextDatabaseIdForInserts(0);
        shadow.registerOutputStream(Uri.parse(MediaStore.Audio.Media.getContentUri(MediaStore.VOLUME_EXTERNAL_PRIMARY) + "/1"),
            new ByteArrayOutputStream());
        assertFalse("Nothing saved yet", shared.has(context, "0123456789ab"));
        shared.add(context, "Voice message x 0123456789ab.m4a", "audio/mp4", m4a("kept"));
        assertTrue(shared.has(context, "0123456789ab"));
        assertFalse("Another hash", shared.has(context, "ba9876543210"));
        assertFalse("Only the start of the hash", shared.has(context, "0123456789"));
    }

    @Test @Config(sdk = 36) public void aPlayReachesSharedAudioEndToEnd() throws Exception {
        turnOn();
        VoiceMessages.library = SHARED;
        ShadowContentResolver shadow = resolver();
        shadow.setNextDatabaseIdForInserts(0);
        Uri item = Uri.parse(MediaStore.Audio.Media.getContentUri(MediaStore.VOLUME_EXTERNAL_PRIMARY) + "/1");
        ByteArrayOutputStream written = new ByteArrayOutputStream();
        shadow.registerOutputStream(item, written);
        byte[] sound = m4a("all the way through");
        Uri audio = cached(sound);
        VoiceMessages.played(audio);
        VoiceMessages.played(audio);
        assertEquals(1, shadow.getInsertStatements().size());
        assertArrayEquals(sound, written.toByteArray());
        assertTrue(shadow.getInsertStatements().get(0).getContentValues().getAsString(MediaStore.MediaColumns.DISPLAY_NAME)
            .endsWith(" " + VoiceMessages.hash(sound) + ".m4a"));
        assertTrue(Settings.hookErrors.isEmpty());
    }
}
