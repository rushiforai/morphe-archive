package app.morphe.extension.aliexpress.patches;

@SuppressWarnings("unused")
public final class PreferencesPatch {

    private PreferencesPatch() {}

    public static boolean removeAds() {
        return true;
    }

    public static boolean disableAnalytics() {
        return true;
    }

    public static boolean disableForcedUpdates() {
        return true;
    }

    public static boolean disablePromotionsNotifications() {
        return true;
    }

    public static boolean disableSplashScreen() {
        return false;
    }

    public static boolean hideSponsoredItems() {
        return true;
    }

    public static boolean removeCouponsPopup() {
        return true;
    }

    public static boolean removeAffiliateTracking() {
        return true;
    }

    public static boolean enableImageSaving() {
        return false;
    }

    public static boolean bypassSignatureCheck() {
        return true;
    }
}
