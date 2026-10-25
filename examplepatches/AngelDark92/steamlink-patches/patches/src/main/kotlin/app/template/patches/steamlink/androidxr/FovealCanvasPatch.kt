package app.template.patches.steamlink.androidxr

import app.template.patches.shared.PatchCategories
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.rawResourcePatch
import app.template.patches.shared.Constants.COMPATIBILITIES_STEAM_LINK
import app.template.patches.shared.Constants.EXPERIMENTAL_COMPATIBILITY_NAME
import app.template.patches.shared.buildLabel
import java.io.File
import java.nio.file.Files
import java.security.MessageDigest

internal const val FOVEAL_CANVAS_LIBRARY = "libgxr_foveal_canvas.so"
internal const val FOVEAL_CANVAS_MANIFEST = "XR_APILAYER_local_GalaxyXR_foveal_canvas.json"
internal const val FOVEAL_CANVAS_HELPER_SHA256 = "af816d579e753a66e32bd2001dd6bf082f49038888bfd147519cea1834e174f1"
internal const val FOVEAL_CANVAS_MANIFEST_SHA256 =
    "9d28be5fe61ebe804d760cc0254aca357efdd39dc9b6996e12220527507c2832"

private data class SceneFunction(val offset: Int, val size: Int, val sha256: String)

private data class FovealCanvasLayout(
    val versionName: String,
    val versionCode: Int,
    val sceneSize: Int,
    val functions: List<SceneFunction>,
)

// Symbol-derived complete-function identities from the original signed Valve APKs:
// QSVLRendererXR::GetProjectionLayers and QSVLRendererXR::FlipFrame. Other patches may
// modify their own sites elsewhere; these submission functions must remain untouched.
private val FOVEAL_CANVAS_LAYOUTS = listOf(
    FovealCanvasLayout(
        versionName = "2.0.20",
        versionCode = 5001712,
        sceneSize = 2_221_072,
        functions = listOf(
            SceneFunction(0x10a410, 492, "adb6101ef08c9245e61a0950d7046b3b6d96205074657e294cc265ee0bc28576"),
            SceneFunction(0x10ad18, 2772, "bc5e4118046726343cba0edd0d40793cd53dafe5b99db9f3935f3e713b9f5b1d"),
        ),
    ),
    FovealCanvasLayout(
        versionName = "2.0.20",
        versionCode = 5001812,
        sceneSize = 2_220_872,
        functions = listOf(
            SceneFunction(0x10a570, 492, "0a71c29e06febb89060fa68dc1c8a753461e97018e66b93b9d9dc6097c52b5db"),
            SceneFunction(0x10ae78, 2772, "718be9d52955db23249d64079db5b5b543c1765748be6a5d324bb39581bca48b"),
        ),
    ),
    FovealCanvasLayout(
        versionName = "2.0.21",
        versionCode = 5001968,
        sceneSize = 2_234_048,
        functions = listOf(
            SceneFunction(0x1064e0, 492, "29f66cdf40a79fc75c1ea49f1e311b850dbd469d4620036544131e0810d856fe"),
            SceneFunction(0x106de8, 2788, "26ec7214b26d5e9559507dd89b7116ebc845ecbcbb11c92d55958969acaee9fc"),
        ),
    ),
    FovealCanvasLayout(
        versionName = "2.0.22",
        versionCode = 5002244,
        sceneSize = 2_251_920,
        functions = listOf(
            SceneFunction(0x107bf0, 692, "bb860b81d28a9f26b67745598c76c35bf6e47db3236e8c0a4982fc32c95c1bae"),
            SceneFunction(0x10872c, 3000, "79fd47806e5eb8b77729d1abc57fde6f7858ab7c85a4a5fde060ccd2bb7cfdc8"),
        ),
    ),
    FovealCanvasLayout(
        versionName = "2.0.23",
        versionCode = 5002363,
        sceneSize = 2_292_008,
        functions = listOf(
            SceneFunction(0x10c1c4, 692, "2a732a7867cdc16309b4afa7b5d1971cfdf1bb67b5437925f11a465c797665c0"),
            SceneFunction(0x10cd00, 3000, "986357756174710f0087b191157a11ee70104190360c6c17b466b951d8004884"),
        ),
    ),
    FovealCanvasLayout(
        versionName = "2.0.24",
        versionCode = 5002395,
        sceneSize = 2_301_432,
        functions = listOf(
            SceneFunction(0x10d41c, 692, "338fac4375cf3ea36bfaa31a4a9e6e358ff4f4fc88f2953e09c4b72a7bbb477d"),
            SceneFunction(0x10df58, 3000, "d628c41334d5f9dfdc056ee436850824b5b6ac2023f990bc26f77a93f0703699"),
        ),
    ),
)

private fun fovealCanvasLayoutFor(versionName: String, versionCode: String): FovealCanvasLayout? =
    FOVEAL_CANVAS_LAYOUTS.singleOrNull {
        it.versionName == versionName && it.versionCode.toString() == versionCode
    }

internal fun isFovealCanvasSteamLinkBuild(versionName: String, versionCode: String): Boolean =
    fovealCanvasLayoutFor(versionName, versionCode) != null

private val FOVEAL_CANVAS_COMPATIBILITIES = COMPATIBILITIES_STEAM_LINK.filter { compatibility ->
    compatibility.targets.any { target ->
        target.versionCodes?.values?.any { code ->
            FOVEAL_CANVAS_LAYOUTS.any { it.versionCode == code && it.versionName == target.version }
        } == true
    }
}.map { exact ->
    Compatibility(
        name = EXPERIMENTAL_COMPATIBILITY_NAME,
        packageName = requireNotNull(exact.packageName),
        targets = exact.targets,
    )
}

private fun canvasSha256(bytes: ByteArray): String = MessageDigest.getInstance("SHA-256")
    .digest(bytes).joinToString("") { "%02x".format(it) }

internal fun validateFovealCanvasScene(scene: ByteArray, versionName: String, versionCode: String) {
    val layout = fovealCanvasLayoutFor(versionName, versionCode)
        ?: throw PatchException("Foveal canvas has no scene layout for $versionName/$versionCode")
    if (scene.size != layout.sceneSize) {
        throw PatchException("Foveal canvas requires the exact $versionName/$versionCode scene layout")
    }
    layout.functions.forEach { function ->
        if (canvasSha256(scene.copyOfRange(function.offset, function.offset + function.size)) !=
            function.sha256
        ) {
            throw PatchException(
                "Foveal canvas found an unknown renderer function at 0x${function.offset.toString(16)}",
            )
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
    validateFovealCanvasScene(sceneFile.readBytes(), versionName, versionCode)
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
    description = "Draws only the foveal image on a transparent canvas per eye. " +
        buildLabel(FOVEAL_CANVAS_COMPATIBILITIES) + " Experimental; headset validation pending.",
    default = false,
) {
    category(PatchCategories.IMAGE_QUALITY)
    compatibleWith(*FOVEAL_CANVAS_COMPATIBILITIES.toTypedArray())
    execute {
        if (!isFovealCanvasSteamLinkBuild(packageMetadata.versionName, packageMetadata.versionCode)) {
            return@execute
        }
        val sceneFile = get("lib/arm64-v8a/libvrlink_scene.so")
        val apkRoot = sceneFile.parentFile!!.parentFile!!.parentFile!!
        installFovealCanvasResources(apkRoot, packageMetadata.versionName, packageMetadata.versionCode)
    }
}
