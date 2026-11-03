# 1DM 20.0 (30257) manifest component census — baseline

Baseline for the hidden `Manifest & bloat cleanup` dependency patch
(`patches/src/main/kotlin/app/template/patches/onedm/ManifestAndBloatPatch.kt`).
Generated from the pinned stock build and reproduced exactly by simulating the patch's
prefix-whitelist rules against the stock `AndroidManifest.xml`
(verified 2026-11-03).

**Stock input:** APKMirror `1dm-v20.apkm`, `base.apk` SHA-256
`b55935a4435da5d3623aa8c94384039d9f07128a58ba1a93f427a5a21924c3ab`
(same pin as `.github/workflows/onedm-cache.yml`), signer cert SHA-256
`9f48b6b2741fe7e4f78ea7375f469e99086c07f45a6c7f38407f0483d2451ce7`.

## How to use this file on every future 1DM version bump

1. Re-run the census against the new stock `base.apk`.
2. Any component that **moves columns** (kept → removed or removed → kept) or appears
   **new in either column** must be reviewed by hand before release:
   - New **removed** entries are the dangerous direction — the strip is prefix-based,
     so any new third-party component (billing, Drive/Dropbox, GMS, androidx) that does
     not match a preserve rule is silently deleted.
   - New **kept** entries usually mean a new ad network inside a preserved prefix.
3. Update this file in the same commit as the version bump.

## Summary (stock → patched)

| Component | Stock | Removed | Kept |
|---|---:|---:|---:|
| providers | 21 | 17 | 4 |
| services | 29 | 14 | 15 |
| receivers | 12 | 6 | 6 |
| activities | 180 | 122 | 58 |

Also removed by the same patch (not in the tables below): 7 ad-related permissions
(`com.google.android.gms.permission.AD_ID`, `ACCESS_ADSERVICES_AD_ID`,
`ACCESS_ADSERVICES_ATTRIBUTION`, `ACCESS_ADSERVICES_TOPICS`,
`com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE`,
`com.google.android.c2dm.permission.RECEIVE`, `com.amazon.privacypass.ATTEST`),
11 ad/tracker native libraries per ABI, ad asset trees (`assets/iads/`,
`assets/mobilefuse/`, `assets/zmaticoo/`, `assets/bm_networks/`, `assets/ad-viewer/`,
`assets/template/` + MRAID files), `google-services`/FCM config, and
`IDMFirebaseMessagingService` (explicit service removal).

Preserve rules, for reference: providers keep `idm.internet.download.manager.*`,
`acr.browser.lightning.*`, `androidx.*`, `net.grandcentrix.tray.*`; services/receivers/
activities keep the first three; activities additionally keep Dropbox auth, GMS
`GoogleApiActivity`, Play Billing proxies, and `HsdpShimActivity` by exact name.

## providers - kept 4 of 21
- KEEP `acr.browser.lightning.constant.StartPageClipboardImageProvider`
- KEEP `androidx.core.content.FileProvider`
- KEEP `androidx.startup.InitializationProvider`
- KEEP `net.grandcentrix.tray.provider.TrayContentProvider`

### providers - removed 17
- `com.applovin.sdk.AppLovinInitProvider`
- `com.google.android.gms.ads.MobileAdsInitProvider`
- `com.google.firebase.provider.FirebaseInitProvider`
- `com.ironsource.lifecycle.IronsourceLifecycleProvider`
- `com.ironsource.lifecycle.LevelPlayActivityLifecycleProvider`
- `com.mbridge.msdk.config.component.status.MBComponentLifecycleProvider`
- `com.mobilefuse.sdk.MobileFuseSdkInitProvider`
- `com.my.target.common.MyTargetContentProvider`
- `com.smaato.sdk.core.lifecycle.ProcessLifecycleOwnerInitializer`
- `com.taurusx.tax.core.TaurusXProvider`
- `com.vungle.ads.VungleProvider`
- `com.yandex.mobile.ads.core.initializer.YandexAdsInitializeProvider`
- `com.yandex.mobile.ads.features.debugpanel.data.local.DebugPanelFileProvider`
- `io.appmetrica.analytics.internal.PreloadInfoContentProvider`
- `io.bidmachine.BidMachineInitProvider`
- `io.sentry.ndk.SentryNdkPreloadProvider`
- `sg.bigo.ads.controller.provider.BigoAdsProvider`

