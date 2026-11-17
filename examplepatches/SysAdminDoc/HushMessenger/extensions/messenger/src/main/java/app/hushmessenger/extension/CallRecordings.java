package app.hushmessenger.extension;

import android.annotation.SuppressLint;
import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.ClipData;
import android.content.ContentUris;
import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.net.Uri;
import android.os.Build;
import android.provider.MediaStore;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 * What becomes of a call recording once it's saved (#193): the notification that says where it went, and the tidy-up
 * that takes old ones away. Both run on the recording's own thread, after its file is closed, so a call never waits
 * for either. Only files this patch named are ever touched, and one saved by an earlier install of Messenger belongs
 * to that install, so MediaStore keeps it and this leaves it alone.
 */
final class CallRecordings {
    /** How long a recording is kept, in days. "0" keeps them all, which is how it arrives. */
    static final String KEEP = "call_recording_keep";
    /** A notification once a recording is saved. Off to start with. */
    static final String NOTIFY = "call_recording_notify";
    /** The choices the settings row offers, in days. */
    static final List<String> KEEP_CHOICES = Arrays.asList("0", "7", "30", "90");
    /** Every recording's name starts with this, which is how the tidy-up knows its own. */
    static final String PREFIX = "Call ";

    private static final String CHANNEL = "hush_call_recordings";
    private static final int NOTIFICATION = 193;

    private CallRecordings() {}

    /** The days recordings are kept for, or 0 to keep them all. Anything else in the store reads as keep them all. */
    static int keepDays() {
        if (Settings.preferences == null) return 0;
        try {
            int days = Integer.parseInt(Settings.preferences.getString(KEEP, "0"));
            return days > 0 && days <= 365 ? days : 0;
        } catch (RuntimeException notANumber) {
            return 0;
        }
    }

    /**
     * Says a recording was saved, when the switch asks for it: a tap plays it and Share hands it to any app. Posted
     * from the recording's thread, which is where its file was just finished.
     */
    // Lint reads the extension's own manifest; this posts from Messenger's process, with the grant checked first.
    @SuppressLint("NotificationPermission")
    static void saved(Context context, Uri recording, String name) {
        try {
            if (recording == null || !Settings.wouldUse(CallRecording.KEY)
                || Settings.preferences == null || !Settings.preferences.getBoolean(NOTIFY, false)) return;
            if (Build.VERSION.SDK_INT >= 33
                && context.checkSelfPermission(android.Manifest.permission.POST_NOTIFICATIONS) != PackageManager.PERMISSION_GRANTED) return;
            NotificationManager manager = context.getSystemService(NotificationManager.class);
            if (manager == null) return;
            SettingsText text = new SettingsText(context);
            NotificationChannel channel = new NotificationChannel(CHANNEL, text.get("call_recording_saved_channel"),
                NotificationManager.IMPORTANCE_LOW);
            channel.setShowBadge(false);
            manager.createNotificationChannel(channel);
            String mime = VoiceMessages.Format.WAV.mime;
            Notification.Builder built = new Notification.Builder(context, CHANNEL)
                .setSmallIcon(android.R.drawable.stat_sys_download_done)
                .setContentTitle(text.get("call_recording_saved_title"))
                .setContentText(name)
                .setAutoCancel(true)
                .setLocalOnly(true)
                .setCategory(Notification.CATEGORY_STATUS)
                .setContentIntent(opens(context, 1, play(recording, mime)))
                .addAction(new Notification.Action.Builder((android.graphics.drawable.Icon) null, text.get("call_recording_share"),
                    opens(context, 2, Intent.createChooser(send(recording, mime), name).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK))).build());
            manager.notify(NOTIFICATION, built.build());
        } catch (RuntimeException error) {
            // The toast already said where the recording went.
            Settings.hookFailedPrivately(CallRecording.KEY, "Couldn't say the recording was saved", error);
        }
    }

    /** Opens the recording in whichever player the phone uses. */
    static Intent play(Uri recording, String mime) {
        return new Intent(Intent.ACTION_VIEW).setDataAndType(recording, mime)
            .addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION | Intent.FLAG_ACTIVITY_NEW_TASK);
    }

    /** The recording as a share, readable by whichever app takes it. */
    static Intent send(Uri recording, String mime) {
        Intent sending = new Intent(Intent.ACTION_SEND).setType(mime)
            .putExtra(Intent.EXTRA_STREAM, recording)
            .addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
        sending.setClipData(ClipData.newRawUri("", recording));
        return sending;
    }

    private static PendingIntent opens(Context context, int request, Intent intent) {
        return PendingIntent.getActivity(context, request, intent, PendingIntent.FLAG_IMMUTABLE | PendingIntent.FLAG_UPDATE_CURRENT);
    }

    /** Takes away the recordings older than the number of days chosen, and answers how many went. */
    static int clean(Context context, long now) {
        int days = keepDays();
        if (days <= 0) return 0;
        return deleteBefore(context, now - TimeUnit.DAYS.toMillis(days));
    }

    /**
     * Deletes this patch's recordings saved before [before], by the wall clock, and answers how many went. The query
     * asks only for the name, and the folder and the date are read off each row in Java: MediaStore keeps the date in
     * whole seconds and writes the folder back with a slash on the end, and neither is worth trusting to SQL.
     */
    static int deleteBefore(Context context, long before) {
        String folder = CallRecording.SharedAudio.folder();
        String[] columns = {MediaStore.MediaColumns._ID, MediaStore.MediaColumns.DISPLAY_NAME,
            MediaStore.MediaColumns.RELATIVE_PATH, MediaStore.MediaColumns.DATE_ADDED};
        List<Uri> old = new ArrayList<>();
        ContentResolver resolver;
        // Reaching the store at all can be refused, and the call this followed is already over, so nothing here throws.
        try {
            resolver = context.getContentResolver();
        } catch (RuntimeException noStore) {
            Settings.hookFailedPrivately(CallRecording.KEY, "Couldn't reach the saved recordings", noStore);
            return 0;
        }
        try (Cursor rows = resolver.query(VoiceMessages.SharedAudio.collection(), columns,
                MediaStore.MediaColumns.DISPLAY_NAME + " LIKE ?", new String[] {PREFIX + "%"}, null)) {
            if (rows == null) return 0;
            while (rows.moveToNext()) {
                String name = rows.getString(1);
                String path = rows.getString(2);
                if (path != null && path.endsWith("/")) path = path.substring(0, path.length() - 1);
                if (name == null || !name.startsWith(PREFIX) || !folder.equals(path)
                    || rows.isNull(3) || rows.getLong(3) * 1000 >= before) continue;
                old.add(ContentUris.withAppendedId(VoiceMessages.SharedAudio.collection(), rows.getLong(0)));
            }
        } catch (RuntimeException unreadable) {
            Settings.hookFailedPrivately(CallRecording.KEY, "Couldn't look over the saved recordings", unreadable);
            return 0;
        }
        int deleted = 0;
        for (Uri recording : old) {
            try {
                deleted += resolver.delete(recording, null, null);
            } catch (RuntimeException notOurs) {
                // Saved by an earlier install of Messenger, so this one isn't allowed to remove it.
            }
        }
        return deleted;
    }
}
