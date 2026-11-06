/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to Morphe contributions.
 *
 * Modified by lavinhoque33, 2026-10-24
 */

package app.morphe.patches.youtube.utils.loadvideo

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.youtube.interaction.reload.BackButtonFinishActivityOnNewVideoIntentFingerprint
import app.morphe.patches.youtube.interaction.reload.MiniAppOpenYtContentCommandEndpointFingerprint
import app.morphe.patches.youtube.interaction.reload.MiniAppOpenYtContentCommandEndpointFingerprint2139
import app.morphe.patches.youtube.utils.extension.sharedExtensionPatch
import app.morphe.patches.youtube.utils.navigation.YOUTUBE_MAIN_ACTIVITY_CLASS_TYPE
import app.morphe.util.getReference
import app.morphe.util.indexOfFirstInstructionReversedOrThrow
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.util.MethodUtil

private const val EXTENSION_CLASS =
    "Lapp/morphe/extension/youtube/patches/LoadVideoPatch;"

private const val EXTENSION_PLAYER_INTERFACE =
    $$"Lapp/morphe/extension/youtube/patches/LoadVideoPatch$PlayerInterface;"

private const val EXTENSION_MAIN_ACTIVITY_INTERFACE =
    $$"Lapp/morphe/extension/youtube/patches/LoadVideoPatch$MainActivityInterface;"

/**
 * Lets the extension open videos in the player of the running activity.
 *
 * Unlike Morphe, the player dismiss method is not added here,
 * as the Reload video patch already adds it to the same class.
 */
internal val loadVideoHookPatch = bytecodePatch(
    description = "loadVideoHookPatch"
) {
    dependsOn(sharedExtensionPatch)

    execute {
        // YouTube 21.39 moved the dismiss player call, so try the old shape first and then the new one.
        val dismissPlayerInnerMethod = runCatching {
            MiniAppOpenYtContentCommandEndpointFingerprint
                .instructionMatches[2]
                .getInstruction<ReferenceInstruction>()
                .getReference<MethodReference>()!!
        }.getOrNull() ?: MiniAppOpenYtContentCommandEndpointFingerprint2139
            .instructionMatches.last()
            .getInstruction<ReferenceInstruction>()
            .getReference<MethodReference>()!!

        val openNewVideoParcelableMethod = OpenNewVideoIntentParcelableFingerprint.method
        val openNewVideoParcelableClass = openNewVideoParcelableMethod.definingClass
        val openNewVideoParcelableName = openNewVideoParcelableMethod.name

        mutableClassDefBy(dismissPlayerInnerMethod.definingClass).apply {
            interfaces.add(EXTENSION_PLAYER_INTERFACE)
            methods.add(
                ImmutableMethod(
                    type,
                    "patch_getIntentParcelable",
                    listOf(ImmutableMethodParameter("Landroid/content/Intent;", null, null)),
                    "Landroid/os/Parcelable;",
                    AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
                    null,
                    null,
                    MutableMethodImplementation(3),
                ).toMutable().apply {
                    addInstructions(
                        0,
                        """
                            invoke-static { p1 }, $openNewVideoParcelableClass->$openNewVideoParcelableName(Landroid/content/Intent;)$openNewVideoParcelableClass
                            move-result-object v0
                            return-object v0
                        """
                    )
                }
            )

            methods.single { method ->
                MethodUtil.isConstructor(method)
            }.apply {
                val index = indexOfFirstInstructionReversedOrThrow(Opcode.RETURN_VOID)

                addInstruction(
                    index,
                    "invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS->initialize($EXTENSION_PLAYER_INTERFACE)V"
                )
            }
        }

        // Activity.onNewIntent() is protected, so the extension calls it through a public method.
        mutableClassDefBy(YOUTUBE_MAIN_ACTIVITY_CLASS_TYPE).apply {
            interfaces.add(EXTENSION_MAIN_ACTIVITY_INTERFACE)
            methods.add(
                ImmutableMethod(
                    type,
                    "patch_onNewIntent",
                    listOf(ImmutableMethodParameter("Landroid/content/Intent;", null, "intent")),
                    "V",
                    AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
                    null,
                    null,
                    MutableMethodImplementation(2),
                ).toMutable().apply {
                    addInstructions(
                        0,
                        """
                            invoke-virtual { p0, p1 }, $type->onNewIntent(Landroid/content/Intent;)V
                            return-void
                        """
                    )
                }
            )
        }

        // Opening a video with an intent must not finish the activity when the back button is pressed.
        BackButtonFinishActivityOnNewVideoIntentFingerprint.method.addInstruction(0, "return-void")
    }
}
