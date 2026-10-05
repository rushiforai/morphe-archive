/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.ui;

import android.view.View;

import app.hushpinterest.extension.pinterest.settings.FamilyNames;
import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;
import app.hushpinterest.extension.shared.settings.BooleanSetting;

/** Runtime decisions for the specific UI paths matched by the patch bundle. */
public final class UiHooks {
    private UiHooks() {}

    static boolean enabled(String family, BooleanSetting setting) {
        HookStatus.invoked(family);
        try {
            return Utils.settingsReady() && setting.get();
        } catch (Throwable failure) {
            HookStatus.threw(family, "switch read", failure);
            return false;
        }
    }

    public static boolean hideScreenshotShare() {
        return enabled(FamilyNames.HIDE_SCREENSHOT_SHARE, Settings.HIDE_SCREENSHOT_SHARE);
    }

    public static boolean quietEmailReminder() {
        return enabled(FamilyNames.QUIET_EMAIL_REMINDER, Settings.QUIET_EMAIL_REMINDER);
    }

    public static boolean disableUpdateNag() {
        return enabled(FamilyNames.DISABLE_UPDATE_NAG, Settings.DISABLE_UPDATE_NAG);
    }

    public static int searchHistoryVisibility(int requested) {
        return enabled(FamilyNames.HIDE_SEARCH_HISTORY, Settings.HIDE_SEARCH_HISTORY) ? View.GONE : requested;
    }

    public static int searchHistoryMeasureSpec(int requested) {
        return enabled(FamilyNames.HIDE_SEARCH_HISTORY, Settings.HIDE_SEARCH_HISTORY)
                ? View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.EXACTLY) : requested;
    }

    public static int commentsVisibility(int requested) {
        return enabled(FamilyNames.HIDE_COMMENTS, Settings.HIDE_COMMENTS) ? View.GONE : requested;
    }

    public static int commentsMeasureSpec(int requested) {
        return enabled(FamilyNames.HIDE_COMMENTS, Settings.HIDE_COMMENTS)
                ? View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.EXACTLY) : requested;
    }

    public static boolean commentsVisible(boolean requested) {
        return enabled(FamilyNames.HIDE_COMMENTS, Settings.HIDE_COMMENTS) ? false : requested;
    }
}
