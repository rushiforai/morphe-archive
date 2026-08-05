package app.template.patches.mav

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_MAV_EMMAPP
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Verified against hu.mav.emmapp_merged.apk (smali: d8/n.smali). Confirmed
 * present under the same class name in both app versions seen so far
 * (2.4.15-prod and 2.4.19-prod), but that's treated as coincidental rather
 * than reliable -- this app's own obfuscated classes/methods get renamed
 * independently on every build (the exact situation that broke several other
 * fingerprints in this patch set), so this one intentionally does NOT pin a
 * definingClass or method name.
 *
 * This class's static initializer builds a real OkHttp `CertificatePinner`
 * (obfuscated to `Lkd/g;`) from four hardcoded `sha256/...` SPKI pins, lazily
 * (`Lub/o;`, Kotlin's `by lazy { ... }`). Its one real method --
 * `a(OkHttpClient.Builder, Context)` -- checks a boolean resource flag and,
 * if set, installs that CertificatePinner onto the OkHttpClient.Builder
 * (`iput-object p1, p0, Lkd/w;->q:Lkd/g;`, the builder's `certificatePinner`
 * property).
 *
 * The four pin strings themselves live in the class's `<clinit>`, not in
 * this method, so they can't anchor a fingerprint on the method directly.
 * Instead this uses the literal string `"certificatePinner"` -- Kotlin's
 * compiler-generated null-check parameter name for the call into OkHttp's
 * own `certificatePinner` setter, so it comes from OkHttp's stable public
 * API naming rather than this app's own generated identifiers. It's the
 * only method in the entire dex that references this string (verified by
 * grepping the disassembled smali), so no further shape constraints are
 * needed to disambiguate.
 *
 * Neutralizing this installer method (rather than e.g. emptying the pin
 * list) means the OkHttpClient.Builder simply never gets a CertificatePinner
 * assigned at all, regardless of the feature-flag resource's value --
 * OkHttp performs no pinning checks for a builder with no pinner configured.
 */
object CertificatePinningInstallFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    strings = listOf("certificatePinner"),
)

@Suppress("unused")
val disableCertificatePinningPatch = bytecodePatch(
    name = "Disable certificate pinning",
    description = "Prevents the app's OkHttp CertificatePinner from ever being installed, allowing HTTPS traffic to be intercepted (e.g. by a proxy) for analysis.",
    default = false
) {
    compatibleWith(COMPATIBILITY_MAV_EMMAPP)

    execute {
        CertificatePinningInstallFingerprint.method.addInstructions(0, "return-void")
    }
}
