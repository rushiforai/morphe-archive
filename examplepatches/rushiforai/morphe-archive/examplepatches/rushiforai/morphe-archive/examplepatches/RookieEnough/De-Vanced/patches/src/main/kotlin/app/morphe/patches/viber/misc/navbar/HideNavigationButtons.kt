/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/viber/misc/navbar/HideNavigationButtons.kt
 */
package app.morphe.patches.viber.misc.navbar

import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val hideNavigationButtonsPatch = bytecodePatch(
    name = "Hide navigation buttons",
    description = "Permanently hides navigation bar buttons, such as Explore and Marketplace.",
    default = false,
) {
    compatibleWith(AppCompatibilities.VIBER)

    val hideExplore by booleanOption(key = "hideExplore", default = true, required = true)
    val hidePay by booleanOption(key = "hidePay", default = true, required = true)
    val hideCamera by booleanOption(key = "hideCamera", default = true, required = true)
    val hideMarketplace by booleanOption(key = "hideMarketplace", default = true, required = true)

    execute {
        val checks = buildList {
            if (hideExplore == true) add(2)
            if (hidePay == true) add(5)
            if (hideCamera == true) add(6)
            if (hideMarketplace == true) add(8)
        }.joinToString("\n") { id ->
            """
            const/4 v0, $id
            if-eq p1, v0, :hide
            """.trimIndent()
        }

        if (checks.isNotBlank()) {
            // Some Viber builds move/rename this method; never hard-fail patching.
            val targetMethod = ShouldShowTabIdMethodFingerprint.methodOrNull ?: return@execute

            targetMethod.addInstructionsWithLabels(
                0,
                """
                $checks
                goto :continue
                :hide
                const/4 v0, 0x0
                return v0
                :continue
                nop
                """.trimIndent(),
            )
        }
    }
}

