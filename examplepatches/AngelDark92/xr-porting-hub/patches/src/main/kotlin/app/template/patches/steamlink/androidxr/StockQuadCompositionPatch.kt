package app.template.patches.steamlink.androidxr

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.COMPATIBILITIES_STEAM_LINK_HIGH_RESOLUTION
import app.template.patches.shared.Constants.isHighResolutionSteamLinkBuild
import app.template.patches.shared.PatchCategories
import app.template.patches.shared.buildLabel
import java.io.File
import java.nio.file.Files
import java.security.MessageDigest

internal const val STOCK_QUAD_MODE = "stock_quad_v1"
internal const val STOCK_QUAD_LIBRARY = "libgxr_stock_quad.so"
internal const val STOCK_QUAD_MANIFEST = "XR_APILAYER_local_GalaxyXR_stock_quad_v1.json"
internal const val STOCK_QUAD_BUILD_ID = "stock-quad-5002527-v1"
private const val STEAM_LINK_PACKAGE = "com.valvesoftware.steamlinkvr"

// Pins of the bundled payload built from extensions/stock-quad-composition.
internal const val STOCK_QUAD_HELPER_SHA256 =
    "d2cd78acdb6072ee461fa3f5729087a7ad988b13399b90fa4d07d8e670afb964"
internal const val STOCK_QUAD_MANIFEST_SHA256 =
    "08ac03af8e80f11ca78f92e99e7f5622139211b41e50794f61f61d1c61132fc6"

internal fun isStockQuadSteamLinkBuild(versionName: String, versionCode: String): Boolean =
    isHighResolutionSteamLinkBuild(versionName, versionCode)

private fun stockQuadSha256(bytes: ByteArray): String =
    MessageDigest.getInstance("SHA-256").digest(bytes)
        .joinToString("") { "%02x".format(it) }

internal fun validateStockQuadPayload(helper: ByteArray, manifest: ByteArray) {
    if (helper.size < 4 || !helper.copyOfRange(0, 4)
            .contentEquals(byteArrayOf(0x7f, 0x45, 0x4c, 0x46))) {
        throw PatchException("Bundled stock-quad helper is not an ELF library")
    }
    if (stockQuadSha256(helper) != STOCK_QUAD_HELPER_SHA256) {
        throw PatchException("Bundled stock-quad helper failed its SHA-256 precondition")
    }
    if (stockQuadSha256(manifest) != STOCK_QUAD_MANIFEST_SHA256) {
        throw PatchException("Bundled stock-quad manifest failed its SHA-256 precondition")
    }
    if (!manifest.toString(Charsets.UTF_8).contains("\"library_path\": \"$STOCK_QUAD_LIBRARY\"")) {
        throw PatchException("Bundled stock-quad manifest names the wrong library")
    }
    if (!helper.toString(Charsets.ISO_8859_1).contains(STOCK_QUAD_BUILD_ID)) {
        throw PatchException("Bundled stock-quad helper build identity is missing")
    }
}

/**
 * Installs the stock-quad layer into an unpacked APK. Returns false, touching nothing, for any
 * package/build outside the exact registry. Fails closed on retired renderer hooks and stale or
 * modified stock-quad files; removes retired Alpha-0 leftovers; writes are staged and rolled back together.
 */
internal fun installStockQuadResources(
    apkRoot: File,
    packageName: String,
    versionName: String,
    versionCode: String,
    helperBytes: ByteArray? = null,
    manifestBytes: ByteArray? = null,
): Boolean {
    // Dependencies bypass Morphe compatibility. Leave every other package/build untouched.
    if (packageName != STEAM_LINK_PACKAGE || !isStockQuadSteamLinkBuild(versionName, versionCode)) {
        return false
    }

    val sceneFile = File(apkRoot, "lib/arm64-v8a/libvrlink_scene.so")
    if (!sceneFile.isFile) {
        throw PatchException("Stock quad composition needs the Steam Link scene library")
    }
    retiredNativeProjectionHook(sceneFile.readBytes())?.let { retired ->
        throw PatchException(
            "Stock quad composition found retired renderer helper $retired; use a clean source APK",
        )
    }

    val libDir = sceneFile.parentFile!!
    val layerDir = File(apkRoot, "assets/openxr/1/api_layers/implicit.d")
    val helper = helperBytes ?: projectionModeResource(STOCK_QUAD_LIBRARY)
    val manifest = manifestBytes ?: projectionModeResource(STOCK_QUAD_MANIFEST)
    validateStockQuadPayload(helper, manifest)

    val files = listOf(
        File(libDir, STOCK_QUAD_LIBRARY) to helper,
        File(layerDir, STOCK_QUAD_MANIFEST) to manifest,
    )
    files.forEach { (target, expected) ->
        if (target.exists() && (!target.isFile || !target.readBytes().contentEquals(expected))) {
            throw PatchException("Stock quad composition found a stale or modified resource: ${target.path}")
        }
    }

    // Remove any retired projection layers before staging new resources, so a stale delete
    // cannot fail after a partial install.
    removeRetiredProjectionResources(libDir, layerDir)

    val missing = files.filterNot { (target, _) -> target.exists() }
    if (missing.isEmpty()) return true

    val staged = mutableListOf<Pair<File, File>>()
    val created = mutableListOf<File>()
    try {
        missing.forEach { (target, bytes) ->
            if (!target.parentFile.isDirectory && !target.parentFile.mkdirs()) {
                throw PatchException("Could not create stock-quad resource directory")
            }
            val temporary = File.createTempFile("gxr-stock-quad-", ".tmp", target.parentFile)
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

private val stockQuadResourcesPatch = rawResourcePatch {
    execute {
        if (packageMetadata.packageName != STEAM_LINK_PACKAGE ||
            !isStockQuadSteamLinkBuild(packageMetadata.versionName, packageMetadata.versionCode)) {
            return@execute
        }
        val sceneFile = get("lib/arm64-v8a/libvrlink_scene.so")
        val apkRoot = sceneFile.parentFile!!.parentFile!!.parentFile!!
        installStockQuadResources(
            apkRoot,
            packageMetadata.packageName,
            packageMetadata.versionName,
            packageMetadata.versionCode,
        )
    }
}

@Suppress("unused")
val stockQuadCompositionPatch = resourcePatch(
    name = "Stock quad composition",
    description = "Rebuilds Steam Link's projection layers as eye-aware stock-style quads in a separate OpenXR layer. " +
        buildLabel(COMPATIBILITIES_STEAM_LINK_HIGH_RESOLUTION),
    default = true,
) {
    category(PatchCategories.IMAGE_QUALITY)
    compatibleWith(*COMPATIBILITIES_STEAM_LINK_HIGH_RESOLUTION.toTypedArray())
    dependsOn(stockQuadResourcesPatch)

    finalize {
        // Dependencies bypass compatibility checks: stay inert on every other package/build.
        if (packageMetadata.packageName != STEAM_LINK_PACKAGE ||
            !isStockQuadSteamLinkBuild(packageMetadata.versionName, packageMetadata.versionCode)) {
            return@finalize
        }
        ensureIdsXml(get("res/values/ids.xml"))
        document("AndroidManifest.xml").use { document ->
            configurePermissionFreeProjectionMode(document, STOCK_QUAD_MODE)
        }
    }
}
