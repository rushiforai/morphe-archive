/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.settings;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import static org.robolectric.Shadows.shadowOf;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.preference.Preference;
import android.widget.ListView;

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
import org.robolectric.shadows.ShadowAlertDialog;
import org.robolectric.shadows.ShadowLooper;
import org.robolectric.shadows.ShadowToast;

import java.io.File;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.EnumSet;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

import app.hushtumblr.extension.shared.SettingsContextRule;
import app.hushtumblr.extension.shared.Utils;
import app.hushtumblr.extension.shared.settings.FailingStore;
import app.hushtumblr.extension.shared.settings.preference.AbstractPreferenceFragment;
import app.hushtumblr.extension.tumblr.ui.AppFont;

/** #7: the rows that choose a font file, and the one that goes back to the phone's font. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class AppFontRowsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final String AUTHORITY = "font-rows-test";
    private static final String FILE_ROW = HushTumblrPreferenceFragment.FONT_FILE_ROW;
    private static final String PHONE_ROW = HushTumblrPreferenceFragment.PHONE_FONT_ROW;

    @Before
    public void startClean() {
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        PatchFamily.capabilitiesForTests = null;
        ShadowToast.reset();
        ShadowAlertDialog.reset();
        SettingsFileProvider.install(AUTHORITY);
        SettingsFileProvider.displayName = null;
    }

    @After
    public void restore() throws Exception {
        settle();
        AppFont.forget(RuntimeEnvironment.getApplication());
        Settings.APP_FONT.resetToDefault();
        TextSettings.APP_FONT_FILE.resetToDefault();
        AbstractPreferenceFragment.restartPending.clear();
        SettingsFileProvider.displayName = null;
        PatchFamily.inBuildForTests = null;
    }

    @Test
    public void aTapOpensAFilePickerThatOffersEveryFile() {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushTumblrPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));

            ShadowActivity.IntentForResult started = tap(activity, page);

            assertEquals(HushTumblrPreferenceFragment.FONT_FILE, started.requestCode);
            assertEquals(Intent.ACTION_OPEN_DOCUMENT, started.intent.getAction());
            assertTrue(started.intent.hasCategory(Intent.CATEGORY_OPENABLE));
            assertEquals("a font's type depends on the app holding it", "*/*", started.intent.getType());
        }
    }

    @Test
    public void aPickedFontIsSavedAndItsRowNamesIt() throws Exception {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushTumblrPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            assertFalse("nothing to forget yet", page.findPreference(PHONE_ROW).isEnabled());
            assertTrue(String.valueOf(page.findPreference(FILE_ROW).getSummary()).contains("phone's font"));

            SettingsFileProvider.displayName = "Inter.ttf";
            pick(activity, page, "a", font());

            assertEquals("Inter.ttf", AppFont.shownName(TextSettings.APP_FONT_FILE.savedValue()));
            assertTrue(chosenFile().isFile());
            assertTrue(String.valueOf(page.findPreference(FILE_ROW).getSummary()).contains("Inter.ttf"));
            assertTrue(page.findPreference(PHONE_ROW).isEnabled());
            assertEquals("Font file saved. Turn on App font to use it.", SettingsFeedbackTest.message(page.findPreference(FILE_ROW)));
            assertNull(ShadowToast.getTextOfLatestToast());
            assertFalse("the switch is off, so nothing's waiting on a restart",
                    AbstractPreferenceFragment.restartPending.contains(TextSettings.APP_FONT_FILE.key));
        }
    }

    @Test
    public void withTheSwitchOnAPickWaitsForARestart() throws Exception {
        Settings.APP_FONT.save(true);
        AbstractPreferenceFragment.restartPending.clear();
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            SettingsDialog dialog = SettingsL10nTest.show(activity);
            HushTumblrPreferenceFragment page = SettingsL10nTest.pageOf(dialog);

            pick(activity, page, "a", font());

            // The note under the row says the pick waits for a restart, where it stays to be read.
            assertEquals("Font file saved.\nRestart Tumblr to apply this change.",
                    SettingsFeedbackTest.message(page.findPreference(FILE_ROW)));
            assertTrue(AbstractPreferenceFragment.restartPending.contains(TextSettings.APP_FONT_FILE.key));
            assertTrue("the restart row", showsRestartRow(dialog));
        }
    }

    private static boolean showsRestartRow(SettingsDialog dialog) {
        ListView list = dialog.getView().findViewById(android.R.id.list);
        for (int i = 0; i < list.getCount(); i++) {
            Object item = list.getItemAtPosition(i);
            if (item instanceof Preference && SettingsNavigation.RESTART.equals(((Preference) item).getKey())) return true;
        }
        return false;
    }

    @Test
    public void somethingElseIsRefusedAndTheFontInUseStays() throws Exception {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushTumblrPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            pick(activity, page, "a", font());
            String saved = TextSettings.APP_FONT_FILE.savedValue();

            pick(activity, page, "b", "not a font at all".getBytes(StandardCharsets.UTF_8));

            assertEquals("That isn't a font file. Nothing changed.", SettingsFeedbackTest.message(page.findPreference(FILE_ROW)));
            assertEquals(saved, TextSettings.APP_FONT_FILE.savedValue());
            assertTrue(chosenFile().isFile());
        }
    }

    @Test
    public void aFileThatWontOpenSaysSo() throws Exception {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushTumblrPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));

            deliver(activity, tap(activity, page), Uri.parse("content://" + AUTHORITY + "/never-written"));

            assertEquals("Couldn't read that file. Try again.", SettingsFeedbackTest.message(page.findPreference(FILE_ROW)));
            assertEquals("", TextSettings.APP_FONT_FILE.savedValue());
        }
    }

    /** Seen with Tumblr's settings file read-only: the new file took the old one's place under the old name. */
    @Test
    public void aRefusedSaveKeepsTheFontInUseAndSaysTheFontDidntChange() throws Exception {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushTumblrPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            pick(activity, page, "a", font());
            String saved = TextSettings.APP_FONT_FILE.savedValue();

            try (FailingStore ignored = FailingStore.install(FailingStore.Fault.COMMIT_FALSE)) {
                pick(activity, page, "b", otherFont());
            }

            assertEquals("Couldn't change the font. Try again.", SettingsFeedbackTest.message(page.findPreference(FILE_ROW)));
            assertEquals(saved, TextSettings.APP_FONT_FILE.savedValue());
            assertArrayEquals("the refused file took the place of the one in use", font(), Files.readAllBytes(chosenFile().toPath()));
            assertFalse(new File(chosenFile().getParentFile(), "font.incoming").exists());
        }
    }

    @Test
    public void aFirstPickWhoseSaveIsRefusedLeavesNoFileBehind() throws Exception {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushTumblrPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));

            try (FailingStore ignored = FailingStore.install(FailingStore.Fault.COMMIT_FALSE)) {
                pick(activity, page, "a", font());
            }

            assertEquals("Couldn't change the font. Try again.", SettingsFeedbackTest.message(page.findPreference(FILE_ROW)));
            assertEquals("", TextSettings.APP_FONT_FILE.savedValue());
            assertFalse(chosenFile().exists());
            assertFalse(new File(chosenFile().getParentFile(), "font.incoming").exists());
        }
    }

    /** The name is saved before the file moves, so a move that fails takes the old name back. */
    @Test
    public void aFileThatCantTakeThePlaceOfTheOldOneKeepsTheOldName() throws Exception {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushTumblrPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            pick(activity, page, "a", font());
            String saved = TextSettings.APP_FONT_FILE.savedValue();
            File inUse = chosenFile();
            assertTrue(inUse.delete());
            assertTrue(new File(inUse, "blocker").mkdirs());

            pick(activity, page, "b", otherFont());

            assertEquals("Couldn't change the font. Try again.", SettingsFeedbackTest.message(page.findPreference(FILE_ROW)));
            assertEquals(saved, TextSettings.APP_FONT_FILE.savedValue());
            assertFalse(new File(inUse.getParentFile(), "font.incoming").exists());
            assertTrue(new File(inUse, "blocker").delete());
            assertTrue(inUse.delete());
        }
    }

    /**
     * Picks shared the staged file, so one that finished while an earlier one was still copying
     * could save its name over a file the earlier one went on writing. The later pick waits now.
     */
    @Test
    public void aSecondPickWaitsForTheFirstAndTheLaterOneStays() throws Exception {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushTumblrPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            Uri first = SettingsFileProvider.put(AUTHORITY, "a", font());
            Uri second = SettingsFileProvider.put(AUTHORITY, "b", otherFont());
            CountDownLatch held = new CountDownLatch(1);
            SettingsFileProvider.stall = held;
            // Real workers. An earlier test can leave picks running on this thread.
            java.util.function.Consumer<Runnable> worker = HushTumblrPreferenceFragment.editWorkerForTests;
            HushTumblrPreferenceFragment.editWorkerForTests = null;
            try {
                shadowOf(activity).receiveResult(tap(activity, page).intent, Activity.RESULT_OK, new Intent().setData(first));
                assertTrue("the first pick never opened its file", SettingsFileProvider.holding.tryAcquire(5, TimeUnit.SECONDS));
                // Only the first open is held. The second pick's file opens at once.
                SettingsFileProvider.stall = null;
                shadowOf(activity).receiveResult(tap(activity, page).intent, Activity.RESULT_OK, new Intent().setData(second));
                long deadline = System.nanoTime() + TimeUnit.MILLISECONDS.toNanos(300);
                while (System.nanoTime() < deadline && TextSettings.APP_FONT_FILE.persistedValue().isEmpty()) Thread.sleep(10);
                assertEquals("the second pick saved while the first was still under way", "", TextSettings.APP_FONT_FILE.persistedValue());
            } finally {
                SettingsFileProvider.stall = null;
                held.countDown();
                settle();
                HushTumblrPreferenceFragment.editWorkerForTests = worker;
            }

            assertEquals("Font file saved. Turn on App font to use it.", SettingsFeedbackTest.message(page.findPreference(FILE_ROW)));
            assertArrayEquals("the earlier pick's file stayed", otherFont(), Files.readAllBytes(chosenFile().toPath()));
            assertFalse(new File(chosenFile().getParentFile(), "font.incoming").exists());
        }
    }

    /** A copy that can't be written here isn't the file's fault, and the row doesn't say it is. */
    @Test
    public void aCopyThatCantBeWrittenSaysTheFontDidntChange() throws Exception {
        File folder = chosenFile().getParentFile();
        assertTrue(folder.getParentFile().isDirectory() || folder.getParentFile().mkdirs());
        assertTrue("a file where the font folder goes", folder.createNewFile());
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushTumblrPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));

            pick(activity, page, "a", font());

            assertEquals("Couldn't change the font. Try again.", SettingsFeedbackTest.message(page.findPreference(FILE_ROW)));
            assertEquals("", TextSettings.APP_FONT_FILE.savedValue());
        } finally {
            assertTrue(folder.delete());
        }
    }

    @Test
    public void aCancelledPickChangesNothing() throws Exception {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushTumblrPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));

            shadowOf(activity).receiveResult(tap(activity, page).intent, Activity.RESULT_CANCELED, null);
            settle();

            assertNull(ShadowToast.getTextOfLatestToast());
            assertNull(SettingsFeedbackTest.message(page.findPreference(FILE_ROW)));
            assertEquals("", TextSettings.APP_FONT_FILE.savedValue());
        }
    }

    /** With nothing on the phone to pick a file, the row says so and stays usable. */
    @Test
    public void aPhoneWithNoFilePickerSaysSoUnderTheRow() {
        org.robolectric.shadows.ShadowApplication application = shadowOf(RuntimeEnvironment.getApplication());
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushTumblrPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(controller.get()));
            application.checkActivities(true);
            Preference row = page.findPreference(FILE_ROW);
            SettingsL10nTest.openPageOf(page, FILE_ROW);
            row.getOnPreferenceClickListener().onPreferenceClick(row);
            ShadowLooper.idleMainLooper();
            assertEquals("This phone has no file picker, so there's no way to choose a file here.", SettingsFeedbackTest.message(row));
            assertNull(ShadowToast.getTextOfLatestToast());
            assertTrue(row.isEnabled());
        } finally {
            application.checkActivities(false);
        }
    }

    @Test
    public void thePhoneFontRowForgetsTheFile() throws Exception {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushTumblrPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            pick(activity, page, "a", font());

            Preference row = page.findPreference(PHONE_ROW);
            row.getOnPreferenceClickListener().onPreferenceClick(row);
            settle();

            assertEquals("", TextSettings.APP_FONT_FILE.savedValue());
            assertFalse(chosenFile().exists());
            assertFalse(row.isEnabled());
            assertEquals("Back to the phone's font.", SettingsFeedbackTest.message(row));
            assertNull("the file row still says a file was saved", SettingsFeedbackTest.message(page.findPreference(FILE_ROW)));
            assertTrue(String.valueOf(page.findPreference(FILE_ROW).getSummary()).contains("phone's font"));
        }
    }

    /** A settings file carries text, and the font it would name isn't on the next phone. */
    @Test
    public void aBackupLeavesTheChosenFileOut() {
        assertFalse(SettingsBackup.TEXT_ALLOWLIST.contains(TextSettings.APP_FONT_FILE));
    }

    private static ShadowActivity.IntentForResult tap(Activity activity, HushTumblrPreferenceFragment page) {
        Preference row = page.findPreference(FILE_ROW);
        assertNotNull("no such row", row);
        SettingsL10nTest.openPageOf(page, FILE_ROW);
        row.getOnPreferenceClickListener().onPreferenceClick(row);
        ShadowActivity.IntentForResult started = shadowOf(activity).getNextStartedActivityForResult();
        assertNotNull("no picker opened", started);
        return started;
    }

    private static void pick(Activity activity, HushTumblrPreferenceFragment page, String name, byte[] bytes) throws Exception {
        deliver(activity, tap(activity, page), SettingsFileProvider.put(AUTHORITY, name, bytes));
    }

    private static void deliver(Activity activity, ShadowActivity.IntentForResult started, Uri uri) throws Exception {
        shadowOf(activity).receiveResult(started.intent, Activity.RESULT_OK, new Intent().setData(uri));
        settle();
    }

    private static void settle() throws Exception {
        for (int round = 0; round < 3; round++) {
            Utils.awaitBackgroundTasksForTests();
            ShadowLooper.idleMainLooper();
        }
    }

    private static File chosenFile() {
        return new File(new File(RuntimeEnvironment.getApplication().getFilesDir(), "hushtumblr_font"), "font");
    }

    private static byte[] font() {
        byte[] whole = new byte[64];
        System.arraycopy("OTTO".getBytes(StandardCharsets.ISO_8859_1), 0, whole, 0, 4);
        return whole;
    }

    private static byte[] otherFont() {
        byte[] whole = font();
        whole[whole.length - 1] = 1;
        return whole;
    }
}
