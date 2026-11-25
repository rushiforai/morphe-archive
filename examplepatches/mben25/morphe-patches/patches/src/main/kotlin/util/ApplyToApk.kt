/*
 * Local verification helper. Not part of the published patch bundle behaviour:
 * it only applies the patches in this project to an APK on disk and prints the result,
 * so fingerprint regressions are caught without going through Manager or the CLI.
 *
 * Usage: ./gradlew :patches:applyToApk --args "<apk> [outputDexDir] [--patches=mtcapsule|masareef|deviceinfo|stayfree|salaat|windy|aliexpress|speedtest|infinity|gcontacts|sigstick|packagename]"
 *
 * The infinity set additionally accepts --client-id=, --redirect-uri= and --user-agent=
 * to supply the patch options that Manager would otherwise prompt for.
 */

package util

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.aliexpress.patches.ads.hideSponsoredItemsPatch
import app.aliexpress.patches.ads.removeAdsPatch as aliexpressRemoveAdsPatch
import app.aliexpress.patches.analytics.disableAnalyticsPatch as aliexpressDisableAnalyticsPatch
import app.aliexpress.patches.coupons.removeCouponsPopupPatch
import app.aliexpress.patches.media.enableImageSavingPatch
import app.aliexpress.patches.notifications.disablePromotionsNotificationsPatch
import app.aliexpress.patches.splash.disableSplashScreenPatch
import app.aliexpress.patches.theme.amoledDarkModePatch
import app.aliexpress.patches.tracking.removeAffiliateTrackingPatch
import app.aliexpress.patches.updates.disableForcedUpdatesPatch
import app.deviceinfo.patches.ads.removeAllAdsPatch
import app.gcontacts.patches.microg.microgSupportPatch as gcontactsMicrogSupportPatch
import app.gcontacts.patches.theme.amoledDarkThemePatch as gcontactsAmoledDarkThemePatch
import app.infinity.patches.api.modifyLoginWebViewPatch as infinityModifyLoginWebViewPatch
import app.infinity.patches.api.spoofClientPatch as infinitySpoofClientPatch
import app.deviceinfo.patches.ads.removeFacebookAudienceNetworkInitPatch
import app.deviceinfo.patches.settings.hidePrivacyPolicyLinkPatch
import app.deviceinfo.patches.settings.hideRemoveAdsButtonPatch
import app.deviceinfo.patches.settings.hideSupportUsSectionPatch
import app.deviceinfo.patches.settings.removeDonateScreenPatch
import app.deviceinfo.patches.theme.amoledDarkThemePatch as deviceinfoAmoledDarkThemePatch
import app.deviceinfo.patches.telemetry.disableAllTelemetryPatch as deviceinfoDisableAllTelemetryPatch
import app.deviceinfo.patches.telemetry.removeAdServicesAttributionPatch
import app.deviceinfo.patches.telemetry.removeAdvertisingIdPatch as deviceinfoRemoveAdvertisingIdPatch
import app.deviceinfo.patches.telemetry.removeFirebaseComponentDiscoveryPatch
import app.masareef.patches.ads.removeAdsPatch
import app.masareef.patches.branding.amoledDarkThemePatch
import app.masareef.patches.branding.fillAdaptiveIconPatch
import app.masareef.patches.integrity.bypassLicenseCheckPatch
import app.masareef.patches.subscription.unlockProPatch as masareefUnlockProPatch
import app.masareef.patches.telemetry.deactivateFirebaseAnalyticsPatch
import app.masareef.patches.telemetry.deactivateFirebaseCrashlyticsPatch
import app.masareef.patches.telemetry.deactivateFirebasePerfPatch
import app.masareef.patches.telemetry.disableAllTelemetryPatch
import app.masareef.patches.telemetry.disableFacebookAdsPatch
import app.masareef.patches.telemetry.disableFacebookAnalyticsPatch
import app.masareef.patches.telemetry.disableFirebaseMessagingAnalyticsPatch
import app.masareef.patches.telemetry.disableFirebaseSessionsPatch
import app.masareef.patches.telemetry.disableGoogleAdsTrackingPatch
import app.masareef.patches.telemetry.removeAdsServicesPatch
import app.masareef.patches.telemetry.removeAdvertisingIdPatch
import app.masareef.patches.telemetry.removeAppMeasurementPatch
import app.masareef.patches.telemetry.removeCrashlyticsServicesPatch
import app.masareef.patches.telemetry.removeFacebookServicesPatch
import app.masareef.patches.telemetry.removeGoogleAnalyticsPatch
import app.mtcapsule.patches.mtisland.unlockProPatch
import app.salaat.patches.integrity.neutralizeSignatureCheckPatch
import app.salaat.patches.location.fixMicrogLocationPatch
import app.salaat.patches.rating.disableAppRatingPatch
import app.salaat.patches.remoteconfig.ignoreRemoteConfigOverridesPatch
import app.salaat.patches.telemetry.disableAllTelemetryPatch as salaatDisableAllTelemetryPatch
import app.salaat.patches.telemetry.deactivateFirebaseTelemetryPatch
import app.salaat.patches.telemetry.disablePartnerSdksPatch
import app.speedtest.patches.ads.unlockAdFreePatch
import app.speedtest.patches.telemetry.disableAllTelemetryPatch as speedtestDisableAllTelemetryPatch
import app.speedtest.patches.telemetry.noAnalyticsPatch
import app.stayfree.patches.backup.localDataBackupPatch
import app.stayfree.patches.drawer.removeFollowUsPatch
import app.stayfree.patches.dashboard.removePairDevicesBannerPatch
import app.stayfree.patches.drawer.removeMyFriendsPatch
import app.stayfree.patches.inbox.removeInboxControlPatch
import app.stayfree.patches.login.hidePairedDevicesGoogleSignInPatch
import app.stayfree.patches.login.removeDrawerSignInPatch
import app.stayfree.patches.login.removeGoogleLoginRequestPatch
import app.stayfree.patches.premium.unlockAllFeaturesPatch
import app.stayfree.patches.settings.removeAppInfoContentsPatch
import app.stayfree.patches.settings.removeDataCollectionOptOutPatch
import app.stayfree.patches.settings.removeGetHelpPatch
import app.stayfree.patches.sync.assumeInternetConnectionPatch
import app.stayfree.patches.sync.inAppQrScannerPatch
import app.stayfree.patches.sync.localDeviceSyncPatch
import app.sigstick.patches.login.removeGoogleLoginPatch
import app.sigstick.patches.premium.unlockPremiumPatch as sigstickUnlockPremiumPatch
import app.sigstick.patches.settings.disableSendLogsPatch
import app.sigstick.patches.settings.removeSettingsLinksPatch
import app.sigstick.patches.telemetry.disableAllTelemetryPatch as sigstickDisableAllTelemetryPatch
import app.sigstick.patches.theme.amoledDarkThemePatch as sigstickAmoledDarkThemePatch
import app.stayfree.patches.sync.miuiBackgroundPopupCheckPatch
import app.stayfree.patches.sync.qrPairingProbePatch
import app.stayfree.patches.sync.refreshPairedDevicesPatch
import app.stayfree.patches.telemetry.disableAllTelemetryPatch as stayfreeDisableAllTelemetryPatch
import app.stayfree.patches.ui.hideTextsPatch
import app.windy.patches.premium.unlockPremiumPatch as windyUnlockPremiumPatch
import kotlinx.coroutines.flow.collect
import app.universal.patches.packagename.changePackageNamePatch
import kotlinx.coroutines.runBlocking
import java.io.File
import kotlin.system.exitProcess

