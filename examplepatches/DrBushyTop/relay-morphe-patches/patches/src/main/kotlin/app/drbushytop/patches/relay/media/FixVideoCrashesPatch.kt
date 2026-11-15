package app.drbushytop.patches.relay.media

import app.drbushytop.patches.relay.Relay
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

/**
 * `VideoControlManager#t()`, run by the video viewer's controls button (the one that also holds
 * the playback speed). It shows or hides the controls panel, which is only created once the
 * video's player exists, so it crashed for a video that never started loading.
 */
internal object ToggleVideoControlsFingerprint : Fingerprint(
    definingClass = "Lreddit/news/previews/managers/VideoControlManager;",
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(opcode = Opcode.IGET_OBJECT, definingClass = "this", type = "Landroid/widget/LinearLayout;"),
        methodCall(name = "getVisibility"),
        methodCall(name = "isLaidOut"),
    ),
)

/**
 * `RedditUtils#q(String)`: whether a post's media URL is a Reddit video. Relay calls it on the
 * media URL in the post's More menu, the media viewer and elsewhere, and it crashed on a post
 * whose media had no URL.
 */
internal object IsRedditVideoUrlFingerprint : Fingerprint(
    definingClass = "Lreddit/news/utils/RedditUtils;",
    name = "q",
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;"),
    filters = listOf(
        methodCall(definingClass = "Lreddit/news/utils/RedditUtils;", returnType = "Z"),
    ),
)

@Suppress("unused")
val fixVideoCrashesPatch = bytecodePatch(
    name = "Fix video crashes",
    description = "Stops Relay from crashing on a post whose video has no URL (when the post's More " +
        "menu opens, for one) and when the video controls button is tapped before a video loads.",
    default = true,
) {
    compatibleWith(*Relay.compatibility)

    execute {
        // p0 may be the method's only register, so a null URL answers false through p0 itself.
        IsRedditVideoUrlFingerprint.method.addInstructionsWithLabels(
            0,
            """
                if-nez p0, :check
                const/4 p0, 0x0
                return p0
            """,
            ExternalLabel("check", IsRedditVideoUrlFingerprint.method.getInstruction(0)),
        )

        ToggleVideoControlsFingerprint.method.apply {
            val read = ToggleVideoControlsFingerprint.instructionMatches.first().index
            val register = getInstruction<OneRegisterInstruction>(read).registerA
            addInstructionsWithLabels(
                read + 1,
                """
                    if-nez v$register, :controls
                    return-void
                """,
                ExternalLabel("controls", getInstruction(read + 1)),
            )
        }
    }
}
