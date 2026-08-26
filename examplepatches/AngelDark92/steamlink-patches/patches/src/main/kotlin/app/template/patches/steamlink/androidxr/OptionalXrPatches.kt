package app.template.patches.steamlink.androidxr

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.COMPATIBILITIES_STEAM_LINK
import app.template.patches.shared.Constants.COMPATIBILITIES_STEAM_LINK_EXPERIMENTAL
import org.w3c.dom.Element
import java.io.File

private val unrestrictedBatteryManifestPatch = resourcePatch {
    finalize {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            val app = manifest.getElementsByTagName("application").item(0) as Element
            val permission = "android.permission.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS"
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
val unrestrictedBatteryUsagePatch = bytecodePatch(
    name = "Unrestricted battery usage",
    description = "Opens Android's per-app Battery usage page at startup so Unrestricted can be selected for XR streaming.",
    default = true,
) {
    compatibleWith(*COMPATIBILITIES_STEAM_LINK.toTypedArray())
    // Restore the legacy automatic foundation while its native-build guards make it a no-op.
    dependsOn(
        xrLauncherBootstrapPatch,
        xrPermissionSettingsBootstrapPatch,
        unrestrictedBatteryManifestPatch,
    )
}

private val appearOnTopManifestPatch = resourcePatch {
    finalize {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            val app = manifest.getElementsByTagName("application").item(0) as Element
            // Required by GxrOverlayBridge to add a TYPE_APPLICATION_OVERLAY compositor signal window
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
    description = "Adds SYSTEM_ALERT_WINDOW to the manifest so GalaxyXRPermissionActivity can request overlay permission at startup.",
    default = true,
) {
    compatibleWith(*COMPATIBILITIES_STEAM_LINK.toTypedArray())
    dependsOn(
        xrLauncherBootstrapPatch,
        xrPermissionSettingsBootstrapPatch,
        appearOnTopManifestPatch,
    )
}

private fun resolutionTraceResource(name: String): ByteArray =
    (object {}.javaClass.getResourceAsStream("/steamlink/androidxr/$name")
        ?: throw PatchException("Missing bundled resolution trace resource: $name"))
        .use { it.readBytes() }

private fun projectionDiagnosticLayerPatch(mode: String) = rawResourcePatch {
    execute {
        val libraryName = "libgxr_$mode.so"
        val manifestName = "XR_APILAYER_local_GalaxyXR_$mode.json"
        val libDir = get("lib/arm64-v8a/libvrlink_scene.so").parentFile!!
        val layerDir = get("assets/openxr/1/api_layers/implicit.d/$manifestName").parentFile!!
        val otherProjectionLayers = layerDir.listFiles()
            ?.filter {
                it.name.startsWith("XR_APILAYER_local_GalaxyXR_projection_") &&
                    it.name != manifestName
            }
            .orEmpty()
        if (otherProjectionLayers.isNotEmpty()) {
            throw PatchException(
                "Select exactly one XR projection diagnostic patch; already present: " +
                    otherProjectionLayers.joinToString { it.name },
            )
        }
        File(libDir, libraryName).writeBytes(resolutionTraceResource(libraryName))

        val layerManifest = File(layerDir, manifestName)
        layerManifest.parentFile!!.mkdirs()
        layerManifest.writeBytes(resolutionTraceResource(manifestName))
    }
}

private val projectionTraceControlLayerPatch =
    projectionDiagnosticLayerPatch("projection_trace_control")
private val projectionSettingsQualityLayerPatch =
    projectionDiagnosticLayerPatch("projection_settings_quality")
private val projectionSettingsStrippedLayerPatch =
    projectionDiagnosticLayerPatch("projection_settings_stripped")

private fun projectionExperimentPatch(
    name: String,
    description: String,
    mode: String,
) = resourcePatch(
    name = name,
    description = description,
    default = false,
) {
    compatibleWith(*COMPATIBILITIES_STEAM_LINK_EXPERIMENTAL.toTypedArray())
    // Legacy builds retain their complete launcher foundation. Every legacy mutation is guarded
    // off on native-XR builds, where only the minimal permission/probe bootstrap remains active.
    dependsOn(xrLauncherBootstrapPatch, xrPermissionSettingsBootstrapPatch)
    when (mode) {
        "projection_trace_control" -> dependsOn(projectionTraceControlLayerPatch)
        "projection_settings_quality" -> dependsOn(projectionSettingsQualityLayerPatch)
        "projection_settings_stripped" -> dependsOn(projectionSettingsStrippedLayerPatch)
        else -> throw PatchException("Unknown XR projection experiment mode: $mode")
    }

    finalize {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            val app = manifest.getElementsByTagName("application").item(0) as Element
            val permissionName = "android.permission.SYSTEM_ALERT_WINDOW"
            val permissionNodes = document.getElementsByTagName("uses-permission")
            val matchingPermissions = (0 until permissionNodes.length)
                .mapNotNull { permissionNodes.item(it) as? Element }
                .filter { it.getAttribute("android:name") == permissionName }

            matchingPermissions.forEach { manifest.removeChild(it) }

            val metadataName = "com.valvesoftware.steamlink.GXR_RESOLUTION_MODE"
            val existingMetadata = app.getElementsByTagName("meta-data").let { nodes ->
                (0 until nodes.length)
                    .mapNotNull { nodes.item(it) as? Element }
                    .firstOrNull { it.getAttribute("android:name") == metadataName }
            }
            val metadata = existingMetadata ?: document.createElement("meta-data").also(app::appendChild)
            metadata.setAttribute("android:name", metadataName)
            metadata.setAttribute("android:value", mode)
        }
    }
}

@Suppress("unused")
val xrProjectionTraceControlPatch = projectionExperimentPatch(
    name = "XR projection trace control",
    description = "Read-only permission-free control. Forwards Steam Link frames unchanged while tracing its foveated projection composition.",
    mode = "projection_trace_control",
)

@Suppress("unused")
val xrProjectionSettingsQualityPatch = projectionExperimentPatch(
    name = "XR projection quality settings",
    description = "Permission-free A/B. Requests quality supersampling and sharpening on Steam Link projection layers when the enabled runtime extension supports it.",
    mode = "projection_settings_quality",
)

@Suppress("unused")
val xrProjectionSettingsStrippedPatch = projectionExperimentPatch(
    name = "XR projection settings stripped",
    description = "Permission-free A/B. Removes only known FB projection-settings nodes while preserving all other layer metadata and failing open when unsafe.",
    mode = "projection_settings_stripped",
)
