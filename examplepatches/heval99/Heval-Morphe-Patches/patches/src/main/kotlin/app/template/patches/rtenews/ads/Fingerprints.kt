package app.template.patches.rtenews.ads

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/** Compose's runtime Composer parameter, kept by R8 (compose compiler ABI). */
internal const val COMPOSER = "Landroidx/compose/runtime/q;"

/**
 * The article ad block: a static Compose function whose only parameter is the app's
 * RteAdContainer ("adContainer" is the Kotlin parameter name the null check keeps) that draws the
 * "ADVERTISEMENT" heading and hosts the AdView. Drawn for every ad embed, so it is also what is
 * left behind as an empty placeholder when no ad fills.
 */
internal object RteAdBlockFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "V",
    strings = listOf("adContainer"),
    custom = { method, _ ->
        method.parameterTypes.map(CharSequence::toString).let { COMPOSER in it && it.size == 3 }
    },
)

/**
 * The article ad loader: the Compose helper that builds the RteAdContainer, creates the AdView,
 * sets the ad unit id from the article's advertising info and calls `AdView.loadAd(request)`.
 * "Ad request targeting: " is the app's own log line, unique in the APK.
 */
internal object RteAdLoadFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    strings = listOf("Ad request targeting: "),
    custom = { method, _ ->
        val params = method.parameterTypes.map(CharSequence::toString)
        COMPOSER in params && method.returnType.startsWith("L")
    },
)
