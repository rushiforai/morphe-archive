/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.download;

import android.app.Activity;
import android.app.PendingIntent;
import android.content.ActivityNotFoundException;
import android.content.ClipData;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.net.Uri;
import android.os.ParcelFileDescriptor;
import android.os.SystemClock;
import android.provider.MediaStore;

import java.lang.ref.WeakReference;
import java.util.List;
import java.util.concurrent.atomic.AtomicReference;

import app.morphe.extension.shared.L10n;
import app.morphe.extension.shared.Utils;

/**
 * Local file actions from a completed notification. They enter through the existing launcher
 * activity, so Android 12's notification restrictions never require a receiver to start a screen.
 * A tap is consumed before Facebook reads the intent. It can be delivered to a resumed screen
 * for at most 30 seconds; no file list or durable handle is written by this class.
 */
public final class SavedFileActions {
    static final String TAG = "hushfacebook-completed:";
    static final String OPEN = "app.morphe.extension.facebook.OPEN_SAVED_FILE";
    static final String SHARE = "app.morphe.extension.facebook.SHARE_SAVED_FILE";
    private static final long LIFETIME_MS = 30_000;
    private static final AtomicReference<Request> pending = new AtomicReference<>();
    private static volatile WeakReference<Activity> resumed = new WeakReference<>(null);

    private SavedFileActions() { }

    static PendingIntent button(Context application, Uri uri, String mime, boolean share) {
        Intent entry = new Intent(share ? SHARE : OPEN)
                .setClassName(application.getPackageName(), "com.facebook.katana.LoginActivity")
                .setDataAndType(uri, mime)
                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        // Data and action participate in PendingIntent identity; extras alone do not.
        return PendingIntent.getActivity(application, 0, entry,
                PendingIntent.FLAG_IMMUTABLE | PendingIntent.FLAG_UPDATE_CURRENT);
    }

    /** Called by the existing activity intent hooks, including after a process restart. */
    public static void receive(Intent intent) {
        if (intent == null || (!OPEN.equals(intent.getAction()) && !SHARE.equals(intent.getAction()))) return;
        Request request = new Request(intent.getData(), intent.getType(), SHARE.equals(intent.getAction()));
        intent.setAction(Intent.ACTION_MAIN).setDataAndType(null, null);
        intent.setClipData(null);
        pending.set(request);
    }

    /** The launcher may hand over to another Facebook activity, so delivery waits for resume. */
    public static void onResumed(Activity activity) {
        resumed = new WeakReference<>(activity);
        Request request = pending.getAndSet(null);
        if (request == null || request.expired()) return;
        Context application = activity.getApplicationContext();
        if (!Utils.runOnBackgroundThread(() -> {
            String mime = readableMime(application, request);
            Utils.runOnMainThread(() -> {
                if (request.expired()) return;
                Activity host = resumed.get();
                if (host == null || host.isFinishing() || host.isDestroyed()) {
                    if (!request.expired()) pending.compareAndSet(null, request);
                    return;
                }
                if (mime == null) {
                    Feedback.show(application, L10n.t(application, "That saved file is no longer available."), true);
                } else {
                    launch(host, request, mime);
                }
            });
        })) {
            Feedback.show(application, L10n.t(application, "Couldn't open or share that saved file. Try again."), true);
        }
    }

    public static void onPaused(Activity activity) {
        if (resumed.get() == activity) resumed = new WeakReference<>(null);
    }

    /** No filename, post fields or source address are requested, logged or added to either intent. */
    private static String readableMime(Context application, Request request) {
        if (!mediaItem(request.uri) || request.mime == null
                || !(request.mime.startsWith("video/") || request.mime.startsWith("image/"))) return null;
        try (Cursor row = application.getContentResolver().query(request.uri,
                new String[]{MediaStore.MediaColumns.OWNER_PACKAGE_NAME, MediaStore.MediaColumns.IS_PENDING,
                        MediaStore.MediaColumns.MIME_TYPE, MediaStore.MediaColumns.IS_TRASHED}, null, null, null)) {
            if (row == null || !row.moveToFirst() || !application.getPackageName().equals(row.getString(0))
                    || row.getInt(1) != 0 || row.getInt(3) != 0) return null;
            // MediaStore can normalize its MIME after indexing. Use that current type at the tap.
            String mime = row.getString(2);
            if (mime == null || !(mime.startsWith("video/") || mime.startsWith("image/"))) return null;
            try (ParcelFileDescriptor file = application.getContentResolver().openFileDescriptor(request.uri, "r")) {
                return file == null ? null : mime;
            }
        } catch (Exception failure) {
            return null; // A deleted, unreadable or no longer owned row exposes no file action.
        }
    }

    private static boolean mediaItem(Uri uri) {
        if (uri == null || !"content".equals(uri.getScheme()) || !MediaStore.AUTHORITY.equals(uri.getAuthority())
                || uri.getQuery() != null || uri.getFragment() != null) return false;
        List<String> path = uri.getPathSegments();
        if (path.size() < 3 || !("external".equals(path.get(0)) || "external_primary".equals(path.get(0)))) return false;
        boolean collection = path.size() == 3 && "downloads".equals(path.get(1))
                || path.size() == 4 && ("video".equals(path.get(1)) || "images".equals(path.get(1)))
                && "media".equals(path.get(2));
        if (!collection) return false;
        try { return Long.parseLong(path.get(path.size() - 1)) > 0; }
        catch (NumberFormatException invalid) { return false; }
    }

    private static void launch(Activity activity, Request request, String mime) {
        Intent target = new Intent(request.share ? Intent.ACTION_SEND : Intent.ACTION_VIEW)
                .setType(mime)
                .addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
        target.setClipData(ClipData.newRawUri(mime.startsWith("video/")
                ? L10n.t(activity, "Video saved") : L10n.t(activity, "Photo saved"), request.uri));
        if (request.share) target.putExtra(Intent.EXTRA_STREAM, request.uri);
        else target.setDataAndType(request.uri, mime);
        try {
            activity.startActivity(request.share ? Intent.createChooser(target, L10n.t(activity, "Share")) : target);
        } catch (ActivityNotFoundException missing) {
            Feedback.show(activity.getApplicationContext(),
                    L10n.t(activity, "There's no app here that can open or share this saved file."), true);
        } catch (Exception failure) {
            Feedback.show(activity.getApplicationContext(),
                    L10n.t(activity, "Couldn't open or share that saved file. Try again."), true);
        }
    }

    private static final class Request {
        final Uri uri;
        final String mime;
        final boolean share;
        final long at = SystemClock.elapsedRealtime();
        Request(Uri uri, String mime, boolean share) {
            this.uri = uri;
            this.mime = mime;
            this.share = share;
        }
        boolean expired() { return SystemClock.elapsedRealtime() - at > LIFETIME_MS; }
    }
}
