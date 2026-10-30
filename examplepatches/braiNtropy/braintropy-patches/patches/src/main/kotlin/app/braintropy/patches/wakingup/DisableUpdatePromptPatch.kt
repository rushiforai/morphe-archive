package app.braintropy.patches.wakingup

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.braintropy.patches.shared.Constants.COMPATIBILITY_WAKING_UP
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val SPOOFED_VERSION = "9.9.9"
private const val SPOOFED_BUILD = 999999

private val CONST_OPCODES = setOf(Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST, Opcode.CONST_HIGH16)

private fun com.android.tools.smali.dexlib2.iface.instruction.Instruction.mentionsRegister(reg: Int): Boolean = when (this) {
    is Instruction35c -> listOf(registerC, registerD, registerE, registerF, registerG)
        .take(registerCount).contains(reg)
    is RegisterRangeInstruction -> reg in startRegister until startRegister + registerCount
    is TwoRegisterInstruction -> registerA == reg || registerB == reg
    is OneRegisterInstruction -> registerA == reg
    else -> false
}

@Suppress("unused")
val disableUpdatePromptPatch = bytecodePatch(
    name = "Disable update prompt",
    description = "Suppresses the \"Update Required\" dialog shown on launch when the server " +
        "reports a newer preferred build, and spoofs the app-version/app-build request " +
        "headers so the server (which rejects outdated builds with a 404) keeps serving " +
        "the app. Does not affect the version shown in the app.",
    default = true
) {
    category("Updates")
    compatibleWith(COMPATIBILITY_WAKING_UP)

    execute {
        // RemoteSettingsModel's constructor assigns its int fields from the
        // constructor parameters in order. Field names are R8-obfuscated, so
        // resolve them from the constructor's IPUT instructions instead of
        // hardcoding them.
        val constructor = RemoteSettingsModelToStringFingerprint.classDef.methods
            .first { it.name == "<init>" }

        val intFields = constructor.implementation!!.instructions
            .asSequence()
            .filter { it.opcode == Opcode.IPUT }
            .map { (it as ReferenceInstruction).reference as FieldReference }
            .filter { it.type == "I" }
            .distinct()
            .toList()

        check(intFields.isNotEmpty()) {
            "RemoteSettingsModel constructor assigns no int fields; patch needs updating."
        }

        // Insert before the final return-void. The constructor declares no
        // locals, so v-registers alias the parameter registers (v0 IS p0);
        // a "fresh" v-register cannot be used. p1 is dead once its field is
        // assigned, so reuse it as the scratch register.
        val insertIndex = constructor.implementation!!.instructions.size - 1
        constructor.addInstructions(
            insertIndex,
            "const/4 p1, 0x0\n" + intFields.joinToString("\n") { "iput p1, p0, $it" }
        )

        // Spoof the version headers sent with every API request. The server
        // (AWS WAF) answers requests from outdated builds with a 404, which
        // breaks login entirely; suppressing the dialog alone is not enough.
        // The real version/build are inlined as constants by R8, so locate
        // them structurally: the version is the only semver-looking string
        // literal in the method, and the build is the only const feeding a
        // String.valueOf(int) call (the TimeZone header's valueOf is fed a
        // computed value, not a const).
        ApiHeadersInterceptorFingerprint.method.apply {
            val instructions = implementation!!.instructions.toList()
            var spoofed = 0

            instructions.forEachIndexed { index, instruction ->
                if (instruction.opcode == Opcode.CONST_STRING &&
                    (instruction as ReferenceInstruction).reference.toString()
                        .matches(Regex("""\d+\.\d+\.\d+(-dev)?"""))
                ) {
                    val reg = (instruction as OneRegisterInstruction).registerA
                    replaceInstruction(index, "const-string v$reg, \"$SPOOFED_VERSION\"")
                    spoofed++
                }
                if (instruction.opcode == Opcode.INVOKE_STATIC &&
                    (instruction as ReferenceInstruction).reference.toString() ==
                    "Ljava/lang/String;->valueOf(I)Ljava/lang/String;"
                ) {
                    val argReg = (instruction as Instruction35c).registerC
                    // Walk back to the nearest instruction touching the argument
                    // register. Patch only if it is a const; the TimeZone header's
                    // valueOf is fed by a div-int, which stops the scan.
                    val constIndex = (index - 1 downTo 0).firstOrNull {
                        instructions[it].mentionsRegister(argReg)
                    }?.takeIf {
                        instructions[it].opcode in CONST_OPCODES &&
                            (instructions[it] as OneRegisterInstruction).registerA == argReg
                    } ?: return@forEachIndexed
                    replaceInstruction(constIndex, "const v$argReg, $SPOOFED_BUILD")
                    spoofed++
                }
            }
            check(spoofed == 2) {
                "Expected to spoof exactly one app-version string and one app-build int, found $spoofed."
            }
        }
    }
}
