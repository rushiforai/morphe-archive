/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/3847
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to Morphe contributions.
 * Modified by lavinhoque33, 2026-10-24
 */

package app.morphe.patches.youtube.shorts.skiplive

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.youtube.shorts.components.ReelPlaybackFingerprint
import app.morphe.patches.youtube.shorts.components.ReelPlaybackRepeatFingerprint
import app.morphe.patches.youtube.shorts.components.reelPlaybackRepeatFingerprint
import app.morphe.patches.youtube.utils.compatibility.Constants.COMPATIBILITY_YOUTUBE
import app.morphe.patches.youtube.utils.extension.sharedExtensionPatch
import app.morphe.patches.youtube.utils.patch.PatchList.SKIP_LIVE_SHORTS
import app.morphe.patches.youtube.utils.playservice.versionCheckPatch
import app.morphe.patches.youtube.utils.settings.ResourceUtils.addPreference
import app.morphe.patches.youtube.utils.settings.settingsPatch
import app.morphe.patches.youtube.video.information.videoInformationPatch
import app.morphe.util.findFreeRegister
import app.morphe.util.fingerprint.matchOrThrow
import app.morphe.util.getReference
import app.morphe.util.indexOfFirstInstructionOrThrow
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

private const val EXTENSION_CLASS =
    "Lapp/morphe/extension/youtube/patches/SkipLiveShortsPatch;"
private const val EXTENSION_CONTROLLER_INTERFACE =
    $$"Lapp/morphe/extension/youtube/patches/SkipLiveShortsPatch$ReelSequenceController;"

/**
 * Adds the [EXTENSION_CONTROLLER_INTERFACE] to the Shorts player class,
 * with a method that runs [skipSmali] to skip to the next Short.
 *
 * @param skipSmali Code that uses `v0` to `v3`, and ends with `return-void`.
 */
private fun MutableClass.addSkipToNextShortMethod(skipSmali: String) {
    interfaces.add(EXTENSION_CONTROLLER_INTERFACE)

    methods.add(
        ImmutableMethod(
            type,
            "patch_skipToNextShort",
            listOf(),
            "V",
            AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
            null,
            null,
            MutableMethodImplementation(5),
        ).toMutable().apply {
            addInstructions(0, skipSmali)
        }
    )
}

/**
 * Hands the Shorts player to the extension each time the Shorts playback repeat behavior is read.
 *
 * @param playerSmali Code that sets the register to the Shorts player.
 */
private fun MutableMethod.injectReelSequenceControllerHook(playerSmali: (register: Int) -> String) {
    val register = findFreeRegister(0)

    addInstructions(
        0,
        """
            ${playerSmali(register)}
            invoke-static { v$register }, $EXTENSION_CLASS->setReelSequenceController($EXTENSION_CONTROLLER_INTERFACE)V
        """
    )
}

@Suppress("unused")
val skipLiveShortsPatch = bytecodePatch(
    name = SKIP_LIVE_SHORTS.title,
    description = SKIP_LIVE_SHORTS.summary,
) {
    dependsOn(
        sharedExtensionPatch,
        settingsPatch,
        versionCheckPatch,
        // Live streams are detected by the video information patch.
        videoInformationPatch,
    )

    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        addPreference(
            arrayOf(
                "PREFERENCE_SCREEN: SHORTS",
                "SETTINGS: SKIP_LIVE_SHORTS"
            ),
            SKIP_LIVE_SHORTS
        )

        if (runCatching { ReelPlaybackFingerprint.classDef }.isSuccess) {
            patchSeparateShortsPlayer()
        } else {
            patchLegacyShortsPlayer()
        }
    }
}

/**
 * The Shorts player class has its own method to play the next Short, and is separate from
 * the class that reads the repeat behavior. Used by YouTube 20.16 and newer.
 */
