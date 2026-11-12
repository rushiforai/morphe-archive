package app.template.patches.steamlink.androidxr

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.template.patches.shared.Constants.COMPATIBILITIES_STEAM_LINK_FAR_PLANE
import app.template.patches.shared.Constants.isNativeQuadFarPlaneSteamLinkBuild
import app.template.patches.shared.PatchCategories
import app.template.patches.shared.buildLabel
import app.template.patches.steamlink.binary.NATIVE_QUAD_FAR_DEFAULT_DISTANCE
import app.template.patches.steamlink.binary.NATIVE_QUAD_FAR_DISTANCES
import app.template.patches.steamlink.binary.NATIVE_QUAD_FAR_SETTINGS_KEEP
import app.template.patches.steamlink.binary.NATIVE_QUAD_FAR_SETTINGS_NONE
import app.template.patches.steamlink.binary.applyNativeQuadFarPlaneScene
import app.template.patches.steamlink.binary.applyNativeQuadFarSlot
import app.template.patches.steamlink.binary.isNativeQuadFarPayload
import app.template.patches.steamlink.binary.isNativeQuadFarPlanePatched
import app.template.patches.steamlink.binary.validateNativeQuadFarPayload
import java.io.File
import java.nio.file.Files
import java.nio.file.Path
import java.nio.file.StandardCopyOption
import org.w3c.dom.Document
import org.w3c.dom.Element

internal const val NATIVE_QUAD_MODE = "native_quad_far_plane_v1"
internal const val LEGACY_NATIVE_QUAD_MODE = "native_quad_v1"
internal const val NATIVE_QUAD_LIBRARY = "libgxr_quad_native.so"
private const val STEAM_LINK_PACKAGE = "com.valvesoftware.steamlinkvr"
private const val FAR_PLANE_RESOURCE = "/steamlink/nativequad/far/libgxr_quad_native.so"

/** Loads the bundled far-plane payload (the helper compiled with the distance/settings slot). */
internal fun nativeQuadFarResource(): ByteArray =
    (object {}.javaClass.getResourceAsStream(FAR_PLANE_RESOURCE)
        ?: throw PatchException("Missing bundled far-plane resource: $FAR_PLANE_RESOURCE"))
        .use { it.readBytes() }

/**
 * Installs the standalone far-plane helper and scene mutation into an unpacked APK. Returns false,
 * touching nothing, for any package or build outside the single exact 2.0.20/5001712 registry.
 *
 * Rejects, before any write, an Alpha-0 or stock-quad projection mode, a retired projection
 * helper or layer manifest, a retired renderer hook, a stale stock scene, and any installed helper
 * that is not the pinned far-plane payload (including the removed 1.2 native-quad helper). Writes
 * are staged together and rolled back on failure.
 */
