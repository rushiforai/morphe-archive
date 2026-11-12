package app.template.patches.adidas.pairip

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.ADIDAS_RUNNING_COMPATIBILITY
import app.template.patches.shared.clearBody
import app.template.patches.shared.killPairIpFull
import app.template.patches.shared.pairIPManifestPatch
import app.template.patches.shared.restorePairIpHolders
import app.template.patches.shared.returnEarly

/**
 * Bypasses adidas Running's PairIP (Google Play application-licensing) protection.
 *
 * ## Protection map (proven on-device, 2026-11-08/09)
 * adidas ships the **full** PairIP variant on both 14.4.0 and 14.12.1:
 *  - `com.pairip.application.Application` wraps the real Application (manifest swap fixes it);
 *  - a DEX VM (`VMRunner` + native `libpairipcore.so`) runs one encrypted program per
 *    virtualized method (18 in 14.12.1 incl. `Application.onCreate`; 20 in 14.4.0 —
 *    receivers only — where `Application.onCreate` uses reflection method-extraction),
 *  - plus a **startup program** (`StartupLauncher.launch`) that carries the integrity /
 *    attestation check: it **SIGSEGVs any re-signed build** (verified with an unmodified
 *    merged+re-signed APK, so no dex-level patch can keep the VM alive);
 *  - the VM also populates ~33 obfuscated string-holder classes (~1500 strings) at runtime.
 *
 * ## What works (this patch)
 *  - [killPairIpFull] — no-ops the VM, the Java signature check and the whole Play LVL
 *    licence flow, and clears every `VMRunner.invoke` call site (the 18/20 virtualized
 *    methods become typed no-ops),
 *  - [restorePairIpHolders] — bakes the VM's runtime strings, captured from a **root heap
 *    dump of the ORIGINAL Play-signed app** (`am dumpheap` → HPROF parse; values differ
 *    per build → the TSV resource is picked by app version). Without this the app NPEs in
 *    `FirebaseInitProvider` ("Null version").
 *  - [pairIPManifestPatch] — restores the real Application class and drops the licence
 *    activity / `CHECK_LICENSE`.
 *
 * ## Residual limitation
 * With the VM dead the virtualized method bodies are gone, so 14.12.1 dies later in
 * `MainActivity` (its `Application.onCreate` and DI setup were VM-only). 14.4.0 keeps real
 * Java bodies for app init (reflection-extracted) and dies at `Application.onCreate`
 * because the startup program is what populates the reflection Method table — recovering
 * those needs either the VM programs decrypted (native RE, no toolchain available) or a
 * runtime capture on the original app. See docs/adidas.md for the full analysis.
 */
@Suppress("unused")
val adidasBypassPairIpPatch = bytecodePatch(
    name = "Bypass PairIP",
    description = "Disables adidas Running's PairIP licence/VM verification, restores the " +
        "real Application class and bakes the VM's runtime strings (captured from the " +
        "original app's heap) so Firebase etc. initialize cleanly. NOTE: adidas runs the " +
        "full PairIP VM whose startup program is the tamper check — the patched app boots " +
        "past the licence gate but the VM-virtualized init methods cannot be restored " +
        "without native reverse engineering, so the app may crash after launch. See " +
        "docs/adidas.md.",
    default = true,
) {
    category("PairIP")
    compatibleWith(ADIDAS_RUNNING_COMPATIBILITY)

    dependsOn(
        pairIPManifestPatch("com.runtastic.android.RuntasticApplication"),
    )

    execute {
        killPairIpFull()

        // Bake the VM's runtime strings, captured from a root heap dump of the ORIGINAL
        // app (values differ per build → pick the TSV by app version).
        val dir = when {
            packageMetadata.versionName.startsWith("14.4") -> "adidas40"
            else -> "adidas"
        }
        restorePairIpHolders(dir)
    }
}

/**
 * Kills the PairIP licence flow + the VM STARTUP program while keeping `VMRunner.invoke`
 * (and thus the per-method programs) alive. NOT used for the default patch: on-device
 * tests proved the per-method programs abort (native C++ `length_error` in -fno-exceptions
 * mode) unless the startup program ran first — the VM needs state only the startup
 * program creates. Kept here as the documented starting point for a future attempt that
 * pre-creates that state (e.g. by decrypting + replaying the startup program's effects).
 */
private fun BytecodePatchContext.killPairIpStartupProgramOnly() {
    val sig = "Lcom/pairip/SignatureCheck;"
    val lic = "Lcom/pairip/licensecheck/LicenseClient;"
    val state = "Lcom/pairip/licensecheck/LicenseClient\$LicenseCheckState;"

    mutableClassDefByOrNull("Lcom/pairip/StartupLauncher;")?.methods
        ?.firstOrNull { it.name == "launch" }?.returnEarly()

    mutableClassDefByOrNull(sig)?.methods?.forEach { m ->
        when (m.name) {
            "verifyIntegrity" -> m.returnEarly()
            "verifySignatureMatches" -> m.returnEarly(true)
        }
    }

    mutableClassDefByOrNull(lic)?.methods?.firstOrNull { it.name == "initializeLicenseCheck" }
        ?.apply {
            clearBody()
            addInstructions(
                0,
                """
                sget-object v0, $state->LOCAL_CHECK_OK:$state
                sput-object v0, $lic->licenseCheckState:$state
                return-void
                """.trimIndent(),
            )
        }
    listOf(
        "connectToLicensingService", "lambda\$retryOrThrow\$0", "processResponse",
        "startPaywallActivity", "validateResponse",
    ).forEach { name ->
        mutableClassDefByOrNull(lic)?.methods?.firstOrNull { it.name == name }
            ?.apply { clearBody(); addInstructions(0, "return-void") }
    }
    mutableClassDefByOrNull(lic)?.methods?.firstOrNull { it.name == "performLocalInstallerCheck" }
        ?.returnEarly(true)
    mutableClassDefByOrNull("Lcom/pairip/licensecheck/ResponseValidator;")?.methods
        ?.firstOrNull { it.name == "validateResponse" }
        ?.apply { clearBody(); addInstructions(0, "return-void") }
    mutableClassDefByOrNull(lic)?.methods?.firstOrNull { it.name == "<clinit>" }
        ?.addInstructions(0, "const/4 v0, 0x0\nsput-boolean v0, $lic->repeatedCheckEnabled:Z\n")
}