fun main(args: Array<String>) {
    val positional = args.filterNot { it.startsWith("--") }
    val patchSet = args.firstOrNull { it.startsWith("--patches=") }?.substringAfter('=') ?: "mtcapsule"

    val apk = File(positional.firstOrNull() ?: "../mtcapsule15.7.apk")
    require(apk.exists()) { "APK not found: ${apk.absolutePath}" }

    val temporaryFiles = File(positional.getOrNull(1) ?: "build/apply-to-apk")
    temporaryFiles.deleteRecursively()

    var failed = false

    Patcher(PatcherConfig(apkFile = apk, temporaryFilesPath = temporaryFiles)).use { patcher ->
        patcher += when (patchSet) {
            "masareef" -> setOf(
                bypassLicenseCheckPatch,
                removeAdsPatch,
                amoledDarkThemePatch,
                fillAdaptiveIconPatch,
                masareefUnlockProPatch,
                disableAllTelemetryPatch,
                removeAdvertisingIdPatch,
                removeAppMeasurementPatch,
                removeGoogleAnalyticsPatch,
                removeCrashlyticsServicesPatch,
                removeAdsServicesPatch,
            )

            "deviceinfo" -> setOf(
                removeAllAdsPatch,
                removeFacebookAudienceNetworkInitPatch,
                hideSupportUsSectionPatch,
                hidePrivacyPolicyLinkPatch,
                hideRemoveAdsButtonPatch,
                removeDonateScreenPatch,
                deviceinfoAmoledDarkThemePatch,
                deviceinfoDisableAllTelemetryPatch,
                deviceinfoRemoveAdvertisingIdPatch,
                removeAdServicesAttributionPatch,
                removeFirebaseComponentDiscoveryPatch,
            )

            "stayfree" -> setOf(
                stayfreeDisableAllTelemetryPatch,
                removeGoogleLoginRequestPatch,
                hidePairedDevicesGoogleSignInPatch,
                removeDrawerSignInPatch,
                removeInboxControlPatch,
                unlockAllFeaturesPatch,
                localDeviceSyncPatch,
                assumeInternetConnectionPatch,
                refreshPairedDevicesPatch,
                inAppQrScannerPatch,
                miuiBackgroundPopupCheckPatch,
                hideTextsPatch,
                localDataBackupPatch,
                removeGetHelpPatch,
                removeAppInfoContentsPatch,
                removeDataCollectionOptOutPatch,
                removeFollowUsPatch,
                removeMyFriendsPatch,
                removePairDevicesBannerPatch,
                // Ships disabled; included here so its fingerprint is still verified.
                qrPairingProbePatch,
            )

            "salaat" -> setOf(
                neutralizeSignatureCheckPatch,
                salaatDisableAllTelemetryPatch,
                disablePartnerSdksPatch,
                deactivateFirebaseTelemetryPatch,
                disableAppRatingPatch,
                ignoreRemoteConfigOverridesPatch,
                fixMicrogLocationPatch,
            )

            // The spoof patch requires an OAuth client ID. Manager prompts for it; here a
            // syntactically valid placeholder is injected so the fingerprints still get
            // exercised. Override with --client-id=<22 chars> to verify a real credential.
            "infinity" -> {
                val placeholderClientId = args
                    .firstOrNull { it.startsWith("--client-id=") }
                    ?.substringAfter('=')
                    ?: "AAAAAAAAAAAAAAAAAAAAAA"
                infinitySpoofClientPatch.options["client-id"] = placeholderClientId

                // Optional, so the non-default branches of the patch can be exercised too.
                args.firstOrNull { it.startsWith("--redirect-uri=") }?.let {
                    infinitySpoofClientPatch.options["redirect-uri"] = it.substringAfter('=')
                }
                args.firstOrNull { it.startsWith("--user-agent=") }?.let {
                    infinitySpoofClientPatch.options["user-agent"] = it.substringAfter('=')
                }

                setOf(infinitySpoofClientPatch, infinityModifyLoginWebViewPatch)
            }

            // Universal; Manager prompts for the name. Override with --package-name=<name>.
            "packagename" -> {
                changePackageNamePatch.options["packageName"] = args
                    .firstOrNull { it.startsWith("--package-name=") }
                    ?.substringAfter('=')
                    ?: "com.example.renamed"
                setOf(changePackageNamePatch)
            }

            "gcontacts" -> setOf(gcontactsMicrogSupportPatch, gcontactsAmoledDarkThemePatch)

            "windy" -> setOf(windyUnlockPremiumPatch)

            "sigstick" -> setOf(
                sigstickUnlockPremiumPatch,
                removeGoogleLoginPatch,
                disableSendLogsPatch,
                removeSettingsLinksPatch,
                sigstickAmoledDarkThemePatch,
                sigstickDisableAllTelemetryPatch,
            )

            "speedtest" -> setOf(
                unlockAdFreePatch,
                noAnalyticsPatch,
                speedtestDisableAllTelemetryPatch,
            )

            "aliexpress" -> setOf(
                amoledDarkModePatch,
                aliexpressRemoveAdsPatch,
                hideSponsoredItemsPatch,
                disableSplashScreenPatch,
                removeCouponsPopupPatch,
                disableForcedUpdatesPatch,
                disablePromotionsNotificationsPatch,
                aliexpressDisableAnalyticsPatch,
                removeAffiliateTrackingPatch,
                enableImageSavingPatch,
            )

            else -> setOf(unlockProPatch)
        }

        runBlocking {
            patcher().collect { result ->
                val exception = result.exception
                if (exception == null) {
                    println("OK   ${result.patch}")
                } else {
                    failed = true
                    println("FAIL ${result.patch}")
                    exception.printStackTrace()
                }
            }
        }

        // The dex is written out even when a patch failed, so a run where one fingerprint no
        // longer resolves can still be inspected for what the patches that did apply produced.
        // Disassembling that dex is the only way to catch a bad injection that the patcher
        // itself accepts, e.g. stale branch offsets that only surface as a VerifyError on device.
        val dexOutput = File(temporaryFiles, "patched-dex").apply { mkdirs() }
        patcher.get().dexFiles.forEach { dex ->
            File(dexOutput, dex.name).outputStream().use { dex.stream.copyTo(it) }
        }
        println("Patched dex files written to $dexOutput")
    }

    if (failed) exitProcess(1)
}