internal fun installNativeQuadFarPlane(
    apkRoot: File,
    packageName: String,
    versionName: String,
    versionCode: String,
    meters: Int,
    settings: Int,
    farPayload: ByteArray? = null,
    applyScene: (ByteArray, String, String) -> ByteArray = ::applyNativeQuadFarPlaneScene,
    moveFile: (Path, Path) -> Unit = { source, target ->
        Files.move(source, target, StandardCopyOption.REPLACE_EXISTING)
    },
): Boolean {
    // Dependencies bypass Morphe compatibility. Leave every other package/build untouched.
    if (packageName != STEAM_LINK_PACKAGE || !isNativeQuadFarPlaneSteamLinkBuild(versionName, versionCode)) {
        return false
    }
    if (meters !in NATIVE_QUAD_FAR_DISTANCES) {
        throw PatchException("Far plane: unsupported quad distance $meters")
    }
    if (settings != NATIVE_QUAD_FAR_SETTINGS_KEEP && settings != NATIVE_QUAD_FAR_SETTINGS_NONE) {
        throw PatchException("Far plane: unsupported layer-settings mode $settings")
    }

    val sceneFile = File(apkRoot, "lib/arm64-v8a/libvrlink_scene.so")
    if (!sceneFile.isFile) {
        throw PatchException("Far plane needs the Steam Link scene library")
    }
    val originalScene = sceneFile.readBytes()
    retiredNativeProjectionHook(originalScene)?.let { retired ->
        throw PatchException(
            "Far plane found retired renderer helper $retired; use a clean source APK",
        )
    }

    val libDir = sceneFile.parentFile!!
    val layerDir = File(apkRoot, "assets/openxr/1/api_layers/implicit.d")

    // Alpha-0 and stock quad are separate projection modes; two quad layers on one frame are not
    // a defined topology. Check both the installed files and the metadata owner below.
    if (File(libDir, ANDROID_SURFACE_TRIGGER_LIBRARY).exists() ||
        File(layerDir, ANDROID_SURFACE_TRIGGER_MANIFEST).exists() ||
        File(libDir, STOCK_QUAD_LIBRARY).exists() ||
        File(layerDir, STOCK_QUAD_MANIFEST).exists()
    ) {
        throw PatchException(QUAD_MODE_EXCLUSION_MESSAGE)
    }
    // Retired helpers and API-layer manifests are never migrated or deleted here: fail closed
    // with zero writes so the caller can rebuild from a clean source APK.
    retiredProjectionResourceAt(libDir, layerDir)?.let { retired ->
        throw PatchException(
            "Far plane found retired projection resource ${retired.name}; " +
                "start from a clean source APK.",
        )
    }

    val payload = farPayload ?: nativeQuadFarResource()
    validateNativeQuadFarPayload(payload)

    val helperTarget = File(libDir, NATIVE_QUAD_LIBRARY)
    val priorHelper = if (helperTarget.exists()) {
        if (!helperTarget.isFile) {
            throw PatchException("Far plane found a stale or modified resource: ${helperTarget.path}")
        }
        helperTarget.readBytes()
    } else {
        null
    }
    if (priorHelper != null && !isNativeQuadFarPayload(priorHelper)) {
        throw PatchException(
            "Far plane found an incompatible quad helper; start from a clean source APK. " +
                "An APK patched with the removed native quad composition patch cannot be converted in place.",
        )
    }
    // A scene that already carries the native quad replacement without the far-plane helper is an
    // old native-quad install with its helper removed; never reinterpret it silently.
    if (priorHelper == null && isNativeQuadFarPlanePatched(originalScene, versionCode)) {
        throw PatchException(
            "Far plane found a scene already patched by the removed native quad composition patch; " +
                "start from a clean source APK.",
        )
    }

    val newScene = try {
        applyScene(originalScene, versionName, versionCode)
    } catch (failure: PatchException) {
        throw PatchException("Far plane could not patch the scene library: ${failure.message}", failure)
    }
    val helper = applyNativeQuadFarSlot(priorHelper, meters, settings, payload)

    if (priorHelper != null && newScene.contentEquals(originalScene) && helper.contentEquals(priorHelper)) {
        return true
    }

    val staged = mutableListOf<Pair<File, File>>()
    val created = mutableListOf<File>()
    try {
        if (priorHelper == null || !helper.contentEquals(priorHelper)) {
            if (!helperTarget.parentFile.isDirectory && !helperTarget.parentFile.mkdirs()) {
                throw PatchException("Could not create far-plane resource directory")
            }
            val temporary = File.createTempFile("gxr-native-quad-far-helper-", ".tmp", libDir)
            staged += temporary to helperTarget
            temporary.writeBytes(helper)
        }
        if (!newScene.contentEquals(originalScene)) {
            val sceneTemporary = File.createTempFile("gxr-native-quad-far-scene-", ".tmp", libDir)
            staged += sceneTemporary to sceneFile
            sceneTemporary.writeBytes(newScene)
        }

        staged.forEach { (temporary, target) ->
            moveFile(temporary.toPath(), target.toPath())
            if (target == helperTarget && priorHelper == null) created += target
        }
    } catch (failure: Exception) {
        created.asReversed().forEach { target ->
            try {
                Files.deleteIfExists(target.toPath())
            } catch (rollback: Exception) {
                failure.addSuppressed(rollback)
            }
        }
        if (priorHelper != null && !helper.contentEquals(priorHelper)) {
            try {
                helperTarget.writeBytes(priorHelper)
            } catch (rollback: Exception) {
                failure.addSuppressed(rollback)
            }
        }
        if (!newScene.contentEquals(originalScene)) {
            try {
                sceneFile.writeBytes(originalScene)
            } catch (rollback: Exception) {
                failure.addSuppressed(rollback)
            }
        }
        throw failure
    } finally {
        staged.forEach { (temporary, _) -> Files.deleteIfExists(temporary.toPath()) }
    }
    return true
}

