/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Stops Telegram asking its server for link previews of messages that haven't been sent. Each hook
 * sits after the builder has found a link and before the request, and a skip takes the builder's
 * own path for a draft with nothing to preview. Sent messages keep their server preview.
 */
public final class DraftPreviews {
    private DraftPreviews() {}

    /** ChatActivity's link search, on Telegram's search queue. */
    public static boolean skipChatPreview() {
        return skip("chat draft preview skipped");
    }

    /** The share sheet's comment field. */
    public static boolean skipSharePreview() {
        return skip("share comment preview skipped");
    }

    /** A link attached to a poll, on a cache miss only. */
    public static boolean skipPollPreview() {
        return skip("poll link preview skipped");
    }

    /** The story link sheet, before it schedules its delayed request. */
    public static boolean skipStoryLinkPreview() {
        return skip("story link preview skipped");
    }

    /** A message a mini app prepared for sharing; the sheet then opens without a preview. */
    public static boolean skipBotSharePreview() {
        return skip("bot share preview skipped");
    }

    private static boolean skip(String what) {
        HookStatus.invoked(FamilyNames.DISABLE_DRAFT_PREVIEWS);
        try {
            if (!Utils.settingsReady() || !Settings.DISABLE_DRAFT_PREVIEWS.get()) return false;
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.DISABLE_DRAFT_PREVIEWS, "switch read", t);
            return false;
        }
        HookStatus.counted(FamilyNames.DISABLE_DRAFT_PREVIEWS, what);
        return true;
    }
}
