/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.loki.extension;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.view.View;

/**
 * The "Loki Patches" rows that patches add inside an app's own screens (the Google Photos
 * account menu). The row is built by the app's own code; this supplies its text, icon and what a tap does.
 */
public final class LokiRows {
    private LokiRows() {
    }

    public static String title() {
        return "Loki Patches";
    }



    /** Teal glyph for the Photos account menu. */
    public static int photosIcon() {
        return drawable("loki_glyph");
    }

    /** A fresh view id for the Photos row, so it never collides with the menu's own rows. */
    public static int viewId() {
        return View.generateViewId();
    }


    /** Photos: the account menu row's tap. */
    public static View.OnClickListener photosClick() {
        return new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                open(view == null ? null : view.getContext());
            }
        };
    }

    private static void open(Context from) {
        try {
            Activity activity = activityOf(from);
            Context context = activity != null ? activity : LokiLog.application();
            if (context == null) return;
            Intent intent = new Intent(context, MenuActivity.class);
            if (activity == null) intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            context.startActivity(intent);
        } catch (Throwable error) {
            LokiLog.note("menu row: could not open: " + error);
        }
    }

    private static Activity activityOf(Context context) {
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity) return (Activity) context;
            context = ((ContextWrapper) context).getBaseContext();
        }
        return null;
    }

    private static int drawable(String name) {
        try {
            Context context = LokiLog.application();
            if (context == null) return 0;
            return context.getResources().getIdentifier(name, "drawable", context.getPackageName());
        } catch (Throwable error) {
            return 0;
        }
    }
}