internal fun installedResolutionModes(document: Document): List<String> {
    val app = document.documentElement.getElementsByTagName("application").item(0) as Element
    val nodes = app.getElementsByTagName("meta-data")
    return (0 until nodes.length)
        .mapNotNull { nodes.item(it) as? Element }
        .filter { it.getAttribute("android:name") == "com.valvesoftware.steamlink.GXR_RESOLUTION_MODE" }
        .map { it.getAttribute("android:value") }
}

internal fun installedResolutionMode(document: Document): String =
    installedResolutionModes(document).firstOrNull().orEmpty()

/** Reads the decoded manifest without opening a writable [Document]. */
internal fun readInstalledResolutionModes(manifestFile: File): List<String> {
    val document = javax.xml.parsers.DocumentBuilderFactory.newInstance()
        .newDocumentBuilder()
        .parse(manifestFile)
    return installedResolutionModes(document)
}

internal fun rejectLegacyNativeQuadMode(installedMode: String) {
    if (installedMode == LEGACY_NATIVE_QUAD_MODE) {
        throw PatchException(
            "Far plane found the removed native_quad_v1 metadata; start from a clean source APK.",
        )
    }
}

/** Preflight: reject a removed marker or another active projection mode before any native write. */
internal fun rejectUnsupportedResolutionModes(installedModes: List<String>) {
    installedModes.forEach(::rejectLegacyNativeQuadMode)
    if (installedModes.any { projectionModesConflict(it, NATIVE_QUAD_MODE) }) {
        throw PatchException(QUAD_MODE_EXCLUSION_MESSAGE)
    }
}

