/*
 * SPDX-License-Identifier: GPL-3.0-only
 * Copyright (C) 2026 ShortEnigma0
 * Part of expertraw-morphe-patches standalone patcher. See LICENSE in the repository root.
 */
package com.samsung.android.app.galaxyraw.mod;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.os.Handler;
import android.os.Looper;
import android.provider.Settings;
import android.util.Log;
import android.widget.Toast;
import com.samsung.android.app.galaxyraw.interfaces.CameraContext;
import java.lang.ref.WeakReference;

/**
 * MOD: Stock Expert RAW refreshes the latest-photo thumbnail from Samsung's secmedia draft row,
 * which a re-signed build cannot create. Instead, refresh once MediaScanner has indexed the saved
 * file (same calls as CameraGenericEventHandler.onPostPictureProcessingCompleted).
 */
public final class PpRefresh {
    private static final String TAG = "GrawMod";
    private static volatile WeakReference<CameraContext> sCtx = new WeakReference<>(null);
    private static volatile boolean sStoragePrompted = false;

    private PpRefresh() {}

    /** Called from GalaxyRaw.onResume. */
    public static void attach(Object activity) {
        if (activity instanceof CameraContext) sCtx = new WeakReference<>((CameraContext) activity);
        checkStoragePermission(activity);
    }

    private static void checkStoragePermission(Object activity) {
        if (!(activity instanceof Activity) || Build.VERSION.SDK_INT < Build.VERSION_CODES.R) {
            return;
        }
        try {
            if (Environment.isExternalStorageManager()) {
                return;
            }
        } catch (Throwable t) {
            Log.w(TAG, "isExternalStorageManager check failed: " + t);
            return;
        }

        if (sStoragePrompted) {
            return;
        }
        sStoragePrompted = true;

        final Activity act = (Activity) activity;
        new Handler(Looper.getMainLooper()).postDelayed(() -> {
            try {
                if (Environment.isExternalStorageManager()) {
                    return;
                }
                Toast.makeText(act, "Allow 'All files access' so Expert RAW can save photos", Toast.LENGTH_LONG).show();
                Intent intent = new Intent(Settings.ACTION_MANAGE_APP_ALL_FILES_ACCESS_PERMISSION);
                intent.setData(Uri.parse("package:" + act.getPackageName()));
                act.startActivity(intent);
            } catch (ActivityNotFoundException e) {
                try {
                    Intent intent = new Intent(Settings.ACTION_MANAGE_ALL_FILES_ACCESS_PERMISSION);
                    act.startActivity(intent);
                } catch (Exception ex) {
                    Log.w(TAG, "Could not open manage storage settings: " + ex);
                }
            } catch (Exception e) {
                Log.w(TAG, "Failed to launch storage permission settings: " + e);
            }
        }, 300L);
    }

    /** Called from PostProcessDBHelper's MediaScanner completion callback. */
    public static void onScanned(String path, Uri uri) {
        final CameraContext c = sCtx.get();
        if (c == null || uri == null) return;
        try {
            Handler h = c.getBackgroundHandler();
            if (h == null) return;
            h.postDelayed(() -> {
                try {
                    c.updateLatestMedia();
                    c.updateThumbnail();
                    Log.i("GrawMod", "thumbnail refreshed after scan: " + path);
                } catch (RuntimeException e) {
                    Log.w("GrawMod", "thumbnail refresh failed: " + e);
                }
            }, 300L);
        } catch (RuntimeException e) {
            Log.w("GrawMod", "thumbnail refresh not scheduled: " + e);
        }
    }
}
