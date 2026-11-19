package app.danielthemaniel.patches.pokegenie

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import java.util.zip.GZIPInputStream

// =====================================================================================
// PairIP bypass (+ OCR scanning) — the whole PairIP story for Poke Genie in one patch.
//
// Replaces the three separate patches (Strip PairIP, Neutralize PairIP VM, Replace OCR
// libs). They were always enabled together and depended on each other, so they're fused
// into one toggle. Three things happen, in two phases:
//
//   BYTECODE (unnamed sub-patch `pairipBytecodeBypass`, pulled in as a dependency):
//     1. StartupLauncher.launch() -> PairipRestore.init(); return-void.
//        Skips the startup VM program (qagcFtcxoOWSvKMs) that does the integrity check,
//        the Play-Store paywall, AND the string-table population. We repopulate the 1,471
//        string + 18 method fields ourselves from baked-in values (Frida dump; see
//        pairip-extraction memory). pairip_startup.dex supplies the $c-style hook classes
//        the 18 method fields point to; extensions/pokegenie.dex is PairipRestore.
//     2. Nuke the Java license/signature checks (SignatureCheck, LicenseClient,
//        LicenseActivity, LicenseResponseHelper, TrialClient) with in-place return stubs.
//     3. VMRunner.invoke(String, Object[]) -> return null, WITHOUT calling native
//        executeVM. The native VM therefore never runs: no per-call DEX-constant-pool
//        integrity check (so our added refs + microG string rewrites are tolerated) and
//        no anti-tamper SIGSEGV. Every virtualized method (overlay receivers, battle
//        simulator, …) becomes a no-op returning null — the overlay's fire-and-forget
//        receivers don't care; battle simulator is sacrificed (acceptable).
//
//   RESOURCE (this named patch):
//     4. Swap libleptonica.so / libtesseract.so (and libjpeg.so when bundled) for
//        de-PairIP'd standalone builds — decrypted .text + reconstructed import GOTs — so
//        the OCR engine runs with the VM dead. Without this, the original PairIP-stripped
//        OCR libs would load with empty GOTs + encrypted .text and SIGSEGV in their
//        constructor the moment you scan. The rebuilt libs keep DT_NEEDED libpairipcore.so
//        + one ExecuteProgram UND, satisfied by the real libpairipcore left in the APK
//        (never entered). Rebuild spec: project doc pokegenie-ocr-devirt-handoff.md.
//
// Requires a universal/merged arm64-v8a APK (native libs in lib/arm64-v8a/). default=true:
// the strip half is essential for the app to launch at all, so this stays on. Cost: the
// rebuilt OCR libs (~8.5 MB) are always written into the APK. Set default=false (or split
// the resource half back out) if you want a lean non-scanning build.
// =====================================================================================

private const val STARTUP_LAUNCHER = "Lcom/pairip/StartupLauncher;"
private const val SIGNATURE_CHECK  = "Lcom/pairip/SignatureCheck;"
private const val LICENSE_CLIENT   = "Lcom/pairip/licensecheck/LicenseClient;"
private const val LICENSE_ACTIVITY = "Lcom/pairip/licensecheck/LicenseActivity;"
private const val LICENSE_HELPER   = "Lcom/pairip/licensecheck/LicenseResponseHelper;"
private const val TRIAL_CLIENT     = "Lcom/pairip/licensecheck/TrialClient;"
private const val VM_RUNNER        = "Lcom/pairip/VMRunner;"
private const val RESTORE =
    "Lapp/danielthemaniel/patches/pokegenie/extension/PairipRestore;"

private const val APK_LIBS = "lib/arm64-v8a/"

// Classloader anchor for reading bundled resources (the repo's pattern —
// app.morphe.util.inputStreamFromBundledResource does not exist in this patcher version).
private object OcrLibAssetMarker

