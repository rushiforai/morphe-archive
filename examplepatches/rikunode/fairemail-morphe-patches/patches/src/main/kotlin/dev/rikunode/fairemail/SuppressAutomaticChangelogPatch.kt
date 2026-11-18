package dev.rikunode.fairemail

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * Suppress only the automatically opened CHANGELOG.md dialog at inbox startup.
 *
 * FairEmail 1.2338 ActivityView.checkFirst() reads the "show_changelog"
 * SharedPreferences key and uses the result to enter the changelog branch.
 * Replace *only that read's result* with false. Keep the first-run dialog,
 * manually available changelog content, preferences, all other dialogs,
 * and their method bodies unchanged.
 *
 * Verified against the original GitHub v1.2338a APK classes.dex:
 * ActivityView.checkFirst()V, code_item @ 0x4db4ec,
 * const-string "show_changelog" @ code unit 11,
 * invoke-interface SharedPreferences.getBoolean @ code unit 13,
 * move-result v2 @ code unit 16.
 */
@Suppress("unused")
val suppressAutomaticChangelogPatch = bytecodePatch(
    name = "Suppress automatic changelog popup",
    description = "Prevent the startup changelog pop-up without deleting the changelog or changing the first-run welcome dialog.",
    default = true,
) {
    compatibleWith(
        Compatibility(
            name = "FairEmail",
            packageName = "eu.faircode.email",
            apkFileType = ApkFileType.APK,
            appIconColor = 0x157B9B,
            targets = listOf(AppTarget(version = "1.2338", versionCode = 2338)),
        )
    )

    execute {
        val owner = "Leu/faircode/email/ActivityView;"
        val candidates = classDefBy(owner).methods.filter {
            it.name == "checkFirst" &&
                it.parameterTypes.isEmpty() &&
                it.returnType == "V"
        }.toList()
        require(candidates.size == 1) {
            "Unsupported FairEmail: ActivityView.checkFirst() is missing or ambiguous"
        }
        val instructions = requireNotNull(candidates.single().implementation) {
            "Unsupported FairEmail: checkFirst() has no bytecode"
        }.instructions.toList()

        val keyLocations = instructions.indices.filter { index ->
            val instruction = instructions[index]
            (instruction.opcode == Opcode.CONST_STRING ||
                instruction.opcode == Opcode.CONST_STRING_JUMBO) &&
                ((instruction as? ReferenceInstruction)?.reference as? StringReference)
                    ?.string == "show_changelog"
        }
        require(keyLocations.size == 1) {
            "Unsupported FairEmail: expected exactly one changelog preference key"
        }

        val keyIndex = keyLocations.single()
        require(keyIndex + 2 < instructions.size) {
            "Unsupported FairEmail: incomplete changelog preference read"
        }
        val keyInstruction = instructions[keyIndex] as? OneRegisterInstruction
            ?: error("Unsupported FairEmail: changelog key register unavailable")
        val invoke = instructions[keyIndex + 1]
        val reference = (invoke as? ReferenceInstruction)?.reference as? MethodReference
        require(invoke.opcode == Opcode.INVOKE_INTERFACE &&
            reference?.definingClass == "Landroid/content/SharedPreferences;" &&
            reference.name == "getBoolean" &&
            reference.parameterTypes.map(CharSequence::toString) ==
                listOf("Ljava/lang/String;", "Z") &&
            reference.returnType == "Z"
        ) { "Unsupported FairEmail: expected adjacent SharedPreferences.getBoolean" }

        val registerArguments = invoke as? FiveRegisterInstruction
            ?: error("Unsupported FairEmail: unexpected getBoolean instruction format")
        require(registerArguments.registerCount == 3 &&
            registerArguments.registerD == keyInstruction.registerA
        ) { "Unsupported FairEmail: getBoolean is not reading the changelog key" }

        val result = instructions[keyIndex + 2]
        require(result.opcode == Opcode.MOVE_RESULT) {
            "Unsupported FairEmail: preference boolean result has changed"
        }
        val resultRegister = (result as? OneRegisterInstruction)?.registerA
            ?: error("Unsupported FairEmail: changelog boolean result has no register")
        require(resultRegister in 0..15) {
            "Unsupported FairEmail: changelog boolean register does not fit const/4"
        }

        val method = mutableClassDefBy(owner).methods.single {
            it.name == "checkFirst" &&
                it.parameterTypes.isEmpty() &&
                it.returnType == "V"
        }
        // MOVE_RESULT and CONST/4 each occupy one 16-bit DEX code unit.
        // No branch destinations, method references or preferences are altered.
        method.replaceInstruction(keyIndex + 2, "const/4 v${resultRegister}, 0x0")
    }
}
