package app.custom.patches.sensu

import app.custom.patches.shared.playStoreInstallerSourcePatch
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21s
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import java.util.logging.Logger

private data class GuardSite(val method: MutableMethod, val index: Int, val register: Int)

private fun checkLayout(condition: Boolean, message: String) {
    if (!condition) throw PatchException("Unsupported Sensu bytecode: $message")
}

@Suppress("unused")
val sensuProPatch = bytecodePatch(
    name = "Sensu Pro",
    description = "Unlock Sensu Pro and all themes, including overlay features and the installer-source fix.",
    default = true,
) {
    compatibleWith(
        Compatibility(packageName = "com.piyush.pie", name = "Sensu", apkFileType = ApkFileType.APK),
    )
    dependsOn(playStoreInstallerSourcePatch)

    execute {
        if (packageMetadata.packageName != "com.piyush.pie") {
            throw PatchException("Sensu Pro requires Sensu (com.piyush.pie).")
        }

        ProductCatalogFingerprint.matchAll(1..1)
        ProductStateGetterFingerprint.matchAll(1..1)
        val refreshMatch = ProductStateRefreshFingerprint.matchAll(1..1).single()
        val guardMatches = FeatureGuardsFingerprint.matchAll()

        val refresh = refreshMatch.method
        val catalogRead = refreshMatch.instructionMatches[0]
        val catalogRegister = catalogRead.getInstruction<OneRegisterInstruction>().registerA
        val setInit = refreshMatch.instructionMatches[1]
        val initCall = setInit.getInstruction<FiveRegisterInstruction>()
        val setRegister = initCall.registerC
        val allocation = refresh.implementation!!.instructions[setInit.index - 1]
        checkLayout(
            setInit.index == catalogRead.index + 2 && initCall.registerCount == 1 &&
                allocation.opcode == Opcode.NEW_INSTANCE &&
                (allocation as OneRegisterInstruction).registerA == setRegister &&
                (allocation as ReferenceInstruction).reference.toString() == "Ljava/util/HashSet;" &&
                setRegister != catalogRegister && setRegister <= 15 && catalogRegister <= 15,
            "The observable purchase refresh no longer constructs a set beside its product catalog.",
        )

        val guardSites = guardMatches.flatMap { match ->
            val method = match.method
            val code = method.implementation!!.instructions
            val sites = mutableListOf<GuardSite>()
            for (index in 0 until code.size - 2) {
                if (code[index].opcode != Opcode.NEG_INT ||
                    code[index + 1].opcode != Opcode.OR_INT_2ADDR ||
                    code[index + 2].opcode != Opcode.USHR_INT_LIT8
                ) continue

                val negation = code[index] as TwoRegisterInstruction
                val combine = code[index + 1] as TwoRegisterInstruction
                val shift = code[index + 2] as TwoRegisterInstruction
                checkLayout(
                    negation.registerA != negation.registerB &&
                        ((combine.registerA == negation.registerA && combine.registerB == negation.registerB) ||
                            (combine.registerA == negation.registerB && combine.registerB == negation.registerA)) &&
                        shift.registerA == combine.registerA && shift.registerB == combine.registerA &&
                        (shift as NarrowLiteralInstruction).narrowLiteral == 31,
                    "Unexpected feature-mask register flow in $method.",
                )
                sites += GuardSite(method, index + 2, shift.registerA)
            }
            checkLayout(sites.isNotEmpty(), "No local feature gates in $method.")
            sites
        }

        // Seed each refresh with the full catalog (Pro, all themes, and individual
        // themes). The original equality check, StateFlow update, and listeners
        // still run, including the constructor's initial refresh and billing updates.
        refresh.replaceInstruction(
            setInit.index,
            "invoke-direct {v$setRegister, v$catalogRegister}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V",
        )

        // ((status | -status) >>> 31) is 0 on success. The original subtraction
        // then produces the full feature mask. Replacing the shift preserves
        // instruction widths and branch targets for both register-flow variants.
        guardSites.forEach { site ->
            site.method.replaceInstruction(
                site.index,
                BuilderInstruction21s(Opcode.CONST_16, site.register, 0),
            )
        }

        Logger.getLogger("Saiyan007").info(
            "Updated Sensu's observable product set and ${guardSites.size} gates in ${guardMatches.size} feature methods.",
        )
    }
}
