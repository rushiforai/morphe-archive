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

/**
 * Shows which of Telegram's data centers holds a profile's photo, in the same profile menu as the
 * local ID row and right under it. The number comes from the photo Telegram already caches for
 * that user or chat, so nothing is asked of the server, and a profile without a photo gets no row.
 * Its switch is separate from the ID row's, and either one works alone.
 */
public final class ProfileDc {
    private ProfileDc() {}

    /** Called by {@link LocalIds#addToProfile} after its own row, whatever the ID switch says. */
    static void addToProfile(View menu, long userId, long chatId) {
        if (menu == null || !on()) return;
        try {
            addRow(menu, userId > 0 ? userPhotoDc(userId) : chatPhotoDc(chatId));
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SHOW_LOCAL_IDS, "data center row", failure);
        }
    }

    /** Adds the row for data center {@code dc}. True when it did; a number Telegram doesn't use adds nothing. */
    static boolean addRow(View menu, int dc) {
        if (menu == null || !valid(dc) || !on()) return false;
        View row = LocalIds.nativeAddRow(menu, label(menu.getContext(), dc));
        if (row == null) return false;
        bindRow(menu, row, dc);
        HookStatus.counted(FamilyNames.SHOW_LOCAL_IDS, "data center shown");
        return true;
    }

    /** Telegram's production data centers are numbered 1 to 5, and a photo-less profile reads 0. */
    static boolean valid(int dc) {
        return dc >= 1 && dc <= 5;
    }

    static String label(Context context, int dc) {
        return L10n.f(context, "Data center %1$s", Integer.toString(dc));
    }

    static void bindRow(View menu, View row, int dc) {
        String text = label(row.getContext(), dc);
        row.setContentDescription(L10n.f(row.getContext(), "Copy data center %1$s", Integer.toString(dc)));
        row.setOnClickListener(clicked -> {
            if (!on()) return;
            try {
                ClipboardManager clipboard = (ClipboardManager) clicked.getContext().getSystemService(Context.CLIPBOARD_SERVICE);
                if (clipboard == null) return;
                clipboard.setPrimaryClip(ClipData.newPlainText(text, text));
                LocalIds.nativeDismiss(menu);
                Toast.makeText(clicked.getContext(), L10n.t(clicked.getContext(), "Data center copied"), Toast.LENGTH_SHORT).show();
            } catch (Throwable failure) {
                HookStatus.threw(FamilyNames.SHOW_LOCAL_IDS, "data center copy", failure);
            }
        });
        // A switch change, Pause or safe mode hides an already built menu before its next draw.
        row.getViewTreeObserver().addOnPreDrawListener(() -> {
            row.setVisibility(on() ? View.VISIBLE : View.GONE);
            return true;
        });
        row.setVisibility(on() ? View.VISIBLE : View.GONE);
    }

    static boolean on() {
        try {
            return Utils.settingsReady() && Settings.PROFILE_DATA_CENTER.get();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SHOW_LOCAL_IDS, "data center switch", failure);
            return false;
        }
    }

    /** Replaced when patching: the data center of the cached user's profile photo, or 0 without one. */
    public static int userPhotoDc(long userId) { return 0; }
    /** Replaced when patching: the data center of the cached chat's photo, or 0 without one. */
    public static int chatPhotoDc(long chatId) { return 0; }
}
