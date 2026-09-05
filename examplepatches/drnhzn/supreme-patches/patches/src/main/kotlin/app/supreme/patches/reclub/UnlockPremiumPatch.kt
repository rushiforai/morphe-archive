package app.supreme.patches.reclub

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.supreme.patches.shared.Constants.COMPATIBILITY_RECLUB

private const val EXTENSION_CLASS = "Lapp/supreme/extension/UnlockPremiumHelper;"

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock premium",
    description = "Unlock Reclub Supporter via backend entitlements API and RevenueCat bridge.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_RECLUB)

    extendWith("extensions/extension.mpe")

    execute {
        OkHttpClientBuilderFingerprint.method.addInstructions(
            17,
            """
                invoke-static {v0}, $EXTENSION_CLASS->addEntitlementsInterceptor(Lokhttp3/OkHttpClient${'$'}Builder;)Lokhttp3/OkHttpClient${'$'}Builder;
                move-result-object v0
            """,
        )

        // Custom OkHttpClientFactory clients skip createClientBuilder().
        OkHttpCreateClientFingerprint.method.addInstructions(
            6,
            """
                invoke-static {v0}, $EXTENSION_CLASS->wrapOkHttpClient(Lokhttp3/OkHttpClient;)Lokhttp3/OkHttpClient;
                move-result-object v0
            """,
        )

        OkHttpCreateClientContextFingerprint.method.addInstructions(
            8,
            """
                invoke-static {v0}, $EXTENSION_CLASS->wrapOkHttpClient(Lokhttp3/OkHttpClient;)Lokhttp3/OkHttpClient;
                move-result-object v0
            """,
        )

        EntitlementInfoIsActiveFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )

        EntitlementInfoMapFingerprint.method.addInstructions(
            0,
            """
                move-object v0, p0
                invoke-virtual {v0}, Lcom/revenuecat/purchases/EntitlementInfo;->getIdentifier()Ljava/lang/String;
                move-result-object v0
                invoke-static {v0}, $EXTENSION_CLASS->fakeEntitlementMap(Ljava/lang/String;)Ljava/util/Map;
                move-result-object v0
                return-object v0
            """,
        )

        EntitlementInfosMapFingerprint.method.addInstructions(
            0,
            """
                invoke-static {}, $EXTENSION_CLASS->fakeEntitlementsMap()Ljava/util/Map;
                move-result-object v0
                return-object v0
            """,
        )

        CustomerInfoMapFingerprint.method.addInstructions(
            0,
            """
                invoke-static {}, $EXTENSION_CLASS->fakeCustomerInfoMap()Ljava/util/Map;
                move-result-object v0
                return-object v0
            """,
        )
    }
}
