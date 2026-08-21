package com.alightcreative.app.motion.persist;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.Context;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.net.Uri;

public class NoPopupSeedProvider extends ContentProvider {
    @Override
    public boolean onCreate() {
        Context context = getContext();
        if (context != null) {
            try {
                // 1. Seed dialog.xml (view=0, first=true)
                context.getSharedPreferences("dialog", Context.MODE_PRIVATE)
                    .edit()
                    .putBoolean("first", true)
                    .putInt("view", 0)
                    .commit();

                // 2. Seed aab.xml (ver_ses=true, ver_dev=true)
                context.getSharedPreferences("aab", Context.MODE_PRIVATE)
                    .edit()
                    .putBoolean("ver_ses", true)
                    .putBoolean("ver_dev", true)
                    .commit();

                // 3. Seed PkS.xml (ver_s=true)
                context.getSharedPreferences("PkS", Context.MODE_PRIVATE)
                    .edit()
                    .putBoolean("ver_s", true)
                    .putString("f_ln", "en")
                    .putString("f_tg", "en-GB")
                    .commit();

                // 4. Seed wdprefs1.xml (is_shown=true)
                context.getSharedPreferences("wdprefs1", Context.MODE_PRIVATE)
                    .edit()
                    .putBoolean("is_shown", true)
                    .commit();

                // 5. Seed AlbinModsDialogPrefs.xml (dont_show_again=true)
                context.getSharedPreferences("AlbinModsDialogPrefs", Context.MODE_PRIVATE)
                    .edit()
                    .putBoolean("dont_show_again", true)
                    .putBoolean("dialogLock", true)
                    .putInt("show_interval", 999999999)
                    .putLong("last_show_time", 9999999999999L)
                    .putBoolean("show_close_button", false)
                    .commit();

            } catch (Exception ignored) {
            }

            // Start PopupDismisser daemon
            PopupDismisser.onStart();
        }
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
