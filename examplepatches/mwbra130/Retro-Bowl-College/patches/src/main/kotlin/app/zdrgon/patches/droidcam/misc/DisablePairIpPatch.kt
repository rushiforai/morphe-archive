package app.zdrgon.patches.droidcam.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.zdrgon.patches.droidcam.shared.Constants.COMPATIBILITY_DROIDCAM
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import java.util.function.Supplier

// Extension helper that replaces the PairIP VM startup program: it fills
// the app's string vaults and Method handles with the constants harvested
// from the original app. Must match the class in the extensions module.
private const val VAULT_INIT =
    "Lapp/template/extension/droidcam/VaultInit;"

// Extension helper carrying the stock signing-certificate data (bytes
// and hashCode) harvested from the original app. Must match the class
// in the extensions module.
private const val SIG_SPOOF =
    "Lapp/template/extension/droidcam/SigSpoof;"

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
 * 4. LicenseClient.checkLicense is emptied. DroidCam 10.0's
 *    Application calls it directly from attachBaseContext — a second
 *    trigger 9.0 did not have (found in the step-8 emulator test:
 *    the Play license dialog appeared and exiting it closed the app).
 * 5. Camera streaming fix (formerly the separate "Fix camera
 *    streaming" patch): DroidcamService's Load hand-off is given the
 *    stock signing-certificate data, because the server derives the
 *    expected video-client nonce from the certificate hashCode
 *    (hashCode & 6138; stock = 5912, which the official PC client
 *    sends). A re-signed build would pass its debug certificate, the
 *    server would close every video request, and the preview would
 *    stay black.
 *
 * The runtime files this patch needs (the runtime-only lifecycle
 * classes the handles point to, and the two VM-encrypted native
 * libraries swapped for decrypted builds) are installed by an INLINE
 * resourcePatch inside dependsOn() below — never a top-level field,
 * so PatchLoader never lists it separately and the Manager shows
 * exactly one entry for the whole bypass. Same "one entry" pattern
 * as the IDM "Remove ads" and Crossy Road "Free store" patches.
 *
 * All edits verified live on DroidCam 9.0 (vc76) before being written
 * as patches (experiments #3-#10, 2026-11-04), and the set was
 * re-verified end to end on DroidCam 10.0 (vc83) in 2026-11-08's
 * emulator test.
 */
@Suppress("unused")
val disablePairIpPatch = bytecodePatch(
    name = "Disable PairIP protection",
    description = "Lets the patched app run: replaces PairIP's VM startup with harvested " +
        "vault/handle data, removes the signature check and license dialog, installs " +
        "the decrypted native libraries and runtime classes, and fixes camera " +
        "streaming. DroidCam 10.0 only.",
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
    //
    // The resource patch is defined INLINE inside dependsOn() so
    // PatchLoader never discovers it as a separate top-level entry
    // (see the KDoc above). Its execute body is the former standalone
    // "Disable PairIP protection (runtime files)" patch, unchanged:
    // it registers the runtime-dex supplier before this patch's
    // extendWithAll provider is evaluated, and swaps the libraries.
    dependsOn(
        resourcePatch(
            name = "Disable PairIP protection (runtime files)",
            description = "Swaps the VM-encrypted native libraries (libmjpg, libmdns) for " +
                "decrypted builds that 'Disable PairIP protection' needs. " +
                "Enable both together. DroidCam 10.0 only.",
            default = true,
        ) {
            compatibleWith(COMPATIBILITY_DROIDCAM)

            execute {
                // Expose the runtime-only lifecycle classes dex to
                // 'Disable PairIP protection' (it dependsOn this patch,
                // so this runs before its extendWithAll provider is
                // evaluated).
                if (droidcamRuntimeDex.isEmpty()) {
                    droidcamRuntimeDex += Supplier {
                        PairIpRuntimeFilesPatchAnchor::class.java
                            .getResourceAsStream("/droidcam/classes4.dex")
                            ?: throw PatchException(
                                "Patch payload missing from the patch bundle: /droidcam/classes4.dex"
                            )
                    }
                }

                // Decrypted libraries for every ABI the merged APK carries.
                val libRoot = get("lib")
                val abiDirs = libRoot.listFiles()?.filter { it.isDirectory } ?: emptyList()
                if (abiDirs.isEmpty()) throw PatchException("No lib/<abi> directory in the merged APK")
                var replacedAny = false
                for (abiDir in abiDirs) {
                    val abi = abiDir.name
                    for (lib in listOf("libmjpg.so", "libmdns.so")) {
                        val target = get("lib/$abi/$lib")
                        if (!target.exists()) continue
                        val stream = PairIpRuntimeFilesPatchAnchor::class.java
                            .getResourceAsStream("/droidcam/$abi/$lib")
                        if (stream != null) {
                            target.writeBytes(stream.readBytes())
                            replacedAny = true
                        } else {
                            // No payload for this ABI: the encrypted build can
                            // never run without the PairIP VM, so drop it. The
                            // app remains functional on payload ABIs.
                            target.delete()
                        }
                    }
                }
                if (!replacedAny) {
                    throw PatchException("No ABI in the merged APK matched a decrypted-library payload")
                }
            }
        },
    )
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

        // 4. License check entry point: empty it, so the direct call
        //    from Application.attachBaseContext does nothing.
        LicenseCheckFingerprint.method.addInstructions(
            0,
            """
                return-void
            """,
        )

        // 5. Camera streaming: overwrite the two Load hand-off
        //    parameters (p1 = certificate bytes, p2 = hashCode) with
        //    the stock values before the original body can use them.
        ServiceLoadFingerprint.method.addInstructions(
            0,
            """
                invoke-static {}, $SIG_SPOOF->cert()[B
                move-result-object p1
                invoke-static {}, $SIG_SPOOF->hash()I
                move-result p2
            """,
        )
    }
}
