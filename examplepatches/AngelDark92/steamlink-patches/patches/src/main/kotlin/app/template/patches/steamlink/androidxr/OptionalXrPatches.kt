package app.template.patches.steamlink.androidxr

import app.template.patches.shared.PatchCategories
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.COMPATIBILITIES_STEAM_LINK
import app.template.patches.shared.Constants.COMPATIBILITIES_STEAM_LINK_HIGH_RESOLUTION
import app.template.patches.shared.Constants.isEarlierStartupSteamLinkBuild
import app.template.patches.shared.Constants.isHighResolutionSteamLinkBuild
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
internal const val ANDROID_SURFACE_TRIGGER_MODE = "android_surface_trigger_passthrough_v1"
internal const val ANDROID_SURFACE_TRIGGER_LIBRARY = "libgxr_ast.so"
internal const val ANDROID_SURFACE_TRIGGER_5001712_RESOURCE_LIBRARY =
    "libgxr_ast_5001712.so"
internal const val ANDROID_SURFACE_TRIGGER_MANIFEST =
    "XR_APILAYER_local_GalaxyXR_android_surface_trigger_passthrough_v1.json"
internal const val ANDROID_SURFACE_TRIGGER_BUILD_ID =
    "android-surface-trigger-3proj-alpha0-v2.0-20261025"
internal const val ANDROID_SURFACE_TRIGGER_5001712_BUILD_ID =
    "android-surface-trigger-2proj-alpha0-v2.0-20261025"
internal data class ProjectionModeResources(
    val mode: String,
    val library: String,
    val manifest: String?,
)

internal const val QUAD_MODE_EXCLUSION_MESSAGE =
    "Choose only one quad-composition mode. Disable the other one and start from a clean APK when switching."

private val activeProjectionModes = listOf(
    ProjectionModeResources(
        ANDROID_SURFACE_TRIGGER_MODE,
        ANDROID_SURFACE_TRIGGER_LIBRARY,
        ANDROID_SURFACE_TRIGGER_MANIFEST,
    ),
    ProjectionModeResources(STOCK_QUAD_MODE, STOCK_QUAD_LIBRARY, STOCK_QUAD_MANIFEST),
    ProjectionModeResources(NATIVE_QUAD_MODE, NATIVE_QUAD_LIBRARY, null),
)

