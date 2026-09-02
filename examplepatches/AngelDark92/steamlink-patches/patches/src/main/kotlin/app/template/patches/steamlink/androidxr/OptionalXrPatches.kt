package app.template.patches.steamlink.androidxr

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.COMPATIBILITIES_STEAM_LINK
import app.template.patches.shared.Constants.COMPATIBILITIES_STEAM_LINK_5002322
import app.template.patches.shared.Constants.COMPATIBILITIES_STEAM_LINK_BEFORE_LATEST
import org.w3c.dom.Document
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
    name = "Appear on top (legacy)",
    description = "Legacy overlay-permission fallback retained for older Steam Link builds. Adds SYSTEM_ALERT_WINDOW and the compositor signal window.",
    default = false,
) {
    // 5002322 uses the recommended permission-free Android-surface trigger instead. Older
    // exact builds retain this selectable TYPE_APPLICATION_OVERLAY fallback, but it is no
    // longer recommended by default.
    compatibleWith(*COMPATIBILITIES_STEAM_LINK_BEFORE_LATEST.toTypedArray())
    dependsOn(
        xrLauncherBootstrapPatch,
        xrPermissionSettingsBootstrapPatch,
        appearOnTopManifestPatch,
    )
}

private const val FOVEA_QUADS_MODE = "single_projection_fovea_quads_v1"
internal const val ANDROID_SURFACE_TRIGGER_MODE = "android_surface_trigger_passthrough_v1"
internal const val ANDROID_SURFACE_TRIGGER_LIBRARY = "libgxr_ast.so"
internal const val ANDROID_SURFACE_TRIGGER_MANIFEST =
    "XR_APILAYER_local_GalaxyXR_android_surface_trigger_passthrough_v1.json"
internal const val ANDROID_SURFACE_TRIGGER_BUILD_ID =
    "android-surface-trigger-forced-probe-v1.1-20260901"
private data class ProjectionModeResources(
    val mode: String,
    val library: String,
    val manifest: String?,
)

private val activeProjectionModes = listOf(
    ProjectionModeResources(
        ANDROID_SURFACE_TRIGGER_MODE,
        ANDROID_SURFACE_TRIGGER_LIBRARY,
        ANDROID_SURFACE_TRIGGER_MANIFEST,
    ),
)

internal fun projectionModesConflict(existingMode: String, requestedMode: String): Boolean =
    existingMode.isNotEmpty() && existingMode != requestedMode &&
        activeProjectionModes.any { it.mode == existingMode }

