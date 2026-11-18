package app.hushmessenger.extension;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.net.Uri;
import android.os.Looper;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
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
 * Save to a file carries the choices that live in files, and Read a file puts each one back through its own row's copy,
 * under that row's limits.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 36, shadows = {ChoiceBackupTest.DocumentResolver.class, ChoiceBackupTest.SeekableDescriptor.class,
    ChoiceBackupTest.SeekableOs.class, ChoiceBackupTest.MediaDocuments.class})
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class ChoiceFilesTest {
    private static final String ACCOUNT = "100";
    private static final String PERSON = "200";
    private static final String PICTURE = "PIC_7.jpg";
    private static final String SPECIAL = ChoiceFiles.SPECIAL + ACCOUNT + ".txt";

    @Rule public final TemporaryFolder folder = new TemporaryFolder();
    private Context app;

    @Before public void reset() throws Exception {
        app = RuntimeEnvironment.getApplication();
        app.getSharedPreferences("hushmessenger", Context.MODE_PRIVATE).edit().clear().commit();
        Settings.initialize(app);
        OpenSections.all();
        CrashGuard.resetForTests();
        ChoiceBackupTest.DocumentResolver.opener = null;
        ChoiceBackupTest.DocumentResolver.onOpen = null;
        ChoiceBackupTest.DocumentResolver.query = null;
        ChoiceBackupTest.MediaDocuments.alias = null;
        ChoicesBackup.documentTimeoutMillis = 30_000;
        ShadowToast.reset();
        FontFile.testFolder = folder.newFolder();
        OwnFont.fileCheck = OwnFontTest::loadsCopy;
        OwnFont.forget();
        clearFiles(app);
        File databases = app.getDatabasePath(SpecialContacts.KEY).getParentFile();
        assertTrue(databases.mkdirs() || databases.isDirectory());
        assertTrue(new File(databases, "msys_database_" + ACCOUNT).createNewFile());
        SpecialContacts.resetForTests();
        SpecialContacts.work = Runnable::run;
    }

    @After public void restore() {
        clearFiles(app);
        SpecialContacts.resetForTests();
        Settings.preferences.edit().clear().commit();
        OwnFont.forget();
        FontFile.testFolder = null;
        OwnFont.fileCheck = OwnFont::loads;
    }

    /**
     * Deletes every file-backed choice and account marker. Robolectric keeps one files folder for the whole run, so a
     * picture or a followed person left by another class would turn a plain save into a zip.
     */
    static void clearFiles(Context context) {
        File header = HomeHeader.file(context);
        delete(header);
        delete(HomeHeaderPicture.partial(header));
        for (String key : TabIcons.SHOWN) {
            delete(TabIcons.file(context, key));
            delete(HomeHeaderPicture.partial(TabIcons.file(context, key)));
        }
        HomeHeader.forget();
        TabIcons.forget();
        delete(AutoReplyPicture.directory(context));
        delete(SpecialContacts.folder(context));
        File[] databases = context.getDatabasePath(SpecialContacts.KEY).getParentFile().listFiles();
        if (databases != null) for (File file : databases) if (file.getName().startsWith("msys_database_")) delete(file);
    }

    private static void delete(File file) {
        File[] inside = file.listFiles();
        if (inside != null) for (File each : inside) delete(each);
        file.delete();
    }

    @Test public void everyKindOfFileRoundTripsAndASecondRestoreChangesNothing() throws Exception {
        copyPicture(png(600, 150, Color.RED), HomeHeader.file(app), HomeHeaderPicture.MAX_WIDTH, HomeHeaderPicture.MAX_HEIGHT);
        copyPicture(png(96, 96, Color.BLUE), TabIcons.file(app, "calls"), TabIcons.MAX_SIDE, TabIcons.MAX_SIDE);
        byte[] reply = jpeg(320, 240, Color.GREEN);
        write(AutoReplyPicture.fileFor(app, PICTURE), reply);
        // No reply sends this one, so it's left out.
        write(AutoReplyPicture.fileFor(app, "PIC_8.jpg"), reply);
        byte[] font = FontFileTest.font(FontFileTest.STATIC_FONT);
        FontFile.copy(new ByteArrayInputStream(font), FontFile.file(app), OwnFontTest::loadsCopy);
        Settings.preferences.edit().putString(OwnFont.NAME_KEY, "Rubik-Regular.ttf")
            .putString(AutoReply.RULES, "[{\"when\":\"hi\",\"reply\":\"Driving\",\"picture\":\"" + PICTURE + "\"}]").commit();
        assertEquals(SpecialContactsStore.Result.ADDED, SpecialContacts.store(app, ACCOUNT).track(PERSON, "Sam\tLee", 5));
        byte[] header = Files.readAllBytes(HomeHeader.file(app).toPath());
        byte[] tab = Files.readAllBytes(TabIcons.file(app, "calls").toPath());

        assertTrue(ChoiceFiles.any(app, Settings.preferences, Settings.installed));
        String text = ChoiceCodec.encode(Settings.preferences, Settings.installed);
        byte[] zip = ChoiceFiles.zip(app, text, Settings.preferences, Settings.installed);
        assertArrayEquals("The same choices make the same file", zip, ChoiceFiles.zip(app, text, Settings.preferences, Settings.installed));
        assertTrue(ChoiceFiles.isZip(zip, zip.length));
        ChoiceFiles.Backup backup = ChoiceFiles.unzip(new ByteArrayInputStream(zip));
        assertEquals(text, backup.text);
        assertEquals(0, backup.unknown);
        assertEquals(Arrays.asList(ChoiceFiles.HEADER, "tab-calls.png", ChoiceFiles.FONT, ChoiceFiles.FONT_NAME,
            ChoiceFiles.AUTO_REPLY + PICTURE, SPECIAL), new ArrayList<>(backup.files.keySet()));
        // A tab in a name can't split a line, and only who's followed goes in, never what was seen.
        assertEquals(PERSON + "\tSam Lee\n", new String(backup.files.get(SPECIAL), StandardCharsets.UTF_8));

        clearFiles(app);
        assertTrue(new File(app.getDatabasePath(SpecialContacts.KEY).getParentFile(), "msys_database_" + ACCOUNT).createNewFile());
        assertTrue(FontFile.file(app).delete());
        Settings.preferences.edit().remove(OwnFont.NAME_KEY).commit();
        SpecialContacts.resetForTests();
        SpecialContacts.work = Runnable::run;
        // The account's list is read before the restore, so the restore has to tell it about the person it added.
        assertNotNull(SpecialContacts.current());
        assertFalse(SpecialContacts.tracked.contains(PERSON));
        assertFalse(ChoiceFiles.any(app, Settings.preferences, Settings.installed));

        ChoiceFiles.Result result = ChoiceFiles.restore(app, Settings.preferences, backup.files, Settings.installed);
        assertEquals(5, result.total);
        assertEquals(5, result.changed);
        assertEquals(0, result.damaged);
        assertEquals(0, result.unavailable);
        assertArrayEquals(header, Files.readAllBytes(HomeHeader.file(app).toPath()));
        assertArrayEquals(tab, Files.readAllBytes(TabIcons.file(app, "calls").toPath()));
        assertArrayEquals(font, Files.readAllBytes(FontFile.file(app).toPath()));
        assertEquals("Rubik-Regular.ttf", Settings.preferences.getString(OwnFont.NAME_KEY, ""));
        assertArrayEquals(reply, Files.readAllBytes(AutoReplyPicture.fileFor(app, PICTURE).toPath()));
        assertFalse(AutoReplyPicture.fileFor(app, "PIC_8.jpg").exists());
        assertTrue(SpecialContacts.tracked.contains(PERSON));
        assertEquals("Sam Lee", SpecialContacts.store(app, ACCOUNT).people().get(0).name);
        String[] left = AutoReplyPicture.directory(app).list();
        assertEquals("No half-written picture stays behind", Arrays.asList(PICTURE), Arrays.asList(left));

        ChoiceFiles.Result again = ChoiceFiles.restore(app, Settings.preferences, backup.files, Settings.installed);
        assertEquals(5, again.total);
        assertEquals(0, again.changed);
        assertEquals(0, again.damaged);
    }

    @Test public void foreignBrokenAndOversizedEntriesNeverReachTheirRows() throws Exception {
        String text = ChoiceCodec.encode(Settings.preferences, Settings.installed);
        Map<String, byte[]> entries = new LinkedHashMap<>();
        entries.put(ChoiceFiles.TEXT, text.getBytes(StandardCharsets.UTF_8));
        // Names this version doesn't keep, a way out of the folder among them, are counted and never read.
        entries.put("notes.txt", new byte[] {1});
        entries.put("tab-nope.png", png(8, 8, Color.RED));
        entries.put(ChoiceFiles.AUTO_REPLY + "../../shared_prefs/hushmessenger.xml", new byte[] {1});
        entries.put(ChoiceFiles.SPECIAL + "abc.txt", "1\tx\n".getBytes(StandardCharsets.UTF_8));
        entries.put(ChoiceFiles.HEADER, "not a picture".getBytes(StandardCharsets.UTF_8));
        entries.put(SPECIAL, "nobody here\n".getBytes(StandardCharsets.UTF_8));
        ChoiceFiles.Backup backup = ChoiceFiles.unzip(new ByteArrayInputStream(zip(entries)));
        assertEquals(4, backup.unknown);
        assertEquals(new HashSet<>(Arrays.asList(ChoiceFiles.HEADER, SPECIAL)), backup.files.keySet());

        Set<String> installed = new HashSet<>(Settings.installed);
        installed.remove(SpecialContacts.KEY);
        ChoiceFiles.Result result = ChoiceFiles.restore(app, Settings.preferences, backup.files, installed);
        assertEquals(0, result.total);
        assertEquals("The header's copy turns down what isn't a picture", 1, result.damaged);
        assertEquals("Special contacts isn't installed", 1, result.unavailable);
        assertFalse(HomeHeader.file(app).exists());
        assertFalse(HomeHeaderPicture.partial(HomeHeader.file(app)).exists());
        result = ChoiceFiles.restore(app, Settings.preferences, backup.files, Settings.installed);
        assertEquals("A list that names nobody is damaged too", 2, result.damaged);
        String[] kept = new File(SpecialContacts.folder(app), ACCOUNT).list();
        assertTrue("A list nobody can read follows nobody", kept == null || kept.length == 0);

        Map<String, byte[]> big = new LinkedHashMap<>();
        big.put(ChoiceFiles.TEXT, text.getBytes(StandardCharsets.UTF_8));
        big.put(ChoiceFiles.HEADER, new byte[ChoiceFiles.MAX_PICTURE + 1]);
        assertThrows(ChoiceCodec.TooLarge.class, () -> ChoiceFiles.unzip(new ByteArrayInputStream(zip(big))));
        Map<String, byte[]> many = new LinkedHashMap<>();
        many.put(ChoiceFiles.TEXT, text.getBytes(StandardCharsets.UTF_8));
        for (int index = 0; index < ChoiceFiles.MAX_ENTRIES; index++) many.put("extra-" + index, new byte[0]);
        assertThrows(ChoiceCodec.TooLarge.class, () -> ChoiceFiles.unzip(new ByteArrayInputStream(zip(many))));
        Map<String, byte[]> noText = new LinkedHashMap<>();
        noText.put(ChoiceFiles.HEADER, png(8, 8, Color.RED));
        assertThrows(IllegalArgumentException.class, () -> ChoiceFiles.unzip(new ByteArrayInputStream(zip(noText))));
        byte[] whole = zip(entries);
        byte[] cut = Arrays.copyOf(whole, whole.length / 2);
        assertThrows(IllegalArgumentException.class, () -> ChoiceFiles.unzip(new ByteArrayInputStream(cut)));
    }

    @Test public void saveMakesAZipOnlyWithFilesAndReadPutsThemBack() throws Exception {
        copyPicture(png(600, 150, Color.RED), HomeHeader.file(app), HomeHeaderPicture.MAX_WIDTH, HomeHeaderPicture.MAX_HEIGHT);
        byte[] header = Files.readAllBytes(HomeHeader.file(app).toPath());
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            SettingsActivity activity = screen.get();
            activity.getWindow().getDecorView().findViewWithTag("save_choices_file").performClick();
            var request = Shadows.shadowOf(activity).getNextStartedActivityForResult();
            assertEquals("application/zip", request.intent.getType());
            assertEquals("HushMessenger-choices.zip", request.intent.getStringExtra(Intent.EXTRA_TITLE));
            Uri saved = Uri.parse("content://choices/export");
            ByteArrayOutputStream output = new ByteArrayOutputStream();
            Shadows.shadowOf(activity.getContentResolver()).registerOutputStream(saved, output);
            activity.onActivityResult(request.requestCode, Activity.RESULT_OK, new Intent().setData(saved));
            awaitToast("Choices file saved");
            byte[] zip = output.toByteArray();
            assertTrue(ChoiceFiles.isZip(zip, zip.length));

            assertTrue(HomeHeaderPicture.remove(HomeHeader.file(app)));
            activity.getWindow().getDecorView().findViewWithTag("read_choices_file").performClick();
            request = Shadows.shadowOf(activity).getNextStartedActivityForResult();
            assertEquals("*/*", request.intent.getType());
            assertTrue(Arrays.asList(request.intent.getStringArrayExtra(Intent.EXTRA_MIME_TYPES)).containsAll(
                Arrays.asList("text/*", "application/zip")));
            Uri read = Uri.parse("content://choices/import");
            Shadows.shadowOf(activity.getContentResolver()).registerInputStream(read, new ByteArrayInputStream(zip));
            activity.onActivityResult(SettingsActivity.READ_CHOICES, Activity.RESULT_OK, new Intent().setData(read));
            awaitToast("Restored 1 of ");
            assertArrayEquals(header, Files.readAllBytes(HomeHeader.file(app).toPath()));
        }
        // With no file-backed choice left, Save writes the plain text it always did.
        clearFiles(app);
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            screen.get().getWindow().getDecorView().findViewWithTag("save_choices_file").performClick();
            var request = Shadows.shadowOf(screen.get()).getNextStartedActivityForResult();
            assertEquals("text/plain", request.intent.getType());
            assertEquals("HushMessenger-choices.txt", request.intent.getStringExtra(Intent.EXTRA_TITLE));
        }
    }

    private static void copyPicture(byte[] picture, File target, int maxWidth, int maxHeight) throws Exception {
        HomeHeaderPicture.copy(new ByteArrayInputStream(picture), target, () -> true, maxWidth, maxHeight, () -> { });
    }

    private static void write(File file, byte[] bytes) throws Exception {
        File parent = file.getParentFile();
        assertTrue(parent.mkdirs() || parent.isDirectory());
        Files.write(file.toPath(), bytes);
    }

    private static byte[] png(int width, int height, int color) {
        return encode(width, height, color, Bitmap.CompressFormat.PNG);
    }

    private static byte[] jpeg(int width, int height, int color) {
        byte[] bytes = encode(width, height, color, Bitmap.CompressFormat.JPEG);
        BitmapFactory.Options bounds = new BitmapFactory.Options();
        bounds.inJustDecodeBounds = true;
        BitmapFactory.decodeByteArray(bytes, 0, bytes.length, bounds);
        assertEquals("image/jpeg", bounds.outMimeType);
        return bytes;
    }

    private static byte[] encode(int width, int height, int color, Bitmap.CompressFormat format) {
        Bitmap pixels = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888);
        try {
            pixels.eraseColor(color);
            ByteArrayOutputStream bytes = new ByteArrayOutputStream();
            assertTrue(pixels.compress(format, 90, bytes));
            return bytes.toByteArray();
        } finally {
            pixels.recycle();
        }
    }

    private static byte[] zip(Map<String, byte[]> entries) throws Exception {
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

    private static void awaitToast(String prefix) throws InterruptedException {
        long deadline = System.currentTimeMillis() + 10_000;
        do {
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            String toast = ShadowToast.getTextOfLatestToast();
            if (toast != null && toast.startsWith(prefix)) return;
            Thread.sleep(20);
        } while (System.currentTimeMillis() < deadline);
        fail("Missing result: " + prefix + "; latest toast: " + ShadowToast.getTextOfLatestToast());
    }
}
