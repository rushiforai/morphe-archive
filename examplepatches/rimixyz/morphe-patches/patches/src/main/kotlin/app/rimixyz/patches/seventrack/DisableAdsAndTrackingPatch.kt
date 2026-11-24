package app.rimixyz.patches.seventrack

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import app.rimixyz.patches.shared.Constants.COMPATIBILITY_17TRACK
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val EXTENSION_CLASS = "Lapp/rimixyz/extension/SeventrackDealsPatch;"
private const val RETURN_VOID = "return-void"

private const val HIDE_DEALS_CAMPAIGN = "SHARE_PREFERENCES_HIDE_DEALS_CAMPAIGN"
private const val HIDE_DEALS_TAB = "SHARE_PREFERENCES_HIDE_DEALS_TAB"

private const val ATTR_NAME = "android:name"
private const val ATTR_VALUE = "android:value"

private val PRIVACY_META_DATA = mapOf(
    "firebase_analytics_collection_deactivated" to "true",
    "firebase_analytics_collection_enabled" to "false",
    "firebase_crashlytics_collection_enabled" to "false",
    "com.facebook.sdk.AutoLogAppEventsEnabled" to "false",
    "com.facebook.sdk.AdvertiserIDCollectionEnabled" to "false",
)

private val ADVERTISING_PERMISSIONS = setOf(
    "com.google.android.gms.permission.AD_ID",
    "android.permission.ACCESS_ADSERVICES_AD_ID",
    "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
    "android.permission.ACCESS_ADSERVICES_CUSTOM_AUDIENCE",
    "android.permission.ACCESS_ADSERVICES_TOPICS",
    "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE",
)

private const val FORCE_BOOL_TRUE = """
    const-string v0, "$HIDE_DEALS_CAMPAIGN"
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :forced_true

    const-string v0, "$HIDE_DEALS_TAB"
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :forced_true

    goto :continue_original

    :forced_true
    const/4 v0, 0x1
    invoke-static { v0 }, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    move-result-object v0
    return-object v0

    :continue_original
"""

private const val FORCE_STRING_TRUE = """
    const-string v0, "$HIDE_DEALS_CAMPAIGN"
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :forced_true

    const-string v0, "$HIDE_DEALS_TAB"
    invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :forced_true

    goto :continue_original

    :forced_true
    const-string v0, "true"
    return-object v0

    :continue_original
"""

private fun Fingerprint.noOpVoid() {
    method.addInstructions(0, RETURN_VOID)
}

@Suppress("unused")
val disableAdsAndTrackingPatch = patch(
    name = "Disable ads and tracking",
    description = "Blocks all AdMob and Flutter Google Mobile Ads formats, hides the 'Deals' tab and campaign promos, disables Firebase Analytics, Crashlytics, and Facebook SDK auto-tracking, and removes Advertising ID permissions.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_17TRACK)

    extendWith("extensions/extension.mpe")

    execute {
        // 1. Block all Flutter google_mobile_ads wrappers before ad requests are built.
        FlutterBannerAdLoadFingerprint.noOpVoid()
        FlutterAdManagerBannerAdLoadFingerprint.noOpVoid()
        FlutterNativeAdLoadFingerprint.noOpVoid()
        FlutterInterstitialAdLoadFingerprint.noOpVoid()
        FlutterAdManagerInterstitialAdLoadFingerprint.noOpVoid()
        FlutterAppOpenAdLoadFingerprint.noOpVoid()
        FlutterRewardedAdLoadFingerprint.noOpVoid()
        FlutterRewardedInterstitialAdLoadFingerprint.noOpVoid()

        // 2. Block all underlying Google Mobile Ads (AdMob) SDK loaders.
        BaseAdViewLoadAdFingerprint.noOpVoid()
        AdLoaderLoadAdFingerprint.noOpVoid()
        AdLoaderLoadAdManagerFingerprint.noOpVoid()
        AdLoaderLoadAdsFingerprint.noOpVoid()
        InterstitialAdLoadFingerprint.noOpVoid()
        AdManagerInterstitialAdLoadFingerprint.noOpVoid()
        AppOpenAdLoadFingerprint.noOpVoid()
        AppOpenAdLoadWithOrientationFingerprint.noOpVoid()
        AppOpenAdLoadAdManagerFingerprint.noOpVoid()
        RewardedAdLoadFingerprint.noOpVoid()
        RewardedAdLoadAdManagerFingerprint.noOpVoid()
        RewardedInterstitialAdLoadFingerprint.noOpVoid()
        RewardedInterstitialAdLoadAdManagerFingerprint.noOpVoid()

        // 3. Hide the 'Deals' tab and campaign ads in Flutter SharedPreferences.
        val getAllMethod = LegacySharedPreferencesGetAllFingerprint.method
        val getAllInstructions = getAllMethod.instructions.toList()
        val returnIndex = getAllInstructions.indexOfLast { it.opcode == Opcode.RETURN_OBJECT }
        if (returnIndex >= 0) {
            val returnReg = (getAllInstructions[returnIndex] as OneRegisterInstruction).registerA
            getAllMethod.addInstructions(
                returnIndex,
                """
                    invoke-static { v$returnReg }, $EXTENSION_CLASS->hideDeals(Ljava/util/Map;)Ljava/util/Map;
                    move-result-object v$returnReg
                """.trimIndent(),
            )
        }

        SharedPreferencesGetBoolFingerprint.method.addInstructions(0, FORCE_BOOL_TRUE)
        SharedPreferencesGetStringFingerprint.method.addInstructions(0, FORCE_STRING_TRUE)

        // 4. Disable Firebase Analytics, Crashlytics, and Facebook auto-tracking via manifest,
        //    and strip Advertising ID permissions while keeping Firebase Auth and FCM intact.
        resourceXml("AndroidManifest.xml").use { manifest ->
            val application = manifest.elements("application").single()

            for ((key, value) in PRIVACY_META_DATA) {
                val existing = application.children("meta-data")
                    .filter { it.attribute(ATTR_NAME) == key }
                if (existing.isEmpty()) {
                    application.appendChild("meta-data") {
                        setAttribute(ATTR_NAME, key)
                        setAttribute(ATTR_VALUE, value)
                    }
                } else {
                    existing.forEach { it.setAttribute(ATTR_VALUE, value) }
                }
            }

            manifest.root.children("uses-permission")
                .filter { it.attribute(ATTR_NAME) in ADVERTISING_PERMISSIONS }
                .forEach { it.remove() }
        }
    }
}
