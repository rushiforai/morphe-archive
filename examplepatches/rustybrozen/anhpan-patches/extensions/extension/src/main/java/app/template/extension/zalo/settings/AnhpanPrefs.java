package app.template.extension.zalo.settings;

import android.content.Context;
import android.content.SharedPreferences;

public final class AnhpanPrefs {
    private static final String PREFS_NAME = "anhpan_zalo_prefs";
    public static final String HIDE_SEARCH_BAR = "hide_search_bar";
    public static final String HIDE_QR_BUTTON = "hide_qr_button";
    public static final String HIDE_PLUS_BUTTON = "hide_plus_button";
    public static final String CHAT_HIGHLIGHT_TOGGLE = "chat_highlight_toggle";
    public static final String HIDE_QUICK_HEART = "hide_quick_heart";
    public static final String HIDE_QUICK_SHARE = "hide_quick_share";
    public static final String ENABLE_READ_ONLY = "enable_read_only";
    public static final String READ_ONLY_NO_HIGHLIGHT = "read_only_no_highlight";
    public static final String READ_ONLY_HIDE_AVATAR = "read_only_hide_avatar";
    public static final String READ_ONLY_NO_COLOR_NAME = "read_only_no_color_name";
    public static final String HIDE_READ_ONLY_SUBTITLE = "hide_read_only_subtitle";
    public static final String REMOVE_CHAT_BUBBLE_BORDER = "remove_chat_bubble_border";
    public static final String HIDE_DRAFT_PREVIEW = "hide_draft_preview";
    public static final String STRIP_PREVIEW_EMOJI = "strip_preview_emoji";
    public static final String STRIP_NAME_EMOJI = "strip_name_emoji";
    public static final String HIDE_CLOUD_MY_CLOUD = "hide_cloud_my_cloud";
    public static final String HIDE_OFFICIAL_ACCOUNTS = "hide_official_accounts";
    public static final String HIDE_MUTE_ICON = "hide_mute_icon";
    public static final String HIDE_CHAT_TIME = "hide_chat_time";
    public static final String KEEP_RECALLED_MESSAGES = "keep_recalled_messages";
    private static final String LOCKED_CHATS = "locked_chats";
    private static final String NO_HIGHLIGHT_CHATS = "no_highlight_chats";
    private static final String HIDE_PREVIEW_CHATS = "hide_preview_chats";
    private static final String HIDE_AVATAR_CHATS = "hide_avatar_chats";
    private static final String CUSTOM_NAME_PREFIX = "custom_name_";

    private AnhpanPrefs() { }

    public static SharedPreferences of(Context context) {
        return context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
    }

    public static boolean isSearchBarHidden(Context context) {
        return context != null && of(context).getBoolean(HIDE_SEARCH_BAR, false);
    }

    public static boolean isQrButtonHidden(Context context) {
        return context != null && of(context).getBoolean(HIDE_QR_BUTTON, false);
    }

    public static boolean isPlusButtonHidden(Context context) {
        return context != null && of(context).getBoolean(HIDE_PLUS_BUTTON, false);
    }

    public static boolean isChatHighlightFeatureEnabled(Context context) {
        return context != null && of(context).getBoolean(CHAT_HIGHLIGHT_TOGGLE, false);
    }

    public static boolean isQuickHeartHidden(Context context) {
        return context != null && of(context).getBoolean(HIDE_QUICK_HEART, false);
    }

    public static boolean isQuickShareHidden(Context context) {
        return context != null && of(context).getBoolean(HIDE_QUICK_SHARE, false);
    }

    public static boolean isReadOnlyEnabled(Context context) {
        return true;
    }

    public static boolean isReadOnlyNoHighlight(Context context) {
        return context != null && of(context).getBoolean(READ_ONLY_NO_HIGHLIGHT, false);
    }

    public static boolean isReadOnlyHideAvatar(Context context) {
        return context != null && of(context).getBoolean(READ_ONLY_HIDE_AVATAR, false);
    }

    public static boolean isReadOnlyNoColorName(Context context) {
        return context != null && of(context).getBoolean(READ_ONLY_NO_COLOR_NAME, false);
    }

    public static boolean isReadOnlySubtitleHidden(Context context) {
        return context != null && of(context).getBoolean(HIDE_READ_ONLY_SUBTITLE, false);
    }

