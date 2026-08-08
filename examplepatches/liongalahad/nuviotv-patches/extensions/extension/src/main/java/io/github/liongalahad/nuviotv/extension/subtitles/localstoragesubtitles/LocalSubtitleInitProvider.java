package io.github.liongalahad.nuviotv.extension.subtitles.localstoragesubtitles;

import android.app.Activity;
import android.app.Application;
import android.content.ContentProvider;
import android.content.ContentValues;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;

/** Initializes process-local activity tracking without modifying Nuvio application state. */
public final class LocalSubtitleInitProvider extends ContentProvider {
    @Override
    public boolean onCreate() {
        if (getContext() == null) return false;
        LocalSubtitleRuntime.initialize(getContext());
        Application application = (Application) getContext().getApplicationContext();
        application.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
            @Override public void onActivityCreated(Activity activity, Bundle state) {}
            @Override public void onActivityStarted(Activity activity) {}
            @Override public void onActivityResumed(Activity activity) { LocalSubtitleRuntime.onActivityResumed(activity); }
            @Override public void onActivityPaused(Activity activity) { LocalSubtitleRuntime.onActivityPaused(activity); }
            @Override public void onActivityStopped(Activity activity) {}
            @Override public void onActivitySaveInstanceState(Activity activity, Bundle state) {}
            @Override public void onActivityDestroyed(Activity activity) {}
        });
        return true;
    }

    @Override public String getType(Uri uri) { return null; }
    @Override public Cursor query(Uri uri, String[] projection, String selection, String[] args, String order) { return null; }
    @Override public Uri insert(Uri uri, ContentValues values) { return null; }
    @Override public int delete(Uri uri, String selection, String[] args) { return 0; }
    @Override public int update(Uri uri, ContentValues values, String selection, String[] args) { return 0; }
}
