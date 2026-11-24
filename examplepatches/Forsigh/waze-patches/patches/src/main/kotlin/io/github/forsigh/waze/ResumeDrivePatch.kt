package io.github.forsigh.waze

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import io.github.forsigh.waze.WazeConstants.COMPATIBILITY_WAZE

/**
 * Resume drive prompt.
 *
 * Waze offers to pick the last trip back up when it comes back to life - on the phone start screen
 * and on the Android Auto card ("Resume drive" / "No"). The offer is driven from native: Waze's
 * native layer calls `ResumeDriveNativeManagerBase.handleResumeDriveCallbackResultJNI([B)`, the
 * parsed place lands in `mutableResumeDriveFlow`, and the start-screen view model
 * (`com.waze.main_screen.u.n`) and the car presenter (`com.waze.car_lib.m.c.k`) turn it into the
 * card.
 *
 * `hide` returns from that callback before it parses anything, so the flow never emits and no
 * surface has a card to draw. Manual navigation is untouched: the user picks the destination as
 * usual.
 *
 * Known limitation: the same flow feeds Waze's own "this place is in recents, resume it quietly"
 * attempt, so hiding the prompt also drops that silent resume. Nothing else changes.
 */
@Suppress("unused")
val resumeDrivePromptPatch = bytecodePatch(
    name = "Resume drive prompt",
    description = "Stops Waze asking to resume the last trip.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_WAZE)
    category("Driving & Voice")

    val mode by stringOption(
        "mode", "hide",
        mapOf(
            "Never ask (hide the prompt)" to "hide",
            "Leave it alone (stock)" to "stock",
        ),
        title = "When Waze offers to resume the last trip",
        description = "Hide: the resume card never appears. Stock: Waze behaves as shipped.",
    )

    execute {
        val chosen = mode ?: "hide"
        requireChoice("resumeDrivePromptPatch", "mode", chosen, setOf("hide", "stock"))
        if (chosen == "stock") {
            println("resumeDrivePromptPatch: stock selected, nothing to do")
            return@execute
        }

        val fingerprint = Fingerprint(
            definingClass = "Lcom/waze/resume_drive/ResumeDriveNativeManagerBase;",
            name = "handleResumeDriveCallbackResultJNI",
            returnType = "V",
        )
        // `fingerprint.method` throws when the class or method is gone, so a moved anchor fails the
        // run loudly instead of reporting a prompt that was never hidden.
        val method = fingerprint.method

        method.addInstructions(0, "return-void")
        println("resumeDrivePromptPatch: resume callback silenced at ${method.definingClass}->${method.name}")
    }
}
