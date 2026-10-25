package mightymich.morphe.patches.universal

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

/**
 * Universal: prevent apps from setting FLAG_SECURE (blocks screenshots).
 *
 * Strategy: find invoke-virtual Window.setFlags / addFlags and const that
 * loads 0x2000 (FLAG_SECURE), zero the const. Also no-ops setSecure on
 * SurfaceView when present.
 */
@Suppress("unused")
val disableScreenshotRestrictionPatch = bytecodePatch(
    name = "Disable screenshot restriction",
    description = "Stops FLAG_SECURE so screenshots and screen recording work.",
    default = false
) {
    execute {
        for (classDef in classes) {
            for (method in classDef.methods) {
                val impl = method.implementation ?: continue
                val insns = impl.instructions.toList()

                for ((index, insn) in insns.withIndex()) {
                    val text = insn.toString()

                    // Zero immediate loads of FLAG_SECURE (0x2000 / 8192)
                    if (insn.opcode == Opcode.CONST_16 || insn.opcode == Opcode.CONST) {
                        if (text.contains("0x2000") || text.contains("8192")) {
                            // Only if nearby Window flag API
                            val nearby = insns.drop(index).take(8).joinToString("\n") { it.toString() }
                            if (nearby.contains("setFlags") ||
                                nearby.contains("addFlags") ||
                                nearby.contains("Landroid/view/Window;")
                            ) {
                                try {
                                    // Replace with const/4 reg, 0 — keep same destination if TwoRegister
                                    val reg = if (insn is TwoRegisterInstruction) {
                                        insn.registerA
                                    } else {
                                        // parse "const/16 vN," style from toString fallback
                                        Regex("""v(\d+)""").find(text)?.groupValues?.get(1)?.toIntOrNull() ?: 0
                                    }
                                    method.replaceInstruction(
                                        index,
                                        "const/4 v$reg, 0x0"
                                    )
                                } catch (_: Exception) {
                                }
                            }
                        }
                    }
                }
            }
        }

        // No-op SurfaceView.setSecure(true) if present
        for (classDef in classes) {
            if (classDef.type != "Landroid/view/SurfaceView;") continue
            for (method in classDef.methods) {
                if (method.name != "setSecure") continue
                if (method.implementation == null) continue
                try {
                    method.addInstructions(0, "return-void")
                } catch (_: Exception) {
                }
            }
        }
    }
}