    public static boolean isChatBubbleBorderRemoved(Context context) {
        return context != null && of(context).getBoolean(REMOVE_CHAT_BUBBLE_BORDER, false);
    }

    public static boolean isDraftPreviewHidden(Context context) {
        return context != null && of(context).getBoolean(HIDE_DRAFT_PREVIEW, false);
    }

    public static boolean isPreviewEmojiStripped(Context context) {
        return context != null && of(context).getBoolean(STRIP_PREVIEW_EMOJI, false);
    }

    public static boolean isNameEmojiStripped(Context context) {
        return context != null && of(context).getBoolean(STRIP_NAME_EMOJI, false);
    }

    public static boolean isCloudMyCloudHidden(Context context) {
        return context != null && of(context).getBoolean(HIDE_CLOUD_MY_CLOUD, false);
    }

    public static boolean isOfficialAccountsHidden(Context context) {
        return context != null && of(context).getBoolean(HIDE_OFFICIAL_ACCOUNTS, false);
    }

    public static boolean isMuteIconHidden(Context context) {
        return context != null && of(context).getBoolean(HIDE_MUTE_ICON, false);
    }

    public static boolean isChatTimeHidden(Context context) {
        return context != null && of(context).getBoolean(HIDE_CHAT_TIME, false);
    }

    public static boolean isKeepRecalledEnabled(Context context) {
        return context != null && of(context).getBoolean(KEEP_RECALLED_MESSAGES, false);
    }

    public static boolean isChatPreviewHidden(Context context, String convId) {
        return containsInSet(context, HIDE_PREVIEW_CHATS, convId);
    }

    public static boolean toggleChatPreviewHidden(Context context, String convId) {
        return toggleInSet(context, HIDE_PREVIEW_CHATS, convId);
    }

    public static boolean isChatAvatarHidden(Context context, String convId) {
        return containsInSet(context, HIDE_AVATAR_CHATS, convId);
    }

    public static boolean toggleChatAvatarHidden(Context context, String convId) {
        return toggleInSet(context, HIDE_AVATAR_CHATS, convId);
    }

    public static String getCustomName(Context context, String convId) {
        if (context == null || convId == null || convId.isEmpty()) return null;
        String val = of(context).getString(CUSTOM_NAME_PREFIX + convId, null);
        return (val == null || val.trim().isEmpty()) ? null : val;
    }

    public static void setCustomName(Context context, String convId, String name) {
        if (context == null || convId == null || convId.isEmpty()) return;
        if (name == null || name.trim().isEmpty()) {
            of(context).edit().remove(CUSTOM_NAME_PREFIX + convId).apply();
        } else {
            of(context).edit().putString(CUSTOM_NAME_PREFIX + convId, name.trim()).apply();
        }
    }

    public static boolean isChatHighlightDisabled(Context context, String convId) {
        return containsInSet(context, NO_HIGHLIGHT_CHATS, convId);
    }

    public static boolean toggleChatHighlightDisabled(Context context, String convId) {
        return toggleInSet(context, NO_HIGHLIGHT_CHATS, convId);
    }

    public static boolean isChatLocked(Context context, String convId) {
        return containsInSet(context, LOCKED_CHATS, convId);
    }

    public static boolean toggleChatLock(Context context, String convId) {
        return toggleInSet(context, LOCKED_CHATS, convId);
    }

    private static boolean containsInSet(Context context, String key, String value) {
        if (context == null || value == null || value.isEmpty()) return false;
        java.util.Set<String> set = of(context).getStringSet(key, null);
        return set != null && set.contains(value);
    }

    private static boolean toggleInSet(Context context, String key, String value) {
        if (context == null || value == null || value.isEmpty()) return false;
        SharedPreferences prefs = of(context);
        java.util.Set<String> current = prefs.getStringSet(key, null);
        java.util.Set<String> next = current == null ? new java.util.HashSet<>() : new java.util.HashSet<>(current);
        boolean added;
        if (next.contains(value)) {
            next.remove(value);
            added = false;
        } else {
            next.add(value);
            added = true;
        }
        prefs.edit().putStringSet(key, next).apply();
        return added;
    }
}
