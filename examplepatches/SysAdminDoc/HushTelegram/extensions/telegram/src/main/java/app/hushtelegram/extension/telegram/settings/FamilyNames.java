/*
 * Forked from https://github.com/SysAdminDoc/HushThreads at b141524 (GPL-3.0),
 * modified for HushTelegram (Telegram), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 *
 * Built on SysAdminDoc/hushfeed (GPL-3.0).
 */
package app.hushtelegram.extension.telegram.settings;

/**
 * The name each patch goes by in Morphe Manager, which is also the family its hooks report
 * under in Hook status.
 *
 * <p>Compile-time constants, so a hook that names its family inlines the text and loads no
 * class. That matters for the hooks that can run before HushTelegram has a context, such as one in
 * code Telegram runs while its content providers start: touching {@link PatchFamily}
 * there would load the settings with no context to read them from.
 */
public final class FamilyNames {
    public static final String HIDE_ADS = "Hide ads";
    public static final String HIDE_STORIES = "Hide Stories";
    public static final String HIDE_RECOMMENDATIONS = "Hide recommendations";
    public static final String HIDE_COMMERCE = "Hide Premium, gifts and Stars";
    public static final String HIDE_PROMOTIONAL_BANNERS = "Hide promotional banners";
    public static final String HIDE_SPONSORED_PROXY = "Hide sponsored proxy channel";
    public static final String HIDE_POPULAR_APPS = "Hide popular apps";
    public static final String DISABLE_CHAT_SWIPE = "Disable chat swipe actions";
    public static final String DISABLE_CHANNEL_PULL = "Disable pull to next channel";
    public static final String QUIET_CONTACTS_NAG = "Quiet contacts nag";
    public static final String HOLIDAY_LOOK = "Holiday look all year";
    public static final String DISABLE_ANALYTICS = "Disable analytics";
    public static final String DISABLE_CALL_DEBUG = "Disable call debug upload";
    public static final String DISABLE_DRAFT_PREVIEWS = "Disable draft link previews";
    public static final String GALLERY_CAMERA_ON_TAP = "Gallery camera on tap";
    public static final String OPEN_EXTERNAL_LINKS = "Open links externally";
    public static final String STRIP_LINK_TRACKING = "Strip link tracking";
    public static final String DISABLE_UPDATE_CHECKS = "Disable update checks";
    public static final String REPAIR_FIREBASE_PUSH = "Repair Firebase push registration";

    private FamilyNames() {
    }
}
