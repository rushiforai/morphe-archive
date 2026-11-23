package nl.johninnl.deezer.queue;

import android.content.ContentValues;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;

/** Delegates to the original provider bodies without changing SQL, results or exceptions. */
public interface NativeProvider {
    Uri queueInsert(Uri uri, ContentValues values) throws Throwable;
    int queueBulkInsert(Uri uri, ContentValues[] values) throws Throwable;
    int queueDelete(Uri uri, String where, String[] args) throws Throwable;
    int queueUpdate(Uri uri, ContentValues values, String where, String[] args) throws Throwable;
    Bundle queueCall(String method, String argument, Bundle extras) throws Throwable;
    Cursor queueQuery(Uri uri, String[] columns, String where, String[] args, String order) throws Throwable;
}