private val retiredProjectionModes = setOf(
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
)
private val retiredProjectionLibraries = setOf(
    "libgxr_single_projection_reconstruction_efficient_v1.so",
    "libgxr_nsp.so",
    "libgxr_nspd.so",
    "libgxr_nqv.so",
    "libgxr_nqvd.so",
    "libgxr_pst.so",
    "libgxr_nspp.so",
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

private fun projectionModeResource(name: String): ByteArray =
    (object {}.javaClass.getResourceAsStream("/steamlink/androidxr/$name")
        ?: throw PatchException("Missing bundled XR projection-mode resource: $name"))
        .use { it.readBytes() }

private fun installProjectionModeResources(
    libDir: File,
    layerDir: File,
    requested: ProjectionModeResources,
) {
    activeProjectionModes.filterNot { it.mode == requested.mode }.forEach { sibling ->
        val siblingManifestExists = sibling.manifest?.let { File(layerDir, it).exists() } == true
        if (File(libDir, sibling.library).exists() || siblingManifestExists) {
            throw PatchException(
                "Galaxy XR resolution modes are mutually exclusive: " +
                    "${requested.mode} conflicts with ${sibling.mode}",
            )
        }
    }

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
    retiredProjectionLibraries.forEach { library ->
        val retiredFile = File(libDir, library)
        if (retiredFile.exists() && !retiredFile.delete()) {
            throw PatchException("Could not remove retired XR projection resource: ${retiredFile.path}")
        }
    }

    File(libDir, requested.library).writeBytes(projectionModeResource(requested.library))
    requested.manifest?.let { manifest ->
        val layerManifest = File(layerDir, manifest)
        layerManifest.parentFile!!.mkdirs()
        layerManifest.writeBytes(projectionModeResource(manifest))
    }
}

private fun configurePermissionFreeProjectionMode(document: Document, requestedMode: String) {
    val manifest = document.documentElement
    val app = manifest.getElementsByTagName("application").item(0) as Element
    val permissionName = "android.permission.SYSTEM_ALERT_WINDOW"
    val permissionNodes = document.getElementsByTagName("uses-permission")
    val matchingPermissions = (0 until permissionNodes.length)
        .mapNotNull { permissionNodes.item(it) as? Element }
        .filter { it.getAttribute("android:name") == permissionName }

    matchingPermissions.forEach { manifest.removeChild(it) }

    if (!upsertVrLinkUnmanagedFullSpace(document, app)) {
        throw PatchException("Steam Link 5002322 VRLink activity was not found")
    }

    val metadataName = "com.valvesoftware.steamlink.GXR_RESOLUTION_MODE"
    val existingMetadata = app.getElementsByTagName("meta-data").let { nodes ->
        (0 until nodes.length)
            .mapNotNull { nodes.item(it) as? Element }
            .firstOrNull { it.getAttribute("android:name") == metadataName }
    }
    val existingMode = existingMetadata?.getAttribute("android:value").orEmpty()
    if (projectionModesConflict(existingMode, requestedMode)) {
        throw PatchException(
            "Galaxy XR resolution modes are mutually exclusive: " +
                "$requestedMode conflicts with $existingMode",
        )
    }
    val metadata = existingMetadata ?: document.createElement("meta-data").also(app::appendChild)
    metadata.setAttribute("android:name", metadataName)
    metadata.setAttribute("android:value", requestedMode)
}

private val androidSurfaceTriggerResourcesPatch = rawResourcePatch {
    execute {
        if (packageMetadata.versionName != "2.0.22" || packageMetadata.versionCode != "5002322") {
            return@execute
        }
        val sceneFile = get("lib/arm64-v8a/libvrlink_scene.so")
        // This final API-layer fix does not patch libvrlink_scene.so. Accept the guarded
        // changes made by the other recommended patches in any execution order, but fail
        // closed if a retired renderer left an explicit native helper dependency behind.
        retiredNativeProjectionHook(sceneFile.readBytes())?.let { retiredLibrary ->
            throw PatchException(
                "Galaxy XR high-resolution fix found retired native projection hook " +
                    "$retiredLibrary in libvrlink_scene.so. Rebuild from the original APK; " +
                    "retired renderer hooks cannot be migrated safely in place.",
            )
        }
        val helperBytes = projectionModeResource(ANDROID_SURFACE_TRIGGER_LIBRARY)
        if (helperBytes.size < 4 || !helperBytes.copyOfRange(0, 4)
                .contentEquals(byteArrayOf(0x7F, 0x45, 0x4C, 0x46))) {
            throw PatchException(
                "Bundled Android-surface trigger is not an ELF library: " +
                    ANDROID_SURFACE_TRIGGER_LIBRARY,
            )
        }
        val libDir = sceneFile.parentFile!!
        val apkRoot = sceneFile.parentFile!!.parentFile!!.parentFile!!
        val layerDir = File(apkRoot, "assets/openxr/1/api_layers/implicit.d")
        installProjectionModeResources(
            libDir,
            layerDir,
            activeProjectionModes.first { it.mode == ANDROID_SURFACE_TRIGGER_MODE },
        )
    }
}

@Suppress("unused")
val xrGalaxyXrHighResolutionPatch = resourcePatch(
    name = "Galaxy XR high-resolution 3-projection fix",
    description = "Recommended 5002322-only permission-free resolution fix. Preserves Valve's native 3 projections and source formats, including future RGB10_A2, while appending a static 2x2 Android-surface compositor trigger with no image copy or reconstruction.",
    default = true,
) {
    compatibleWith(*COMPATIBILITIES_STEAM_LINK_5002322.toTypedArray())
    dependsOn(
        xrLauncherBootstrapPatch,
        xrPermissionSettingsBootstrapPatch,
        androidSurfaceTriggerResourcesPatch,
    )

    finalize {
        document("AndroidManifest.xml").use { document ->
            configurePermissionFreeProjectionMode(document, ANDROID_SURFACE_TRIGGER_MODE)
        }
    }
}
