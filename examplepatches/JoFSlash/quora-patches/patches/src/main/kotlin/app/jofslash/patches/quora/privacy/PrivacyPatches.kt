package app.jofslash.patches.quora.privacy

import app.jofslash.patches.quora.shared.Constants.COMPATIBILITY_QUORA
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction

internal object AdvertisingIdTaskFingerprint : Fingerprint(
    definingClass = "Lcom/quora/android/util/AdvertisingIDTask;",
    name = "doInBackground",
    returnType = "Lcom/quora/android/util/QJSONObject;",
    parameters = listOf("[Ljava/lang/Void;"),
)

internal object GetClipboardDataFingerprint : Fingerprint(
    definingClass = "Lcom/quora/android/util/ClipboardUtil;",
    name = "getClipboardData",
    returnType = "Ljava/lang/String;",
    parameters = listOf("Landroid/app/Activity;"),
)

internal object GetClipboardTextFingerprint : Fingerprint(
    definingClass = "Lcom/quora/android/util/ClipboardUtil;",
    name = "getClipboardText",
    returnType = "Ljava/lang/String;",
    parameters = listOf("Landroid/app/Activity;"),
)

private val SET_WEB_DEBUGGING = methodCall(
    definingClass = "Landroid/webkit/WebView;",
    name = "setWebContentsDebuggingEnabled",
)

// QWebView turns debugging on every time it loads a page.
internal object WebViewLoadDebuggingFingerprint : Fingerprint(
    definingClass = "Lcom/quora/android/fragments/qwvf/QWebView;",
    filters = listOf(SET_WEB_DEBUGGING),
)

// Quora's pages can also turn it on with a setNativeDebuggable message.
internal object MessageDebuggingFingerprint : Fingerprint(
    definingClass = "Lcom/quora/android/messages/QWebViewMessageHandler;",
    filters = listOf(SET_WEB_DEBUGGING),
)

@Suppress("unused")
val blockAdvertisingIdPatch = bytecodePatch(
    name = "Block advertising ID",
    description = "Stops the app from sending your advertising ID and Android ID to Quora.",
    default = true
) {
    compatibleWith(COMPATIBILITY_QUORA)

    execute {
        // onPostExecute only sends the IDs when the result is not null.
        AdvertisingIdTaskFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """
        )
    }
}

@Suppress("unused")
val blockClipboardReadingPatch = bytecodePatch(
    name = "Block clipboard reading",
    description = "Stops Quora's pages from reading what you copied. Pasting with the keyboard still works.",
    default = true
) {
    compatibleWith(COMPATIBILITY_QUORA)

    execute {
        // Both are only used to hand the clipboard to the page.
        listOf(GetClipboardDataFingerprint, GetClipboardTextFingerprint).forEach {
            it.method.addInstructions(
                0,
                """
                    const-string v0, ""
                    return-object v0
                """
            )
        }
    }
}

@Suppress("unused")
val disableWebViewDebuggingPatch = bytecodePatch(
    name = "Disable WebView debugging",
    description = "Stops the app from letting a connected computer inspect its pages, " +
            "which would show your account's cookies.",
    default = true
) {
    compatibleWith(COMPATIBILITY_QUORA)

    execute {
        listOf(WebViewLoadDebuggingFingerprint, MessageDebuggingFingerprint).forEach { fingerprint ->
            fingerprint.method.apply {
                val index = fingerprint.instructionMatches.first().index
                val register = getInstruction<FiveRegisterInstruction>(index).registerC
                addInstruction(index, "const/4 v$register, 0x0")
            }
        }
    }
}
