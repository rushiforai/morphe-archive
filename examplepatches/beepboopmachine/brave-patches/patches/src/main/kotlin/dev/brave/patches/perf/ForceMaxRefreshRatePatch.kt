package dev.brave.patches.perf

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.morphe.patcher.string
import dev.brave.patches.shared.COMPATIBILITY_BRAVE

private const val DISPLAY_HELPER = "Ldev/brave/extension/perf/DisplayHelper;"

internal object WindowAndroidRefreshRateFingerprint : Fingerprint(
    definingClass = "Lorg/chromium/ui/base/WindowAndroid;",
    name = "r",
    returnType = "V",
    parameters = listOf("F"),
    filters = listOf(
        string("cr_WindowAndroid")
    )
)

@Suppress("unused")
val forceMaxRefreshRatePatch = patch(
    name = "Force Max Refresh Rate",
    description = "Forces display mode to maximum available refresh rate (90Hz / 120Hz / 144Hz) matching physical panel resolution."
) {
    compatibleWith(COMPATIBILITY_BRAVE)

    extendWith("extensions/brave.mpe")

    execute {
        // Attempt resolution-matched max refresh rate; fall through to Chromium's original logic if unavailable
        WindowAndroidRefreshRateFingerprint.method.apply {
            addInstructions(
                0,
                """
                    iget-object v0, p0, Lorg/chromium/ui/base/WindowAndroid;->G:Ljava/util/ArrayList;
                    invoke-virtual {p0}, Lorg/chromium/ui/base/WindowAndroid;->A()Landroid/view/Window;
                    move-result-object v1
                    invoke-static {v1, v0}, $DISPLAY_HELPER->tryForceMaxRefreshRateForWindow(Landroid/view/Window;Ljava/util/List;)Z
                    move-result v0
                    if-eqz v0, :fallback_original
                    return-void
                    :fallback_original
                    nop
                """.trimIndent()
            )
        }
    }
}
