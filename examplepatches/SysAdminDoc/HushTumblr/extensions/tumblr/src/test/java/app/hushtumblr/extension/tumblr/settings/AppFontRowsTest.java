/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.settings;

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
import java.util.EnumSet;

import app.hushtumblr.extension.shared.SettingsContextRule;
import app.hushtumblr.extension.shared.Utils;
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
            assertEquals("Font file saved. Turn on App font to use it.", ShadowToast.getTextOfLatestToast());
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

            assertEquals("Font file saved.", ShadowToast.getTextOfLatestToast());
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

            assertEquals("That isn't a font file. Nothing changed.", ShadowToast.getTextOfLatestToast());
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

            assertEquals("Couldn't read that file. Try again.", ShadowToast.getTextOfLatestToast());
            assertEquals("", TextSettings.APP_FONT_FILE.savedValue());
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
            assertEquals("", TextSettings.APP_FONT_FILE.savedValue());
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
            assertEquals("Back to the phone's font.", ShadowToast.getTextOfLatestToast());
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
}
