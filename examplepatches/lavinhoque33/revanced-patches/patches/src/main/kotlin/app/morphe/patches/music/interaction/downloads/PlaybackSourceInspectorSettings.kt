/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-22.
 * Written by lavinhoque33, 2026-11-22.
 */
package app.morphe.patches.music.interaction.downloads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.getReference
import app.morphe.patches.music.utils.settings.CategoryType
import app.morphe.patches.music.utils.settings.addCustomPreference
import app.morphe.patches.shared.mapping.ResourceType.ID
import app.morphe.patches.shared.mapping.resourceLiteral
import app.morphe.util.Utils.printInfo
import app.morphe.util.Utils.printWarn
import app.morphe.util.fingerprint.matchSingle
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val DIALOG = "Lapp/morphe/extension/music/patches/downloads/PlaybackSourceInspectorDialog;"
private const val IMAGE_VIEW = "Landroid/widget/ImageView;"
private const val CLICK_LISTENER = "Landroid/view/View\$OnClickListener;"
private const val WATCH_WHILE = "Lcom/google/android/apps/youtube/music/watchpage"

private object PlayerMenuFingerprint : Fingerprint(
    name = "<init>",
    returnType = "V",
    custom = { method, _ ->
        val layout = method.parameterTypes.firstOrNull()
        layout == "$WATCH_WHILE/mpp/MppWatchWhileLayout;" || layout == "$WATCH_WHILE/ui/WatchWhileLayout;"
    },
    filters = listOf(
        resourceLiteral(ID, "contextual_menu"),
        methodCall(
            name = "findViewById",
            parameters = listOf("I"),
            returnType = "Landroid/view/View;",
            location = MatchAfterImmediately(),
        ),
        opcode(Opcode.MOVE_RESULT_OBJECT, MatchAfterImmediately()),
        opcode(Opcode.CHECK_CAST, MatchAfterImmediately()),
    ),
)

/** Called only by the installer after the playback source hooks are available. */
internal fun BytecodePatchContext.registerPlaybackSourceInspector() {
    addCustomPreference(
        CategoryType.PLAYER,
        "morphe_music_playback_source_inspector",
        "app.morphe.extension.music.settings.preference.PlaybackSourceInspectorPreference",
    )
    installPlayerMenuShortcut()
}

private fun BytecodePatchContext.installPlayerMenuShortcut() {
    try {
        val match = PlayerMenuFingerprint.matchSingle()
        val castIndex = match.instructionMatches.last().index
        val method = match.method
        val cast = method.getInstruction<OneRegisterInstruction>(castIndex)
        check(cast.getReference<TypeReference>()?.type == IMAGE_VIEW)

        // Anchor after the original View click, on the exact same menu button.
        val click = method.implementation!!.instructions
            .drop(castIndex + 1)
            .takeWhile { it.getReference<MethodReference>()?.name != "findViewById" }
            .withIndex()
            .single { (_, instruction) ->
                val called = instruction.getReference<MethodReference>()
                instruction.opcode == Opcode.INVOKE_VIRTUAL && instruction is FiveRegisterInstruction &&
                    instruction.registerC == cast.registerA && called?.definingClass == IMAGE_VIEW &&
                    called.name == "setOnClickListener" && called.parameterTypes == listOf(CLICK_LISTENER)
            }
        val menu = cast.registerA
        val available = mutableClassDefBy(DIALOG).methods.single { it.name == "hasNowPlayingShortcut" }

        method.addInstruction(
            castIndex + click.index + 2,
            "invoke-static/range {v$menu .. v$menu}, $DIALOG->bindPlayerMenu(Landroid/view/View;)V"
        )
        available.returnEarly(true)
        printInfo("Playback source inspector: Now Playing menu shortcut hooked on ${method.definingClass}.")
    } catch (ex: Exception) {
        printWarn("Playback source inspector: Now Playing menu shortcut unavailable: ${ex.message}")
    }
}
