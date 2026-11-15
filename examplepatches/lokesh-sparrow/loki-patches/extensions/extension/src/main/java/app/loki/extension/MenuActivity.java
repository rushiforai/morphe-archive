/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.loki.extension;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.os.Handler;
import android.os.Looper;
import android.view.View;

import app.linkedin.extension.SettingsActivity;

/**
 * The Loki Patches screen in every app other than LinkedIn. It is the same screen LinkedIn has (one engine,
 * one look); only the app's own pages differ, and those are chosen from the package it runs in.
 */
public final class MenuActivity extends SettingsActivity {

    /** Opens the screen in place of {@code activity}, which closes without being drawn. */
    public static void replace(Activity activity) {
        try {
            activity.startActivity(new Intent(activity, MenuActivity.class));
            activity.overridePendingTransition(0, 0);
        } catch (Throwable error) {
            LokiLog.note("menu: could not open from " + activity.getClass().getSimpleName() + ": " + error);
        }
        activity.finish();
    }

    /**
     * Opens the screen in place of an in-app page (a fragment) whose view is being created: the menu starts, and
     * the host steps back out of that page so returning from the menu lands where the user came from.
     */
    public static void replacePage(View pageView) {
        final Activity host = activityOf(pageView == null ? null : pageView.getContext());
        if (host == null) {
            LokiLog.note("menu: page has no activity");
            return;
        }
        // Leave the page once the current fragment transaction has finished, then open the menu. Leaving first
        // matters: once the menu covers the host, the host has saved its state and may refuse to pop the page.
        new Handler(Looper.getMainLooper()).post(new Runnable() {
            @Override
            public void run() {
                try {
                    host.onBackPressed();
                } catch (Throwable error) {
                    LokiLog.note("menu: could not leave the page: " + error);
                }
                try {
                    host.startActivity(new Intent(host, MenuActivity.class));
                    host.overridePendingTransition(0, 0);
                } catch (Throwable error) {
                    LokiLog.note("menu: could not open from page: " + error);
                }
            }
        });
    }

    private static Activity activityOf(Context context) {
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity) return (Activity) context;
            context = ((ContextWrapper) context).getBaseContext();
        }
        return null;
    }
}
