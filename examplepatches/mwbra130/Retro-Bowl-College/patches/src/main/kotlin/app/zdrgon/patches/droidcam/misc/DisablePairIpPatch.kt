package app.zdrgon.patches.droidcam.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.zdrgon.patches.droidcam.shared.Constants.COMPATIBILITY_DROIDCAM
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// Extension helper that replaces the PairIP VM startup program: it fills
// the app's string vaults and Method handles with the constants harvested
// from the original app. Must match the class in the extensions module.
private const val VAULT_INIT =
    "Lapp/template/extension/droidcam/VaultInit;"

/**
 * Neutralizes DroidCam's PairIP protection so the re-signed app can run
 * at all (stock PairIP kills re-signed builds ~50ms after launch, and
 * the app code cannot run without the data the VM startup program
 * provides):
 *
 * 1. StartupLauncher.launch() now fills the vaults/handles via the
 *    extension and returns immediately; the VM never runs.
 * 2. PairIP's Application.attachBaseContext calls the same fill and no
 *    longer calls VMRunner.setContext / SignatureCheck.verifyIntegrity.
 * 3. The license-check content provider is stubbed to a no-op, so the
 *    PairIP license dialog never appears.
 *
 * Requires "Disable PairIP protection (runtime files)" as well: that
 * patch adds the runtime-only lifecycle classes the handles point to
 * and swaps the two VM-encrypted native libraries for decrypted builds.
 *
 * All edits verified live on DroidCam 9.0 (vc76) before being written
 * as patches (experiments #3-#10, 2026-11-04).
 */
@Suppress("unused")
val disablePairIpPatch = bytecodePatch(
    name = "Disable PairIP protection",
    description = "Lets the patched app run: replaces PairIP's VM startup with harvested " +
        "vault/handle data and removes the signature check and license dialog. " +
        "Requires 'Disable PairIP protection (runtime files)'. DroidCam 9.0 only.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_DROIDCAM)

    // Merge the extension DEX (VaultInit) into the patched app.
    extendWith("extensions/extension.mpe")

    // Merge the runtime-only lifecycle classes (DroidCamApp/MainActivity
    // $c20200603xx) as well. They must enter as class definitions through
    // the patcher's class pipeline: writing the raw dex into the APK as
    // a file does NOT work (the patcher's dex compilation owns every
    // classes<N>.dex slot in the output and discards raw dex files,
    // which left these classes undefined -> ClassNotFoundException when
    // VaultInit tried to resolve the Method handles). A patch carries a
    // single extendWith extension, so the dex arrives via extendWithAll
    // from the runtime-files resource patch (the patcher docs' pattern
    // for merging DEX files supplied by a dependency).
    dependsOn(pairIpRuntimeFilesPatch)
    extendWithAll { droidcamRuntimeDex }

    execute {
        // 1. Startup: fill, then return before VMRunner.invoke can run.
        StartupLaunchFingerprint.method.addInstructions(
            0,
            """
                invoke-static {}, $VAULT_INIT->fill()V
                return-void
            """,
        )

        // 2. attachBaseContext: fill first, then delete the PairIP calls
        //    (VMRunner.setContext, SignatureCheck.verifyIntegrity),
        //    keeping only the invoke-super to the real Application.
        val attach = PairIpApplicationAttachFingerprint.method
        attach.addInstructions(
            0,
            """
                invoke-static {}, $VAULT_INIT->fill()V
            """,
        )
        // Snapshot first: removeInstruction mutates the implementation.
        val snapshot = attach.implementation!!.instructions.toList()
        val toRemove = snapshot.indices.filter { index ->
            val instruction = snapshot[index]
            if (instruction !is ReferenceInstruction) return@filter false
            val reference = instruction.reference as? MethodReference ?: return@filter false
            reference.definingClass.startsWith("Lcom/pairip/") &&
                reference.name in setOf("setContext", "verifyIntegrity")
        }
        if (toRemove.none { snapshot[it].let { ins ->
                (ins as ReferenceInstruction).reference.let { ref ->
                    ref is MethodReference && ref.name == "verifyIntegrity"
                }
            } }
        ) {
            throw PatchException("SignatureCheck.verifyIntegrity call not found in attachBaseContext")
        }
        // Remove from the end so earlier indices stay valid.
        toRemove.sortedDescending().forEach { attach.removeInstruction(it) }

        // 3. License provider: report success without doing anything.
        LicenseProviderOnCreateFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )
    }
}
