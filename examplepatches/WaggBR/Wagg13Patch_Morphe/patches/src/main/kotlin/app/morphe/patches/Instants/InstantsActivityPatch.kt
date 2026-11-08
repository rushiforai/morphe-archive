package app.morphe.patches.instants

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/**
 * Records the main activity for the extension (used for starting activities and for toasts).
 * Part of [instantsModPatch]; the other parts depend on it.
 */
val instantsActivityPatch = bytecodePatch {  // unnamed: only loaded through [instantsModPatch]
    compatibleWith(INSTANTS_COMPATIBILITY)
    extendWith("extensions/extension.mpe")

    execute {
        MoonshotOnCreateFingerprint.method.addInstructions(
            0,
            """
            invoke-static/range {p0 .. p0}, $GALLERY_HELPER->setActivity(Landroid/app/Activity;)V
            """.trimIndent(),
        )
    }
}
