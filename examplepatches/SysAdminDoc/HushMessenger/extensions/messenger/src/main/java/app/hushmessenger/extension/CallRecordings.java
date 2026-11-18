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
import android.provider.DocumentsContract;
import android.provider.MediaStore;
import java.io.IOException;
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

    /** Which calls record themselves, with no tap on the button. */
    static final String SCOPE = "call_recording_scope";
    /** Nothing records itself, which is how it arrives. */
    static final String TAP = "tap";
    static final String ALL = "all";
    static final String CHOSEN = "chosen";
    static final List<String> SCOPES = Arrays.asList(TAP, ALL, CHOSEN);
    /** One switch per chat, this prefix and the chat's key, so each binds like any other switch. */
    static final String CHAT_PREFIX = "call_recording_chat_";

    /** What a recording is written as: a plain WAV, or Opus in an OGG for a file a tenth the size. */
    static final String FORMAT = "call_recording_format";
    static final String WAV = "wav", OGG = "ogg";
    static final List<String> FORMATS = Arrays.asList(WAV, OGG);

    /** Whether the two sides of a call share one track or get one each. */
    static final String TRACKS = "call_recording_tracks";
    /** Both sides added together, which is what a recording has always been. */
    static final String MIXED = "mixed";
    /** You on the left, them on the right, so either side can be listened to on its own. */
    static final String SIDES = "sides";
    static final List<String> TRACK_CHOICES = Arrays.asList(MIXED, SIDES);

    /** The folder recordings are written to, as a tree the person picked. Empty for the phone's own. */
    static final String FOLDER = "call_recording_folder";
    /** What a picked folder is held with, so it still opens after a restart. */
    static final int FOLDER_ACCESS = Intent.FLAG_GRANT_READ_URI_PERMISSION | Intent.FLAG_GRANT_WRITE_URI_PERMISSION;

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

    /** What's written down for the format, whether or not this phone can manage it. */
    static String formatPicked() {
        String saved = Settings.preferences == null ? null : Settings.preferences.getString(FORMAT, WAV);
        return FORMATS.contains(saved) ? saved : WAV;
    }

    /**
     * The format a recording started now would be written in. Opus needs an encoder, and a phone without one gets the
     * WAV rather than a file that was never written, so this is asked before the file is named.
     */
    static VoiceMessages.Format format() {
        return OGG.equals(formatPicked()) && CallOpus.available(channels())
            ? VoiceMessages.Format.OGG : VoiceMessages.Format.WAV;
    }

    /** What's written down for the tracks. Anything else in the store reads as both sides together. */
    static String tracksPicked() {
        String saved = Settings.preferences == null ? null : Settings.preferences.getString(TRACKS, MIXED);
        return TRACK_CHOICES.contains(saved) ? saved : MIXED;
    }

    /** One channel for both sides together, two for a side each. */
    static int channels() {
        return SIDES.equals(tracksPicked()) ? 2 : 1;
    }

    /**
     * The type of a recording already saved, read off the end of its name. The format under the switch may have been
     * changed since, so a file that was written as Opus still goes out as Opus.
     */
    static VoiceMessages.Format formatOf(String name) {
        return name != null && name.endsWith("." + VoiceMessages.Format.OGG.extension)
            ? VoiceMessages.Format.OGG : VoiceMessages.Format.WAV;
    }

    /** The folder picked for recordings, or null for the phone's own. */
    static Uri folder() {
        String saved = Settings.preferences == null ? null : Settings.preferences.getString(FOLDER, "");
        if (saved == null || saved.isEmpty()) return null;
        try {
            return Uri.parse(saved);
        } catch (RuntimeException unreadable) {
            return null;
        }
    }

    /** The name to show for the folder picked, which is the last part of its path. Null when there's none. */
    static String folderName(Uri tree) {
        if (tree == null) return null;
        String id = DocumentsContract.getTreeDocumentId(tree);
        if (id == null || id.isEmpty()) return null;
        int lastPart = Math.max(id.lastIndexOf('/'), id.lastIndexOf(':'));
        String name = lastPart < 0 ? id : id.substring(lastPart + 1);
        return name.isEmpty() ? id : name;
    }

    /**
     * Holds on to the folder picked so recordings can still be written to it after a restart, and lets go of the one
     * before it. Answers whether the new one was taken.
     */
    static boolean folderChosen(Context context, Uri tree) {
        Uri before = folder();
        if (tree != null) {
            try {
                context.getContentResolver().takePersistableUriPermission(tree, FOLDER_ACCESS);
            } catch (RuntimeException refused) {
                Settings.hookFailedPrivately(CallRecording.KEY, "Couldn't hold on to the folder picked", refused);
                return false;
            }
        }
        if (Settings.preferences != null)
            Settings.preferences.edit().putString(FOLDER, tree == null ? "" : tree.toString()).apply();
        if (before != null && !before.equals(tree)) {
            try {
                context.getContentResolver().releasePersistableUriPermission(before, FOLDER_ACCESS);
            } catch (RuntimeException alreadyGone) {
                // Let go with the folder itself, which is nothing to put right.
            }
        }
        return true;
    }

    /** Which calls record themselves. Anything else in the store reads as only the ones you tap Record on. */
    static String scope() {
        String saved = Settings.preferences == null ? null : Settings.preferences.getString(SCOPE, TAP);
        return SCOPES.contains(saved) ? saved : TAP;
    }

    /**
     * Whether the call in front of the person now records itself, where [name] is who the call screen says it's with.
     * An incoming call brings its chat with it; an outgoing one has no notification to name it, so the screen's name
     * is matched against the chats that have called before. A call nothing can place is left to the button.
     */
    static boolean wants(String name) {
        String scope = scope();
        if (ALL.equals(scope)) return true;
        if (!CHOSEN.equals(scope) || Settings.preferences == null) return false;
        String chat = QuietCalls.ringingChat();
        if (chat != null) return Settings.preferences.getBoolean(CHAT_PREFIX + chat, false);
        if (name == null || name.trim().isEmpty()) return false;
        for (String[] called : QuietCalls.recent())
            if (called[1].equalsIgnoreCase(name.trim()) && Settings.preferences.getBoolean(CHAT_PREFIX + called[0], false)) return true;
        return false;
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
            String mime = formatOf(name).mime;
            Notification.Builder built = new Notification.Builder(context, CHANNEL)
                .setSmallIcon(android.R.drawable.stat_sys_download_done)
                .setContentTitle(text.get("call_recording_saved_title"))
                .setContentText(name)
                .setAutoCancel(true)
                .setLocalOnly(true)
                .setCategory(Notification.CATEGORY_STATUS)
                .setContentIntent(opens(context, 1, play(recording, mime)));
            Intent chat = toAChat(context, recording, mime);
            if (chat != null)
                built.addAction(new Notification.Action.Builder((android.graphics.drawable.Icon) null,
                    text.get("call_recording_send"), opens(context, 3, chat)).build());
            built.addAction(new Notification.Action.Builder((android.graphics.drawable.Icon) null, text.get("call_recording_share"),
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

    /**
     * The recording on its way into a chat in this very app, which is how one goes to yourself: the chat picker opens
     * with the file attached and your own chat is one of the rows (#193). The app itself is named rather than
     * Messenger's package, so a clone or a rename still takes it. Null when this build has nowhere to take a share.
     */
    static Intent toAChat(Context context, Uri recording, String mime) {
        Intent sending = send(recording, mime).setPackage(context.getPackageName())
            .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        try {
            return context.getPackageManager().resolveActivity(sending, 0) == null ? null : sending;
        } catch (RuntimeException unanswerable) {
            return null;
        }
    }

    private static PendingIntent opens(Context context, int request, Intent intent) {
        return PendingIntent.getActivity(context, request, intent, PendingIntent.FLAG_IMMUTABLE | PendingIntent.FLAG_UPDATE_CURRENT);
    }

    /** Takes away the recordings older than the number of days chosen, and answers how many went. */
    static int clean(Context context, long now) {
        int days = keepDays();
        if (days <= 0) return 0;
        long before = now - TimeUnit.DAYS.toMillis(days);
        return deleteBefore(context, before) + deleteFromFolderBefore(context, folder(), before);
    }

    /**
     * The same tidy-up for the folder picked, which MediaStore knows nothing about. Only the files this patch named
     * are looked at, so anything else kept in there is left where it is.
     */
    static int deleteFromFolderBefore(Context context, Uri tree, long before) {
        if (tree == null) return 0;
        int deleted = 0;
        try {
            ContentResolver resolver = context.getContentResolver();
            Uri inside = DocumentsContract.buildChildDocumentsUriUsingTree(tree, DocumentsContract.getTreeDocumentId(tree));
            List<Uri> old = new ArrayList<>();
            String[] columns = {DocumentsContract.Document.COLUMN_DOCUMENT_ID, DocumentsContract.Document.COLUMN_DISPLAY_NAME,
                DocumentsContract.Document.COLUMN_LAST_MODIFIED};
            try (Cursor rows = resolver.query(inside, columns, null, null, null)) {
                if (rows == null) return 0;
                while (rows.moveToNext()) {
                    String name = rows.getString(1);
                    if (name == null || !name.startsWith(PREFIX) || rows.isNull(2) || rows.getLong(2) >= before) continue;
                    old.add(DocumentsContract.buildDocumentUriUsingTree(tree, rows.getString(0)));
                }
            }
            for (Uri recording : old) if (DocumentsContract.deleteDocument(resolver, recording)) deleted++;
        } catch (IOException | RuntimeException unreadable) {
            // The folder may have been moved or taken away since it was picked, and the call this followed is over.
            Settings.hookFailedPrivately(CallRecording.KEY, "Couldn't look over the folder picked", unreadable);
        }
        return deleted;
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
