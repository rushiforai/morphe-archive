package app.danielthemaniel.patches.pokegenie

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

// -------------------------------------------------------------------------------------
// Neutralize PairIP's startup program + restore its tables from baked-in values.
//
// Poke Genie's PairIP use is deeper than string obfuscation: 20 method bodies
// (onReceive/doWork/doInBackground, incl. the battle simulator) are virtualized and run
// by the native VM via VMRunner.invoke("<program>"). So we CANNOT delete the VM — those
// methods need it. Instead we neutralize only the ONE startup program (qagcFtcxoOWSvKMs),
// which is what does the integrity check, the Play-Store paywall, AND the string-table
// population. StartupLauncher.launch() is redirected to PairipRestore.init():
//
//   * integrity check never runs  -> no anti-tamper SIGSEGV, we're free to add code
//   * paywall never launches       -> it lived in that program
//   * we repopulate the 1,471 string fields + 18 method fields ourselves (decrypted once
//     via Frida; see pairip-extraction memory)
//
// VMRunner / libpairipcore.so / the VM assets are left intact so the 20 method programs
// still execute. The VM calls back into Java by JNI name resolution, so reorganizing the
// DEX (our added classes) does not break them.
//
// pairip_startup.dex is merged because the 18 method fields point to $c2020060317-style
// hook classes that live only in the VM's embedded DEX, not in base.apk.
// -------------------------------------------------------------------------------------

private const val STARTUP_LAUNCHER = "Lcom/pairip/StartupLauncher;"
private const val SIGNATURE_CHECK  = "Lcom/pairip/SignatureCheck;"
private const val LICENSE_CLIENT   = "Lcom/pairip/licensecheck/LicenseClient;"
private const val LICENSE_ACTIVITY = "Lcom/pairip/licensecheck/LicenseActivity;"
private const val LICENSE_HELPER   = "Lcom/pairip/licensecheck/LicenseResponseHelper;"
private const val TRIAL_CLIENT     = "Lcom/pairip/licensecheck/TrialClient;"
private const val RESTORE =
    "Lapp/danielthemaniel/patches/pokegenie/extension/PairipRestore;"

@Suppress("unused")
val stripPairipPatch = bytecodePatch(
    name = "Strip PairIP",
    description = "Neutralizes PairIP's startup program (integrity check + Play-Store paywall) " +
        "and restores its obfuscation tables, while leaving the native VM intact so " +
        "virtualized methods still run. Also nukes the Java license/signature checks. " +
        "Required by every other Poke Genie patch -- keep it enabled.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_POKEGENIE)

    // $c hook classes for the 18 method fields (only in the VM's embedded DEX otherwise),
    // and our table-restore extension. Both land in their own DEX files, so classes.dex
    // method/field layout is untouched.
    extendWith("pokegenie/pairip_startup.dex")
    extendWith("extensions/pokegenie.dex")

    execute {
        // ---- 1. Redirect StartupLauncher.launch() to our restore, skipping the VM's
        //         startup program (integrity check + paywall + string population). ----
        // launch() body becomes: PairipRestore.init(); return-void. The original
        // synchronized body (VMRunner.invoke("qagcFtcxoOWSvKMs", null)) is now dead.
        mutableClassDefBy(STARTUP_LAUNCHER).methods
            .first { it.name == "launch" }
            .addInstructions(
                0,
                """
                invoke-static { }, $RESTORE->init()V
                return-void
                """.trimIndent()
            )

        // ---- 2. Neutralize the Java-side license/signature checks (called from
        //         Application.attachBaseContext). In-place return-void nukes only — no new
        //         constant-pool entries, so the still-live VM programs are unaffected. ----
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
    }
}
