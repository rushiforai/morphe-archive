package app.sqzass.patches.protonvpn;

@SuppressWarnings("unused")
public final class FreeAccount {
    private static volatile boolean signedIn;
    private FreeAccount() {
    }
    public static void onUserInfoChanged(Object userInfo) {
        Object vpnUser = (userInfo != null) ? Reflection.read(userInfo, Members.userInfoVpnUser()) : null;
        signedIn = vpnUser != null && (Boolean) Reflection.call(vpnUser, Members.vpnUserIsFreeUser());
    }
    public static void onUserInfoInvalidated() {
        signedIn = false;
    }
    public static boolean isSignedIn() {
        return signedIn;
    }

}
