/**
 * Copyright 2026 Hoo-dles
 * https://github.com/hoo-dles/morphe-patches
 */

package hoodles.morphe.patches.mimo.pro

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.all.misc.fix.spoofsignature.spoofSignaturePatch
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import hoodles.morphe.compatibility.Compat

@Suppress("unused")
val enableProPatch = bytecodePatch(
    name = "Enable Pro",
    description = "Enables app features locked behind the subscription paywall."
) {
    compatibleWith(Compat.MIMO)

    dependsOn(spoofSignaturePatch)

    execute {
        val proTierField = ProTierFingerprint.instructionMatches.last()
            .getInstruction<ReferenceInstruction>().getReference<FieldReference>()

        SubscriptionStateCtorFingerprint.method.addInstructions(0, """
            sget-object p3, $proTierField
        """.trimIndent())
    }
}