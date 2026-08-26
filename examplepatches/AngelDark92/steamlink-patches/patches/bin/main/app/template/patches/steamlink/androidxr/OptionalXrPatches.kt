package app.template.patches.steamlink.androidxr

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.COMPATIBILITY_STEAM_LINK
import app.template.patches.shared.Constants.COMPATIBILITY_STEAM_LINK_EXPERIMENTAL
import org.w3c.dom.Element

private fun loadOptionalXrResource(name: String): ByteArray =
    (object {}.javaClass.getResourceAsStream("/steamlink/androidxr/$name")
        ?: error("Missing bundled resource: steamlink/androidxr/$name"))
        .use { it.readBytes() }

private val appearOnTopManifestPatch = resourcePatch {
    finalize {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            val app = manifest.getElementsByTagName("application").item(0) as Element
            val permission = "android.permission.SYSTEM_ALERT_WINDOW"
            val permissions = document.getElementsByTagName("uses-permission")
            val exists = (0 until permissions.length)
                .mapNotNull { permissions.item(it) as? Element }
                .any { it.getAttribute("android:name") == permission }
            if (!exists) {
                val element = document.createElement("uses-permission")
                element.setAttribute("android:name", permission)
                manifest.insertBefore(element, app)
            }
        }
    }
}

@Suppress("unused")
val appearOnTopPatch = bytecodePatch(
    name = "Appear on top",
    description = "Recommended. Adds SYSTEM_ALERT_WINDOW to the manifest so GalaxyXRPermissionActivity can request overlay permission at startup.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_STEAM_LINK)
    dependsOn(xrLauncherBootstrapPatch, appearOnTopManifestPatch)
}

private val noOverlayTestSmaliPatch = rawResourcePatch {
    execute {
        get("smali/com/valvesoftware/steamlink/GxrOverlayBridge.smali")
            .writeBytes(loadOptionalXrResource("smali/test_variants/GxrOverlayBridge_NoOverlay.smali"))
        get("smali/com/valvesoftware/steamlink/GalaxyXRPermissionActivity.smali")
            .writeBytes(loadOptionalXrResource("smali/test_variants/GalaxyXRPermissionActivity_NoOverlay_NoPermission.smali"))
    }
}

@Suppress("unused")
val overlayBaselineTestPatch = bytecodePatch(
    name = "TEST EXPERIMENTAL - Baseline Overlay Flow",
    description = "A/B test baseline. Keeps launcher bootstrap plus overlay permission flow (Appear on top behavior). Enable this OR the No-Overlay test patch, not both.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_STEAM_LINK_EXPERIMENTAL)
    dependsOn(xrLauncherBootstrapPatch, appearOnTopManifestPatch)
}

@Suppress("unused")
val noOverlayNoPermissionTestPatch = rawResourcePatch(
    name = "TEST EXPERIMENTAL - No Overlay / No Permission",
    description = "A/B test variant. Replaces GalaxyXRPermissionActivity and GxrOverlayBridge with no-overlay/no-permission-request smali for crash reproduction and comparison.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_STEAM_LINK_EXPERIMENTAL)
    dependsOn(xrLauncherBootstrapPatch, noOverlayTestSmaliPatch)
}
