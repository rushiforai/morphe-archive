package io.github.kirby1997.patches.pairip

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags

// Universal bypass for Google Play PairIP's *license check* — the Java Play-
// ownership gate that blocks sideloaded installs of PairIP-wrapped apps. The
// com.pairip.licensecheck.* classes are byte-for-byte stable across apps, so no
// per-app fingerprinting is needed and no compatibleWith is declared — the patch
// matches by class presence alone and applies to whatever a given app contains.
//
// SCOPE: defeats only the *licensecheck* feature. It does NOT touch PairIP's
// *VM virtualization + native integrity* layer (libpairipcore.so, VMRunner), which
// some apps (e.g. X/Twitter v12.4.1) add on top and which SIGSEGVs on any re-signed
// APK regardless of this patch.

// Provider entry point (runs at startup, before any Activity). Gut it to `return true`.
object LicenseContentProviderOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseContentProvider;",
    name = "onCreate",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = listOf(),
)

// Provider-flavor client init.
object InitializeLicenseCheckFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "initializeLicenseCheck",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf(),
)

// Application-flavor client entry (X/Twitter shape).
object CheckLicenseFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "checkLicense",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)

// Failure action that calls System.exit(0) — neutralised as a last-resort safety net.
object ExitActionRunFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient\$1;",
    name = "run",
    returnType = "V",
    parameters = listOf(),
)

@Suppress("unused")
val disablePairipLicenseCheckPatch = bytecodePatch(
    name = "Disable PairIP license check",
    description = "Universally bypasses Google Play PairIP's license verification (the Play-ownership " +
        "gate that blocks sideloaded installs). Applies to any PairIP-licensed app; does not defeat " +
        "PairIP's native VM/integrity layer.",
) {
    // Each surface is guarded so the patch applies to whatever a given app contains
    // (provider-flavor, application-flavor, or both).
    execute {
        // Provider-based: return true without constructing LicenseClient.
        runCatching {
            val method = LicenseContentProviderOnCreateFingerprint.method
            val size = method.implementation!!.instructions.size
            method.removeInstructions(0, size)
            method.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """,
            )
        }

        // Provider-flavor init → no-op.
        runCatching { InitializeLicenseCheckFingerprint.method.addInstructions(0, "return-void") }

        // Application-flavor check → no-op.
        runCatching { CheckLicenseFingerprint.method.addInstructions(0, "return-void") }

        // System.exit(0) failure action → no-op.
        runCatching { ExitActionRunFingerprint.method.addInstructions(0, "return-void") }
    }
}
