/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.linkedin.extension;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ShortcutInfo;
import android.content.pm.ShortcutManager;
import android.graphics.drawable.Icon;
import android.view.View;

import java.util.Collections;

/**
 * Puts "Loki Patches" on the launcher's long-press menu for LinkedIn, opening the extension's own
 * settings activity.
 *
 * <p>This is the entry point that works on every build: the "Me" panel row depends on server
 * driven UI that LinkedIn can change at any time, a launcher shortcut does not.
 */
@SuppressWarnings("unused")
public final class SettingsShortcut {
    /** Keep the id stable: republishing updates the installed shortcut instead of adding a second. */
    private static final String SHORTCUT_ID = "loki_settings";
    private static final String SHORTCUT_LABEL = "Loki Patches";
    /** LinkedIn publishes its own shortcuts while starting up, so ours is republished after that. */
    private static final long REPUBLISH_DELAY_MS = 5000;

    private static boolean published;

    private SettingsShortcut() {
    }

    /**
     * Called from MainActivity.onCreate, which every launcher icon passes through. Also starts the
     * release notes dialog and the delayed re-publish of the shortcut.
     */
    public static void onMainActivityCreated(Activity activity) {
        published = true;
        publish();
        try {
            View root = activity.getWindow().getDecorView();
            Runnable offerNotes = () -> {
                if (activity.isFinishing()) return;
                WhatsNew.maybeShow(activity);
            };
            // Posted: a dialog shown while the activity is still being created is discarded.
            root.post(offerNotes);
            root.postDelayed(SettingsShortcut::publish, REPUBLISH_DELAY_MS);
        } catch (Throwable failure) {
            Diagnostics.error("onMainActivityCreated failed", failure);
        }
    }

    /** Publishes the shortcut once per app start, for callers that run before onCreate. */
    static void ensureRegistered() {
        if (published) return;
        published = true;
        publish();
    }

    /**
     * Adds the shortcut at rank 0, or moves the existing one back there. Rank decides whether the
     * launcher shows it at all: most launchers show four, and LinkedIn fills all four itself.
     */
    static void publish() {
        try {
            Context appContext = Settings.app();
            if (appContext == null) return;
            ShortcutManager shortcuts = appContext.getSystemService(ShortcutManager.class);
            if (shortcuts == null) return;

            ShortcutInfo shortcut = describe(appContext);
            removeStale(shortcuts, appContext);
            shortcuts.addDynamicShortcuts(Collections.singletonList(shortcut));
            Diagnostics.debug("launcher shortcut published");
        } catch (Throwable failure) {
            Diagnostics.error("Shortcut registration failed", failure);
        }
    }

    /**
     * Older versions published this shortcut under another id. Any dynamic shortcut that opens the settings screen
     * but carries a different id is one of those, and would otherwise show up twice in the launcher.
     */
    private static void removeStale(ShortcutManager shortcuts, Context appContext) {
        java.util.List<String> stale = new java.util.ArrayList<>();
        for (ShortcutInfo existing : shortcuts.getDynamicShortcuts()) {
            Intent intent = existing.getIntent();
            boolean opensSettings = intent != null && intent.getComponent() != null
                    && SettingsActivity.class.getName().equals(intent.getComponent().getClassName());
            if (opensSettings && !SHORTCUT_ID.equals(existing.getId())) stale.add(existing.getId());
        }
        if (!stale.isEmpty()) shortcuts.removeDynamicShortcuts(stale);
    }

    private static ShortcutInfo describe(Context appContext) {
        Intent open = new Intent(Intent.ACTION_VIEW);
        open.setClassName(appContext.getPackageName(), SettingsActivity.class.getName());
        open.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
        int iconResource = appContext.getApplicationInfo().icon;
        Icon icon = Icon.createWithResource(appContext, iconResource);
        return new ShortcutInfo.Builder(appContext, SHORTCUT_ID)
                .setShortLabel(SHORTCUT_LABEL)
                .setLongLabel(SHORTCUT_LABEL)
                .setIcon(icon)
                .setIntent(open)
                .setRank(0)
                .build();
    }
}
