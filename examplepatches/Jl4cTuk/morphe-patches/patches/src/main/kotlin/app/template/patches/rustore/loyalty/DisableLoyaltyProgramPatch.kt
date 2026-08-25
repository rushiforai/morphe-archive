package app.template.patches.rustore.loyalty

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val DISABLED_LOYALTY_FLAG_KEY =
    "featureLoyaltyDisabledByPatch"

context(_: BytecodePatchContext)
internal fun disableLoyaltyProgram() {
    LoyaltyFeatureRegistryFingerprint
        .matchAll(1..1)
        .single()
        .method
        .replaceSingleString(
            oldValue = LOYALTY_FLAG_KEY,
            newValue = DISABLED_LOYALTY_FLAG_KEY,
            description = "loyalty feature registry key",
        )
    SdkPayLoyaltyConfigFingerprint
        .matchAll(1..1)
        .single()
        .method
        .replaceSingleString(
            oldValue = LOYALTY_FLAG_KEY,
            newValue = DISABLED_LOYALTY_FLAG_KEY,
            description = "RuStore Pay SDK loyalty key",
        )

    LoyaltyCashbackBannerRepositoryGetFingerprint
        .matchAll(1..1)
        .single()
        .method
        .addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """,
        )
}

private fun MutableMethod.replaceSingleString(
    oldValue: String,
    newValue: String,
    description: String,
) {
    val stringConstants = implementation!!.instructions.withIndex().filter { (_, instruction) ->
        val string =
            (instruction as? ReferenceInstruction)?.reference as? StringReference
        instruction.opcode in setOf(Opcode.CONST_STRING, Opcode.CONST_STRING_JUMBO) &&
            string?.string == oldValue
    }
    require(stringConstants.size == 1) {
        "Expected one $description, found ${stringConstants.size}"
    }

    val (stringIndex, stringInstruction) = stringConstants.single()
    val stringRegister =
        (stringInstruction as? OneRegisterInstruction)?.registerA
    require(stringRegister != null) {
        "$description instruction has an unexpected format"
    }
    val smaliOpcode =
        if (stringInstruction.opcode == Opcode.CONST_STRING_JUMBO) {
            "const-string/jumbo"
        } else {
            "const-string"
        }
    replaceInstruction(
        stringIndex,
        "$smaliOpcode v$stringRegister, \"$newValue\"",
    )
}
