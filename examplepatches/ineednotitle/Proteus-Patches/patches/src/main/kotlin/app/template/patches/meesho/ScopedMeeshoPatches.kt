// Scoped Meesho entries — all thin wrappers depending on the universal
// implementations (no app-specific fingerprints were written; no Meesho APK
// was decompiled in this build environment). Unverified on device.
// Meesho is pinned to XAPK split bundles (ApkFileType.XAPK).
package app.template.patches.meesho

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.MEESHO_COMPATIBILITY
import app.template.patches.shared.logUniversal
import app.template.patches.shared.media.disableAutoplayPatch
import app.template.patches.shared.misc.externalBrowserPatch
import app.template.patches.shared.privacy.blockAnalyticsSdksPatch

@Suppress("unused")
val meeshoBlockAnalyticsSdksPatch = bytecodePatch(
    name = "Meesho: Block analytics & tracking SDKs",
    description = """
        Blocks Meesho's analytics & tracking SDKs (Firebase Analytics, AppsFlyer,
        Adjust, Facebook AppEvents, WebEngage, CleverTap and similar) using the
        same universal heuristic as 'Block analytics & tracking SDKs'.

        Applies to com.meesho.shopping only. Heuristic; obfuscated or
        reflection-based reporting is not covered. Unverified on device.
    """.trimIndent(),
    default = false,
) {
    compatibleWith(MEESHO_COMPATIBILITY)
    dependsOn(blockAnalyticsSdksPatch)

    execute {
        logUniversal("Meesho: enabling universal heuristic analytics blocking.")
    }
}

@Suppress("unused")
val meeshoDisableAutoplayPatch = bytecodePatch(
    name = "Meesho: Disable video autoplay (ExoPlayer)",
    description = """
        Stops video autoplay in the Meesho feed and product videos (ExoPlayer/Media3)
        using the same heuristic as 'Disable video autoplay (ExoPlayer/Media3)'.

        Applies to com.meesho.shopping only. Heuristic; see the universal entry
        for limitations. Unverified on device.
    """.trimIndent(),
    default = false,
) {
    compatibleWith(MEESHO_COMPATIBILITY)
    dependsOn(disableAutoplayPatch)

    execute {
        logUniversal("Meesho: enabling ExoPlayer autoplay block.")
    }
}

@Suppress("unused")
val meeshoPreferExternalBrowserPatch = bytecodePatch(
    name = "Meesho: Prefer external browser over Custom Tabs",
    description = """
        Opens links in the default external browser instead of an in-app Custom
        Tab, using the same rewrite as the universal 'Prefer external browser
        over Custom Tabs' patch.

        Applies to com.meesho.shopping only. Covers Custom Tabs /
        CustomTabsIntent call sites only. Unverified on device.
    """.trimIndent(),
    default = false,
) {
    compatibleWith(MEESHO_COMPATIBILITY)
    dependsOn(externalBrowserPatch)

    execute {
        logUniversal("Meesho: enabling external browser over Custom Tabs.")
    }
}
