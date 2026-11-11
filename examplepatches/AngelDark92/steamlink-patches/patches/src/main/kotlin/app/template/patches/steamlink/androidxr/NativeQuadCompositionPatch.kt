package app.template.patches.steamlink.androidxr

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.COMPATIBILITIES_STEAM_LINK_HIGH_RESOLUTION
import app.template.patches.shared.Constants.isHighResolutionSteamLinkBuild
import app.template.patches.shared.PatchCategories
import app.template.patches.shared.buildLabel
import app.template.patches.steamlink.binary.NATIVE_QUAD_BUILD_ID
import app.template.patches.steamlink.binary.NATIVE_QUAD_HELPER_SHA256
import app.template.patches.steamlink.binary.applyNativeQuadReplacement
import java.io.File
import java.nio.file.Files
import java.nio.file.Path
import java.nio.file.StandardCopyOption
import java.security.MessageDigest

internal const val NATIVE_QUAD_MODE = "native_quad_v1"
internal const val NATIVE_QUAD_LIBRARY = "libgxr_quad_native.so"
private const val NATIVE_QUAD_RESOURCE_PREFIX = "/steamlink/nativequad/"
private const val STEAM_LINK_PACKAGE = "com.valvesoftware.steamlinkvr"

private const val MUTUAL_EXCLUSION_MESSAGE =
    "Choose only one quad-composition mode. Disable the other one and start from a clean APK when switching."

private fun sha256(bytes: ByteArray): String =
    MessageDigest.getInstance("SHA-256").digest(bytes)
        .joinToString("") { "%02x".format(it) }

/**
 * Loads the bundled native-quad payload.
 *
 * @throws PatchException when the payload is missing from the packaged bundle.
 */
internal fun nativeQuadResource(name: String): ByteArray =
    (object {}.javaClass.getResourceAsStream("$NATIVE_QUAD_RESOURCE_PREFIX$name")
        ?: throw PatchException("Missing bundled native-quad resource: $name"))
        .use { it.readBytes() }

internal fun validateNativeQuadPayload(helper: ByteArray) {
    if (helper.size < 4 || !helper.copyOfRange(0, 4)
            .contentEquals(byteArrayOf(0x7f, 0x45, 0x4c, 0x46))) {
        throw PatchException("Bundled native-quad helper is not an ELF library")
    }
    if (sha256(helper) != NATIVE_QUAD_HELPER_SHA256) {
        throw PatchException("Bundled native-quad helper failed its SHA-256 precondition")
    }
    if (!helper.toString(Charsets.ISO_8859_1).contains(NATIVE_QUAD_BUILD_ID)) {
        throw PatchException("Bundled native-quad helper build identity is missing")
    }
}

/**
 * Installs the native-quad renderer helper into an unpacked APK. Returns false, touching nothing,
 * for any package or build outside the exact registry. Fails closed when the opposing stock-quad
 * mode is already present, when the helper is stale or foreign, or when the native layout is
 * unsupported. Writes are staged and rolled back together so a failed apply leaves the original
 * scene intact.
 *
 * The optional [applyNativeQuad] seam lets tests exercise staging/rollback with synthetic scene
 * bytes with a fake native applier, without claiming real base compatibility.
 */
