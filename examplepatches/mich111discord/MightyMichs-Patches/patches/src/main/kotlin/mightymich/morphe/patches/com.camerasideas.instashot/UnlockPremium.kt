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
    description = "Enables InShot Pro",
    default = true
) {
    dependsOn(patchVideoEngineKillPatch)

    compatibleWith(InShotCompatibility.INSHOT)

    execute {
        val managerClass = classDefByStrings("SubscribeProOfHw")
            .singleOrNull()
            ?: throw PatchException(
                "Pro entitlement class not found (missing pref key SubscribeProOfHw). " +
                    "InShot may have changed its preference identifiers."
            )

        val manager = mutableClassDefBy(managerClass)

        val proCheck = manager.methods.singleOrNull { method ->
            !AccessFlags.STATIC.isSet(method.accessFlags) &&
                method.returnType == "Z" &&
                method.parameterTypes.isEmpty() &&
                method.implementation?.instructions?.any { insn ->
                    val ref = (insn as? ReferenceInstruction)?.reference as? StringReference
                    ref?.string == "DebugPro"
                } == true
        } ?: throw PatchException(
            "Could not uniquely resolve the instance boolean Pro gate that reads DebugPro."
        )

        proCheck.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )
    }
}
