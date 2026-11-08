package app.sqzass.patches.protonvpn;

public final class Members {
    private Members() {}
    public static String userInfoVpnUser() {
        return "vpnUser";
    }
    public static String vpnUserIsFreeUser() {
        return "isFreeUser";
    }
    public static String serverGroupTier() {
        return "getTier";
    }
    public static String profileAvailability() {
        return "availability";
    }
    public static String serverIsFree() {
        return "isFreeServer";
    }
    public static String countryServers() {
        return "serverList";
    }
    public static String apiNotificationType() {
        return "type";
    }
    public static String serverGroupBannerClass() {
        return "com.protonvpn.android.redesign.countries.ui.ServerGroupUiItem$Banner";
    }
}
