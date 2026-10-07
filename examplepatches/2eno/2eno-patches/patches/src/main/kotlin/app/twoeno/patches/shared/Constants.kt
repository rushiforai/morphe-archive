package app.twoeno.patches.shared

import app.morphe.patcher.patch.Compatibility

internal const val EXTENSION = "extensions/twoeno.mpe"

internal const val EXTENSION_PACKAGE = "Lapp/twoeno/extension"

object Constants {
    // "version = null" (the default target) means the patches find their targets by fingerprints
    // and are expected to work with the latest app version.

    val COMPATIBILITY_SPOTIFY = Compatibility(
        name = "Spotify",
        packageName = "com.spotify.music",
        appIconColor = 0x1ED760,
    )

    val COMPATIBILITY_KLEINANZEIGEN = Compatibility(
        name = "Kleinanzeigen",
        packageName = "com.ebay.kleinanzeigen",
    )

    val COMPATIBILITY_UNTAPPD = Compatibility(
        name = "Untappd",
        packageName = "com.untappdllc.app",
    )

    val COMPATIBILITY_INTERPALS = Compatibility(
        name = "InterPals",
        packageName = "net.interpals",
    )
}
