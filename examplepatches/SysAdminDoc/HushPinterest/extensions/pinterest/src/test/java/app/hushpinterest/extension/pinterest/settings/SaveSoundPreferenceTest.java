/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.settings;

import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.Intent;
import android.content.UriPermission;
import android.database.Cursor;
import android.database.MatrixCursor;
import android.net.Uri;
import android.provider.OpenableColumns;
import android.widget.ListView;

import java.util.ArrayList;
import java.util.List;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import org.robolectric.shadows.ShadowActivity;
import org.robolectric.shadows.ShadowAlertDialog;
import org.robolectric.shadows.ShadowContentResolver;
import org.robolectric.shadows.ShadowLooper;
import org.robolectric.shadows.ShadowToast;

import app.hushpinterest.extension.pinterest.NativeDialogCapture;
import app.hushpinterest.extension.pinterest.ui.SaveSound;
import app.hushpinterest.extension.shared.SettingsContextRule;

/** #41: Pick a save sound, through Android's file picker and back. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
@SuppressWarnings("deprecation")
public class SaveSoundPreferenceTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();
    private static final String NAMED = "com.android.providers.media.documents";
    private static final String NAMELESS = "com.example.sounds";
    private static final String FIRST_PICK = "Pick a sound file for Custom save sound to play when you save a pin.";

    @After public void reset() {
        SaveSound.PICKED.resetToDefault();
        SaveSound.NAME.resetToDefault();
        Settings.CUSTOM_SAVE_SOUND.resetToDefault();
    }

    private interface Check {
        void run(Activity activity, SaveSoundPreference row) throws Exception;
    }

    private static void onRow(Check check) throws Exception {
        // The media documents provider names its files, like the one the picker hands back on a phone.
        ShadowContentResolver.registerProviderInternal(NAMED, new NamedSounds());
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            HushPinterestPreferenceFragment page = SettingsL10nTest.pageOf(SettingsL10nTest.show(activity));
            check.run(activity, new SaveSoundPreference(page, activity));
        }
    }

    private static ShadowActivity.IntentForResult tap(Activity activity, SaveSoundPreference row) {
        row.getOnPreferenceClickListener().onPreferenceClick(row);
        ShadowLooper.idleMainLooper();
        return shadowOf(activity).getNextStartedActivityForResult();
    }

    private static void answer(Activity activity, ShadowActivity.IntentForResult started, int result, Uri sound) {
        shadowOf(activity).receiveResult(started.intent, result, sound == null ? null : new Intent().setData(sound));
        ShadowLooper.idleMainLooper();
    }

    private static Uri sound(String authority, String id) {
        return Uri.parse("content://" + authority + "/document/" + Uri.encode(id));
    }

    /** The files the app holds a lasting read grant for. */
    private static List<Uri> granted() {
        List<Uri> uris = new ArrayList<>();
        for (UriPermission permission : RuntimeEnvironment.getApplication().getContentResolver().getPersistedUriPermissions()) {
            uris.add(permission.getUri());
        }
        return uris;
    }

    @Test public void withNothingPickedATapOpensTheFilePickerForASound() throws Exception {
        onRow((activity, row) -> {
            assertEquals("action_save_sound", row.getKey());
            assertEquals("Pick a save sound", row.getTitle());
            assertEquals(FIRST_PICK, row.getSummary());
            ShadowActivity.IntentForResult started = tap(activity, row);
            assertNotNull("no picker opened", started);
            assertEquals(Intent.ACTION_OPEN_DOCUMENT, started.intent.getAction());
            assertEquals("audio/*", started.intent.getType());
            assertTrue(started.intent.getCategories().contains(Intent.CATEGORY_OPENABLE));
            assertTrue("the grant has to outlive a restart",
                    (started.intent.getFlags() & Intent.FLAG_GRANT_PERSISTABLE_URI_PERMISSION) != 0);
            assertEquals(SaveSoundPreference.PICK, started.requestCode);
        });
    }

    @Test public void aPickedSoundIsKeptNamedAndTurnsItsSwitchOn() throws Exception {
        onRow((activity, row) -> {
            Uri chime = sound(NAMED, "audio:41");
            answer(activity, tap(activity, row), Activity.RESULT_OK, chime);
            assertEquals(chime, SaveSound.picked());
            assertEquals("chime.mp3", SaveSound.name());
            assertTrue("the sound just picked is the one people expect to hear", Settings.CUSTOM_SAVE_SOUND.savedValue());
            assertEquals("the grant is kept for after a restart", List.of(chime), granted());
            assertEquals("Saving a pin will play chime.mp3.", ShadowToast.getTextOfLatestToast());
            assertEquals("Saving a pin plays chime.mp3. Tap to pick another sound or use Pinterest's again.", row.getSummary());

            Settings.CUSTOM_SAVE_SOUND.save(false);
            assertEquals("chime.mp3 is picked, but Custom save sound is off, so Pinterest's sound plays.", row.getSummary());
        });
    }

    @Test public void aCancelledPickerChangesNothingAndANamelessFileStillPlays() throws Exception {
        onRow((activity, row) -> {
            answer(activity, tap(activity, row), Activity.RESULT_CANCELED, null);
            assertNull(SaveSound.picked());
            assertFalse(Settings.CUSTOM_SAVE_SOUND.savedValue());
            assertNull("a cancelled picker says nothing", ShadowToast.getTextOfLatestToast());
            assertEquals(FIRST_PICK, row.getSummary());

            Uri nameless = sound(NAMELESS, "7");
            answer(activity, tap(activity, row), Activity.RESULT_OK, nameless);
            assertEquals(nameless, SaveSound.picked());
            assertNull(SaveSound.name());
            assertEquals("Saving a pin will play the sound you picked.", ShadowToast.getTextOfLatestToast());
            assertEquals("Saving a pin plays the sound you picked. Tap to pick another sound or use Pinterest's again.",
                    row.getSummary());
            Settings.CUSTOM_SAVE_SOUND.save(false);
            assertEquals("A sound is picked, but Custom save sound is off, so Pinterest's sound plays.", row.getSummary());
        });
    }

    @Test public void theMenuPicksAnotherSoundOrGoesBackToPinterests() throws Exception {
        onRow((activity, row) -> {
            Uri chime = sound(NAMED, "audio:41");
            answer(activity, tap(activity, row), Activity.RESULT_OK, chime);

            row.getOnPreferenceClickListener().onPreferenceClick(row);
            AlertDialog menu = ShadowAlertDialog.getLatestAlertDialog();
            assertNotNull("no menu", menu);
            ListView items = menu.getListView();
            assertEquals("Pick another sound", items.getAdapter().getItem(0).toString());
            assertEquals("Use Pinterest's sound again", items.getAdapter().getItem(1).toString());
            shadowOf(menu).clickOnItem(0);
            ShadowLooper.idleMainLooper();
            ShadowActivity.IntentForResult started = shadowOf(activity).getNextStartedActivityForResult();
            assertNotNull("the menu opened no picker", started);
            Uri bell = sound(NAMED, "audio:42");
            answer(activity, started, Activity.RESULT_OK, bell);
            assertEquals(bell, SaveSound.picked());
            assertEquals("the old sound's grant is given back", List.of(bell), granted());

            row.getOnPreferenceClickListener().onPreferenceClick(row);
            menu = ShadowAlertDialog.getLatestAlertDialog();
            shadowOf(menu).clickOnItem(1);
            ShadowLooper.idleMainLooper();
            assertNull(SaveSound.picked());
            assertNull(SaveSound.name());
            assertTrue("nothing is held for a sound that's no longer used", granted().isEmpty());
            assertEquals("Saving a pin will play Pinterest's sound again.", ShadowToast.getTextOfLatestToast());
            assertNull("going back opened no picker", shadowOf(activity).getNextStartedActivityForResult());
            assertEquals(FIRST_PICK, row.getSummary());
        });
    }

    @Test @GraphicsMode(GraphicsMode.Mode.NATIVE)
    @Config(qualifiers = "en-rUS-w390dp-h844dp-night-xhdpi")
    public void nativeSoundChoicesStayReadableAndCancelKeepsThePickedSound() throws Exception {
        Uri chime = sound(NAMED, "audio:41");
        SaveSound.PICKED.save(chime.toString());
        SaveSound.NAME.save("A very long sound file name from the phone's ringtones folder.ogg");
        onRow((activity, row) -> {
            row.getOnPreferenceClickListener().onPreferenceClick(row);
            ShadowLooper.idleMainLooper();
            AlertDialog menu = ShadowAlertDialog.getLatestAlertDialog();
            assertNotNull(menu);
            assertEquals(2, menu.getListView().getAdapter().getCount());
            assertEquals("Cancel", menu.getButton(AlertDialog.BUTTON_NEGATIVE).getText().toString());
            SettingsDialog settings = (SettingsDialog) activity.getFragmentManager().findFragmentByTag("hushpinterest_settings");
            NativeDialogCapture.capture("save-sound-choices", settings.getView(), menu);
            menu.getButton(AlertDialog.BUTTON_NEGATIVE).performClick();
            ShadowLooper.idleMainLooper();
            assertFalse(menu.isShowing());
            assertEquals(chime, SaveSound.picked());
            assertNull("Cancel opened a picker", shadowOf(activity).getNextStartedActivityForResult());
        });
    }

    /** Answers the picker's display-name question for every file: chime.mp3, or bell.ogg for audio:42. */
    private static final class NamedSounds extends ContentProvider {
        @Override public boolean onCreate() {
            return true;
        }

        @Override public Cursor query(Uri uri, String[] projection, String selection, String[] args, String order) {
            MatrixCursor cursor = new MatrixCursor(new String[]{OpenableColumns.DISPLAY_NAME});
            cursor.addRow(new Object[]{uri.getLastPathSegment().equals("audio:42") ? "bell.ogg" : "chime.mp3"});
            return cursor;
        }

        @Override public String getType(Uri uri) {
            return "audio/mpeg";
        }

        @Override public Uri insert(Uri uri, ContentValues values) {
            return null;
        }

        @Override public int delete(Uri uri, String selection, String[] args) {
            return 0;
        }

        @Override public int update(Uri uri, ContentValues values, String selection, String[] args) {
            return 0;
        }
    }
}
