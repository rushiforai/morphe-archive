/*
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 *
 * Built on SysAdminDoc/hushfeed (GPL-3.0).
 */
package app.morphe.extension.hushthreads.settings;

/**
 * The name each patch goes by in Morphe Manager, which is also the family its hooks report
 * under in Hook status.
 *
 * <p>Compile-time constants, so a hook that names its family inlines the text and loads no
 * class. That matters for the hooks that can run before HushThreads has a context, such as the
 * signature check Threads makes while its content providers start: touching {@link PatchFamily}
 * there would load the settings with no context to read them from.
 */
public final class FamilyNames {
    public static final String HIDE_ADS = "Hide ads";
    public static final String HIDE_SUGGESTED_USERS = "Hide suggested users";
    public static final String RETURN_REFRESH = "Block background-return feed refresh";
    public static final String VIDEO_AUTOPLAY = "Disable video autoplay";
    public static final String MAX_IMAGE_QUALITY = "Max image quality";
    public static final String SANITIZE_SHARING_LINKS = "Sanitize sharing links";
    public static final String EXTERNAL_BROWSER = "Open links in browser";
    public static final String DISABLE_ANALYTICS = "Disable analytics";
    public static final String SCREENSHOT_DETECTION = "Disable screenshot detection";
    public static final String PURE_BLACK = "Pure black dark mode";
    public static final String HIDE_INSTAGRAM_BUTTON = "Hide the Instagram button";
    public static final String SAVE_MEDIA = "Save photos and videos";
    public static final String REMOVE_AD_ID = "Remove the advertising ID";
    public static final String RESTORE_TRUST = "Restore screens on re-signed builds";
    public static final String VERSION_CODE = "Change version code";
    public static final String REMOVE_SHARE_TARGETS = "Remove share targets";
    public static final String TRUST_USER_CERTIFICATES = "Trust user-added certificates";

    private FamilyNames() {
    }
}
