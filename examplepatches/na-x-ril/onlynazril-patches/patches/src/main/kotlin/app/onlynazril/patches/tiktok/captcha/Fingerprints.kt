package app.onlynazril.patches.tiktok.captcha

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.string

/**
 * Anchors for the captcha patch.
 *
 * `SecApiImpl` and `LiveHostUser` are real-named ByteDance classes, and the methods that ask
 * TikTok to show a risk-control puzzle keep their names. What moves between builds is the
 * obfuscated callback each one is handed (parameter 3), so its type is read off the match rather
 * than written down, and only the method it is dismissed with (`LIZJ` / `LIZIZ`) is written.
 *
 * `SecApiImpl` carries two `popCaptchaV2` overloads since 46.9.3: the four-parameter one is a
 * forwarder with no log line, and the five-parameter one does the work. The `strings` filter is
 * what keeps the hook on the one that does the work.
 */
internal object SecCaptchaPopupFingerprint : Fingerprint(
    definingClass = "Lcom/ss/android/ugc/aweme/sec/SecApiImpl;",
    name = "popCaptchaV2",
    returnType = "V",
    parameters = listOf(
        "Landroid/app/Activity;",
        "Ljava/lang/String;",
        "L",
        "Landroidx/fragment/app/Fragment;",
        "Ljava/lang/String;",
    ),
    strings = listOf(string("popCaptchaV2 - riskInfo =", StringComparisonType.STARTS_WITH)),
)

/**
 * The older `popCaptcha`, which carries only the server's error code. Kept because it is the entry
 * point a build without `popCaptchaV2` would use; on 47.0.3 and 47.1.4 the V2 form is the live one.
 */
internal object SecLegacyCaptchaPopupFingerprint : Fingerprint(
    definingClass = "Lcom/ss/android/ugc/aweme/sec/SecApiImpl;",
    name = "popCaptcha",
    returnType = "V",
    parameters = listOf("Landroid/app/Activity;", "I", "L"),
    strings = listOf(string("popCaptcha - errorcode =", StringComparisonType.STARTS_WITH)),
)

/**
 * The LIVE host's copy of the same entry point. Matched on the exact class, not a suffix: the
 * dummy that sits beside it declares the same method and is never the one a phone calls.
 */
internal object LiveCaptchaPopupFingerprint : Fingerprint(
    definingClass = "Lcom/ss/android/ugc/aweme/live/livehostimpl/LiveHostUser;",
    name = "popCaptchaV2",
    returnType = "V",
    parameters = listOf(
        "Landroid/app/Activity;",
        "Ljava/lang/String;",
        "L",
        "Landroidx/fragment/app/Fragment;",
    ),
)
