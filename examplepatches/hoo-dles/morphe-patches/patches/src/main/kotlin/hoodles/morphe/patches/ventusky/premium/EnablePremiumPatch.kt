/**
 * Copyright 2026 Hoo-dles
 * https://github.com/hoo-dles/morphe-patches
 */

package hoodles.morphe.patches.ventusky.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.getReference
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import hoodles.morphe.compatibility.Compat

val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Enables app features locked behind the subscription paywall."
) {
    compatibleWith(Compat.VENTUSKY)

    execute {
        SignatureCheckFingerprint.method.returnEarly(true)

        val premiumStaticField = PremiumCodeCtorFingerprint.instructionMatches.last()
            .getInstruction<ReferenceInstruction>()
            .getReference<FieldReference>()!!

        GetPlanStatusFingerprint.matchAll().forEach {
            it.method.addInstructions(0, """
                sget-object v0, $premiumStaticField
                return-object v0
            """.trimIndent())
        }
    }
}