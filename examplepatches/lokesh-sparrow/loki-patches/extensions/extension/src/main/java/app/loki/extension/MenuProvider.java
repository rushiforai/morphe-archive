/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.loki.extension;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.Intent;
import android.content.pm.ShortcutInfo;
import android.content.pm.ShortcutManager;
import android.database.Cursor;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Icon;
import android.net.Uri;
import android.os.Build;

import java.util.Collections;

/**
 * Starts with the app and puts "Loki Patches" on the launcher's long-press menu. Declared by the menu patch;
 * the extension itself ships no manifest entries.
 */
public final class MenuProvider extends ContentProvider {
    @Override
    public boolean onCreate() {
        // Splitwise's AMOLED switch layers its theme overlay onto every screen; registered before any activity.
        LokiSwitches.installAmoled(getContext());
        // A provider is created while the app is still in the background, and Android drops or throttles
        // dynamic shortcuts pushed from a background app: setDynamicShortcuts() returns without error and
        // nothing is stored. Republish a few seconds later, by which time the launcher activity is on screen.
        android.os.Handler handler = new android.os.Handler(android.os.Looper.getMainLooper());
        handler.postDelayed(this::publish, 5000);
        handler.postDelayed(this::publish, 20000);
        return true;
    }

    private void publish() {
        try {
            if (Build.VERSION.SDK_INT < 25 || getContext() == null) return;
            ShortcutManager shortcuts = getContext().getSystemService(ShortcutManager.class);
            if (shortcuts == null) return;
            Intent open = new Intent(getContext(), MenuActivity.class).setAction(Intent.ACTION_VIEW);
            ShortcutInfo shortcut = new ShortcutInfo.Builder(getContext(), "loki-patches")
                    .setShortLabel(MenuInfo.BRAND)
                    .setLongLabel(MenuInfo.BRAND)
                    .setIcon(brandIcon())
                    .setIntent(open)
                    .build();
            boolean pushed = shortcuts.setDynamicShortcuts(Collections.singletonList(shortcut));
            android.util.Log.i("Loki", "shortcut: pushed=" + pushed
                    + " stored=" + shortcuts.getDynamicShortcuts().size()
                    + " pinned=" + shortcuts.getPinnedShortcuts().size());
        } catch (Throwable error) {
            // A shortcut is a convenience. Failing to add one must not stop the app, but it must be visible in logcat.
            android.util.Log.e("Loki", "shortcut: failed", error);
        }
    }

    /** The long-press icon: the same accent tile with the puzzle piece every app uses. */
    private Icon brandIcon() {
        android.graphics.Bitmap bitmap = ((BitmapDrawable) LokiArt.tile(getContext())).getBitmap();
        return Build.VERSION.SDK_INT >= 26 ? Icon.createWithAdaptiveBitmap(bitmap) : Icon.createWithBitmap(bitmap);
    }

    @Override public Cursor query(Uri uri, String[] p, String s, String[] a, String o) { return null; }
    @Override public String getType(Uri uri) { return null; }
    @Override public Uri insert(Uri uri, ContentValues v) { return null; }
    @Override public int delete(Uri uri, String s, String[] a) { return 0; }
    @Override public int update(Uri uri, ContentValues v, String s, String[] a) { return 0; }
}
