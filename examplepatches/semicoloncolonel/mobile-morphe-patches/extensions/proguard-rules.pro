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

# MGM+ — "Skip pre-roll promo". Called only from injected smali.
-keep class semicoloncolonel.mobilestream.extension.mgm.ads.MgmPrerollSkipper {
    public static void maybeSkipAux(java.lang.Object, java.util.List);
}

# "Hide device identifiers", Report Wi-Fi connection / VPN connection options. Every
# public static method replaces a framework call at app call sites via
# injected invoke-static, and reportWifi / hideVpn are overwritten by the
# options, so R8 must keep them as they are and not fold their result.
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

# NBA — "Hide League Pass upsells". filterFeed() is called only from injected
# smali in the feed card mapper.
-keep class semicoloncolonel.mobilestream.extension.nba.misc.NbaLeaguePassFilter {
    public static java.util.List filterFeed(java.util.List);
}

# "Hide device identifiers", Carrier option. Every public static method replaces a
# framework call at app call sites via injected invoke-static, and
# carrierName() is overwritten by the option, so R8 must keep them as they are.
-keep class semicoloncolonel.mobilestream.extension.shared.privacy.CarrierSpoofer {
    public static *;
}

# DealSeek — "Strip affiliate links". clean / parse are called only from
# injected smali via invoke-static.
-keep class semicoloncolonel.mobilestream.extension.dealseek.links.DealSeekLinkCleaner {
    public static java.lang.String clean(java.lang.String);
    public static android.net.Uri parse(java.lang.String);
}