## services - kept 15 of 29
- KEEP `acr.browser.lightning.activity.MediaPlaybackService`
- KEEP `androidx.room.MultiInstanceInvalidationService`
- KEEP `androidx.work.impl.background.systemjob.SystemJobService`
- KEEP `androidx.work.impl.foreground.SystemForegroundService`
- KEEP `idm.internet.download.manager.CheckAppVersion`
- KEEP `idm.internet.download.manager.DownloadService`
- KEEP `idm.internet.download.manager.IDMTileServicePrimary`
- KEEP `idm.internet.download.manager.IDMTileServiceQuaternary`
- KEEP `idm.internet.download.manager.IDMTileServiceSecondary`
- KEEP `idm.internet.download.manager.IDMTileServiceTertiary`
- KEEP `idm.internet.download.manager.IDMVpnService`
- KEEP `idm.internet.download.manager.LogcatCaptureService`
- KEEP `idm.internet.download.manager.MediaScannerService`
- KEEP `idm.internet.download.manager.TempFilesDeletionService`
- KEEP `idm.internet.download.manager.backup.AppActionBackupService`

### services - removed 14
- `com.applovin.impl.adview.activity.AppRestartDuringAdDetectionService`
- `com.applovin.impl.adview.activity.FullscreenAdService`
- `com.chartboost.sdk.internal.video.repository.exoplayer.VideoRepositoryDownloadService`
- `com.google.android.datatransport.runtime.backends.TransportBackendDiscovery`
- `com.google.android.datatransport.runtime.scheduling.jobscheduling.JobInfoSchedulerService`
- `com.google.android.gms.ads.AdService`
- `com.google.firebase.components.ComponentDiscoveryService`
- `com.google.firebase.messaging.FirebaseMessagingService`
- `com.mbridge.msdk.config.activity.MBAdTaskWatchService`
- `com.startapp.sdk.cachedservice.BackgroundService`
- `com.startapp.sdk.jobs.SchedulerService`
- `com.unity3d.ads.adplayer.AdTaskRemovalDetectionService`
- `idm.internet.download.manager.IDMFirebaseMessagingService`
- `io.appmetrica.analytics.internal.AppMetricaService`

## receivers - kept 6 of 12
- KEEP `androidx.profileinstaller.ProfileInstallReceiver`
- KEEP `androidx.work.impl.background.systemalarm.RescheduleReceiver`
- KEEP `androidx.work.impl.diagnostics.DiagnosticsReceiver`
- KEEP `androidx.work.impl.utils.ForceStopRunnable$BroadcastReceiver`
- KEEP `idm.internet.download.manager.DownloadReceiver`
- KEEP `idm.internet.download.manager.DownloadService$SystemDownloadCompleteReceiver`

### receivers - removed 6
- `com.appodeal.ads.AppodealPackageAddedReceiver`
- `com.google.android.datatransport.runtime.scheduling.jobscheduling.AlarmManagerSchedulerBroadcastReceiver`
- `com.google.firebase.iid.FirebaseInstanceIdReceiver`
- `com.mbridge.msdk.foundation.same.broadcast.NetWorkChangeReceiver`
- `com.ogury.core.internal.LogEnablerReceiver`
- `com.startapp.sdk.adsbase.remoteconfig.BootCompleteListener`

