package dev.brave.patches.ui

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.morphe.patcher.string
import dev.brave.patches.shared.COMPATIBILITY_BRAVE

internal object BraveOriginCachedSummaryFingerprint : Fingerprint(
    definingClass = "Lrj2;",
    name = "c",
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        string("brave_origin_credential_summary_cached")
    )
)

internal object BraveOriginSubscriptionActiveFingerprint : Fingerprint(
    definingClass = "Lrj2;",
    name = "d",
    returnType = "Z",
    parameters = listOf("Lorg/chromium/chrome/browser/profiles/Profile;"),
    filters = listOf(
        string("brave.origin.subscription_active_android")
    )
)

@Suppress("unused")
val braveOriginPatch = patch(
    name = "Brave Origin",
    description = "Unlocks Brave Origin feature switches across Rewards, News, Wallet, Leo AI, and VPN."
) {
    compatibleWith(COMPATIBILITY_BRAVE)

    execute {
        BraveOriginCachedSummaryFingerprint.method.apply {
            addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """.trimIndent()
            )
        }

        BraveOriginSubscriptionActiveFingerprint.method.apply {
            addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """.trimIndent()
            )
        }
    }
}
