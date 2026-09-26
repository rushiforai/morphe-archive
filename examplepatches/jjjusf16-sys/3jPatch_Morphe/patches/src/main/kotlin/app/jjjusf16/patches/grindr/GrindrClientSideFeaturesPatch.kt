package app.jjjusf16.patches.grindr

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode

/**
 * Grindr keeps client feature switches in an R8-obfuscated enum whose original
 * feature names remain as strings. Its entitlement helper checks `whiteList`
 * before consulting the authenticated feature set received from the server.
 *
 * This fingerprint is intentionally version-specific. The class and method
 * names are obfuscated and must be re-verified for every Grindr release.
 */
private object GrindrFeatureRegistryInitFingerprint : Fingerprint(
    definingClass = "Lm6e;",
    name = "<clinit>",
    returnType = "V",
    parameters = emptyList(),
    strings = listOf(
        "HideBannerAds",
        "HideFullScreenAds",
        "HidePlusStore",
        "HideXtraStore",
        "HideUnlimitedStore",
        "HidePremiumStore",
        "RewardedAdFreeSession",
    ),
)

@Suppress("unused")
val grindrClientSideFeaturesPatch = bytecodePatch(
    name = "Grindr Client-side Cleanup",
    description = "Enables Grindr's built-in client flags for hiding banner/full-screen ads " +
        "and subscription-store surfaces. Server-backed premium entitlements are not changed.",
    default = true,
) {
    compatibleWith(
        Compatibility(
            name = "Grindr",
            packageName = "com.grindrapp.android",
            targets = listOf(AppTarget(version = "26.17.0")),
        )
    )

    execute {
        val featureRegistryInit = GrindrFeatureRegistryInitFingerprint.method
        val implementation = checkNotNull(featureRegistryInit.implementation) {
            "Grindr: feature registry static initializer has no implementation"
        }
        val returnIndex = implementation.instructions.indexOfLast {
            it.opcode == Opcode.RETURN_VOID
        }
        check(returnIndex >= 0) {
            "Grindr: feature registry static initializer has no return-void"
        }

        // Add only client-owned presentation flags. Do not whitelist UnsentMessage,
        // Incognito, ViewedMe, Roaming, translation, boosts, or other features whose
        // data/actions are authorized by Grindr's servers.
        featureRegistryInit.addInstructions(
            returnIndex,
            """
                sget-object v0, Lm6e;->whiteList:Ljava/util/Set;

                sget-object v1, Lm6e;->HideBannerAds:Lm6e;
                invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

                sget-object v1, Lm6e;->HideFullScreenAds:Lm6e;
                invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

                sget-object v1, Lm6e;->RewardedAdFreeSession:Lm6e;
                invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

                sget-object v1, Lm6e;->HidePlusStore:Lm6e;
                invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

                sget-object v1, Lm6e;->HideXtraStore:Lm6e;
                invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

                sget-object v1, Lm6e;->HideUnlimitedStore:Lm6e;
                invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

                sget-object v1, Lm6e;->HidePremiumStore:Lm6e;
                invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
            """
        )
    }
}
