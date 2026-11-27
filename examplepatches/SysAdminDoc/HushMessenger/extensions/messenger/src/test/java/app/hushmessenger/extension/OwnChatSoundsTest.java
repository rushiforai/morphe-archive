package app.hushmessenger.extension;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.res.AssetFileDescriptor;
import android.content.res.Resources;
import android.net.Uri;
import android.os.Looper;
import android.os.ParcelFileDescriptor;
import android.view.View;
import android.widget.TextView;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.security.MessageDigest;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
import java.util.function.Predicate;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;
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
import org.robolectric.annotation.GraphicsMode;
import org.robolectric.shadows.ShadowToast;
import static org.junit.Assert.*;

/**
 * #224: Messenger opens its send, sent and in-app message sounds through the hook, which answers with a picked copy
 * only while the switch is in effect and Messenger's own open in every other case.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 36)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class OwnChatSoundsTest {
    private static final int SEND = 0x7f130101, SENT = 0x7f130102, IN_APP = 0x7f130103, OTHER = 0x7f130104,
        NOT_RAW = 0x7f080105, RENAMED = 0x7f130106, UNKNOWN = 0x7f130107, HUGE = 0x7f130108;
    private static final byte[] STOCK = "stock!!".getBytes(StandardCharsets.US_ASCII);
    private static final byte[] RENAMED_SENT = "the stock sent sound".getBytes(StandardCharsets.US_ASCII);

    @Rule public final TemporaryFolder folder = new TemporaryFolder();
    private Context app;
    private Predicate<File> playCheck;
    private String[] stockHashes;

    @Before public void reset() {
        app = RuntimeEnvironment.getApplication();
        app.getSharedPreferences("hushmessenger", Context.MODE_PRIVATE).edit().clear().commit();
        Settings.initialize(app);
        Settings.activeAt.clear();
        Settings.hookErrors.clear();
        CrashGuard.resetForTests();
        ShadowToast.reset();
        ChoiceFilesTest.clearFiles(app);
        playCheck = OwnChatSounds.playCheck;
        stockHashes = OwnChatSounds.stockHashes.clone();
        OwnChatSounds.playCheck = copy -> true;
        OwnChatSounds.forget();
    }

    @After public void restore() {
        ChoiceFilesTest.clearFiles(app);
        Settings.preferences.edit().clear().commit();
        Settings.hookErrors.clear();
        CrashGuard.resetForTests();
        OwnChatSounds.playCheck = playCheck;
        OwnChatSounds.stockHashes = stockHashes;
        OwnChatSounds.forget();
    }

    /** Messenger's resources with its sounds under the names and files a build gives them. */
    private final class SoundResources extends Resources {
        final Map<Integer, String> names = new HashMap<>();
        final Map<Integer, byte[]> files = new HashMap<>();
        final File stock;
        int stockOpens;
        RuntimeException broken;

        SoundResources() throws Exception {
            super(app.getAssets(), app.getResources().getDisplayMetrics(), app.getResources().getConfiguration());
            stock = folder.newFile("stock.ogg");
            Files.write(stock.toPath(), STOCK);
            names.put(SEND, "raw/sound_send");
            names.put(SENT, "raw/sound_sent");
            names.put(IN_APP, "raw/in_app_notification");
            names.put(OTHER, "raw/sound_like");
            names.put(NOT_RAW, "drawable/sound_send");
            files.put(RENAMED, RENAMED_SENT);
            files.put(UNKNOWN, "some other sound".getBytes(StandardCharsets.US_ASCII));
            files.put(HUGE, new byte[(int) OwnChatSounds.MAX_BYTES + 1]);
        }

        private String part(int id, int index) {
            if (broken != null) throw broken;
            String name = names.get(id);
            if (name == null) throw new Resources.NotFoundException("No name for " + id);
            return name.split("/")[index];
        }

        @Override public String getResourceTypeName(int id) {
            return part(id, 0);
        }

        @Override public String getResourceEntryName(int id) {
            return part(id, 1);
        }

        @Override public InputStream openRawResource(int id) {
            byte[] bytes = files.get(id);
            if (bytes == null) throw new Resources.NotFoundException("No file for " + id);
            return new ByteArrayInputStream(bytes);
        }

        @Override public AssetFileDescriptor openRawResourceFd(int id) {
            stockOpens++;
            try {
                return new AssetFileDescriptor(ParcelFileDescriptor.open(stock, ParcelFileDescriptor.MODE_READ_ONLY), 0, stock.length());
            } catch (FileNotFoundException missing) {
                throw new Resources.NotFoundException("No stock file");
            }
        }
    }

    private static byte[] ogg(String tail) {
        return ("OggS" + tail).getBytes(StandardCharsets.US_ASCII);
    }

    private static byte[] played(AssetFileDescriptor sound) throws Exception {
        assertNotNull(sound);
        assertEquals(0, sound.getStartOffset());
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        try (InputStream input = new ParcelFileDescriptor.AutoCloseInputStream(sound.getParcelFileDescriptor())) {
            byte[] buffer = new byte[4096];
            for (int read; (read = input.read(buffer)) != -1; ) out.write(buffer, 0, read);
        }
        assertEquals(out.size(), sound.getLength());
        return out.toByteArray();
    }

    private void pick(String sound, byte[] bytes) throws Exception {
        OwnChatSounds.copy(new ByteArrayInputStream(bytes), OwnChatSounds.file(app, sound), () -> true);
    }

    private static String sha256(byte[] bytes) throws Exception {
        StringBuilder hex = new StringBuilder();
        for (byte b : MessageDigest.getInstance("SHA-256").digest(bytes)) hex.append(String.format("%02x", b & 0xff));
        return hex.toString();
    }

    @Test public void offPauseAndSafeModePlayMessengersOwnSound() throws Exception {
        SoundResources resources = new SoundResources();
        byte[] mine = ogg(" my send sound");
        pick("send", mine);
        assertArrayEquals(STOCK, played(OwnChatSounds.rawSound(resources, SEND)));
        assertEquals(1, resources.stockOpens);
        assertTrue("off isn't a use", Settings.activeAt.isEmpty());

        for (String state : new String[] {"paused", "safe"}) {
            Settings.initialize(app);
            Settings.preferences.edit().clear().putBoolean(OwnChatSounds.KEY, true)
                .putBoolean("paused", state.equals("paused")).putBoolean("safe_mode", state.equals("safe")).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(app);
            Settings.activeAt.clear();
            assertArrayEquals(state, STOCK, played(OwnChatSounds.rawSound(resources, SEND)));
            assertTrue(state, Settings.activeAt.isEmpty());
        }
        assertEquals(3, resources.stockOpens);

        Settings.initialize(app);
        Settings.preferences.edit().clear().putBoolean(OwnChatSounds.KEY, true).commit();
        CrashGuard.resetForTests();
        Settings.activeAt.clear();
        assertArrayEquals(mine, played(OwnChatSounds.rawSound(resources, SEND)));
        assertEquals("the picked copy plays instead", 3, resources.stockOpens);
        assertTrue(Settings.activeAt.containsKey(OwnChatSounds.KEY));
        // Nothing picked for these, so they stay Messenger's.
        assertArrayEquals(STOCK, played(OwnChatSounds.rawSound(resources, SENT)));
        assertArrayEquals(STOCK, played(OwnChatSounds.rawSound(resources, IN_APP)));
        assertArrayEquals(STOCK, played(OwnChatSounds.rawSound(resources, OTHER)));
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test public void eachSoundIsKnownByItsNameOrByItsStockFile() throws Exception {
        SoundResources resources = new SoundResources();
        OwnChatSounds.stockHashes = new String[] {sha256(STOCK), sha256(RENAMED_SENT), sha256(resources.files.get(HUGE))};
        assertEquals(0, OwnChatSounds.soundOf(resources, SEND));
        assertEquals(1, OwnChatSounds.soundOf(resources, SENT));
        assertEquals(2, OwnChatSounds.soundOf(resources, IN_APP));
        assertEquals("another raw sound", -1, OwnChatSounds.soundOf(resources, OTHER));
        assertEquals("the name on a picture", -1, OwnChatSounds.soundOf(resources, NOT_RAW));
        assertEquals("a renamed sound by its file", 1, OwnChatSounds.soundOf(resources, RENAMED));
        assertEquals(-1, OwnChatSounds.soundOf(resources, UNKNOWN));
        assertEquals("a file past the limit isn't read whole", -1, OwnChatSounds.soundOf(resources, HUGE));

        Settings.preferences.edit().putBoolean(OwnChatSounds.KEY, true).commit();
        byte[] mine = ogg(" my sent sound");
        pick("sent", mine);
        assertArrayEquals(mine, played(OwnChatSounds.rawSound(resources, RENAMED)));
        assertArrayEquals(mine, played(OwnChatSounds.rawSound(resources, SENT)));
        assertEquals(0, resources.stockOpens);
    }

    @Test public void aCopyThatCantPlayOrAFailureFallsBackToMessengersOwn() throws Exception {
        SoundResources resources = new SoundResources();
        Settings.preferences.edit().putBoolean(OwnChatSounds.KEY, true).commit();
        Files.write(OwnChatSounds.file(app, "send").toPath(), new byte[0]);
        assertArrayEquals("an empty copy", STOCK, played(OwnChatSounds.rawSound(resources, SEND)));
        assertTrue(OwnChatSounds.file(app, "sent").mkdirs());
        assertArrayEquals("a folder where the copy goes", STOCK, played(OwnChatSounds.rawSound(resources, SENT)));
        assertTrue(Settings.activeAt.isEmpty());
        assertTrue(Settings.hookErrors.isEmpty());

        pick("in_app", ogg(" mine"));
        resources.broken = new IllegalStateException("table gone");
        assertArrayEquals(STOCK, played(OwnChatSounds.rawSound(resources, IN_APP)));
        assertTrue("the failure is recorded", Settings.hookErrors.containsKey(OwnChatSounds.KEY));
        assertEquals(3, resources.stockOpens);
    }

    @Test public void onlyASoundThatPlaysIsTaken() throws Exception {
        File target = OwnChatSounds.file(app, "send");
        byte[] first = ogg(" first");
        pick("send", first);
        assertArrayEquals(first, Files.readAllBytes(target.toPath()));

        Map<OwnChatSounds.Refusal, byte[]> refused = new LinkedHashMap<>();
        refused.put(OwnChatSounds.Refusal.NOT_A_SOUND, new byte[] {(byte) 0x89, 'P', 'N', 'G', 0, 0, 0, 0});
        refused.put(OwnChatSounds.Refusal.TOO_LARGE, Arrays.copyOf(ogg(""), (int) OwnChatSounds.MAX_BYTES + 1));
        for (Map.Entry<OwnChatSounds.Refusal, byte[]> file : refused.entrySet()) {
            try {
                pick("send", file.getValue());
                fail(file.getKey().name());
            } catch (OwnChatSounds.Refused refusal) {
                assertEquals(file.getKey(), refusal.reason);
            }
        }
        try {
            pick("send", new byte[0]);
            fail("empty");
        } catch (OwnChatSounds.Refused refusal) {
            assertEquals(OwnChatSounds.Refusal.NOT_A_SOUND, refusal.reason);
        }
        OwnChatSounds.playCheck = copy -> false;
        try {
            pick("send", ogg(" starts like one and plays nothing"));
            fail("plays nothing");
        } catch (OwnChatSounds.Refused refusal) {
            assertEquals(OwnChatSounds.Refusal.NOT_A_SOUND, refusal.reason);
        }
        OwnChatSounds.playCheck = copy -> true;
        try {
            OwnChatSounds.copy(new ByteArrayInputStream(ogg(" late")), target, () -> false);
            fail("given up on");
        } catch (OwnChatSounds.Refused refusal) {
            assertEquals(OwnChatSounds.Refusal.NOT_SAVED, refusal.reason);
        }
        try {
            OwnChatSounds.copy(null, target, () -> true);
            fail("no stream");
        } catch (OwnChatSounds.Refused refusal) {
            assertEquals(OwnChatSounds.Refusal.UNREADABLE, refusal.reason);
        }
        assertArrayEquals("every refusal kept the sound there was", first, Files.readAllBytes(target.toPath()));
        assertFalse(HomeHeaderPicture.partial(target).exists());

        assertTrue(OwnChatSounds.looksLikeSound("ID3....".getBytes(StandardCharsets.US_ASCII)));
        assertTrue(OwnChatSounds.looksLikeSound(new byte[] {(byte) 0xFF, (byte) 0xFB, 0, 0}));
        assertTrue(OwnChatSounds.looksLikeSound("....ftypM4A ".getBytes(StandardCharsets.US_ASCII)));
        assertTrue(OwnChatSounds.looksLikeSound("RIFF....WAVEfmt ".getBytes(StandardCharsets.US_ASCII)));
        assertFalse(OwnChatSounds.looksLikeSound("RIFF....AVI LIST".getBytes(StandardCharsets.US_ASCII)));
        assertFalse(OwnChatSounds.looksLikeSound("Ogg".getBytes(StandardCharsets.US_ASCII)));
    }

    @Test public void theSwitchSitsUnderSoundInTheOpenChatAndStartsOff() {
        int open = -1, own = -1;
        for (int i = 0; i < SettingsActivity.CONTROLS.length; i++) {
            if (SettingsActivity.CONTROLS[i][0].equals(OpenChatSound.KEY)) open = i;
            if (SettingsActivity.CONTROLS[i][0].equals(OwnChatSounds.KEY)) own = i;
        }
        assertEquals(open + 1, own);
        assertEquals("Your own chat sounds", SettingsActivity.CONTROLS[own][1]);
        assertEquals("notifications", SettingsActivity.CONTROLS[own][3]);
        assertTrue(Settings.installed.contains(OwnChatSounds.KEY));
        assertTrue(SettingsActivity.EXPERIMENTAL.contains(OwnChatSounds.KEY));
        assertFalse(Settings.preferences.getBoolean(OwnChatSounds.KEY, false));
    }

    @Test public void theRowsChooseShowAndRemoveEachSound() throws Exception {
        Settings.preferences.edit().putBoolean(OwnChatSounds.KEY, true).commit();
        OpenSections.all();
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            SettingsActivity activity = screen.get();
            View root = activity.getWindow().getDecorView();
            assertNotNull(root.findViewWithTag("own_chat_sounds_list"));
            for (String sound : OwnChatSounds.SOUNDS) {
                assertTrue(sound, label(root, sound).endsWith("Messenger's sound"));
                assertNull(sound, root.findViewWithTag("own_chat_sounds_remove_" + sound));
            }
            assertTrue(label(root, "in_app").startsWith("In-app message"));

            choose(activity, root, "send");
            activity.onActivityResult(SettingsActivity.PICK_CHAT_SOUND, Activity.RESULT_CANCELED, null);
            assertNull(ShadowToast.getTextOfLatestToast());

            choose(activity, root, "send");
            activity.onActivityResult(SettingsActivity.PICK_CHAT_SOUND, Activity.RESULT_OK,
                new Intent().setData(Uri.parse("file:///sdcard/Ding.ogg")));
            assertEquals("A file path isn't a picker's grant", "Couldn't open that file.", ShadowToast.getTextOfLatestToast());

            Uri photo = Uri.parse("content://sounds/picked/photo.png");
            Shadows.shadowOf(activity.getContentResolver()).registerInputStream(photo,
                new ByteArrayInputStream(new byte[] {(byte) 0x89, 'P', 'N', 'G', 0, 0, 0, 0}));
            choose(activity, root, "send");
            activity.onActivityResult(SettingsActivity.PICK_CHAT_SOUND, Activity.RESULT_OK, new Intent().setData(photo));
            awaitSoundToast("That file won't play as a sound.");
            assertFalse(OwnChatSounds.file(activity, "send").exists());

            byte[] ding = ogg(" ding");
            Uri picked = Uri.parse("content://sounds/picked/Ding.ogg");
            Shadows.shadowOf(activity.getContentResolver()).registerInputStream(picked, new ByteArrayInputStream(ding));
            choose(activity, root, "send");
            activity.onActivityResult(SettingsActivity.PICK_CHAT_SOUND, Activity.RESULT_OK, new Intent().setData(picked));
            awaitSoundToast("Sound saved.");
            assertArrayEquals(ding, Files.readAllBytes(OwnChatSounds.file(activity, "send").toPath()));
            assertTrue(label(root, "send").endsWith("Your sound"));
            assertTrue("the other sounds stay Messenger's", label(root, "sent").endsWith("Messenger's sound"));
            assertFalse(OwnChatSounds.file(activity, "sent").exists());
            assertTrue(root.findViewWithTag("own_chat_sounds_choose_sent").isEnabled());

            root.findViewWithTag("own_chat_sounds_remove_send").performClick();
            assertEquals("Back to Messenger's sound.", ShadowToast.getTextOfLatestToast());
            assertFalse(OwnChatSounds.file(activity, "send").exists());
            assertTrue(label(root, "send").endsWith("Messenger's sound"));
            assertNull(root.findViewWithTag("own_chat_sounds_remove_send"));
            View undo = root.findViewWithTag("undo");
            assertEquals(View.VISIBLE, undo.getVisibility());
            undo.performClick();
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            assertArrayEquals(ding, Files.readAllBytes(OwnChatSounds.file(activity, "send").toPath()));
            assertTrue(label(root, "send").endsWith("Your sound"));
        }
    }

    @Test public void aSavedChoicesFileCarriesThePickedSounds() throws Exception {
        byte[] send = ogg(" send"), inApp = ogg(" in app");
        pick("send", send);
        pick("in_app", inApp);
        Set<String> installed = Settings.installed;
        assertTrue("a sound alone makes a zip", ChoiceFiles.any(app, Settings.preferences, installed));
        String text = ChoiceCodec.encode(Settings.preferences, installed);
        ChoiceFiles.Backup backup = ChoiceFiles.unzip(new ByteArrayInputStream(
            ChoiceFiles.zip(app, text, Settings.preferences, installed)));
        assertEquals(new HashSet<>(Arrays.asList(ChoiceFiles.CHAT_SOUND + "send", ChoiceFiles.CHAT_SOUND + "in_app")),
            backup.files.keySet());

        ChoiceFilesTest.clearFiles(app);
        assertFalse(ChoiceFiles.any(app, Settings.preferences, installed));
        Set<String> without = new HashSet<>(installed);
        without.remove(OwnChatSounds.KEY);
        assertEquals(2, ChoiceFiles.restore(app, Settings.preferences, backup.files, without).unavailable);
        assertFalse(OwnChatSounds.anyPicked(app));

        ChoiceFiles.Result result = ChoiceFiles.restore(app, Settings.preferences, backup.files, installed);
        assertEquals(2, result.total);
        assertEquals(2, result.changed);
        assertEquals(0, result.damaged);
        assertArrayEquals(send, Files.readAllBytes(OwnChatSounds.file(app, "send").toPath()));
        assertArrayEquals(inApp, Files.readAllBytes(OwnChatSounds.file(app, "in_app").toPath()));
        ChoiceFiles.Result again = ChoiceFiles.restore(app, Settings.preferences, backup.files, installed);
        assertEquals(2, again.total);
        assertEquals(0, again.changed);

        Map<String, byte[]> entries = new LinkedHashMap<>();
        entries.put(ChoiceFiles.TEXT, text.getBytes(StandardCharsets.UTF_8));
        entries.put(ChoiceFiles.CHAT_SOUND + "ringtone", ogg(" not a sound the page offers"));
        entries.put(ChoiceFiles.CHAT_SOUND + "sent", new byte[] {(byte) 0x89, 'P', 'N', 'G', 0, 0, 0, 0});
        ChoiceFiles.Backup odd = ChoiceFiles.unzip(new ByteArrayInputStream(zipOf(entries)));
        assertEquals(1, odd.unknown);
        ChoiceFiles.Result damaged = ChoiceFiles.restore(app, Settings.preferences, odd.files, installed);
        assertEquals("the sound's own copy turns down what isn't a sound", 1, damaged.damaged);
        assertFalse(OwnChatSounds.file(app, "sent").exists());
    }

    private static String label(View root, String sound) {
        android.view.ViewGroup row = root.findViewWithTag("own_chat_sounds_row_" + sound);
        assertNotNull(sound, row);
        return ((TextView) row.getChildAt(0)).getText().toString();
    }

    private static void choose(SettingsActivity activity, View root, String sound) {
        View choose = root.findViewWithTag("own_chat_sounds_choose_" + sound);
        assertTrue(sound, choose.isEnabled());
        choose.performClick();
        var request = Shadows.shadowOf(activity).getNextStartedActivityForResult();
        assertEquals(SettingsActivity.PICK_CHAT_SOUND, request.requestCode);
        assertEquals(Intent.ACTION_OPEN_DOCUMENT, request.intent.getAction());
        assertTrue(request.intent.hasCategory(Intent.CATEGORY_OPENABLE));
        assertEquals("*/*", request.intent.getType());
        assertArrayEquals(OwnChatSoundsRow.SOUND_TYPES, request.intent.getStringArrayExtra(Intent.EXTRA_MIME_TYPES));
        ShadowToast.reset();
    }

    private static byte[] zipOf(Map<String, byte[]> entries) throws Exception {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        try (ZipOutputStream zip = new ZipOutputStream(bytes)) {
            for (Map.Entry<String, byte[]> entry : entries.entrySet()) {
                zip.putNextEntry(new ZipEntry(entry.getKey()));
                zip.write(entry.getValue());
                zip.closeEntry();
            }
        }
        return bytes.toByteArray();
    }

    private static void awaitSoundToast(String text) throws InterruptedException {
        long deadline = System.currentTimeMillis() + 10_000;
        do {
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            if (text.equals(ShadowToast.getTextOfLatestToast())) return;
            Thread.sleep(20);
        } while (System.currentTimeMillis() < deadline);
        fail("Missing chat sound result: " + text + "; latest toast: " + ShadowToast.getTextOfLatestToast());
    }
}
