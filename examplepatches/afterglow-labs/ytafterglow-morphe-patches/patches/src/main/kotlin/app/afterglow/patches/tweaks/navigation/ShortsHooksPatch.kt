/*
 * YTAfterglow for Android.
 *
 * Hooks adapted from Morphe patches v2.2.0 (https://github.com/MorpheApp/morphe-patches, GPLv3),
 * forked from ReVanced patches (https://github.com/ReVanced/revanced-patches, GPLv3): the Disable Shorts resuming on startup, Shorts autoplay and Open Shorts in regular player patches.
 * Modified for YTAfterglow: rewritten for patcher 2.1.0 and YouTube 21.43.523 and driven by the
 * iOS settings. Not an official Morphe or ReVanced file.
 *
 * Portions of this software are provided "AS IS" by the Morphe software project.
 * Any express or implied warranties, including the implied warranties of
 * merchantability and fitness for a particular purpose, are disclaimed.
 */

package app.afterglow.patches.tweaks.navigation

import app.afterglow.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import app.afterglow.patches.shared.Constants.EXTENSION_PACKAGE
import app.afterglow.patches.shared.afterglowExtensionPatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

internal const val SHORTS_HOOKS = "$EXTENSION_PACKAGE/navigation/ShortsHooks;"

/**
 * Hooks of the iOS Shorts behavior settings: resumeShorts, autoSkipShorts and shortsToRegular;
 * shortsOnlyMode's Shorts start page comes from [startupHooksPatch]. The named "Shorts" patch in
 * TweakPatches.kt depends on this patch.
 *
 * [shortsFullscreenHookPatch] connects the native pinch recognizer, clear-mode
 * rendering and tab/content insets. Its native touch bridge also supports
 * Shorts-only tab hiding and the independent two-finger exit gesture.
 */
internal val shortsHooksPatch = bytecodePatch(
    description = "Hooks the Shorts player for the Afterglow Shorts settings.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(afterglowExtensionPatch, startupHooksPatch, shortsProgressHookPatch, shortsFullscreenHookPatch)

    execute {
        // region resumeShorts

        ShortsResumeFingerprint.let {
            val match = it.instructionMatches.first()
            val wasInShorts = (match.instruction as RegisterRangeInstruction).startRegister + 2
            it.method.addInstructions(
                match.index,
                """
                    ${invokeStatic(wasInShorts, method = "$SHORTS_HOOKS->resumeShorts(Z)Z")}
                    move-result v$wasInShorts
                """,
            )
        }
        ShortsResumeFlagFingerprint.matchAll().forEach { match ->
            literalLoads(match.method, 45358360L).reversed().forEach { index ->
                match.method.overrideFlagRead(index, "$SHORTS_HOOKS->resumeShorts(Z)Z")
            }
        }

        // endregion

        // region autoSkipShorts

        val loopBehavior = ReelLoopBehaviorFingerprint.originalClassDef.type
        reelPlaybackFingerprint(loopBehavior).method.apply {
            val instructions = implementation!!.instructions
            val reads = instructions.indices.filter { index ->
                val call = (instructions[index] as? ReferenceInstruction)?.reference as? MethodReference
                instructions[index].isInvoke && call?.returnType == loopBehavior &&
                    instructions.getOrNull(index + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT
            }
            if (reads.isEmpty()) throw PatchException("No loop behavior read in $this")
            reads.reversed().forEach { index ->
                val register = instruction<OneRegisterInstruction>(index + 1).registerA
                addInstructions(
                    index + 2,
                    """
                        ${invokeStatic(register, method = "$SHORTS_HOOKS->loopBehavior(Ljava/lang/Enum;)Ljava/lang/Enum;")}
                        move-result-object v$register
                        check-cast v$register, $loopBehavior
                    """,
                )
            }
        }

        // endregion

        // region shortsToRegular

        val videoId = PlaybackStartDescriptorToStringFingerprint.instructionMatches[1].methodReference
        val watchDescriptorFactory = WatchDescriptorFactoryFingerprint.originalMethod
        ShortsPlaybackIntentFingerprint.method.apply {
            val implementation = implementation!!
            val parameterRegisters = parameterTypes.sumOf { if (it.toString() == "J" || it.toString() == "D") 2 else 1 } + 1
            if (implementation.registerCount - parameterRegisters < 2) throw PatchException("No free registers in $this")
            addInstructionsWithLabels(
                0,
                """
                    move-object/from16 v0, p1
                    invoke-virtual { v0 }, ${videoId.definingClass}->${videoId.name}()Ljava/lang/String;
                    move-result-object v0
                    move-object/from16 v1, p2
                    invoke-static { v1, v0 }, $SHORTS_HOOKS->openInRegularPlayer(Ljava/util/Map;Ljava/lang/String;)Z
                    move-result v0
                    if-eqz v0, :afterglow_play_short
                    return-void
                    :afterglow_play_short
                    nop
                """,
            )
        }

        // The extension's placeholder gets a body that calls YouTube's watch descriptor factory.
        mutableClassDefBy(SHORTS_HOOKS).apply {
            val placeholder = methods.single { it.name == "watchDescriptor" }
            methods.remove(placeholder)
            methods.add(
                ImmutableMethod(
                    type,
                    placeholder.name,
                    listOf(ImmutableMethodParameter("Landroid/content/Intent;", null, null)),
                    "Landroid/os/Parcelable;",
                    AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
                    null,
                    null,
                    MutableMethodImplementation(2),
                ).toMutable().apply {
                    addInstructions(
                        0,
                        """
                            invoke-static { p0 }, $watchDescriptorFactory
                            move-result-object v0
                            check-cast v0, Landroid/os/Parcelable;
                            return-object v0
                        """,
                    )
                },
            )
        }

        // endregion
    }
}
