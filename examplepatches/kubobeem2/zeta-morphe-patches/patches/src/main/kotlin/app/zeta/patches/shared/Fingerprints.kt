package app.zeta.patches.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Android の Activity.onCreate(Bundle) のフィンガープリント。
 * アプリの UI 初期化時に Hook (ZetaExtension.init) を実行し、
 * フローティング HUD と Hermes Memory / TPS モニターをアタッチします。
 */
object ActivityOnCreateFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
    filters = listOf(
        methodCall(
            definingClass = "Landroid/app/Activity;",
            name = "onCreate",
            parameters = listOf("Landroid/os/Bundle;"),
            returnType = "V"
        )
    )
)

/**
 * Activity.onResume() のフィンガープリント。
 * アプリ復帰時にオーバーレイや設定を再アタッチします。
 */
object ActivityOnResumeFingerprint : Fingerprint(
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        methodCall(
            definingClass = "Landroid/app/Activity;",
            name = "onResume",
            parameters = emptyList(),
            returnType = "V"
        )
    )
)

/**
 * Google Mobile Ads (AdMob) の AdView.loadAd(AdRequest) フィンガープリント。
 */
object AdMobLoadAdFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Lcom/google/android/gms/ads/AdRequest;"),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/google/android/gms/ads/BaseAdView;",
            name = "loadAd",
            parameters = listOf("Lcom/google/android/gms/ads/AdRequest;"),
            returnType = "V"
        )
    )
)

/**
 * AppLovin MaxAdView.loadAd() フィンガープリント。
 */
object AppLovinLoadAdFingerprint : Fingerprint(
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/applovin/mediation/ads/MaxAdView;",
            name = "loadAd",
            parameters = emptyList(),
            returnType = "V"
        )
    )
)
