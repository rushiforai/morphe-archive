package app.richyss.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    /**
     * Discord for Android.
     *
     * The Richyss patches only add a self-contained, opt-in bridge to the client
     * (a ContentProvider plus an initializer call in the Application class), so they
     * do not depend on Discord's obfuscated internals. They are still shipped as
     * experimental for "any" version because no exhaustive matrix of Discord builds
     * could be validated in the build environment that produced this release.
     */
    val COMPATIBILITY_DISCORD = Compatibility(
        name = "Discord",
        packageName = "com.discord",
        apkFileType = ApkFileType.APK,
        // Discord's blurple icon background.
        appIconColor = 0x5865F2,
        targets = listOf(
            AppTarget(
                version = null,
                isExperimental = true,
                description = "Any Discord for Android build that exposes an Application class in its manifest."
            )
        )
    )

    /** Authority of the ContentProvider injected into Discord. */
    const val BRIDGE_AUTHORITY = "com.discord.richyss.bridge"

    /** Fully qualified name of the injected ContentProvider. */
    const val BRIDGE_PROVIDER_CLASS = "app.richyss.extension.BridgeProvider"

    /** Package names allowed to talk to the bridge. */
    val BRIDGE_ALLOWED_PACKAGES = listOf("com.richyss.app", "com.richyss.app.debug")

    /** Version of the bridge wire protocol, reported to Richyss. */
    const val BRIDGE_PROTOCOL_VERSION = "1"

    /** Version written to the Discord manifest as meta-data. */
    const val BRIDGE_MANIFEST_VERSION = "1.0.0"
}
