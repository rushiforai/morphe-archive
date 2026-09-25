/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.privacy;

import android.content.ContentResolver;
import android.database.Cursor;
import android.database.MatrixCursor;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.CancellationSignal;
import android.provider.ContactsContract;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.tiktok.settings.Settings;

/**
 * Contact reads answered with an empty cursor while the switch is on.
 *
 * <p>Every ContentResolver.query TikTok makes lands here, whatever it is asking for, so the
 * authority decides: only the contacts provider is refused, and the media store and the rest
 * are handed straight through. A read before the settings context exists is refused too, since
 * the patch was chosen to block and a missing context is not a reader's choice.
 */
@SuppressWarnings("unused")
public final class ContactListBlocker {

    private static boolean blocks(Uri uri) {
        if (uri == null || !ContactsContract.AUTHORITY.equals(uri.getAuthority())) return false;
        if (Utils.getContext() != null && !Settings.BLOCK_CONTACT_LIST.get()) return false;
        Logger.printInfo(() -> "Contact list blocker: blocked a query to " + uri);
        return true;
    }

    private static Cursor empty(String[] projection) {
        return new MatrixCursor(projection != null ? projection : new String[]{"_id"});
    }

    public static Cursor interceptQuery(ContentResolver resolver, Uri uri, String[] projection,
            String selection, String[] selectionArgs, String sortOrder) {
        if (blocks(uri)) return empty(projection);
        return resolver.query(uri, projection, selection, selectionArgs, sortOrder);
    }

    public static Cursor interceptQuery(ContentResolver resolver, Uri uri, String[] projection,
            String selection, String[] selectionArgs, String sortOrder, CancellationSignal signal) {
        if (blocks(uri)) return empty(projection);
        return resolver.query(uri, projection, selection, selectionArgs, sortOrder, signal);
    }

    public static Cursor interceptQuery(ContentResolver resolver, Uri uri, String[] projection,
            Bundle queryArgs, CancellationSignal signal) {
        if (blocks(uri)) return empty(projection);
        // TikTok only reaches this overload where it exists; the branch below it is for the
        // API floor's benefit and never runs.
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            return resolver.query(uri, projection, queryArgs, signal);
        }
        return resolver.query(uri, projection, null, null, null, signal);
    }

    private ContactListBlocker() {}
}
