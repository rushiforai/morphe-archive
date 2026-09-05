package app.danielthemaniel.patches.defit

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/**
 * Replaces the rewarded-ad click listener with a direct maximum active-time grant.
 *
 * DeFit 0.8.2a:
 * - rewarded-ad listener: MainActivity$h
 * - active-time storage: k4.j.h(Context, int)
 * - maximum: 43,200 seconds (12 hours)
 * - UI refresh: MainActivity.z()
 *
 * DeFit 0.9.3:
 * - rewarded-ad listener: MainActivity$9
 * - active-time storage: Variables.setActiveTime(Context, int)
 * - maximum: 72,000 seconds (20 hours)
 * - UI refresh: MainActivity.access$200() + access$400()
 */
val unlimitedTimeBypassPatch = bytecodePatch(
    name = "Unlimited Time Bypass",
    description = "Removes the ad requirement and grants the target DeFit version's maximum active time when the button is pressed.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_DEFIT)

    execute {
        val mainActivity = mutableClassDefBy(
            "Lcom/googlefit/tester/MainActivity;"
        )

        // 0.9.3 introduced readable updateUI* method names. This is a stable
        // discriminator that does not depend on the APK's version metadata
        // being exposed to the patch execute block.
        val is093 = mainActivity.methods.any {
            it.name == "updateUIAdTime"
        }

        if (is093) {
            val listener = mutableClassDefBy(
                "Lcom/googlefit/tester/MainActivity\$9;"
            )

            listener.methods
                .first { it.name == "onClick" }
                .addInstructions(
                    0,
                    """
                    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;
                    move-result-object v0

                    const v1, 0x11940
                    invoke-static {v0, v1}, Lcom/googlefit/tester/Variables;->setActiveTime(Landroid/content/Context;I)V

                    check-cast v0, Lcom/googlefit/tester/MainActivity;
                    invoke-static {v0}, Lcom/googlefit/tester/MainActivity;->access${'$'}200(Lcom/googlefit/tester/MainActivity;)V
                    invoke-static {v0}, Lcom/googlefit/tester/MainActivity;->access${'$'}400(Lcom/googlefit/tester/MainActivity;)V

                    return-void
                    """.trimIndent()
                )
        } else {
            val listener = mutableClassDefBy(
                "Lcom/googlefit/tester/MainActivity\$h;"
            )

            listener.methods
                .first { it.name == "onClick" }
                .addInstructions(
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
}
