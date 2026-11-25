package app.infinity.patches.api

import app.infinity.patches.shared.Constants.COMPATIBILITY_INFINITY
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction

private const val EXTENSION_CLASS = "Lapp/template/extension/infinity/ModifyWebViewPatch;"

/**
 * Port of Patcheddit's "Modify login WebView". Routes every `WebView.loadUrl` call through
 * the extension, which swaps in a Chrome user agent and enables JavaScript on Reddit's
 * login and authorize pages; without that, the in-app login loops or shows a blank page.
 *
 * 8.3.4 has three call sites (`LoginActivity`, `WebViewActivity` and the obfuscated
 * AppAuth helper `lp3`), all the 2-argument overload. Only login URLs are altered, so
 * hooking every site is harmless and keeps the patch independent of obfuscated names.
 */
@Suppress("unused")
val modifyLoginWebViewPatch = bytecodePatch(
    name = "Modify login WebView (Infinity)",
    description = "Modifies the WebView used for logging into Reddit to prevent login issues.",
    default = true
) {
    compatibleWith(*COMPATIBILITY_INFINITY)

    extendWith("extensions/extension.mpe")

    execute {
        Fingerprint(
            filters = listOf(
                methodCall(
                    definingClass = "Landroid/webkit/WebView;",
                    name = "loadUrl"
                )
            ),
            custom = { _, classDef -> !classDef.type.startsWith("Lapp/template/") }
        ).matchAll().forEach { match ->
            val index = match.instructionMatches[0].index
            val instruction = match.instructionMatches[0].instruction as? FiveRegisterInstruction
                ?: throw PatchException(
                    "Unexpected range invoke of WebView.loadUrl in ${match.method.definingClass}"
                )

            // Same registers, now passed to a static method: the WebView becomes argument 0.
            val call = when (instruction.registerCount) {
                2 -> "invoke-static { v${instruction.registerC}, v${instruction.registerD} }, " +
                        "$EXTENSION_CLASS->loadUrl(Landroid/webkit/WebView;Ljava/lang/String;)V"
                else -> "invoke-static { v${instruction.registerC}, v${instruction.registerD}, " +
                        "v${instruction.registerE} }, " +
                        "$EXTENSION_CLASS->loadUrl(Landroid/webkit/WebView;Ljava/lang/String;Ljava/util/Map;)V"
            }
            match.method.replaceInstruction(index, call)
        }
    }
}
