package app.template.patches.steamlink.androidxr

import app.template.patches.shared.PatchCategories
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.COMPATIBILITIES_STEAM_LINK
import app.template.patches.shared.Constants.isEarlierStartupSteamLinkBuild
import app.template.patches.shared.buildLabel
import org.w3c.dom.Document
import org.w3c.dom.Element
import java.io.File

// Morphe runs dependencies without re-checking compatibility: the manifest edit must stay inert on
// any other package and on any build this patch does not list (legacy bases plus the native pairs).
internal fun isUnrestrictedBatteryTarget(packageName: String, version: String, versionCode: String): Boolean =
    packageName == CONTROLLER_STEAM_LINK_PACKAGE &&
        (isEarlierStartupSteamLinkBuild(version, versionCode) ||
            isNativeBatterySettingsBuild(version, versionCode))

private val unrestrictedBatteryManifestPatch = resourcePatch {
    execute {
        if (!isUnrestrictedBatteryTarget(
                packageMetadata.packageName, packageMetadata.versionName, packageMetadata.versionCode,
            )
        ) {
            return@execute
        }
        ensureIdsXml(get("res/values/ids.xml"))
    }
    finalize {
        if (!isUnrestrictedBatteryTarget(
                packageMetadata.packageName, packageMetadata.versionName, packageMetadata.versionCode,
            )
        ) {
            return@finalize
        }
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
    description = "Opens Android's Battery usage page at startup so XR streaming can run unrestricted. " +
        buildLabel(COMPATIBILITIES_STEAM_LINK),
    default = true,
) {
    category(PatchCategories.STARTUP_AND_PERMISSIONS)
    compatibleWith(*COMPATIBILITIES_STEAM_LINK.toTypedArray())
    // Restore the legacy automatic foundation while its native-build guards make it a no-op.
    dependsOn(
        xrPermissionSettingsBootstrapPatch,
        unrestrictedBatteryManifestPatch,
        nativeBatterySettingsPatch,
    )
}

private const val FOVEA_QUADS_MODE = "single_projection_fovea_quads_v1"
private val retiredProjectionModes = setOf(
    // Surface-video was shipped under both the generic v1 name and the trigger-payload name.
    // Keep both so reapplication cleans whichever name a previous patch left behind.
    "surface_video_v1", // Tried on 2026-09-11; low-resolution output. Cleanup only.
    "surface_video_trigger_v1",
    "foveal_canvas", // Retired 2026-10-24; did not solve high resolution. Cleanup only.
    "android_surface_fovea_v1", // Tried on 2026-09-07; user reported it did not work.
    "android_surface_underside_projection_v1",
    "android_surface_trigger_warmup_omit_v1",
    "android_surface_trigger_dfr_rearm_v1",
    "single_projection_reconstruction_v1",
    FOVEA_QUADS_MODE,
    "projection_trace_control",
    "projection_settings_quality",
    "projection_settings_stripped",
    "vrlink_unmanaged_full_space",
    "projection_metadata_compat_v2",
    "two_projection_drop_base_v1",
    "three_projection_sampler_proxy_v1",
    "single_projection_reconstruction_efficient_v1",
    "single_projection_native_renderer_v1",
    "single_projection_native_renderer_dual_v1",
    "single_projection_native_quad_zero_copy_v1",
    "single_projection_native_quad_zero_copy_dual_v1",
    "permission_surface_trace_v1",
    "single_projection_native_probe_v1",
    // Alpha-0 high-resolution trigger, retired 2026-11-06 in favour of Stock quad composition.
    "android_surface_trigger_passthrough_v1",
)
private val retiredProjectionLibraries = setOf(
    // Surface-video helper was also shipped as the trigger payload; clean both names.
    "libgxr_surface_video.so",
    "libgxr_surface_video_trigger.so",
    "libgxr_asf.so",
    "libgxr_ast_underside.so",
    "libgxr_ast_warmup_omit.so",
    "libgxr_ast_dfr_rearm.so",
    "libgxr_single_projection_reconstruction_efficient_v1.so",
    "libgxr_nsp.so",
    "libgxr_nspd.so",
    "libgxr_nqv.so",
    "libgxr_nqvd.so",
    "libgxr_pst.so",
    "libgxr_nspp.so",
    // Retired swapchain-enlarge / atlas-surface layers and hybrid codec helper. Cleanup only.
    "libgxr_swapchain_enlarge.so",
    "libgxr_atlas_surface.so",
    "libgxr_hybrid_codec.so",
)
// Alpha-0 helpers were API layers only (never referenced from libvrlink_scene.so), so they are
// removed on reapplication but are not scanned for as a native renderer hook.
private val retiredAlpha0Libraries = setOf("libgxr_ast.so", "libgxr_ast_5001712.so")
private val retiredProjectionManifests = setOf(
    "XR_APILAYER_local_GalaxyXR_android_surface_trigger_passthrough_v1.json",
    "XR_APILAYER_local_GalaxyXR_surface_video_trigger_v1.json",
    "XR_APILAYER_local_GalaxyXR_swapchain_enlarge_v1.json",
    "XR_APILAYER_local_GalaxyXR_atlas_surface_v1.json",
)

private fun ByteArray.containsAscii(value: String): Boolean {
    val needle = value.toByteArray(Charsets.US_ASCII)
    if (needle.isEmpty() || size < needle.size) return false
    return (0..(size - needle.size)).any { offset ->
        needle.indices.all { index -> this[offset + index] == needle[index] }
    }
}

internal fun retiredNativeProjectionHook(sceneBytes: ByteArray): String? =
    retiredProjectionLibraries.firstOrNull(sceneBytes::containsAscii)

internal fun projectionModeResource(name: String): ByteArray =
    (object {}.javaClass.getResourceAsStream("/steamlink/androidxr/$name")
        ?: throw PatchException("Missing bundled XR projection-mode resource: $name"))
        .use { it.readBytes() }

/**
 * Deletes every retired projection-mode file from [libDir] and [layerDir].
 * Throws [PatchException] if a retired file exists and cannot be deleted, so callers never
 * stage new resources on top of stale layers.
 */
internal fun removeRetiredProjectionResources(libDir: File, layerDir: File) {
    retiredProjectionModes.forEach { mode ->
        listOf(
            File(libDir, "libgxr_$mode.so"),
            File(layerDir, "XR_APILAYER_local_GalaxyXR_$mode.json"),
        ).forEach { retiredFile ->
            if (retiredFile.exists() && !retiredFile.delete()) {
                throw PatchException("Could not remove retired XR projection resource: ${retiredFile.path}")
            }
        }
    }
    (retiredProjectionLibraries + retiredAlpha0Libraries).forEach { library ->
        val retiredFile = File(libDir, library)
        if (retiredFile.exists() && !retiredFile.delete()) {
            throw PatchException("Could not remove retired XR projection resource: ${retiredFile.path}")
        }
    }
    retiredProjectionManifests.forEach { manifest ->
        val retiredFile = File(layerDir, manifest)
        if (retiredFile.exists() && !retiredFile.delete()) {
            throw PatchException("Could not remove retired XR projection resource: ${retiredFile.path}")
        }
    }
}

internal fun configurePermissionFreeProjectionMode(document: Document, requestedMode: String) {
    val manifest = document.documentElement
    val app = manifest.getElementsByTagName("application").item(0) as Element
    val permissionName = "android.permission.SYSTEM_ALERT_WINDOW"
    val permissionNodes = document.getElementsByTagName("uses-permission")
    val matchingPermissions = (0 until permissionNodes.length)
        .mapNotNull { permissionNodes.item(it) as? Element }
        .filter { it.getAttribute("android:name") == permissionName }

    val metadataName = "com.valvesoftware.steamlink.GXR_RESOLUTION_MODE"
    val existingMetadata = app.getElementsByTagName("meta-data").let { nodes ->
        (0 until nodes.length)
            .mapNotNull { nodes.item(it) as? Element }
            .firstOrNull { it.getAttribute("android:name") == metadataName }
    }
    // A retired mode (including Alpha-0) left by an earlier patch run is simply overwritten.
    matchingPermissions.forEach { manifest.removeChild(it) }
    val metadata = existingMetadata ?: document.createElement("meta-data").also(app::appendChild)
    metadata.setAttribute("android:name", metadataName)
    metadata.setAttribute("android:value", requestedMode)
}
