package app.deadcrossing.patches.mono

import app.deadcrossing.patches.compat.emptyYoumiSdksPatch
import app.deadcrossing.patches.compat.modernAndroidPatch
import app.deadcrossing.patches.nativelib.NativeEdits
import app.deadcrossing.patches.shared.Constants.COMPATIBILITY
import app.deadcrossing.patches.shared.Constants.ORIGINAL_APK
import app.adebisi.patches.shared.applyByteEdits
import app.adebisi.patches.shared.removeActivities
import app.adebisi.patches.shared.removeMetaData
import app.deadcrossing.patches.shared.blankConstStrings
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.patch

/**
 * Java ad SDK classes are emptied here. Youmi is a separate unnamed patch so it still
 * runs when this toggle is off. PassMission / FailedMission IL stays with Unlimited
 * currency; firstpass Apsalar/Flurry entry points become `ret` instead.
 *
 * Boot SDK invokes are removed rather than stubbed: FelAdManager.<clinit> still
 * builds a ChartboostDelegate on the emptied Chartboost SDK and never leaves splash.
 * NetUtils upload* methods are return-void so C# JNI cannot hit AdsTransport.
 * FIRSTPASS_URLS rewrites the UTF-16 Feelingtouch hosts C# GETs on its own.
 * UNITY_HWSTATS zeros `stats.unity3d.com/HWStats.cgi` on [NativeEdits.UNITY_PROXY]
 * after Modern Android copies the real library there.
 */
@Suppress("unused")
val disableTelemetryPatch = patch(
    name = "Disable telemetry",
    description = "Stops the game from sending usage data to analytics and ad services.",
) {
    compatibleWith(COMPATIBILITY)
    dependsOn(emptyYoumiSdksPatch, modernAndroidPatch)

    execute {
        skipBootSdkInvokes()
        val leftover = blankConstStrings(ActivityOnCreateFingerprint.method, TELEMETRY_CONST_STRING_KEYS)
        val missing = blankConstStrings(ActivityOnResumeFingerprint.method, leftover)
        if (missing.isNotEmpty()) {
            throw PatchException("activity const-string missing $missing")
        }
        stubNetUtilsAds()
        blankAdsTransportUrls()
        stubAdsTransport()
        stubActivityAdMethods()
        stubTelemetryWrappers()
        emptyTelemetrySdks()
        applyByteEdits(DllEdits.FIRSTPASS_PATH, DllEdits.HOSTS + DllEdits.FIRSTPASS_URLS, ORIGINAL_APK)
        applyByteEdits(NativeEdits.UNITY_PROXY, NativeEdits.UNITY_HWSTATS, ORIGINAL_APK)
        document("AndroidManifest.xml").use { document ->
            removeMetaData(document, TELEMETRY_META_KEYS)
            removeActivities(document, TELEMETRY_ACTIVITIES)
        }
    }
}
