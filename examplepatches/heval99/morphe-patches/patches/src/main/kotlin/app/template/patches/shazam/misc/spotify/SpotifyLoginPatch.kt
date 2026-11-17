package app.template.patches.shazam.misc.spotify

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patcher.util.returnEarly
import app.template.patches.shared.addInstructionsWithLabelsChecked
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import org.w3c.dom.Element

private const val EXTENSION_CLASS_DESCRIPTOR =
    "Lapp/template/extension/shazam/SpotifyBrowserLoginPatch;"
internal const val REDIRECT_RECEIVER_ACTIVITY =
    "app.template.extension.shazam.SpotifyRedirectReceiverActivity"

// Shazam's Spotify redirect URI is shazam-spotifyoauth://spotifylogincallback/free
// (SpotifyAuthFlowActivity); the stock manifest has no filter for it, since the WebView dialog
// caught the redirect in-process.
internal const val REDIRECT_SCHEME = "shazam-spotifyoauth"
internal const val REDIRECT_HOST = "spotifylogincallback"

private val spotifyRedirectReceiverManifestPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { doc ->
            val application = doc.getElementsByTagName("application").item(0) as? Element
                ?: throw PatchException("AndroidManifest.xml has no <application>")

            fun element(tag: String, vararg attributes: Pair<String, String>) =
                doc.createElement(tag).apply { attributes.forEach { (k, v) -> setAttribute(k, v) } }

            val filter = element("intent-filter").apply {
                appendChild(element("action", "android:name" to "android.intent.action.VIEW"))
                appendChild(element("category", "android:name" to "android.intent.category.DEFAULT"))
                appendChild(element("category", "android:name" to "android.intent.category.BROWSABLE"))
                appendChild(element("data", "android:scheme" to REDIRECT_SCHEME, "android:host" to REDIRECT_HOST))
            }
            application.appendChild(
                element(
                    "activity",
                    "android:name" to REDIRECT_RECEIVER_ACTIVITY,
                    "android:exported" to "true",
                    "android:excludeFromRecents" to "true",
                    "android:noHistory" to "true",
                    "android:theme" to "@android:style/Theme.Translucent.NoTitleBar",
                ).apply { appendChild(filter) },
            )
        }
    }
}

/**
 * Part of Shazam's "Spoof signature". The bundled Spotify Auth SDK 1.2.3 hands the login to the
 * installed Spotify app, which checks the calling app's real signing certificate in its own
 * process, so a re-signed Shazam always gets "You could not be connected to Spotify". Reporting
 * the Spotify app as unavailable makes AuthorizationClient fall through to WebViewAuthHandler,
 * whose WebView login page Spotify no longer supports (issue #62: the email step resets,
 * Facebook never redirects back, Google refuses WebViews). So that handler now opens the login
 * in a browser tab (Custom Tab when the browser supports it, as Spotify's own SDK 2.x does) and
 * the extension's receiver activity catches the redirect; the WebView dialog stays as the
 * fallback when no browser is installed. No certificate is involved in either path.
 */
internal val spotifyLoginPatch = bytecodePatch {
    dependsOn(spotifyRedirectReceiverManifestPatch)

    extendWith("extensions/shazam.mpe")

    execute {
        SpotifyNativeStartAuthActivityFingerprint.method.returnEarly(false)

        // The extension reaches these through reflection; make a rename fail here, not at login.
        AuthorizationRequestToUriFingerprint.method
        val fromUri = AuthorizationResponseFromUriFingerprint.method
        if (!AccessFlags.STATIC.isSet(fromUri.accessFlags)) {
            throw PatchException("$AUTHORIZATION_RESPONSE.fromUri(Uri) is no longer static")
        }
        val listener = classDefBy(ON_COMPLETE_LISTENER)
        for (name in listOf("onComplete", "onCancel")) {
            if (listener.methods.none { it.name == name }) {
                throw PatchException("$ON_COMPLETE_LISTENER has no $name()")
            }
        }

        WebViewAuthHandlerStartFingerprint.method.apply {
            // The hook uses v0 as scratch; with no local register it would overwrite `this`.
            if (implementation!!.registerCount <= 3) {
                throw PatchException("$WEBVIEW_AUTH_HANDLER.start has no local register for the hook")
            }
            // The listener the AuthorizationClient set before start(); the dialog gets the same one.
            val listenerField = implementation!!.instructions.firstNotNullOfOrNull { insn ->
                if (insn.opcode != Opcode.IGET_OBJECT) return@firstNotNullOfOrNull null
                ((insn as ReferenceInstruction).reference as FieldReference)
                    .takeIf { it.definingClass == WEBVIEW_AUTH_HANDLER && it.type == ON_COMPLETE_LISTENER }
            } ?: throw PatchException("$WEBVIEW_AUTH_HANDLER.start no longer reads its completion listener")

            addInstructionsWithLabelsChecked(
                0,
                """
                    iget-object v0, p0, $WEBVIEW_AUTH_HANDLER->${listenerField.name}:$ON_COMPLETE_LISTENER
                    invoke-static { p1, p2, v0 }, $EXTENSION_CLASS_DESCRIPTOR->openInBrowser(Landroid/app/Activity;Ljava/lang/Object;Ljava/lang/Object;)Z
                    move-result v0
                    if-eqz v0, :webview
                    return v0
                """,
                ExternalLabel("webview", getInstruction(0)),
            )
        }
    }
}
