package mightymich.morphe.patches.com.clover.daysmatter

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Pro Features",
    description = "Unlocks Days Matter Pro by forcing the pro flag to true.",
    default = true
) {
    compatibleWith(DaysMatterCompatibility.DAYS_MATTER)


    val isProFingerprint = Fingerprint(
        definingClass = "Lcom/clover/daysmatter/models/MessagePro;",
        name = "isPro",
        returnType = "Z"
    )

    execute {
        isProFingerprint.let { fingerprint ->
            val method = fingerprint.method
            method.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """
            )
        }
    }
}