private fun BytecodePatchContext.patchSeparateShortsPlayer() {
    // Skip to the next Short with the same user action the app uses for autoplay.
    val userActionMethodReference = ReelPlaybackFingerprint.instructionMatches[1]
        .getInstruction<ReferenceInstruction>().reference as MethodReference
    val reelSequenceControllerMethodReference = ReelPlaybackFingerprint.instructionMatches[2]
        .getInstruction<ReferenceInstruction>().reference as MethodReference

    // Newer versions keep the reel sequence controller in a field of the Shorts player.
    // Older versions use the Shorts player itself as the reel sequence controller.
    val reelSequenceControllerField = runCatching {
        getInstanceFieldGetFingerprint(reelSequenceControllerMethodReference.definingClass)
            .match(ReelPlaybackFingerprint.originalMethod)
            .instructionMatches.first().getInstruction<ReferenceInstruction>().reference as FieldReference
    }.getOrNull()

    val getReelSequenceControllerInstruction = if (reelSequenceControllerField != null) {
        "iget-object v1, p0, $reelSequenceControllerField"
    } else {
        "move-object v1, p0"
    }

    ReelPlaybackFingerprint.classDef.addSkipToNextShortMethod(
        """
            new-instance v0, ${userActionMethodReference.definingClass}
            const/4 v1, 0x3
            const/4 v2, 0x0
            invoke-direct { v0, v1, v2, v2 }, $userActionMethodReference
            $getReelSequenceControllerInstruction
            invoke-virtual { v1, v0 }, $reelSequenceControllerMethodReference
            return-void
        """
    )

    // Hand the Shorts player to extension code.
    val reelPlayerField = getInstanceFieldGetFingerprint(ReelPlaybackFingerprint.classDef.type)
        .match(ReelPlaybackRepeatFingerprint.originalMethod)
        .instructionMatches.first().getInstruction<ReferenceInstruction>().reference as FieldReference

    ReelPlaybackRepeatFingerprint.method.injectReelSequenceControllerHook { register ->
        "iget-object v$register, p0, $reelPlayerField"
    }
}

/**
 * The class that reads the repeat behavior is also the Shorts player.
 * It keeps the reel sequence controller in a field, and performs the autoplay itself with a user action.
 * Used by YouTube versions before 20.16.
 */
private fun BytecodePatchContext.patchLegacyShortsPlayer() {
    val repeatMatch = reelPlaybackRepeatFingerprint.matchOrThrow()
    val repeatMethod = repeatMatch.method

    repeatMethod.apply {
        val userActionIndex = indexOfFirstInstructionOrThrow {
            val reference = getReference<MethodReference>()
            opcode == Opcode.INVOKE_DIRECT &&
                    reference?.name == "<init>" &&
                    reference.parameterTypes.size == 3 &&
                    reference.parameterTypes.first() == "I"
        }
        val userActionMethodReference = getInstruction<ReferenceInstruction>(userActionIndex)
            .reference as MethodReference

        val reelSequenceControllerMethodReference = getInstruction<ReferenceInstruction>(
            indexOfFirstInstructionOrThrow(userActionIndex) {
                val reference = getReference<MethodReference>()
                opcode == Opcode.INVOKE_VIRTUAL &&
                        reference?.parameterTypes?.size == 2 &&
                        reference.parameterTypes[0] == userActionMethodReference.definingClass &&
                        reference.parameterTypes[1] == "Z"
            }
        ).reference as MethodReference

        val reelSequenceControllerField = getInstruction<ReferenceInstruction>(
            indexOfFirstInstructionOrThrow {
                val reference = getReference<FieldReference>()
                opcode == Opcode.IGET_OBJECT &&
                        reference?.definingClass == definingClass &&
                        reference.type == reelSequenceControllerMethodReference.definingClass
            }
        ).reference as FieldReference

        repeatMatch.classDef.addSkipToNextShortMethod(
            """
                new-instance v0, ${userActionMethodReference.definingClass}
                const/4 v1, 0x3
                const/4 v2, 0x0
                invoke-direct { v0, v1, v2, v2 }, $userActionMethodReference
                iget-object v1, p0, $reelSequenceControllerField
                invoke-virtual { v1, v0, v2 }, $reelSequenceControllerMethodReference
                return-void
            """
        )
    }

    repeatMethod.injectReelSequenceControllerHook { register ->
        "move-object v$register, p0"
    }
}
