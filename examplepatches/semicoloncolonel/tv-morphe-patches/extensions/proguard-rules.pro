# The extension is merged into each app's own dex. R8's default is to move
# renamed and synthetic classes (lambdas, outlines) into the root package as
# a, b, c..., which collides with the app's own obfuscated root classes (Pluto
# 17.2.0 crashed on La;-><init>(I)V). Keep everything R8 renames inside our
# own package instead.
-repackageclasses 'semicoloncolonel.mobilestream.extension.r8'

# Shared "Block analytics & tracking" blocker (opt-in, every app). openConnection / install /
# blockWebRequest / filterJsRequestUrl are called only from injected smali via invoke-static, and
# BlockInterceptor is matched by instanceof, so R8 must keep all of them.
-keep class semicoloncolonel.mobilestream.extension.shared.privacy.TrackerBlocker {
    # Overwritten by patches, so R8 must not fold its constant answer.
    public static boolean keepBraze();
    public static boolean blockResumeTracking();
    public static boolean incognitoReading();
    public static *** openConnection(java.net.URL);
    public static java.net.InetAddress[] lookup(java.lang.String);
    public static void install(okhttp3.OkHttpClient$Builder);
    public static *** blockWebRequest(android.webkit.WebResourceRequest);
    public static java.lang.String filterJsRequestUrl(java.lang.String);
    public static java.net.URL filterJsRequestUrl(java.net.URL);
}
-keep class semicoloncolonel.mobilestream.extension.shared.privacy.TrackerBlocker$BlockInterceptor { *; }
-keep class semicoloncolonel.mobilestream.extension.yttvshell.TvScripts {
    public static void setWebContents(java.lang.Object);
    public static void setWebContentsFromObserver(java.lang.Object);
    public static void onObserverNavigation(java.lang.Object);
    public static void onObserverDocument(java.lang.Object);
    public static void onPageEvent(java.lang.String);
    public static void onTitle(java.lang.String);
}

# Pluto TV — "Skip ads". filter is called only from
# injected smali via invoke-static.
-keep class semicoloncolonel.mobilestream.extension.pluto.ads.PlutoMpdFilter {
    public static java.io.InputStream filter(java.io.InputStream);
}

