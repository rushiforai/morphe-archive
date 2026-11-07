// Scoped HT Media entries — all thin wrappers depending on the universal
// implementations (no app-specific fingerprints were written; no HT Media APK
// was decompiled in this build environment). Unverified on device.
package app.template.patches.htmedia

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.HINDUSTAN_TIMES_COMPATIBILITY
import app.template.patches.shared.Constants.MINT_COMPATIBILITY
import app.template.patches.shared.logUniversal
import app.template.patches.shared.media.disableAutoplayPatch
import app.template.patches.shared.misc.externalBrowserPatch

@Suppress("unused")
val mintDisableAutoplayPatch = bytecodePatch(
    name = "Mint: Disable video autoplay (ExoPlayer)",
    description = """
        Stops video autoplay in the Mint feed/article bodies (ExoPlayer/Media3)
        using the same heuristic as 'Disable video autoplay (ExoPlayer/Media3)'.

        Applies to com.htmedia.mint only. Heuristic; see the universal entry for
        limitations. Unverified on device.
    """.trimIndent(),
    default = false,
) {
    compatibleWith(MINT_COMPATIBILITY)
    dependsOn(disableAutoplayPatch)

    execute {
        logUniversal("Mint: enabling ExoPlayer autoplay block.")
    }
}

@Suppress("unused")
val hindustanTimesDisableAutoplayPatch = bytecodePatch(
    name = "Hindustan Times: Disable video autoplay (ExoPlayer)",
    description = """
        Stops video autoplay in the Hindustan Times feed/article bodies
        (ExoPlayer/Media3) using the same heuristic as 'Disable video autoplay
        (ExoPlayer/Media3)'.

        Applies to com.ht.news only. Heuristic; see the universal entry for
        limitations. Unverified on device.
    """.trimIndent(),
    default = false,
) {
    compatibleWith(HINDUSTAN_TIMES_COMPATIBILITY)
    dependsOn(disableAutoplayPatch)

    execute {
        logUniversal("Hindustan Times: enabling ExoPlayer autoplay block.")
    }
}

@Suppress("unused")
val mintPreferExternalBrowserPatch = bytecodePatch(
    name = "Mint: Prefer external browser over Custom Tabs",
    description = """
        Opens links in the default external browser instead of an in-app Custom
        Tab, using the same rewrite as the universal 'Prefer external browser
        over Custom Tabs' patch.

        Applies to com.htmedia.mint only. Some article WebViews are not affected
        — this covers Custom Tabs / CustomTabsIntent call sites only.
        Unverified on device.
    """.trimIndent(),
    default = false,
) {
    compatibleWith(MINT_COMPATIBILITY)
    dependsOn(externalBrowserPatch)

    execute {
        logUniversal("Mint: enabling external browser over Custom Tabs.")
    }
}

@Suppress("unused")
val hindustanTimesPreferExternalBrowserPatch = bytecodePatch(
    name = "Hindustan Times: Prefer external browser over Custom Tabs",
    description = """
        Opens links in the default external browser instead of an in-app Custom
        Tab, using the same rewrite as the universal 'Prefer external browser
        over Custom Tabs' patch.

        Applies to com.ht.news only. Some article WebViews are not affected —
        this covers Custom Tabs / CustomTabsIntent call sites only.
        Unverified on device.
    """.trimIndent(),
    default = false,
) {
    compatibleWith(HINDUSTAN_TIMES_COMPATIBILITY)
    dependsOn(externalBrowserPatch)

    execute {
        logUniversal("Hindustan Times: enabling external browser over Custom Tabs.")
    }
}
