package app.salaat.patches.integrity

import app.salaat.patches.shared.Constants.COMPATIBILITY_SALAAT
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val neutralizeSignatureCheckPatch = bytecodePatch(
    name = "Neutralize Signature Check",
    description = "Stubs the hidden anti-tamper check in LanguageCheckerKt that MD5-fingerprints " +
        "the signing certificate and calls System.exit(0) when it does not match the bundled " +
        "signature. A re-signed (patched) APK always mismatches, so without this the app kills " +
        "itself on launch and no other patch can run. Required dependency of every other Salaat " +
        "patch.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SALAAT)

    execute {
        // access$b computes and stores the check/mis verdict; initLanguage is the exit path.
        // Stubbing both means the verdict is never computed AND any pre-existing mis=true from a
        // prior unpatched launch can no longer trigger the exit.
        listOf(
            SignatureCheckFingerprint,
            InitLanguageFingerprint,
        ).forEach { fingerprint ->
            fingerprint.method.addInstructions(0, "return-void")
        }
    }
}
