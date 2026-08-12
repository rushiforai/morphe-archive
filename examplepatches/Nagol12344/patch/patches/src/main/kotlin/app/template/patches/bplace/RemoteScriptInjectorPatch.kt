package app.template.patches.bplace

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

private const val EXTENSION_CLASS = "Lapp/template/extension/ScriptHook;"

val fixFilePickerPatch = bytecodePatch(
    name = "Fix file picker camera prompt",
    description = "Strips the capture attribute from file inputs so the file picker doesn't request camera permission.",
    default = true
) {
    compatibleWith(Compatibility(
            name = "Better Place",
            packageName = "com.bplace",
            appIconColor = 0x2196f2,
            targets = listOf(AppTarget(null), AppTarget("1.0.7"))
        )) // fill in package/version
    extendWith("extensions/extension.mpe")

    execute {
        val method = WebViewClientFingerprint.method
        method.addInstructions(
            0,
            """
            move-object/from16 v0, p1
            invoke-static {v0}, $EXTENSION_CLASS->hookWebView(Landroid/webkit/WebView;)V
            """.trimIndent()
        )
    }
}