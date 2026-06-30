package app.patches.screenshot

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private const val EXTENSION_CLASS =
    "Lapp/patches/extension/screenshot/ScreenshotRestrictionPatch;"

@Suppress("unused")
val removeScreenshotRestrictionPatch = bytecodePatch(
    name = "Remove screenshot restriction",
    description = "Removes FLAG_SECURE from all windows so screenshots and screen recordings work in any app.",
    default = true,
) {
    extendWith("extensions/screenshot.mpe")

    execute {
        classDefForEach { classDef ->
            if (classDef.type == EXTENSION_CLASS) return@classDefForEach

            val hasCalls = classDef.methods.any { method ->
                method.implementation?.instructions?.any { instruction ->
                    instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                        (instruction as? ReferenceInstruction)?.reference?.toString()
                            ?.let { ref ->
                                ref == "Landroid/view/Window;->addFlags(I)V" ||
                                ref == "Landroid/view/Window;->setFlags(II)V"
                            } ?: false
                } ?: false
            }

            if (!hasCalls) return@classDefForEach

            mutableClassDefBy(classDef).methods
                .filter { it.implementation != null }
                .forEach { method ->
                    val toReplace = mutableListOf<Pair<Int, String>>()

                    method.implementation!!.instructions.forEachIndexed { index, instruction ->
                        if (instruction.opcode != Opcode.INVOKE_VIRTUAL) return@forEachIndexed

                        val ref = (instruction as? ReferenceInstruction)
                            ?.reference?.toString()
                            ?: return@forEachIndexed

                        val regs = instruction as FiveRegisterInstruction

                        when (ref) {
                            "Landroid/view/Window;->addFlags(I)V" -> {
                                val vWindow = regs.registerC
                                val vFlags  = regs.registerD
                                toReplace += index to
                                    "invoke-static {v$vWindow, v$vFlags}, " +
                                    "${EXTENSION_CLASS}->addFlags(Landroid/view/Window;I)V"
                            }
                            "Landroid/view/Window;->setFlags(II)V" -> {
                                val vWindow = regs.registerC
                                val vFlags  = regs.registerD
                                val vMask   = regs.registerE
                                toReplace += index to
                                    "invoke-static {v$vWindow, v$vFlags, v$vMask}, " +
                                    "${EXTENSION_CLASS}->setFlags(Landroid/view/Window;II)V"
                            }
                        }
                    }

                    toReplace.asReversed().forEach { (idx, smali) ->
                        method.replaceInstruction(idx, smali)
                    }
                }
        }
    }
}
