package app.template.patches.bplace

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

val charityFrameworkPatch = bytecodePatch(
    name = "Inject Charity Framework",
    description = "Embeds and runs the Charity Framework plugin loader on bplace.art pages (mobile GM shim + native fetch bridge).",
    default = true
) {
    compatibleWith(Compatibility(
        name = "Better Place",
        packageName = "com.bplace",
        appIconColor = 0x2196f2,
        targets = listOf(AppTarget(null), AppTarget("1.0.7"))
    ))
    extendWith("extensions/extension.mpe")

    execute {
        val method = WebViewClientFingerprint.method
        method.addInstructions(
            0,
            """
            move-object/from16 v0, p1
            invoke-static {v0}, ${ExtensionClasses.ScriptHook}->injectCharityFramework(Landroid/webkit/WebView;)V
            """.trimIndent()
        )
    }
}