package io.github.jordanwoodson.patches.twitch.portals

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import io.github.jordanwoodson.patches.shared.Locators
import io.github.jordanwoodson.patches.twitch.shared.twitchMatch

/** Smali descriptor of the extension's portal class. */
internal const val PORTALS = "Lio/github/jordanwoodson/extension/shared/twitch/TwitchPortals;"

private val SSL_ERROR_PARAMETERS =
    listOf("Landroid/webkit/WebView;", "Landroid/webkit/SslErrorHandler;", "Landroid/net/http/SslError;")
private val INTERCEPT_PARAMETERS = listOf("Landroid/webkit/WebView;", "Landroid/webkit/WebResourceRequest;")

// Capacitor plugin (its name is kept: Capacitor finds plugins by class) that gives a portal's bridge Twitch's
// WebViewClient, the one portals opened as a PortalFragment (Create Clip, Report, Sign up) load in.
private object BridgeClientPluginFingerprint : Fingerprint(
    definingClass = "Ltv/twitch/android/shared/portal/TwitchBridgeWebViewClientPlugin;", name = "load",
    returnType = "V", parameters = emptyList(),
    filters = listOf(methodCall(definingClass = "Landroid/webkit/WebView;", name = "setWebViewClient")),
)

// The WebViewClient of Twitch's own portal view (TwitchPortalView, its fork of Capacitor's bridge), which logs
// each certificate error before reporting it.
private object PortalViewSslErrorFingerprint : Fingerprint(
    name = "onReceivedSslError", returnType = "V", parameters = SSL_ERROR_PARAMETERS,
    strings = listOf("onReceivedSslError(view="),
)

/** A portal WebViewClient's overrides the portal patches hook. */
internal class PortalClient(val type: String, val sslError: MutableMethod, val intercept: MutableMethod)

private fun Method.isOverride(name: String, parameters: List<String>, returnType: String) =
    this.name == name && this.returnType == returnType && parameterTypes.map { it.toString() } == parameters &&
        implementation != null

/**
 * Both portal WebViewClients. Each overrides onReceivedSslError, which reports every certificate error to the
 * portal (a failed load: Create Clip closes), and shouldInterceptRequest, which serves the page's local assets.
 */
context(context: BytecodePatchContext)
internal fun portalClients(): List<PortalClient> {
    val load = BridgeClientPluginFingerprint.twitchMatch("portal bridge WebViewClient plugin").originalMethod
    val bridge = load.implementation!!.instructions.filter { it.opcode == Opcode.NEW_INSTANCE }
        .map { ((it as ReferenceInstruction).reference as TypeReference).type }.distinct()
        .filter { type ->
            context.classDefByOrNull(type)?.methods?.any { it.isOverride("onReceivedSslError", SSL_ERROR_PARAMETERS, "V") } == true
        }
        .singleOrNull() ?: throw PatchException("Twitch: the portal bridge's WebViewClient changed")
    Locators.record("twitch.portals.bridge_client", bridge)
    val view = PortalViewSslErrorFingerprint.twitchMatch("portal view certificate errors").originalClassDef.type
    if (view == bridge) throw PatchException("Twitch: the two portal WebViewClients are one class")
    Locators.record("twitch.portals.view_client", view)
    return listOf(bridge, view).map { type ->
        val methods = context.mutableClassDefBy(type).methods
        fun override(name: String, parameters: List<String>, returnType: String) =
            methods.singleOrNull { it.isOverride(name, parameters, returnType) }
                ?: throw PatchException("Twitch: portal WebViewClient $type has no $name override")
        PortalClient(
            type,
            override("onReceivedSslError", SSL_ERROR_PARAMETERS, "V"),
            override("shouldInterceptRequest", INTERCEPT_PARAMETERS, "Landroid/webkit/WebResourceResponse;"),
        )
    }
}
