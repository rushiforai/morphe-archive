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

    /** Tasker's overflow menu entry; an id far outside the ones Tasker's own switch handles. */
    private static final int TASKER_ITEM_ID = 0x4C4F4B49;

    /** Tasker: adds the row to the end of the overflow menu Tasker has just built. Never throws into the host. */
    public static void taskerAdd(android.view.Menu menu) {
        try {
            if (menu != null) menu.add(0, TASKER_ITEM_ID, 0, title());
        } catch (Throwable error) {
            LokiLog.note("menu row: could not add to Tasker's menu: " + error);
        }
    }

    /** Tasker: true when the tap was ours (and the Loki Patches screen is opening), false to let Tasker handle it. */
    public static boolean taskerSelected(Context context, android.view.MenuItem item) {
        try {
            if (item == null || item.getItemId() != TASKER_ITEM_ID) return false;
            open(context);
            return true;
        } catch (Throwable error) {
            return false;
        }
    }



    /** Generic options-menu row (ADM, TrackChecker): same item as Tasker's, added after the host built its menu. */
    public static void optionsAdd(android.view.Menu menu) {
        taskerAdd(menu);
    }

    private static android.view.Menu rememberedMenu;

    /** Called when the host starts building its menu: the menu to add the row to once it has finished. */
    public static void optionsRemember(android.view.Menu menu) {
        rememberedMenu = menu;
    }

    /** Called at each return of the host's menu builder: adds the row to the remembered menu, once. */
    public static void optionsAddRemembered() {
        try {
            android.view.Menu menu = rememberedMenu;
            if (menu != null && menu.findItem(TASKER_ITEM_ID) == null) taskerAdd(menu);
        } catch (Throwable error) {
            LokiLog.note("menu row: could not add to the host menu: " + error);
        }
    }

    public static boolean optionsSelected(Context context, android.view.MenuItem item) {
        return taskerSelected(context, item);
    }

    /**
     * 1DM: takes over the drawer's old "Upgrade to 1DM+" row. The view is the app's own, so it keeps the drawer's
     * padding, colours and ripple; this gives it the Loki Patches text, the puzzle icon and the tap. Never throws.
     */
    public static void idmRow(View view) {
        try {
            if (!(view instanceof android.widget.TextView)) return;
            android.widget.TextView text = (android.widget.TextView) view;
            text.setVisibility(View.VISIBLE);
            text.setText(title());
            // The view was the 1DM+ sales row: a green fill and white text. Give it what the drawer's own rows have.
            android.content.res.TypedArray theme = text.getContext().obtainStyledAttributes(new int[] {
                android.R.attr.selectableItemBackground, android.R.attr.textColorSecondary});
            try {
                text.setBackground(theme.getDrawable(0));
                android.content.res.ColorStateList color = theme.getColorStateList(1);
                if (color != null) text.setTextColor(color);
            } finally {
                theme.recycle();
            }
            int size = Math.round(24 * text.getResources().getDisplayMetrics().density);
            android.graphics.drawable.Drawable puzzle =
                new app.linkedin.extension.IconDrawable(app.linkedin.extension.IconDrawable.EXTENSION, text.getCurrentTextColor());
            puzzle.setBounds(0, 0, size, size);
            text.setCompoundDrawablesRelative(puzzle, null, null, null);
            text.setOnClickListener(photosClick());
        } catch (Throwable error) {
            LokiLog.note("menu row: could not set up the 1DM drawer row: " + error);
        }
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