## activitys - kept 58 of 180
- KEEP `acr.browser.lightning.activity.AdblockerSourceManagementActivity`
- KEEP `acr.browser.lightning.activity.BrowserHistoryActivity`
- KEEP `acr.browser.lightning.activity.BrowserLauncher`
- KEEP `acr.browser.lightning.activity.BrowserLauncherInternal`
- KEEP `acr.browser.lightning.activity.DisableIncognitoActivityLauncher`
- KEEP `acr.browser.lightning.activity.DisableMainActivityLauncher`
- KEEP `acr.browser.lightning.activity.FileChooserCameraActivity`
- KEEP `acr.browser.lightning.activity.GrabberActivity`
- KEEP `acr.browser.lightning.activity.HideElementFilterSourceActivity`
- KEEP `acr.browser.lightning.activity.IncognitoActivity`
- KEEP `acr.browser.lightning.activity.IncognitoActivityLauncher`
- KEEP `acr.browser.lightning.activity.IncognitoBrowserNewTabLauncherInternal`
- KEEP `acr.browser.lightning.activity.MainActivity`
- KEEP `acr.browser.lightning.activity.MainActivityLauncher`
- KEEP `acr.browser.lightning.activity.ManualFilterSourceActivity`
- KEEP `acr.browser.lightning.activity.NormalBrowserNewTabLauncherInternal`
- KEEP `acr.browser.lightning.activity.PageResourceListActivity`
- KEEP `acr.browser.lightning.activity.PasswordManagerActivity`
- KEEP `acr.browser.lightning.activity.ReadingActivity`
- KEEP `acr.browser.lightning.activity.SettingsActivity`
- KEEP `acr.browser.lightning.activity.ShortcutMenuStripSettingsActivity`
- KEEP `acr.browser.lightning.activity.TextViewerActivity`
- KEEP `acr.browser.lightning.activity.UrlToAppMappingActivity`
- KEEP `acr.browser.lightning.activity.WebSiteSettingsActivity`
- KEEP `acr.browser.lightning.activity.WebsiteSettingsListActivity`
- KEEP `androidx.biometric.internal.ui.FingerprintDialogActivity`
- KEEP `com.android.billingclient.api.ProxyBillingActivity`
- KEEP `com.android.billingclient.api.ProxyBillingActivityV2`
- KEEP `com.dropbox.core.android.AuthActivity`
- KEEP `com.google.android.gms.common.api.GoogleApiActivity`
- KEEP `com.google.android.play.core.hsdp.service.HsdpShimActivity`
- KEEP `idm.internet.download.manager.AdblockWhitelistActivity`
- KEEP `idm.internet.download.manager.AppIconRestartActivity`
- KEEP `idm.internet.download.manager.Archive`
- KEEP `idm.internet.download.manager.BadFiltersManagement`
- KEEP `idm.internet.download.manager.ColorSelection`
- KEEP `idm.internet.download.manager.CustomThemePreviewActivity`
- KEEP `idm.internet.download.manager.DomainPartLimitActivity`
- KEEP `idm.internet.download.manager.Downloader`
- KEEP `idm.internet.download.manager.DownloaderForSkipEditor`
- KEEP `idm.internet.download.manager.ExitAppUiAndDownloadService`
- KEEP `idm.internet.download.manager.ExitDownloadService`
- KEEP `idm.internet.download.manager.FolderPicker`
- KEEP `idm.internet.download.manager.HostsManagement`
- KEEP `idm.internet.download.manager.HostsSourceManagement`
- KEEP `idm.internet.download.manager.HostsWhitelistManagement`
- KEEP `idm.internet.download.manager.IDMSettingsActivity`
- KEEP `idm.internet.download.manager.IDMTileSettingsActivity`
- KEEP `idm.internet.download.manager.MainActivity`
- KEEP `idm.internet.download.manager.NotificationOptOutActivity`
- KEEP `idm.internet.download.manager.SavedPasswords`
- KEEP `idm.internet.download.manager.TorrentDetails`
- KEEP `idm.internet.download.manager.WebsiteDownloadLimit`
- KEEP `idm.internet.download.manager.backup.BackupRestoreActivity`
- KEEP `idm.internet.download.manager.userscript.activities.UserScriptListActivity`
- KEEP `idm.internet.download.manager.userscript.activities.UserScriptLogActivity`
- KEEP `idm.internet.download.manager.userscript.activities.UserScriptPermissionActivity`
- KEEP `idm.internet.download.manager.userscript.activities.UserscriptNotificationActivity`

