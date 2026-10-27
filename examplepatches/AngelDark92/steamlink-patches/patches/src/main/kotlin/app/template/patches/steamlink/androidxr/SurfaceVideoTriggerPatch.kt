package app.template.patches.steamlink.androidxr

import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import app.template.patches.shared.Constants.COMPATIBILITIES_STEAM_LINK_5001712
import app.template.patches.shared.Constants.EXPERIMENTAL_COMPATIBILITY_NAME
import app.template.patches.shared.PatchCategories
import app.template.patches.shared.buildLabel
import java.io.File
import java.nio.file.Files
import java.security.MessageDigest

internal const val SURFACE_VIDEO_TRIGGER_LIBRARY = "libgxr_surface_video_trigger.so"
internal const val SURFACE_VIDEO_TRIGGER_MANIFEST =
    "XR_APILAYER_local_GalaxyXR_surface_video_trigger_v1.json"
internal const val SURFACE_VIDEO_TRIGGER_BUILD_ID =
    "surface-video-trigger-2proj-v1.0-20261025"
internal const val SURFACE_VIDEO_TRIGGER_HELPER_SHA256 =
    "1e223bfec56fc3e39355a5fda25464fc54d45887d98e8591884b1f4d80c8b384"
internal const val SURFACE_VIDEO_TRIGGER_MANIFEST_SHA256 =
    "328d54a019fb1263a8fc76f3b35a3e23bcaa1ec66725b3d52775b62d3fe1b8fa"

internal fun isSurfaceVideoTriggerSteamLinkBuild(versionName: String, versionCode: String): Boolean =
    COMPATIBILITIES_STEAM_LINK_5001712.any { compatibility ->
        compatibility.targets.any { target ->
            target.version == versionName &&
                target.versionCodes.orEmpty().values.any { it.toString() == versionCode }
        }
    }

private val SURFACE_VIDEO_TRIGGER_COMPATIBILITIES =
    COMPATIBILITIES_STEAM_LINK_5001712.map { exact ->
        Compatibility(
            name = EXPERIMENTAL_COMPATIBILITY_NAME,
            packageName = requireNotNull(exact.packageName),
            targets = exact.targets,
        )
    }

private fun surfaceVideoTriggerResource(name: String): ByteArray =
    (object {}.javaClass.getResourceAsStream("/steamlink/androidxr/$name")
        ?: throw PatchException("Missing bundled surface-video trigger resource: $name"))
        .use { it.readBytes() }

private fun sha256(bytes: ByteArray): String =
    MessageDigest.getInstance("SHA-256").digest(bytes)
        .joinToString("") { "%02x".format(it) }

internal fun validateSurfaceVideoTriggerPayload(helper: ByteArray, manifest: ByteArray) {
    if (helper.size < 4 || !helper.copyOfRange(0, 4)
            .contentEquals(byteArrayOf(0x7f, 0x45, 0x4c, 0x46))) {
        throw PatchException("Bundled surface-video trigger helper is not an ELF library")
    }
    if (sha256(helper) != SURFACE_VIDEO_TRIGGER_HELPER_SHA256) {
        throw PatchException("Bundled surface-video trigger helper failed its SHA-256 precondition")
    }
    if (sha256(manifest) != SURFACE_VIDEO_TRIGGER_MANIFEST_SHA256) {
        throw PatchException("Bundled surface-video trigger manifest failed its SHA-256 precondition")
    }
    if (!manifest.toString(Charsets.UTF_8).contains(
            "\"library_path\": \"$SURFACE_VIDEO_TRIGGER_LIBRARY\"",
        )) {
        throw PatchException("Bundled surface-video trigger manifest names the wrong library")
    }
    if (!helper.toString(Charsets.ISO_8859_1).contains(SURFACE_VIDEO_TRIGGER_BUILD_ID)) {
        throw PatchException("Bundled surface-video trigger helper build identity is missing")
    }
}