// APK lib name -> bundled gzip resource under resources/pokegenie/.
// A lib whose .gz isn't bundled yet is skipped (see execute{}), so entries can be listed
// before their rebuild lands. libjpeg.so is also PairIP-virtualized and is NEEDED by both
// OCR libs; add libjpeg.so.gz (rebuilt append-only) to activate it.
private val OCR_LIBS = mapOf(
    "libleptonica.so" to "libleptonica.so.gz",
    "libtesseract.so" to "libtesseract.so.gz",
    "libjpeg.so" to "libjpeg.so.gz",
)

// ---- BYTECODE half (unnamed; pulled in by the named patch below) -------------------
private val pairipBytecodeBypass = bytecodePatch {
    compatibleWith(COMPATIBILITY_POKEGENIE)

    // $c hook classes for the 18 method fields + the table-restore extension. Both land in
    // their own DEX files, so classes.dex method/field layout is untouched.
    extendWith("pokegenie/pairip_startup.dex")
    extendWith("extensions/pokegenie.dex")

    execute {
        // 1. Redirect StartupLauncher.launch() to our restore (skip the startup program).
        mutableClassDefBy(STARTUP_LAUNCHER).methods
            .first { it.name == "launch" }
            .addInstructions(
                0,
                """
                invoke-static { }, $RESTORE->init()V
                return-void
                """.trimIndent()
            )

        // 2. Neutralize the Java-side license/signature checks. In-place return stubs only —
        //    no new constant-pool entries.
        val classesToNuke = listOf(
            SIGNATURE_CHECK, LICENSE_CLIENT, LICENSE_ACTIVITY, LICENSE_HELPER, TRIAL_CLIENT,
        )
        for (className in classesToNuke) {
            runCatching {
                val classDef = mutableClassDefBy(className)
                for (method in classDef.methods) {
                    if (method.name == "<init>" || method.name == "<clinit>") continue
                    when (method.returnType) {
                        "V" -> method.addInstructions(0, "return-void")
                        "Z", "B", "S", "C", "I" -> method.addInstructions(0, """
                            const/4 v0, 0x0
                            return v0
                        """.trimIndent())
                        "J" -> method.addInstructions(0, """
                            const-wide/16 v0, 0x0
                            return-wide v0
                        """.trimIndent())
                        else -> if (method.returnType.startsWith("L") || method.returnType.startsWith("[")) {
                            method.addInstructions(0, """
                                const/4 v0, 0x0
                                return-object v0
                            """.trimIndent())
                        }
                    }
                }
            }
        }

        // 3. Stop the native VM: VMRunner.invoke -> return null before calling executeVM.
        mutableClassDefBy(VM_RUNNER).methods
            .first { it.name == "invoke" }
            .addInstructions(
                0,
                """
                const/4 v0, 0x0
                return-object v0
                """.trimIndent(),
            )
    }
}

// ---- RESOURCE half (the single visible toggle) -------------------------------------
@Suppress("unused")
val pairipBypassPatch = rawResourcePatch(
    name = "PairIP bypass (+ OCR scanning)",
    description = "Neutralizes PairIP for Poke Genie end to end: skips the startup program " +
        "(integrity check + Play-Store paywall) and restores its tables, nukes the Java " +
        "license/signature checks, stops the native VM (so virtualized methods no-op and " +
        "nothing re-checks the DEX), and swaps in de-PairIP'd OCR libs so iVision scanning " +
        "works. Requires a universal arm64-v8a APK. Battle simulator is sacrificed.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_POKEGENIE)
    dependsOn(pairipBytecodeBypass)

    execute {
        for ((libName, resName) in OCR_LIBS) {
            // Skip libs whose rebuilt resource isn't bundled yet instead of failing the build.
            val source = OcrLibAssetMarker::class.java
                .getResourceAsStream("/pokegenie/$resName")
                ?: continue
            val target = get(APK_LIBS + libName, copy = false)
            GZIPInputStream(source).use { input ->
                target.outputStream().use(input::copyTo)
            }
        }
    }
}
