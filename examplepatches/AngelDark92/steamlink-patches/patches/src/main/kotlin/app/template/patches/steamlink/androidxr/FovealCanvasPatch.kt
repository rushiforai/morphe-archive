package app.template.patches.steamlink.androidxr

import app.template.patches.shared.PatchCategories
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.rawResourcePatch
import app.template.patches.shared.Constants.COMPATIBILITIES_STEAM_LINK_5001812
import app.template.patches.shared.Constants.EXPERIMENTAL_COMPATIBILITY_NAME
import java.io.File
import java.nio.file.Files
import java.security.MessageDigest

internal const val FOVEAL_CANVAS_LIBRARY = "libgxr_foveal_canvas.so"
internal const val FOVEAL_CANVAS_MANIFEST = "XR_APILAYER_local_GalaxyXR_foveal_canvas.json"
internal const val FOVEAL_CANVAS_HELPER_SHA256 = "2939db189b19322da6ec601e96f9d4036d449fd8ee386e3cbd69e491d539eac3"
internal const val FOVEAL_CANVAS_MANIFEST_SHA256 =
    "2ff0b8e93e682ae39247f9f7e0a394e8ee6cabbefa374a1249b19bb1195a12e5"
internal const val FOVEAL_CANVAS_SCENE_SIZE = 2_220_872

internal fun isFovealCanvasSteamLinkBuild(versionName: String, versionCode: String): Boolean =
    versionName == "2.0.20" && versionCode == "5001812"

private fun canvasSha256(bytes: ByteArray): String = MessageDigest.getInstance("SHA-256")
    .digest(bytes).joinToString("") { "%02x".format(it) }

internal fun validateFovealCanvasScene(scene: ByteArray) {
    if (scene.size != FOVEAL_CANVAS_SCENE_SIZE) {
        throw PatchException("Foveal canvas requires the exact 2.0.20/5001812 scene layout")
    }
    // Symbol-derived complete-function identities from the original signed Valve APK.
    // Other patches may modify their own sites elsewhere; these submission functions
    // must remain untouched. No scene bytes are changed by this installer.
    val functions = listOf(
        Triple(0x10a570, 492, "0a71c29e06febb89060fa68dc1c8a753461e97018e66b93b9d9dc6097c52b5db"),
        Triple(0x10ae78, 2772, "718be9d52955db23249d64079db5b5b543c1765748be6a5d324bb39581bca48b"),
    )
    functions.forEach { (offset, size, expectedHash) ->
        if (canvasSha256(scene.copyOfRange(offset, offset + size)) != expectedHash) {
            throw PatchException("Foveal canvas found an unknown renderer function at 0x${offset.toString(16)}")
        }
    }
    retiredNativeProjectionHook(scene)?.let {
        throw PatchException("Foveal canvas rejects retired renderer hook $it; use the original APK")
    }
}

internal fun validateFovealCanvasPayload(helper: ByteArray, manifest: ByteArray) {
    if (helper.size < 20 || !helper.copyOfRange(0, 4)
            .contentEquals(byteArrayOf(0x7f, 0x45, 0x4c, 0x46)) ||
        helper[4] != 2.toByte() || helper[5] != 1.toByte() ||
        helper[18] != 0xb7.toByte() || helper[19] != 0.toByte()
    ) {
        throw PatchException("Bundled foveal canvas helper is not an ARM64 ELF library")
    }
    if (canvasSha256(helper) != FOVEAL_CANVAS_HELPER_SHA256) {
        throw PatchException("Bundled foveal canvas helper failed its SHA-256 precondition")
    }
    if (canvasSha256(manifest) != FOVEAL_CANVAS_MANIFEST_SHA256) {
        throw PatchException("Bundled foveal canvas manifest failed its SHA-256 precondition")
    }
}

/** All layout, payload and existing-file preconditions are checked before writes. */
internal fun installFovealCanvasResources(
    apkRoot: File,
    versionName: String,
    versionCode: String,
    helperBytes: ByteArray? = null,
    manifestBytes: ByteArray? = null,
): Boolean {
    // Dependencies bypass Morphe compatibility. Excluded pairs must not even read files.
    if (!isFovealCanvasSteamLinkBuild(versionName, versionCode)) return false

    val sceneFile = File(apkRoot, "lib/arm64-v8a/libvrlink_scene.so")
    if (!sceneFile.isFile) throw PatchException("Missing exact foveal canvas renderer library")
    validateFovealCanvasScene(sceneFile.readBytes())
    val helper = helperBytes ?: projectionModeResource(FOVEAL_CANVAS_LIBRARY)
    val manifest = manifestBytes ?: projectionModeResource(FOVEAL_CANVAS_MANIFEST)
    validateFovealCanvasPayload(helper, manifest)

    val files = listOf(
        File(sceneFile.parentFile, FOVEAL_CANVAS_LIBRARY) to helper,
        File(apkRoot, "assets/openxr/1/api_layers/implicit.d/$FOVEAL_CANVAS_MANIFEST") to manifest,
    )
    files.forEach { (target, expected) ->
        if (target.exists() && (!target.isFile || !target.readBytes().contentEquals(expected))) {
            throw PatchException("Foveal canvas found a stale or modified resource: ${target.path}")
        }
    }
    val missing = files.filterNot { (target, _) -> target.exists() }
    if (missing.isEmpty()) return true

    val staged = mutableListOf<Pair<File, File>>()
    val created = mutableListOf<File>()
    try {
        missing.forEach { (target, bytes) ->
            if (!target.parentFile.isDirectory && !target.parentFile.mkdirs()) {
                throw PatchException("Could not create foveal canvas resource directory")
            }
            val temporary = File.createTempFile("gxr-foveal-canvas-", ".tmp", target.parentFile)
            staged += temporary to target
            temporary.writeBytes(bytes)
        }
        staged.forEach { (temporary, target) ->
            // No replacement: an unexpected concurrent file must never be overwritten.
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
val xrFovealCanvasPatch = rawResourcePatch(
    name = "Full-FOV foveal canvas (experimental)",
    description = "Exact Steam Link 2.0.20/5001812 experiment: copies only the foveal image onto a transparent 5000x6000 regular-GL canvas per eye and submits it as the 2nd projection. Preserves the original background projection and any existing static Surface-trigger quad. GPU allocation, runtime acceptance and resolution improvement require headset validation.",
    default = false,
) {
    category(PatchCategories.EXPERIMENTS)
    compatibleWith(*COMPATIBILITIES_STEAM_LINK_5001812.map { exact ->
        Compatibility(
            name = EXPERIMENTAL_COMPATIBILITY_NAME,
            packageName = requireNotNull(exact.packageName),
            targets = exact.targets,
        )
    }.toTypedArray())
    execute {
        if (!isFovealCanvasSteamLinkBuild(packageMetadata.versionName, packageMetadata.versionCode)) {
            return@execute
        }
        val sceneFile = get("lib/arm64-v8a/libvrlink_scene.so")
        val apkRoot = sceneFile.parentFile!!.parentFile!!.parentFile!!
        installFovealCanvasResources(apkRoot, packageMetadata.versionName, packageMetadata.versionCode)
    }
}
