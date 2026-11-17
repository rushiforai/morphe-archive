package app.hushmessenger.extension;

import android.app.Application;
import android.app.Notification;
import android.app.NotificationManager;
import android.content.ContentValues;
import android.content.Intent;
import android.net.Uri;
import android.provider.MediaStore;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowApplication;
import java.util.concurrent.TimeUnit;
import static org.junit.Assert.*;

/** #193: what happens to a call recording after it's saved, and which old ones go. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 36)
public class CallRecordingsTest {
    private Application app;

    @Before public void reset() {
        app = RuntimeEnvironment.getApplication();
        Settings.initialize(app);
        Settings.preferences.edit().clear().commit();
        CrashGuard.resetForTests();
        assertTrue("Record calls has to be a control the bundle carries", Settings.installed.contains(CallRecording.KEY));
    }

    private void allowNotifications() {
        ShadowApplication shadow = Shadows.shadowOf(app);
        shadow.grantPermissions(android.Manifest.permission.POST_NOTIFICATIONS);
    }

    private NotificationManager notifications() {
        return app.getSystemService(NotificationManager.class);
    }

    /** One row in MediaStore, [agoDays] days old, in [folder]. Returns its Uri. */
    private Uri row(String name, String folder, long agoDays) {
        ContentValues values = new ContentValues();
        values.put(MediaStore.MediaColumns.DISPLAY_NAME, name);
        // Robolectric's MediaStore only takes the types it has a media type for, and the tidy-up reads names, not types.
        values.put(MediaStore.MediaColumns.MIME_TYPE, "audio/mpeg");
        values.put(MediaStore.MediaColumns.RELATIVE_PATH, folder);
        Uri added = app.getContentResolver().insert(VoiceMessages.SharedAudio.collection(), values);
        assertNotNull("MediaStore took the row for " + name, added);
        return aged(added, agoDays);
    }

    /** Puts a date on a row. MediaStore stamps the moment it was added over anything handed to it, so this goes after. */
    private Uri aged(Uri row, long agoDays) {
        ContentValues when = new ContentValues();
        when.put(MediaStore.MediaColumns.DATE_ADDED,
            (System.currentTimeMillis() - TimeUnit.DAYS.toMillis(agoDays)) / 1000);
        assertEquals("Dating the row", 1, app.getContentResolver().update(row, when, null, null));
        return row;
    }

    private boolean stillThere(Uri item) {
        try (android.database.Cursor rows = app.getContentResolver().query(item, null, null, null, null)) {
            return rows != null && rows.getCount() > 0;
        }
    }

    @Test public void recordingsAreKeptForeverUntilADayCountIsPicked() {
        assertEquals(0, CallRecordings.keepDays());
        Settings.preferences.edit().putString(CallRecordings.KEEP, "30").commit();
        assertEquals(30, CallRecordings.keepDays());
    }

    @Test public void aDayCountNobodyCouldHavePickedKeepsThemAll() {
        for (String odd : new String[] {"", "x", "-7", "0", "4000"}) {
            Settings.preferences.edit().putString(CallRecordings.KEEP, odd).commit();
            assertEquals("Reading " + odd, 0, CallRecordings.keepDays());
        }
    }

    @Test public void theChoicesOfferAWeekAMonthAndThreeMonths() {
        assertEquals(java.util.Arrays.asList("0", "7", "30", "90"), CallRecordings.KEEP_CHOICES);
    }

    @Test public void nothingIsTakenAwayWhileRecordingsAreKeptForever() {
        Uri ancient = row("Call 2020-01-01 09.00.00.wav", CallRecording.SharedAudio.folder(), 900);
        assertEquals(0, CallRecordings.clean(app, System.currentTimeMillis()));
        assertTrue(stillThere(ancient));
    }

    @Test public void onlyTheRecordingsOlderThanTheDaysPickedGo() {
        Settings.preferences.edit().putString(CallRecordings.KEEP, "7").commit();
        String folder = CallRecording.SharedAudio.folder();
        Uri old = row("Call with Alex Kim 2026-10-01 09.00.00.wav", folder, 20);
        Uri justOld = row("Call 2026-11-09 09.00.00.wav", folder, 8);
        Uri recent = row("Call 2026-11-16 09.00.00.wav", folder, 1);
        assertEquals(2, CallRecordings.clean(app, System.currentTimeMillis()));
        assertFalse(stillThere(old));
        assertFalse(stillThere(justOld));
        assertTrue(stillThere(recent));
    }

    @Test public void nothingThisPatchDidntNameIsEverTakenAway() {
        Settings.preferences.edit().putString(CallRecordings.KEEP, "7").commit();
        String folder = CallRecording.SharedAudio.folder();
        Uri someoneElses = row("Interview 2026-10-01 09.00.00.m4a", folder, 60);
        Uri anotherFolder = row("Call 2026-10-01 09.00.00.wav", "Recordings/Voice Recorder", 60);
        Uri voiceMessage = row("Voice message x 0123456789ab.m4a", "Recordings/Messenger", 60);
        assertEquals(0, CallRecordings.clean(app, System.currentTimeMillis()));
        assertTrue(stillThere(someoneElses));
        assertTrue(stillThere(anotherFolder));
        assertTrue(stillThere(voiceMessage));
    }

    /** MediaStore writes the folder back with a slash on the end, which a phone's own rows carry and ours didn't. */
    @Test public void aFolderWrittenBackWithASlashIsTheSameFolder() {
        Settings.preferences.edit().putString(CallRecordings.KEEP, "7").commit();
        Uri old = row("Call 2026-10-01 09.00.00.wav", CallRecording.SharedAudio.folder() + "/", 60);
        assertEquals(1, CallRecordings.clean(app, System.currentTimeMillis()));
        assertFalse(stillThere(old));
    }

    @Test public void aStoreThatCantBeReadTakesNothingAndSaysNothing() {
        Settings.preferences.edit().putString(CallRecordings.KEEP, "7").commit();
        android.content.Context broken = new android.content.ContextWrapper(app) {
            @Override public android.content.ContentResolver getContentResolver() {
                throw new SecurityException("no access to the store");
            }
        };
        assertEquals(0, CallRecordings.clean(broken, System.currentTimeMillis()));
    }

    @Test public void theNotificationStaysOffUntilItsAskedFor() {
        allowNotifications();
        Settings.preferences.edit().putBoolean(CallRecording.KEY, true).commit();
        CallRecordings.saved(app, Uri.parse("content://media/external/audio/media/7"), "Call 2026-11-17 14.02.11.wav");
        assertTrue(Shadows.shadowOf(notifications()).getAllNotifications().isEmpty());
    }

    @Test public void itSaysWhichRecordingWasSavedAndOffersToShareIt() {
        allowNotifications();
        Settings.preferences.edit().putBoolean(CallRecording.KEY, true).putBoolean(CallRecordings.NOTIFY, true).commit();
        CallRecordings.saved(app, Uri.parse("content://media/external/audio/media/7"), "Call with Alex Kim 2026-11-17 14.02.11.wav");
        Notification posted = Shadows.shadowOf(notifications()).getNotification(193);
        assertNotNull(posted);
        assertEquals("Call recording saved", Shadows.shadowOf(posted).getContentTitle().toString());
        assertEquals("Call with Alex Kim 2026-11-17 14.02.11.wav", Shadows.shadowOf(posted).getContentText().toString());
        assertEquals(Notification.CATEGORY_STATUS, posted.category);
        assertNotNull(posted.contentIntent);
        assertEquals(1, posted.actions.length);
        assertEquals("Share", posted.actions[0].title.toString());
        assertNotNull(notifications().getNotificationChannel("hush_call_recordings"));
    }

    @Test public void aTapPlaysTheRecordingAndShareHandsItOver() {
        Uri recording = Uri.parse("content://media/external/audio/media/7");
        Intent playing = CallRecordings.play(recording, "audio/wav");
        assertEquals(Intent.ACTION_VIEW, playing.getAction());
        assertEquals(recording, playing.getData());
        assertEquals("audio/wav", playing.getType());
        assertTrue((playing.getFlags() & Intent.FLAG_GRANT_READ_URI_PERMISSION) != 0);
        Intent sharing = CallRecordings.send(recording, "audio/wav");
        assertEquals(Intent.ACTION_SEND, sharing.getAction());
        assertEquals(recording, sharing.getParcelableExtra(Intent.EXTRA_STREAM));
        assertEquals(recording, sharing.getClipData().getItemAt(0).getUri());
        assertTrue((sharing.getFlags() & Intent.FLAG_GRANT_READ_URI_PERMISSION) != 0);
    }

    @Test public void withNoNotificationPermissionNothingIsPosted() {
        Settings.preferences.edit().putBoolean(CallRecording.KEY, true).putBoolean(CallRecordings.NOTIFY, true).commit();
        CallRecordings.saved(app, Uri.parse("content://media/external/audio/media/7"), "Call 2026-11-17 14.02.11.wav");
        assertTrue(Shadows.shadowOf(notifications()).getAllNotifications().isEmpty());
    }

    @Test public void aRecordingThatWentNowhereIsNeverAnnounced() {
        allowNotifications();
        Settings.preferences.edit().putBoolean(CallRecording.KEY, true).putBoolean(CallRecordings.NOTIFY, true).commit();
        CallRecordings.saved(app, null, "Call 2026-11-17 14.02.11.wav");
        assertTrue(Shadows.shadowOf(notifications()).getAllNotifications().isEmpty());
    }

    @Test public void settingsOffersTheDaysAndAPickSaves() {
        Settings.preferences.edit().putBoolean(CallRecording.KEY, true).commit();
        try (var page = org.robolectric.Robolectric.buildActivity(SettingsActivity.class).setup()) {
            android.view.View root = page.get().getWindow().getDecorView();
            SettingsText text = new SettingsText(page.get());
            android.widget.RadioButton all = root.findViewWithTag("call_recording_keep_0");
            android.widget.RadioButton month = root.findViewWithTag("call_recording_keep_30");
            assertNotNull(all);
            assertNotNull(root.findViewWithTag("call_recording_keep_7"));
            assertNotNull(root.findViewWithTag("call_recording_keep_90"));
            assertTrue("Keeping them all to start with", all.isChecked());
            assertEquals(text.get("call_recording_keep_all"), all.getText().toString());
            assertEquals(text.get("call_recording_keep_days", "30"), month.getText().toString());

            month.performClick();
            org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();
            assertEquals("30", Settings.preferences.getString(CallRecordings.KEEP, null));
            assertEquals(30, CallRecordings.keepDays());
            assertTrue(month.isChecked());
            assertFalse(all.isChecked());
            assertNotNull("The switch for the notification sits with it", root.findViewWithTag(CallRecordings.NOTIFY));
        }
    }

    /** The rows sit inside the control's block, so searching their own words has to reach them. */
    @Test public void theNewRowsTurnUpInASearch() {
        Settings.preferences.edit().putBoolean(CallRecording.KEY, true).commit();
        try (var page = org.robolectric.Robolectric.buildActivity(SettingsActivity.class).setup()) {
            android.view.View root = page.get().getWindow().getDecorView();
            android.widget.EditText find = root.findViewWithTag("find_control");
            android.view.View nothing = root.findViewWithTag("empty_state");
            assertNotNull(find);
            for (String words : new String[] {"notify when a call is saved", "keep recordings", "for 30 days"}) {
                find.setText(words);
                org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();
                assertEquals("Searching " + words, android.view.View.GONE, nothing.getVisibility());
            }
            find.setText("nothing in here says this");
            org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();
            assertEquals(android.view.View.VISIBLE, nothing.getVisibility());
        }
    }

    @Test public void theRowsAreInSettingsWithTheirTranslations() {
        assertEquals("Keep recordings", SettingsText.ENGLISH.get("call_recording_keep"));
        assertEquals("Notify when a call is saved", SettingsText.ENGLISH.get(CallRecordings.NOTIFY));
        for (String id : new String[] {"call_recording_keep", "call_recording_keep_help", "call_recording_keep_all",
                "call_recording_keep_days", "call_recording_keep_picked", CallRecordings.NOTIFY, "call_recording_notify_help",
                "call_recording_saved_channel", "call_recording_saved_title", "call_recording_share"}) {
            assertNotNull("English " + id, SettingsText.ENGLISH.get(id));
        }
    }
}
