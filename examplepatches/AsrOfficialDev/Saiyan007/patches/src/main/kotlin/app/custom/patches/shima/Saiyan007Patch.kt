package app.custom.patches.shima

import app.custom.patches.shared.playStoreInstallerSourcePatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21s
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import java.util.logging.Logger

private val shimaCompatibility = Compatibility(
    packageName = "com.piyush.island",
    name = "Shima",
    apkFileType = ApkFileType.XAPK,
)

private data class GuardSite(val method: MutableMethod, val index: Int, val register: Int)

private fun checkLayout(condition: Boolean, message: String) {
    if (!condition) throw PatchException("Unsupported Shima bytecode: $message")
}

@Suppress("unused")
val saiyan007Patch = bytecodePatch(
    name = "Saiyan007",
    description = "Unlock Shima Pro features and report Google Play as the installer source.",
    default = true,
) {
    compatibleWith(shimaCompatibility)
    dependsOn(playStoreInstallerSourcePatch)

    execute {
        if (packageMetadata.packageName != "com.piyush.island") {
            throw PatchException("Saiyan007 requires Shima (com.piyush.island).")
        }

        // Resolve every site and validate its data flow before modifying anything.
        val constructorMatch = ProStateConstructorFingerprint.matchAll(1..1).single()
        val updateMatch = ProStateUpdateFingerprint.matchAll(1..1).single()
        val guardMatches = FeatureGuardFingerprint.matchAll()

        val constructor = constructorMatch.method
        val initialValue = constructorMatch.instructionMatches[0]
        val initialRegister = initialValue.getInstruction<OneRegisterInstruction>().registerA
        val initialWrite = constructorMatch.instructionMatches[1]
        val stateField = initialWrite.fieldReference
        checkLayout(
            initialWrite.getInstruction<TwoRegisterInstruction>().registerA == initialRegister &&
                stateField.definingClass == constructor.definingClass && stateField.type == "I" &&
                constructorMatch.originalClassDef.fields.any {
                    it.name == stateField.name && it.type == "I" && AccessFlags.VOLATILE.isSet(it.accessFlags)
                },
            "Pro initialization no longer writes the expected volatile state field.",
        )

        val update = updateMatch.method
        val updateWrite = updateMatch.instructionMatches.single()
        val argumentRegister = update.implementation!!.registerCount - 1
        checkLayout(
            updateWrite.index == 0 && updateWrite.fieldReference == stateField &&
                updateWrite.getInstruction<TwoRegisterInstruction>().registerA == argumentRegister,
            "Pro refresh no longer starts by storing its state argument.",
        )

        val guardSites = guardMatches.map { match ->
            val method = match.method
            val code = method.implementation!!.instructions
            val negationIndex = match.instructionMatches[0].index
            checkLayout(negationIndex > 0, "Missing combined feature status in $method.")
            val merge = code[negationIndex - 1]
            checkLayout(
                merge.opcode == Opcode.OR_INT || merge.opcode == Opcode.OR_INT_2ADDR,
                "Unexpected feature-status merge in $method.",
            )
            val register = (merge as OneRegisterInstruction).registerA
            val negation = code[negationIndex] as TwoRegisterInstruction
            val combine = code[negationIndex + 1] as TwoRegisterInstruction
            val shift = code[negationIndex + 2] as TwoRegisterInstruction
            checkLayout(
                negation.registerB == register && combine.registerA == register &&
                    combine.registerB == negation.registerA && shift.registerA == register &&
                    shift.registerB == register &&
                    (shift as NarrowLiteralInstruction).narrowLiteral == 31,
                "Unexpected feature-mask register flow in $method.",
            )
            GuardSite(method, negationIndex - 1, register)
        }

        // Start the observable Pro state as enabled, even with empty preferences.
        constructor.replaceInstruction(
            initialValue.index,
            BuilderInstruction21s(Opcode.CONST_16, initialRegister, 0),
        )

        // Keep both the volatile mask and its StateFlow consistent on billing
        // refreshes. Preserve the app's normal listener-notification logic.
        update.addInstruction(0, BuilderInstruction21s(Opcode.CONST_16, argumentRegister, 0))

        // Zero is success; the original ((status | -status) >>> 31) - 1 then
        // produces the full feature mask. Replace the join-point instruction
        // rather than inserting before it, so incoming branches cannot skip it.
        guardSites.forEach { site ->
            site.method.replaceInstruction(
                site.index,
                BuilderInstruction21s(Opcode.CONST_16, site.register, 0),
            )
        }

        Logger.getLogger("Saiyan007").info(
            "Updated Pro initialization, Pro refresh, and ${guardSites.size} local feature gates.",
        )
    }
}
