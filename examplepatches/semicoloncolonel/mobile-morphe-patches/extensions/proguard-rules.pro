# The extension is merged into each app's own dex. R8's default is to move
# renamed and synthetic classes (lambdas, outlines) into the root package as
# a, b, c..., which collides with the app's own obfuscated root classes (Pluto
# 17.2.0 crashed on La;-><init>(I)V). Keep everything R8 renames inside our
# own package instead.
-repackageclasses 'semicoloncolonel.mobilestream.extension.r8'

# Shared "Block analytics & tracking" blocker (opt-in, every app). openConnection / install /
# blockWebRequest are called only from injected smali via invoke-static, and
# BlockInterceptor is matched by instanceof, so R8 must keep all of them.
-keep class semicoloncolonel.mobilestream.extension.shared.privacy.TrackerBlocker {
    public static *** openConnection(java.net.URL);
    public static void install(okhttp3.OkHttpClient$Builder);
    public static *** blockWebRequest(android.webkit.WebResourceRequest);
}
-keep class semicoloncolonel.mobilestream.extension.shared.privacy.TrackerBlocker$BlockInterceptor { *; }

# Pluto TV — "Skip ads". filter / mapResumePosition are called only from
# injected smali via invoke-static.
-keep class semicoloncolonel.mobilestream.extension.pluto.ads.PlutoMpdFilter {
    public static java.io.InputStream filter(java.io.InputStream);
    public static long mapResumePosition(long);
}

# Shared "Hide device identifiers" (opt-in). getSecureString replaces
# Settings.Secure.getString at app call sites via injected invoke-static.
-keep class semicoloncolonel.mobilestream.extension.shared.privacy.DeviceIdSpoofer {
    public static java.lang.String getSecureString(android.content.ContentResolver, java.lang.String);
}

# Pluto TV — "Mask live ad breaks". All five entry points are called only from
# injected smali via invoke-static.
-keep class semicoloncolonel.mobilestream.extension.pluto.ads.PlutoLiveMask {
    public static void onAdTick(java.lang.Object);
    public static void registerActivity(android.app.Activity);
    public static void unregisterActivity(android.app.Activity);
    public static void onPlayerPause(android.app.Activity);
    public static void setAviaPlayer(java.lang.Object);
}

# HBO Max — "Skip ads". guard() is called only from injected smali.
-keep class semicoloncolonel.mobilestream.extension.hbomax.ads.HboAdOriginFilter {
    public static void guard(java.lang.Object);
}

# MGM+ — "Skip pre-roll promo". Called only from injected smali.
-keep class semicoloncolonel.mobilestream.extension.mgm.ads.MgmPrerollSkipper {
    public static void maybeSkipAux(java.lang.Object, java.util.List);
}

# Shared "Report Wi-Fi connection" / "Hide VPN connection" (opt-in). Every
# public static method replaces a framework call at app call sites via
# injected invoke-static, and reportWifi / hideVpn are overwritten by the
# patches, so R8 must keep them as they are and not fold their result.
-keep class semicoloncolonel.mobilestream.extension.shared.privacy.NetworkStateSpoofer {
    public static *;
}

# Hulu — "Skip ads". filter / adMetadata / mapStreamSeconds are called only
# from injected smali via invoke-static.
-keep class semicoloncolonel.mobilestream.extension.hulu.ads.HuluMpdFilter {
    public static java.io.InputStream filter(java.io.InputStream);
    public static java.util.List adMetadata(java.util.List);
    public static double mapStreamSeconds(double);
}

# NBA — "Skip ads". inject() is called only from injected smali in the app's
# WebViewClient page callbacks.
-keep class semicoloncolonel.mobilestream.extension.nba.ads.NbaWebVideoAds {
    public static void inject(android.webkit.WebView, java.lang.String);
}

# NBA — "Disable Ask NBA AI". filterMenu() is called only from injected smali
# in MenuItem's constructor.
-keep class semicoloncolonel.mobilestream.extension.nba.misc.NbaAskFilter {
    public static java.util.List filterMenu(java.util.List);
}

# Shared "Spoof carrier" (opt-in). Every public static method replaces a
# framework call at app call sites via injected invoke-static, and
# carrierName() is overwritten by the patch, so R8 must keep them as they are.
-keep class semicoloncolonel.mobilestream.extension.shared.privacy.CarrierSpoofer {
    public static *;
}
