package app.libby.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.libby.patches.Constants.COMPATIBILITY_LIBBY
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference

private const val EXTENSION_CLASS = "Lapp/libby/font/FontHook;"
private const val EXTENSION_BRIDGE = "Lapp/libby/font/FontBridge;"

private val ADD_JAVASCRIPT_INTERFACE = ImmutableMethodReference(
    "Landroid/webkit/WebView;",
    "addJavascriptInterface",
    listOf("Ljava/lang/Object;", "Ljava/lang/String;"),
    "V",
)

@Suppress("unused")
val customReadingFontPatch = bytecodePatch(
    name = "Custom reading font",
    description = "Renders book text with a font you upload in the reader.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_LIBBY)

    // The shared patch owns the extension DEX and the single /morphe/ hook.
    // Morphe applies dependencies once, so future route users still get one hook.
    dependsOn(webRoutesPatch)

    execute {
        // Register the JS bridge before the WebView loads anything. Libby's own
        // "BRIDGE" is registered in this constructor; adding ours from
        // onPageFinished is too late for the already-loaded page.
        val readerWebView = ReaderWebViewConstructorFingerprint.method
        val bridgeIndex = readerWebView.instructions.indexOfFirst { instruction ->
            instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                instruction is BuilderInstruction35c &&
                instruction.reference == ADD_JAVASCRIPT_INTERFACE
        }
        check(bridgeIndex >= 0) {
            "No addJavascriptInterface call in " +
                "${readerWebView.definingClass}->${readerWebView.name}"
        }
        // Insert after Libby's own call; p0 is the WebView instance.
        readerWebView.addInstructions(
            bridgeIndex + 1,
            """
                invoke-static {p0}, $EXTENSION_BRIDGE->install(Landroid/webkit/WebView;)V
            """,
        )

        // onPageFinished(WebView, String) is an instance method:
        //   p0 = this, p1 = WebView, p2 = url
        // Call our extension first, so the injection happens before the app's own logic.
        WebViewClientOnPageFinishedFingerprint.method.addInstructions(
            0,
            """
                invoke-static {p1, p2}, $EXTENSION_CLASS->onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
            """,
        )

        // onActivityResult(int, int, Intent) is an instance method:
        //   p0 = this, p1 = requestCode, p2 = resultCode, p3 = data
        // The app's base activity inherits this method; call our bridge before it runs.
        ActivityResultFingerprint.method.addInstructions(
            0,
            """
                invoke-static {p1, p2, p3}, $EXTENSION_BRIDGE->onActivityResult(IILandroid/content/Intent;)V
            """,
        )
    }
}
