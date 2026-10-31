package app.morphe.extension.mapsautomotive.patches;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.database.Cursor;
import android.net.Uri;

/**
 * Owner of the energy-model authority that BydBatteryPatch gives Maps' OEM listener.
 * <p>
 * On Android 8+ registering a ContentObserver or notifying a change for an authority that no
 * installed provider serves throws SecurityException, and Maps registers its observer during the
 * application start. This provider exists only so that the authority resolves; it serves nothing.
 * Maps reads the model through BydBatteryPatch.openEnergyModel, because its safe resolver refuses a
 * provider of Maps' own package.
 */
public final class BydEnergyModelProvider extends ContentProvider {
    @Override
    public boolean onCreate() {
        return true;
    }

    @Override
    public Cursor query(Uri uri, String[] projection, String selection, String[] selectionArgs, String sortOrder) {
        return null;
    }

    @Override
    public String getType(Uri uri) {
        return null;
    }

    @Override
    public Uri insert(Uri uri, ContentValues values) {
        return null;
    }

    @Override
    public int delete(Uri uri, String selection, String[] selectionArgs) {
        return 0;
    }

    @Override
    public int update(Uri uri, ContentValues values, String selection, String[] selectionArgs) {
        return 0;
    }
}
