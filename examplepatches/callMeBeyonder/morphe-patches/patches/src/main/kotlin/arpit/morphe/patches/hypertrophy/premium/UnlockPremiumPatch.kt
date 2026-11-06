package arpit.morphe.patches.hypertrophy.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import arpit.morphe.patches.hypertrophy.shared.Constants.COMPATIBILITY_HYPERTROPHY
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

/**
 * Suffix of the path the web app uses to read the account's subscription state.
 * It is requested from the API host, so the path is `/api/user/subscriptions`.
 */
private const val SUBSCRIPTIONS_PATH = "/user/subscriptions"

/**
 * Subscription payload the web app expects. It only checks
 * `activeSubscriptions[].access` for `training` and the platform, so a single
 * synthetic entry is enough to unlock every paid screen.
 */
private const val SUBSCRIPTIONS_JSON =
    "{\"activeSubscriptions\":[{\"access\":[\"training\"],\"platform\":\"android\"}]," +
        "\"consumedIaps\":[{\"access\":[\"training\"]}]}"

/**
 * Unlocks RP Hypertrophy Premium.
 *
 * The Android app is a WebView shell around `training.rpstrength.com`; all paid
 * UI is rendered by the web app, which decides access from a single request to
 * `apps.rpstrength.com/api/user/subscriptions`. The patch adds a
 * `shouldInterceptRequest` override to the shell's `WebViewClient` that answers
 * that request with a subscription marked as active for `training` and lets
 * every other request pass through to the real network.
 *
 * A second, unrelated gate is handled because a sideload has to get past it:
 * PairIP's `LicenseClient.checkLicense` reports `NOT_LICENSED` for any re-signed
 * build, starts its paywall and schedules a shutdown. It is neutralized here;
 * this build has no PairIP signature check and no VM payload to preserve.
 *
 * Server-side account data (workout history, coach programs) still comes from
 * the real API and is not affected.
 */
@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Unlocks the premium training features by answering the web app's " +
        "subscription request with an active `training` subscription, and disables the " +
        "PairIP license check so the re-signed build does not open its paywall. " +
        "Account data that the server owns is not affected.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_HYPERTROPHY)

    execute {
        // PairIP: a re-signed sideload is never "licensed" to Play, so the check
        // would open LicenseActivity and kill the process after 30 seconds.
        LicenseCheckFingerprint.method.addInstructions(0, "return-void")

        val webClientClass = WebViewClientFingerprint.classDef

        // The body needs five locals (v0–v4) plus `this` and the two parameters.
        val implementation = MutableMethodImplementation(8)
        val method = MutableMethod(
            ImmutableMethod(
                webClientClass.type,
                "shouldInterceptRequest",
                listOf(
                    ImmutableMethodParameter("Landroid/webkit/WebView;", null, "view"),
                    ImmutableMethodParameter(
                        "Landroid/webkit/WebResourceRequest;",
                        null,
                        "request",
                    ),
                ),
                "Landroid/webkit/WebResourceResponse;",
                AccessFlags.PUBLIC.value,
                null,
                null,
                implementation,
            )
        )

        method.addInstructions(
            0,
            """
                invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;
                move-result-object v0

                invoke-virtual {v0}, Landroid/net/Uri;->getPath()Ljava/lang/String;
                move-result-object v0

                if-eqz v0, :original

                const-string v1, "$SUBSCRIPTIONS_PATH"
                invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
                move-result v0

                if-eqz v0, :original

                invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getMethod()Ljava/lang/String;
                move-result-object v0

                const-string v1, "GET"
                invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v0

                if-eqz v0, :original

                new-instance v0, Ljava/util/HashMap;
                invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

                invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getRequestHeaders()Ljava/util/Map;
                move-result-object v1

                const-string v2, "Origin"
                invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object v1

                check-cast v1, Ljava/lang/String;

                const-string v2, "Access-Control-Allow-Origin"
                if-eqz v1, :no_origin

                invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                goto :after_origin

                :no_origin
                const-string v1, "*"
                invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                :after_origin
                const-string v1, "Access-Control-Allow-Credentials"
                const-string v2, "true"
                invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                const-string v1, "Content-Type"
                const-string v2, "application/json"
                invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                const-string v1, "UTF-8"
                const-string v2, "${SUBSCRIPTIONS_JSON.replace("\"", "\\\"")}"
                invoke-virtual {v2, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
                move-result-object v2

                new-instance v3, Ljava/io/ByteArrayInputStream;
                invoke-direct {v3, v2}, Ljava/io/ByteArrayInputStream;-><init>([B)V

                new-instance v2, Landroid/webkit/WebResourceResponse;
                const-string v4, "application/json"
                invoke-direct {v2, v4, v1, v3}, Landroid/webkit/WebResourceResponse;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;)V

                invoke-virtual {v2, v0}, Landroid/webkit/WebResourceResponse;->setResponseHeaders(Ljava/util/Map;)V

                return-object v2

                :original
                invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->shouldInterceptRequest(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;
                move-result-object v0
                return-object v0
            """,
        )

        webClientClass.methods.add(method)
    }
}
