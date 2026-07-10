package app.template.patches.rphypertrophy

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.template.patches.pairip.disablePairIpLicenseCheckPatch
import app.template.patches.shared.Constants.RP_HYPERTROPHY_COMPATIBILITY
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val SUBSCRIPTION_ENDPOINT = "/api/user/subscriptions"
private const val SUBSCRIPTION_RESPONSE_SMALI =
    "{\\\"activeSubscriptions\\\":[{\\\"access\\\":[\\\"training\\\"],\\\"platform\\\":\\\"android\\\"}],\\\"consumedIaps\\\":[{\\\"access\\\":[\\\"training\\\"]}],\\\"stripeIds\\\":[]}"

@Suppress("unused")
val rpHypertrophyUnlockPremiumPatch = bytecodePatch(
    name = "Unlock RP Hypertrophy Premium",
    description = "Unlock all Paid features",
    default = true
) {
    compatibleWith(RP_HYPERTROPHY_COMPATIBILITY)
    dependsOn(disablePairIpLicenseCheckPatch)

    execute {
        val webClientClass = RpHypertrophyWebViewClientClassFingerprint.classDef
        val method = MutableMethod(
            ImmutableMethod(
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
                MutableMethodImplementation(5)
            )
        ).apply {
            addInstructions(
                0,
                """
                invoke-interface {p2}, Landroid/webkit/WebResourceRequest;->getUrl()Landroid/net/Uri;
                move-result-object v0
                if-eqz v0, :return_null

                invoke-virtual {v0}, Landroid/net/Uri;->getPath()Ljava/lang/String;
                move-result-object v0
                const-string v1, "$SUBSCRIPTION_ENDPOINT"
                invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :return_null

                new-instance v0, Landroid/webkit/WebResourceResponse;
                const-string v1, "application/json"
                const-string v2, "UTF-8"
                const-string v3, "$SUBSCRIPTION_RESPONSE_SMALI"
                invoke-virtual {v3, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
                move-result-object v3
                new-instance v4, Ljava/io/ByteArrayInputStream;
                invoke-direct {v4, v3}, Ljava/io/ByteArrayInputStream;-><init>([B)V
                invoke-direct {v0, v1, v2, v4}, Landroid/webkit/WebResourceResponse;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;)V
                return-object v0

                :return_null
                const/4 v0, 0x0
                return-object v0
                """.trimIndent()
            )
        }

        webClientClass.methods.add(method)
    }
}
