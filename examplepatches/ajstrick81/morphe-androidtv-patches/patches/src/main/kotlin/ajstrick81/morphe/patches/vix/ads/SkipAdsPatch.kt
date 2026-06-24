package ajstrick81.morphe.patches.vix.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import ajstrick81.morphe.patches.vix.shared.Constants

@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = "Skip ads",
    description = "Suppresses ViX ad delivery by disabling the FreeWheel ad provider at the " +
        "config level and preventing the Innovid SSAI overlay from mounting.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {

        // ─────────────────────────────────────────────────────────────────────
        // Hook 1 — LuraFreewheelConfiguration.<init>
        //
        // Leaves the `enabled` boolean field at its JVM default (false).
        // The LuraPlayer ad scheduler reads this before fetching ad URLs —
        // with FreeWheel disabled the scheduler aborts the ad request early.
        // ─────────────────────────────────────────────────────────────────────
        LuraFreewheelConfigFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )

        // ─────────────────────────────────────────────────────────────────────
        // Hook 2 — InnovidHelper (start ad method)
        //
        // Prevents the Innovid SSAI WebView overlay from mounting.
        // The Innovid pipeline is entirely separate from LuraPlayer/FreeWheel.
        // Returning void here stops the session before any network request
        // or WebView instantiation occurs.
        // ─────────────────────────────────────────────────────────────────────
        InnovidStartAdFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )
    }
}
