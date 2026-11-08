/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.patches.pinedrama.interaction.looping

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.pinedrama.misc.extension.sharedExtensionPatch
import app.morphe.patches.pinedrama.misc.settings.SettingsStatusLoadFingerprint
import app.morphe.patches.pinedrama.misc.settings.configurableBytecodePatch as bytecodePatch
import app.morphe.patches.pinedrama.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.addInstruction
import app.morphe.util.addInstructions
import app.morphe.util.addInstructionsWithLabels
import app.morphe.util.getReference
import app.morphe.util.implementationOrPatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION = "Lapp/morphe/extension/pinedrama/interaction/LandscapeEpisodes;"
private const val OBJECT = "Ljava/lang/Object;"
private const val LIST = "Ljava/util/List;"
private const val PATCH = "Episodes in full screen"
internal const val LANDSCAPE_ENTRANCE =
    "Lcom/ss/android/ugc/aweme/feed/landscape/LandscapeEntranceAssem;"
internal const val LANDSCAPE_VIEW_MODEL =
    "Lcom/ss/android/ugc/aweme/feed/landscape/viewmodels/LandscapeFeedViewModel;"
internal const val LANDSCAPE_LOAD_LOGIC =
    "Lcom/ss/android/ugc/aweme/feed/landscape/component/LandscapeFeedDataLoadLogicComponent;"
internal const val LANDSCAPE_ACTIVITY =
    "Lcom/ss/android/ugc/aweme/feed/landscape/LandscapeFeedActivity;"

/** Runs when the "Full screen" pill is tapped, and reads the screen's own view model. */
internal object LandscapeEntranceFingerprint : Fingerprint(
    definingClass = LANDSCAPE_ENTRANCE,
    returnType = "V",
    parameters = listOf("I", "I", "I", "Ljava/lang/String;"),
)

/** The one-item list the viewer opens with. */
internal object LandscapeSeedListFingerprint : Fingerprint(
    definingClass = LANDSCAPE_VIEW_MODEL,
    returnType = LIST,
    parameters = emptyList(),
)

internal object LandscapeLoadMoreFingerprint : Fingerprint(
    definingClass = LANDSCAPE_LOAD_LOGIC,
    returnType = "V",
    parameters = listOf("I", "I", "Z"),
    strings = listOf("can't load more"),
)

internal object LandscapeLoadPreviousFingerprint : Fingerprint(
    definingClass = LANDSCAPE_LOAD_LOGIC,
    returnType = "V",
    parameters = emptyList(),
    strings = listOf("can't load latest"),
)

internal object LandscapeActivityFinishFingerprint : Fingerprint(
    definingClass = LANDSCAPE_ACTIVITY,
    name = "finish",
    returnType = "V",
    parameters = emptyList(),
)

/** The entrance's read of the screen's view model, the only no-argument getViewModel it makes. */
internal fun isViewModelRead(instruction: Instruction): Boolean {
    if (instruction.opcode != Opcode.INVOKE_INTERFACE) return false
    val reference = instruction.getReference<MethodReference>() ?: return false
    return reference.name == "getViewModel" && reference.returnType == OBJECT &&
        reference.parameterTypes.isEmpty()
}

val fullScreenEpisodesPatch = bytecodePatch(
    name = "Episodes in full screen",
    description = "Lets you swipe between a drama's episodes in full screen, and moves on to " +
        "the next episode when one ends instead of looping it. Starts on. Turn it off in " +
        "HushPine settings > Playback.",
    default = true,
) {
    category("Playback")
    dependsOn(settingsPatch, sharedExtensionPatch)
    compatibleWith(*AppCompatibilities.pineDrama())

    execute {
        SettingsStatusLoadFingerprint.method.addInstruction(
            0,
            "invoke-static {}, Lapp/morphe/extension/pinedrama/settings/SettingsStatus;->enableLandscapeEpisodes()V",
        )

        val entrance = LandscapeEntranceFingerprint.method
        val entranceCode = entrance.implementationOrPatchException(PATCH).instructions.toList()
        val read = entranceCode.indexOfFirst(::isViewModelRead)
        if (read < 0) throw PatchException("$PATCH: the entrance no longer reads a view model.")
        val model = entrance.getInstruction<OneRegisterInstruction>(read + 1).registerA
        entrance.addInstruction(
            read + 2,
            "invoke-static {p0, v$model}, $EXTENSION->remember($OBJECT$OBJECT)V",
        )

        // The new-instance just before the return hands the list to a state write, which has to
        // get the same list the viewer does. The empty path jumps to that new-instance from below
        // and stays on the original instruction, so an empty list never reaches the extension.
        val seed = LandscapeSeedListFingerprint.method
        val seedCode = seed.implementationOrPatchException(PATCH).instructions.toList()
        val returned = seedCode.indexOfLast { it.opcode == Opcode.RETURN_OBJECT }
        if (returned < 0) throw PatchException("$PATCH: the seed list has no return.")
        val handOff = (returned downTo 0).firstOrNull { seedCode[it].opcode == Opcode.NEW_INSTANCE }
            ?: throw PatchException("$PATCH: the seed list has no state write.")
        val list = seed.getInstruction<OneRegisterInstruction>(returned).registerA
        seed.addInstructions(
            handOff,
            """
                invoke-static {v$list}, $EXTENSION->episodes($LIST)$LIST
                move-result-object v$list
            """,
        )

        // Both start by reading a flag into v0, so v0 is free at entry.
        val more = LandscapeLoadMoreFingerprint.method
        more.addInstructionsWithLabels(
            0,
            """
                invoke-static {p0, p1, p2, p3}, $EXTENSION->loadMore(${OBJECT}IIZ)Z
                move-result v0
                if-eqz v0, :morphe_native_more
                return-void
            """,
            ExternalLabel("morphe_native_more", more.getInstruction(0)),
        )
        val previous = LandscapeLoadPreviousFingerprint.method
        previous.addInstructionsWithLabels(
            0,
            """
                invoke-static {p0}, $EXTENSION->loadPrevious($OBJECT)Z
                move-result v0
                if-eqz v0, :morphe_native_previous
                return-void
            """,
            ExternalLabel("morphe_native_previous", previous.getInstruction(0)),
        )

        LandscapeActivityFinishFingerprint.method.addInstruction(
            0,
            "invoke-static {p0}, $EXTENSION->leaving($OBJECT)V",
        )
    }
}
