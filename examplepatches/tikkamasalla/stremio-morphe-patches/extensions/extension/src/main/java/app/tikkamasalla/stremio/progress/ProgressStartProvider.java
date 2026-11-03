package app.tikkamasalla.stremio.progress;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.database.Cursor;
import android.net.Uri;

/**
 * Process-start hook with no bytecode patch: a content provider declared in the manifest is
 * created when Stremio's process starts, before Application.onCreate, even when the process was
 * started for a reason other than the user opening the app (reboot, sync, boot receiver). It
 * installs the resume watch that checks for an outstanding external-player handoff (see
 * ExternalProgress.coldStart). It serves no data and is not exported.
 */
public final class ProgressStartProvider extends ContentProvider {
    @Override
    public boolean onCreate() {
        try {
            ExternalProgress.coldStart(getContext());
        } catch (Throwable ignored) {
        }
        return true;
    }

    @Override
    public Cursor query(Uri uri, String[] projection, String selection, String[] args, String order) {
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
    public int delete(Uri uri, String selection, String[] args) {
        return 0;
    }

    @Override
    public int update(Uri uri, ContentValues values, String selection, String[] args) {
        return 0;
    }
}
