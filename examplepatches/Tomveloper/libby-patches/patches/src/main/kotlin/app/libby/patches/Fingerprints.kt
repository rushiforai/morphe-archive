package app.libby.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

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
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
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
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
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
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    filters = listOf(
        methodCall(
            definingClass = "Landroid/webkit/WebView;",
            name = "setWebContentsDebuggingEnabled",
        ),
        string("BRIDGE"),
    ),
)

/**
 * The app's base activity result method (currently `zp0.onActivityResult`),
 * inherited by Activity_Main.
 *
 * It calls the app's activity-result dispatcher (`ob1.i()`), which makes it
 * unique among the four `onActivityResult` overrides in Libby.
 */
object ActivityResultFingerprint : Fingerprint(
    name = "onActivityResult",
    returnType = "V",
    parameters = listOf("I", "I", "Landroid/content/Intent;"),
    accessFlags = listOf(AccessFlags.PUBLIC),
    filters = listOf(
        methodCall(
            definingClass = "Lob1;",
            name = "i",
        ),
    ),
)
