package semicoloncolonel.mobilestream.patches.reuters.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.reuters.shared.Constants

// Reuters 8.0.0. Sophi → PaywallKit maps WallDecision to RN. JS uses
// outcome.wallVisibility: "never" | "always" | "meter".
//
// Hardened approach:
//  1. PaywallKitModule + Legacy convertDecisionToMap always return never.
//  2. Optional: same if only one module is present (no hard fail on legacy).
//
// Does not change RevenueCat or article API bodies.

private val NEVER_MAP_SMALI = """
    new-instance v0, Lcom/facebook/react/bridge/WritableNativeMap;
    invoke-direct {v0}, Lcom/facebook/react/bridge/WritableNativeMap;-><init>()V
    new-instance v1, Lcom/facebook/react/bridge/WritableNativeMap;
    invoke-direct {v1}, Lcom/facebook/react/bridge/WritableNativeMap;-><init>()V
    const-string v2, "never"
    const-string v3, "wallVisibility"
    invoke-virtual {v1, v3, v2}, Lcom/facebook/react/bridge/WritableNativeMap;->putString(Ljava/lang/String;Ljava/lang/String;)V
    const/4 v2, 0x0
    const-string v3, "wallVisibilityCode"
    invoke-virtual {v1, v3, v2}, Lcom/facebook/react/bridge/WritableNativeMap;->putInt(Ljava/lang/String;I)V
    const-string v2, "outcome"
    check-cast v1, Lcom/facebook/react/bridge/ReadableMap;
    invoke-virtual {v0, v2, v1}, Lcom/facebook/react/bridge/WritableNativeMap;->putMap(Ljava/lang/String;Lcom/facebook/react/bridge/ReadableMap;)V
    check-cast v0, Lcom/facebook/react/bridge/WritableMap;
    return-object v0
""".trimIndent()

internal object ConvertDecisionToMapFingerprint : Fingerprint(
    definingClass = "Lcom/paywallkit/PaywallKitModule;",
    name = "convertDecisionToMap",
    returnType = "Lcom/facebook/react/bridge/WritableMap;",
    parameters = listOf("Lio/sophi/paywall/WallDecision;"),
)

internal object ConvertDecisionToMapLegacyFingerprint : Fingerprint(
    definingClass = "Lcom/paywallkit/PaywallKitLegacyModule;",
    name = "convertDecisionToMap",
    returnType = "Lcom/facebook/react/bridge/WritableMap;",
    parameters = listOf("Lio/sophi/paywall/WallDecision;"),
)

@Suppress("unused")
val hidePaywallOverlayPatch = bytecodePatch(
    name = "Hide paywall overlay",
    description = "Forces Sophi wall visibility to never on both PaywallKit bridges so paywall/regwall UI is not shown.",
) {
    category("Interface")
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        val primary = ConvertDecisionToMapFingerprint.method
            ?: throw PatchException("PaywallKitModule.convertDecisionToMap not found")
        primary.addInstructions(0, NEVER_MAP_SMALI)

        // Same implementation on legacy; ignore if stripped in a future build.
        ConvertDecisionToMapLegacyFingerprint.methodOrNull
            ?.addInstructions(0, NEVER_MAP_SMALI)
    }
}