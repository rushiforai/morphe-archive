package io.github.henr1klmb.patches.comparify

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch

private const val RETURN_VOID = "return-void"

private const val RETURN_FALSE = """
    const/4 p0, 0x0
    return p0
"""

private const val RESOLVE_NULL_P2 = """
    const/4 v0, 0x0
    invoke-interface {p2, v0}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V
    return-void
"""

private const val RESOLVE_NULL_P4 = """
    const/4 v0, 0x0
    invoke-interface {p4, v0}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V
    return-void
"""

private const val RESOLVE_FALSE_P1 = """
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
    invoke-interface {p1, v0}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V
    return-void
"""

@Suppress("unused")
val disableTrackingPatch = patch(
    name = "Disable tracking",
    description = "Disables Tracking, Analytics and PairIP license checks.",
) {
    compatibleWith(COMPARIFY_COMPATIBILITY)

    execute {
        // Neutralize PostHog React Native setup and force isEnabled to false
        PosthogReactNativePluginModuleSetupFingerprint.methodOrNull?.addInstructions(
            0,
            RESOLVE_NULL_P4.trimIndent(),
        )

        PosthogReactNativePluginModuleIsEnabledFingerprint.methodOrNull?.addInstructions(
            0,
            RESOLVE_FALSE_P1.trimIndent(),
        )

        // Neutralize Sentry Native SDK initialization
        RNSentryModuleInitNativeSdkFingerprint.methodOrNull?.addInstructions(
            0,
            RESOLVE_NULL_P2.trimIndent(),
        )

        // Neutralize Sentry ContentProviders
        SentryInitProviderOnCreateFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_FALSE.trimIndent(),
        )

        SentryPerformanceProviderOnCreateFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_FALSE.trimIndent(),
        )

        // Neutralize Firebase ContentProvider auto-initialization
        FirebaseInitProviderOnCreateFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_FALSE.trimIndent(),
        )

        // Neutralize PairIP anti-tampering license check on modified APKs
        LicenseClientCheckLicenseFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_VOID,
        )
    }
}
