package app.morphe.patches.kicktv.chatsize

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.patch
import app.morphe.patcher.string
import app.morphe.patches.kicktv.KICK_TV
import app.morphe.patches.kicktv.settings.settingsPatch
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val EXTENSION_CLASS = "Lapp/morphe/extension/kicktv/chat/"

/** Player openSidebar() uses the hardcoded 0.7f player width ratio. */
private object OpenSidebarFingerprint : Fingerprint(
    definingClass = "Lbn2;",
    returnType = "V",
    filters = listOf(
        string("openSidebar()"),
        literal(0.7f),
    ),
)

/** Video/chat toggle compares the current player width to 0.7f. */
private object SidebarToggleFingerprint : Fingerprint(
    definingClass = "Lmb;",
    filters = listOf(
        methodCall(definingClass = "Lbn2;", name = "k", parameters = emptyList()),
        fieldAccess(definingClass = "Lqh6;", name = "c", type = "F"),
        literal(0.7f),
    ),
)

/**
 * The live player asks the chat screen to use its default width (0.3f) when
 * rendering the side panel. The player width is patched separately, so this
 * hardcoded chat width must follow it or the two panels overlap/leave a gap.
 */
private object ChatPanelWidthFingerprint : Fingerprint(
    definingClass = "La79;",
    name = "c",
    returnType = "V",
    filters = listOf(
        literal(0.3f),
    ),
)

/**
 * CHAT SIZE tweak. It only patches the player width ratio; the Settings menu
 * is provided by the SEYTTINGS base patch this patch depends on.
 */
@Suppress("unused")
val chatSizePatch = patch(
    name = "CHAT SIZE",
    description = "Resize the chat in the VIDEO/CHAT view: default (100%), " +
        "125%, 90%, 85% and 80%. The video and the chat panel always meet " +
        "at the same edge. Requires the SEYTTINGS patch.",
    default = true,
) {
    compatibleWith(KICK_TV)

    dependsOn(settingsPatch)

    extendWith("extensions/KickChatSize.mpe")

    execute {
        // Use the configured width ratio when the chat is opened.
        OpenSidebarFingerprint.apply {
            val index = instructionMatches[1].index
            val register = method.getInstruction<OneRegisterInstruction>(index).registerA
            method.replaceInstruction(
                index,
                "invoke-static {}, ${EXTENSION_CLASS}ChatSizePrefs;->getChatPlayerWidthRatio()F",
            )
            method.addInstruction(index + 1, "move-result v$register")
        }

        // Keep the open/close chat toggle working with the configured ratio.
        SidebarToggleFingerprint.apply {
            val index = instructionMatches[2].index
            val register = method.getInstruction<OneRegisterInstruction>(index).registerA
            method.replaceInstruction(
                index,
                "invoke-static {}, ${EXTENSION_CLASS}ChatSizePrefs;->getChatPlayerWidthRatio()F",
            )
            method.addInstruction(index + 1, "move-result v$register")
        }

        // The player passes the default 0.3f chat width to the chat screen.
        // Derive it from the same preference so the chat panel always ends
        // exactly where the video ends.
        ChatPanelWidthFingerprint.apply {
            val index = instructionMatches[0].index
            val register = method.getInstruction<OneRegisterInstruction>(index).registerA
            method.replaceInstruction(
                index,
                "invoke-static {}, ${EXTENSION_CLASS}ChatSizePrefs;->getChatPanelWidthRatio()F",
            )
            method.addInstruction(index + 1, "move-result v$register")
        }
    }
}
