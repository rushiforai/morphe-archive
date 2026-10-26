package app.markpaul099.patches.gboard.misc.signature

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

/**
 * HttpRequestHelper.getAndroidCertInternal builds the headers Google APIs use to
 * check which app is calling:
 *
 * ```
 * ImmutableMap.of("X-Android-Cert", sha1(signature), "X-Android-Package", context.getPackageName())
 * ```
 */
object AndroidCertHeadersFingerprint : Fingerprint(
    strings = listOf("getAndroidCertInternal"),
    filters = listOf(
        methodCall(name = "getPackageName"),
        string("X-Android-Package", location = MatchAfterWithin(3)),
        string("X-Android-Cert", location = MatchAfterWithin(2)),
        methodCall(
            parameters = listOf(
                "Ljava/lang/Object;",
                "Ljava/lang/Object;",
                "Ljava/lang/Object;",
                "Ljava/lang/Object;"
            ),
            location = MatchAfterWithin(2)
        )
    )
)
