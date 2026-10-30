/*
 * Derived from hoo-dles' "Enable Premium" patch for RP Hypertrophy
 * (https://github.com/hoo-dles/morphe-patches), GPL-3.0.
 *
 * Differences from the original:
 * - Depends on my own "Disable Pairip license check" patch, which no-ops the
 *   license check entirely instead of faking a successful server response.
 * - Synthesizes the WebResourceResponse directly instead of forwarding the
 *   request to RP's server to copy its status/headers. Verified safe: the app
 *   calls the endpoint same-origin (https://training.rpstrength.com), so no
 *   CORS or header fidelity is required.
 */

package app.braintropy.patches.rphypertrophy

import app.braintropy.patches.all.pairip.disableLicenseCheckPatch
import app.braintropy.patches.shared.Constants.COMPATIBILITY_RP_HYPERTROPHY
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

// shortcut: assumes the subscriptions endpoint stays same-origin. If RP moves
// the API to another origin with credentialed requests, the response needs
// Access-Control-Allow-* headers (6-arg WebResourceResponse constructor).
private const val ENDPOINT = "/api/user/subscriptions"
private const val RESPONSE =
    "{\\\"activeSubscriptions\\\":[{\\\"access\\\":[\\\"training\\\"],\\\"platform\\\":\\\"android\\\"}]," +
        "\\\"consumedIaps\\\":[{\\\"access\\\":[\\\"training\\\"]}],\\\"stripeIds\\\":[]}"

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Enables app features locked behind the subscription paywall.",
    default = true
) {
    category("Unlock")
    compatibleWith(COMPATIBILITY_RP_HYPERTROPHY)
    dependsOn(disableLicenseCheckPatch)

    execute {
        val webClientClass = WebViewClientFingerprint.classDef

        // The class extends WebViewClient and does not override
        // shouldInterceptRequest, so the override is simply appended.
        val method = ImmutableMethod(
            webClientClass.type,
            "shouldInterceptRequest",
            listOf(
                ImmutableMethodParameter("Landroid/webkit/WebView;", null, "view"),
                ImmutableMethodParameter("Landroid/webkit/WebResourceRequest;", null, "request")
            ),
            "Landroid/webkit/WebResourceResponse;",
            AccessFlags.PUBLIC.value,
            null,
            null,
            MutableMethodImplementation(7) // 4 locals (v0-v3) + 3 parameters (p0-p2)
        )
        val interceptor = MutableMethod(method)
        webClientClass.methods.add(interceptor)

        interceptor.addInstructions(
            """
                invoke-interface { p2 }, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;
                move-result-object v0
                invoke-virtual { v0 }, Landroid/net/Uri;->getPath()Ljava/lang/String;
                move-result-object v0
                const-string v1, "$ENDPOINT"
                invoke-virtual { v1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :ignore
                const-string v0, "$RESPONSE"
                const-string v1, "UTF-8"
                invoke-virtual { v0, v1 }, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
                move-result-object v0
                new-instance v1, Ljava/io/ByteArrayInputStream;
                invoke-direct { v1, v0 }, Ljava/io/ByteArrayInputStream;-><init>([B)V
                new-instance v0, Landroid/webkit/WebResourceResponse;
                const-string v2, "application/json"
                const-string v3, "UTF-8"
                invoke-direct { v0, v2, v3, v1 }, Landroid/webkit/WebResourceResponse;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;)V
                return-object v0
                :ignore
                const/4 v0, 0x0
                return-object v0
            """
        )
    }
}