internal fun installSurfaceVideoTriggerResources(
    apkRoot: File,
    versionName: String,
    versionCode: String,
    helperBytes: ByteArray? = null,
    manifestBytes: ByteArray? = null,
): Boolean {
    // Dependencies bypass Morphe compatibility. Leave every other build untouched.
    if (!isSurfaceVideoTriggerSteamLinkBuild(versionName, versionCode)) return false

    val sceneFile = File(apkRoot, "lib/arm64-v8a/libvrlink_scene.so")
    if (!sceneFile.isFile) {
        throw PatchException("Missing exact 2.0.20/5001712 scene library")
    }
    if (sceneFile.length() != 2_221_072L) {
        throw PatchException("Surface video + trigger requires the exact 2.0.20/5001712 scene size")
    }
    retiredNativeProjectionHook(sceneFile.readBytes())?.let { retired ->
        throw PatchException(
            "Surface video + trigger found retired renderer helper $retired; use a clean source APK",
        )
    }

    val libDir = sceneFile.parentFile!!
    val layerDir = File(apkRoot, "assets/openxr/1/api_layers/implicit.d")
    val helper = helperBytes ?: surfaceVideoTriggerResource(SURFACE_VIDEO_TRIGGER_LIBRARY)
    val manifest = manifestBytes ?: surfaceVideoTriggerResource(SURFACE_VIDEO_TRIGGER_MANIFEST)
    validateSurfaceVideoTriggerPayload(helper, manifest)

    // This layer appends its own terminal trigger. Alpha-0 also appends a trigger and
    // changes the frame to three layers, so selecting both would silently pass through.
    if (File(libDir, ANDROID_SURFACE_TRIGGER_LIBRARY).exists() ||
        File(layerDir, ANDROID_SURFACE_TRIGGER_MANIFEST).exists()) {
        throw PatchException("Surface video + trigger needs Alpha-0 high-resolution trigger deselected")
    }

    val files = listOf(
        File(libDir, SURFACE_VIDEO_TRIGGER_LIBRARY) to helper,
        File(layerDir, SURFACE_VIDEO_TRIGGER_MANIFEST) to manifest,
    )
    files.forEach { (target, expected) ->
        if (target.exists() && (!target.isFile || !target.readBytes().contentEquals(expected))) {
            throw PatchException("Surface video + trigger found a stale or modified resource: ${target.path}")
        }
    }
    val missing = files.filterNot { (target, _) -> target.exists() }
    if (missing.isEmpty()) return true

    val staged = mutableListOf<Pair<File, File>>()
    val created = mutableListOf<File>()
    try {
        missing.forEach { (target, bytes) ->
            if (!target.parentFile.isDirectory && !target.parentFile.mkdirs()) {
                throw PatchException("Could not create surface-video trigger resource directory")
            }
            val temporary = File.createTempFile("gxr-surface-video-", ".tmp", target.parentFile)
            staged += temporary to target
            temporary.writeBytes(bytes)
        }
        staged.forEach { (temporary, target) ->
            Files.move(temporary.toPath(), target.toPath())
            created += target
        }
    } catch (failure: Exception) {
        created.asReversed().forEach { target ->
            try { Files.deleteIfExists(target.toPath()) } catch (rollback: Exception) {
                failure.addSuppressed(rollback)
            }
        }
        throw failure
    } finally {
        staged.forEach { (temporary, _) -> Files.deleteIfExists(temporary.toPath()) }
    }
    return true
}

@Suppress("unused")
val surfaceVideoTriggerPatch = rawResourcePatch(
    name = "Surface video + trigger (experimental)",
    description = "Presents Steam Link's rendered video through Android Surface swapchains and keeps " +
        "the terminal trigger quad. " + buildLabel(SURFACE_VIDEO_TRIGGER_COMPATIBILITIES) +
        " Needs: deselect Alpha-0 high-resolution trigger.",
    default = false,
) {
    category(PatchCategories.IMAGE_QUALITY)
    compatibleWith(*SURFACE_VIDEO_TRIGGER_COMPATIBILITIES.toTypedArray())

    execute {
        if (packageMetadata.packageName != "com.valvesoftware.steamlinkvr" ||
            !isSurfaceVideoTriggerSteamLinkBuild(
                packageMetadata.versionName,
                packageMetadata.versionCode,
            )) {
            return@execute
        }
        val sceneFile = get("lib/arm64-v8a/libvrlink_scene.so")
        val apkRoot = sceneFile.parentFile!!.parentFile!!.parentFile!!
        installSurfaceVideoTriggerResources(
            apkRoot,
            packageMetadata.versionName,
            packageMetadata.versionCode,
        )
    }
}