# DealSeek — "Stop behavioral tracking". filterJsRequestUrl is called only from
# injected smali via invoke-static, so R8 must keep both overloads as they are.
-keep class semicoloncolonel.mobilestream.extension.dealseek.privacy.BehaviorBlocker {
    public static java.lang.String filterJsRequestUrl(java.lang.String);
    public static java.net.URL filterJsRequestUrl(java.net.URL);
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
-keep class semicoloncolonel.mobilestream.extension.shared.misc.ShoppingAdsFilter {
    public static *;
}
-keep class semicoloncolonel.mobilestream.extension.justwatch.SponsoredFilter { public static *; }
-keep class semicoloncolonel.mobilestream.extension.justwatch.WatchlistFilter { public static *; }
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

# Shared "Translate ad break screen". translate() is overwritten by the patch,
# so R8 must keep it and not fold its constant answer.
-keep class semicoloncolonel.mobilestream.extension.shared.misc.AdBreakText {
    private static boolean translate();
}

# YouTube TV — "Mask live ad breaks". cuepoints() is called only from injected
# smali in the cue-point callback.
-keep class semicoloncolonel.mobilestream.extension.yttv.ads.YttvLiveMask { public static *; }

# Plex — "Hide sponsored content". filterBody() and filterBytes() are called only from injected
# smali in the NitroResponse constructor.
-keep class semicoloncolonel.mobilestream.extension.plex.PlexSponsoredFilter { public static *; }

# YouTube TV — "Fix picture-in-picture". setParams() and enter() replace the
# app's picture-in-picture calls in injected smali.
-keep class semicoloncolonel.mobilestream.extension.yttv.YttvPictureInPicture { public static *; }

# YouTube TV — "Volume and brightness sliders". onScroll() is called from the
# player gesture handler via injected invoke-static.
-keep class semicoloncolonel.mobilestream.extension.yttv.YttvScreenGestures { public static *; }

# YouTube TV — "Press and hold to speed up" and "Set playback speed".
# onSetRate() and filterRate() are called from injected smali, and holdRate(),
# defaultRate(), and callSetRate() are overwritten by the patches, so R8 must
# keep them as they are.
-keep class semicoloncolonel.mobilestream.extension.yttv.YttvPlaybackSpeed { public static *; }

# YouTube TV — shared player touch hook. onDispatch() and cancelOf() are called
# from the dispatchTouchEvent added to WatchLayout, and slidersEnabled() and
# holdEnabled() are overwritten by the patches, so R8 must keep them as they are.
-keep class semicoloncolonel.mobilestream.extension.yttv.YttvPlayerTouch { public static *; }

# Fox News and The Wall Street Journal — "Hide prediction markets".
# filterFoxItems() is called only from injected smali.
-keep class semicoloncolonel.mobilestream.extension.shared.misc.PredictionMarkets { public static *; }

# Fox News — "Hide comments and reactions" and "Hide app promotions". Called
# only from injected smali in ScreenModel's constructor.
-keep class semicoloncolonel.mobilestream.extension.foxnews.ArticleComponents { public static *; }

# Yahoo News — "Skip ads". hide is called only from injected smali via invoke-static.
-keep class semicoloncolonel.mobilestream.extension.yahoonews.ArticleAds { public static *; }

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

# Truth Social — "Skip ads" and "Show poll results". add() and annotate() are
# called only from injected smali, and boostField() is overwritten by the
# patch, so R8 must keep them as they are and not fold its result.
-keep class semicoloncolonel.mobilestream.extension.truthsocial.BoostFilter { *; }
-keep class semicoloncolonel.mobilestream.extension.truthsocial.PollPreview { public static *; }
-keep class semicoloncolonel.mobilestream.extension.truthsocial.MediaSaver { public static *; }
-keep class semicoloncolonel.mobilestream.extension.truthsocial.MediaTypeFix { *; }

# Apple TV — "Auto-skip". Called only from injected smali, and its
# skipPromos / skipRecaps / skipIntros answers are overwritten by the patch.
-keep class semicoloncolonel.mobilestream.extension.appletv.PhoneAutoSkipper { public static *; }
-keep class semicoloncolonel.mobilestream.extension.appletv.ReleaseTimes { public static *; }
-keep class semicoloncolonel.mobilestream.extension.appletv.PlayerInfo { public static *; }

# NFL — "Skip ads" web view layer. Called only from injected smali.
-keep class semicoloncolonel.mobilestream.extension.nfl.NflWebAds { public static *; }

# Tubi — "Highest quality". Called only from injected smali.
-keep class semicoloncolonel.mobilestream.extension.tubi.TubiQuality { public static *; }
-keep class semicoloncolonel.mobilestream.extension.hbomax.HboQuality { public static *; }

# SiriusXM — "Hide content". filter is called only from injected smali via
# invoke-static, and the patch overwrites terms and hideMentions, so R8
# must not fold them. HiddenNamesActivity is named only in the manifest.
-keep class semicoloncolonel.mobilestream.extension.siriusxm.ContentFilter {
    public static java.lang.String filter(java.lang.String);
    private static java.lang.String terms();
    private static boolean hideMentions();
}
-keep class semicoloncolonel.mobilestream.extension.siriusxm.HiddenNamesActivity { *; }

# SiriusXM — "Mask live ad breaks". Called only from injected smali via
# invoke-static, and the patch overwrites mutePromos.
-keep class semicoloncolonel.mobilestream.extension.siriusxm.LiveAdMute {
    public static void setMetadata(android.media.session.MediaSession, android.media.MediaMetadata);
    public static float volume(java.lang.Object, float);
    public static void track(java.lang.Object);
    public static java.lang.String filterJson(java.lang.String);
    private static boolean mutePromos();
}

# CNBC — "Skip ads", "Hide premium promotions", and "Hide newsletter
# pop-ups". Called only from injected smali via invoke-static.
-keep class semicoloncolonel.mobilestream.extension.cnbc.AdHider {
    public static void hide(android.view.View);
    public static void collapseWhenAttached(android.view.View);
}
-keep class semicoloncolonel.mobilestream.extension.cnbc.VodAdSkipper {
    public static void onAdTick();
}
-keep class semicoloncolonel.mobilestream.extension.cnbc.PremiumCardFilter {
    public static boolean add(java.util.List, java.lang.Object);
}
-keep class semicoloncolonel.mobilestream.extension.cnbc.ArticleCleanup {
    public static void hideAds(android.webkit.WebView);
    public static void hideNewsletters(android.webkit.WebView);
}

# Shared "Hide rating prompt". launchReviewFlow() replaces Google Play's
# ReviewManager.launchReviewFlow at app call sites via injected invoke-static.
-keep class semicoloncolonel.mobilestream.extension.shared.misc.RatingPromptBlocker { public static *; }

# RetailMeNot — "Remove location access". Called only from injected smali in
# Expo's PermissionsService.
-keep class semicoloncolonel.mobilestream.extension.retailmenot.privacy.LocationBlocker { public static *; }

# Shared "Strip affiliate links". Every public static method replaces a
# startActivity / loadUrl call at app call sites via injected invoke-static.
-keep class semicoloncolonel.mobilestream.extension.shared.links.AffiliateLinkCleaner {
    public static *;
}

# Checkout 51 — "Show gas offers on OpenStreetMap". onMarkers and onDetailsView are called only from injected smali.
-keep class semicoloncolonel.mobilestream.extension.checkout51.GasOfferList {
    public static void onMarkers(java.lang.Object, java.lang.Object);
    public static void onDetailsView(java.lang.Object, android.view.View);
}

# Yahoo Finance — the flag lists and prompt steps, read from injected smali.
-keep class semicoloncolonel.mobilestream.extension.yahoofinance.FinanceFlags {
    public static *;
}
-keep class semicoloncolonel.mobilestream.extension.yahoofinance.ArticleCleanup {
    public static *;
}

# Netflix — "Bypass tamper protection". load() is called only from injected
# smali at the top of the Application's attachBaseContext.
-keep class semicoloncolonel.mobilestream.extension.netflix.bypass.NetflixBypassLoader {
    public static void load();
}

# Netflix — "Browse hidden categories" / "Surprise me". The activities are
# referenced only from the manifest, so R8 must keep them.
-keep class semicoloncolonel.mobilestream.extension.netflix.categories.HiddenCategoriesActivity { *; }
-keep class semicoloncolonel.mobilestream.extension.netflix.categories.SurpriseMeActivity { *; }

# Netflix — "Auto-skip". The patch overwrites the option/name stubs and calls
# onSkipCta from the player, so the public static members must keep their names.
-keep class semicoloncolonel.mobilestream.extension.netflix.misc.NetflixAutoSkipper { public static *; }

# Netflix — "Respect rotation lock". set/getRequestedOrientation are called only from
# injected smali via invoke-static.
-keep class semicoloncolonel.mobilestream.extension.netflix.misc.RotationLock { public static *; }

# Koupon — "Keep new-user promo codes" and "Block analytics & tracking". These
# methods are called only from injected smali via invoke-static.
-keep class semicoloncolonel.mobilestream.extension.kouponai.misc.PromoWindow {
    public static void beforeMultiGet(java.lang.Object, java.lang.Object);
}
-keep class semicoloncolonel.mobilestream.extension.kouponai.privacy.KouponBehaviorFilter {
    public static java.lang.String filterJsRequestUrl(java.lang.String);
    public static java.net.URL filterJsRequestUrl(java.net.URL);
}
-keep class semicoloncolonel.mobilestream.extension.kouponai.privacy.KouponTrackingFilter {
    public static java.lang.String filterJsRequestUrl(java.lang.String);
    public static java.net.URL filterJsRequestUrl(java.net.URL);
}
# Koupon — web page filter. intercept is called from an added
# shouldInterceptRequest, onPage from the client's page callbacks, and the switches are overwritten by patches.
-keep class semicoloncolonel.mobilestream.extension.kouponai.web.KouponWebFilter {
    public static android.webkit.WebResourceResponse intercept(android.webkit.WebResourceRequest);
    public static boolean blockTrackers();
    public static boolean stopHistory();
    public static boolean hideAi();
    public static boolean hideTips();
    public static boolean showCodes();
    public static void onPage(android.webkit.WebView, java.lang.String);
}

-keep class semicoloncolonel.mobilestream.extension.flipp.GoogleConsent {
    public static java.lang.Object register(java.lang.Object, java.lang.Object, java.lang.Object);
}

# Prime Video — "Skip ads". isServerInserted() and onAdBreakStart() are called
# only from injected smali in PrepareAdPlan and ServerInsertedAdBreakState.
-keep class semicoloncolonel.mobilestream.extension.primevideo.ads.ServerInsertedAdSkipper { public static *; }

# WSJ — "Hide prompts and pop-ups", cookie consent option. onShown() is called
# only from injected smali in the app's Sourcepoint client (onUIReady).
-keep class semicoloncolonel.mobilestream.extension.wsj.CookieConsent { public static *; }

# Al Jazeera — "Skip cookie settings". Called only from injected smali in
# OneTrust's React Native module.
-keep class semicoloncolonel.mobilestream.extension.aljazeera.OneTrustConsent { public static *; }

# The New York Times — "Library pass reminder". maybeRemind(), onGatewayShown()
# and recordLevel() are called only from injected smali (BaseAppCompatActivity
# .onStart, the gateway card, and NYT's SubscriptionLevel getter), and
# renewUrl() is overwritten by the patch, so R8 must keep them as they are and
# not fold the URL answer.
-keep class semicoloncolonel.mobilestream.extension.nytimes.misc.LibraryPassReminder {
    public static void maybeRemind(android.app.Activity);
    public static void onGatewayShown(java.lang.Object);
    public static void recordLevel(java.lang.Object);
    public static java.lang.String renewUrl();
}
