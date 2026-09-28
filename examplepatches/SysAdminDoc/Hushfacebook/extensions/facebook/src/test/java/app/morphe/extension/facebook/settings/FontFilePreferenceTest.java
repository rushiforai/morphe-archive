/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.settings;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import static org.robolectric.Shadows.shadowOf;

import android.app.Activity;
import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.Intent;
import android.database.Cursor;
import android.database.MatrixCursor;
import android.net.Uri;
import android.preference.Preference;
import android.preference.PreferenceGroup;
import android.provider.OpenableColumns;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowActivity;
import org.robolectric.shadows.ShadowLooper;
import org.robolectric.shadows.ShadowToast;
import org.robolectric.util.ReflectionHelpers;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.EnumSet;
import java.util.List;

import app.morphe.extension.facebook.font.FontFile;
import app.morphe.extension.facebook.font.FontFileTest;
import app.morphe.extension.facebook.font.OwnFont;
import app.morphe.extension.shared.L10n;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.WorkerPoolForTests;
import app.morphe.extension.shared.settings.Setting;

/**
 * Font file and Use your phone's font under the Use the system font switch: the picker a tap opens,
 * the copy a picked font becomes, what's said when a file is turned down, and the way back.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
@SuppressWarnings("deprecation")
public class FontFilePreferenceTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before
    public void fontPatchIn() {
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.SYSTEM_FONT);
        ShadowToast.reset();
    }

    @After
    public void restore() throws Exception {
        settle();
        PatchFamily.inBuildForTests = null;
        Settings.FONT_SOURCE.resetToDefault();
        Settings.USE_SYSTEM_FONT.resetToDefault();
        OwnFont.fileChanged();
        File copy = copy();
        if (copy.exists()) assertTrue(copy.delete());
    }

    private static File copy() {
        return FontFile.file(RuntimeEnvironment.getApplication());
    }

    /** With nothing picked, the switch and Font file are there, and there's no way back to show. */
    @Test
    public void theAppearanceSectionHasTheSwitchAndTheFileRow() {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushfacebookPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(controller.get()));
            Preference toggle = page.findPreference(Settings.USE_SYSTEM_FONT.key);
            assertEquals("Use the system font", String.valueOf(toggle.getTitle()));
            Preference choose = page.findPreference(FontFilePreference.CHOOSE_KEY);
            assertEquals("Font file", String.valueOf(choose.getTitle()));
            assertEquals("None chosen, so your phone's font is used. Choose a TrueType or OpenType file of up to "
                    + "20 MB.", String.valueOf(choose.getSummary()));
            assertTrue(choose.isEnabled());
            assertNull("a way back to the phone's font with nothing picked",
                    page.findPreference(FontFilePreference.PHONE_FONT_KEY));
            assertEquals("", Settings.FONT_SOURCE.savedValue());
        }
    }

    /** With a file picked, the way back sits after Font file, in the same section. */
    @Test
    public void aPickedFileBringsTheWayBack() {
        Settings.FONT_SOURCE.save("Inter.ttf");
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushfacebookPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(controller.get()));
            Preference choose = page.findPreference(FontFilePreference.CHOOSE_KEY);
            Preference phone = page.findPreference(FontFilePreference.PHONE_FONT_KEY);
            assertNotNull(phone);
            assertEquals("Use your phone's font", String.valueOf(phone.getTitle()));
            assertEquals("Stops using the font file and goes back to your phone's font.", String.valueOf(phone.getSummary()));
            assertTrue(phone.isEnabled());
            assertEquals(choose.getParent(), phone.getParent());
            assertTrue("the way back comes before Font file", phone.getOrder() > choose.getOrder());
        }
    }

    /**
     * A file picked with the page open brings the way back right after Font file, ahead of the
     * emoji switch that shares the section, not at the section's end.
     */
    @Test
    public void aPickOnAnOpenPageBringsTheWayBackRightAfterFontFile() throws Exception {
        PatchFamily.inBuildForTests = EnumSet.of(PatchFamily.SYSTEM_FONT, PatchFamily.SYSTEM_EMOJI);
        byte[] rubik = FontFileTest.font(FontFileTest.STATIC_FONT);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushfacebookPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            assertNull(page.findPreference(FontFilePreference.PHONE_FONT_KEY));
            deliver(activity, tap(activity, page), "content://font-test/documents/Rubik-Regular.ttf", rubik);

            PreferenceGroup section = page.findPreference(FontFilePreference.CHOOSE_KEY).getParent();
            List<String> keys = new ArrayList<>();
            for (int i = 0; i < section.getPreferenceCount(); i++) keys.add(section.getPreference(i).getKey());
            assertEquals(Arrays.asList(Settings.USE_SYSTEM_FONT.key, FontFilePreference.CHOOSE_KEY,
                    FontFilePreference.PHONE_FONT_KEY, Settings.USE_SYSTEM_EMOJI.key), keys);
        }
    }

    @Test
    public void fontFileOpensThePickerForFonts() {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushfacebookPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            ShadowActivity.IntentForResult started = tap(activity, page);
            assertEquals(Intent.ACTION_OPEN_DOCUMENT, started.intent.getAction());
            assertEquals(FontFilePreference.PICK_FONT, started.requestCode);
            assertTrue(started.intent.hasCategory(Intent.CATEGORY_OPENABLE));
            assertEquals("*/*", started.intent.getType());
            List<String> types = Arrays.asList(started.intent.getStringArrayExtra(Intent.EXTRA_MIME_TYPES));
            for (String type : new String[]{"font/ttf", "font/otf", "font/collection", "application/octet-stream"}) {
                assertTrue(type + " isn't offered: " + types, types.contains(type));
            }
            assertTrue("the backup rows' codes are their own",
                    FontFilePreference.PICK_FONT != SettingsBackupPreference.IMPORT
                            && FontFilePreference.PICK_FONT != SettingsBackupPreference.EXPORT);
        }
    }

    /** A picked font is copied in, named after the file, and the rows say so. */
    @Test
    public void aPickedFontIsCopiedInAndNamed() throws Exception {
        byte[] rubik = FontFileTest.font(FontFileTest.STATIC_FONT);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushfacebookPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            deliver(activity, tap(activity, page), "content://font-test/documents/Rubik-Regular.ttf", rubik);

            assertEquals("Rubik-Regular.ttf", Settings.FONT_SOURCE.savedValue());
            assertArrayEquals(rubik, Files.readAllBytes(copy().toPath()));
            assertEquals("Font set to " + L10n.isolate("Rubik-Regular.ttf") + ". Restart Facebook to see it.",
                    ShadowToast.getTextOfLatestToast());
            Preference choose = page.findPreference(FontFilePreference.CHOOSE_KEY);
            assertEquals("Using " + L10n.isolate("Rubik-Regular.ttf") + ". Choose another file to replace it.",
                    String.valueOf(choose.getSummary()));
            assertTrue(choose.isEnabled());
            assertTrue(page.findPreference(FontFilePreference.PHONE_FONT_KEY).isEnabled());
        }
    }

    /** The provider's own name for the file wins over its address. */
    @Test
    public void theProvidersNameForTheFileIsUsed() throws Exception {
        Robolectric.setupContentProvider(NamingProvider.class, "font-names");
        byte[] rubik = FontFileTest.font(FontFileTest.STATIC_FONT);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushfacebookPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            deliver(activity, tap(activity, page), "content://font-names/document/msf%3A1234", rubik);
            assertEquals("Inter Variable.ttf", Settings.FONT_SOURCE.savedValue());
        }
    }

    /** Answers every name query with one display name, as a documents provider does. */
    public static final class NamingProvider extends ContentProvider {
        @Override
        public boolean onCreate() {
            return true;
        }

        @Override
        public Cursor query(Uri uri, String[] projection, String selection,
                            String[] selectionArgs, String sortOrder) {
            MatrixCursor cursor = new MatrixCursor(new String[]{OpenableColumns.DISPLAY_NAME});
            cursor.addRow(new Object[]{"Inter\u0000 Variable.ttf"});
            return cursor;
        }

        @Override
        public String getType(Uri uri) {
            return "font/ttf";
        }

        @Override
        public Uri insert(Uri uri, ContentValues values) {
            return null;
        }

        @Override
        public int delete(Uri uri, String selection, String[] selectionArgs) {
            return 0;
        }

        @Override
        public int update(Uri uri, ContentValues values, String selection,
                          String[] selectionArgs) {
            return 0;
        }
    }

    /** A photo picked by mistake changes nothing and says why; so does a file too large. */
    @Test
    public void aFileThatIsntAFontChangesNothing() throws Exception {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushfacebookPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            byte[] photo = {(byte) 0x89, 'P', 'N', 'G', 13, 10, 26, 10};
            deliver(activity, tap(activity, page), "content://font-test/photo.png", photo);
            assertEquals("That isn't a TrueType or OpenType font file. Your font didn't change.",
                    ShadowToast.getTextOfLatestToast());
            assertEquals("", Settings.FONT_SOURCE.savedValue());
            assertFalse(copy().exists());
            assertTrue(page.findPreference(FontFilePreference.CHOOSE_KEY).isEnabled());
            assertNull(page.findPreference(FontFilePreference.PHONE_FONT_KEY));
        }
        assertEquals("That font file is over 20 MB. Your font didn't change.",
                FontFilePreference.refusal(FontFile.Refusal.TOO_LARGE));
        assertEquals("Android couldn't draw with that font file. Your font didn't change.",
                FontFilePreference.refusal(FontFile.Refusal.WONT_LOAD));
        assertEquals("Couldn't open that file. Your font didn't change.",
                FontFilePreference.refusal(FontFile.Refusal.UNREADABLE));
        assertEquals("Couldn't save a copy of that font. Check that the phone has room, then try again.",
                FontFilePreference.refusal(FontFile.Refusal.NOT_SAVED));
    }

    /** Use your phone's font takes the copy away, and there's nothing for it to do after. */
    @Test
    public void useYourPhonesFontTakesTheCopyAway() throws Exception {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushfacebookPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            deliver(activity, tap(activity, page), "content://font-test/Rubik-Regular.ttf",
                    FontFileTest.font(FontFileTest.STATIC_FONT));
            assertTrue(copy().exists());

            Preference phone = page.findPreference(FontFilePreference.PHONE_FONT_KEY);
            assertTrue(((FontFilePreference) phone).actsOnTap());
            phone.getOnPreferenceClickListener().onPreferenceClick(phone);
            settle();
            assertNull("going back to the phone's font opened something", shadowOf(activity).getNextStartedActivityForResult());
            assertEquals("", Settings.FONT_SOURCE.savedValue());
            assertFalse(copy().exists());
            assertEquals("Back to your phone's font. Restart Facebook to see it.", ShadowToast.getTextOfLatestToast());
            assertNull("the way back stayed with nothing to go back from",
                    page.findPreference(FontFilePreference.PHONE_FONT_KEY));
            assertEquals(FontFilePreference.chosenSummary("", false),
                    String.valueOf(page.findPreference(FontFilePreference.CHOOSE_KEY).getSummary()));
        }
    }

    /**
     * A pick whose name can't be saved changes nothing: the copy, the name, the row and the message
     * all stay with the font picked before. For that pick the preferences file's folder is swapped
     * for a plain file, so Android can't write the name.
     */
    @Test
    public void aPickWhoseNameWontSaveChangesNothing() throws Exception {
        byte[] rubik = FontFileTest.font(FontFileTest.STATIC_FONT);
        byte[] khmer = FontFileTest.font(FontFileTest.VARIABLE_FONT);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushfacebookPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            deliver(activity, tap(activity, page), "content://font-test/documents/Rubik-Regular.ttf", rubik);
            assertEquals("Rubik-Regular.ttf", Settings.FONT_SOURCE.savedValue());

            File stored = ReflectionHelpers.getField(Setting.preferences.preferences, "mFile");
            File folder = stored.getParentFile();
            File aside = new File(folder.getParentFile(), folder.getName() + ".aside");
            assertTrue(folder.renameTo(aside));
            assertTrue(folder.createNewFile());
            try {
                deliver(activity, tap(activity, page), "content://font-test/documents/NotoSansKhmer-VF.ttf", khmer);
            } finally {
                assertTrue(folder.delete());
                assertTrue(aside.renameTo(folder));
            }

            assertEquals("Couldn't save a copy of that font. Check that the phone has room, then try again.",
                    ShadowToast.getTextOfLatestToast());
            assertEquals("Rubik-Regular.ttf", Settings.FONT_SOURCE.savedValue());
            assertArrayEquals("the copy moved on without its name", rubik, Files.readAllBytes(copy().toPath()));
            assertEquals("Using " + L10n.isolate("Rubik-Regular.ttf") + ". Choose another file to replace it.",
                    String.valueOf(page.findPreference(FontFilePreference.CHOOSE_KEY).getSummary()));
            assertTrue(page.findPreference(FontFilePreference.PHONE_FONT_KEY).isEnabled());
        }
    }

    /** A copy no name points at, one a removal couldn't delete, can still be taken away. */
    @Test
    public void aCopyNoNamePointsAtCanStillBeTakenAway() throws Exception {
        File copy = copy();
        Files.write(copy.toPath(), FontFileTest.font(FontFileTest.STATIC_FONT));
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushfacebookPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(controller.get()));
            assertEquals(FontFilePreference.chosenSummary("", true),
                    String.valueOf(page.findPreference(FontFilePreference.CHOOSE_KEY).getSummary()));
            Preference phone = page.findPreference(FontFilePreference.PHONE_FONT_KEY);
            assertNotNull("no way to take away a copy no name points at", phone);
            assertTrue(phone.isEnabled());

            phone.getOnPreferenceClickListener().onPreferenceClick(phone);
            settle();
            assertFalse(copy.exists());
            assertEquals("", Settings.FONT_SOURCE.savedValue());
            assertEquals("Back to your phone's font. Restart Facebook to see it.", ShadowToast.getTextOfLatestToast());
            assertNull(page.findPreference(FontFilePreference.PHONE_FONT_KEY));
        }
    }

    /** A copy that went missing is said, and the phone's font is what's drawn. */
    @Test
    public void aCopyThatWentMissingIsSaid() throws Exception {
        Settings.FONT_SOURCE.save("Inter.ttf");
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushfacebookPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(controller.get()));
            assertEquals("Hushfacebook's copy of " + L10n.isolate("Inter.ttf")
                            + " is gone, so your phone's font is used. Choose the file again.",
                    String.valueOf(page.findPreference(FontFilePreference.CHOOSE_KEY).getSummary()));
            assertTrue("the way back is out of reach", page.findPreference(FontFilePreference.PHONE_FONT_KEY).isEnabled());
        }
    }

    @Test
    public void aCancelledPickerChangesNothing() throws Exception {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushfacebookPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            ShadowActivity.IntentForResult started = tap(activity, page);
            shadowOf(activity).receiveResult(started.intent, Activity.RESULT_CANCELED, null);
            settle();
            assertNull(ShadowToast.getTextOfLatestToast());
            assertEquals("", Settings.FONT_SOURCE.savedValue());
            assertTrue(page.findPreference(FontFilePreference.CHOOSE_KEY).isEnabled());
        }
    }

    /** A full worker queue copies nothing, says so, and leaves the rows usable for another try. */
    @Test
    public void aFullWorkerQueueLeavesTheRowsUsable() throws Exception {
        byte[] rubik = FontFileTest.font(FontFileTest.STATIC_FONT);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushfacebookPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            Uri uri = Uri.parse("content://font-test/queued.ttf");
            shadowOf(RuntimeEnvironment.getApplication().getContentResolver())
                    .registerInputStreamSupplier(uri, () -> new ByteArrayInputStream(rubik));
            ShadowActivity.IntentForResult started = tap(activity, page);
            try (WorkerPoolForTests full = WorkerPoolForTests.fill()) {
                shadowOf(activity).receiveResult(started.intent, Activity.RESULT_OK, new Intent().setData(uri));
                ShadowLooper.idleMainLooper();
                assertEquals("Couldn't start that. Try again in a moment.", ShadowToast.getTextOfLatestToast());
                assertTrue(page.findPreference(FontFilePreference.CHOOSE_KEY).isEnabled());
                assertEquals(FontFilePreference.chosenSummary("", false),
                        String.valueOf(page.findPreference(FontFilePreference.CHOOSE_KEY).getSummary()));
            }
            settle();
            assertFalse(copy().exists());
            deliver(activity, tap(activity, page), "content://font-test/again/Rubik-Regular.ttf", rubik);
            assertEquals("Rubik-Regular.ttf", Settings.FONT_SOURCE.savedValue());
        }
    }

    @Test
    public void aFileNameIsShownOnOneCleanLine() {
        assertEquals("Inter.ttf", FontFilePreference.cleanName("  Inter.ttf \n"));
        assertEquals("My Font.otf", FontFilePreference.cleanName("My\u0000 ‮Font.otf"));
        assertEquals("font", FontFilePreference.cleanName(""));
        assertEquals("font", FontFilePreference.cleanName(null));
        assertEquals("font", FontFilePreference.cleanName("​\u0007"));
        StringBuilder longName = new StringBuilder();
        for (int i = 0; i < 30; i++) longName.append("𝐀bc");
        String shown = FontFilePreference.cleanName(longName.toString());
        assertEquals(FontFilePreference.MAX_NAME_LENGTH, shown.codePointCount(0, shown.length()));
    }

    // ---- Helpers ----------------------------------------------------------------------------------

    private static ShadowActivity.IntentForResult tap(Activity activity, HushfacebookPreferenceFragment page) {
        Preference choose = page.findPreference(FontFilePreference.CHOOSE_KEY);
        assertNotNull("no Font file row", choose);
        choose.getOnPreferenceClickListener().onPreferenceClick(choose);
        ShadowActivity.IntentForResult started = shadowOf(activity).getNextStartedActivityForResult();
        assertNotNull("Font file opened no picker", started);
        return started;
    }

    /** Answers the picker with a file at [address] holding [bytes], and waits for what that sets off. */
    private static void deliver(Activity activity, ShadowActivity.IntentForResult started, String address,
                                byte[] bytes) throws Exception {
        Uri uri = Uri.parse(address);
        shadowOf(RuntimeEnvironment.getApplication().getContentResolver())
                .registerInputStreamSupplier(uri, () -> new ByteArrayInputStream(bytes));
        shadowOf(activity).receiveResult(started.intent, Activity.RESULT_OK, new Intent().setData(uri));
        settle();
    }

    private static void settle() throws Exception {
        for (int round = 0; round < 3; round++) {
            Utils.awaitBackgroundTasksForTests();
            ShadowLooper.idleMainLooper();
        }
    }
}
