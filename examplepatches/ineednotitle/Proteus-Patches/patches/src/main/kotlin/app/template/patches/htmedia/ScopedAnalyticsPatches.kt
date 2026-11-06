// Scoped entries for HT Media's news apps.
// These apply the SAME heuristic as the universal "Block analytics & tracking SDKs"
// patch (see shared/privacy/BlockAnalyticsSdksPatch.kt) — no app-specific
// fingerprints were written because no APK was available in the build sandbox.
// They exist so the option appears under the Mint / Hindustan Times apps in the
// patcher. Unverified on device. No Mint/HT APK has been decompiled by this bundle.
package app.template.patches.htmedia

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.HINDUSTAN_TIMES_COMPATIBILITY
import app.template.patches.shared.Constants.MINT_COMPATIBILITY
import app.template.patches.shared.logUniversal
import app.template.patches.shared.privacy.blockAnalyticsSdksPatch

@Suppress("unused")
val mintBlockAnalyticsSdksPatch = bytecodePatch(
    name = "Mint: Block analytics & tracking SDKs",
    description = """
        Blocks Mint's analytics & tracking SDKs (Firebase Analytics, AppsFlyer, Adjust,
        WebEngage, CleverTap and similar) using the same universal heuristic as
        'Block analytics & tracking SDKs'.

        Applies to com.htmedia.mint only. Heuristic; obfuscated or reflection-based
        reporting is not covered. Unverified on device.
    """.trimIndent(),
    default = false,
) {
    compatibleWith(MINT_COMPATIBILITY)
    dependsOn(blockAnalyticsSdksPatch)

    execute {
        logUniversal("Mint: enabling universal heuristic analytics blocking.")
    }
}

@Suppress("unused")
val hindustanTimesBlockAnalyticsSdksPatch = bytecodePatch(
    name = "Hindustan Times: Block analytics & tracking SDKs",
    description = """
        Blocks Hindustan Times' analytics & tracking SDKs (Firebase Analytics,
        AppsFlyer, Adjust, WebEngage, CleverTap and similar) using the same universal
        heuristic as 'Block analytics & tracking SDKs'.

        Applies to com.ht.news only. Heuristic; obfuscated or reflection-based
        reporting is not covered. Unverified on device.
    """.trimIndent(),
    default = false,
) {
    compatibleWith(HINDUSTAN_TIMES_COMPATIBILITY)
    dependsOn(blockAnalyticsSdksPatch)

    execute {
        logUniversal("Hindustan Times: enabling universal heuristic analytics blocking.")
    }
}
