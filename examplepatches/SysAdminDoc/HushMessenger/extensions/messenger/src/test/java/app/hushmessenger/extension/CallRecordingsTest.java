package app.hushmessenger.extension;

import android.app.Application;
import android.app.Notification;
import android.app.NotificationManager;
import android.content.ContentValues;
import android.content.Intent;
import android.net.Uri;
import android.provider.MediaStore;
import java.io.IOException;
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
        Settings.hookErrors.clear();
        CrashGuard.resetForTests();
        CallRecording.resetForTests();
        // The codec list is the phone's own, so a test that adds an encoder mustn't leave it for the next one.
        org.robolectric.shadows.ShadowMediaCodecList.reset();
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

    /** Puts the app's own share screen on the phone, which is what a chat picker is reached through (#193). */
    private void withAShareScreen() throws android.content.IntentFilter.MalformedMimeTypeException {
        android.content.ComponentName screen =
            new android.content.ComponentName(app, "com.facebook.messenger.intents.ShareIntentHandler");
        android.content.IntentFilter takesAShare = new android.content.IntentFilter(Intent.ACTION_SEND);
        takesAShare.addCategory(Intent.CATEGORY_DEFAULT);
        takesAShare.addDataType("audio/*");
        Shadows.shadowOf(app.getPackageManager()).addActivityIfNotPresent(screen);
        Shadows.shadowOf(app.getPackageManager()).addIntentFilterForActivity(screen, takesAShare);
    }

    @Test public void aRecordingGoesStraightIntoAChatOfYourOwn() throws Exception {
        withAShareScreen();
        Uri recording = Uri.parse("content://media/external/audio/media/7");
        Intent toAChat = CallRecordings.toAChat(app, recording, "audio/wav");
        assertNotNull("The app itself takes the share", toAChat);
        assertEquals(Intent.ACTION_SEND, toAChat.getAction());
        assertEquals(app.getPackageName(), toAChat.getPackage());
        assertEquals(recording, toAChat.getParcelableExtra(Intent.EXTRA_STREAM));
        assertTrue((toAChat.getFlags() & Intent.FLAG_GRANT_READ_URI_PERMISSION) != 0);
        assertTrue((toAChat.getFlags() & Intent.FLAG_ACTIVITY_NEW_TASK) != 0);
    }

    @Test public void theNotificationOffersTheChatBeforeTheRestOfThePhone() throws Exception {
        withAShareScreen();
        allowNotifications();
        Settings.preferences.edit().putBoolean(CallRecording.KEY, true).putBoolean(CallRecordings.NOTIFY, true).commit();
        CallRecordings.saved(app, Uri.parse("content://media/external/audio/media/7"), "Call 2026-11-17 14.02.11.wav");
        Notification posted = Shadows.shadowOf(notifications()).getNotification(193);
        assertNotNull(posted);
        assertEquals(2, posted.actions.length);
        assertEquals("Send in a chat", posted.actions[0].title.toString());
        assertEquals("Share", posted.actions[1].title.toString());
    }

    @Test public void withNowhereToTakeAShareThereIsNoChatToSendTo() {
        assertNull(CallRecordings.toAChat(app, Uri.parse("content://media/external/audio/media/7"), "audio/wav"));
    }

    @Test public void aRecordingIsSentAsWhateverItWasWrittenAs() {
        assertEquals(VoiceMessages.Format.WAV, CallRecordings.formatOf("Call 2026-11-17 14.02.11.wav"));
        assertEquals(VoiceMessages.Format.OGG, CallRecordings.formatOf("Call 2026-11-17 14.02.11.ogg"));
        assertEquals(VoiceMessages.Format.WAV, CallRecordings.formatOf(null));
        // The format under the switch has moved on since, and the file that's already written hasn't.
        Settings.preferences.edit().putString(CallRecordings.FORMAT, CallRecordings.WAV).commit();
        assertEquals(VoiceMessages.Format.OGG, CallRecordings.formatOf("Call 2026-11-17 14.02.11.ogg"));
    }

    @Test public void anOpusRecordingIsAnnouncedAsAnOgg() throws Exception {
        withAShareScreen();
        allowNotifications();
        Settings.preferences.edit().putBoolean(CallRecording.KEY, true).putBoolean(CallRecordings.NOTIFY, true).commit();
        Uri recording = Uri.parse("content://media/external/audio/media/9");
        CallRecordings.saved(app, recording, "Call 2026-11-17 14.02.11.ogg");
        Notification posted = Shadows.shadowOf(notifications()).getNotification(193);
        assertNotNull(posted);
        Intent sent = Shadows.shadowOf(posted.actions[0].actionIntent).getSavedIntent();
        assertEquals(VoiceMessages.Format.OGG.mime, sent.getType());
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

    @Test public void callsRecordThemselvesOnlyOnceTheScopeIsChanged() {
        assertEquals(CallRecordings.TAP, CallRecordings.scope());
        assertFalse(CallRecordings.wants("Alex Kim"));
        Settings.preferences.edit().putString(CallRecordings.SCOPE, "something else entirely").commit();
        assertEquals(CallRecordings.TAP, CallRecordings.scope());
        Settings.preferences.edit().putString(CallRecordings.SCOPE, CallRecordings.ALL).commit();
        assertTrue(CallRecordings.wants(null));
    }

    @Test public void aChosenChatIsTheOneRingingOrTheNameOnTheScreen() {
        Settings.preferences.edit().putString(CallRecordings.SCOPE, CallRecordings.CHOSEN).commit();
        QuietCalls.resetForTests();
        assertFalse("Nothing to go on", CallRecordings.wants(null));

        QuietCalls.incoming("t_17", 0);
        assertFalse("That chat isn't switched on", CallRecordings.wants(null));
        Settings.preferences.edit().putBoolean(CallRecordings.CHAT_PREFIX + "t_17", true).commit();
        assertTrue(CallRecordings.wants(null));

        // An outgoing call rings nobody, so the name on the call screen is what's left to match.
        QuietCalls.resetForTests();
        Settings.preferences.edit().putString(QuietCalls.RECENT, "t_17\tAlex Kim\nt_9\tSam Ortiz").commit();
        assertTrue(CallRecordings.wants("alex kim"));
        assertFalse(CallRecordings.wants("Sam Ortiz"));
        assertFalse(CallRecordings.wants("   "));
    }

    @Test public void settingsOffersTheScopeAndListsTheChosenChats() {
        Settings.preferences.edit().putBoolean(CallRecording.KEY, true)
            .putString(QuietCalls.RECENT, "t_17\tAlex Kim").commit();
        try (var page = org.robolectric.Robolectric.buildActivity(SettingsActivity.class).setup()) {
            android.view.View root = page.get().getWindow().getDecorView();
            android.widget.RadioButton tap = root.findViewWithTag("call_recording_scope_tap");
            android.widget.RadioButton chosen = root.findViewWithTag("call_recording_scope_chosen");
            android.view.View list = root.findViewWithTag("call_recording_recent_list");
            assertNotNull(tap);
            assertNotNull(root.findViewWithTag("call_recording_scope_all"));
            assertTrue("Only when I tap Record to start with", tap.isChecked());
            assertEquals(android.view.View.GONE, list.getVisibility());

            chosen.performClick();
            org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();
            assertEquals(CallRecordings.CHOSEN, Settings.preferences.getString(CallRecordings.SCOPE, null));
            assertEquals(android.view.View.VISIBLE, list.getVisibility());
            assertNotNull("The chat that called has a switch", root.findViewWithTag(CallRecordings.CHAT_PREFIX + "t_17"));
            assertNull(root.findViewWithTag("call_recording_recent_empty"));

            tap.performClick();
            org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();
            assertEquals(android.view.View.GONE, list.getVisibility());
        }
    }

    @Test public void withNobodyHavingCalledTheListSaysSo() {
        Settings.preferences.edit().putBoolean(CallRecording.KEY, true)
            .putString(CallRecordings.SCOPE, CallRecordings.CHOSEN).commit();
        try (var page = org.robolectric.Robolectric.buildActivity(SettingsActivity.class).setup()) {
            android.view.View root = page.get().getWindow().getDecorView();
            assertNotNull(root.findViewWithTag("call_recording_recent_empty"));
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
            for (String words : new String[] {"notify when a call is saved", "keep recordings", "for 30 days",
                    "calls to record", "only when i tap record"}) {
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
                "call_recording_saved_channel", "call_recording_saved_title", "call_recording_share",
                "call_recording_send",
                CallRecordings.SCOPE, "call_recording_scope_tap", "call_recording_scope_all", "call_recording_scope_chosen",
                "call_recording_scope_help", "call_recording_scope_picked", "call_recording_recent_empty",
                CallRecordings.FOLDER, "call_recording_folder_help", "call_recording_folder_default",
                "call_recording_folder_choose", "call_recording_folder_reset", "call_recording_folder_picked",
                "call_recording_folder_refused", CallRecordings.FORMAT, "call_recording_format_wav",
                "call_recording_format_ogg", "call_recording_format_help", "call_recording_format_picked",
                "call_recording_format_unavailable", CallRecordings.TRACKS, "call_recording_tracks_mixed",
                "call_recording_tracks_sides", "call_recording_tracks_help", "call_recording_tracks_picked"}) {
            assertNotNull("English " + id, SettingsText.ENGLISH.get(id));
        }
    }

    @Test public void callsAreSavedAsWavUntilOpusIsPicked() {
        assertEquals(CallRecordings.WAV, CallRecordings.formatPicked());
        assertEquals(VoiceMessages.Format.WAV, CallRecordings.format());
        assertTrue(CallRecording.name(new java.util.Date()).endsWith(".wav"));

        Settings.preferences.edit().putString(CallRecordings.FORMAT, CallRecordings.OGG).commit();
        assertEquals(CallRecordings.OGG, CallRecordings.formatPicked());
    }

    @Test public void aFormatNobodyCouldHavePickedReadsAsTheWav() {
        for (String odd : new String[] {"", "mp3", "opus "}) {
            Settings.preferences.edit().putString(CallRecordings.FORMAT, odd).commit();
            assertEquals("Reading " + odd, CallRecordings.WAV, CallRecordings.formatPicked());
        }
    }

    /** A phone with no Opus encoder writes the WAV rather than nothing, whatever the setting says. */
    @Test public void withNoOpusEncoderThePickStillSavesTheWav() {
        Settings.preferences.edit().putString(CallRecordings.FORMAT, CallRecordings.OGG).commit();
        assertFalse(CallOpus.available());
        assertEquals(VoiceMessages.Format.WAV, CallRecordings.format());
        assertTrue(CallRecording.name(new java.util.Date()).endsWith(".wav"));
    }

    @Test public void withAnOpusEncoderThePickNamesTheFileOgg() {
        withAnOpusEncoder();
        Settings.preferences.edit().putString(CallRecordings.FORMAT, CallRecordings.OGG).commit();
        assertTrue(CallOpus.available());
        assertEquals(VoiceMessages.Format.OGG, CallRecordings.format());
        assertEquals("audio/ogg", CallRecordings.format().mime);
        String saved = CallRecording.name(new java.util.Date(), "Alex Kim");
        assertTrue(saved, saved.startsWith(CallRecordings.PREFIX) && saved.endsWith(".ogg"));
    }

    /** The tidy-up goes by the name, so an Opus recording is swept up the same way a WAV one is. */
    @Test public void theTidyUpTakesAwayOpusRecordingsToo() throws Exception {
        withAnOpusEncoder();
        Folder folder = Folder.register("opus.folder");
        long now = System.currentTimeMillis();
        folder.add("Call 2026-01-01 09.00.00.ogg", now - TimeUnit.DAYS.toMillis(60));
        Settings.preferences.edit().putString(CallRecordings.FOLDER, tree("opus.folder", "root").toString())
            .putString(CallRecordings.FORMAT, CallRecordings.OGG).putString(CallRecordings.KEEP, "30").commit();

        assertEquals(1, CallRecordings.clean(app, now));
        assertTrue(folder.names().isEmpty());
    }

    @Test public void settingsOffersTheFormatAndSaysWhenThePhoneCant() {
        Settings.preferences.edit().putBoolean(CallRecording.KEY, true).commit();
        try (var page = org.robolectric.Robolectric.buildActivity(SettingsActivity.class).setup()) {
            android.view.View root = page.get().getWindow().getDecorView();
            android.widget.RadioButton wav = root.findViewWithTag("call_recording_format_wav");
            android.widget.RadioButton ogg = root.findViewWithTag("call_recording_format_ogg");
            assertNotNull(wav);
            assertTrue("WAV to start with", wav.isChecked());
            assertNotNull("A phone with no encoder is told so", root.findViewWithTag("call_recording_format_unavailable"));

            ogg.performClick();
            org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();
            assertEquals(CallRecordings.OGG, Settings.preferences.getString(CallRecordings.FORMAT, null));
            assertTrue(ogg.isChecked());
            assertFalse(wav.isChecked());
        }
    }

    @Test public void theFormatRowTurnsUpInASearch() {
        Settings.preferences.edit().putBoolean(CallRecording.KEY, true).commit();
        try (var page = org.robolectric.Robolectric.buildActivity(SettingsActivity.class).setup()) {
            android.view.View root = page.get().getWindow().getDecorView();
            android.widget.EditText find = root.findViewWithTag("find_control");
            android.view.View nothing = root.findViewWithTag("empty_state");
            for (String words : new String[] {"save calls as", "ogg opus", "a tenth the size"}) {
                find.setText(words);
                org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();
                assertEquals("Searching " + words, android.view.View.GONE, nothing.getVisibility());
            }
        }
    }

    @Test public void bothSidesShareATrackUntilEachIsAskedFor() {
        assertEquals(CallRecordings.MIXED, CallRecordings.tracksPicked());
        assertEquals(1, CallRecordings.channels());
        Settings.preferences.edit().putString(CallRecordings.TRACKS, CallRecordings.SIDES).commit();
        assertEquals(2, CallRecordings.channels());
        Settings.preferences.edit().putString(CallRecordings.TRACKS, "quadraphonic").commit();
        assertEquals("Anything else reads as both together", 1, CallRecordings.channels());
    }

    @Test public void settingsOffersTheTwoSides() {
        Settings.preferences.edit().putBoolean(CallRecording.KEY, true).commit();
        try (var page = org.robolectric.Robolectric.buildActivity(SettingsActivity.class).setup()) {
            android.view.View root = page.get().getWindow().getDecorView();
            android.widget.RadioButton together = root.findViewWithTag("call_recording_tracks_mixed");
            android.widget.RadioButton apart = root.findViewWithTag("call_recording_tracks_sides");
            assertNotNull(together);
            assertTrue("Together to start with", together.isChecked());

            apart.performClick();
            org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();
            assertEquals(CallRecordings.SIDES, Settings.preferences.getString(CallRecordings.TRACKS, null));
            assertTrue(apart.isChecked());
            assertFalse(together.isChecked());
        }
    }

    @Test public void theTracksRowTurnsUpInASearch() {
        Settings.preferences.edit().putBoolean(CallRecording.KEY, true).commit();
        try (var page = org.robolectric.Robolectric.buildActivity(SettingsActivity.class).setup()) {
            android.view.View root = page.get().getWindow().getDecorView();
            android.widget.EditText find = root.findViewWithTag("find_control");
            android.view.View nothing = root.findViewWithTag("empty_state");
            for (String words : new String[] {"the two sides", "on the left", "one track"}) {
                find.setText(words);
                org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();
                assertEquals("Searching " + words, android.view.View.GONE, nothing.getVisibility());
            }
        }
    }

    /** Puts an Opus encoder on the phone, which Robolectric's own list has none of. */
    private static void withAnOpusEncoder() {
        android.media.MediaFormat opus = android.media.MediaFormat.createAudioFormat(CallOpus.MIME, CallMix.RATE, 1);
        org.robolectric.shadows.ShadowMediaCodecList.addCodec(
            org.robolectric.shadows.MediaCodecInfoBuilder.newBuilder()
                .setName("test.opus.encoder")
                .setIsEncoder(true)
                .setCapabilities(org.robolectric.shadows.MediaCodecInfoBuilder.CodecCapabilitiesBuilder.newBuilder()
                    .setMediaFormat(opus).setIsEncoder(true).build())
                .build());
    }

    @Test public void recordingsGoToThePhonesOwnFolderUntilOneIsPicked() {
        assertNull(CallRecordings.folder());
        assertNull(CallRecordings.folderName(null));
        assertTrue(CallRecordings.folderChosen(app, tree("primary:Music/Calls")));
        assertEquals(tree("primary:Music/Calls"), CallRecordings.folder());
        assertEquals("Calls", CallRecordings.folderName(CallRecordings.folder()));

        assertTrue("Use the default puts it back", CallRecordings.folderChosen(app, null));
        assertNull(CallRecordings.folder());
    }

    @Test public void aFolderNameIsTheLastPartOfWhateverThePickerHandedOver() {
        assertEquals("Calls", CallRecordings.folderName(tree("primary:Recordings/Calls")));
        assertEquals("Recordings", CallRecordings.folderName(tree("primary:Recordings")));
        assertEquals("1A2B-3C4D", CallRecordings.folderName(tree("1A2B-3C4D")));
        assertEquals("saved", CallRecordings.folderName(tree("home:docs/saved")));
    }

    @Test public void aFolderWrittenDownAsNonsenseReadsAsNoneAtAll() {
        Settings.preferences.edit().putString(CallRecordings.FOLDER, "").commit();
        assertNull(CallRecordings.folder());
    }

    @Test public void aRecordingIsWrittenIntoTheFolderPicked() throws Exception {
        Folder folder = Folder.register("picked.folder");
        CallRecording.Target saved = new CallRecording.PickedFolder(tree("picked.folder", "root")).open(app, "Call one.wav");
        saved.channel().write(java.nio.ByteBuffer.wrap(new byte[] {1, 2, 3, 4}));
        saved.close(true);
        assertEquals("One file in the folder", 1, folder.names().size());
        assertEquals("Call one.wav", folder.names().get(0));
        assertEquals(4, folder.sizeOf("Call one.wav"));
    }

    @Test public void aRecordingThatCouldntBeKeptLeavesNoFileBehind() throws Exception {
        Folder folder = Folder.register("dropped.folder");
        CallRecording.Target saved = new CallRecording.PickedFolder(tree("dropped.folder", "root")).open(app, "Call two.wav");
        saved.close(false);
        assertTrue("Nothing left in the folder", folder.names().isEmpty());
    }

    /** A folder that's been taken away since it was picked can't lose the call, so the phone's own takes it. */
    @Test public void aFolderThatCantBeWrittenToFallsBackToThePhonesOwn() throws Exception {
        Settings.preferences.edit().putString(CallRecordings.FOLDER, tree("gone.folder", "root").toString()).commit();
        boolean reachedThePhonesOwn = false;
        try {
            new CallRecording.Saving().open(app, "Call three.wav").close(false);
        } catch (RuntimeException shared) {
            // Robolectric's MediaStore takes no WAV, so getting that far is how far the phone's own folder goes here.
            reachedThePhonesOwn = String.valueOf(shared.getMessage()).contains(VoiceMessages.Format.WAV.mime);
        }
        assertTrue("The call went on to the phone's own Recordings folder", reachedThePhonesOwn);
        assertTrue("The folder's refusal was written down", Settings.hookErrors.containsKey(CallRecording.KEY));
    }

    @Test public void onlyTheOldRecordingsInTheFolderPickedGo() throws Exception {
        Folder folder = Folder.register("tidy.folder");
        long now = System.currentTimeMillis();
        folder.add("Call 2026-01-01 09.00.00.wav", now - TimeUnit.DAYS.toMillis(60));
        folder.add("Call 2026-11-16 09.00.00.wav", now - TimeUnit.DAYS.toMillis(1));
        folder.add("Grandma singing.wav", now - TimeUnit.DAYS.toMillis(600));
        Settings.preferences.edit().putString(CallRecordings.FOLDER, tree("tidy.folder", "root").toString())
            .putString(CallRecordings.KEEP, "30").commit();

        assertEquals(1, CallRecordings.clean(app, now));
        assertEquals(java.util.Arrays.asList("Call 2026-11-16 09.00.00.wav", "Grandma singing.wav"), folder.names());
    }

    @Test public void withNoFolderPickedTheTidyUpLeavesTheFolderAlone() {
        assertEquals(0, CallRecordings.deleteFromFolderBefore(app, null, System.currentTimeMillis()));
    }

    @Test public void settingsShowsTheFolderAndOffersTheDefaultBackOnlyOnceOnesPicked() {
        Settings.preferences.edit().putBoolean(CallRecording.KEY, true).commit();
        try (var page = org.robolectric.Robolectric.buildActivity(SettingsActivity.class).setup()) {
            android.view.View root = page.get().getWindow().getDecorView();
            android.widget.TextView name = root.findViewWithTag("call_recording_folder_name");
            android.view.View useDefault = root.findViewWithTag("call_recording_folder_reset");
            assertNotNull(root.findViewWithTag("call_recording_folder_choose"));
            assertEquals("The phone's Recordings folder", name.getText().toString());
            assertEquals(android.view.View.GONE, useDefault.getVisibility());

            page.get().onActivityResult(SettingsActivity.PICK_RECORDING_FOLDER, android.app.Activity.RESULT_OK,
                new Intent().setData(tree("primary:Recordings/Calls")));
            org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();
            assertEquals("Calls", name.getText().toString());
            assertEquals(android.view.View.VISIBLE, useDefault.getVisibility());

            useDefault.performClick();
            org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();
            assertEquals("The phone's Recordings folder", name.getText().toString());
            assertEquals(android.view.View.GONE, useDefault.getVisibility());
        }
    }

    @Test public void theFolderRowTurnsUpInASearch() {
        Settings.preferences.edit().putBoolean(CallRecording.KEY, true).commit();
        try (var page = org.robolectric.Robolectric.buildActivity(SettingsActivity.class).setup()) {
            android.view.View root = page.get().getWindow().getDecorView();
            android.widget.EditText find = root.findViewWithTag("find_control");
            android.view.View nothing = root.findViewWithTag("empty_state");
            for (String words : new String[] {"recordings folder", "pick a folder", "use the default"}) {
                find.setText(words);
                org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();
                assertEquals("Searching " + words, android.view.View.GONE, nothing.getVisibility());
            }
        }
    }

    private static Uri tree(String documentId) {
        return tree("com.android.externalstorage.documents", documentId);
    }

    private static Uri tree(String authority, String documentId) {
        return android.provider.DocumentsContract.buildTreeDocumentUri(authority, documentId);
    }

    /**
     * A folder a picker could have handed over: it makes files, lists what's in it and takes files away, which is
     * every part of a document tree this patch uses.
     */
    private static final class Folder extends android.content.ContentProvider {
        private final java.util.Map<String, java.io.File> files = new java.util.LinkedHashMap<>();
        private final java.util.Map<String, Long> dates = new java.util.LinkedHashMap<>();
        private java.io.File home;

        static Folder register(String authority) throws IOException {
            Folder folder = new Folder();
            folder.home = java.nio.file.Files.createTempDirectory("picked").toFile();
            // The authority has to come through the provider's own info, or every call to it is turned away.
            android.content.pm.ProviderInfo info = new android.content.pm.ProviderInfo();
            info.authority = authority;
            info.packageName = RuntimeEnvironment.getApplication().getPackageName();
            folder.attachInfo(RuntimeEnvironment.getApplication(), info);
            org.robolectric.shadows.ShadowContentResolver.registerProviderInternal(authority, folder);
            return folder;
        }

        void add(String name, long modified) throws IOException {
            java.io.File file = new java.io.File(home, name);
            assertTrue("Making " + name, file.createNewFile());
            files.put(name, file);
            dates.put(name, modified);
        }

        java.util.List<String> names() {
            return new java.util.ArrayList<>(files.keySet());
        }

        long sizeOf(String name) {
            return files.get(name).length();
        }

        @Override public boolean onCreate() { return true; }

        @Override public android.database.Cursor query(Uri uri, String[] projection, String selection, String[] args, String order) {
            android.database.MatrixCursor rows = new android.database.MatrixCursor(projection);
            for (String name : names()) {
                Object[] row = new Object[projection.length];
                for (int column = 0; column < projection.length; column++) {
                    if (android.provider.DocumentsContract.Document.COLUMN_DOCUMENT_ID.equals(projection[column])) row[column] = name;
                    else if (android.provider.DocumentsContract.Document.COLUMN_DISPLAY_NAME.equals(projection[column])) row[column] = name;
                    else if (android.provider.DocumentsContract.Document.COLUMN_LAST_MODIFIED.equals(projection[column])) row[column] = dates.get(name);
                }
                rows.addRow(row);
            }
            return rows;
        }

        @Override public android.os.Bundle call(String method, String arg, android.os.Bundle extras) {
            Uri at = extras == null ? null : extras.getParcelable("uri");
            try {
                if (method.endsWith("createDocument")) {
                    String name = extras.getString(android.provider.DocumentsContract.Document.COLUMN_DISPLAY_NAME);
                    add(name, System.currentTimeMillis());
                    android.os.Bundle made = new android.os.Bundle();
                    made.putParcelable("uri", android.provider.DocumentsContract.buildDocumentUriUsingTree(at, name));
                    return made;
                }
                if (method.endsWith("deleteDocument")) {
                    String name = android.provider.DocumentsContract.getDocumentId(at);
                    java.io.File file = files.remove(name);
                    dates.remove(name);
                    if (file != null) assertTrue("Taking " + name + " away", file.delete());
                    return new android.os.Bundle();
                }
            } catch (IOException unwritable) {
                throw new IllegalStateException(unwritable);
            }
            return null;
        }

        @Override public android.os.ParcelFileDescriptor openFile(Uri uri, String mode) throws java.io.FileNotFoundException {
            java.io.File file = files.get(android.provider.DocumentsContract.getDocumentId(uri));
            if (file == null) throw new java.io.FileNotFoundException(uri.toString());
            return android.os.ParcelFileDescriptor.open(file,
                android.os.ParcelFileDescriptor.MODE_READ_WRITE | android.os.ParcelFileDescriptor.MODE_TRUNCATE);
        }

        @Override public String getType(Uri uri) { return VoiceMessages.Format.WAV.mime; }

        @Override public Uri insert(Uri uri, ContentValues values) { return null; }

        @Override public int delete(Uri uri, String selection, String[] args) { return 0; }

        @Override public int update(Uri uri, ContentValues values, String selection, String[] args) { return 0; }
    }
}
