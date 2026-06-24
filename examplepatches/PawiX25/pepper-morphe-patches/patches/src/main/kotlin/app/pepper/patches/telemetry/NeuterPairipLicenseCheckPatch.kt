package app.pepper.patches.telemetry

import app.pepper.patches.shared.clearBody
import app.pepper.patches.shared.PEPPERDEALS_US
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch

/**
 * Disables Google Play's PAIRIP (Play App Install Referrer Integrity
 * Protection) license check that ships ONLY with the US build
 * `com.pepperdeals`. The other nine regional sister apps don't bundle
 * PAIRIP at all — verified by string-pool scan of every dex in
 * pepperFamilyPackages: zero `com/pairip/licensecheck` hits everywhere
 * except `com.pepperdeals`, where there's exactly one.
 *
 * What PAIRIP does:
 *   At runtime it requires `getInstallerPackageName == com.android.vending`
 *   (Play Store install). Sideloaded APKs fail the check, the licensing
 *   round-trip errors out, and PAIRIP shows a non-dismissable dialog
 *   blocking the app.
 *
 * What we patch:
 *   PAIRIP wires itself in two places. Both must go:
 *
 *   1. `Lcom/pairip/licensecheck/LicenseContentProvider;->onCreate()Z`
 *      Auto-init via `<provider>` in AndroidManifest.xml. Same trick as
 *      [neuterTrackerProvidersPatch] — return `false`, Android marks the
 *      provider failed-init and never calls into it. This kills the
 *      static-init path that reads `meta-data` from the manifest and
 *      kicks off `LicenseClient`.
 *
 *   2. `Lcom/pairip/licensecheck/LicenseClient;->initializeLicenseCheck()V`
 *      Explicit runtime entry that other code paths can hit even with
 *      the provider neutered (e.g. if Pepper code touches PAIRIP via
 *      reflection during its first-launch flow). Replace the body with
 *      `return-void`. Same approach as patches T5 / T6 / T7 —
 *      build a fresh `MutableMethodImplementation` to dodge dexlib's
 *      read-only `tryBlocks` list, which would otherwise leave the
 *      original exception-entry table pointing at offsets that no
 *      longer exist.
 *
 * What we deliberately DON'T touch:
 *   * `LicenseActivity` — the dialog Activity. Killing the entry points
 *     above means it never gets started, so we don't need to neuter it
 *     and risk crashing manifest validation.
 *   * `LicenseClient.<init>` — pulling out the constructor would NPE
 *     anything that holds a `LicenseClient` reference. Leaving the
 *     constructor alive but the methods empty is cleaner.
 *   * Any of the nested $Lambda / $1 / $2 helpers — they're called
 *     only from the methods we already neutered.
 *
 * Compatibility note:
 *   Patch is declared compatible with `com.pepperdeals` only. PAIRIP
 *   ships exclusively in the US build — verified by string-pool
 *   scan of every dex in pepperFamilyPackages: zero
 *   `com/pairip/licensecheck` hits in the other nine regional sister
 *   apps. Listing them as compatible would still produce a no-op
 *   (`classDefs` walk skips over absent target classes), but it would
 *   also surface T8 in ReVanced Manager's per-app patch list for nine
 *   apps that have nothing to gain from it — confusing UX. Restricting
 *   `compatibleWith` to `com.pepperdeals` hides T8 from the other nine.
 *
 * No `dependsOn` on the T1–T7 chain because PAIRIP is orthogonal: it's
 * a Play Store gating mechanism, not a tracker. This patch can be used
 * alone (e.g. someone who only wants `com.pepperdeals` to install
 * cleanly without telemetry blocking).
 */
@Suppress("unused")
val neuterPairipLicenseCheckPatch = bytecodePatch(
    name = "Disable PAIRIP license check",
    description = "Removes Google Play's install-source DRM check from the " +
        "US Pepper.com build, allowing sideloaded APKs to open.",
) {
    compatibleWith(PEPPERDEALS_US)

    val providerType = "Lcom/pairip/licensecheck/LicenseContentProvider;"
    val clientType = "Lcom/pairip/licensecheck/LicenseClient;"

    execute {

        classDefForEach { classDef ->
            when (classDef.type) {
                providerType -> {
                    val mutableClass = mutableClassDefBy(classDef)
                    mutableClass.methods.forEach { method ->
                        if (method.name == "onCreate" &&
                            method.parameterTypes.isEmpty() &&
                            method.returnType == "Z"
                        ) {
                            method.clearBody()
                            method.addInstructions(
                                0,
                                """
                                const/4 p0, 0x0
                                return p0
                                """.trimIndent(),
                            )
                        }
                    }
                }

                clientType -> {
                    val mutableClass = mutableClassDefBy(classDef)
                    mutableClass.methods.forEach { method ->
                        if (method.name == "initializeLicenseCheck" &&
                            method.parameterTypes.isEmpty() &&
                            method.returnType == "V"
                        ) {
                            method.clearBody()
                            method.addInstructions(0, "return-void")
                        }
                    }
                }
            }
        }
    }
}
