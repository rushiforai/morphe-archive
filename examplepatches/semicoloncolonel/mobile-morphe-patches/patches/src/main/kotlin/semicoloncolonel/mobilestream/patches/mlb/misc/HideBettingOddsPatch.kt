package semicoloncolonel.mobilestream.patches.mlb.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import semicoloncolonel.mobilestream.patches.mlb.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.phoneOnly

// ─────────────────────────────────────────────────────────────────────────────
// MLB — Hide betting odds (phone only).
//
// The scores web module is configured with a data class (fields jsAPIVersion,
// displayMode, os, version, and bettingOddsEnabled) built in the WebView
// fragments and handed to the page, which draws the odds section when
// bettingOddsEnabled is true. The field name is semantic and stable; its holder
// class is renamed per build, so it is found by the field name.
//
// The value is forced to false in the one class that declares the field, where
// its constructor stores it, so every reader sees false consistently and the
// web module hides the section. Only that class is made mutable.
//
// An earlier version rewrote every read of the field instead. To find the
// reads it walked every class in the app and called mutableClassDefBy on each,
// which materializes a mutable copy of the whole app. On the NVIDIA Shield's
// CPU that patch-time cost overwhelmed Morphe Manager and the patch crashed
// before it finished.
//
// Phone only. The Android TV build draws its odds through a different, native
// path (an odds-provider banner, not this web config, whose class is dead code
// there), so this patch is excluded from the TV flavor in build.gradle.kts.
// ─────────────────────────────────────────────────────────────────────────────

@Suppress("unused")
val hideBettingOddsPatch = bytecodePatch(
    name = "Hide betting odds",
    description = "Removes the betting-odds section from the scores sheet.",
    default = false,
) {
    category("Interface")
    compatibleWith(Constants.COMPATIBILITY.phoneOnly())

    execute {
        var patched = 0
        val owners = mutableListOf<String>()
        classDefForEach { classDef ->
            if (classDef.fields.any { it.name == "bettingOddsEnabled" && it.type == "Z" }) {
                owners += classDef.type
            }
        }

        owners.forEach { owner ->
            mutableClassDefBy(owner).methods.forEach { method ->
                if (method.name != "<init>") return@forEach
                val instructions = method.implementation?.instructions?.toList() ?: return@forEach
                instructions.indices.reversed().forEach { index ->
                    val instruction = instructions[index]
                    if (instruction.opcode != Opcode.IPUT_BOOLEAN) return@forEach
                    val reference = (instruction as ReferenceInstruction).reference as FieldReference
                    if (reference.definingClass != owner || reference.name != "bettingOddsEnabled") return@forEach
                    // Force the stored value to false. The source register holds a
                    // constructor parameter used only for this store, so reusing it
                    // is safe.
                    val source = (instruction as TwoRegisterInstruction).registerA
                    method.addInstructions(index, "const/4 v$source, 0x0")
                    patched++
                }
            }
        }

        if (patched == 0) throw PatchException("No bettingOddsEnabled constructor write found")
    }
}