### activitys - removed 122
- `com.amazon.aps.ads.activity.ApsInterstitialActivity`
- `com.amazon.device.ads.DTBAdActivity`
- `com.amazon.device.ads.DTBInterstitialActivity`
- `com.applovin.adview.AppLovinFullscreenActivity`
- `com.applovin.adview.AppLovinFullscreenImmersiveActivity`
- `com.applovin.creative.MaxCreativeDebuggerActivity`
- `com.applovin.creative.MaxCreativeDebuggerDisplayedAdActivity`
- `com.applovin.mediation.MaxDebuggerActivity`
- `com.applovin.mediation.MaxDebuggerAdUnitDetailActivity`
- `com.applovin.mediation.MaxDebuggerAdUnitWaterfallsListActivity`
- `com.applovin.mediation.MaxDebuggerAdUnitsListActivity`
- `com.applovin.mediation.MaxDebuggerAxonEventsListActivity`
- `com.applovin.mediation.MaxDebuggerCmpNetworksListActivity`
- `com.applovin.mediation.MaxDebuggerDetailActivity`
- `com.applovin.mediation.MaxDebuggerMultiAdActivity`
- `com.applovin.mediation.MaxDebuggerTcfConsentStatusesListActivity`
- `com.applovin.mediation.MaxDebuggerTcfInfoListActivity`
- `com.applovin.mediation.MaxDebuggerTcfStringActivity`
- `com.applovin.mediation.MaxDebuggerTestLiveNetworkActivity`
- `com.applovin.mediation.MaxDebuggerTestModeNetworkActivity`
- `com.applovin.mediation.MaxDebuggerUnifiedFlowActivity`
- `com.applovin.mediation.MaxDebuggerWaterfallSegmentsActivity`
- `com.applovin.sdk.AppLovinWebViewActivity`
- `com.appodeal.ads.TestActivity`
- `com.appodeal.ads.adapters.iab.unified.VideoPlayerActivity`
- `com.bytedance.sdk.openadsdk.activity.TTFullWebActivity`
- `com.bytedance.sdk.openadsdk.activity.TTRewardWebActivity`
- `com.bytedance.sdk.openadsdk.activity.single.IABLandingPageActivity`
- `com.bytedance.sdk.openadsdk.activity.single.TTAdActivity`
- `com.bytedance.sdk.openadsdk.activity.single.TTAppOpenAdActivity`
- `com.bytedance.sdk.openadsdk.activity.single.TTAppOpenAdTransActivity`
- `com.bytedance.sdk.openadsdk.activity.single.TTCeilingLandingPageActivity`
- `com.bytedance.sdk.openadsdk.activity.single.TTDelegateActivity`
- `com.bytedance.sdk.openadsdk.activity.single.TTFullScreenExpressVideoActivity`
- `com.bytedance.sdk.openadsdk.activity.single.TTFullScreenVideoActivity`
- `com.bytedance.sdk.openadsdk.activity.single.TTHistoryActivity`
- `com.bytedance.sdk.openadsdk.activity.single.TTHistoryLandingPageActivity`
- `com.bytedance.sdk.openadsdk.activity.single.TTLandingPageActivity`
- `com.bytedance.sdk.openadsdk.activity.single.TTPlayableLandingPageActivity`
- `com.bytedance.sdk.openadsdk.activity.single.TTRewardExpressVideoActivity`
- `com.bytedance.sdk.openadsdk.activity.single.TTRewardVideoActivity`
- `com.bytedance.sdk.openadsdk.activity.single.TTVideoLandingPageLink2Activity`
- `com.bytedance.sdk.openadsdk.activity.single.TTWebsiteActivity`
- `com.chartboost.sdk.internal.clickthrough.EmbeddedBrowserActivity`
- `com.chartboost.sdk.view.CBImpressionActivity`
- `com.chartboost.sdk.view.FullscreenAdActivity`
- `com.explorestack.iab.mraid.MraidActivity`
- `com.explorestack.iab.mraid.MraidDialogActivity`
- `com.explorestack.iab.vast.activity.VastActivity`
- `com.fyber.inneractive.sdk.activities.FyberReportAdActivity`
- `com.fyber.inneractive.sdk.activities.InneractiveFullscreenAdActivity`
- `com.fyber.inneractive.sdk.activities.InneractiveInternalBrowserActivity`
- `com.fyber.inneractive.sdk.activities.InneractiveRichMediaVideoPlayerActivityCore`
- `com.google.android.gms.ads.AdActivity`
- `com.google.android.gms.ads.NotificationHandlerActivity`
- `com.google.android.gms.ads.OutOfContextTestingActivity`
- `com.ironsource.mediationsdk.testSuite.TestSuiteActivity`
- `com.ironsource.sdk.controller.ControllerActivity`
- `com.ironsource.sdk.controller.InterstitialActivity`
- `com.ironsource.sdk.controller.OpenUrlActivity`
- `com.mbridge.msdk.activity.MBCommonActivity`
- `com.mbridge.msdk.config.activity.MBRewardVideoActivity`
- `com.mbridge.msdk.out.LoadingActivity`
- `com.mbridge.msdk.reward.player.MBRewardVideoActivity`
- `com.mobilefuse.sdk.MobileFuseFullscreenActivity`
- `com.mobilefuse.sdk.MobileFuseFullscreenTransparentActivity`
- `com.mobilefuse.sdk.ad.rendering.splashad.MobileFuseSplashAdActivity`
- `com.mobilefuse.sdk.experimental.NativeInterstitialActivity`
- `com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.MraidActivity`
- `com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.staticrenderer.StaticAdActivity`
- `com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.fullscreen.FullscreenWebviewActivity`
- `com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.VastActivity`
- `com.my.target.common.MyTargetActivity`
- `com.ogury.ad.interstitial.ui.InterstitialActivity`
- `com.ogury.ad.interstitial.ui.InterstitialAndroid8RotableActivity`
- `com.ogury.ad.interstitial.ui.InterstitialAndroid8TransparentActivity`
- `com.pubmatic.sdk.common.browser.POBInternalBrowserActivity`
- `com.pubmatic.sdk.webrendering.mraid.POBVideoPlayerActivity`
- `com.pubmatic.sdk.webrendering.ui.POBFullScreenActivity`
- `com.smaato.sdk.core.browser.SmaatoSdkBrowserActivity`
- `com.smaato.sdk.interstitial.view.InterstitialAdActivity`
- `com.smaato.sdk.rewarded.view.RewardedInterstitialAdActivity`
- `com.startapp.sdk.ads.interstitials.OverlayActivity`
- `com.startapp.sdk.ads.list3d.List3DActivity`
- `com.startapp.sdk.adsbase.consent.ConsentActivity`
- `com.taurusx.tax.mraid.MraidBrowser`
- `com.taurusx.tax.mraid.MraidVideoPlayerActivity`
- `com.taurusx.tax.ui.AppOpenAdActivity`
- `com.taurusx.tax.ui.AppOpenNativeAdActivity`
- `com.taurusx.tax.ui.TaurusxH5Activity`
- `com.taurusx.tax.ui.TaxVideoActivity`
- `com.taurusx.tax.ui.TaxWebViewActivity`
- `com.taurusx.tax.utils.webview.TaxBrowserActivity`
- `com.unity3d.ads.adplayer.FullScreenWebViewDisplay`
- `com.unity3d.ironsourceads.internal.services.InlineStoreActivity`
- `com.vungle.ads.internal.ui.VungleActivity`
- `com.yandex.mobile.ads.common.AdActivity`
- `com.yandex.mobile.ads.features.debugpanel.ui.IntegrationInspectorActivity`
- `com.zmaticoo.sdk.base.common.MaticooInnerActivity`
- `com.zmaticoo.sdk.flow.components.AdActivity`
- `io.bidmachine.iab.mraid.MraidActivity`
- `io.bidmachine.iab.vast.activity.VastActivity`
- `io.bidmachine.nativead.view.VideoPlayerActivity`
- `io.bidmachine.rendering.ad.fullscreen.FullScreenActivity`
- `io.bidmachine.rendering.ad.view.ExpandActivity`
- `net.pubnative.lite.sdk.consent.UserConsentActivity`
- `net.pubnative.lite.sdk.contentinfo.AdFeedbackActivity`
- `net.pubnative.lite.sdk.interstitial.activity.MraidInterstitialActivity`
- `net.pubnative.lite.sdk.interstitial.activity.VastInterstitialActivity`
- `net.pubnative.lite.sdk.rewarded.activity.MraidRewardedActivity`
- `net.pubnative.lite.sdk.rewarded.activity.VastRewardedActivity`
- `net.pubnative.lite.sdk.utils.browser.BrowserActivity`
- `sg.bigo.ads.ad.splash.AdSplashActivity`
- `sg.bigo.ads.ad.splash.LandscapeAdSplashActivity`
- `sg.bigo.ads.api.AdActivity`
- `sg.bigo.ads.api.CompanionAdActivity`
- `sg.bigo.ads.api.LandingStyleableActivity`
- `sg.bigo.ads.api.LandscapeAdActivity`
- `sg.bigo.ads.api.LandscapeCompanionAdActivity`
- `sg.bigo.ads.api.PopupAdActivity`
- `sg.bigo.ads.controller.form.AdFormActivity`
- `sg.bigo.ads.core.mraid.MraidVideoActivity`

