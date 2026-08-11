package app.template.patches.bplace

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.template.patches.bplace.WebViewClientFingerprint

private const val EXTENSION_CLASS = "Lapp/template/extension/ScriptHook;"

val javascriptPatch = bytecodePatch(
    name = "Remote script injector",
    description = "Hooks WebView to inject integrity-checked userscripts.",
    default = true
) {
    compatibleWith(Compatibility(
            name = "Better Place",
            packageName = "com.bplace",
            appIconColor = 0x2196f2,
            targets = listOf(AppTarget(null), AppTarget("1.0.7"))
        )) // fill in target package(s)/versions, or leave open if universal

    execute {
        val method = WebViewClientFingerprint.method
        method.addInstructions(
            0,
            """
            move-object/from16 v0, p0
            invoke-static {v0}, $EXTENSION_CLASS;->hookWebView(Landroid/webkit/WebView;)V
            """.trimIndent()
        )
    }
}