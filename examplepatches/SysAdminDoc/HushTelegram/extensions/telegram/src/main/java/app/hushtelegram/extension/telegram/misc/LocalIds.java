/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.view.View;
import android.widget.Toast;
import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/** Local IDs from the inspected ProfileActivity. Never reads a peer object or access hash. */
public final class LocalIds {
    private LocalIds() {}

    public static void addToProfile(View menu, long userId, long chatId) {
        HookStatus.invoked(FamilyNames.SHOW_LOCAL_IDS);
        if (menu == null || !enabled() || !valid(userId, chatId)) return;
        try {
            View row = nativeAddRow(menu, label(menu.getContext(), userId, chatId));
            if (row != null) bindRow(menu, row, userId, chatId);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SHOW_LOCAL_IDS, "local inspection row", failure);
        }
    }

    static boolean valid(long userId, long chatId) {
        return (userId > 0 && chatId == 0) || (chatId > 0 && userId == 0);
    }

    static String label(Context context, long userId, long chatId) {
        return L10n.f(context, userId > 0 ? "User ID %1$s" : "Chat ID %1$s",
                Long.toString(userId > 0 ? userId : chatId));
    }

    static void bindRow(View menu, View row, long userId, long chatId) {
        if (!valid(userId, chatId)) { row.setVisibility(View.GONE); return; }
        row.setContentDescription(L10n.f(row.getContext(), userId > 0 ? "Copy user ID %1$s" : "Copy chat ID %1$s",
                Long.toString(userId > 0 ? userId : chatId)));
        row.setOnClickListener(clicked -> {
            if (!enabled()) return;
            try {
                ClipboardManager clipboard = (ClipboardManager) clicked.getContext().getSystemService(Context.CLIPBOARD_SERVICE);
                if (clipboard == null) return;
                clipboard.setPrimaryClip(ClipData.newPlainText(L10n.t(clicked.getContext(), "ID"),
                        Long.toString(userId > 0 ? userId : chatId)));
                nativeDismiss(menu);
                Toast.makeText(clicked.getContext(), L10n.t(clicked.getContext(), "ID copied"), Toast.LENGTH_SHORT).show();
                HookStatus.counted(FamilyNames.SHOW_LOCAL_IDS, "local ID copied");
            } catch (Throwable failure) {
                HookStatus.threw(FamilyNames.SHOW_LOCAL_IDS, "local ID copy", failure);
            }
        });
        // A switch change, Pause or safe mode hides an already built menu before its next draw.
        row.getViewTreeObserver().addOnPreDrawListener(() -> {
            row.setVisibility(enabled() ? View.VISIBLE : View.GONE);
            return true;
        });
        row.setVisibility(enabled() ? View.VISIBLE : View.GONE);
    }

    private static boolean enabled() {
        try {
            return Utils.settingsReady() && Settings.SHOW_LOCAL_IDS.get();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SHOW_LOCAL_IDS, "inspection switch", failure);
            return false;
        }
    }

    /** Replaced with the verified native submenu factory when patching. */
    public static View nativeAddRow(Object menu, String text) { return null; }
    /** Replaced with the verified native popup dismissal when patching. */
    public static void nativeDismiss(Object menu) {}
}