internal fun installNativeQuadResources(
    apkRoot: File,
    packageName: String,
    versionName: String,
    versionCode: String,
    helperBytes: ByteArray? = null,
    applyNativeQuad: (ByteArray, String, String) -> ByteArray = ::applyNativeQuadReplacement,
    moveFile: (Path, Path) -> Unit = { source, target ->
        Files.move(source, target, StandardCopyOption.REPLACE_EXISTING)
    },
): Boolean {
    // Dependencies bypass Morphe compatibility. Leave every other package/build untouched.
    if (packageName != STEAM_LINK_PACKAGE || !isHighResolutionSteamLinkBuild(versionName, versionCode)) {
        return false
    }

    val sceneFile = File(apkRoot, "lib/arm64-v8a/libvrlink_scene.so")
    if (!sceneFile.isFile) {
        throw PatchException("Native quad composition needs the Steam Link scene library")
    }

    val libDir = sceneFile.parentFile!!
    val layerDir = File(apkRoot, "assets/openxr/1/api_layers/implicit.d")

    // Mutual exclusion with the stock-quad mode, checked before any payload is read or written.
    if (File(libDir, STOCK_QUAD_LIBRARY).exists() || File(layerDir, STOCK_QUAD_MANIFEST).exists()) {
        throw PatchException(MUTUAL_EXCLUSION_MESSAGE)
    }

    // Retired renderer hooks are not compatible with the native-quad path.
    retiredNativeProjectionHook(sceneFile.readBytes())?.let { retired ->
        throw PatchException(
            "Native quad composition found retired renderer helper $retired; use a clean source APK",
        )
    }

    val helper = helperBytes ?: nativeQuadResource(NATIVE_QUAD_LIBRARY)
    validateNativeQuadPayload(helper)

    val helperTarget = File(libDir, NATIVE_QUAD_LIBRARY)
    if (helperTarget.exists() && (!helperTarget.isFile || !helperTarget.readBytes().contentEquals(helper))) {
        throw PatchException("Native quad composition found a stale or modified resource: ${helperTarget.path}")
    }

    val originalScene = sceneFile.readBytes()
    val newScene = try {
        applyNativeQuad(originalScene, versionName, versionCode)
    } catch (failure: PatchException) {
        throw PatchException("Native quad composition could not patch the scene library: ${failure.message}", failure)
    }

    // Already patched with the same artifact.
    if (helperTarget.exists() && newScene.contentEquals(originalScene)) {
        return true
    }

    val staged = mutableListOf<Pair<File, File>>()
    val created = mutableListOf<File>()
    try {
        if (!helperTarget.exists()) {
            if (!helperTarget.parentFile.isDirectory && !helperTarget.parentFile.mkdirs()) {
                throw PatchException("Could not create native-quad resource directory")
            }
            val temporary = File.createTempFile("gxr-native-quad-helper-", ".tmp", libDir)
            staged += temporary to helperTarget
            temporary.writeBytes(helper)
        }

        val sceneTemporary = File.createTempFile("gxr-native-quad-scene-", ".tmp", libDir)
        staged += sceneTemporary to sceneFile
        sceneTemporary.writeBytes(newScene)

        staged.forEach { (temporary, target) ->
            moveFile(temporary.toPath(), target.toPath())
            if (target == helperTarget) created += target
        }
    } catch (failure: Exception) {
        created.asReversed().forEach { target ->
            try {
                Files.deleteIfExists(target.toPath())
            } catch (rollback: Exception) {
                failure.addSuppressed(rollback)
            }
        }
        try {
            sceneFile.writeBytes(originalScene)
        } catch (rollback: Exception) {
            failure.addSuppressed(rollback)
        }
        throw failure
    } finally {
        staged.forEach { (temporary, _) -> Files.deleteIfExists(temporary.toPath()) }
    }
    return true
}

private val nativeQuadResourcesPatch = rawResourcePatch {
    execute {
        if (packageMetadata.packageName != STEAM_LINK_PACKAGE ||
            !isHighResolutionSteamLinkBuild(packageMetadata.versionName, packageMetadata.versionCode)
        ) {
            return@execute
        }
        val sceneFile = get("lib/arm64-v8a/libvrlink_scene.so")
        val apkRoot = sceneFile.parentFile!!.parentFile!!.parentFile!!
        installNativeQuadResources(
            apkRoot,
            packageMetadata.packageName,
            packageMetadata.versionName,
            packageMetadata.versionCode,
        )
    }
}

@Suppress("unused")
val nativeQuadCompositionPatch = resourcePatch(
    name = "Native quad composition (experimental)",
    description = "Builds eye-aware quads directly in Steam Link's renderer. " +
        buildLabel(COMPATIBILITIES_STEAM_LINK_HIGH_RESOLUTION) +
        " Needs: disable Stock quad composition.",
    default = false,
) {
    category(PatchCategories.IMAGE_QUALITY)
    compatibleWith(*COMPATIBILITIES_STEAM_LINK_HIGH_RESOLUTION.toTypedArray())
    dependsOn(nativeQuadResourcesPatch)

    finalize {
        // Dependencies bypass compatibility checks: stay inert on every other package/build.
        if (packageMetadata.packageName != STEAM_LINK_PACKAGE ||
            !isHighResolutionSteamLinkBuild(packageMetadata.versionName, packageMetadata.versionCode)
        ) {
            return@finalize
        }
        ensureIdsXml(get("res/values/ids.xml"))
        document("AndroidManifest.xml").use { document ->
            configurePermissionFreeProjectionMode(document, NATIVE_QUAD_MODE)
        }
    }
}
