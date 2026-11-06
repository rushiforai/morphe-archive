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
    public static *** openConnection(java.net.URL);
    public static void install(okhttp3.OkHttpClient$Builder);
    public static *** blockWebRequest(android.webkit.WebResourceRequest);
    public static java.lang.String filterJsRequestUrl(java.lang.String);
    public static java.net.URL filterJsRequestUrl(java.net.URL);
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

# DealSeek — "Strip affiliate links". clean / parse are called only from
# injected smali via invoke-static.
-keep class semicoloncolonel.mobilestream.extension.dealseek.links.DealSeekLinkCleaner {
    public static java.lang.String clean(java.lang.String);
    public static android.net.Uri parse(java.lang.String);
}

# Shared "Hide Wi-Fi networks" / "Block Bluetooth scanning" / "Hide cell
# tower info" (opt-in). Every public static method replaces a framework call
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
-keep class semicoloncolonel.mobilestream.extension.shared.misc.ShoppingAdsFilter {
    public static *;
}
-keep class semicoloncolonel.mobilestream.extension.justwatch.SponsoredFilter { public static *; }
-keep class semicoloncolonel.mobilestream.extension.whitehouse.FeedFilter { *; }
-keep class semicoloncolonel.mobilestream.extension.shared.privacy.ProxyRouter { *; }
-keep class semicoloncolonel.mobilestream.extension.whitehouse.PromoHider { *; }
-keep class semicoloncolonel.mobilestream.extension.yttv.MembershipUpsellFilter { public static *; }
-keep class semicoloncolonel.mobilestream.extension.recgov.HiddenDetails { public static *; }

# YouTube TV — "Skip ads". onCuePointProvider() is called only from injected
# smali in PlaybackControllerWrapper.
# setController() is called from the same smali, and disableDai(), keepLiveDai(), and the
# name getters are overwritten by patches, so R8 must not fold their results.
-keep class semicoloncolonel.mobilestream.extension.yttv.ads.YttvDaiDisabler {
    public static *;
}

# YouTube TV and Moviebase — "GmsCore support". checkGmsCore() is called only
# from injected smali in the main activity's onCreate, and getOriginalPackageName /
# getGmsCoreVendorGroupId are overwritten by the patch, so R8 must keep them
# as they are and not fold their result.
-keep class semicoloncolonel.mobilestream.extension.shared.misc.GmsCoreSupport {
    public static *;
}

# FEMA — "Save content for offline use". request() is called only from
# injected smali in CapacitorHttp$1.run.
-keep class semicoloncolonel.mobilestream.extension.fema.OfflineCache {
    public static java.lang.Object request(java.lang.Object, java.lang.String, java.lang.Object);
}

# YouTube TV — "Block telemetry". shouldBlock() is called only from injected
# smali in the app's HTTP ping service.
-keep class semicoloncolonel.mobilestream.extension.yttv.privacy.PingFilter {
    public static boolean shouldBlock(android.net.Uri);
}

# Fandango at Home — "Mask ads". Called only from injected smali in
# PlaybackData and PlayerActivity.
-keep class semicoloncolonel.mobilestream.extension.fandango.ads.AdMask {
    public static *;
}

# FEMA — "Save content for offline use". ImageCache is called only from
# injected smali in BridgeWebViewClient; the shortcut activity and the save
# service are referenced only from the manifest.
-keep class semicoloncolonel.mobilestream.extension.fema.ImageCache { public static *; }
-keep class semicoloncolonel.mobilestream.extension.fema.OfflineShortcutActivity { *; }
-keep class semicoloncolonel.mobilestream.extension.fema.OfflineSaveService { *; }

# The Washington Post — "Disable AI". withoutAsk() is called only from
# injected smali in the bottom bar's view model.
-keep class semicoloncolonel.mobilestream.extension.washingtonpost.AskTabFilter { public static *; }

# CBS News — "Skip ads". hide() is called only from injected smali in
# StickyBannerAds.startAdRequest.
-keep class semicoloncolonel.mobilestream.extension.cbsnews.StickyBannerHider { public static *; }

# ABC News — "Mask live ad breaks". Called only from injected smali in
# BreakEventProcessor and ComponentActivity.onCreate.
-keep class semicoloncolonel.mobilestream.extension.abcnews.LiveBreakMask { public static *; }

# Moviebase — "Hide Premium upsell". isAutomatic() is called only from injected
# smali in the Premium screen opener.
-keep class semicoloncolonel.mobilestream.extension.moviebase.UpsellFilter {
    public static boolean isAutomatic(java.lang.Object);
}

# Xumo Play — "Mask live ad breaks". playlist() and attach() are called only
# from injected smali, and positionMethod() / volumeMethod() are overwritten by
# the patch, so R8 must keep them as they are and not fold their result.
-keep class semicoloncolonel.mobilestream.extension.xumo.XumoLiveMask { public static *; }


# YouTube TV — "Mask live ad breaks". cuepoints() is called only from injected
# smali in the cue-point callback.
-keep class semicoloncolonel.mobilestream.extension.yttv.ads.YttvLiveMask { public static *; }

# Plex — "Hide sponsored content". filterBody() and filterBytes() are called only from injected
# smali in the NitroResponse constructor.
-keep class semicoloncolonel.mobilestream.extension.plex.PlexSponsoredFilter { public static *; }

# YouTube TV — "Fix picture-in-picture". setParams() and enter() replace the
# app's picture-in-picture calls in injected smali.
-keep class semicoloncolonel.mobilestream.extension.yttv.YttvPictureInPicture { public static *; }

# Fox News and The Wall Street Journal — "Hide prediction markets".
# filterFoxItems() is called only from injected smali.
-keep class semicoloncolonel.mobilestream.extension.shared.misc.PredictionMarkets { public static *; }

# The Washington Post — "Skip ads". track() is called only from injected smali
# in the BannerAdView constructors.
-keep class semicoloncolonel.mobilestream.extension.washingtonpost.AdSlotCollapser { public static *; }

# CNN — "Faster launch". start() replaces Optimizely's asynchronous initialize
# call in OptimizelyClientFactory.
-keep class semicoloncolonel.mobilestream.extension.cnn.OptimizelyQuickStart { public static *; }

# ESPN — "Hide betting". pref(), featuresOff() and sections() are called only
# from injected smali.
-keep class semicoloncolonel.mobilestream.extension.espn.HideBetting { public static *; }

# MLB — "Mask live ad breaks". wrap() and the overlay helpers are called only
# from injected smali.
-keep class semicoloncolonel.mobilestream.extension.mlb.MlbManifestRewriter { public static *; }
-keep class semicoloncolonel.mobilestream.extension.mlb.AdBreakOverlayHelper { public static *; }

# NPR — "Hide donate buttons". Called only from injected smali.
-keep class semicoloncolonel.mobilestream.extension.npr.DonateButtonHider { public static *; }
-keep class semicoloncolonel.mobilestream.extension.npr.NprWebCleanup { public static *; }
-keep class semicoloncolonel.mobilestream.extension.npr.AdRowCollapser { public static *; }
-keep class semicoloncolonel.mobilestream.extension.newsnation.NewsNationAds { public static *; }
-keep class semicoloncolonel.mobilestream.extension.newsnation.AdSwitchFilter { *; }