# Shared "Hide device identifiers" (opt-in), Android ID option. getSecureString replaces
# Settings.Secure.getString at app call sites via injected invoke-static.
-keep class semicoloncolonel.mobilestream.extension.shared.privacy.DeviceIdSpoofer {
    public static java.lang.String getSecureString(android.content.ContentResolver, java.lang.String);
    public static java.lang.String maskId(java.lang.String);
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

# "Hide device identifiers", Report Wi-Fi connection / VPN connection options. Every
# public static method replaces a framework call at app call sites via
# injected invoke-static, and reportWifi / hideVpn are overwritten by the
# options, so R8 must keep them as they are and not fold their result.
-keep class semicoloncolonel.mobilestream.extension.shared.privacy.NetworkStateSpoofer {
    public static *;
}

# "Hide device identifiers", Carrier option. Every public static method replaces a
# framework call at app call sites via injected invoke-static, and
# carrierName() is overwritten by the option, so R8 must keep them as they are.
-keep class semicoloncolonel.mobilestream.extension.shared.privacy.CarrierSpoofer {
    public static *;
}

# "Hide device identifiers", Nearby Wi-Fi networks / Bluetooth scanning / Cell
# tower info options. Every public static method replaces a framework call
# at app call sites via injected invoke-static, so R8 must keep them as they are.
-keep class semicoloncolonel.mobilestream.extension.shared.privacy.NearbyHider {
    public static *;
}

# Shopping apps — "Disable AI". Every public static method is called only
# from injected smali via invoke-static.
-keep class semicoloncolonel.mobilestream.extension.shared.misc.AiFeatureFilter {
    public static *;
}

# Shopping apps — "Hide sponsored listings". Called only from injected smali
# via invoke-static.
-keep class semicoloncolonel.mobilestream.extension.justwatch.SponsoredFilter { public static *; }
-keep class semicoloncolonel.mobilestream.extension.justwatch.WatchlistFilter { public static *; }

# YouTube TV and Moviebase — "GmsCore support". checkGmsCore() is called only
# from injected smali in the main activity's onCreate, and getOriginalPackageName /
# getGmsCoreVendorGroupId are overwritten by the patch, so R8 must keep them
# as they are and not fold their result.
-keep class semicoloncolonel.mobilestream.extension.shared.misc.GmsCoreSupport {
    public static *;
}

# Shared "Translate ad break screen". translate() is overwritten by the patch,
# so R8 must keep it and not fold its constant answer.
-keep class semicoloncolonel.mobilestream.extension.shared.misc.AdBreakText {
    private static boolean translate();
}

# Plex — "Hide sponsored content". filterBody() and filterBytes() are called only from injected
# smali in the NitroResponse constructor.
-keep class semicoloncolonel.mobilestream.extension.plex.PlexSponsoredFilter { public static *; }

# MLB — "Mask live ad breaks". wrap() and the overlay helpers are called only
# from injected smali.
-keep class semicoloncolonel.mobilestream.extension.mlb.MlbManifestRewriter { public static *; }
-keep class semicoloncolonel.mobilestream.extension.mlb.AdBreakOverlayHelper { public static *; }

# Apple TV (Android TV) — "Auto-skip". Called only from injected smali, and its
# skipPromos / skipRecaps / skipIntros answers are overwritten by the patch.
-keep class semicoloncolonel.mobilestream.extension.appletv.AutoSkipper { public static *; }

# NFL — "Skip ads" web view layer. Called only from injected smali.
-keep class semicoloncolonel.mobilestream.extension.nfl.NflWebAds { public static *; }

# Tubi — "Highest quality". Called only from injected smali.
-keep class semicoloncolonel.mobilestream.extension.tubi.TubiQuality { public static *; }
-keep class semicoloncolonel.mobilestream.extension.hbomax.HboQuality { public static *; }

# Shared "Hide rating prompt". launchReviewFlow() replaces Google Play's
# ReviewManager.launchReviewFlow at app call sites via injected invoke-static.
-keep class semicoloncolonel.mobilestream.extension.shared.misc.RatingPromptBlocker { public static *; }

-keep class semicoloncolonel.mobilestream.extension.hulutv.nativehook.NativeHookLoader {
    public static void load();
}

-keep class semicoloncolonel.mobilestream.extension.hulutv.privacy.NativeTrackerLoader {
    public static void load();
}

# Called from smali by the Reject tracking consent patch.
-keep class semicoloncolonel.mobilestream.extension.shared.privacy.ConsentRejecter {
    public static boolean reject(java.lang.Object, boolean);
}

# Prime Video Android TV ad-strip loader — only injected smali calls it.
-keep class semicoloncolonel.mobilestream.extension.primevideotv.PrimeVideoHookLoader {
    public static void load();
}

# Fandango at Home — "Mask ads". Called only from injected smali in
# PlaybackPresenter, PlayerActivity, and NVPlaybackActivity.
-keep class semicoloncolonel.mobilestream.extension.fandango.ads.AdMask {
    public static *;
}

# ABC News and CBS News — "Mask live ad breaks". Called only from injected
# smali; trackTimer reads getValue() by reflection.
-keep class semicoloncolonel.mobilestream.extension.shared.misc.LiveBreakMask { public static *; }
-keep class semicoloncolonel.mobilestream.extension.cbsnews.CbsLiveMask { public static *; }
-keep class semicoloncolonel.mobilestream.extension.cbsnews.CbsLiveMask$Remaining { public *; }

# CNBC, NBC News, and MS NOW — "Skip ads". Called only from the injected shouldInterceptRequest.
-keep class semicoloncolonel.mobilestream.extension.nbcuott.ClipAdFilter { public static *; }
