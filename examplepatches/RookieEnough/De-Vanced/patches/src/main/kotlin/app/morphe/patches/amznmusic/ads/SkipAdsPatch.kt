/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/amznmusic/ads/SkipAdsPatch.kt
 */
package app.morphe.patches.amznmusic.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableField
import app.morphe.util.getReference
import app.morphe.util.registersUsed
import app.morphe.util.indexOfFirstInstructionOrThrow
import app.morphe.util.removeFlags
import app.morphe.patches.amznmusic.misc.extension.sharedExtensionPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val GET_NEXT_ENTITY_INPUT_CLASS = "Lcom/amazon/digitalmusicxp/inputs/GetNextEntityInput;"
private const val AMPLIFY_CLIENT_CLASS = "Lcom/amazon/mp3/amplifyqueue/AmplifyClient;"
private const val OUTCOME_CLASS = "Lcom/amazon/digitalmusicxp/callbacks/Outcome;"

internal object AmplifyClientGetNextTracksFingerprint : Fingerprint(
    definingClass = AMPLIFY_CLIENT_CLASS,
    name = "getNextTracks",
    returnType = OUTCOME_CLASS,
    custom = { method, _ -> method.name == "getNextTracks" },
)

@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = "Skip ads",
    description = "Skip ads between the tracks.",
) {
    compatibleWith(AppCompatibilities.AMAZON_MUSIC)

    dependsOn(sharedExtensionPatch)

    execute {
        // Make GetNextEntityInput.currentEntityReferenceId public so extension can set it.
        val mutableInput = mutableClassDefBy(GET_NEXT_ENTITY_INPUT_CLASS)
        val field = mutableInput.fields.first { it.name == "currentEntityReferenceId" } as MutableField
        field.removeFlags(AccessFlags.PRIVATE, AccessFlags.PROTECTED)
        field.accessFlags = field.accessFlags or AccessFlags.PUBLIC.value

        AmplifyClientGetNextTracksFingerprint.method.apply {
            val getNextEntityCallIndex = indexOfFirstInstructionOrThrow {
                val reference = getReference<MethodReference>() ?: return@indexOfFirstInstructionOrThrow false

                reference.definingClass == AMPLIFY_CLIENT_CLASS &&
                    reference.returnType == OUTCOME_CLASS &&
                    reference.parameterTypes == listOf(GET_NEXT_ENTITY_INPUT_CLASS)
            }

            val invoke = getInstruction<FiveRegisterInstruction>(getNextEntityCallIndex)
            val amplifyClientRegister = invoke.registersUsed[0]
            val inputRegister = invoke.registersUsed[1]

            replaceInstruction(
                getNextEntityCallIndex,
                "invoke-static {v$amplifyClientRegister, v$inputRegister}, " +
                    "Lapp/morphe/extension/amznmusic/patches/SkipAdsPatch;->" +
                    "getNextEntity($AMPLIFY_CLIENT_CLASS$GET_NEXT_ENTITY_INPUT_CLASS)$OUTCOME_CLASS",
            )
        }
    }
}

