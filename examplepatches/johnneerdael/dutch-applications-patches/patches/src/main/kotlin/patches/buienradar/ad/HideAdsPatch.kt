package patches.buienradar.ad

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.newInstance
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import patches.buienradar.shared.Constants.COMPATIBILITY_BUIENRADAR

@Suppress("unused")
val hideAdsPatch = bytecodePatch(
    name = "Hide ads",
    description = "Removes the banner/native ads between the weather cards and the pre-roll ads in weather videos, and does not start the Google Mobile Ads SDK.",
) {
    compatibleWith(COMPATIBILITY_BUIENRADAR)

    execute {

        // region Banner / native ads in the main feed

        // Force the "isAdFree" parameter to true, exactly like the app does for premium users.
        // The method then returns an empty list and no ad slots are added or loaded.
        AdItemsFingerprint.method.addInstruction(
            0,
            "const/16 p1, 0x1"
        )

        // endregion

        // region Pre-roll ads in videos

        val adFreeClass = VideoAdFreeToStringFingerprint.originalClassDef
        val adFreeType = adFreeClass.type
        val adFreeInstanceField = adFreeClass.staticFields.first { it.type == adFreeType }
        val showAdsType = VideoShowAdsToStringFingerprint.originalClassDef.type

        // Method that decides: if (isAdFree) AdFree else ShowAds(allowPersonalizedAds).
        // Right after ShowAds is constructed, overwrite the register with the AdFree instance.
        Fingerprint(
            filters = listOf(
                fieldAccess(
                    definingClass = adFreeType,
                    type = adFreeType,
                    opcode = Opcode.SGET_OBJECT
                ),
                newInstance(showAdsType),
                methodCall(
                    definingClass = showAdsType,
                    name = "<init>",
                    opcode = Opcode.INVOKE_DIRECT
                )
            )
        ).let { fingerprint ->
            fingerprint.method.apply {
                val index = fingerprint.instructionMatches.last().index
                val register = getInstruction<FiveRegisterInstruction>(index).registerC

                addInstruction(
                    index + 1,
                    "sget-object v$register, $adFreeType->${adFreeInstanceField.name}:$adFreeType"
                )
            }
        }

        // endregion

        // region Google Mobile Ads startup

        // App.onCreate launches a coroutine whose only job is MobileAds initialization
        // (application ID, request configuration, WebView warm-up). No ads are requested
        // after the changes above, so skip the launch instead of starting the SDK.
        val initializerType = AdsInitializerFingerprint.originalClassDef.type
        AppOnCreateFingerprint.method.apply {
            val created = instructions.withIndex().filter { (_, instruction) ->
                instruction.opcode == Opcode.NEW_INSTANCE &&
                    ((instruction as ReferenceInstruction).reference as TypeReference).type == initializerType
            }
            check(created.size == 1) { "Expected one ads initializer launch, found ${created.size}" }
            val (createIndex, createInstruction) = created.single()
            val register = (createInstruction as OneRegisterInstruction).registerA
            val launchIndex = instructions.withIndex().drop(createIndex + 1).first { (_, instruction) ->
                instruction.opcode == Opcode.INVOKE_STATIC && instruction is FiveRegisterInstruction &&
                    register in listOf(instruction.registerC, instruction.registerD, instruction.registerE,
                        instruction.registerF, instruction.registerG).take(instruction.registerCount)
            }.index
            check(instructions[launchIndex + 1].opcode != Opcode.MOVE_RESULT_OBJECT) { "Unexpected launch result use" }
            replaceInstruction(launchIndex, "nop")
        }

        // endregion
    }
}
