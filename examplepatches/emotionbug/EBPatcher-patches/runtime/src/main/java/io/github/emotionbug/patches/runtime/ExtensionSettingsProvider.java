package io.github.emotionbug.patches.runtime;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.database.Cursor;
import android.net.Uri;
import android.os.Binder;
import android.os.Bundle;

/** Same-UID settings, summary commits and serialized status publication in the original phone process. */
public final class ExtensionSettingsProvider extends ContentProvider {
    static final String APPLY_SUMMARY = "apply-summary";
    static final String SUMMARY_STATUS = "summary-status";
    @Override public boolean onCreate() {
        SummaryNotifications.initialize(getContext());
        return true;
    }

    @Override public Bundle call(String method, String argument, Bundle extras) {
        if (Binder.getCallingUid() != android.os.Process.myUid())
            throw new SecurityException("Only this application UID may access extension settings");
        if (SUMMARY_STATUS.equals(method)) return SummaryNotifications.status(getContext(), argument, extras);
        if (APPLY_SUMMARY.equals(method)) {
            long jobId = Long.parseLong(argument);
            if (jobId <= 0) throw new IllegalArgumentException("A persisted summary job is required");
            SummaryStore.get(getContext());
            AdotSummaryHooks.applyJob(jobId);
            Bundle result = new Bundle();
            result.putBoolean("requested", true);
            return result;
        }
        if (!ExtensionSettings.READ.equals(method)) throw new IllegalArgumentException("Unknown settings operation");
        Bundle values = new Bundle();
        values.putBoolean(ExtensionSettings.FAILURE_TOASTS,
                ExtensionSettings.local(getContext()).getBoolean(ExtensionSettings.FAILURE_TOASTS, true));
        values.putBoolean(ExtensionSettings.SEPARATE_CHANNELS,
                ExtensionSettings.local(getContext()).getBoolean(ExtensionSettings.SEPARATE_CHANNELS, false));
        return values;
    }

    @Override public Cursor query(Uri uri, String[] projection, String selection, String[] arguments, String order) {
        throw new UnsupportedOperationException("Use the read call");
    }
    @Override public String getType(Uri uri) { throw new UnsupportedOperationException("Use the read call"); }
    @Override public Uri insert(Uri uri, ContentValues values) { throw new UnsupportedOperationException("Read only"); }
    @Override public int delete(Uri uri, String selection, String[] arguments) { throw new UnsupportedOperationException("Read only"); }
    @Override public int update(Uri uri, ContentValues values, String selection, String[] arguments) {
        throw new UnsupportedOperationException("Read only");
    }
}
