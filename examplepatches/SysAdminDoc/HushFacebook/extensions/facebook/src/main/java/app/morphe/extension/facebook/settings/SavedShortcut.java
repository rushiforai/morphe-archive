/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.settings;

import android.app.Activity;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ShortcutInfo;
import android.content.pm.ShortcutManager;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.Icon;
import android.net.Uri;

import java.util.Collections;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;

import app.morphe.extension.shared.L10n;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

/**
 * An optional launcher entry for Facebook's public Saved route, and the Saved row the Menu gets
 * beside the Hushfacebook settings row. Never evicts another shortcut.
 */
public final class SavedShortcut {
    static final String ID = "hushfacebook_saved";
    private static final AtomicBoolean queued = new AtomicBoolean();
    enum Result { OFF, PUBLISHED, NO_ROOM, UNAVAILABLE }

    private SavedShortcut() { }

    static Intent intent(Context context) {
        return new Intent(Intent.ACTION_VIEW, Uri.parse("fb://saved"))
                .setPackage(context.getPackageName()).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
    }

    /** Whether the Saved row belongs in the Menu: the switch is on and this build opens the route itself. */
    public static boolean wanted(Context context) {
        return Utils.settingsReady() && Settings.SAVED_SHORTCUT.get() && destination(context) != null;
    }

    /**
     * Opens Facebook's Saved screen from [context], inside the current task when it's an activity.
     * False when this build has no Saved route of its own or Android refused to start it.
     */
    public static boolean open(Context context) {
        try {
            Intent route = intent(context);
            ComponentName destination = destination(context);
            if (destination == null) return false;
            route.setComponent(destination);
            if (context instanceof Activity) route.setFlags(route.getFlags() & ~Intent.FLAG_ACTIVITY_NEW_TASK);
            context.startActivity(route);
            return true;
        } catch (RuntimeException failure) {
            Logger.printException(() -> "Saved shortcut: could not open Saved", failure);
            return false;
        }
    }

    /** The activity of this package that takes the Saved route, or null. */
    private static ComponentName destination(Context context) {
        ComponentName destination = intent(context).resolveActivity(context.getPackageManager());
        return destination != null && context.getPackageName().equals(destination.getPackageName()) ? destination : null;
    }

    static void refresh(Context context) {
        if (!queued.compareAndSet(false, true)) return;
        Context app = context.getApplicationContext();
        boolean accepted = Utils.runOnBackgroundThread(() -> {
            try {
                refreshNow(app == null ? context : app);
            } finally {
                queued.set(false);
            }
        });
        if (!accepted) queued.set(false);
    }

    /** Settings changes give immediate feedback; application starts quietly retry when needed. */
    static void changed(Context context) {
        Utils.runOnBackgroundThread(() -> {
            Result result = refreshNow(context);
            if (result == Result.NO_ROOM) {
                Utils.showToastShort(L10n.t("Your launcher has no room for another shortcut."));
            } else if (result == Result.UNAVAILABLE) {
                Utils.showToastShort(L10n.t("Saved isn't available in this build."));
            }
        });
    }

    static synchronized Result refreshNow(Context context) {
        try {
            ShortcutManager manager = context.getSystemService(ShortcutManager.class);
            if (manager == null) return Result.UNAVAILABLE;
            if (!Utils.settingsReady() || !Settings.SAVED_SHORTCUT.get()) {
                manager.removeDynamicShortcuts(Collections.singletonList(ID));
                return Result.OFF;
            }
            Intent route = intent(context);
            ComponentName destination = destination(context);
            if (destination == null) {
                manager.removeDynamicShortcuts(Collections.singletonList(ID));
                return Result.UNAVAILABLE;
            }
            route.setComponent(destination);
            List<ShortcutInfo> shortcuts = manager.getDynamicShortcuts();
            ShortcutInfo existing = null;
            int rank = 0;
            for (ShortcutInfo shortcut : shortcuts) {
                if (ID.equals(shortcut.getId())) existing = shortcut;
                else rank = Math.max(rank, shortcut.getRank() + 1);
            }
            String label = L10n.t(context, "Saved");
            if (existing != null && label.contentEquals(existing.getShortLabel())
                    && route.filterEquals(existing.getIntent())) return Result.PUBLISHED;
            if (existing == null && shortcuts.size() + manager.getManifestShortcuts().size()
                    >= manager.getMaxShortcutCountPerActivity()) return Result.NO_ROOM;
            ShortcutInfo shortcut = new ShortcutInfo.Builder(context, ID)
                    .setShortLabel(label).setLongLabel(label)
                    .setIcon(icon(context))
                    .setIntent(route).setRank(existing == null ? rank : existing.getRank()).build();
            // addDynamicShortcuts refuses a full activity. pushDynamicShortcut would evict its last entry.
            boolean published = existing == null
                    ? manager.addDynamicShortcuts(Collections.singletonList(shortcut))
                    : manager.updateShortcuts(Collections.singletonList(shortcut));
            return published ? Result.PUBLISHED : Result.UNAVAILABLE;
        } catch (RuntimeException failure) {
            Logger.printException(() -> "Saved shortcut: could not update the launcher entry", failure);
            return Result.UNAVAILABLE;
        }
    }

    private static Icon icon(Context context) {
        int size = Math.max(1, Math.round(48 * context.getResources().getDisplayMetrics().density));
        Bitmap bitmap = Bitmap.createBitmap(size, size, Bitmap.Config.ARGB_8888);
        Drawable drawable = context.getDrawable(android.R.drawable.ic_menu_save);
        if (drawable == null) throw new IllegalStateException("Saved icon unavailable");
        drawable.setBounds(0, 0, size, size);
        drawable.draw(new Canvas(bitmap));
        // Android rejects resource icons from a package other than the shortcut's owner.
        return Icon.createWithBitmap(bitmap);
    }
}
