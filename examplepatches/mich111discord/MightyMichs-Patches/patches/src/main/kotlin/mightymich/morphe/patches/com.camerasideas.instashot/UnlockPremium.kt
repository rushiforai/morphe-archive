package mightymich.morphe.patches.com.camerasideas.instashot

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Enables InShot Pro entitlements offline: export without watermark, " +
        "no interstitial ads, and access to paid effects, transitions, stickers and HD. " +
        "Built-in AI features that validate the store signature in native code may still " +
        "refuse a re-signed package.",
    default = true,
) {
    compatibleWith(InShotCompatibility.INSHOT)

    execute {
        val managerClass = try {
            classDefByStrings("SubscribeProOfHw").singleOrNull()
        } catch (_: Exception) {
            null
        } ?: run {
            // Soft: do not fail the whole session if the pref key drifts
            return@execute
        }

        val manager = try {
            mutableClassDefBy(managerClass)
        } catch (_: Exception) {
            return@execute
        }

        val proCheck = manager.methods.singleOrNull { method ->
            !AccessFlags.STATIC.isSet(method.accessFlags) &&
                method.returnType == "Z" &&
                method.parameterTypes.isEmpty() &&
                method.implementation?.instructions?.any { insn ->
                    val ref = (insn as? ReferenceInstruction)?.reference as? StringReference
                    ref?.string == "DebugPro"
                } == true
        }

        if (proCheck == null) return@execute

        try {
            proCheck.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """,
            )
        } catch (_: Exception) {
        }
    }
}
