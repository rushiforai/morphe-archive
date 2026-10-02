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
 * Hides the chat-list story bar, avatar story rings and Post Story button, and stops fetching the
 * story list. Profile stories and archives remain available.
 */
public final class Stories {
    private Stories() {}

    public static boolean skipStoryRequests() {
        return skip("story list load suppressed");
    }

    public static boolean hideStoryBar() {
        return skip("story bar hidden");
    }

    /** Receives Telegram's own visibility decision for the Post Story camera. */
    public static boolean showStoryCamera(boolean visible) {
        return visible && !skip("story camera hidden");
    }

    public static boolean hideAvatarStories(Object params) {
        return scopedSkip(params, "avatar story ring hidden");
    }

    public static boolean hideAvatarStoryTouches(Object params) {
        return scopedSkip(params, "avatar story touch skipped");
    }

    private static boolean scopedSkip(Object params, String what) {
        if (!enabled()) return false;
        try {
            if (!isDialogAvatar(params)) return false;
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.HIDE_STORIES, "avatar scope", t);
            return false;
        }
        HookStatus.counted(FamilyNames.HIDE_STORIES, what);
        return true;
    }

    private static boolean skip(String what) {
        if (!enabled()) return false;
        HookStatus.counted(FamilyNames.HIDE_STORIES, what);
        return true;
    }

    private static boolean enabled() {
        HookStatus.invoked(FamilyNames.HIDE_STORIES);
        try {
            return Utils.settingsReady() && Settings.HIDE_STORIES.get();
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.HIDE_STORIES, "switch read", t);
            return false;
        }
    }

    /** Rewritten to recognize the discovered DialogCell params and exempt Share to Story cells. */
    static boolean isDialogAvatar(Object params) {
        return false;
    }
}