@Suppress("unused")
val nativeQuadFarPlanePatch = resourcePatch(
    name = "Native quad far plane (experimental)",
    description = "Builds head-oriented quads directly in Steam Link's renderer, placed far from the eye. " +
        buildLabel(COMPATIBILITIES_STEAM_LINK_FAR_PLANE) +
        " Needs: deselect Alpha-0 high-resolution trigger and Stock quad composition (experimental).",
    default = false,
) {
    category(PatchCategories.IMAGE_QUALITY)
    compatibleWith(*COMPATIBILITIES_STEAM_LINK_FAR_PLANE.toTypedArray())

    val distance by stringOption(
        key = "distance",
        default = NATIVE_QUAD_FAR_DEFAULT_DISTANCE.toString(),
        values = mapOf(
            "16 m" to "16",
            "64 m" to "64",
            "250 m" to "250",
        ),
        title = "Quad distance",
        description = "How far the stream quads sit from the head. Larger values make eye-tracked " +
            "position errors move the image less. Stock is about 2 m.",
        required = true,
    )

    val layerSettings by stringOption(
        key = "layerSettings",
        default = "keep",
        values = mapOf(
            "Keep" to "keep",
            "Remove FB settings" to "none",
        ),
        title = "Layer settings",
        description = "Keep Steam Link's layer settings, or remove only the FB settings entry " +
            "from each quad.",
        required = true,
    )

    execute {
        // Dependencies bypass Morphe compatibility: stay inert on every other package/build.
        if (packageMetadata.packageName != STEAM_LINK_PACKAGE ||
            !isNativeQuadFarPlaneSteamLinkBuild(packageMetadata.versionName, packageMetadata.versionCode)
        ) {
            return@execute
        }
        val rawDistance = distance ?: throw PatchException("Far plane: quad distance is not set")
        val meters = rawDistance.toIntOrNull()
            ?: throw PatchException("Far plane: unknown quad distance '$rawDistance'")
        if (meters !in NATIVE_QUAD_FAR_DISTANCES) {
            throw PatchException("Far plane: unsupported quad distance $meters")
        }
        val settings = when (layerSettings) {
            "keep" -> NATIVE_QUAD_FAR_SETTINGS_KEEP
            "none" -> NATIVE_QUAD_FAR_SETTINGS_NONE
            else -> throw PatchException("Far plane: unknown layer-settings mode '$layerSettings'")
        }
        // Read-only manifest preflight: reject a removed marker or a sibling projection mode before
        // any native write. This parser never opens a writable Document, so a failed preflight
        // leaves the manifest bytes untouched.
        rejectUnsupportedResolutionModes(
            readInstalledResolutionModes(get("AndroidManifest.xml")),
        )
        // Morphe extracts resource entries lazily, so materialize every helper and layer manifest
        // the installer inspects. Otherwise an existing install would look absent and the old
        // native-quad scene guard would fire instead of a real validation. get() is a no-op for
        // entries the APK does not contain.
        val presentLibs = listApkEntries("lib/arm64-v8a/").toSet()
        val presentLayers = listApkEntries("assets/openxr/1/api_layers/implicit.d/").toSet()
        buildList {
            add("lib/arm64-v8a/$NATIVE_QUAD_LIBRARY")
            add("lib/arm64-v8a/$ANDROID_SURFACE_TRIGGER_LIBRARY")
            add("lib/arm64-v8a/$ANDROID_SURFACE_TRIGGER_5001712_RESOURCE_LIBRARY")
            add("lib/arm64-v8a/$STOCK_QUAD_LIBRARY")
            add("assets/openxr/1/api_layers/implicit.d/$ANDROID_SURFACE_TRIGGER_MANIFEST")
            add("assets/openxr/1/api_layers/implicit.d/$STOCK_QUAD_MANIFEST")
            addAll(retiredProjectionResourcePaths())
        }.forEach { path ->
            val present = if (path.startsWith("lib/")) presentLibs else presentLayers
            if (path in present) get(path)
        }
        val sceneFile = get("lib/arm64-v8a/libvrlink_scene.so")
        installNativeQuadFarPlane(
            sceneFile.parentFile!!.parentFile!!.parentFile!!,
            packageMetadata.packageName,
            packageMetadata.versionName,
            packageMetadata.versionCode,
            meters,
            settings,
        )
    }

    finalize {
        // Dependencies bypass Morphe compatibility: stay inert on every other package/build.
        if (packageMetadata.packageName != STEAM_LINK_PACKAGE ||
            !isNativeQuadFarPlaneSteamLinkBuild(packageMetadata.versionName, packageMetadata.versionCode)
        ) {
            return@finalize
        }
        // The native payload is installed and validated; only now rewrite the metadata owner.
        // Snapshot the manifest so a failed mutation restores the exact original bytes.
        val manifestFile = get("AndroidManifest.xml")
        val snapshot = manifestFile.readBytes()
        try {
            ensureIdsXml(get("res/values/ids.xml"))
            document("AndroidManifest.xml").use { document ->
                configurePermissionFreeProjectionMode(document, NATIVE_QUAD_MODE)
            }
        } catch (failure: Throwable) {
            manifestFile.writeBytes(snapshot)
            throw failure
        }
    }
}
