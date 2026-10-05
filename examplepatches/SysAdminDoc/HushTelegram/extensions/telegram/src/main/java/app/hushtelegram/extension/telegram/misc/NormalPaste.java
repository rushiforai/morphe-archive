/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.content.ClipData;
import android.content.ClipDescription;
import android.content.ClipboardManager;
import android.content.Context;
import android.view.View;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/** Uses Android's plain-text paste at the two Telegram HTML conversion entries. */
public final class NormalPaste {
    private NormalPaste() {}

    public static int contextMenuAction(View editor, int action) {
        HookStatus.invoked(FamilyNames.NORMAL_PASTE);
        if (action != android.R.id.paste || editor == null) return action;
        try {
            if (!Utils.settingsReady() || !Settings.NORMAL_PASTE.get()) return action;
            ClipboardManager clipboard = (ClipboardManager) editor.getContext().getSystemService(Context.CLIPBOARD_SERVICE);
            ClipData clip = clipboard == null ? null : clipboard.getPrimaryClip();
            if (clip == null || clip.getItemCount() == 0) return action;
            ClipDescription description = clip.getDescription();
            // Telegram's image-paste handler stays reachable. No clipboard data is changed.
            if (description == null || description.hasMimeType("image/*")) return action;
            if (!description.hasMimeType("text/plain") && !description.hasMimeType("text/html")
                    && !description.hasMimeType("text/uri-list")) return action;
            HookStatus.counted(FamilyNames.NORMAL_PASTE, "plain text paste");
            return android.R.id.pasteAsPlainText;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.NORMAL_PASTE, "paste action", failure);
            return action;
        }
    }
}
