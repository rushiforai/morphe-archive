package app.danielthemaniel.patches.defit

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch

/**
 * Replaces the rewarded-ad click listener with a direct active-time grant.
 *
 * Uses View.getContext() instead of MainActivity$h.this$0 because the
 * decompiled listener does not expose a usable this$0 field at runtime.
 *
 * After storing the maximum time, refresh MainActivity's timer UI immediately.
 */
val unlimitedTimeBypassPatch = bytecodePatch(
    name = "Unlimited Time Bypass",
    description = "Removes the ad requirement and grants maximum active time when the button is pressed.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_DEFIT)

    execute {
        val mainActivityClass = mutableClassDefBy(
            "Lcom/googlefit/tester/MainActivity\$h;"
        )

        mainActivityClass.methods
            .firstOrNull { it.name == "onClick" }
            ?.addInstructions(
                0,
                """
                invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;
                move-result-object v0
                const v1, 0xa8c0
                invoke-static {v0, v1}, Lk4/j;->h(Landroid/content/Context;I)V

                check-cast v0, Lcom/googlefit/tester/MainActivity;
                invoke-virtual {v0}, Lcom/googlefit/tester/MainActivity;->z()V

                return-void
                """.trimIndent()
            )
    }
}
