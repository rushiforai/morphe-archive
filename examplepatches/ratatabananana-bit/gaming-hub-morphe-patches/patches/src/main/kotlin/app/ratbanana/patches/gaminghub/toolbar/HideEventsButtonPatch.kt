package app.ratbanana.patches.gaminghub.toolbar

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.ratbanana.patches.gaminghub.shared.Constants.COMPATIBILITY_GAMING_HUB
import app.ratbanana.patches.gaminghub.shared.Constants.EXTENSION_PACKAGE
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

private const val EXTENSION_CLASS = "$EXTENSION_PACKAGE/EventsButton;"

@Suppress("unused")
val hideEventsButtonPatch = bytecodePatch(
    name = "Hide Events button",
    description = "Removes the gift icon in the top right of the home screen that opens the Events page.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GAMING_HUB)

    extendWith("extensions/extension.mpe")

    execute {
        InitEventMenuFingerprint.let { fingerprint ->
            val eventIconMatch = fingerprint.instructionMatches.first()
            val eventIconRegister = eventIconMatch.getInstruction<TwoRegisterInstruction>().registerA

            // Hide the icon as soon as it is read from the binding, then skip wiring its click
            // listener and the flows that would make it and its badge visible again.
            fingerprint.method.addInstructions(
                eventIconMatch.index + 1,
                """
                    invoke-static { v$eventIconRegister }, $EXTENSION_CLASS->hide(Landroid/view/View;)V
                    return-void
                """,
            )
        }
    }
}
