package dev.brave.patches.perf

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.morphe.patcher.string
import dev.brave.patches.shared.COMPATIBILITY_BRAVE

private const val STARTUP_HELPER = "Ldev/brave/extension/perf/StartupHelper;"

internal object PartnerCustomizationsFingerprint : Fingerprint(
    definingClass = "Lorg/chromium/chrome/browser/partnercustomizations/PartnerBrowserCustomizations;",
    name = "c",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    filters = listOf(
        string("cr_PartnerCustomize")
    )
)

@Suppress("unused")
val startupOptimizationPatch = patch(
    name = "Startup Optimization",
    description = "Bypasses partner customizations during cold start and drains deferred startup listeners immediately."
) {
    compatibleWith(COMPATIBILITY_BRAVE)

    extendWith("extensions/brave.mpe")

    execute {
        PartnerCustomizationsFingerprint.method.apply {
            addInstructions(
                0,
                """
                    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                    iput-object v0, p0, Lorg/chromium/chrome/browser/partnercustomizations/PartnerBrowserCustomizations;->b:Ljava/lang/Boolean;
                    iget-object v0, p0, Lorg/chromium/chrome/browser/partnercustomizations/PartnerBrowserCustomizations;->d:Ljava/util/ArrayList;
                    invoke-static {v0}, $STARTUP_HELPER->drainAndRunCallbacks(Ljava/util/List;)V
                    return-void
                """.trimIndent()
            )
        }
    }
}
