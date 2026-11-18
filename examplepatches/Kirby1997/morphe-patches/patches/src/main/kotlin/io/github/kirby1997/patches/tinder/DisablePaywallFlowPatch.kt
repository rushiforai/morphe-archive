package io.github.kirby1997.patches.tinder

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import io.github.kirby1997.patches.shared.Constants

// LaunchPaywallFlow.invoke (obfuscated to method `c`) is the central entry that
// every paywallflow-routed paywall passes through. Returning immediately stops
// every popup that funnels through it without chasing individual entry points.
// Tradeoff: also blocks user-initiated upgrade flows from Settings.
object LaunchPaywallFlowInvokeFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Luc1/a;", "Landroidx/appcompat/app/n;"),
    definingClass = "Lcom/tinder/feature/paywallflow/internal/delegates/a;",
    name = "c",
)

@Suppress("unused")
val disablePaywallFlowPatch = bytecodePatch(
    name = "Disable paywall flow",
    description = "Short-circuits the central LaunchPaywallFlow entry. Suppresses every paywall routed through paywallflow but also disables legitimate purchase flows.",
    default = true,
) {
    compatibleWith(Constants.TINDER)

    execute {
        LaunchPaywallFlowInvokeFingerprint.method.addInstructions(
            0,
            """
                return-void
            """,
        )
    }
}
