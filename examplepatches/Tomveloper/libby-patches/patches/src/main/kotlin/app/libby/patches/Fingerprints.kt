package app.libby.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Finds the WebViewClient subclass that Libby uses for its WebViews.
 *
 * The class name is obfuscated and changes every release, so it is not used here.
 * Instead we match:
 *  - the method name, which cannot be obfuscated because it overrides a framework method
 *  - the exact framework signature
 *  - a log string that is unique to this implementation
 */
object WebViewClientOnPageFinishedFingerprint : Fingerprint(
    name = "onPageFinished",
    returnType = "V",
    parameters = listOf("Landroid/webkit/WebView;", "Ljava/lang/String;"),
    isStatic = false,
    filters = listOf(string("onPageFinished - ")),
)

/**
 * The API 21+ request interception method in the same obfuscated WebViewClient
 * as [WebViewClientOnPageFinishedFingerprint].
 *
 * Using the class fingerprint avoids hardcoding the class name (`jp1` in 9.5.0)
 * and avoids matching unrelated WebViewClient implementations.
 */
object WebViewClientShouldInterceptRequestFingerprint : Fingerprint(
    classFingerprint = WebViewClientOnPageFinishedFingerprint,
    name = "shouldInterceptRequest",
    returnType = "Landroid/webkit/WebResourceResponse;",
    parameters = listOf("Landroid/webkit/WebView;", "Landroid/webkit/WebResourceRequest;"),
    isStatic = false,
)

/**
 * Libby's reader WebView subclass (currently `ip1`).
 *
 * Matched as a constructor because the class name is obfuscated. The constructor
 * signature is stable, and the `BRIDGE` string identifies the WebView that gets
 * Libby's JavaScript bridge.
 */
object ReaderWebViewConstructorFingerprint : Fingerprint(
    name = "<init>",
    returnType = "V",
    parameters = listOf(
        "Lcom/overdrive/mobile/android/nautilus/NautilusApp;",
        "Z",
    ),
    filters = listOf(
        methodCall(
            definingClass = "Landroid/webkit/WebView;",
            name = "setWebContentsDebuggingEnabled",
        ),
        string("BRIDGE"),
    ),
)

/**
 * The authentication WebView fragment (currently `vq0`), which inflates
 * `fragment_webview_auth`. It also calls `setWebContentsDebuggingEnabled(false)`,
 * which would switch debugging back off for the whole process.
 *
 * The method name is obfuscated (`A`), so this matches on the framework signature,
 * the debug call, and the `BRIDGE` string instead.
 */
object AuthWebViewFragmentFingerprint : Fingerprint(
    returnType = "Landroid/view/View;",
    parameters = listOf(
        "Landroid/view/LayoutInflater;",
        "Landroid/view/ViewGroup;",
        "Landroid/os/Bundle;",
    ),
    isStatic = false,
    filters = listOf(
        methodCall(
            definingClass = "Landroid/webkit/WebView;",
            name = "setWebContentsDebuggingEnabled",
        ),
        string("BRIDGE"),
    ),
)

/**
 * The app's base activity result method (currently `aq0.onActivityResult`),
 * inherited by Activity_Main.
 *
 * Matching does not depend on obfuscated names. Among the several
 * `onActivityResult` overrides in Libby, only this one delegates to the app's
 * own superclass implementation with `invoke-super` instead of calling
 * `Activity.onActivityResult` directly. That structural trait survives R8
 * renaming the classes involved on every release.
 */
object ActivityResultFingerprint : Fingerprint(
    name = "onActivityResult",
    returnType = "V",
    parameters = listOf("I", "I", "Landroid/content/Intent;"),
    isStatic = false,
    custom = { method, _ ->
        method.implementation?.instructions?.any { instruction ->
            if (instruction.opcode != Opcode.INVOKE_SUPER) return@any false
            if (instruction !is ReferenceInstruction) return@any false
            val reference = instruction.reference as? MethodReference ?: return@any false
            reference.name == "onActivityResult" &&
                reference.definingClass != "Landroid/app/Activity;" &&
                reference.parameterTypes == listOf("I", "I", "Landroid/content/Intent;") &&
                reference.returnType == "V"
        } == true
    },
)
