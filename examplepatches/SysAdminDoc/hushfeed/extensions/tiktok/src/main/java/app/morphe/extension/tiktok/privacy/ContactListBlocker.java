/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.privacy;

import android.content.ContentResolver;
import android.database.Cursor;
import android.database.MatrixCursor;
import android.net.Uri;
import android.provider.ContactsContract;

import app.morphe.extension.shared.Logger;

@SuppressWarnings("unused")
public final class ContactListBlocker {

    private static final String CONTACTS_AUTHORITY = ContactsContract.AUTHORITY;

    public static Cursor interceptQuery(ContentResolver resolver, Uri uri,
            String[] projection, String selection, String[] selectionArgs) {
        if (uri != null && CONTACTS_AUTHORITY.equals(uri.getAuthority())) {
            Logger.printInfo(() -> "Contact list blocker: blocked query to " + uri);
            return new MatrixCursor(projection != null ? projection : new String[]{"_id"});
        }
        return resolver.query(uri, projection, selection, selectionArgs, null);
    }

    private ContactListBlocker() {}
}
