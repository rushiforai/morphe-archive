package app.polishapps.patches.yanosik.androidauto

import app.morphe.patcher.patch.bytecodePatch
import app.polishapps.patches.shared.Constants.COMPATIBILITY_YANOSIK
import app.polishapps.patches.shared.Constants.YANOSIK_26_10_0
import app.polishapps.patches.shared.Constants.YANOSIK_26_9_0
import app.polishapps.patches.shared.methodFingerprint
import app.polishapps.patches.shared.replaceBody
import app.polishapps.patches.shared.targetsFor

/** The Car App Library `HostValidator` class, by Yanosik version. */
private val hostValidatorByVersion = mapOf(
    YANOSIK_26_9_0 to "Ln49;",
    YANOSIK_26_10_0 to "Lw79;",
)

/**
 * Bypasses the Car App Library host certificate validation so Yanosik works on Android Auto.
 *
 * `pl.neptis.features.androidauto.nav.AutoService` extends `androidx.car.app.CarAppService` and
 * overrides the host validator getter (`a()`). In release builds it builds a validator with a
 * hardcoded host allowlist and validates the connected Android Auto host against it (host package
 * plus signing certificate, SHA-256). A re-signed / non-Play install, or an Android Auto host whose
 * certificate is not in the shipped allowlist, fails that check and the app does not work on
 * Android Auto.
 *
 * `HostValidator.e` (`n49.e` in 26.9.0) is the "Validator disabled, all hosts allowed" instance the library itself uses when the
 * app is debuggable, so returning it skips the certificate checks entirely.
 */
@Suppress("unused")
val bypassAndroidAutoCertificateChecksPatch = bytecodePatch(
    name = "Bypass Android Auto certificate checks",
    description = "Bypasses the Car App Library host certificate validation so Yanosik works on Android Auto.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YANOSIK)

    execute {
        val hostValidator = targetsFor(hostValidatorByVersion)

        methodFingerprint(
            "Lpl/neptis/features/androidauto/nav/AutoService;",
            "a",
            returnType = hostValidator,
        ).method.replaceBody(
            """
                sget-object p0, $hostValidator->e:$hostValidator
                return-object p0
            """,
        )
    }
}
