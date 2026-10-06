/*
 * Forked from https://github.com/SysAdminDoc/HushTelegram at 8c54a1d (GPL-3.0),
 * modified for HushPinterest (Pinterest), 2026.
 *
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
package app.hushpinterest.extension.pinterest.settings;

/**
 * The name each patch goes by in Morphe Manager, which is also the family its hooks report
 * under in Hook status.
 *
 * <p>Compile-time constants, so a hook that names its family inlines the text and loads no
 * class. That matters for the hooks that can run before HushPinterest has a context, such as one in
 * code Pinterest runs while its startup providers run: touching {@link PatchFamily}
 * there would load the settings with no context to read them from.
 */
public final class FamilyNames {
    public static final String HIDE_ADS = "Hide ads";
    public static final String HIDE_AI_PINS = "Hide AI-labeled pins";
    public static final String HIDE_SHOPPING = "Hide shopping and product pins";
    public static final String DISABLE_ANALYTICS = "Disable analytics";
    public static final String STRIP_LINK_TRACKING = "Strip link tracking";
    public static final String HIDE_ADVERTISING_ID = "Hide advertising ID";
    public static final String DOWNLOAD_PINS = "Download pins";
    public static final String EXTERNAL_BROWSER = "Open links in your browser";
    public static final String SYSTEM_SHARE = "System share sheet";
    public static final String HIDE_SCREENSHOT_SHARE = "No screenshot share menu";
    public static final String HIDE_SEARCH_HISTORY = "Hide search history";
    public static final String HIDE_NAVIGATION_BUTTONS = "Hide navigation buttons";
    public static final String HIDE_HEADER_BUTTONS = "Hide header buttons";
    public static final String HIDE_PIN_MENU_ITEMS = "Filter pin menu";
    public static final String HIDE_COMMENTS = "Hide comments";
    public static final String QUIET_EMAIL_REMINDER = "Quiet email reminders";
    public static final String HIDE_SAVE_TOASTS = "Hide save toasts";
    public static final String ORIGINAL_IMAGES = "Original-quality images";
    public static final String DISABLE_UPDATE_NAG = "Disable update nag";

    private FamilyNames() {
    }
}
