package io.github.bakwudo.uyu.extension.settings;

/**
 * Tells the settings screen which patches were applied, so it only shows their settings.
 * Each method returns false here and is replaced with {@code return true} by its patch.
 */
@SuppressWarnings("SameReturnValue")
public final class PatchStatus {
    private PatchStatus() {
    }

    public static boolean autoClaimChannelPoints() {
        return false;
    }

    public static boolean danmakuComments() {
        return false;
    }

    public static boolean hidePromotions() {
        return false;
    }

    public static boolean blockAds() {
        return false;
    }
}
