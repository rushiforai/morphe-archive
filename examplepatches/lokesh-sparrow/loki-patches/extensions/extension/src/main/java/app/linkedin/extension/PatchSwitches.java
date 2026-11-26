package app.linkedin.extension;

/**
 * Which switch rows belong to which patch, so Patch status can say whether a patch that is in the app is switched
 * on or off right now. A patch with no switch here is always working once applied.
 */
final class PatchSwitches {
    private PatchSwitches() {}

    /** LinkedIn: the stored settings of the switches that turn the patch on and off, or none. */
    static String[] linkedIn(String patch) {
        switch (patch) {
            case "Hide ads":
                return new String[]{Settings.HIDE_ADS};
            case "Hide promoted jobs":
                return new String[]{Settings.HIDE_PROMOTED_JOBS};
            case "Hide suggested posts":
                return new String[]{Settings.HIDE_SUGGESTED};
            case "Hide Premium upsells":
                return new String[]{Settings.HIDE_PREMIUM};
            case "Feed filters":
                return new String[]{Settings.FOCUS_MODE, Settings.HIDE_CELEBRATIONS, Settings.HIDE_FEED_JOBS, Settings.HIDE_REPOSTS, Settings.HIDE_ACTIVITY_POSTS, Settings.HIDE_RECOMMENDATIONS, Settings.HIDE_VIDEO_POSTS, Settings.HIDE_NEW_POSTS_PILL, Settings.HIDE_TRANSLATION, Settings.HIDE_AI};
            case "Disable double-tap like":
                return new String[]{Settings.DISABLE_DOUBLE_TAP_LIKE};
            case "Disable screenshot share sheet":
                return new String[]{Settings.DISABLE_SCREENSHOT_SHEET};
            case "Expand posts":
                return new String[]{Settings.EXPAND_POSTS};
            case "Copy text":
                return new String[]{Settings.COPY_TEXT, Settings.COPY_TEXT_LONG_SHEET};
            case "Keep feed on reopen":
                return new String[]{Settings.KEEP_FEED};
            case "Post menu items":
                return new String[]{Settings.POST_MENU};
            case "Tap to hide in viewers":
                return new String[]{Settings.VIEWER_TAP_TO_HIDE};
            case "Swipe between feeds":
                return new String[]{Settings.SWIPE_FEEDS};
            case "Hide the My Network tab":
                return new String[]{Settings.HIDE_TAB_NETWORK};
            case "Hide the Jobs tab":
                return new String[]{Settings.HIDE_TAB_JOBS};
            case "Hide the More tab":
                return new String[]{Settings.HIDE_TAB_MORE};
            case "Anonymous profile viewing":
                return new String[]{Settings.ANONYMOUS_PROFILE_VIEWING};
            case "Download media":
                return new String[]{Settings.DOWNLOAD_MEDIA};
            case "Messaging":
                return new String[]{Settings.HIDE_SPONSORED_MESSAGES, Settings.GHOST_MODE};
            case "Open links directly":
                return new String[]{Settings.OPEN_LINKS_DIRECTLY, Settings.RESOLVE_SHORT_LINKS};
            case "Sanitize share links":
                return new String[]{Settings.SANITIZE_SHARE_LINKS};
            case "Block tracking":
                return new String[]{Settings.BLOCK_TRACKING};
            case "Remove gaps and dividers":
                return new String[]{Settings.REMOVE_GAPS_AND_DIVIDERS};
            case "Material You":
                return new String[]{Settings.MATERIAL_YOU};
            default:
                return new String[0];
        }
    }

    /** Other apps: the title of the patch's switch row, or null when it has no switch. */
    static String host(String patch) {
        switch (patch) {
            case "AMOLED black (Splitwise)":
                return "AMOLED black";
            case "Hide after-call screen":
                return "Hide after-call screen";
            case "Anonymous profile viewing":
                return "Anonymous profile viewing";
            case "Anonymous search":
                return "Anonymous search";
            case "Unlimited backup (Pixel XL)":
                return "Unlimited backup (Pixel XL)";
            case "Only real camera photos count as Camera":
                return "Only real camera photos count as Camera";
            default:
                return null;
        }
    }
}