internal fun projectionModesConflict(existingMode: String, requestedMode: String): Boolean =
    existingMode.isNotEmpty() && existingMode != requestedMode &&
        activeProjectionModes.any { it.mode == existingMode }

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
private val retiredProjectionManifests = setOf(
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

internal fun androidSurfaceTriggerResourceLibraryForBuild(
    versionName: String,
    versionCode: String,
): String = if (app.template.patches.shared.Constants.isTwoProjectionSteamLinkBuild(versionName, versionCode)) {
    // 2-projection alpha-0 helper for 5001712/5001812/5001968.
    ANDROID_SURFACE_TRIGGER_5001712_RESOURCE_LIBRARY
} else {
    // 3-projection alpha-0 helper for 5002244/5002363/5002395. This API layer
    // contains no Valve native offsets; the installer applies the exact-build guard.
    ANDROID_SURFACE_TRIGGER_LIBRARY
}

internal fun androidSurfaceTriggerBuildIdForBuild(
    versionName: String,
    versionCode: String,
): String = if (app.template.patches.shared.Constants.isTwoProjectionSteamLinkBuild(versionName, versionCode)) {
    ANDROID_SURFACE_TRIGGER_5001712_BUILD_ID
} else {
    ANDROID_SURFACE_TRIGGER_BUILD_ID
}

/**
 * Relative paths of every retired projection helper and API-layer manifest. Callers materialize
 * or reject these before staging new files; the owning patches keep their own explicit cleanup.
 */
internal fun retiredProjectionResourcePaths(): List<String> = buildList {
    retiredProjectionModes.forEach { mode ->
        add("lib/arm64-v8a/libgxr_$mode.so")
        add("assets/openxr/1/api_layers/implicit.d/XR_APILAYER_local_GalaxyXR_$mode.json")
    }
    retiredProjectionLibraries.forEach { add("lib/arm64-v8a/$it") }
    retiredProjectionManifests.forEach { add("assets/openxr/1/api_layers/implicit.d/$it") }
}

/**
 * Returns the first retired projection helper, layer manifest or retired-mode file left in the
 * decoded APK, or null when the source resources are clean. Callers use this to fail closed
 * before staging new files; the owning patches keep their own explicit cleanup.
 */
internal fun retiredProjectionResourceAt(libDir: File, layerDir: File): File? {
    retiredProjectionModes.forEach { mode ->
        listOf(
            File(libDir, "libgxr_$mode.so"),
            File(layerDir, "XR_APILAYER_local_GalaxyXR_$mode.json"),
        ).firstOrNull(File::exists)?.let { return it }
    }
    retiredProjectionLibraries.forEach { library ->
        File(libDir, library).takeIf(File::exists)?.let { return it }
    }
    retiredProjectionManifests.forEach { manifest ->
        File(layerDir, manifest).takeIf(File::exists)?.let { return it }
    }
    return null
}

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
    retiredProjectionLibraries.forEach { library ->
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

internal fun installProjectionModeResources(
    libDir: File,
    layerDir: File,
    requested: ProjectionModeResources,
    helperBytes: ByteArray,
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

    removeRetiredProjectionResources(libDir, layerDir)

    File(libDir, requested.library).writeBytes(helperBytes)
    requested.manifest?.let { manifest ->
        val layerManifest = File(layerDir, manifest)
        layerManifest.parentFile!!.mkdirs()
        layerManifest.writeBytes(projectionModeResource(manifest))
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
    val existingMode = existingMetadata?.getAttribute("android:value").orEmpty()
    if (projectionModesConflict(existingMode, requestedMode)) {
        throw PatchException(
            "Galaxy XR resolution modes are mutually exclusive: " +
                "$requestedMode conflicts with $existingMode",
        )
    }
    matchingPermissions.forEach { manifest.removeChild(it) }
    val metadata = existingMetadata ?: document.createElement("meta-data").also(app::appendChild)
    metadata.setAttribute("android:name", metadataName)
    metadata.setAttribute("android:value", requestedMode)
}

private const val ALPHA0_STEAM_LINK_PACKAGE = "com.valvesoftware.steamlinkvr"

private fun androidSurfaceTriggerResourcesPatch(
    requestedMode: String,
) = rawResourcePatch {
    execute {
        // Morphe executes dependencies recursively without rechecking compatibility.
        // Keep this build guard inside the mutation itself so an excluded APK stays untouched.
        if (packageMetadata.packageName != ALPHA0_STEAM_LINK_PACKAGE ||
            !isHighResolutionSteamLinkBuild(
                packageMetadata.versionName,
                packageMetadata.versionCode,
            )) {
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
        val requested = activeProjectionModes.first { it.mode == requestedMode }
        val resourceLibrary = if (requested.mode == ANDROID_SURFACE_TRIGGER_MODE) {
            androidSurfaceTriggerResourceLibraryForBuild(
                packageMetadata.versionName,
                packageMetadata.versionCode,
            )
        } else {
            requested.library
        }
        val helperBytes = projectionModeResource(resourceLibrary)
        if (helperBytes.size < 4 || !helperBytes.copyOfRange(0, 4)
                .contentEquals(byteArrayOf(0x7F, 0x45, 0x4C, 0x46))) {
            throw PatchException(
                "Bundled Android-surface trigger is not an ELF library: " +
                    resourceLibrary,
            )
        }
        val libDir = sceneFile.parentFile!!
        val apkRoot = sceneFile.parentFile!!.parentFile!!.parentFile!!
        val layerDir = File(apkRoot, "assets/openxr/1/api_layers/implicit.d")
        if (File(libDir, NATIVE_QUAD_LIBRARY).exists() ||
            sceneFile.readBytes().toString(Charsets.ISO_8859_1).contains(NATIVE_QUAD_LIBRARY)
        ) {
            throw PatchException(QUAD_MODE_EXCLUSION_MESSAGE)
        }
        installProjectionModeResources(
            libDir,
            layerDir,
            requested,
            helperBytes,
        )
    }
}

private val androidSurfaceTriggerResourcesPatch = androidSurfaceTriggerResourcesPatch(
    requestedMode = ANDROID_SURFACE_TRIGGER_MODE,
)

@Suppress("unused")
val alpha0HighResolutionTriggerPatch = resourcePatch(
    name = "Alpha-0 high-resolution trigger",
    description = "Fully transparent high-resolution trigger quad that keeps Valve's native projection layout and formats untouched. " +
        buildLabel(COMPATIBILITIES_STEAM_LINK_HIGH_RESOLUTION),
    default = true,
) {
    category(PatchCategories.IMAGE_QUALITY)
    compatibleWith(*COMPATIBILITIES_STEAM_LINK_HIGH_RESOLUTION.toTypedArray())
    // Renderer formats, including future RGB10_A2, pass through unchanged.
    dependsOn(
        androidSurfaceTriggerResourcesPatch,
    )

    finalize {
        // Dependencies bypass compatibility checks. Never advertise a resolution mode whose
        // matching helper was deliberately skipped for an unverified legacy projection layout.
        if (packageMetadata.packageName != ALPHA0_STEAM_LINK_PACKAGE ||
            !isHighResolutionSteamLinkBuild(packageMetadata.versionName, packageMetadata.versionCode)) {
            return@finalize
        }
        ensureIdsXml(get("res/values/ids.xml"))
        document("AndroidManifest.xml").use { document ->
            configurePermissionFreeProjectionMode(document, ANDROID_SURFACE_TRIGGER_MODE)
        }
    }
}
