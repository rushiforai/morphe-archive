package app.blockblast.patches.ad

import app.morphe.patcher.Fingerprint

/**
 * be/b.smali - Banner ad show/hide control.
 * Method c(AppActivity)V checks isADShow and isBannerShow to decide
 * whether to show or hide banner ads.
 * Body is replaced: always returns immediately (no banner logic).
 */
object BannerAdControlFingerprint : Fingerprint(
    definingClass = "Lbe/b;",
    name = "c",
    returnType = "V",
    parameters = listOf("Lorg/cocos2dx/javascript/AppActivity;")
)

/**
 * be/b.smali - Banner ad show/hide control (variant).
 * Method d(AppActivity)V also checks isADShow and isBannerShow.
 * Body is replaced: always returns immediately.
 */
object BannerAdControlVariantFingerprint : Fingerprint(
    definingClass = "Lbe/b;",
    name = "d",
    returnType = "V",
    parameters = listOf("Lorg/cocos2dx/javascript/AppActivity;")
)

/**
 * be/a.smali - Primary banner ad display decision.
 * Method i(AppActivity, Lb2/a, Lk3/d)V is the main banner ad display logic.
 * Body is replaced: always returns immediately.
 */
object BannerAdDisplayFingerprint : Fingerprint(
    definingClass = "Lbe/a;",
    name = "i",
    returnType = "V",
    parameters = listOf(
        "Lorg/cocos2dx/javascript/AppActivity;",
        "Lb2/a;",
        "Lk3/d;"
    )
)

/**
 * yf/g.smali - Ad-related async work launcher.
 * Method b()V checks isADShow and launches async ad tasks.
 * Body is replaced: always returns immediately.
 */
object AdAsyncWorkFingerprint : Fingerprint(
    definingClass = "Lyf/g;",
    name = "b",
    returnType = "V",
    parameters = listOf()
)

/**
 * wg/h0.smali - Ad SDK pre-initialization (PerformanceUtil).
 * Method h(Context)V checks isADShow and initializes ad SDK.
 * Body is replaced: always returns immediately (skips ad SDK init).
 */
object AdSdkInitFingerprint : Fingerprint(
    definingClass = "Lwg/h0;",
    name = "h",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;")
)
