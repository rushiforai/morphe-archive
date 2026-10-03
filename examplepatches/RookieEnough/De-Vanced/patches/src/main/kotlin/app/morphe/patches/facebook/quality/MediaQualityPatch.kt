/*
* Copyright 2026 De-Vanced
* [https://github.com/RookieEnough/De-Vanced](https://github.com/RookieEnough)
*/

package app.morphe.patches.facebook.quality

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.facebook.shared.Constants
import app.morphe.patches.shared.misc.extension.sharedExtensionPatch
import app.morphe.util.getFreeRegisterProvider
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private val extensionPatch = sharedExtensionPatch("facebook", false)

private const val CONTROLLER =
    "Lapp/morphe/extension/facebook/media/MediaQualityController;"
private const val DOWNLOADER =
    "Lapp/morphe/extension/facebook/MediaDownloader;"

@Suppress("unused")
val mediaQualityPatch = bytecodePatch(
    name = "Media quality controls",
    description = "Applies De-Vanced resolution choices to Facebook Reels and video Stories.",
) {
    compatibleWith(Constants.COMPATIBILITY)
    dependsOn(extensionPatch)

    execute {
        val method = GrootPlayerQualityFingerprint.method
        val instructions = method.implementation!!.instructions.toList()
        val qualityReads = instructions.withIndex().filter {
                (_, instruction) ->
            val reference =
                (instruction as? ReferenceInstruction)?.reference
                        as? FieldReference
            instruction.opcode == Opcode.IGET_OBJECT &&
                reference?.definingClass ==
                "Lcom/facebook/video/engine/api/VideoPlayerParams;" &&
                reference.name == "A0u" &&
                reference.type == "Ljava/lang/String;"
        }
        check(qualityReads.size == 1) {
            "Expected one preselected video-quality field read"
        }
        val qualityRead = qualityReads.single()
        val qualityMove = instructions.getOrNull(qualityRead.index + 1)
                as? TwoRegisterInstruction
            ?: error("Preselected quality local move was not resolved")
        check(qualityMove.opcode == Opcode.MOVE_OBJECT_FROM16) {
            "Unexpected preselected quality local move"
        }
        val qualityRegister = qualityMove.registerA

        val originRead = instructions.withIndex().firstOrNull {
                (index, instruction) ->
            val reference =
                (instruction as? ReferenceInstruction)?.reference
                        as? FieldReference
            index in (qualityRead.index + 1)..(qualityRead.index + 8) &&
                instruction.opcode == Opcode.IGET_OBJECT &&
                reference?.definingClass ==
                "Lcom/facebook/video/common/playerorigin/PlayerOrigin;" &&
                reference.name == "A01" &&
                reference.type == "Ljava/lang/String;"
        } ?: error("Player origin near preselected quality was not resolved")
        val originRegister =
            (originRead.value as TwoRegisterInstruction).registerA

        val insertionIndex = originRead.index + 1
        val freeRegisters = method.getFreeRegisterProvider(insertionIndex, 3)
        val qualityLocal = freeRegisters.getFreeRegister4Bit()
        val originLocal = freeRegisters.getFreeRegister4Bit()
        val paramsLocal = freeRegisters.getFreeRegister4Bit()
        method.addInstructions(
            insertionIndex,
            """
                move-object/from16 v$qualityLocal, v$qualityRegister
                move-object/from16 v$originLocal, v$originRegister
                move-object/from16 v$paramsLocal, p1
                invoke-static {v$paramsLocal}, $DOWNLOADER->capturePlayerParams(Ljava/lang/Object;)V
                invoke-static {v$qualityLocal, v$originLocal, v$paramsLocal}, $CONTROLLER->overridePreselectedQuality(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;
                move-result-object v$qualityLocal
                move-object/from16 v$qualityRegister, v$qualityLocal
            """.trimIndent(),
        )

        val deliveryMethod = VideoDeliveryFieldsFingerprint.method
        val deliveryInstructions =
            deliveryMethod.implementation!!.instructions.toList()
        val flagCalls = deliveryInstructions.withIndex().filter {
                (_, instruction) ->
            val reference =
                (instruction as? ReferenceInstruction)?.reference
                    as? MethodReference
            reference?.definingClass ==
                "Lcom/facebook/mobileconfig/factory/MobileConfigUnsafeContext;" &&
                reference.returnType == "Z" &&
                reference.parameterTypes.map(CharSequence::toString) ==
                listOf("Ljava/lang/Object;", "J")
        }
        check(flagCalls.size == 1) {
            "Expected one video delivery mobile-config boolean call"
        }
        val flagCallIndex = flagCalls.single().index
        val flagResult = deliveryInstructions.getOrNull(flagCallIndex + 1)
                as? OneRegisterInstruction
            ?: error("Video delivery mobile-config result was not resolved")
        check(flagResult.opcode == Opcode.MOVE_RESULT) {
            "Unexpected video delivery mobile-config result"
        }
        deliveryMethod.addInstructions(
            flagCallIndex + 2,
            "const/4 v${flagResult.registerA}, 0x1",
        )
        // DASH video delivery flag enabled without mutating Pando root reader queries.

        println(
            "[MediaQuality] method=${GrootPlayerQualityFingerprint.classDef.type}" +
                " quality=v$qualityRegister origin=v$originRegister",
        )
    }
}

object GrootPlayerQualityFingerprint : Fingerprint(
    returnType = "L",
    parameters = listOf(
        "Lcom/facebook/video/engine/api/VideoPlayerParams;",
    ),
    strings = listOf(
        "FbGrootPlayer.setFOSPlayLowestQuality",
        "freels_lowest_video_quality",
    ),
)

object VideoDeliveryFieldsFingerprint : Fingerprint(
    definingClass = "LX/51t;",
    name = "A02",
    returnType = "V",
    parameters = listOf("L"),
    custom = { method, _ ->
        val instructions = method.implementation?.instructions
        if (instructions == null) {
            false
        } else {
            val literals = instructions.mapNotNull {
                (it as? NarrowLiteralInstruction)?.narrowLiteral
            }
            val references = instructions.mapNotNull {
                (it as? ReferenceInstruction)?.reference
                    as? MethodReference
            }
            literals.contains(752641086) &&
                literals.contains(-1733657087) &&
                references.any {
                    it.definingClass == "Landroid/net/Uri;" &&
                        it.name == "parse"
                } &&
                references.count {
                    it.definingClass ==
                        "Lcom/facebook/mobileconfig/factory/MobileConfigUnsafeContext;" &&
                        it.returnType == "Z" &&
                        it.parameterTypes.map(CharSequence::toString) ==
                        listOf("Ljava/lang/Object;", "J")
                } == 1
        }
    },
)

